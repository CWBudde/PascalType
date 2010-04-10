unit PT_CharacterMap;

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
  Classes, Contnrs, SysUtils, PT_Types, PT_Tables;

type
  TPascalTypeFormat0CharacterMap = class(TCustomPascalTypeCharacterMap)
  private
    FLength       : Word; // This is the length in bytes of the subtable.
    FLanguage     : Word; // Please see 'Note on the language field in 'cmap' subtables' in this document.
    FGlyphIdArray : array [0..255] of Byte; // An array that maps character codes to glyph index values.
  protected
    class function GetFormat: Word; override;
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
  end;

  TPascalTypeFormat2CharacterMap = class(TCustomPascalTypeCharacterMap)
  private
    FLength       : Word; // This is the length in bytes of the subtable.
    FLanguage     : Word; // Please see 'Note on the language field in 'cmap' subtables' in this document.
  protected
    class function GetFormat: Word; override;
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
  end;

  TPascalTypeFormat4CharacterMap = class(TCustomPascalTypeCharacterMap)
  private
    FLength          : Word;              // This is the length in bytes of the subtable.
    FLanguage        : Word;              // Please see 'Note on the language field in 'cmap' subtables' in this document.
    FSegCountX2      : Word;              // 2 x segCount.
    FSearchRange     : Word;              // 2 x (2**floor(log2(segCount)))
    FEntrySelector   : Word;              // log2(searchRange / 2)
    FRangeShift      : Word;              // 2 x segCount - searchRange
    FEndCount        : array of Word;     // End characterCode for each segment, last=0xFFFF.
    FStartCount      : array of Word;     // Start character code for each segment.
    FIdDelta         : array of SmallInt; // Delta for all character codes in segment.
    FIdRangeOffset   : array of Word;     // Offsets into glyphIdArray or 0
    FGlyphIdArray    : array of Word;     // Glyph index array (arbitrary length)  protected
  protected
    class function GetFormat: Word; override;
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
  end;

  TPascalTypeFormat6CharacterMap = class(TCustomPascalTypeCharacterMap)
  private
    FLanguage     : Word; // Please see “Note on the language field in 'cmap' subtables“ in this document.
    FFirstCode    : Word; // First character code of subrange.
    FGlyphIdArray : array of Word;
    function GetEntryCount: Word; // Array of glyph index values for character codes in the range.
  protected
    class function GetFormat: Word; override;
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;

    property EntryCount: Word read GetEntryCount;
  end;

  TCharMapSegmentedCoverageRecord = packed record
    StartCharCode : Cardinal; // First character code in this group
    EndCharCode   : Cardinal; // Last character code in this group
    StartGlyphID  : Cardinal; // Glyph index corresponding to the starting character code
  end;

  TPascalTypeFormat12CharacterMap = class(TCustomPascalTypeCharacterMap)
  private
    FLanguage      : Cardinal; // Please see “Note on the language field in 'cmap' subtables“ in this document.
    FCoverageArray : array of TCharMapSegmentedCoverageRecord;
  protected
    class function GetFormat: Word; override;
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
  end;

implementation

uses
  Math, PT_ResourceStrings;

{ TPascalTypeFormat0CharacterMap }

class function TPascalTypeFormat0CharacterMap.GetFormat: Word;
begin
 Result := 0;
end;

procedure TPascalTypeFormat0CharacterMap.ResetToDefaults;
var
  GlyphIdIndex : Byte;
begin
 FLength   := 0;
 FLanguage := 0;
 for GlyphIdIndex := Low(Byte) to High(Byte)
  do FGlyphIdArray[GlyphIdIndex] := GlyphIdIndex;
end;

procedure TPascalTypeFormat0CharacterMap.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read length
   FLength := ReadSwappedWord(Stream);

   // read language
   FLanguage := ReadSwappedWord(Stream);

   Read(FGlyphIdArray[0], 256);
  end;
end;

procedure TPascalTypeFormat0CharacterMap.SaveToStream(Stream: TStream);
begin
 // write length
 WriteSwappedWord(Stream, FLength);

 // write language
 WriteSwappedWord(Stream, FLanguage);
end;

procedure TPascalTypeFormat0CharacterMap.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeFormat0CharacterMap(Dest) do
   begin
    FLength := Self.FLength;
    FLanguage := Self.FLanguage;
    FGlyphIdArray := Self.FGlyphIdArray;
   end
 else inherited;
end;

function TPascalTypeFormat0CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 if CharacterIndex in [0..255]
  then Result := FGlyphIdArray[CharacterIndex]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [CharacterIndex]);
end;


{ TPascalTypeFormat2CharacterMap }

class function TPascalTypeFormat2CharacterMap.GetFormat: Word;
begin
 Result := 2;
end;

procedure TPascalTypeFormat2CharacterMap.ResetToDefaults;
begin
 FLength   := 0;
 FLanguage := 0;
end;

procedure TPascalTypeFormat2CharacterMap.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeFormat2CharacterMap(Dest) do
   begin
    FLength := Self.FLength;
    FLanguage := Self.FLanguage;
   end
 else inherited;
end;

function TPascalTypeFormat2CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 Result := CharacterIndex;
end;

procedure TPascalTypeFormat2CharacterMap.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read length
   FLength := ReadSwappedWord(Stream);

   // read language
   FLanguage := ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeFormat2CharacterMap.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   // write length
   WriteSwappedWord(Stream, FLength);

   // write language
   WriteSwappedWord(Stream, FLanguage);
  end;
end;


{ TPascalTypeFormat4CharacterMap }

class function TPascalTypeFormat4CharacterMap.GetFormat: Word;
begin
 Result := 4;
end;

procedure TPascalTypeFormat4CharacterMap.ResetToDefaults;
begin
 FLength   := 0;
 FLanguage := 0;
end;

procedure TPascalTypeFormat4CharacterMap.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeFormat4CharacterMap(Dest) do
   begin
    FLength := Self.FLength;
    FLanguage := Self.FLanguage;
    FSegCountX2 := Self.FSegCountX2;
    FSearchRange := Self.FSearchRange;
    FEntrySelector := Self.FEntrySelector;
    FRangeShift := Self.FRangeShift;
    FEndCount := Self.FEndCount;
    FStartCount := Self.FStartCount;
    FIdDelta := Self.FIdDelta;
    FIdRangeOffset := Self.FIdRangeOffset;
    FGlyphIdArray := Self.FGlyphIdArray;
   end
 else inherited;
end;

function TPascalTypeFormat4CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
var
  SegmentIndex : Integer;
begin
 SegmentIndex := 0;
 while (SegmentIndex < Length(FEndCount)) do
  if (CharacterIndex <= FEndCount[SegmentIndex])
   then Break
   else Inc(SegmentIndex);

 if not (CharacterIndex >= FStartCount[SegmentIndex]) then
  begin
   // missing glyph
   Result := 0;
   Exit;
  end;

 if FIdRangeOffset[SegmentIndex] = 0
  then Result := (FIdDelta[SegmentIndex] + CharacterIndex) mod (1 shl 16)
  else
   begin
    Result := FIdRangeOffset[SegmentIndex] + (CharacterIndex - FStartCount[SegmentIndex]);

    // modulo operation
    Result := Result mod (1 shl 16);

    // check for missing character and add offset eventually
    if Result = 0
     then Result := FIdDelta[SegmentIndex] mod (1 shl 16)
   end;

 Result := Result mod (1 shl 16);

end;

procedure TPascalTypeFormat4CharacterMap.LoadFromStream(Stream: TStream);
var
  StartPos : Int64;
  SegIndex : Integer;
  {$IFDEF AmbigiousExceptions}
  Value16  : Word;
  {$ENDIF}
begin
 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if StartPos + 4 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read length
   FLength := ReadSwappedWord(Stream);

   // check (minimum) table size
   if StartPos + FLength - 4 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read language
   FLanguage := ReadSwappedWord(Stream);

   // read segCountX2
   FSegCountX2 := ReadSwappedWord(Stream);

   // read search range
   FSearchRange := ReadSwappedWord(Stream);

   // confirm search range has a valid value
   if FSearchRange <> 2 * (1 shl FloorLog2(FSegCountX2 div 2))
    then raise EPascalTypeError.Create(RCStrCharMapError + ': ' + 'wrong search range!');

   // read entry selector
   FEntrySelector := ReadSwappedWord(Stream);

   // confirm entry selector has a valid value
   if FEntrySelector <> Log2(FSearchRange * 0.5)
    then raise EPascalTypeError.Create(RCStrCharMapError + ': ' + 'wrong entry selector!');

   // read range shift
   FRangeShift := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   // confirm range shift has a valid value
   if FRangeShift <> FSegCountX2 - FSearchRange
    then raise EPascalTypeError.Create(RCStrCharMapError + ': ' + 'wrong range shift!');
   {$ENDIF}

   SetLength(FEndCount, FSegCountX2 div 2);
   SetLength(FStartCount, FSegCountX2 div 2);
   SetLength(FIdDelta, FSegCountX2 div 2);
   SetLength(FIdRangeOffset, FSegCountX2 div 2);

   // read end count
   for SegIndex := 0 to Length(FEndCount) - 1
    do FEndCount[SegIndex] := ReadSwappedWord(Stream);

   // confirm end count is valid
   if FEndCount[Length(FEndCount) - 1] <> $FFFF
    then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorEndCount, [FEndCount[Length(FEndCount) - 1]]);

   {$IFDEF AmbigiousExceptions}
   // read reserved
   Value16 := ReadSwappedWord(Stream);

   // confirm reserved value is valid
   if Value16 <> 0
    then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorReserved, [Value16]);
   {$ELSE}
   // skip reserved
   Seek(2, soFromCurrent);
   {$ENDIF}

   // read start count
   for SegIndex := 0 to Length(FStartCount) - 1 do
    begin
     FStartCount[SegIndex] := ReadSwappedWord(Stream);

     {$IFDEF AmbigiousExceptions}
     // confirm start count is valid
     if FStartCount[SegIndex] > FEndCount[SegIndex]
      then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorStartCount, [FStartCount[SegIndex]]);
     {$ENDIF}
    end;

   // read ID delta
   for SegIndex := 0 to Length(FIdDelta) - 1
    do FIdDelta[SegIndex] := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   // confirm ID delta is valid
   if FIdDelta[Length(FIdDelta) - 1] <> 1
    then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorIdDelta, [FIdDelta[Length(FIdDelta) - 1]]);
   {$ENDIF}

   // read ID range offset
   for SegIndex := 0 to Length(FIdRangeOffset) - 1
    do FIdRangeOffset[SegIndex] := ReadSwappedWord(Stream);

   SetLength(FGlyphIdArray, (FLength - 2 - (Position - StartPos)) div 2);

   // read glyph ID array
   for SegIndex := 0 to Length(FGlyphIdArray) - 1
    do FGlyphIdArray[SegIndex] := ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeFormat4CharacterMap.SaveToStream(Stream: TStream);
begin
 // write length
 WriteSwappedWord(Stream, FLength);

 // write language
 WriteSwappedWord(Stream, FLanguage);
end;


{ TPascalTypeFormat6CharacterMap }

procedure TPascalTypeFormat6CharacterMap.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeFormat6CharacterMap(Dest) do
   begin
    FLanguage     := Self.FLanguage;
    FFirstCode    := Self.FFirstCode;
    FGlyphIdArray := Self.FGlyphIdArray;
   end
 else inherited;
end;

function TPascalTypeFormat6CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 Result := 0;
 if CharacterIndex >= FFirstCode then
  if CharacterIndex < FFirstCode + Length(FGlyphIdArray)
   then Result := FGlyphIdArray[CharacterIndex - FFirstCode];
end;

function TPascalTypeFormat6CharacterMap.GetEntryCount: Word;
begin
 Result := Length(FGlyphIdArray);
end;

class function TPascalTypeFormat6CharacterMap.GetFormat: Word;
begin
 Result := 6
end;

procedure TPascalTypeFormat6CharacterMap.ResetToDefaults;
begin
 FLanguage := 0;
 FFirstCode := 0;
 SetLength(FGlyphIdArray, 0);
end;

procedure TPascalTypeFormat6CharacterMap.LoadFromStream(Stream: TStream);
var
  StartPos    : Int64;
  EntryIndex  : Integer;
  TableLength : Word;
begin
 inherited;

 with Stream do
  begin
   // remember start position
   StartPos := Position;

   // read table size
   TableLength := ReadSwappedWord(Stream);

   // read language
   FLanguage := ReadSwappedWord(Stream);

   // read first code
   FFirstCode := ReadSwappedWord(Stream);

   // read number of character codes in subrange
   SetLength(FGlyphIdArray, ReadSwappedWord(Stream));

   for EntryIndex := 0 to Length(FGlyphIdArray) - 1
    do FGlyphIdArray[EntryIndex] := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   if Position <> StartPos + TableLength
    then raise EPascalTypeError.Create('Character map error: Wrong length of subtable!');
   {$ENDIF}

   // seek end of table
   Position := StartPos + TableLength;
  end;
end;

procedure TPascalTypeFormat6CharacterMap.SaveToStream(Stream: TStream);
var
  EntryIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // write table size
   WriteSwappedWord(Stream, 8 + 2 * Length(FGlyphIdArray));

   // write language
   WriteSwappedWord(Stream, FLanguage);

   // write first code
   WriteSwappedWord(Stream, FFirstCode);

   // write number of character codes in subrange
   WriteSwappedWord(Stream, Length(FGlyphIdArray));

   // write glyph indices
   for EntryIndex := 0 to Length(FGlyphIdArray) - 1
    do WriteSwappedWord(Stream, FGlyphIdArray[EntryIndex]);
  end;
end;


{ TPascalTypeFormat12CharacterMap }

procedure TPascalTypeFormat12CharacterMap.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeFormat12CharacterMap(Dest) do
   begin
    FLanguage      := Self.FLanguage;
    FCoverageArray := Self.FCoverageArray;
   end
 else inherited;
end;

function TPascalTypeFormat12CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
var
  GroupIndex : Integer;
begin
 Result := 0;
 GroupIndex := 0;

 while GroupIndex < Length(FCoverageArray) do
  with FCoverageArray[GroupIndex] do
   begin
    if CharacterIndex >= Integer(StartCharCode) then
     begin
      if CharacterIndex < Integer(EndCharCode)
       then Result := Integer(StartGlyphID) + (CharacterIndex - Integer(StartCharCode));

      Exit;
     end;
    Inc(GroupIndex);
   end;
end;

class function TPascalTypeFormat12CharacterMap.GetFormat: Word;
begin
 Result := 12;
end;

procedure TPascalTypeFormat12CharacterMap.ResetToDefaults;
begin
 FLanguage := 0;
 SetLength(FCoverageArray, 0);
end;

procedure TPascalTypeFormat12CharacterMap.LoadFromStream(Stream: TStream);
var
  StartPos    : Int64;
  TableLength : Cardinal;
  GroupIndex  : Cardinal;
begin
 with Stream do
  begin
   StartPos := Position;

   {$IFDEF AmbigiousExceptions}
   if ReadSwappedWord(Stream) <> 0
    then raise EPascalTypeError.Create(RCStrReservedValueError);
   {$ELSE}
   Seek(2, soFromCurrent);
   {$ENDIF}

   // read table length
   TableLength := ReadSwappedCardinal(Stream);

   // read language
   FLanguage := ReadSwappedCardinal(Stream);

   // read group count
   SetLength(FCoverageArray, ReadSwappedCardinal(Stream));

   for GroupIndex := 0 to Length(FCoverageArray) - 1 do
    with FCoverageArray[GroupIndex] do
     begin
      // read start character code
      StartCharCode := ReadSwappedCardinal(Stream);

      // read end character code
      EndCharCode := ReadSwappedCardinal(Stream);

      // read start glyph ID
      StartGlyphID := ReadSwappedCardinal(Stream);
     end;

   // seek end of this table
   Position := StartPos + TableLength - 2;
  end;
end;

procedure TPascalTypeFormat12CharacterMap.SaveToStream(Stream: TStream);
begin
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;

initialization
  RegisterPascalTypeCharacterMaps([TPascalTypeFormat0CharacterMap,
    TPascalTypeFormat2CharacterMap, TPascalTypeFormat4CharacterMap,
    TPascalTypeFormat6CharacterMap, TPascalTypeFormat12CharacterMap]);

end.
