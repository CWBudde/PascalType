unit PT_Interpreter;

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

uses
  Classes, SysUtils, Types, Contnrs, PT_Types, PT_Tables;

type
  TRequiredTable = (rtCharacterMapping, rtFontHeader, rtHorizontalHeader,
    rtHorizontalMetrics, rtMaximumProfile, rtNaming,
    rtPostScript, rtIndexLocation, rtGlyphData, rtOS2);
  TRequiredTables = set of TRequiredTable;

  TCustomPascalTypeInterpreter = class(TInterfacedPersistent, IStreamPersist,
    IPascalTypeInterpreter)
  private
    FDirectoryTable     : TDirectoryTable;
    FDirectoryTableList : TObjectList;

    // required tables
    FHeaderTable        : TPascalTypeHeaderTable;
    FHorizontalHeader   : TPascalTypeHorizontalHeaderTable;
    FHorizontalMetrics  : TPascalTypeHorizontalMetricsTable;
    FCharacterMap       : TPascalTypeCharacterMapTable;
    FMaximumProfile     : TPascalTypeMaximumProfileTable;
    FNameTable          : TPascalTypeNameTable;
    FPostScriptTable    : TPascalTypePostscriptTable;

    FOptionalTables     : TObjectList;
    FSortTableByOffset: Boolean;
    function GetOptionalTableCount: Integer;
    function GetOptionalTable(Index: Integer): TCustomPascalTypeNamedTable;
    function GetTableCount: Integer;
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
    procedure SetSortTableByOffset(const Value: Boolean);
  protected
    procedure SortTableByOffsetChanged; virtual;
    procedure OptimizeTableReadOrder; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    procedure LoadFromFile(FileName: TFileName);
    procedure SaveToFile(FileName: TFileName);

    // required tables
    property HeaderTable: TPascalTypeHeaderTable read FHeaderTable;
    property HorizontalHeader: TPascalTypeHorizontalHeaderTable read FHorizontalHeader;
    property MaximumProfile: TPascalTypeMaximumProfileTable read FMaximumProfile;
    property HorizontalMetrics: TPascalTypeHorizontalMetricsTable read FHorizontalMetrics;
    property CharacterMap: TPascalTypeCharacterMapTable read FCharacterMap;
    property NameTable: TPascalTypeNameTable read FNameTable;
    property PostScriptTable: TPascalTypePostscriptTable read FPostScriptTable;

    property TableCount: Integer read GetTableCount;
    property OptionalTableCount: Integer read GetOptionalTableCount;
    property OptionalTable[Index: Integer]: TCustomPascalTypeNamedTable read GetOptionalTable;

    property SortTableByOffset: Boolean read FSortTableByOffset write SetSortTableByOffset default True;
  end;

  TPascalTypeInterpreter = class(TCustomPascalTypeInterpreter)

  end;

implementation

uses
  PT_ResourceStrings;


function SortTableEntryByOffset(Item1, Item2: Pointer): Integer;
begin
 Result := Integer(TPascalTypeDirectoryTableEntry(Item1).Offset >
   TPascalTypeDirectoryTableEntry(Item2).Offset);
end;

function CalculateCheckSum(Stream : TMemoryStream): Cardinal;
var
  I     : Integer;
  Value : Cardinal;
begin
 with Stream do
  begin
   // ensure that at least one cardinal is in the stream
   if Size < 4
    then Exit;

   // set position to beginning of the stream
   Seek(0, soFromBeginning);

   // read first cardinal
   Read(Result, SizeOf(Cardinal));
   Result := Swap32(Result);

   // read subsequent cardinals
   for i := 1 to (Size div 4) - 1 do
    begin
     Read(Value, SizeOf(Cardinal));
     Result := Result + Swap32(Value);
    end;
  end;
end;


function CalculateHeadCheckSum(Stream : TMemoryStream): Cardinal;
var
  I     : Integer;
  Value : Cardinal;
begin
 with Stream do
  begin
   // ensure that at least one cardinal is in the stream
   if Size < 4
    then Exit;

   // set position to beginning of the stream
   Seek(0, soFromBeginning);

   // read first cardinal
   Read(Result, SizeOf(Cardinal));
   Result := Swap32(Result);

   // read subsequent cardinals
   for i := 1 to (Size div 4) - 1 do
    begin
     if i = 2 then Continue;
     Read(Value, SizeOf(Cardinal));
     Result := Result + Swap32(Value);
    end;
  end;
end;


{ TCustomPascalTypeInterpreter }

constructor TCustomPascalTypeInterpreter.Create;
begin
 // create directory table list
 FDirectoryTableList := TObjectList.Create;

 // create required tables
 FHeaderTable        := TPascalTypeHeaderTable.Create(Self);
 FHorizontalHeader   := TPascalTypeHorizontalHeaderTable.Create(Self);
 FHorizontalMetrics  := TPascalTypeHorizontalMetricsTable.Create(Self);
 FCharacterMap       := TPascalTypeCharacterMapTable.Create(Self);
 FMaximumProfile     := TPascalTypeMaximumProfileTable.Create(Self);
 FNameTable          := TPascalTypeNameTable.Create(Self);
 FPostScriptTable    := TPascalTypePostscriptTable.Create(Self);

 // create optional table list
 FOptionalTables := TObjectList.Create;

 // defaults
 FSortTableByOffset := True;
end;

destructor TCustomPascalTypeInterpreter.Destroy;
begin
 FreeAndNil(FDirectoryTableList);
 FreeAndNil(FHeaderTable);
 FreeAndNil(FHorizontalHeader);
 FreeAndNil(FHorizontalMetrics);
 FreeAndNil(FCharacterMap);
 FreeAndNil(FMaximumProfile);
 FreeAndNil(FNameTable);
 FreeAndNil(FPostScriptTable);
 FreeAndNil(FOptionalTables);
 inherited;
end;

function TCustomPascalTypeInterpreter.GetOptionalTable(
  Index: Integer): TCustomPascalTypeNamedTable;
begin
 if (Index >= 0) and (Index < FOptionalTables.Count)
  then Result := TCustomPascalTypeNamedTable(FOptionalTables[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TCustomPascalTypeInterpreter.GetOptionalTableCount: Integer;
begin
 Result := FOptionalTables.Count;
end;

function TCustomPascalTypeInterpreter.GetTableByTableType(
  TableType: TTableType): TCustomPascalTypeNamedTable;
var
  TableIndex : Integer;
begin
 if TableType = FHeaderTable.TableType then Result := FHeaderTable else
 if TableType = FHorizontalHeader.TableType then Result := FHorizontalHeader else
 if TableType = FHorizontalMetrics.TableType then Result := FHorizontalMetrics else
 if TableType = FCharacterMap.TableType then Result := FCharacterMap else
 if TableType = FMaximumProfile.TableType then Result := FMaximumProfile else
 if TableType = FNameTable.TableType then Result := FNameTable else
 if TableType = FPostScriptTable.TableType then Result := FPostScriptTable else
 for TableIndex := 0 to FOptionalTables.Count - 1 do
  with TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]) do
   if GetTableType = TableType
    then Result := TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]);
end;

function TCustomPascalTypeInterpreter.GetTableByTableClass(
  TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
var
  TableIndex   : Integer;
  CurrentTable : TCustomPascalTypeNamedTable;
begin
 if TableClass = FHeaderTable.ClassType then Result := FHeaderTable else
 if TableClass = FHorizontalHeader.ClassType then Result := FHorizontalHeader else
 if TableClass = FHorizontalMetrics.ClassType then Result := FHorizontalMetrics else
 if TableClass = FCharacterMap.ClassType then Result := FCharacterMap else
 if TableClass = FMaximumProfile.ClassType then Result := FMaximumProfile else
 if TableClass = FNameTable.ClassType then Result := FNameTable else
 if TableClass = FPostScriptTable.ClassType then Result := FPostScriptTable else

 for TableIndex := 0 to FOptionalTables.Count - 1 do
  with TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]) do
   if ClassType = TableClass
    then Result := TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]);
end;

function TCustomPascalTypeInterpreter.GetTableCount: Integer;
begin
 Result := FDirectoryTableList.Count;
end;

procedure TCustomPascalTypeInterpreter.LoadFromFile(FileName: TFileName);
var
  FileStream : TFileStream;
begin
 FileStream := TFileStream.Create(FileName, fmOpenRead);
 try
  LoadFromStream(FileStream);
 finally
  FreeAndNil(FileStream);
 end;
end;

procedure TCustomPascalTypeInterpreter.LoadFromStream(Stream: TStream);
var
  TableIndex     : Integer;
  TableEntry     : TPascalTypeDirectoryTableEntry;
  NewTableList   : TObjectList;
  TempList       : TObjectList;
  RequiredTables : TRequiredTables;
  MemoryStream   : TMemoryStream;
  Checksum       : Cardinal;
  TableClass     : TCustomPascalTypeNamedTableClass;
  CurrentTable   : TCustomPascalTypeNamedTable;
begin
 with Stream do
  begin
   // make sure at least the offset subtable is contained in the file
   if Size < SizeOf(TDirectoryTable)
    then raise EPascalTypeError.Create(RCStrWrongFilesize);

   // read offset subtable
   ReadBuffer(FDirectoryTable, SizeOf(TDirectoryTable));

   // check for known scaler types (OSX and Windows)
   if not ((FDirectoryTable.Version = $65757274) or (FDirectoryTable.Version = $00000100))
    then raise EPascalTypeError.Create(RCStrUnknownVersion);

   // create a new table list
   NewTableList := TObjectList.Create;
   try
    // no required tables at first
    RequiredTables := [];

    // read table entries from stream
    for TableIndex := 0 to Swap(FDirectoryTable.NumTables) - 1 do
     begin
      TableEntry := TPascalTypeDirectoryTableEntry.Create(Self);
      TableEntry.LoadFromStream(Stream);
      if TableEntry.TableType = 'cmap' then RequiredTables := RequiredTables + [rtCharacterMapping] else
      if TableEntry.TableType = 'glyf' then RequiredTables := RequiredTables + [rtGlyphData] else
      if TableEntry.TableType = 'head' then RequiredTables := RequiredTables + [rtFontHeader] else
      if TableEntry.TableType = 'hhea' then RequiredTables := RequiredTables + [rtHorizontalHeader] else
      if TableEntry.TableType = 'hmtx' then RequiredTables := RequiredTables + [rtHorizontalMetrics] else
      if TableEntry.TableType = 'loca' then RequiredTables := RequiredTables + [rtIndexLocation] else
      if TableEntry.TableType = 'maxp' then RequiredTables := RequiredTables + [rtMaximumProfile] else
      if TableEntry.TableType = 'name' then RequiredTables := RequiredTables + [rtNaming] else
      if TableEntry.TableType = 'post' then RequiredTables := RequiredTables + [rtPostScript] else
      if TableEntry.TableType = 'OS/2' then RequiredTables := RequiredTables + [rtOS2];

      // add table entry to directory table list
      NewTableList.Add(TableEntry);
     end;

    // check if all necessary tables are present
    if RequiredTables - [rtCharacterMapping..rtPostScript] = []
     then raise EPascalTypeError.Create(RCStrTablesMissing);

    if (FDirectoryTable.Version = $65757274) then
     if not (rtGlyphData in RequiredTables)
      then raise EPascalTypeError.Create(RCStrTablesMissing);

    if (FDirectoryTable.Version = $00000100) then
     if not (rtOS2 in RequiredTables)
      then raise EPascalTypeError.Create(RCStrTablesMissing);

    // exchange table list
    TempList := FDirectoryTableList;
    FDirectoryTableList := NewTableList;
    NewTableList := TempList;
   finally
    FreeAndNil(NewTableList);
   end;

   // eventually sort by offset
   if FSortTableByOffset
    then FDirectoryTableList.Sort(SortTableEntryByOffset);

   // optimize table read order
   OptimizeTableReadOrder;

   // clear optional table lists
   FOptionalTables.Clear;

   // create memory stream for checksum
   MemoryStream := TMemoryStream.Create;
   try
    // read table entries from stream
    for TableIndex := 0 to FDirectoryTableList.Count - 1 do
     begin
      TableEntry := TPascalTypeDirectoryTableEntry(FDirectoryTableList[TableIndex]);

      // clear memory stream
      MemoryStream.Clear;

      // set stream position
      Position := TableEntry.Offset;

      // copy from stream
      MemoryStream.CopyFrom(Stream, 4 * ((TableEntry.Length + 3) div 4));

      // calculate checksum
      if TableEntry.TableType = 'head'
       then Checksum := TableEntry.CheckSum // CalculateHeadCheckSum(MemoryStream)
       else Checksum := CalculateCheckSum(MemoryStream);

      // check checksum
      if Checksum <> TableEntry.CheckSum
       then raise EPascalTypeError.Create(RCStrChecksumError);

      // reset memory stream position 
      MemoryStream.Seek(soFromBeginning, 0);
      MemoryStream.Size := TableEntry.Length;

      TableClass := FindTrueTypeFontTableByType(TableEntry.TableType);
      if TableClass <> nil then
       begin
        CurrentTable := TableClass.Create(Self);
        try
         // load table from stream
         CurrentTable.LoadFromStream(MemoryStream);

         // assign tables
         if TableClass = TPascalTypeHeaderTable then FHeaderTable.Assign(CurrentTable) else
         if TableClass = TPascalTypeHorizontalHeaderTable then FHorizontalHeader.Assign(CurrentTable) else
         if TableClass = TPascalTypeHorizontalMetricsTable then FHorizontalMetrics.Assign(CurrentTable) else
         if TableClass = TPascalTypePostscriptTable then FPostScriptTable.Assign(CurrentTable) else
         if TableClass = TPascalTypeMaximumProfileTable then FMaximumProfile.Assign(CurrentTable) else
         if TableClass = TPascalTypeNameTable then FNameTable.Assign(CurrentTable) else
         if TableClass = TPascalTypeCharacterMapTable then FCharacterMap.Assign(CurrentTable) else
          begin
           FOptionalTables.Add(CurrentTable);
           CurrentTable := nil;
          end;

        finally
         // dispose temporary table
         if Assigned(CurrentTable)
          then FreeAndNil(CurrentTable);
        end;
       end;

     end;
   finally
    FreeAndNil(MemoryStream);
   end;

  end;
end;

procedure TCustomPascalTypeInterpreter.OptimizeTableReadOrder;
var
  TableIndex : Integer;
begin
 // read 'head' table first
 for TableIndex := 0 to FDirectoryTableList.Count - 1 do
  with TPascalTypeDirectoryTableEntry(FDirectoryTableList[TableIndex]) do
   if TableType = 'head' then
    begin
     FDirectoryTableList.Move(TableIndex, 0);
     Break;
    end;
 // read 'maxp' table second
 for TableIndex := 1 to FDirectoryTableList.Count - 1 do
  with TPascalTypeDirectoryTableEntry(FDirectoryTableList[TableIndex]) do
   if TableType = 'maxp' then
    begin
     FDirectoryTableList.Move(TableIndex, 1);
     Break;
    end;
 // read 'maxp' table second
 for TableIndex := 2 to FDirectoryTableList.Count - 1 do
  with TPascalTypeDirectoryTableEntry(FDirectoryTableList[TableIndex]) do
   if TableType = 'hhea' then
    begin
     FDirectoryTableList.Move(TableIndex, 1);
     Break;
    end;
end;

procedure TCustomPascalTypeInterpreter.SaveToFile(FileName: TFileName);
begin
 raise EPascalTypeError.Create(RCStrNotImplemented);
end;

procedure TCustomPascalTypeInterpreter.SaveToStream(Stream: TStream);
begin
 raise EPascalTypeError.Create(RCStrNotImplemented);
end;

procedure TCustomPascalTypeInterpreter.SetSortTableByOffset(
  const Value: Boolean);
begin
 if FSortTableByOffset <> Value then
  begin
   FSortTableByOffset := Value;
   SortTableByOffsetChanged;
  end;
end;

procedure TCustomPascalTypeInterpreter.SortTableByOffsetChanged;
begin
 // todo: eventually sort current list
end;


end.
