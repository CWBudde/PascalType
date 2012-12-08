unit PT_TableDirectory;

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
  Classes, Contnrs, SysUtils, PT_Types, PT_Classes;

type
  // TrueType Table Directory Entry type
  TDirectoryTableEntry = packed record
    TableType : TTableType;  // Table type
    CheckSum  : Cardinal;    // Table checksum
    Offset    : Cardinal;    // Table file offset
    Length    : Cardinal;    // Table length
  end;

  TPascalTypeDirectoryTableEntry = class(TCustomPascalTypeTable)
  private
    FDirectoryTableEntry : TDirectoryTableEntry;
    procedure SetCheckSum(const Value: Cardinal);
    procedure SetLength(const Value: Cardinal);
    procedure SetOffset(const Value: Cardinal);
    procedure SetTableType(const Value: TTableType);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ChecksumChanged; virtual;
    procedure LengthChanged; virtual;
    procedure OffsetChanged; virtual;
    procedure TableTypeChanged; virtual;
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property DirectoryTableEntry: TDirectoryTableEntry read FDirectoryTableEntry;

    property TableType: TTableType read FDirectoryTableEntry.TableType write SetTableType;
    property CheckSum: Cardinal read FDirectoryTableEntry.CheckSum write SetCheckSum;
    property Offset: Cardinal read FDirectoryTableEntry.Offset write SetOffset;
    property Length: Cardinal read FDirectoryTableEntry.Length write SetLength;
  end;

  TPascalTypeDirectoryTableList = class(TList)
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
    function GetItem(Index: Integer): TPascalTypeDirectoryTableEntry;
    procedure SetItem(Index: Integer; DirectoryTable: TPascalTypeDirectoryTableEntry);
  public
    constructor Create;

    function Add(DirectoryTable: TPascalTypeDirectoryTableEntry): Integer;
    function Extract(Item: TPascalTypeDirectoryTableEntry): TPascalTypeDirectoryTableEntry;
    function Remove(DirectoryTable: TPascalTypeDirectoryTableEntry): Integer;
    function IndexOf(DirectoryTable: TPascalTypeDirectoryTableEntry): Integer;
    procedure Insert(Index: Integer; DirectoryTable: TPascalTypeDirectoryTableEntry);
    function First: TPascalTypeDirectoryTableEntry;
    function FindByTableType(TableType: TTableType): TPascalTypeDirectoryTableEntry;
    function Last: TPascalTypeDirectoryTableEntry;
    procedure SortByOffset;

    property Items[Index: Integer]: TPascalTypeDirectoryTableEntry read GetItem write SetItem; default;
  end;

  // TrueType Table Directory type
  TPascalTypeDirectoryTable = class(TCustomPascalTypeTable)
  private
    FVersion             : Cardinal;  // A tag to indicate the OFA scaler (should be $10000)

    // required tables
    FHeaderTable         : TPascalTypeDirectoryTableEntry;
    FMaxProfileDataEntry : TPascalTypeDirectoryTableEntry;
    FHorHeaderDataEntry  : TPascalTypeDirectoryTableEntry;
    FHorMetricsDataEntry : TPascalTypeDirectoryTableEntry;
    FCharMapDataEntry    : TPascalTypeDirectoryTableEntry;
    FNameDataEntry       : TPascalTypeDirectoryTableEntry;
    FPostscriptDataEntry : TPascalTypeDirectoryTableEntry;
    FLocationDataEntry   : TPascalTypeDirectoryTableEntry;
    FGlyphDataEntry      : TPascalTypeDirectoryTableEntry;
    FOS2TableEntry       : TPascalTypeDirectoryTableEntry;

    // table list
    FTableList           : TPascalTypeDirectoryTableList;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    procedure ClearAndBuildRequiredEntries;
    function AddTableEntry(TableType: TTableType): TPascalTypeDirectoryTableEntry;

    property Version: Cardinal read FVersion;
    property TableList: TPascalTypeDirectoryTableList read FTableList;
    property HeaderTable: TPascalTypeDirectoryTableEntry read FHeaderTable;
    property MaximumProfileDataEntry: TPascalTypeDirectoryTableEntry read FMaxProfileDataEntry;
    property HorizontalHeaderDataEntry: TPascalTypeDirectoryTableEntry read FHorHeaderDataEntry;
    property HorizontalMetricsDataEntry: TPascalTypeDirectoryTableEntry read FHorMetricsDataEntry;
    property CharacterMapDataEntry: TPascalTypeDirectoryTableEntry read FCharMapDataEntry;
    property NameDataEntry: TPascalTypeDirectoryTableEntry read FNameDataEntry;
    property PostscriptDataEntry: TPascalTypeDirectoryTableEntry read FPostscriptDataEntry;
    property LocationDataEntry: TPascalTypeDirectoryTableEntry read FLocationDataEntry;
    property GlyphDataEntry: TPascalTypeDirectoryTableEntry read FGlyphDataEntry;
    property OS2TableEntry: TPascalTypeDirectoryTableEntry read FOS2TableEntry;
  end;

implementation

uses
  Math, PT_Math, PT_ResourceStrings;

function SortTableEntryByOffset(Item1, Item2: Pointer): Integer;
begin
 Result := Integer(TPascalTypeDirectoryTableEntry(Item1).Offset >
   TPascalTypeDirectoryTableEntry(Item2).Offset);
end;


{ TPascalTypeDirectoryTableEntry }

procedure TPascalTypeDirectoryTableEntry.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeDirectoryTableEntry then
  with TPascalTypeDirectoryTableEntry(Dest) do
   begin
    FDirectoryTableEntry := Self.FDirectoryTableEntry;
   end else inherited;
end;

procedure TPascalTypeDirectoryTableEntry.LoadFromStream(Stream: TStream);
var
  Value : Cardinal;
begin
 with Stream, FDirectoryTableEntry do
  begin
   if Position + SizeOf(TDirectoryTableEntry) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read table type
   Read(TableType, SizeOf(TTableType));

   // read checksum
   Read(Value, SizeOf(LongInt));
   CheckSum := Swap32(Value);

   // read offset
   Read(Value, SizeOf(LongInt));
   Offset := Swap32(Value);

   // read length
   Read(Value, SizeOf(LongInt));
   Length := Swap32(Value);
  end;
end;

procedure TPascalTypeDirectoryTableEntry.SaveToStream(Stream: TStream);
var
  Value : Cardinal;
begin
 with Stream do
  begin
   if Position + SizeOf(TDirectoryTableEntry) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   with FDirectoryTableEntry do
    begin
     // read table type
     Write(TableType, SizeOf(TTableType));

     // write checksum
     Value := Swap32(CheckSum);
     Write(Value, SizeOf(LongInt));

     // write offset
     Value := Swap32(Offset);
     Write(Value, SizeOf(LongInt));

     // write length
     Value := Swap32(Length);
     Write(Value, SizeOf(LongInt));
    end;
  end;
end;

procedure TPascalTypeDirectoryTableEntry.ResetToDefaults;
begin
 with FDirectoryTableEntry do
  begin
   TableType := 0;
   CheckSum  := 0;
   Offset    := 0;
   Length    := 0;
  end;
end;

procedure TPascalTypeDirectoryTableEntry.SetCheckSum(const Value: Cardinal);
begin
 if FDirectoryTableEntry.CheckSum <> Value then
  begin
   FDirectoryTableEntry.CheckSum := Value;
   ChecksumChanged;
  end;
end;

procedure TPascalTypeDirectoryTableEntry.SetLength(const Value: Cardinal);
begin
 if FDirectoryTableEntry.Length <> Value then
  begin
   FDirectoryTableEntry.Length := Value;
   LengthChanged;
  end;
end;

procedure TPascalTypeDirectoryTableEntry.SetOffset(const Value: Cardinal);
begin
 if FDirectoryTableEntry.Offset <> Value then
  begin
   FDirectoryTableEntry.Offset := Value;
   OffsetChanged;
  end;
end;

procedure TPascalTypeDirectoryTableEntry.SetTableType(const Value: TTableType);
begin
 if FDirectoryTableEntry.TableType <> Value then
  begin
   FDirectoryTableEntry.TableType := Value;
   TableTypeChanged;
  end;
end;

procedure TPascalTypeDirectoryTableEntry.ChecksumChanged;
begin
 Changed;
end;

procedure TPascalTypeDirectoryTableEntry.LengthChanged;
begin
 Changed;
end;

procedure TPascalTypeDirectoryTableEntry.OffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeDirectoryTableEntry.TableTypeChanged;
begin
 Changed;
end;


{ TPascalTypeDirectoryTableList }

constructor TPascalTypeDirectoryTableList.Create;
begin
 inherited Create;
end;

function TPascalTypeDirectoryTableList.Add(DirectoryTable: TPascalTypeDirectoryTableEntry): Integer;
begin
 Result := inherited Add(DirectoryTable);
end;

function TPascalTypeDirectoryTableList.Extract(Item: TPascalTypeDirectoryTableEntry): TPascalTypeDirectoryTableEntry;
begin
 Result := TPascalTypeDirectoryTableEntry(inherited Extract(Item));
end;

function TPascalTypeDirectoryTableList.FindByTableType(
  TableType: TTableType): TPascalTypeDirectoryTableEntry;
var
  Index : Integer;
begin
 Result := nil;
 for Index := 0 to Count - 1 do
  if Items[Index].TableType = TableType then
   begin
    Result := Items[Index];
    Exit;
   end;
end;

function TPascalTypeDirectoryTableList.First: TPascalTypeDirectoryTableEntry;
begin
 Result := TPascalTypeDirectoryTableEntry(inherited First);
end;

function TPascalTypeDirectoryTableList.GetItem(Index: Integer): TPascalTypeDirectoryTableEntry;
begin
 Result := inherited Items[Index];
end;

function TPascalTypeDirectoryTableList.IndexOf(DirectoryTable: TPascalTypeDirectoryTableEntry): Integer;
begin
 Result := inherited IndexOf(DirectoryTable);
end;

procedure TPascalTypeDirectoryTableList.Insert(Index: Integer; DirectoryTable: TPascalTypeDirectoryTableEntry);
begin
 inherited Insert(Index, DirectoryTable);
end;

function TPascalTypeDirectoryTableList.Last: TPascalTypeDirectoryTableEntry;
begin
 Result := TPascalTypeDirectoryTableEntry(inherited Last);
end;

procedure TPascalTypeDirectoryTableList.Notify(Ptr: Pointer; Action: TListNotification);
begin
 if Action = lnDeleted
  then TPascalTypeDirectoryTableEntry(Ptr).Free;
 inherited Notify(Ptr, Action);
end;

function TPascalTypeDirectoryTableList.Remove(DirectoryTable: TPascalTypeDirectoryTableEntry): Integer;
begin
 Result := inherited Remove(DirectoryTable);
end;

procedure TPascalTypeDirectoryTableList.SetItem(Index: Integer; DirectoryTable: TPascalTypeDirectoryTableEntry);
begin
 inherited Items[Index] := DirectoryTable;
end;

procedure TPascalTypeDirectoryTableList.SortByOffset;
begin
 Sort(SortTableEntryByOffset);
end;


{ TPascalTypeDirectoryTable }

constructor TPascalTypeDirectoryTable.Create;
begin
 FTableList := TPascalTypeDirectoryTableList.Create;
 inherited;
end;

destructor TPascalTypeDirectoryTable.Destroy;
begin
 if Assigned(FHeaderTable) then FreeAndNil(FHeaderTable);
 if Assigned(FMaxProfileDataEntry) then FreeAndNil(FMaxProfileDataEntry);
 if Assigned(FHorHeaderDataEntry) then FreeAndNil(FHorHeaderDataEntry);
 if Assigned(FHorMetricsDataEntry) then FreeAndNil(FHorMetricsDataEntry);
 if Assigned(FCharMapDataEntry) then FreeAndNil(FCharMapDataEntry);
 if Assigned(FNameDataEntry) then FreeAndNil(FNameDataEntry);
 if Assigned(FPostscriptDataEntry) then FreeAndNil(FPostscriptDataEntry);
 if Assigned(FLocationDataEntry) then FreeAndNil(FLocationDataEntry);
 if Assigned(FGlyphDataEntry) then FreeAndNil(FGlyphDataEntry);
 if Assigned(FOS2TableEntry) then FreeAndNil(FOS2TableEntry);
 FreeAndNil(FTableList);
 inherited;
end;

function TPascalTypeDirectoryTable.AddTableEntry(
  TableType: TTableType): TPascalTypeDirectoryTableEntry;
begin
 Result := TPascalTypeDirectoryTableEntry.Create;
 Result.TableType := TableType;
 FTableList.Add(Result);
end;

procedure TPascalTypeDirectoryTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeDirectoryTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FTableList.Assign(Self.FTableList);
   end else inherited;
end;

procedure TPascalTypeDirectoryTable.ResetToDefaults;
begin
 inherited;
 FVersion       := $10000;

 // clear fixed table entries
 if Assigned(FHeaderTable)
  then FreeAndNil(FHeaderTable);

 if Assigned(FMaxProfileDataEntry)
  then FreeAndNil(FMaxProfileDataEntry);

 if Assigned(FHorHeaderDataEntry)
  then FreeAndNil(FHorHeaderDataEntry );

 if Assigned(FHorMetricsDataEntry)
  then FreeAndNil(FHorMetricsDataEntry);

 if Assigned(FCharMapDataEntry)
  then FreeAndNil(FCharMapDataEntry);

 if Assigned(FNameDataEntry)
  then FreeAndNil(FNameDataEntry);

 if Assigned(FPostscriptDataEntry)
  then FreeAndNil(FPostscriptDataEntry);

 if Assigned(FLocationDataEntry)
  then FreeAndNil(FLocationDataEntry);

 if Assigned(FGlyphDataEntry)
  then FreeAndNil(FGlyphDataEntry);

 if Assigned(FOS2TableEntry)
  then FreeAndNil(FOS2TableEntry);

 // clear table list
 FTableList.Clear;
end;

procedure TPascalTypeDirectoryTable.ClearAndBuildRequiredEntries;
begin
 ResetToDefaults;

 // create head table entry
 FHeaderTable := TPascalTypeDirectoryTableEntry.Create;
 FHeaderTable.TableType := 'head';

 // create maxp table entry
 FMaxProfileDataEntry := TPascalTypeDirectoryTableEntry.Create;
 FMaxProfileDataEntry.TableType := 'maxp';

 // create hhea table entry
 FHorHeaderDataEntry := TPascalTypeDirectoryTableEntry.Create;
 FHorHeaderDataEntry.TableType := 'hhea';

 // create hmtx table entry
 FHorMetricsDataEntry := TPascalTypeDirectoryTableEntry.Create;
 FHorMetricsDataEntry.TableType := 'hmtx';

 // create cmap table entry
 FCharMapDataEntry := TPascalTypeDirectoryTableEntry.Create;
 FCharMapDataEntry.TableType := 'cmap';

 // create name table entry
 FNameDataEntry := TPascalTypeDirectoryTableEntry.Create;
 FNameDataEntry.TableType := 'name';

 // create post table entry
 FPostscriptDataEntry := TPascalTypeDirectoryTableEntry.Create;
 FPostscriptDataEntry.TableType := 'post';
end;

procedure TPascalTypeDirectoryTable.LoadFromStream(Stream: TStream);
var
  TableIndex    : Integer;
  TableEntry    : TPascalTypeDirectoryTableEntry;
  NumTables     : Word; // number of tables
  {$IFDEF AmbigiousExceptions}
  SearchRange   : Word; // (maximum power of 2 <= numTables) * 16
  EntrySelector : Word; // log2(maximum power of 2 <= numTables)
  RangeShift    : Word; // numTables * 16 - searchRange
   {$ENDIF}
begin
 inherited;

 with Stream do
  begin
   // make sure at least the offset subtable is contained in the file
   if Size < 10
    then raise EPascalTypeError.Create(RCStrWrongFilesize);

   // read version
   FVersion := ReadSwappedCardinal(Stream);

   // check for known scaler types (OSX and Windows)
   case Version of
    $00010000 :;
    $4F54544F :;
    $74727565 :;
    else raise EPascalTypeError.Create(RCStrUnknownVersion);
   end;

   // read number of tables
   NumTables := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   // read search range
   SearchRange := ReadSwappedWord(Stream);
   if SearchRange > Round(16 * (1 shl FloorLog2(NumTables)))
    then raise EPascalTypeError.Create(RCStrWrongSearchRange);

   // read entry selector
   EntrySelector := ReadSwappedWord(Stream);
   if EntrySelector < Round(Log2(SearchRange / 16))
    then raise EPascalTypeError.Create(RCStrWrongEntrySelector);

   // read range shift
   RangeShift := ReadSwappedWord(Stream);
   if RangeShift <> (16 * NumTables - SearchRange)
    then raise EPascalTypeError.Create(RCStrWrongRangeShift);
   {$ELSE}
   Seek(6, soFromCurrent);
   {$ENDIF}

   // read table entries from stream
   for TableIndex := 0 to NumTables - 1 do
    begin
     TableEntry := TPascalTypeDirectoryTableEntry.Create;
     TableEntry.LoadFromStream(Stream);

     // add table entry as required table or add to directory table list
     if TableEntry.TableType = 'head' then FHeaderTable := TableEntry else
     if TableEntry.TableType = 'maxp' then FMaxProfileDataEntry := TableEntry else
     if TableEntry.TableType = 'hhea' then FHorHeaderDataEntry := TableEntry else
     if TableEntry.TableType = 'hmtx' then FHorMetricsDataEntry := TableEntry else
     if TableEntry.TableType = 'cmap' then FCharMapDataEntry := TableEntry else
     if TableEntry.TableType = 'name' then FNameDataEntry := TableEntry else
     if TableEntry.TableType = 'post' then FPostscriptDataEntry := TableEntry else
     if TableEntry.TableType = 'loca' then FLocationDataEntry := TableEntry else
     if TableEntry.TableType = 'glyf' then FGlyphDataEntry := TableEntry else
     if TableEntry.TableType = 'OS/2'
      then FOS2TableEntry := TableEntry
      else FTableList.Add(TableEntry);
    end;
  end;

 // check for required tables 
 case Version of
  $00010000 : if not Assigned(OS2TableEntry)
   then raise EPascalTypeError.Create(RCStrNoOS2Table);
  $74727565 :
   begin
    if not Assigned(FLocationDataEntry)
     then raise EPascalTypeError.Create(RCStrNoIndexToLocationTable);
    if not Assigned(FGlyphDataEntry)
     then raise EPascalTypeError.Create(RCStrNoGlyphDataTable);
   end;
 end;


end;

procedure TPascalTypeDirectoryTable.SaveToStream(Stream: TStream);
begin
 inherited;

end;

end.
