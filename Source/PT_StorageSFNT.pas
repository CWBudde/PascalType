unit PT_StorageSFNT;

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
//  Portions created by Christian-W. Budde are Copyright (C) 2010-2017        //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

{$I PT_Compiler.inc}

{$IFDEF CPUx86_64}
  {$DEFINE PUREPASCAL}
{$ENDIF}

uses
  Classes, SysUtils, Types, Contnrs, PT_Types, PT_Classes, PT_Storage,
  PT_Tables, PT_TableDirectory;

type
  TCustomPascalTypeStorageSFNT = class(TCustomPascalTypeStorage,
    IPascalTypeStorageTable)
  private
    // required tables
    FHeaderTable: TPascalTypeHeaderTable;
    FHorizontalHeader: TPascalTypeHorizontalHeaderTable;
    FMaximumProfile: TPascalTypeMaximumProfileTable;
    FNameTable: TPascalTypeNameTable;
    FPostScriptTable: TPascalTypePostscriptTable;
    function GetFontName: WideString;
    function GetFontStyle: TFontStyles;
    function GetFontFamilyName: WideString;
    function GetFontSubFamilyName: WideString;
    function GetFontVersion: WideString;
    function GetUniqueIdentifier: WideString;
  protected
    function GetTableByTableName(TableName: TTableName): TCustomPascalTypeNamedTable; virtual; abstract;
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable; virtual; abstract;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable; virtual; abstract;

    procedure DirectoryTableReaded(DirectoryTable: TPascalTypeDirectoryTable); virtual;
    procedure LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); virtual; abstract;

{$IFDEF ChecksumTest}
    procedure ValidateChecksum(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); virtual;
{$ENDIF}
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;

    // required tables
    property HeaderTable: TPascalTypeHeaderTable read FHeaderTable;
    property HorizontalHeader: TPascalTypeHorizontalHeaderTable read FHorizontalHeader;
    property MaximumProfile: TPascalTypeMaximumProfileTable read FMaximumProfile;
    property NameTable: TPascalTypeNameTable read FNameTable;
    property PostScriptTable: TPascalTypePostscriptTable read FPostScriptTable;

    // basic properties
    property FontFamilyName: WideString read GetFontFamilyName;
    property FontName: WideString read GetFontName;
    property FontStyle: TFontStyles read GetFontStyle;
    property FontSubFamilyName: WideString read GetFontSubFamilyName;
    property FontVersion: WideString read GetFontVersion;
    property UniqueIdentifier: WideString read GetUniqueIdentifier;
  end;

  TPascalTypeStorageScan = class(TCustomPascalTypeStorageSFNT)
  protected
    function GetTableByTableName(TableName: TTableName): TCustomPascalTypeNamedTable; override;
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable; override;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable; override;

    procedure LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); override;
  public
    procedure SaveToStream(Stream: TStream); override;
  published
    property HeaderTable;
    property HorizontalHeader;
    property MaximumProfile;
    property NameTable;
    property PostScriptTable;
  end;

  TPascalTypeStorage = class(TCustomPascalTypeStorageSFNT)
  private
    // required tables
    FHorizontalMetrics: TPascalTypeHorizontalMetricsTable;
    FCharacterMap: TPascalTypeCharacterMapTable;
    FOS2Table: TPascalTypeOS2Table;

    FOptionalTables: TObjectList;

    function GetTableCount: Integer;
    function GetOptionalTableCount: Integer;
    function GetOptionalTable(Index: Integer): TCustomPascalTypeNamedTable;
    function GetGlyphData(Index: Integer): TCustomPascalTypeGlyphDataTable;
    function GetPanose: TCustomPascalTypePanoseTable;
    function GetBoundingBox: TRect;
    function GetGlyphCount: Word;
  protected
    function GetTableByTableName(TableName: TTableName): TCustomPascalTypeNamedTable; override;
    function GetTableByTableType(ATableType: TTableType): TCustomPascalTypeNamedTable; override;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable; override;

    procedure DirectoryTableReaded(DirectoryTable : TPascalTypeDirectoryTable); override;
    procedure LoadTableFromStream(Stream: TStream; TableEntry: TPascalTypeDirectoryTableEntry); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure SaveToStream(Stream: TStream); override;
    function ContainsTable(TableType: TTableType): Boolean;
    function GetAdvanceWidth(GlyphIndex: Integer): Word;
    function GetKerning(Last, Next: Integer): Word;

    property GlyphData[Index: Integer]: TCustomPascalTypeGlyphDataTable read GetGlyphData;

    property OptionalTable[Index: Integer]: TCustomPascalTypeNamedTable read GetOptionalTable;

    // redirected properties
    property Panose: TCustomPascalTypePanoseTable read GetPanose;
    property BoundingBox: TRect read GetBoundingBox;
    property GlyphCount: Word read GetGlyphCount;
  published
    // required tables
    property HeaderTable;
    property HorizontalHeader;
    property MaximumProfile;
    property NameTable;
    property PostScriptTable;
    property HorizontalMetrics: TPascalTypeHorizontalMetricsTable
      read FHorizontalMetrics;
    property CharacterMap: TPascalTypeCharacterMapTable read FCharacterMap;
    property OS2Table: TPascalTypeOS2Table read FOS2Table;

    property TableCount: Integer read GetTableCount;
    property OptionalTableCount: Integer read GetOptionalTableCount;
  end;

implementation

uses
  PT_Math, PT_TablesTrueType, PT_ResourceStrings;

function CalculateCheckSum(Data: Pointer; Size: Integer): Cardinal; overload;
{$IFDEF PUREPASCAL}
var
  I: Integer;
begin
  Result := Swap32(PCardinal(Data)^);
  Inc(PCardinal(Data));

  // read subsequent cardinals
  for I := 1 to Size - 1 do
  begin
    Result := Result + Swap32(PCardinal(Data)^);
    Inc(PCardinal(Data));
  end;
{$ELSE}
asm
  MOV     ECX, EDX
  XOR     EDX, EDX
  LEA     EAX, EAX + ECX * 4
  NEG     ECX
  JNL     @Done

  PUSH    EBX

@Start:
  MOV     EBX, [EAX + ECX * 4].DWord
  BSWAP   EBX
  ADD     EDX, EBX

  ADD     ECX, 1
  JS      @Start

  POP     EBX

@Done:
  MOV     EAX, EDX
  {$ENDIF}
end;

function CalculateCheckSum(Stream: TStream): Cardinal; overload;
var
  I    : Integer;
  Value: Cardinal;
begin
  with Stream do
  begin
    // ensure that at least one cardinal is in the stream
    if Size < 4 then
      Exit;

    // set position to beginning of the stream
    Seek(0, soFromBeginning);

    Assert(Size mod 4 = 0);

    if Stream is TMemoryStream then
      Result := CalculateCheckSum(TMemoryStream(Stream).Memory, Size div 4)
    else
    begin
      // read first cardinal
      Read(Result, SizeOf(Cardinal));
      Result := Swap32(Result);

      // read subsequent cardinals
      for I := 1 to (Size div 4) - 1 do
      begin
        Read(Value, SizeOf(Cardinal));
        Result := Result + Swap32(Value);
      end;
    end;
  end;
end;

function CalculateHeadCheckSum(Stream: TMemoryStream): Cardinal;
var
  I    : Integer;
  Value: Cardinal;
begin
  with Stream do
  begin
    // ensure that at least one cardinal is in the stream
    if Size < 4 then
      Exit;

    // set position to beginning of the stream
    Seek(0, soFromBeginning);

    // read first cardinal
    Read(Result, SizeOf(Cardinal));
    Result := Swap32(Result);

    // read subsequent cardinals
    for I := 1 to (Size div 4) - 1 do
    begin
      if I = 2 then
        Continue;
      Read(Value, SizeOf(Cardinal));
      Result := Result + Swap32(Value);
    end;
  end;
end;


{ TCustomPascalTypeStorageSFNT }

constructor TCustomPascalTypeStorageSFNT.Create;
begin
  inherited;

  // create required tables
  FHeaderTable := TPascalTypeHeaderTable.Create(Self);
  FHorizontalHeader := TPascalTypeHorizontalHeaderTable.Create(Self);
  FMaximumProfile := TPascalTypeMaximumProfileTable.Create(Self);
  FNameTable := TPascalTypeNameTable.Create(Self);
  FPostScriptTable := TPascalTypePostscriptTable.Create(Self);
end;

destructor TCustomPascalTypeStorageSFNT.Destroy;
begin
  FreeAndNil(FHeaderTable);
  FreeAndNil(FHorizontalHeader);
  FreeAndNil(FMaximumProfile);
  FreeAndNil(FNameTable);
  FreeAndNil(FPostScriptTable);
  inherited;
end;

procedure TCustomPascalTypeStorageSFNT.DirectoryTableReaded(DirectoryTable
  : TPascalTypeDirectoryTable);
begin
  // optimize table read order
  DirectoryTable.TableList.SortByOffset;
end;

function TCustomPascalTypeStorageSFNT.GetFontFamilyName: WideString;
var
  NameSubTableIndex: Integer;
begin
  with FNameTable do
    for NameSubTableIndex := 0 to NameSubTableCount - 1 do
      with NameSubTable[NameSubTableIndex] do
{$IFDEF MSWINDOWS}
        if PlatformID = piMicrosoft then
{$ELSE}
        if PlatformID = piUnicode then
{$ENDIF}
          if NameID = niFamily then
          begin
            Result := Name;
            Exit;
          end;
end;

function TCustomPascalTypeStorageSFNT.GetFontSubFamilyName: WideString;
var
  NameSubTableIndex: Integer;
begin
  with FNameTable do
    for NameSubTableIndex := 0 to NameSubTableCount - 1 do
      with NameSubTable[NameSubTableIndex] do
{$IFDEF MSWINDOWS}
        if PlatformID = piMicrosoft then
{$ELSE}
        if PlatformID = piUnicode then
{$ENDIF}
          if NameID = niSubfamily then
          begin
            Result := Name;
{$IFDEF MSWINDOWS}
            if LanguageID = 1033 then
              Exit;
{$ELSE}
            Exit;
{$ENDIF}
          end;
end;

function TCustomPascalTypeStorageSFNT.GetFontVersion: WideString;
var
  NameSubTableIndex: Integer;
begin
  with FNameTable do
    for NameSubTableIndex := 0 to NameSubTableCount - 1 do
      with NameSubTable[NameSubTableIndex] do
{$IFDEF MSWINDOWS}
        if PlatformID = piMicrosoft then
{$ELSE}
        if PlatformID = piUnicode then
{$ENDIF}
          if NameID = niVersion then
          begin
            Result := Name;
{$IFDEF MSWINDOWS}
            if LanguageID = 1033 then
              Exit;
{$ELSE}
            Exit;
{$ENDIF}
          end;
end;

function TCustomPascalTypeStorageSFNT.GetUniqueIdentifier: WideString;
var
  NameSubTableIndex: Integer;
begin
  with FNameTable do
    for NameSubTableIndex := 0 to NameSubTableCount - 1 do
      with NameSubTable[NameSubTableIndex] do
{$IFDEF MSWINDOWS}
        if PlatformID = piMicrosoft then
{$ELSE}
        if PlatformID = piUnicode then
{$ENDIF}
          if NameID = niUniqueIdentifier then
          begin
            Result := Name;
{$IFDEF MSWINDOWS}
            if LanguageID = 1033 then
              Exit;
{$ELSE}
            Exit;
{$ENDIF}
          end;
end;

function TCustomPascalTypeStorageSFNT.GetFontName: WideString;
var
  NameSubTableIndex: Integer;
begin
  with FNameTable do
    for NameSubTableIndex := 0 to NameSubTableCount - 1 do
      with NameSubTable[NameSubTableIndex] do
{$IFDEF MSWINDOWS}
        if PlatformID = piMicrosoft then
{$ELSE}
        if PlatformID = piUnicode then
{$ENDIF}
          if NameID = niFullName then
          begin
            Result := Name;
{$IFDEF MSWINDOWS}
            if LanguageID = 1033 then
              Exit;
{$ELSE}
            Exit;
{$ENDIF}
          end;
end;

function TCustomPascalTypeStorageSFNT.GetFontStyle: TFontStyles;
begin
  if msItalic in FHeaderTable.MacStyle then
    Result := [fsItalic]
  else
    Result := [];
  if msBold in FHeaderTable.MacStyle then
    Result := Result + [fsBold];
  if msUnderline in FHeaderTable.MacStyle then
    Result := Result + [fsUnderline];
end;

procedure TCustomPascalTypeStorageSFNT.LoadFromStream(Stream: TStream);
var
  DirectoryTable: TPascalTypeDirectoryTable;
  TableIndex    : Integer;
begin
  DirectoryTable := TPascalTypeDirectoryTable.Create;
  with DirectoryTable, Stream do
    try
      LoadFromStream(Stream);

      // directory table has been read, notify
      DirectoryTableReaded(DirectoryTable);

      // read header table
      if not Assigned(HeaderTable) then
        raise EPascalTypeError.Create(RCStrNoHeaderTable);
      LoadTableFromStream(Stream, HeaderTable);

      // read horizontal header table
      if not Assigned(HorizontalHeaderDataEntry) then
        raise EPascalTypeError.Create(RCStrNoHorizontalHeaderTable);
      LoadTableFromStream(Stream, HorizontalHeaderDataEntry);

      // read maximum profile table
      if not Assigned(MaximumProfileDataEntry) then
        raise EPascalTypeError.Create(RCStrNoMaximumProfileTable);
      LoadTableFromStream(Stream, MaximumProfileDataEntry);

      // eventually read OS/2 table or eventually raise an exception
      if Assigned(OS2TableEntry) then
        LoadTableFromStream(Stream, OS2TableEntry)
      else if (Version = $00010000) then
        raise EPascalTypeError.Create(RCStrNoOS2Table);

      // read horizontal metrics table
      if not Assigned(HorizontalMetricsDataEntry) then
        raise EPascalTypeError.Create(RCStrNoHorizontalMetricsTable);
      LoadTableFromStream(Stream, HorizontalMetricsDataEntry);

      // read character map table
      if not Assigned(CharacterMapDataEntry) then
        raise EPascalTypeError.Create(RCStrNoCharacterMapTable);
      LoadTableFromStream(Stream, CharacterMapDataEntry);

      // TODO: check if these are required by tables already read!!!
      // read index to location table
      if Assigned(LocationDataEntry) then
        LoadTableFromStream(Stream, LocationDataEntry)
      else if (Version = $74727565) then
        raise EPascalTypeError.Create(RCStrNoIndexToLocationTable);

      // read glyph data table
      if Assigned(GlyphDataEntry) then
        LoadTableFromStream(Stream, GlyphDataEntry)
      else if (Version = $74727565) then
        raise EPascalTypeError.Create(RCStrNoGlyphDataTable);

      // read name table
      if not Assigned(NameDataEntry) then
        raise EPascalTypeError.Create(RCStrNoNameTable);
      LoadTableFromStream(Stream, NameDataEntry);

      // read postscript table
      if not Assigned(PostscriptDataEntry) then
        raise EPascalTypeError.Create(RCStrNoPostscriptTable);
      LoadTableFromStream(Stream, PostscriptDataEntry);

      // read other table entries from stream
      for TableIndex := 0 to TableList.Count - 1 do
        LoadTableFromStream(Stream, TableList[TableIndex]);
    finally
      FreeAndNil(DirectoryTable);
    end;
end;

{$IFDEF ChecksumTest}

procedure TCustomPascalTypeStorageSFNT.ValidateChecksum(Stream: TStream;
  TableEntry: TPascalTypeDirectoryTableEntry);
var
  Checksum: Cardinal;
begin
  Stream.Position := 0;

  // calculate checksum of strem
  Checksum := CalculateCheckSum(Stream);

  if CompareTableType(TableEntry.TableType, 'head') then
  begin
    // ignore checksum adjustment
    Stream.Position := 8;
    Checksum := Checksum - ReadSwappedCardinal(Stream);
  end;

  // check checksum
  if (Checksum <> TableEntry.Checksum) then
    raise EPascalTypeChecksumError.CreateFmt(RCStrChecksumError,
      [string(TableEntry.TableType)]);
end;
{$ENDIF}


{ TPascalTypeStorageScan }

function TPascalTypeStorageScan.GetTableByTableClass
  (TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
begin
  if TableClass = FHeaderTable.ClassType then
    Result := FHeaderTable
  else if TableClass = FHorizontalHeader.ClassType then
    Result := FHorizontalHeader
  else if TableClass = FMaximumProfile.ClassType then
    Result := FMaximumProfile
  else if TableClass = FNameTable.ClassType then
    Result := FNameTable
  else if TableClass = FPostScriptTable.ClassType then
    Result := FPostScriptTable
  else
    Result := nil;
end;

function TPascalTypeStorageScan.GetTableByTableName(
  TableName: TTableName): TCustomPascalTypeNamedTable;
begin
  if CompareTableType(FHeaderTable.TableType, TableName) then
    Result := FHeaderTable
  else if CompareTableType(FHorizontalHeader.TableType, TableName) then
    Result := FHorizontalHeader
  else if CompareTableType(FMaximumProfile.TableType, TableName) then
    Result := FMaximumProfile
  else if CompareTableType(FNameTable.TableType, TableName) then
    Result := FNameTable
  else if CompareTableType(FPostScriptTable.TableType, TableName) then
    Result := FPostScriptTable
  else
    Result := nil;
end;

function TPascalTypeStorageScan.GetTableByTableType(TableType: TTableType)
  : TCustomPascalTypeNamedTable;
begin
  if TableType.AsCardinal = FHeaderTable.TableType.AsCardinal then
    Result := FHeaderTable
  else if TableType.AsCardinal = FHorizontalHeader.TableType.AsCardinal then
    Result := FHorizontalHeader
  else if TableType.AsCardinal = FMaximumProfile.TableType.AsCardinal then
    Result := FMaximumProfile
  else if TableType.AsCardinal = FNameTable.TableType.AsCardinal then
    Result := FNameTable
  else if TableType.AsCardinal = FPostScriptTable.TableType.AsCardinal then
    Result := FPostScriptTable
  else
    Result := nil;
end;

procedure TPascalTypeStorageScan.LoadTableFromStream(Stream: TStream;
  TableEntry: TPascalTypeDirectoryTableEntry);
var
  MemoryStream: TMemoryStream;
  TableClass  : TCustomPascalTypeNamedTableClass;
begin
  MemoryStream := TMemoryStream.Create;
  with Stream do
    try
      // set stream position
      Position := TableEntry.Offset;

      // copy from stream
      MemoryStream.CopyFrom(Stream, 4 * ((TableEntry.Length + 3) div 4));

{$IFDEF ChecksumTest}
      ValidateChecksum(MemoryStream, TableEntry);
{$ENDIF}
      // reset memory stream position
      MemoryStream.Seek(soFromBeginning, 0);

      // restore original table length
      MemoryStream.Size := TableEntry.Length;

      TableClass := FindPascalTypeTableByType(TableEntry.TableType);
      if TableClass <> nil then
      begin
        // load table from stream
        if TableClass = TPascalTypeHeaderTable then
          FHeaderTable.LoadFromStream(MemoryStream)
        else if TableClass = TPascalTypeHorizontalHeaderTable then
          FHorizontalHeader.LoadFromStream(MemoryStream)
        else if TableClass = TPascalTypePostscriptTable then
          FPostScriptTable.LoadFromStream(MemoryStream)
        else if TableClass = TPascalTypeMaximumProfileTable then
          FMaximumProfile.LoadFromStream(MemoryStream)
        else if TableClass = TPascalTypeNameTable then
          FNameTable.LoadFromStream(MemoryStream);
      end;

    finally
      FreeAndNil(MemoryStream);
    end;
end;

procedure TPascalTypeStorageScan.SaveToStream(Stream: TStream);
begin
  raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TPascalTypeStorage }

constructor TPascalTypeStorage.Create;
begin
  inherited;

  // create required tables
  FHorizontalMetrics := TPascalTypeHorizontalMetricsTable.Create(Self);
  FCharacterMap := TPascalTypeCharacterMapTable.Create(Self);

  // create optional table list
  FOptionalTables := TObjectList.Create;
end;

destructor TPascalTypeStorage.Destroy;
begin
  FreeAndNil(FHorizontalMetrics);
  FreeAndNil(FCharacterMap);
  FreeAndNil(FOptionalTables);
  FreeAndNil(FOS2Table);
  inherited;
end;

procedure TPascalTypeStorage.DirectoryTableReaded(DirectoryTable
  : TPascalTypeDirectoryTable);
begin
  inherited;

  // clear optional tables
  FOptionalTables.Clear;

  // eventually free OS/2 table
  if Assigned(FOS2Table) then
    FreeAndNil(FOS2Table);
end;

function TPascalTypeStorage.GetAdvanceWidth(GlyphIndex: Integer): Word;
begin
  with FHorizontalMetrics do
  begin
    if (GlyphIndex >= 0) and (GlyphIndex < HorizontalMetricCount) then
      Result := HorizontalMetric[GlyphIndex].AdvanceWidth
    else
      Result := HorizontalMetric[0].AdvanceWidth;
  end;
end;

function TPascalTypeStorage.GetBoundingBox: TRect;
begin
  Result.Left := HeaderTable.XMin;
  Result.Top := HeaderTable.YMax;
  Result.Right := HeaderTable.XMax;
  Result.Bottom := HeaderTable.YMin;
end;

function TPascalTypeStorage.GetGlyphCount: Word;
begin
  Result := FMaximumProfile.NumGlyphs;
end;

function TPascalTypeStorage.GetGlyphData(Index: Integer)
  : TCustomPascalTypeGlyphDataTable;
var
  GlyphDataTable: TTrueTypeFontGlyphDataTable;
begin
  // set default return value
  Result := nil;

  GlyphDataTable := TTrueTypeFontGlyphDataTable(GetTableByTableName('glyf'));
  if Assigned(GlyphDataTable) then
    if (Index >= 0) and (Index < GlyphDataTable.GlyphDataCount) then
      Result := GlyphDataTable.GlyphData[Index];
end;

function TPascalTypeStorage.GetKerning(Last, Next: Integer): Word;
// var
// KernTable : TPascalType
begin
  Result := 0;
  // GetTableByTableType()
end;

function TPascalTypeStorage.GetOptionalTable(Index: Integer)
  : TCustomPascalTypeNamedTable;
begin
  if (Index >= 0) and (Index < FOptionalTables.Count) then
    Result := TCustomPascalTypeNamedTable(FOptionalTables[Index])
  else
    raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeStorage.GetOptionalTableCount: Integer;
begin
  Result := FOptionalTables.Count;
end;

function TPascalTypeStorage.GetPanose: TCustomPascalTypePanoseTable;
begin
  // default result
  Result := nil;

  if Assigned(FOS2Table) then
    if Assigned(FOS2Table.Panose) then
      Result := FOS2Table.Panose
end;

function TPascalTypeStorage.GetTableByTableType(ATableType: TTableType)
  : TCustomPascalTypeNamedTable;
var
  TableIndex: Integer;
begin
  // return nil if the table hasn't been found
  Result := nil;

  if ATableType.AsCardinal = FHeaderTable.TableType.AsCardinal then
    Result := FHeaderTable
  else if ATableType.AsCardinal = FHorizontalHeader.TableType.AsCardinal then
    Result := FHorizontalHeader
  else if ATableType.AsCardinal = FHorizontalMetrics.TableType.AsCardinal then
    Result := FHorizontalMetrics
  else if ATableType.AsCardinal = FCharacterMap.TableType.AsCardinal then
    Result := FCharacterMap
  else if ATableType.AsCardinal = FMaximumProfile.TableType.AsCardinal then
    Result := FMaximumProfile
  else if ATableType.AsCardinal = FNameTable.TableType.AsCardinal then
    Result := FNameTable
  else if ATableType.AsCardinal = FPostScriptTable.TableType.AsCardinal then
    Result := FPostScriptTable
  else
    for TableIndex := 0 to FOptionalTables.Count - 1 do
      with TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]) do
        if ATableType.AsCardinal = TableType.AsCardinal then
          Result := TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]);
end;

function TPascalTypeStorage.ContainsTable(TableType: TTableType): Boolean;
begin
  Result := GetTableByTableType(TableType) <> nil;
end;

function TPascalTypeStorage.GetTableByTableClass
  (TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
var
  TableIndex: Integer;
begin
  // return nil if the table hasn't been found
  Result := nil;

  if TableClass = FHeaderTable.ClassType then
    Result := FHeaderTable
  else if TableClass = FHorizontalHeader.ClassType then
    Result := FHorizontalHeader
  else if TableClass = FHorizontalMetrics.ClassType then
    Result := FHorizontalMetrics
  else if TableClass = FCharacterMap.ClassType then
    Result := FCharacterMap
  else if TableClass = FMaximumProfile.ClassType then
    Result := FMaximumProfile
  else if TableClass = FNameTable.ClassType then
    Result := FNameTable
  else if TableClass = FPostScriptTable.ClassType then
    Result := FPostScriptTable
  else

    for TableIndex := 0 to FOptionalTables.Count - 1 do
      with TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]) do
        if ClassType = TableClass then
          Result := TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]);
end;

function TPascalTypeStorage.GetTableByTableName(
  TableName: TTableName): TCustomPascalTypeNamedTable;
var
  TableIndex: Integer;
begin
  // return nil if the table hasn't been found
  Result := nil;

  if CompareTableType(FHeaderTable.TableType, TableName) then
    Result := FHeaderTable
  else if CompareTableType(FHorizontalHeader.TableType, TableName) then
    Result := FHorizontalHeader
  else if CompareTableType(FHorizontalMetrics.TableType, TableName) then
    Result := FHorizontalMetrics
  else if CompareTableType(FCharacterMap.TableType, TableName) then
    Result := FCharacterMap
  else if CompareTableType(FMaximumProfile.TableType, TableName) then
    Result := FMaximumProfile
  else if CompareTableType(FNameTable.TableType, TableName) then
    Result := FNameTable
  else if CompareTableType(FPostScriptTable.TableType, TableName) then
    Result := FPostScriptTable
  else
    for TableIndex := 0 to FOptionalTables.Count - 1 do
      with TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]) do
        if CompareTableType(TableType, TableName) then
          Result := TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]);
end;

function TPascalTypeStorage.GetTableCount: Integer;
begin
  Result := 7 + FOptionalTables.Count;
end;

procedure TPascalTypeStorage.LoadTableFromStream(Stream: TStream;
  TableEntry: TPascalTypeDirectoryTableEntry);
var
  MemoryStream: TMemoryStream;
  TableClass  : TCustomPascalTypeNamedTableClass;
  CurrentTable: TCustomPascalTypeNamedTable;
begin
  MemoryStream := TMemoryStream.Create;
  with Stream do
    try
      // set stream position
      Position := TableEntry.Offset;

      // copy from stream
      MemoryStream.CopyFrom(Stream, 4 * ((TableEntry.Length + 3) div 4));

{$IFDEF ChecksumTest}
      ValidateChecksum(MemoryStream, TableEntry);
{$ENDIF}
      // reset memory stream position
      MemoryStream.Seek(soFromBeginning, 0);

      // restore original table length
      MemoryStream.Size := TableEntry.Length;

      TableClass := FindPascalTypeTableByType(TableEntry.TableType);
      if TableClass <> nil then
      begin
        CurrentTable := TableClass.Create(Self);
        try
          // load table from stream
          try
            CurrentTable.LoadFromStream(MemoryStream);

            // assign tables
            if TableClass = TPascalTypeHeaderTable then
              FHeaderTable.Assign(CurrentTable)
            else if TableClass = TPascalTypeHorizontalHeaderTable then
              FHorizontalHeader.Assign(CurrentTable)
            else if TableClass = TPascalTypeHorizontalMetricsTable then
              FHorizontalMetrics.Assign(CurrentTable)
            else if TableClass = TPascalTypePostscriptTable then
              FPostScriptTable.Assign(CurrentTable)
            else if TableClass = TPascalTypeMaximumProfileTable then
              FMaximumProfile.Assign(CurrentTable)
            else if TableClass = TPascalTypeNameTable then
              FNameTable.Assign(CurrentTable)
            else if TableClass = TPascalTypeCharacterMapTable then
              FCharacterMap.Assign(CurrentTable)
            else if TableClass = TPascalTypeOS2Table then
            begin
              FOS2Table := TPascalTypeOS2Table(CurrentTable);
              CurrentTable := nil;
            end
            else
            begin
              FOptionalTables.ADD(CurrentTable);
              CurrentTable := nil;
            end;

          except
{$IFDEF IgnoreIncompleteOptionalTables}
            on E: EPascalTypeTableIncomplete do
            begin
              if (TableClass = TPascalTypeHeaderTable) or
                (TableClass = TPascalTypeHorizontalHeaderTable) or
                (TableClass = TPascalTypeHorizontalMetricsTable) or
                (TableClass = TPascalTypePostscriptTable) or
                (TableClass = TPascalTypeMaximumProfileTable) or
                (TableClass = TPascalTypeNameTable) then
                raise;
            end
            else
              raise;
{$ELSE}
            raise
{$ENDIF}
          end;

        finally
          // dispose temporary table
          if Assigned(CurrentTable) then
            FreeAndNil(CurrentTable);
        end;
      end
      else
      begin
        CurrentTable := TPascalTypeUnknownTable.Create(Self,
          TableEntry.TableType);
        CurrentTable.LoadFromStream(Stream);
        FOptionalTables.ADD(CurrentTable);
      end;

    finally
      FreeAndNil(MemoryStream);
    end;
end;

procedure TPascalTypeStorage.SaveToStream(Stream: TStream);
var
  DirectoryTable: TPascalTypeDirectoryTable;
  TableIndex    : Integer;
  NamedTable    : TCustomPascalTypeNamedTable;
  MemoryStream  : TMemoryStream;
begin
  // create directory table
  DirectoryTable := TPascalTypeDirectoryTable.Create;

  with DirectoryTable, Stream do
    try
      ClearAndBuildRequiredEntries;

      // build directory table
      for TableIndex := 0 to FOptionalTables.Count - 1 do
        with TCustomPascalTypeNamedTable(FOptionalTables[TableIndex]) do
          AddTableEntry(TableType);

      // write temporary directory to determine its size
      SaveToStream(Stream);

      // build directory table
      for TableIndex := 0 to TableCount - 1 do
        with TableList[TableIndex] do
        begin
          NamedTable := GetTableByTableType(TableType);
          Assert(Assigned(NamedTable));

          Offset := Stream.Position;
          MemoryStream := TMemoryStream.Create;
          try
            NamedTable.SaveToStream(MemoryStream);

            // store original stream length
            Length := MemoryStream.Size;

            // extend to a modulo 4 size
            MemoryStream.Size := 4 * ((Length + 3) div 4);

            // calculate checksum
            Checksum := CalculateCheckSum(MemoryStream);

            // reset stream position
            MemoryStream.Position := 0;

            // copy streams
            CopyFrom(MemoryStream, Length);
          finally
            FreeAndNil(MemoryStream);
          end;
        end;

      // reset stream position
      Seek(0, soFromBeginning);

      // write final directory
      SaveToStream(Stream);
    finally
      FreeAndNil(DirectoryTable);
    end;
end;

end.
