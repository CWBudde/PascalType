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

{$I PT_Compiler.inc}

uses
  Classes, SysUtils, Types, Contnrs, PT_Types, PT_TableDirectory, PT_Tables;

type
  TCustomPascalTypeInterpreter = class(TInterfacedPersistent, IStreamPersist,
    IPascalTypeInterpreter)
  protected
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable; virtual; abstract;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable; virtual; abstract;

    procedure LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); virtual; abstract;
  public
    constructor Create; virtual;

    procedure LoadFromStream(Stream: TStream); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure LoadFromFile(FileName: TFileName);
    procedure SaveToFile(FileName: TFileName);
  end;

  TPascalTypeScanner = class(TCustomPascalTypeInterpreter)
  private
    // required tables
    FHeaderTable        : TPascalTypeHeaderTable;
    FHorizontalHeader   : TPascalTypeHorizontalHeaderTable;
    FMaximumProfile     : TPascalTypeMaximumProfileTable;
    FNameTable          : TPascalTypeNameTable;
    FPostScriptTable    : TPascalTypePostscriptTable;
  protected
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable; override;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable; override;

    procedure LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); override;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    // required tables
    property HeaderTable: TPascalTypeHeaderTable read FHeaderTable;
    property HorizontalHeader: TPascalTypeHorizontalHeaderTable read FHorizontalHeader;
    property MaximumProfile: TPascalTypeMaximumProfileTable read FMaximumProfile;
    property NameTable: TPascalTypeNameTable read FNameTable;
    property PostScriptTable: TPascalTypePostscriptTable read FPostScriptTable;
  end;

  TPascalTypeInterpreter = class(TCustomPascalTypeInterpreter)
  private
    // required tables
    FHeaderTable        : TPascalTypeHeaderTable;
    FHorizontalHeader   : TPascalTypeHorizontalHeaderTable;
    FHorizontalMetrics  : TPascalTypeHorizontalMetricsTable;
    FCharacterMap       : TPascalTypeCharacterMapTable;
    FMaximumProfile     : TPascalTypeMaximumProfileTable;
    FNameTable          : TPascalTypeNameTable;
    FPostScriptTable    : TPascalTypePostscriptTable;

    FOptionalTables     : TObjectList;

    function GetTableCount: Integer;
    function GetOptionalTableCount: Integer;
    function GetOptionalTable(Index: Integer): TCustomPascalTypeNamedTable;
  protected
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable; override;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable; override;

    procedure LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    property OptionalTable[Index: Integer]: TCustomPascalTypeNamedTable read GetOptionalTable;
  published
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
  end;

implementation

uses
  PT_ResourceStrings;


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
  DirectoryTable   : TDirectoryTable;
  DirTableList     : TPascalTypeDirectoryTableList;
  TableIndex       : Integer;
  TableEntry       : TPascalTypeDirectoryTableEntry;

  RequiredTables   : array [0..6] of TPascalTypeDirectoryTableEntry;
  ReqTrueTypeTab   : array [0..1] of TPascalTypeDirectoryTableEntry;
  OS2TableEntry    : TPascalTypeDirectoryTableEntry;
begin
 with Stream do
  begin
   // make sure at least the offset subtable is contained in the file
   if Size < SizeOf(TDirectoryTable)
    then raise EPascalTypeError.Create(RCStrWrongFilesize);

   // read offset subtable
   ReadBuffer(DirectoryTable, SizeOf(TDirectoryTable));

   // check for known scaler types (OSX and Windows)
   with DirectoryTable do
    if not ((Version = $65757274) or (Version = $00000100))
     then raise EPascalTypeError.Create(RCStrUnknownVersion);

   // create directory table list
   DirTableList := TPascalTypeDirectoryTableList.Create;
   try
    // read table entries from stream
    for TableIndex := 0 to Swap(DirectoryTable.NumTables) - 1 do
     begin
      TableEntry := TPascalTypeDirectoryTableEntry.Create(Self);
      TableEntry.LoadFromStream(Stream);

      // add table entry as required table or add to directory table list
      if TableEntry.TableType = 'head' then RequiredTables[0] := TableEntry else
      if TableEntry.TableType = 'maxp' then RequiredTables[1] := TableEntry else
      if TableEntry.TableType = 'hhea' then RequiredTables[2] := TableEntry else
      if TableEntry.TableType = 'hmtx' then RequiredTables[3] := TableEntry else
      if TableEntry.TableType = 'cmap' then RequiredTables[4] := TableEntry else
      if TableEntry.TableType = 'name' then RequiredTables[5] := TableEntry else
      if TableEntry.TableType = 'post' then RequiredTables[6] := TableEntry else
      if TableEntry.TableType = 'glyf' then ReqTrueTypeTab[0] := TableEntry else
      if TableEntry.TableType = 'loca' then ReqTrueTypeTab[1] := TableEntry else
      if TableEntry.TableType = 'OS/2'
       then OS2TableEntry := TableEntry
       else DirTableList.Add(TableEntry);
     end;

    // optimize table read order
    DirTableList.SortByOffset;

    // read header table
    if not Assigned(RequiredTables[0])
     then raise EPascalTypeError.Create('Header table not found!');
    LoadTableFromStream(Stream, RequiredTables[0]);

    // read maximum profile table
    if not Assigned(RequiredTables[1])
     then raise EPascalTypeError.Create('Maximum profile table not found!');
    LoadTableFromStream(Stream, RequiredTables[1]);

    // read horizontal header table
    if not Assigned(RequiredTables[2])
     then raise EPascalTypeError.Create('Horizontal header table not found!');
    LoadTableFromStream(Stream, RequiredTables[2]);

    // read horizontal metrics table
    if not Assigned(RequiredTables[3])
     then raise EPascalTypeError.Create('Horizontal metrics table not found!');
    LoadTableFromStream(Stream, RequiredTables[3]);

    // read character map table
    if not Assigned(RequiredTables[4])
     then raise EPascalTypeError.Create('Character map table not found!');
    LoadTableFromStream(Stream, RequiredTables[4]);

    // read name table
    if not Assigned(RequiredTables[5])
     then raise EPascalTypeError.Create('Name table not found!');
    LoadTableFromStream(Stream, RequiredTables[5]);

    // read postscript table
    if not Assigned(RequiredTables[6])
     then raise EPascalTypeError.Create('Postscript table not found!');
    LoadTableFromStream(Stream, RequiredTables[6]);

    // eventually read OS/2 table or eventually raise an exception
    if Assigned(OS2TableEntry)
     then LoadTableFromStream(Stream, OS2TableEntry) else
    if (DirectoryTable.Version = $00000100)
     then raise EPascalTypeError.Create('OS/2 table not found!');

    // TODO check if these are required by tables already read!!!
    // read glyph data table
    if Assigned(ReqTrueTypeTab[0])
     then LoadTableFromStream(Stream, ReqTrueTypeTab[0]) else
    if (DirectoryTable.Version = $65757274)
     then raise EPascalTypeError.Create('Glyph data table not found!');

    // read index to location table
    if Assigned(ReqTrueTypeTab[1])
     then LoadTableFromStream(Stream, ReqTrueTypeTab[1]) else
    if (DirectoryTable.Version = $65757274)
     then raise EPascalTypeError.Create('Index to Location table not found!');

    // read other table entries from stream
    for TableIndex := 0 to DirTableList.Count - 1
     do LoadTableFromStream(Stream, DirTableList[TableIndex]);

   finally
    if Assigned(RequiredTables[0]) then FreeAndNil(RequiredTables[0]);
    if Assigned(RequiredTables[1]) then FreeAndNil(RequiredTables[1]);
    if Assigned(RequiredTables[2]) then FreeAndNil(RequiredTables[2]);
    if Assigned(RequiredTables[3]) then FreeAndNil(RequiredTables[3]);
    if Assigned(RequiredTables[4]) then FreeAndNil(RequiredTables[4]);
    if Assigned(RequiredTables[5]) then FreeAndNil(RequiredTables[5]);
    if Assigned(RequiredTables[6]) then FreeAndNil(RequiredTables[6]);
    if Assigned(ReqTrueTypeTab[0]) then FreeAndNil(ReqTrueTypeTab[0]);
    if Assigned(ReqTrueTypeTab[1]) then FreeAndNil(ReqTrueTypeTab[1]);
    if Assigned(OS2TableEntry) then FreeAndNil(OS2TableEntry);
    FreeAndNil(DirTableList);
   end;
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


{ TPascalTypeScanner }

constructor TPascalTypeScanner.Create;
begin
 inherited;

 // create required tables
 FHeaderTable        := TPascalTypeHeaderTable.Create(Self);
 FHorizontalHeader   := TPascalTypeHorizontalHeaderTable.Create(Self);
 FMaximumProfile     := TPascalTypeMaximumProfileTable.Create(Self);
 FNameTable          := TPascalTypeNameTable.Create(Self);
 FPostScriptTable    := TPascalTypePostscriptTable.Create(Self);

end;

destructor TPascalTypeScanner.Destroy;
begin
 FreeAndNil(FHeaderTable);
 FreeAndNil(FHorizontalHeader);
 FreeAndNil(FMaximumProfile);
 FreeAndNil(FNameTable);
 FreeAndNil(FPostScriptTable);
 inherited;
end;

function TPascalTypeScanner.GetTableByTableClass(
  TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
var
  TableIndex : Integer;
begin
 if TableClass = FHeaderTable.ClassType then Result := FHeaderTable else
 if TableClass = FHorizontalHeader.ClassType then Result := FHorizontalHeader else
 if TableClass = FMaximumProfile.ClassType then Result := FMaximumProfile else
 if TableClass = FNameTable.ClassType then Result := FNameTable else
 if TableClass = FPostScriptTable.ClassType then Result := FPostScriptTable
  else Result := nil;
end;

function TPascalTypeScanner.GetTableByTableType(
  TableType: TTableType): TCustomPascalTypeNamedTable;
var
  TableIndex : Integer;
begin
 if TableType = FHeaderTable.TableType then Result := FHeaderTable else
 if TableType = FHorizontalHeader.TableType then Result := FHorizontalHeader else
 if TableType = FMaximumProfile.TableType then Result := FMaximumProfile else
 if TableType = FNameTable.TableType then Result := FNameTable else
 if TableType = FPostScriptTable.TableType then Result := FPostScriptTable
  else Result := nil;
end;

procedure TPascalTypeScanner.LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry);
var
  MemoryStream   : TMemoryStream;
  {$IFDEF ChecksumTest}
  Checksum       : Cardinal;
  {$ENDIF}
  TableClass     : TCustomPascalTypeNamedTableClass;
begin
 MemoryStream := TMemoryStream.Create;
 with Stream do
  try
   // set stream position
   Position := TableEntry.Offset;

   // copy from stream
   MemoryStream.CopyFrom(Stream, 4 * ((TableEntry.Length + 3) div 4));

   {$IFDEF ChecksumTest}
   // calculate checksum
   if TableEntry.TableType = 'head'
    then Checksum := TableEntry.CheckSum // CalculateHeadCheckSum(MemoryStream)
    else Checksum := CalculateCheckSum(MemoryStream);

   // check checksum
   if (Checksum <> TableEntry.CheckSum)
    then raise EPascalTypeError.CreateFmt(RCStrChecksumError, [TableEntry.TableType]);
   {$ENDIF}

   // reset memory stream position
   MemoryStream.Seek(soFromBeginning, 0);

   // restore original table length
   MemoryStream.Size := TableEntry.Length;

   TableClass := FindTrueTypeFontTableByType(TableEntry.TableType);
   if TableClass <> nil then
    begin
     // load table from stream
     if TableClass = TPascalTypeHeaderTable then FHeaderTable.LoadFromStream(MemoryStream) else
     if TableClass = TPascalTypeHorizontalHeaderTable then FHorizontalHeader.LoadFromStream(MemoryStream) else
     if TableClass = TPascalTypePostscriptTable then FPostScriptTable.LoadFromStream(MemoryStream) else
     if TableClass = TPascalTypeMaximumProfileTable then FMaximumProfile.LoadFromStream(MemoryStream) else
     if TableClass = TPascalTypeNameTable then FNameTable.LoadFromStream(MemoryStream);
    end;

  finally
   FreeAndNil(MemoryStream);
  end;
end;


{ TPascalTypeInterpreter }

constructor TPascalTypeInterpreter.Create;
begin
 inherited;

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
end;

destructor TPascalTypeInterpreter.Destroy;
begin
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

function TPascalTypeInterpreter.GetOptionalTable(
  Index: Integer): TCustomPascalTypeNamedTable;
begin
 if (Index >= 0) and (Index < FOptionalTables.Count)
  then Result := TCustomPascalTypeNamedTable(FOptionalTables[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeInterpreter.GetOptionalTableCount: Integer;
begin
 Result := FOptionalTables.Count;
end;

function TPascalTypeInterpreter.GetTableByTableType(
  TableType: TTableType): TCustomPascalTypeNamedTable;
var
  TableIndex : Integer;
begin
 // return nil if the table hasn't been found
 Result := nil;

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

function TPascalTypeInterpreter.GetTableByTableClass(
  TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
var
  TableIndex : Integer;
begin
 // return nil if the table hasn't been found
 Result := nil;

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

function TPascalTypeInterpreter.GetTableCount: Integer;
begin
 Result := 7 + FOptionalTables.Count;
end;

procedure TPascalTypeInterpreter.LoadTableFromStream(Stream: TStream;
  TableEntry: TPascalTypeDirectoryTableEntry);
var
  MemoryStream   : TMemoryStream;
  {$IFDEF ChecksumTest}
  Checksum       : Cardinal;
  {$ENDIF}
  TableClass     : TCustomPascalTypeNamedTableClass;
  CurrentTable   : TCustomPascalTypeNamedTable;
begin
 MemoryStream := TMemoryStream.Create;
 with Stream do
  try
   // set stream position
   Position := TableEntry.Offset;

   // copy from stream
   MemoryStream.CopyFrom(Stream, 4 * ((TableEntry.Length + 3) div 4));

   {$IFDEF ChecksumTest}
   // calculate checksum
   if TableEntry.TableType = 'head'
    then Checksum := TableEntry.CheckSum // CalculateHeadCheckSum(MemoryStream)
    else Checksum := CalculateCheckSum(MemoryStream);

   // check checksum
   if (Checksum <> TableEntry.CheckSum)
    then raise EPascalTypeError.CreateFmt(RCStrChecksumError, [TableEntry.TableType]);
   {$ENDIF}

   // reset memory stream position
   MemoryStream.Seek(soFromBeginning, 0);

   // restore original table length
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

  finally
   FreeAndNil(MemoryStream);
  end;
end;

end.
