unit PT_TablesPostscript;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Version: MPL 1.1 or LGPL 2.1 with linking exception                       //
//                                                                            //
//  The contents of this file are subject to the Mozilla Public License       //
//  Version 1.1 (the "License"); you may not use this file except in          //
//  compliance with the License. You may obtain a copy of the License at      //
//  http://www.mozilla.org/MPL/                                               //
//                                                                            //
//  Software distributed under the License is distributed on an "AS IS"       //
//  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the   //
//  License for the specific language governing rights and limitations under  //
//  the License.                                                              //
//                                                                            //
//  Alternatively, the contents of this file may be used under the terms of   //
//  the Free Pascal modified version of the GNU Lesser General Public         //
//  License Version 2.1 (the "FPC modified LGPL License"), in which case the  //
//  provisions of this license are applicable instead of those above.         //
//  Please see the file LICENSE.txt for additional information concerning     //
//  this license.                                                             //
//                                                                            //
//  The code is part of the PascalType Project                                //
//                                                                            //
//  The initial developer of this code is Christian-W. Budde                  //
//                                                                            //
//  Portions created by Christian-W. Budde are Copyright (C) 2010             //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

{$I PT_Compiler.inc}

uses
  Classes, Contnrs, SysUtils, PT_Types, PT_Classes, PT_Tables;

type
  TPascalTypePostscriptDictDataTable = class(TCustomPascalTypeTable)
  private
    FData : array of Integer;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TCustomPascalTypePostscriptIndexTable = class(TCustomPascalTypeTable)
  protected
    procedure ReadData(Index: Integer; Stream: TStream); virtual; abstract;
    procedure WriteData(Index: Integer; Stream: TStream); virtual; abstract;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TPascalTypePostscriptNameIndexTable = class(TCustomPascalTypePostscriptIndexTable)
  private
    FFontNames : array of string;
    function GetFontName(Index: Integer): string;
    function GetFontNameCount: Integer;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;

    procedure ReadData(Index: Integer; Stream: TStream); override;
    procedure WriteData(Index: Integer; Stream: TStream); override;

    property FontName[Index: Integer]: string read GetFontName;
    property FontNameCount: Integer read GetFontNameCount;
  end;

  TCustomPascalTypePostscriptDictOperator = class(TCustomPascalTypeTable)
  protected
    class function GetEncoding: Byte; virtual; abstract;
  public
    property Encoding: Byte read GetEncoding;
  end;

  TPascalTypePostscriptVersionOperator = class(TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetEncoding: Byte; override;
  end;

  TPascalTypePostscriptNoticeOperator = class(TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetEncoding: Byte; override;
  end;

  TPascalTypePostscriptTopDictIndexTable = class(TCustomPascalTypePostscriptIndexTable)
  private
    FDict : array of TPascalTypePostscriptDictDataTable;
    procedure ClearDict;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;

    procedure ReadData(Index: Integer; Stream: TStream); override;
    procedure WriteData(Index: Integer; Stream: TStream); override;
  public
    destructor Destroy; override;
  end;

  TPascalTypeCompactFontFormatTable = class(TCustomPascalTypeNamedTable)
  private
    FVersionMajor : Byte; // Format major version (starting at 1)
    FVersionMinor : Byte; // Format minor version (starting at 0)
    FOffSize      : Byte; // Absolute offset(0) size
    FNameTable    : TPascalTypePostscriptNameIndexTable;
    FTopDictTable : TPascalTypePostscriptTopDictIndexTable;
    procedure SetVersionMajor(const Value: Byte);
    procedure SetVersionMinor(const Value: Byte);
    function GetFontName: string;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
    procedure VersionChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property VersionMajor: Byte read FVersionMajor write SetVersionMajor;
    property VersionMinor: Byte read FVersionMinor write SetVersionMinor;
    property FontName: string read GetFontName;
  end;

  TVertOriginYMetrics = packed record
    GlyphIndex  : Word;     // Glyph index.
    VertOriginY : SmallInt; // Y coordinate, in the font's design coordinate system, of the vertical origin of glyph with index glyphIndex.
  end;

  TPascalTypeVerticalOriginTable = class(TCustomPascalTypeNamedTable)
  private
    FMajorVersion       : Word;     // Major version (starting at 1). Set to 1.
    FMinorVersion       : Word;     // Minor version (starting at 0). Set to 0.
    FDefaultVertOriginY : SmallInt; // The y coordinate of a glyph's vertical origin, in the font's design coordinate system, to be used if no entry is present for the glyph in the vertOriginYMetrics array.
    FVertOriginYMetrics : array of TVertOriginYMetrics;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

implementation

uses
  PT_ResourceStrings;

resourcestring
  RCStrCFFIndexFirstOffsetError = 'CFF Index: First Offset Error (%d)';


{ TPascalTypePostscriptVersionOperator }

class function TPascalTypePostscriptVersionOperator.GetEncoding: Byte;
begin
 Result := 0;
end;


{ TPascalTypePostscriptNoticeOperator }

class function TPascalTypePostscriptNoticeOperator.GetEncoding: Byte;
begin
 Result := 1;
end;


{ TPascalTypePostscriptDictDataTable }

procedure TPascalTypePostscriptDictDataTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptDictDataTable(Dest) do
   begin
    FData := Self.FData;
   end
 else inherited;
end;

procedure TPascalTypePostscriptDictDataTable.ResetToDefaults;
begin
 inherited;
 SetLength(FData, 0);
end;

procedure TPascalTypePostscriptDictDataTable.LoadFromStream(Stream: TStream);
var
  Token  : Byte;
  Data   : array [0..3] of Byte;
  Value  : Integer;
  Nibble : Byte;
  str    : string;
begin
 inherited;

 with Stream do
  while Position < Size do
   begin
    // read token
    Read(Token, 1);

    // add element
    SetLength(FData, Length(FData) + 1);

    // read element data
    case Token of
            0 : ; // Version
            1 : ; // Notice
            2 : ; // FullName
            3 : ; // FamilyName
            4 : ; // Weight
            5 : ; // FontBBox
            6 : ; // BlueValues
            7 : ; // OtherBlues
            8 : ; // FamilyBlues
            9 : ; // FamilyOtherBlues
           10 : ; // StdHW
           12 : begin
                 // escape
                 Read(Data[0], 1);
                end;
           11 : ; // StdVW
           13 : ; // UniqueID
           14 : ; // XUID
           15 : ; // charset
           16 : ; // Encoding
           17 : ; // CharStrings
           18 : ; // Private
           19 : ; // Subrs
           20 : ; // defaultWidthX
           21 : ; // nominalWidthX
           28 : begin
                 Read(Data[0], 2);
                 Value := (Data[0] shl 8) or Data[1];
                end;
           29 : begin
                 Read(Data[0], 4);
                 Value := (Data[0] shl 24) or (Data[1] shl 16) or
                   (Data[2] shl 8) or Data[3];
                end;
           30 : begin
                 // BCD (real number)

                 // reset string
                 str := '';

                 repeat
                  // read two nibbles
                  Read(Data[0], 1);

                  // get first nibble
                  Nibble := Data[0] shr 4;

                  case Nibble of
                   0..9 : str := str + IntToStr(Nibble);
                     $A : str := str + '.';
                     $B : str := str + 'E';
                     $C : str := str + 'E-';
                     $E : str := str + '-';
                     $F : Break;
                   else raise EPascalTypeError.Create('CFF Error: Wrong Nibble found!');
                  end;

                  // get second nibble
                  Nibble := Data[0] and $F;

                  case Nibble of
                   0..9 : str := str + IntToStr(Nibble);
                     $A : str := str + '.';
                     $B : str := str + 'E';
                     $C : str := str + 'E-';
                     $E : str := str + '-';
                     $F : Break;
                   else raise EPascalTypeError.Create('CFF Error: Wrong Nibble found!');
                  end;

                 until (Nibble = $F);
                end;
      32..246 : FData[Length(FData) - 1] := Token - 139;
     247..250 : begin
                 Read(Data[0], 1);
                 Value := (Token - 247) shl 8 + Data[0] + 108;
                end;
     251..254 : begin
                 Read(Data[0], 1);
                 Value := -(Token - 251) shl 8 - Data[0] - 108
                end;
     else raise EPascalTypeError.Create('CFF Error: Wrong Token found!');
    end;

    // assign value
    FData[Length(FData) - 1] := Value;
   end;
end;

procedure TPascalTypePostscriptDictDataTable.SaveToStream(Stream: TStream);
begin
 inherited;

 with Stream do
  begin

  end;
end;


{ TCustomPascalTypePostscriptIndexTable }

procedure TCustomPascalTypePostscriptIndexTable.LoadFromStream(Stream: TStream);
var
  Offsets  : array of Integer; // Offset array (from byte preceding object data)
  OffIndex : Integer;
  Offset   : array [0..3] of Byte;
  OffStart : Int64;
  MS       : TMemoryStream;
  Value16  : Word;
  OffSize  : Byte;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read count
   Value16 := ReadSwappedWord(Stream);

   // check if index file is empty
   if Value16 = 0
    then Exit;

   // set length of offsets
   SetLength(Offsets, Value16 + 1);

   // read offset size
   Read(OffSize, 1);

   for OffIndex := 0 to Length(Offsets) - 1 do
    case OffSize of
     1 : Read(Offsets[OffIndex], 1);
     2 : begin
          Read(Offset[0], 2);
          Offsets[OffIndex] := (Offset[0] shl 8) + Offset[1];
         end;
     3 : begin
          Read(Offset[0], 3);
          Offsets[OffIndex] := (Offset[0] shl 16) + (Offset[1] shl 8) + Offset[2];
         end;
     4 : begin
          Read(Offset[0], 4);
          Offsets[OffIndex] := (Offset[0] shl 24) + (Offset[1] shl 16) + (Offset[2] shl 8) + Offset[3];
         end;
    end;

   OffStart := Position - 1;

   if Offsets[0] <> 1
    then raise Exception.CreateFmt(RCStrCFFIndexFirstOffsetError, [Offsets[0]]);

   // check (minimum) table size
   if Position + Offsets[Length(Offsets) - 1] > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   MS := TMemoryStream.Create;
   try
    for OffIndex := 0 to Length(Offsets) - 2 do
     begin
      // clear memory stream
      MS.Clear;

      // locate data position in stream
      Stream.Position := OffStart + Offsets[OffIndex];

      // copy data to local stream
      MS.CopyFrom(Stream, Offsets[OffIndex + 1] - Offsets[OffIndex]);

      // reset stream position
      MS.Seek(0, soBeginning);

      // read data from memory stream
      ReadData(OffIndex, MS);
     end;
   finally
    FreeAndNil(MS);
   end;

  end;
end;

procedure TCustomPascalTypePostscriptIndexTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TPascalTypePostscriptNameIndexTable }

procedure TPascalTypePostscriptNameIndexTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptNameIndexTable(Dest) do
   begin
    FFontNames := Self.FFontNames;
   end
  else inherited;
end;

procedure TPascalTypePostscriptNameIndexTable.ResetToDefaults;
begin
 inherited;
 SetLength(FFontNames, 0);
end;

function TPascalTypePostscriptNameIndexTable.GetFontName(
  Index: Integer): string;
begin
 if (Index >= 0) and (Index < Length(FFontNames))
  then Result := FFontNames[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypePostscriptNameIndexTable.GetFontNameCount: Integer;
begin
 Result := Length(FFontNames);
end;

procedure TPascalTypePostscriptNameIndexTable.ReadData(Index: Integer;
  Stream: TStream);
begin
 // eventually extend font name array
 if Index >= Length(FFontNames)
  then SetLength(FFontNames, Index + 1);

 // set length of string
 SetLength(FFontNames[Index], Stream.Size);

 // read actual string
 Stream.Read(FFontNames[Index][1], Stream.Size);
end;

procedure TPascalTypePostscriptNameIndexTable.WriteData(Index: Integer;
  Stream: TStream);
begin
 // check if index exceeds the list
 if (Index < 0) or (Index >= Length(FFontNames))
  then raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);

 // read actual string
 Stream.Write(FFontNames[Index][1], Length(FFontNames[Index]));
end;


{ TPascalTypePostscriptTopDictIndexTable }

destructor TPascalTypePostscriptTopDictIndexTable.Destroy;
begin
 ClearDict;
 inherited;
end;

procedure TPascalTypePostscriptTopDictIndexTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptTopDictIndexTable(Dest) do
   begin

   end
 else inherited;
end;

procedure TPascalTypePostscriptTopDictIndexTable.ResetToDefaults;
begin
 inherited;
 ClearDict;
 SetLength(FDict, 0);
end;

procedure TPascalTypePostscriptTopDictIndexTable.ClearDict;
var
  DictIndex : Integer;
begin
 for DictIndex := 0 to Length(FDict) - 1
  do FreeAndNil(FDict[DictIndex]);
end;

procedure TPascalTypePostscriptTopDictIndexTable.ReadData(Index: Integer;
  Stream: TStream);
begin
 // eventually extend font name array
 if Index >= Length(FDict) then
  begin
   SetLength(FDict, Index + 1);
   FDict[Length(FDict) - 1] := TPascalTypePostscriptDictDataTable.Create;
  end;

 // reset dict to default
 FDict[Length(FDict) - 1].ResetToDefaults;

 // load dict from stream
 FDict[Length(FDict) - 1].LoadFromStream(Stream);
end;

procedure TPascalTypePostscriptTopDictIndexTable.WriteData(Index: Integer;
  Stream: TStream);
begin

end;


{ TPascalTypeCompactFontFormatTable }

constructor TPascalTypeCompactFontFormatTable.Create(
  Storage: IPascalTypeStorageTable);
begin
 FNameTable := TPascalTypePostscriptNameIndexTable.Create;
 FTopDictTable := TPascalTypePostscriptTopDictIndexTable.Create;
 inherited;
end;

destructor TPascalTypeCompactFontFormatTable.Destroy;
begin
 FreeAndNil(FNameTable);
 FreeAndNil(FTopDictTable);
 inherited;
end;

procedure TPascalTypeCompactFontFormatTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeCompactFontFormatTable(Dest) do
   begin
    FVersionMajor := Self.FVersionMajor;
    FVersionMinor := Self.FVersionMinor;
    FOffSize      := Self.FOffSize;
    FNameTable.Assign(Self.FNameTable);
    FTopDictTable.AssignTo(Self.FTopDictTable);
   end
  else inherited;
end;

function TPascalTypeCompactFontFormatTable.GetFontName: string;
begin
 if FNameTable.FontNameCount > 0
  then Result := FNameTable.FontName[0]
  else Result := '';
end;

class function TPascalTypeCompactFontFormatTable.GetTableType: TTableType;
begin
 Result := 'CFF ';
end;

procedure TPascalTypeCompactFontFormatTable.ResetToDefaults;
begin
 inherited;
 FVersionMajor := 0;
 FVersionMinor := 0;
 FOffSize      := 0;
 FNameTable.ResetToDefaults;
 FTopDictTable.ResetToDefaults;
end;

procedure TPascalTypeCompactFontFormatTable.LoadFromStream(Stream: TStream);
var
  StartPos   : Int64;
  HeaderSize : Byte;
begin
 inherited;

 with Stream do
  begin
   // remember stream start position
   StartPos := Position;

   // read major version number
   Read(FVersionMajor, 1);

   // check major version
   if FVersionMajor > 1
    then raise EPascalTypeError.Create(RCStrUnknownVersion);

   // read minor version number
   Read(FVersionMinor, 1);

   // read header size
   Read(HeaderSize, 1);

   // read offset size
   Read(FOffSize, 1);

   // go to name table position
   Position := StartPos + HeaderSize;

   // read name table from stream
   FNameTable.LoadFromStream(Stream);

   // read top dict table from stream
   FTopDictTable.LoadFromStream(Stream);
  end;
end;

procedure TPascalTypeCompactFontFormatTable.SaveToStream(Stream: TStream);
var
  HeaderSize : Byte;
begin
 inherited;

 with Stream do
  begin
   // read major version number
   Write(FVersionMajor, 1);

   // read minor version number
   Write(FVersionMinor, 1);

   // read header size
   HeaderSize := 4;
   Write(HeaderSize, 1);

   // read offset size
   Write(FOffSize, 1);

   raise Exception.Create(RCStrNotImplemented);
  end;
end;

procedure TPascalTypeCompactFontFormatTable.SetVersionMajor(const Value: Byte);
begin
 if FVersionMajor <> Value then
  begin
   FVersionMajor := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeCompactFontFormatTable.SetVersionMinor(const Value: Byte);
begin
 if FVersionMinor <> Value then
  begin
   FVersionMinor := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeCompactFontFormatTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeVerticalOriginTable }

procedure TPascalTypeVerticalOriginTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeVerticalOriginTable(Dest) do
   begin
    FMajorVersion       := Self.FMajorVersion;
    FMinorVersion       := Self.FMinorVersion;
    FDefaultVertOriginY := Self.FDefaultVertOriginY;
    FVertOriginYMetrics := Self.FVertOriginYMetrics;
   end
  else inherited;
end;

class function TPascalTypeVerticalOriginTable.GetTableType: TTableType;
begin
 Result := 'VORG';
end;

procedure TPascalTypeVerticalOriginTable.ResetToDefaults;
begin
 inherited;
 FMajorVersion       := 1;
 FMinorVersion       := 0;
 FDefaultVertOriginY := 0;
 SetLength(FVertOriginYMetrics, 0);
end;

procedure TPascalTypeVerticalOriginTable.LoadFromStream(Stream: TStream);
var
  Index: Integer;
begin
 inherited;

 with Stream do
  begin
   // read major version
   FMajorVersion := ReadSwappedWord(Stream);

   // read minor version
   FMinorVersion := ReadSwappedWord(Stream);

   // read default vertical origin
   FDefaultVertOriginY := ReadSwappedWord(Stream);

   // read vertical origin y-metrics
   SetLength(FVertOriginYMetrics, ReadSwappedWord(Stream));

   for Index := 0 to Length(FVertOriginYMetrics) - 1 do
    with FVertOriginYMetrics[Index] do
     begin
      // read glyph index
      GlyphIndex := ReadSwappedWord(Stream);

      // read vertical y origin
      VertOriginY := ReadSwappedWord(Stream);
     end;
  end;
end;

procedure TPascalTypeVerticalOriginTable.SaveToStream(Stream: TStream);
var
  Index : Integer;
begin
 inherited;

 with Stream do
  begin
   // write major version
   WriteSwappedWord(Stream, FMajorVersion);

   // write minor version
   WriteSwappedWord(Stream, FMinorVersion);

   // write default vertical origin
   WriteSwappedWord(Stream, FDefaultVertOriginY);

   // write vertical origin y-metrics
   WriteSwappedWord(Stream, Length(FVertOriginYMetrics));

   for Index := 0 to Length(FVertOriginYMetrics) - 1 do
    with FVertOriginYMetrics[Index] do
     begin
      // write glyph index
      WriteSwappedWord(Stream, GlyphIndex);

      // write vertical y origin
      WriteSwappedWord(Stream, VertOriginY);
     end;
  end;
end;


initialization
  RegisterPascalTypeTables([TPascalTypeCompactFontFormatTable,
    TPascalTypeVerticalOriginTable]);

end.
