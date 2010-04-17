unit PT_TablesOpenType;

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
  Classes, Contnrs, PT_Types, PT_Classes, PT_Tables;

type
  TCustomOpenTypeNamedTable = class(TCustomPascalTypeNamedTable)
  protected
    class function GetDisplayName: string; virtual; abstract;
  public
    property DisplayName: string read GetDisplayName;
  end;

  TCustomOpenTypeVersionedNamedTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion : TFixedPoint; // Version of the GDEF table-initially = 0x00010002
    procedure SetVersion(const Value: TFixedPoint);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
  end;

  TCustomOpenTypeClassDefinitionTable = class(TCustomPascalTypeTable)
  protected
    class function GetClassFormat: Word; virtual; abstract;
  public
    property ClassFormat: Word read GetClassFormat;
  end;
  TOpenTypeClassDefinitionTableClass = class of TCustomOpenTypeClassDefinitionTable;


  TOpenTypeClassDefinitionFormat1Table = class(TCustomOpenTypeClassDefinitionTable)
  private
    FStartGlyph      : Word;  // First GlyphID of the ClassValueArray
    FClassValueArray : array of Word; // Array of Class Values-one per GlyphID
    procedure SetStartGlyph(const Value: Word);
    function GetClassValueCount: Integer;
    function GetClassValue(Index: Integer): Word;
  protected
    class function GetClassFormat: Word; override;

    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure StartGlyphChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property StartGlyph: Word read FStartGlyph write SetStartGlyph;
    property ClassValueCount: Integer read GetClassValueCount;
    property ClassValue[Index: Integer]: Word read GetClassValue;
  end;

  TClassRangeRecord = packed record
    StartGlyph : Word;  // First GlyphID in the range
    EndGlyph   : Word;  // Last GlyphID in the range
    GlyphClass : Word;  // Applied to all glyphs in the range
  end;

  TOpenTypeClassDefinitionFormat2Table = class(TCustomOpenTypeClassDefinitionTable)
  private
    FClassRangeRecords : array of TClassRangeRecord;
    function GetClassRangeRecord(Index: Integer): TClassRangeRecord;
    function GetClassRangeRecordCount: Integer; // Array of ClassRangeRecords-ordered by Start GlyphID
  protected
    class function GetClassFormat: Word; override;

    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property ClassRangeRecordCount: Integer read GetClassRangeRecordCount;
    property ClassRangeRecord[Index: Integer]: TClassRangeRecord read GetClassRangeRecord;
  end;

  TOpenTypeMarkGlyphSetTable = class(TCustomPascalTypeTable)
  private
    FTableFormat : Word;              // Format identifier == 1
    FCoverage    : array of Cardinal; // Array of offsets to mark set coverage tables.
    function GetCoverage(Index: Integer): Cardinal;
    function GetCoverageCount: Integer;
    procedure SetTableFormat(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure TableFormatChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property TableFormat: Word read FTableFormat write SetTableFormat;
    property CoverageCount: Integer read GetCoverageCount;
    property Coverage[Index: Integer]: Cardinal read GetCoverage;
  end;


  // table 'BASE'

  TOpenTypeBaselineTagListTable = class(TCustomPascalTypeTable)
  private
    FBaseLineTags : array of TTableType;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TBaseLineScriptRecord = packed record
    Tag          : TTableType;
    ScriptOffset : Word; // still todo see: http://www.microsoft.com/typography/otspec/base.htm
  end;

  TOpenTypeBaselineScriptListTable = class(TCustomPascalTypeTable)
  private
    FBaseLineScript : array of TBaseLineScriptRecord;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TOpenTypeAxisTable = class(TCustomPascalTypeTable)
  private
    FBaseLineTagList : TOpenTypeBaselineTagListTable;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    destructor Destroy; override;
  end;

  TOpenTypeBaselineTable = class(TCustomOpenTypeVersionedNamedTable)
  private
    FHorizontalAxis : TOpenTypeAxisTable;
    FVerticalAxis   : TOpenTypeAxisTable;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'GDEF'

  TOpenTypeGlyphDefinitionTable = class(TCustomOpenTypeVersionedNamedTable)
  private
    FGlyphClassDef      : TCustomOpenTypeClassDefinitionTable; // Class definition table for glyph type
    FAttachList         : Word; // Offset to list of glyphs with attachment points-from beginning of GDEF header (may be NULL)
    FLigCaretList       : Word; // Offset to list of positioning points for ligature carets-from beginning of GDEF header (may be NULL)
    FMarkAttachClassDef : TCustomOpenTypeClassDefinitionTable; // Class definition table for mark attachment type (may be nil)
    FMarkGlyphSetsDef   : TOpenTypeMarkGlyphSetTable; // Table of mark set definitions (may be nil)
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphClassDefinition: TCustomOpenTypeClassDefinitionTable read FGlyphClassDef;
    property MarkAttachmentClassDefinition: TCustomOpenTypeClassDefinitionTable read FMarkAttachClassDef;
    property MarkGlyphSet: TOpenTypeMarkGlyphSetTable read FMarkGlyphSetsDef;
  end;


  TTagOffsetRecord = packed record
    Tag    : TTableType;
    Offset : Word;
  end;

  TCustomOpenTypeLanguageSystemTable = class(TCustomOpenTypeNamedTable)
  private
    FLookupOrder     : Word; // = NULL (reserved for an offset to a reordering table)
    FReqFeatureIndex : Word; // Index of a feature required for this language system- if no required features = 0xFFFF
    FFeatureIndices  : array of Word; // Array of indices into the FeatureList-in arbitrary order
    function GetFeatureIndex(Index: Integer): Word;
    function GetFeatureIndexCount: Integer;
    procedure SetLookupOrder(const Value: Word);
    procedure SetReqFeatureIndex(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    procedure LookupOrderChanged; virtual;
    procedure ReqFeatureIndexChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property LookupOrder: Word read FLookupOrder write SetLookupOrder;
    property RequiredFeatureIndex: Word read FReqFeatureIndex write SetReqFeatureIndex;
    property FeatureIndexCount: Integer read GetFeatureIndexCount;
    property FeatureIndex[Index: Integer]: Word read GetFeatureIndex;
  end;
  TOpenTypeLanguageSystemTableClass = class of TCustomOpenTypeLanguageSystemTable;

  TOpenTypeDefaultLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TCustomOpenTypeScriptTable = class(TCustomOpenTypeNamedTable)
  private
    FDefaultLangSys       : TCustomOpenTypeLanguageSystemTable;
    FLanguageSystemTables : TObjectList;
    function GetLanguageSystemTable(Index: Integer): TCustomOpenTypeLanguageSystemTable;
    function GetLanguageSystemTableCount: Integer;
    procedure SetDefaultLangSys(const Value: TCustomOpenTypeLanguageSystemTable);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property DefaultLangSys: TCustomOpenTypeLanguageSystemTable read FDefaultLangSys write SetDefaultLangSys;
    property LanguageSystemTableCount: Integer read GetLanguageSystemTableCount;
    property LanguageSystemTable[Index: Integer]: TCustomOpenTypeLanguageSystemTable read GetLanguageSystemTable;
  end;
  TOpenTypeScriptTableClass = class of TCustomOpenTypeScriptTable;

  TOpenTypeDefaultLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
  end;

  TOpenTypeScriptListTable = class(TCustomPascalTypeInterfaceTable)
  private
    FLangSysList : TObjectList;
    function GetLanguageSystemCount: Integer;
    function GetLanguageSystem(Index: Integer): TCustomOpenTypeScriptTable;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property LanguageSystemCount: Integer read GetLanguageSystemCount;
    property LanguageSystem[Index: Integer]: TCustomOpenTypeScriptTable read GetLanguageSystem;
  end;

  TCustomOpenTypeFeatureTable = class(TCustomOpenTypeNamedTable)
  private
    FFeatureParams   : Word; // = NULL (reserved for offset to FeatureParams)
    FLookupListIndex : array of Word; // Array of LookupList indices for this feature -zero-based (first lookup is LookupListIndex = 0)
    function GetLookupList(Index: Integer): Word;
    function GetLookupListCount: Integer;
    procedure SetFeatureParams(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure FeatureParamsChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property DisplayName: string read GetDisplayName;
    property FeatureParams: Word read FFeatureParams write SetFeatureParams;
    property LookupListCount: Integer read GetLookupListCount;
    property LookupList[Index: Integer]: Word read GetLookupList;
  end;
  TOpenTypeFeatureTableClass = class of TCustomOpenTypeFeatureTable;

  TOpenTypeFeatureListTable = class(TCustomPascalTypeInterfaceTable)
  private
    FFeatureList : TObjectList;
    function GetFeature(Index: Integer): TCustomOpenTypeFeatureTable;
    function GetFeatureCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property FeatureCount: Integer read GetFeatureCount;
    property Feature[Index: Integer]: TCustomOpenTypeFeatureTable read GetFeature;
  end;

  TCustomOpenTypeCoverageTable = class(TCustomPascalTypeTable)
  protected
    class function GetCoverageFormat: TCoverageFormat; virtual; abstract;
  public
    property Format: TCoverageFormat read GetCoverageFormat;
  end;

  TOpenTypeCoverage1Table = class(TCustomOpenTypeCoverageTable)
  private
    FGlyphArray : array of Word;
    function GetGlyph(Index: Integer): Word;
    function GetGlyphCount: Integer; // Array of GlyphIDs-in numerical order
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    class function GetCoverageFormat: TCoverageFormat; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphCount: Integer read GetGlyphCount;
    property Glyph[Index: Integer]: Word read GetGlyph;
  end;

  TRangeRecord = packed record
    StartGlyph         : Word; // First GlyphID in the range
    EndGlyph           : Word; // Last GlyphID in the range
    StartCoverageIndex : Word; // Coverage Index of first GlyphID in range
  end;

  TOpenTypeCoverage2Table = class(TCustomOpenTypeCoverageTable)
  private
    FRangeArray : array of TRangeRecord;
    function GetRange(Index: Integer): TRangeRecord;
    function GetRangeCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    class function GetCoverageFormat: TCoverageFormat; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property RangeCount: Integer read GetRangeCount;
    property Range[Index: Integer]: TRangeRecord read GetRange;
  end;

  TOpenTypeLookupTable = class(TCustomPascalTypeInterfaceTable)
  private
    FLookupType       : Word; // Different enumerations for GSUB and GPOS
    FLookupFlag       : Word; // Lookup qualifiers
    FMarkFilteringSet : Word; // Index (base 0) into GDEF mark glyph sets structure. This field is only present if bit UseMarkFilteringSet of lookup flags is set.
    FSubtableList     : TObjectList;
    procedure SetLookupFlag(const Value: Word);
    procedure SetLookupType(const Value: Word);
    procedure SetMarkFilteringSet(const Value: Word);
    function GetSubtable(Index: Integer): TCustomOpenTypeCoverageTable;
    function GetSubtableCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure LookupFlagChanged; virtual;
    procedure LookupTypeChanged; virtual;
    procedure MarkFilteringSetChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property LookupType: Word read FLookupType write SetLookupType;
    property LookupFlag: Word read FLookupFlag write SetLookupFlag;
    property MarkFilteringSet: Word read FMarkFilteringSet write SetMarkFilteringSet;

    property SubtableCount: Integer read GetSubtableCount;
    property Subtable[Index: Integer]: TCustomOpenTypeCoverageTable read GetSubtable;
  end;

  TOpenTypeLookupListTable = class(TCustomPascalTypeInterfaceTable)
  private
    FLookupList : TObjectList;
    function GetLookupTableCount: Integer;
    function GetLookupTable(Index: Integer): TOpenTypeLookupTable;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property LookupTableCount: Integer read GetLookupTableCount;
    property LookupTable[Index: Integer]: TOpenTypeLookupTable read GetLookupTable;
  end;

  TCustomOpenTypeCommonTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion          : TFixedPoint; // Version of the GPOS table-initially = 0x00010000
    FScriptListTable  : TOpenTypeScriptListTable;
    FFeatureListTable : TOpenTypeFeatureListTable;
    FLookupListTable  : TOpenTypeLookupListTable;
    procedure SetVersion(const Value: TFixedPoint);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
    property ScriptListTable: TOpenTypeScriptListTable read FScriptListTable;
    property FeatureListTable: TOpenTypeFeatureListTable read FFeatureListTable;
    property LookupListTable: TOpenTypeLookupListTable read FLookupListTable;
  end;


  // table 'GPOS'

  TOpenTypeGlyphPositionTable = class(TCustomOpenTypeCommonTable)
  public
    class function GetTableType: TTableType; override;
  end;


  // table 'GSUB'

  TOpenTypeGlyphSubstitutionTable = class(TCustomOpenTypeCommonTable)
  public
    class function GetTableType: TTableType; override;
  end;

  
  // table 'JSTF'

  // not entirely implemented, for more information see
  // http://www.microsoft.com/typography/otspec/jstf.htm

  TCustomOpenTypeJustificationLanguageSystemTable = class(TCustomOpenTypeNamedTable)
  private
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;
  TOpenTypeJustificationLanguageSystemTableClass = class of TCustomOpenTypeJustificationLanguageSystemTable;

  TOpenTypeJustificationLanguageSystemTable = class(TCustomOpenTypeJustificationLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeExtenderGlyphTable = class(TCustomPascalTypeTable)
  private
    FGlyphID : array of Word; // GlyphIDs-in increasing numerical order
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TCustomOpenTypeJustificationScriptTable = class(TCustomOpenTypeNamedTable)
  private
    FExtenderGlyphTable   : TOpenTypeExtenderGlyphTable;
    FDefaultLangSys       : TCustomOpenTypeJustificationLanguageSystemTable;
    FLanguageSystemTables : TObjectList;
    function GetLanguageSystemTable(Index: Integer): TCustomOpenTypeJustificationLanguageSystemTable;
    function GetLanguageSystemTableCount: Integer;
    procedure SetDefaultLangSys(const Value: TCustomOpenTypeJustificationLanguageSystemTable);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property DefaultLangSys: TCustomOpenTypeJustificationLanguageSystemTable read FDefaultLangSys write SetDefaultLangSys;
    property LanguageSystemTableCount: Integer read GetLanguageSystemTableCount;
    property LanguageSystemTable[Index: Integer]: TCustomOpenTypeJustificationLanguageSystemTable read GetLanguageSystemTable;
  end;

  TOpenTypeJustificationScriptTable = class(TCustomOpenTypeJustificationScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TJustificationScriptDirectoryEntry = packed record
    Tag            : TTableType;
    Offset         : Word;
  end;

  TOpenTypeJustificationTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion     : TFixedPoint; // Version of the JSTF table-initially set to 0x00010000
    FScripts     : TObjectList;
    procedure SetVersion(const Value: TFixedPoint);
    function GetScriptCount: Cardinal;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
    property ScriptCount: Cardinal read GetScriptCount;
  end;




// language system
procedure RegisterLanguageSystem(LanguageSystemClass: TOpenTypeLanguageSystemTableClass);
procedure RegisterLanguageSystems(LanguageSystemClasses: array of TOpenTypeLanguageSystemTableClass);
function FindLanguageSystemByType(TableType: TTableType): TOpenTypeLanguageSystemTableClass;

// scripts
procedure RegisterScript(ScriptClass: TOpenTypeScriptTableClass);
procedure RegisterScripts(ScriptClasses: array of TOpenTypeScriptTableClass);
function FindScriptByType(TableType: TTableType): TOpenTypeScriptTableClass;

// features
procedure RegisterFeature(FeatureClass: TOpenTypeFeatureTableClass);
procedure RegisterFeatures(FeaturesClasses: array of TOpenTypeFeatureTableClass);
function FindFeatureByType(TableType: TTableType): TOpenTypeFeatureTableClass;

// justification language system
procedure RegisterJustificationLanguageSystem(LanguageSystemClass: TOpenTypeJustificationLanguageSystemTableClass);
procedure RegisterJustificationLanguageSystems(LanguageSystemClasses: array of TOpenTypeJustificationLanguageSystemTableClass);
function FindJustificationLanguageSystemByType(TableType: TTableType): TOpenTypeJustificationLanguageSystemTableClass;

var
  GFeatureClasses : array of TOpenTypeFeatureTableClass;
  GLanguageSystemClasses : array of TOpenTypeLanguageSystemTableClass;
  GScriptClasses : array of TOpenTypeScriptTableClass;
  GJustificationLanguageSystemClasses : array of TOpenTypeJustificationLanguageSystemTableClass;

implementation

uses
  Math, SysUtils, PT_Math, PT_ResourceStrings, PT_TablesOpenTypeFeatures;


{ TCustomOpenTypeVersionedNamedTable }

procedure TCustomOpenTypeVersionedNamedTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TOpenTypeBaselineTable(Dest) do
   begin
    FVersion := Self.FVersion;
   end;
end;

procedure TCustomOpenTypeVersionedNamedTable.ResetToDefaults;
begin
 inherited;
 FVersion.Fract := 0;
 FVersion.Value := 1;
end;

procedure TCustomOpenTypeVersionedNamedTable.LoadFromStream(Stream: TStream);
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read version
   FVersion := TFixedPoint(ReadSwappedCardinal(Stream));
  end;
end;

procedure TCustomOpenTypeVersionedNamedTable.SaveToStream(Stream: TStream);
begin
 inherited;

 // write version
 WriteSwappedCardinal(Stream, Cardinal(Version));
end;

procedure TCustomOpenTypeVersionedNamedTable.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TCustomOpenTypeVersionedNamedTable.VersionChanged;
begin
 Changed;
end;


{ TCustomOpenTypeClassDefinitionTable }


{ TOpenTypeClassDefinitionFormat1Table }

procedure TOpenTypeClassDefinitionFormat1Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeClassDefinitionFormat1Table(Dest) do
   begin
    FStartGlyph := Self.FStartGlyph;
    FClassValueArray := Self.FClassValueArray;
   end
  else inherited;
end;

class function TOpenTypeClassDefinitionFormat1Table.GetClassFormat: Word;
begin
 Result := 1;
end;

function TOpenTypeClassDefinitionFormat1Table.GetClassValue(
  Index: Integer): Word;
begin
 if (Index >= 0) and (Index < Length(FClassValueArray))
  then Result := FClassValueArray[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeClassDefinitionFormat1Table.GetClassValueCount: Integer;
begin
 Result := Length(FClassValueArray);
end;

procedure TOpenTypeClassDefinitionFormat1Table.ResetToDefaults;
begin
 inherited;
 FStartGlyph := 0;
 SetLength(FClassValueArray, 0);
end;

procedure TOpenTypeClassDefinitionFormat1Table.LoadFromStream(Stream: TStream);
var
  ArrayIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read start glyph
   FStartGlyph := ReadSwappedWord(Stream);

   // read ClassValueArray length
   SetLength(FClassValueArray, ReadSwappedWord(Stream));

   // read ClassValueArray
   for ArrayIndex := 0 to Length(FClassValueArray) - 1
    do FClassValueArray[ArrayIndex] := ReadSwappedWord(Stream);
  end;
end;

procedure TOpenTypeClassDefinitionFormat1Table.SaveToStream(Stream: TStream);
var
  ArrayIndex : Integer;
begin
 inherited;

 // write start glyph
 WriteSwappedWord(Stream, FStartGlyph);

 // write ClassValueArray length
 WriteSwappedWord(Stream, Length(FClassValueArray));

 // write ClassValueArray
 for ArrayIndex := 0 to Length(FClassValueArray) - 1
  do WriteSwappedWord(Stream, FClassValueArray[ArrayIndex]);
end;

procedure TOpenTypeClassDefinitionFormat1Table.SetStartGlyph(const Value: Word);
begin
 if FStartGlyph <> Value then
  begin
   FStartGlyph := Value;
   StartGlyphChanged;
  end;
end;

procedure TOpenTypeClassDefinitionFormat1Table.StartGlyphChanged;
begin
 Changed;
end;


{ TOpenTypeClassDefinitionFormat2Table }

procedure TOpenTypeClassDefinitionFormat2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeClassDefinitionFormat1Table(Dest) do
   begin
    FClassRangeRecords := Self.FClassRangeRecords;
   end
  else inherited;
end;

class function TOpenTypeClassDefinitionFormat2Table.GetClassFormat: Word;
begin
 Result := 2;
end;

function TOpenTypeClassDefinitionFormat2Table.GetClassRangeRecord(
  Index: Integer): TClassRangeRecord;
begin
 if (Index >= 0) and (Index < Length(FClassRangeRecords))
  then Result := FClassRangeRecords[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeClassDefinitionFormat2Table.GetClassRangeRecordCount: Integer;
begin
 Result := Length(FClassRangeRecords);
end;

procedure TOpenTypeClassDefinitionFormat2Table.ResetToDefaults;
begin
 inherited;
 SetLength(FClassRangeRecords, 0);
end;

procedure TOpenTypeClassDefinitionFormat2Table.LoadFromStream(Stream: TStream);
var
  ArrayIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read ClassRangeRecords length
   SetLength(FClassRangeRecords, ReadSwappedWord(Stream));

   // read ClassRangeRecords
   for ArrayIndex := 0 to Length(FClassRangeRecords) - 1 do
    with FClassRangeRecords[ArrayIndex] do
     begin
      // read start glyph
      StartGlyph := ReadSwappedWord(Stream);

      // read end glyph
      EndGlyph := ReadSwappedWord(Stream);

      // read glyph class
      GlyphClass := ReadSwappedWord(Stream);
     end;
  end;
end;

procedure TOpenTypeClassDefinitionFormat2Table.SaveToStream(Stream: TStream);
begin
 inherited;

 // write ClassRangeRecords length
 WriteSwappedWord(Stream, Length(FClassRangeRecords));
end;


{ TOpenTypeMarkGlyphSetTable }

procedure TOpenTypeMarkGlyphSetTable.AssignTo(
  Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeMarkGlyphSetTable(Dest) do
   begin
    FTableFormat := Self.FTableFormat;
    FCoverage := Self.FCoverage;
   end
  else inherited;
end;

function TOpenTypeMarkGlyphSetTable.GetCoverage(
  Index: Integer): Cardinal;
begin
 if (Index >= 0) and (Index < Length(FCoverage))
  then Result := FCoverage[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeMarkGlyphSetTable.GetCoverageCount: Integer;
begin
 Result := Length(FCoverage);
end;

procedure TOpenTypeMarkGlyphSetTable.ResetToDefaults;
begin
 inherited;
 FTableFormat := 1;
 SetLength(FCoverage, 0);
end;

procedure TOpenTypeMarkGlyphSetTable.LoadFromStream(
  Stream: TStream);
var
  CoverageIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read version
   FTableFormat := ReadSwappedWord(Stream);

   if FTableFormat > 1
    then raise EPascalTypeError.Create(RCStrUnknownVersion);

   // read coverage length
   SetLength(FCoverage, ReadSwappedWord(Stream));

   // check (minimum) table size
   if Position + Length(FCoverage) * SizeOf(Cardinal) > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read coverage data
   for CoverageIndex := 0 to Length(FCoverage) - 1
    do FCoverage[CoverageIndex] := ReadSwappedCardinal(Stream);
  end;
end;

procedure TOpenTypeMarkGlyphSetTable.SaveToStream(
  Stream: TStream);
var
  CoverageIndex : Integer;
begin
 inherited;

 // write table format
 WriteSwappedWord(Stream, FTableFormat);

 // write coverage length
 WriteSwappedWord(Stream, Length(FCoverage));

 // write coverage data
 for CoverageIndex := 0 to Length(FCoverage) - 1
  do WriteSwappedCardinal(Stream, FCoverage[CoverageIndex]);
end;

procedure TOpenTypeMarkGlyphSetTable.SetTableFormat(
  const Value: Word);
begin
 if FTableFormat <> Value then
  begin
   FTableFormat := Value;
   TableFormatChanged;
  end;
end;

procedure TOpenTypeMarkGlyphSetTable.TableFormatChanged;
begin
 Changed;
end;


{ TOpenTypeBaselineTagListTable }

procedure TOpenTypeBaselineTagListTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TOpenTypeBaselineTagListTable(Dest) do
   begin
    FBaseLineTags := Self.FBaseLineTags;
   end;
end;

procedure TOpenTypeBaselineTagListTable.ResetToDefaults;
begin
 inherited;
 SetLength(FBaseLineTags, 0);
end;

procedure TOpenTypeBaselineTagListTable.LoadFromStream(Stream: TStream);
var
  TagIndex : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read baseline tag list array length
   SetLength(FBaseLineTags, ReadSwappedWord(Stream));

   // check if table is complete
   if Position + 4 * Length(FBaseLineTags) > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read baseline array data
   for TagIndex := 0 to Length(FBaseLineTags) - 1
    do Read(FBaseLineTags[TagIndex], SizeOf(TTableType));
  end;
end;

procedure TOpenTypeBaselineTagListTable.SaveToStream(Stream: TStream);
var
  TagIndex : Word;
begin
 inherited;

 with Stream do
  begin
   // write baseline tag list array length
   WriteSwappedWord(Stream, Length(FBaseLineTags));

   // write baseline array data
   for TagIndex := 0 to Length(FBaseLineTags) - 1
    do Write(FBaseLineTags[TagIndex], SizeOf(TTableType));
  end;
end;


{ TOpenTypeBaselineScriptListTable }

procedure TOpenTypeBaselineScriptListTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TOpenTypeBaselineScriptListTable(Dest) do
   begin
    FBaseLineScript := Self.FBaseLineScript;
   end;
end;

procedure TOpenTypeBaselineScriptListTable.ResetToDefaults;
begin
 inherited;
 SetLength(FBaseLineScript, 0);
end;

procedure TOpenTypeBaselineScriptListTable.LoadFromStream(Stream: TStream);
var
  ScriptIndex : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read baseline stript list array length
   SetLength(FBaseLineScript, ReadSwappedWord(Stream));

   // check if table is complete
   if Position + 6 * Length(FBaseLineScript) > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read baseline array data
   for ScriptIndex := 0 to Length(FBaseLineScript) - 1 do
    begin
     // read tag
     Read(FBaseLineScript[ScriptIndex].Tag, SizeOf(TTableType));

     // read script offset
     FBaseLineScript[ScriptIndex].ScriptOffset := ReadSwappedWord(Stream);
    end;
  end;
end;

procedure TOpenTypeBaselineScriptListTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TOpenTypeAxisTable }

destructor TOpenTypeAxisTable.Destroy;
begin
 FreeAndNil(FBaseLineTagList);
 inherited;
end;

procedure TOpenTypeAxisTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TOpenTypeAxisTable(Dest) do
   begin
    // check if baseline tag list table needs to be assigned
    if Assigned(Self.FBaseLineTagList) then
     begin
      // eventually create new destination baseline tag list table
      if not Assigned(FBaseLineTagList)
       then FBaseLineTagList := TOpenTypeBaselineTagListTable.Create;

      // assign baseline tag list table
      FBaseLineTagList.Assign(Self.FBaseLineTagList);
     end else
    if Assigned(FBaseLineTagList) then FreeAndNil(FBaseLineTagList);

   end;
end;

procedure TOpenTypeAxisTable.ResetToDefaults;
begin
 inherited;
 if Assigned(FBaseLineTagList)
  then FreeAndNil(FBaseLineTagList);
end;

procedure TOpenTypeAxisTable.LoadFromStream(Stream: TStream);
var
  StartPos : Int64;
  Value16  : Word;
begin
 inherited;

 with Stream do
  begin
   // remember start position
   StartPos := Position;

   // check (minimum) table size
   if Position + 4 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read baseline tag list table offset (maybe 0)
   Read(Value16, SizeOf(Word));
   if Value16 > 0 then
    begin
     // locate baseline tag list table
     Position := StartPos + Value16;

     // eventually create baseline tag list table
     if not Assigned(FBaseLineTagList)
      then FBaseLineTagList := TOpenTypeBaselineTagListTable.Create;

     // load baseline tag list table from stream
     FBaseLineTagList.LoadFromStream(Stream);
    end;
  end;
end;

procedure TOpenTypeAxisTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TOpenTypeBaselineTable }

destructor TOpenTypeBaselineTable.Destroy;
begin
 if Assigned(FHorizontalAxis) then FreeAndNil(FHorizontalAxis);
 if Assigned(FVerticalAxis) then FreeAndNil(FVerticalAxis);
 inherited;
end;

procedure TOpenTypeBaselineTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TOpenTypeBaselineTable(Dest) do
   begin
    // check if horizontal axis needs to be assigned
    if Assigned(Self.FHorizontalAxis) then
     begin
      // eventually create new destination axis table
      if not Assigned(FHorizontalAxis)
       then FHorizontalAxis := TOpenTypeAxisTable.Create;

      // assign horizontal axis table
      FHorizontalAxis.Assign(Self.FHorizontalAxis);
     end else
    if Assigned(FHorizontalAxis) then FreeAndNil(FHorizontalAxis);

    // check if vertical axis needs to be assigned
    if Assigned(Self.FVerticalAxis) then
     begin
      // eventually create new destination axis table
      if not Assigned(FVerticalAxis)
       then FVerticalAxis := TOpenTypeAxisTable.Create;

      // assign horizontal axis table
      FVerticalAxis.Assign(Self.FVerticalAxis);
     end else
    if Assigned(FVerticalAxis) then FreeAndNil(FVerticalAxis);

   end;
end;

class function TOpenTypeBaselineTable.GetTableType: TTableType;
begin
 Result := 'BASE';
end;

procedure TOpenTypeBaselineTable.ResetToDefaults;
begin
 inherited;
 if Assigned(FHorizontalAxis) then FreeAndNil(FHorizontalAxis);
 if Assigned(FVerticalAxis) then FreeAndNil(FVerticalAxis);
end;

procedure TOpenTypeBaselineTable.LoadFromStream(Stream: TStream);
var
  StartPos : Int64;
  Value16  : Word;
begin
 inherited;

 with Stream do
  begin
   // check version alread read
   if Version.Value <> 1
    then raise Exception.Create(RCStrUnsupportedVersion);

   // remember start position as position minus the version already read
   StartPos := Position - 4;

   // check (minimum) table size
   if Position + 4 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read horizontal axis table offset (maybe 0)
   Read(Value16, SizeOf(Word));
   if Value16 > 0 then
    begin
     // locate horizontal axis table
     Position := StartPos + Value16;

     // eventually create horizontal axis table
     if not Assigned(FHorizontalAxis)
      then FHorizontalAxis := TOpenTypeAxisTable.Create;

     // load horizontal axis table from stream
     FHorizontalAxis.LoadFromStream(Stream);
    end;

   // read vertical axis table offset (maybe 0)
   Read(Value16, SizeOf(Word));
   if Value16 > 0 then
    begin
     // locate horizontal axis table
     Position := StartPos + Value16;

     // eventually create horizontal axis table
     if not Assigned(FVerticalAxis)
      then FVerticalAxis := TOpenTypeAxisTable.Create;

     // load horizontal axis table from stream
     FVerticalAxis.LoadFromStream(Stream);
    end;

  end;
end;

procedure TOpenTypeBaselineTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TOpenTypeGlyphDefinitionTable }

destructor TOpenTypeGlyphDefinitionTable.Destroy;
begin
 FreeAndNil(FGlyphClassDef);
 FreeAndNil(FMarkAttachClassDef);
 FreeAndNil(FMarkGlyphSetsDef);
 inherited;
end;

procedure TOpenTypeGlyphDefinitionTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeGlyphDefinitionTable(Dest) do
   begin
    FAttachList       := Self.FAttachList;
    FLigCaretList     := Self.FLigCaretList;
    FMarkGlyphSetsDef := Self.FMarkGlyphSetsDef;

    FGlyphClassDef.Assign(Self.FGlyphClassDef);
    FMarkAttachClassDef.Assign(Self.FMarkAttachClassDef);
    FMarkGlyphSetsDef.Assign(Self.FMarkGlyphSetsDef);
   end
 else inherited;
end;

class function TOpenTypeGlyphDefinitionTable.GetTableType: TTableType;
begin
 Result := 'GDEF';
end;

procedure TOpenTypeGlyphDefinitionTable.ResetToDefaults;
const
  CGlyphDefinitionDefaultVersion : Cardinal = $10002;
begin
 FVersion := TFixedPoint(CGlyphDefinitionDefaultVersion);
 FAttachList := 0;
 FLigCaretList := 0;
end;

procedure TOpenTypeGlyphDefinitionTable.LoadFromStream(Stream: TStream);
var
  StartPos            : Int64;
  Value16             : Word;
  GlyphClassDefOffset : Word;
  MarkAttClassDefOffs : Word;
  MarkGlyphSetsDefOff : Word;
begin
 inherited;

 with Stream do
  begin
   // check version alread read
   if Version.Value <> 1
    then raise Exception.Create(RCStrUnsupportedVersion);

   // remember start position as position minus the version already read
   StartPos := Position - 4;

   // check if table is complete
   if Position + 10 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read glyph class definition offset
   GlyphClassDefOffset := ReadSwappedWord(Stream);

   // read attach list
   FAttachList := ReadSwappedWord(Stream);

   // read ligature caret list
   FLigCaretList := ReadSwappedWord(Stream);

   // read mark attach class definition offset
   MarkAttClassDefOffs := ReadSwappedWord(Stream);

   // read mark glyph set offset
   MarkGlyphSetsDefOff := ReadSwappedWord(Stream);

   // eventually free existing class definition
   if Assigned(FGlyphClassDef)
    then FreeAndNil(FGlyphClassDef);


   // eventually read glyph class
   if GlyphClassDefOffset <> 0 then
    begin
     Position := StartPos + GlyphClassDefOffset;

     // read class definition format
     Read(Value16, SizeOf(Word));
     case Swap16(Value16) of
      1 : FGlyphClassDef := TOpenTypeClassDefinitionFormat1Table.Create;
      2 : FGlyphClassDef := TOpenTypeClassDefinitionFormat2Table.Create;
      else raise Exception.Create(RCStrUnknownClassDefinition);
     end;

     if Assigned(FGlyphClassDef)
      then FGlyphClassDef.LoadFromStream(Stream);
    end;


   // eventually free existing class definition
   if Assigned(FMarkAttachClassDef)
    then FreeAndNil(FMarkAttachClassDef);

   // eventually read mark attachment class definition
   if MarkAttClassDefOffs <> 0 then
    begin
     Position := StartPos + MarkAttClassDefOffs;

     // read class definition format
     Read(Value16, SizeOf(Word));
     case Swap16(Value16) of
      1 : FMarkAttachClassDef := TOpenTypeClassDefinitionFormat1Table.Create;
      2 : FMarkAttachClassDef := TOpenTypeClassDefinitionFormat2Table.Create;
      else raise Exception.Create(RCStrUnknownClassDefinition);
     end;

     if Assigned(FMarkAttachClassDef)
      then FMarkAttachClassDef.LoadFromStream(Stream);
    end;


   // eventually read mark glyph set (otherwise free existing glyph set)
   if MarkGlyphSetsDefOff <> 0 then
    begin
     Position := StartPos + MarkGlyphSetsDefOff;

     // eventually create new mark glyph set
     if not Assigned(FMarkGlyphSetsDef)
      then FMarkGlyphSetsDef := TOpenTypeMarkGlyphSetTable.Create;

     FMarkGlyphSetsDef.LoadFromStream(Stream);
    end else
   if Assigned(FMarkGlyphSetsDef) then FreeAndNil(FMarkGlyphSetsDef);
   
  end;
end;

procedure TOpenTypeGlyphDefinitionTable.SaveToStream(Stream: TStream);
var
  StartPos : Int64;
  Offsets  : array [0..4] of Word;
begin
 inherited;

 with Stream do
  begin
   // remember start position as position minus version aready written
   StartPos := Position - 4;

   // reset offset array to zero
   FillChar(Offsets[0], 5 * SizeOf(Word), 0);

   // skip directory for now
   Seek(SizeOf(Offsets), soCurrent);

   // write glyph class definition
   if Assigned(FGlyphClassDef) then
    begin
     Offsets[0] := Word(Position - StartPos);
     FGlyphClassDef.SaveToStream(Stream);
    end;

(*
   // write attachment list
   if Assigned(FAttachList) then
    begin
     Offsets[1] := Word(Position - StartPos);
     FAttachList.SaveToStream(Stream);
    end;

   // write ligature caret list
   if Assigned(FLigCaretList) then
    begin
     Offsets[2] := Word(Position - StartPos);
     FLigCaretList.SaveToStream(Stream);
    end;
*)

   // write mark attachment class definition
   if Assigned(FMarkAttachClassDef) then
    begin
     Offsets[3] := Word(Position - StartPos);
     FMarkAttachClassDef.SaveToStream(Stream);
    end;

   // write mark glyph set definition
   if Assigned(FMarkGlyphSetsDef) then
    begin
     Offsets[4] := Word(Position - StartPos);
     FMarkGlyphSetsDef.SaveToStream(Stream);
    end;

   // skip directory for now
   Position := StartPos + SizeOf(TFixedPoint);

   // write directory

   // write glyph class definition
   WriteSwappedWord(Stream, Offsets[0]);

   // write attach list
   WriteSwappedWord(Stream, Offsets[1]);

   // write ligature caret list
   WriteSwappedWord(Stream, Offsets[2]);

   // write mark attach class definition
   WriteSwappedWord(Stream, Offsets[3]);

   // write mark glyph set
   WriteSwappedWord(Stream, Offsets[4]);
  end;
end;


{ TCustomOpenTypeLanguageSystemTable }

constructor TCustomOpenTypeLanguageSystemTable.Create(Storage: IPascalTypeStorageTable);
begin
 inherited Create(Storage);
end;

destructor TCustomOpenTypeLanguageSystemTable.Destroy;
begin
 inherited;
end;

function TCustomOpenTypeLanguageSystemTable.GetFeatureIndex(Index: Integer): Word;
begin
 if (Index >= 0) and (Index < Length(FFeatureIndices))
  then Result := FFeatureIndices[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TCustomOpenTypeLanguageSystemTable.GetFeatureIndexCount: Integer;
begin
 Result := Length(FFeatureIndices);
end;

procedure TCustomOpenTypeLanguageSystemTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomOpenTypeLanguageSystemTable(Dest) do
   begin
    FLookupOrder     := Self.FLookupOrder;
    FReqFeatureIndex := Self.FReqFeatureIndex;
    FFeatureIndices  := Self.FFeatureIndices;
   end
 else inherited;
end;

procedure TCustomOpenTypeLanguageSystemTable.ResetToDefaults;
begin
 FLookupOrder     := 0;
 FReqFeatureIndex := 0;
 SetLength(FFeatureIndices, 0);
end;

procedure TCustomOpenTypeLanguageSystemTable.LoadFromStream(Stream: TStream);
var
  FeatureIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 6 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read default language system
   FLookupOrder := ReadSwappedWord(Stream);

   // read index of a feature required for this language system
   FReqFeatureIndex := ReadSwappedWord(Stream);

   // read default language system
   SetLength(FFeatureIndices, ReadSwappedWord(Stream));

   // read default language system
   for FeatureIndex := 0 to Length(FFeatureIndices) - 1
    do FFeatureIndices[FeatureIndex] := ReadSwappedWord(Stream);
  end;
end;

procedure TCustomOpenTypeLanguageSystemTable.SaveToStream(Stream: TStream);
var
  FeatureIndex : Integer;
begin
 inherited;

 // write default language system
 WriteSwappedWord(Stream, FLookupOrder);

 // write index of a feature required for this language system
 WriteSwappedWord(Stream, FReqFeatureIndex);

 // write default language system
 WriteSwappedWord(Stream, Length(FFeatureIndices));

 // write default language systems
 for FeatureIndex := 0 to Length(FFeatureIndices) - 1
  do WriteSwappedWord(Stream, FFeatureIndices[FeatureIndex]);
end;

procedure TCustomOpenTypeLanguageSystemTable.SetLookupOrder(const Value: Word);
begin
 if FLookupOrder <> Value then
  begin
   FLookupOrder := Value;
   LookupOrderChanged;
  end;
end;

procedure TCustomOpenTypeLanguageSystemTable.SetReqFeatureIndex(
  const Value: Word);
begin
 if FReqFeatureIndex <> Value then
  begin
   FReqFeatureIndex := Value;
   ReqFeatureIndexChanged;
  end;
end;

procedure TCustomOpenTypeLanguageSystemTable.LookupOrderChanged;
begin
 Changed;
end;

procedure TCustomOpenTypeLanguageSystemTable.ReqFeatureIndexChanged;
begin
 Changed;
end;


{ TOpenTypeDefaultLanguageSystemTable }

class function TOpenTypeDefaultLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Default';
end;

class function TOpenTypeDefaultLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DFLT';
end;


{ TOpenTypeDefaultLanguageSystemTables }

class function TOpenTypeDefaultLanguageSystemTables.GetDisplayName: string;
begin
 Result := 'Default';
end;

class function TOpenTypeDefaultLanguageSystemTables.GetTableType: TTableType;
begin
 Result := 'DFLT';
end;

procedure TOpenTypeDefaultLanguageSystemTables.LoadFromStream(Stream: TStream);
begin
 inherited;

 Assert(DefaultLangSys <> nil);
 Assert(LanguageSystemTableCount = 0);
end;


{ TCustomOpenTypeScriptTable }

constructor TCustomOpenTypeScriptTable.Create(
  Storage: IPascalTypeStorageTable);
begin
 FLanguageSystemTables := TObjectList.Create;
 inherited Create(Storage);
end;

destructor TCustomOpenTypeScriptTable.Destroy;
begin
 if Assigned(FDefaultLangSys)
  then FreeAndNil(FDefaultLangSys);

 FreeAndNil(FLanguageSystemTables);

 inherited;
end;

function TCustomOpenTypeScriptTable.GetLanguageSystemTable(
  Index: Integer): TCustomOpenTypeLanguageSystemTable;
begin
 if (Index >= 0) and (Index < FLanguageSystemTables.Count)
  then Result := TCustomOpenTypeLanguageSystemTable(FLanguageSystemTables[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TCustomOpenTypeScriptTable.GetLanguageSystemTableCount: Integer;
begin
 Result := FLanguageSystemTables.Count;
end;

procedure TCustomOpenTypeScriptTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomOpenTypeScriptTable(Dest) do
   begin
    FLanguageSystemTables.Assign(Self.FLanguageSystemTables);

    if Assigned(Self.FDefaultLangSys) then
     begin
      if not Assigned(FDefaultLangSys)
       then FDefaultLangSys := TOpenTypeDefaultLanguageSystemTable.Create(FStorage);

      FDefaultLangSys.Assign(Self.FDefaultLangSys);
     end else
    if Assigned(FDefaultLangSys)
     then FreeAndNil(FDefaultLangSys);
   end
 else inherited;
end;

procedure TCustomOpenTypeScriptTable.ResetToDefaults;
begin
 FLanguageSystemTables.Clear;
end;

procedure TCustomOpenTypeScriptTable.LoadFromStream(Stream: TStream);
var
  StartPos       : Int64;
  LangSysIndex   : Integer;
  LangSysRecords : array of TTagOffsetRecord;
  LangTable      : TCustomOpenTypeJustificationLanguageSystemTable;
  LangTableClass : TOpenTypeJustificationLanguageSystemTableClass;
  DefaultLangSys : Word;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if Position + 4 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read default language system offset
   DefaultLangSys := ReadSwappedWord(Stream);

   // read language system record count
   SetLength(LangSysRecords, ReadSwappedWord(Stream));

   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    begin
     // read table type
     Read(LangSysRecords[LangSysIndex].Tag, SizeOf(TTableType));

     // read offset
     LangSysRecords[LangSysIndex].Offset := ReadSwappedWord(Stream);
    end;

   // load default language system
   if DefaultLangSys <> 0 then
    begin
     Position := StartPos + DefaultLangSys;

     if not Assigned(FDefaultLangSys)
      then FDefaultLangSys := TOpenTypeDefaultLanguageSystemTable.Create(FStorage);

     FDefaultLangSys.LoadFromStream(Stream);
    end else
   if Assigned(FDefaultLangSys)
    then FreeAndNil(FDefaultLangSys);

   // clear existing language tables
   FLanguageSystemTables.Clear;

   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    begin
     LangTableClass := FindJustificationLanguageSystemByType(LangSysRecords[LangSysIndex].Tag);

     if Assigned(LangTableClass) then
      begin
       // create language table entry
       LangTable := LangTableClass.Create(FStorage);

       // set position
       Position := StartPos + LangSysRecords[LangSysIndex].Offset;

       // read language system table entry from stream
       LangTable.LoadFromStream(Stream);

       // add to language system tables
       FLanguageSystemTables.Add(LangTable);
      end;
    end;
  end;
end;

procedure TCustomOpenTypeScriptTable.SaveToStream(Stream: TStream);
var
  StartPos       : Int64;
  LangSysIndex   : Integer;
  LangSysRecords : array of TTagOffsetRecord;
  Value16        : Word;
begin
 inherited;

 with Stream do
  begin
   // remember start position of the stream
   StartPos := Position;

   // write default language system offset
   if Assigned(FDefaultLangSys)
    then Value16 := 4 + 6 * FLanguageSystemTables.Count
    else Value16 := 0;
   Write(Value16, SizeOf(Word));

   // write feature list count
   WriteSwappedWord(Stream, FLanguageSystemTables.Count);

   // leave space for feature directory
   Seek(6 * FLanguageSystemTables.Count, soCurrent);

   // eventually write default language system
   if Assigned(FDefaultLangSys)
    then FDefaultLangSys.SaveToStream(Stream);

   // build directory (to be written later) and write data
   SetLength(LangSysRecords, FLanguageSystemTables.Count);
   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    with TCustomOpenTypeLanguageSystemTable(FLanguageSystemTables[LangSysIndex]) do
     begin
      // get table type
      LangSysRecords[LangSysIndex].Tag := TableType;
      LangSysRecords[LangSysIndex].Offset := Position;

      // write feature to stream
      SaveToStream(Stream);
     end;

   // write directory
   Position := StartPos + 4;

   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    with LangSysRecords[LangSysIndex] do
     begin
      // write tag
      Write(Tag, SizeOf(TTableType));

      // write offset
      WriteSwappedWord(Stream, Offset);
     end;
  end;
end;

procedure TCustomOpenTypeScriptTable.SetDefaultLangSys(
  const Value: TCustomOpenTypeLanguageSystemTable);
begin
 FDefaultLangSys.Assign(Value);
 Changed;
end;


{ TOpenTypeScriptListTable }

constructor TOpenTypeScriptListTable.Create(Storage: IPascalTypeStorageTable);
begin
 FLangSysList := TObjectList.Create;
 inherited Create(Storage);
end;

destructor TOpenTypeScriptListTable.Destroy;
begin
 FreeAndNil(FLangSysList);
 inherited;
end;

function TOpenTypeScriptListTable.GetLanguageSystem(
  Index: Integer): TCustomOpenTypeScriptTable;
begin
 if (Index >= 0) and (Index < FLangSysList.Count)
  then Result := TCustomOpenTypeScriptTable(FLangSysList[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeScriptListTable.GetLanguageSystemCount: Integer;
begin
 Result := FLangSysList.Count;
end;

procedure TOpenTypeScriptListTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeScriptListTable(Dest) do
   begin
    FLangSysList.Assign(Self.FLangSysList);
   end
 else inherited;
end;

procedure TOpenTypeScriptListTable.ResetToDefaults;
begin
 FLangSysList.Clear;
end;

procedure TOpenTypeScriptListTable.LoadFromStream(Stream: TStream);
var
  StartPos         : Int64;
  ScriptIndex      : Integer;
  ScriptList       : array of TTagOffsetRecord;
  ScriptTable      : TCustomOpenTypeScriptTable;
  ScriptTableClass : TOpenTypeScriptTableClass;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read script list count
   SetLength(ScriptList, ReadSwappedWord(Stream));

   for ScriptIndex := 0 to Length(ScriptList) - 1 do
    begin
     // read table type
     Read(ScriptList[ScriptIndex].Tag, SizeOf(TTableType));

     // read offset
     ScriptList[ScriptIndex].Offset := ReadSwappedWord(Stream);
    end;

   // clear language system list
   FLangSysList.Clear;

   for ScriptIndex := 0 to Length(ScriptList) - 1 do
    begin
     // find language class
     ScriptTableClass := FindScriptByType(ScriptList[ScriptIndex].Tag);

     if Assigned(ScriptTableClass) then
      begin
       // create language system entry
       ScriptTable := ScriptTableClass.Create(FStorage);

       // set position to actual script list entry
       Position := StartPos + ScriptList[ScriptIndex].Offset;

       // load from stream
       ScriptTable.LoadFromStream(Stream);

       // add to language system list
       FLangSysList.Add(ScriptTable)
      end;
    end;
  end;
end;

procedure TOpenTypeScriptListTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TCustomOpenTypeFeatureTable }

constructor TCustomOpenTypeFeatureTable.Create(Storage: IPascalTypeStorageTable);
begin
 inherited;
end;

destructor TCustomOpenTypeFeatureTable.Destroy;
begin
 inherited;
end;

procedure TCustomOpenTypeFeatureTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomOpenTypeFeatureTable(Dest) do
   begin
    FFeatureParams   := Self.FFeatureParams;
    FLookupListIndex := Self.FLookupListIndex;
   end
 else inherited;
end;

procedure TCustomOpenTypeFeatureTable.ResetToDefaults;
begin
 FFeatureParams := 0;
 SetLength(FLookupListIndex, 0);
end;

function TCustomOpenTypeFeatureTable.GetLookupList(Index: Integer): Word;
begin
 if (Index >= 0) and (Index < Length(FLookupListIndex))
  then Result := FLookupListIndex[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TCustomOpenTypeFeatureTable.GetLookupListCount: Integer;
begin
 Result := Length(FLookupListIndex);
end;

procedure TCustomOpenTypeFeatureTable.LoadFromStream(Stream: TStream);
var
  LookupIndex : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read feature parameter offset
   FFeatureParams := ReadSwappedWord(Stream);

   // read lookup count
   SetLength(FLookupListIndex, ReadSwappedWord(Stream));

   // read lookup list index offsets
   for LookupIndex := 0 to Length(FLookupListIndex) - 1
    do FLookupListIndex[LookupIndex] := ReadSwappedWord(Stream);
  end;
end;

procedure TCustomOpenTypeFeatureTable.SaveToStream(Stream: TStream);
var
  LookupIndex : Word;
begin
 inherited;

 with Stream do
  begin
   // read feature parameter offset
   FFeatureParams := ReadSwappedWord(Stream);

   // read lookup count
   SetLength(FLookupListIndex, ReadSwappedWord(Stream));

   // read lookup list index offsets
   for LookupIndex := 0 to Length(FLookupListIndex) - 1
    do FLookupListIndex[LookupIndex] := ReadSwappedWord(Stream);
  end;
end;

procedure TCustomOpenTypeFeatureTable.SetFeatureParams(const Value: Word);
begin
 if FFeatureParams <> Value then
  begin
   FFeatureParams := Value;
   FeatureParamsChanged;
  end;
end;

procedure TCustomOpenTypeFeatureTable.FeatureParamsChanged;
begin
 Changed;
end;


{ TOpenTypeFeatureListTable }

constructor TOpenTypeFeatureListTable.Create(Storage: IPascalTypeStorageTable);
begin
 FFeatureList := TObjectList.Create;
 inherited;
end;

destructor TOpenTypeFeatureListTable.Destroy;
begin
 FreeAndNil(FFeatureList);
 inherited;
end;

procedure TOpenTypeFeatureListTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeFeatureListTable(Dest) do
   begin
    FFeatureList.Assign(Self.FFeatureList);
   end
 else inherited;
end;

procedure TOpenTypeFeatureListTable.ResetToDefaults;
begin
 FFeatureList.Clear;
end;

function TOpenTypeFeatureListTable.GetFeature(Index: Integer): TCustomOpenTypeFeatureTable;
begin
 if (Index >= 0) and (Index < FFeatureList.Count)
  then Result := TCustomOpenTypeFeatureTable(FFeatureList[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeFeatureListTable.GetFeatureCount: Integer;
begin
 Result := FFeatureList.Count;
end;

procedure TOpenTypeFeatureListTable.LoadFromStream(Stream: TStream);
var
  StartPos     : Int64;
  FeatureIndex : Integer;
  FeatureList  : array of TTagOffsetRecord;
  FeatureTable : TCustomOpenTypeFeatureTable;
  FeatureClass : TOpenTypeFeatureTableClass;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read feature list count
   SetLength(FeatureList, ReadSwappedWord(Stream));

   for FeatureIndex := 0 to Length(FeatureList) - 1 do
    begin
     // read table type
     Read(FeatureList[FeatureIndex].Tag, SizeOf(TTableType));

     // read offset
     FeatureList[FeatureIndex].Offset := ReadSwappedWord(Stream);
    end;

   // clear language system list
   FFeatureList.Clear;

   for FeatureIndex := 0 to Length(FeatureList) - 1 do
    begin
     // find feature class
     FeatureClass := FindFeatureByType(FeatureList[FeatureIndex].Tag);

     if Assigned(FeatureClass) then
      begin
       // create language system entry
       FeatureTable := FeatureClass.Create(FStorage);

       // set position to actual script list entry
       Position := StartPos + FeatureList[FeatureIndex].Offset;

       // load from stream
       FeatureTable.LoadFromStream(Stream);

       // add to language system list
       FFeatureList.Add(FeatureTable);
      end
     else; // raise EPascalTypeError.Create('Unknown Feature: ' + FeatureList[FeatureIndex].Tag);
    end;
  end;
end;

procedure TOpenTypeFeatureListTable.SaveToStream(Stream: TStream);
var
  StartPos     : Int64;
  FeatureIndex : Integer;
  FeatureList  : array of TTagOffsetRecord;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // write feature list count
   WriteSwappedWord(Stream, FFeatureList.Count);

   // leave space for feature directory
   Seek(FFeatureList.Count * 6, soCurrent);

   // build directory (to be written later) and write data
   SetLength(FeatureList, FFeatureList.Count);
   for FeatureIndex := 0 to FFeatureList.Count - 1 do
    with TCustomOpenTypeFeatureTable(FFeatureList[FeatureIndex]) do
     begin
      // get table type
      FeatureList[FeatureIndex].Tag := TableType;
      FeatureList[FeatureIndex].Offset := Position;

      // write feature to stream
      SaveToStream(Stream);
     end;

   // write directory
   Position := StartPos + 2;

   for FeatureIndex := 0 to Length(FeatureList) - 1 do
    with FeatureList[FeatureIndex] do
     begin
      // write tag
      Write(Tag, SizeOf(TTableType));

      // write offset
      WriteSwappedWord(Stream, Offset);
     end;
  end;
end;


{ TOpenTypeCoverage1Table }

procedure TOpenTypeCoverage1Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeCoverage1Table(Dest) do
   begin
    FGlyphArray := Self.FGlyphArray;
   end
 else inherited;
end;

class function TOpenTypeCoverage1Table.GetCoverageFormat: TCoverageFormat;
begin
 Result := cfList;
end;

function TOpenTypeCoverage1Table.GetGlyph(Index: Integer): Word;
begin
 if (Index >= 0) and (Index < Length(FGlyphArray))
  then Result := FGlyphArray[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeCoverage1Table.GetGlyphCount: Integer;
begin
 Result := Length(FGlyphArray);
end;

procedure TOpenTypeCoverage1Table.ResetToDefaults;
begin
 SetLength(FGlyphArray, 0);
end;

procedure TOpenTypeCoverage1Table.LoadFromStream(Stream: TStream);
var
  GlyphIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read glyph array count
   SetLength(FGlyphArray, ReadSwappedWord(Stream));

   // yet todo: different types of this table for GPOS and GSUB!!! 
(*
   // read glyph
   for GlyphIndex := 0 to Length(FGlyphArray) - 1
    do FGlyphArray[GlyphIndex] := ReadSwappedWord(Stream);
*)

  end;
end;

procedure TOpenTypeCoverage1Table.SaveToStream(Stream: TStream);
var
  GlyphIndex : Integer;
  Value16    : Word;
begin
 inherited;

 with Stream do
  begin
   // write coverage format
   Value16 := 1;
   Write(Value16, SizeOf(Word));

   // write glyph array count
   Value16 := Length(FGlyphArray);
   Write(Value16, SizeOf(Word));

   // write glyph
   for GlyphIndex := 0 to Length(FGlyphArray) - 1
    do WriteSwappedWord(Stream, FGlyphArray[GlyphIndex]);
  end;
end;


{ TOpenTypeCoverage2Table }

procedure TOpenTypeCoverage2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeCoverage2Table(Dest) do
   begin
   end
 else inherited;
end;

class function TOpenTypeCoverage2Table.GetCoverageFormat: TCoverageFormat;
begin
 Result := cfRange;
end;

function TOpenTypeCoverage2Table.GetRange(Index: Integer): TRangeRecord;
begin
 if (Index >= 0) and (Index < Length(FRangeArray))
  then Result := FRangeArray[Index]
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeCoverage2Table.GetRangeCount: Integer;
begin
 Result := Length(FRangeArray);
end;

procedure TOpenTypeCoverage2Table.ResetToDefaults;
begin
 SetLength(FRangeArray, 0);
end;

procedure TOpenTypeCoverage2Table.LoadFromStream(Stream: TStream);
var
  GlyphIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read glyph array count
   SetLength(FRangeArray, ReadSwappedWord(Stream));

   for GlyphIndex := 0 to Length(FRangeArray) - 1 do
    begin
     // read start glyph
     FRangeArray[GlyphIndex].StartGlyph := ReadSwappedWord(Stream);

     // read end glyph
     FRangeArray[GlyphIndex].EndGlyph := ReadSwappedWord(Stream);

     // read start coverage
     FRangeArray[GlyphIndex].StartCoverageIndex := ReadSwappedWord(Stream);
    end;
  end;
end;

procedure TOpenTypeCoverage2Table.SaveToStream(Stream: TStream);
var
  GlyphIndex : Integer;
begin
 inherited;

 // read glyph array count
 WriteSwappedWord(Stream, Length(FRangeArray));

 for GlyphIndex := 0 to Length(FRangeArray) - 1 do
  begin
   // write start glyph
   WriteSwappedWord(Stream, FRangeArray[GlyphIndex].StartGlyph);

   // write end glyph
   WriteSwappedWord(Stream, FRangeArray[GlyphIndex].EndGlyph);

   // write start coverage
   WriteSwappedWord(Stream, FRangeArray[GlyphIndex].StartCoverageIndex);
  end;
end;


{ TOpenTypeLookupTable }

constructor TOpenTypeLookupTable.Create(Storage: IPascalTypeStorageTable);
begin
 FSubtableList := TObjectList.Create;
 inherited;
end;

destructor TOpenTypeLookupTable.Destroy;
begin
 FreeAndNil(FSubtableList);
 inherited;
end;

function TOpenTypeLookupTable.GetSubtable(
  Index: Integer): TCustomOpenTypeCoverageTable;
begin
 if (Index >= 0) and (Index < FSubtableList.Count)
  then Result := TCustomOpenTypeCoverageTable(FSubtableList[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeLookupTable.GetSubtableCount: Integer;
begin
 Result := FSubtableList.Count;
end;

procedure TOpenTypeLookupTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeLookupTable(Dest) do
   begin
    FLookupType       := Self.FLookupType;
    FLookupFlag       := Self.FLookupFlag;
    FMarkFilteringSet := Self.FMarkFilteringSet;
    FSubtableList.Assign(FSubtableList);
   end
 else inherited;
end;

procedure TOpenTypeLookupTable.ResetToDefaults;
begin
 FLookupType       := 0;
 FLookupFlag       := 0;
 FMarkFilteringSet := 0;
 FSubtableList.Clear;
end;

procedure TOpenTypeLookupTable.LoadFromStream(Stream: TStream);
var
  StartPos        : Int64;
  LookupIndex     : Word;
  CoverageFormat  : Word;
  SubTableOffsets : array of Word;
  SubTableItem    : TCustomOpenTypeCoverageTable;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if Position + 6 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read lookup type
   FLookupType := ReadSwappedWord(Stream);

   // read lookup flag
   FLookupFlag := ReadSwappedWord(Stream);

   // read subtable count
   SetLength(SubTableOffsets, ReadSwappedWord(Stream));

   // read lookup list index offsets
   for LookupIndex := 0 to Length(SubTableOffsets) - 1
    do SubTableOffsets[LookupIndex] := ReadSwappedWord(Stream);

   // eventually read mark filtering set
   if (FLookupFlag and (1 shl 4)) <> 0
    then FMarkFilteringSet := ReadSwappedWord(Stream);

   for LookupIndex := 0 to Length(SubTableOffsets) - 1 do
    begin
     // set position to actual script list entry
     Position := StartPos + SubTableOffsets[LookupIndex];

     // read lookup type
     CoverageFormat := ReadSwappedWord(Stream);

     // create coverage sub table item
     case CoverageFormat of
      1 : SubTableItem := TOpenTypeCoverage1Table.Create;
      2 : SubTableItem := TOpenTypeCoverage2Table.Create;
      else SubTableItem := nil;
//      else raise EPascalTypeError.Create('Unknown coverage format');
     end;

     if Assigned(SubTableItem) then
      begin
       // load subtable
       SubTableItem.LoadFromStream(Stream);

       // add to subtable list
       FSubtableList.Add(SubTableItem);
      end;
    end;
  end;
end;

procedure TOpenTypeLookupTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;

procedure TOpenTypeLookupTable.SetLookupFlag(const Value: Word);
begin
 if FLookupFlag <> Value then
  begin
   FLookupFlag := Value;
   LookupFlagChanged;
  end;
end;

procedure TOpenTypeLookupTable.SetLookupType(const Value: Word);
begin
 if FLookupType <> Value then
  begin
   FLookupType := Value;
   LookupTypeChanged;
  end;
end;

procedure TOpenTypeLookupTable.SetMarkFilteringSet(const Value: Word);
begin
 if FMarkFilteringSet <> Value then
  begin
   FMarkFilteringSet := Value;
   MarkFilteringSetChanged;
  end;
end;

procedure TOpenTypeLookupTable.LookupFlagChanged;
begin
 Changed;
end;

procedure TOpenTypeLookupTable.LookupTypeChanged;
begin
 Changed;
end;

procedure TOpenTypeLookupTable.MarkFilteringSetChanged;
begin
 Changed;
end;


{ TOpenTypeLookupListTable }

constructor TOpenTypeLookupListTable.Create(Storage: IPascalTypeStorageTable);
begin
 FLookupList := TObjectList.Create;
 inherited;
end;

destructor TOpenTypeLookupListTable.Destroy;
begin
 FreeAndNil(FLookupList);
 inherited;
end;

procedure TOpenTypeLookupListTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeLookupListTable(Dest) do
   begin
    FLookupList.Assign(Self.FLookupList);
   end
 else inherited;
end;

procedure TOpenTypeLookupListTable.ResetToDefaults;
begin
 FLookupList.Clear;
end;

function TOpenTypeLookupListTable.GetLookupTable(
  Index: Integer): TOpenTypeLookupTable;
begin
 if (Index >= 0) and (Index < FLookupList.Count)
  then Result := TOpenTypeLookupTable(FLookupList[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TOpenTypeLookupListTable.GetLookupTableCount: Integer;
begin
 Result := FLookupList.Count;
end;

procedure TOpenTypeLookupListTable.LoadFromStream(Stream: TStream);
var
  StartPos    : Int64;
  LookupIndex : Integer;
  LookupList  : array of Word;
  LookupTable : TOpenTypeLookupTable;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read lookup list count
   SetLength(LookupList, ReadSwappedWord(Stream));

   // read offsets
   for LookupIndex := 0 to Length(LookupList) - 1
    do LookupList[LookupIndex] := ReadSwappedWord(Stream);

   // clear language system list
   FLookupList.Clear;

   for LookupIndex := 0 to Length(LookupList) - 1 do
    begin
     // create language system entry
     LookupTable := TOpenTypeLookupTable.Create(FStorage);

     // set position to actual script list entry
     Position := StartPos + LookupList[LookupIndex];

     // load from stream
     LookupTable.LoadFromStream(Stream);

     // add to language system list
     FLookupList.Add(LookupTable);
    end;
  end;
end;

procedure TOpenTypeLookupListTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TCustomOpenTypeCommonTable }

constructor TCustomOpenTypeCommonTable.Create(Storage: IPascalTypeStorageTable);
begin
 FScriptListTable := TOpenTypeScriptListTable.Create(Storage);
 FFeatureListTable := TOpenTypeFeatureListTable.Create(Storage);
 FLookupListTable := TOpenTypeLookupListTable.Create(Storage);
 inherited;
end;

destructor TCustomOpenTypeCommonTable.Destroy;
begin
 FreeAndNil(FScriptListTable);
 FreeAndNil(FFeatureListTable);
 FreeAndNil(FLookupListTable);
 inherited;
end;

procedure TCustomOpenTypeCommonTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeGlyphPositionTable(Dest) do
   begin
    FVersion := Self.FVersion;
   end
 else inherited;
end;

procedure TCustomOpenTypeCommonTable.ResetToDefaults;
const
  CGlyphPositionDefaultVersion : Cardinal = $10000;
begin
 FVersion := TFixedPoint(CGlyphPositionDefaultVersion);
 
 FScriptListTable.ResetToDefaults;
 FFeatureListTable.ResetToDefaults;
 FLookupListTable.ResetToDefaults;
end;

procedure TCustomOpenTypeCommonTable.LoadFromStream(Stream: TStream);
var
  ScriptListPosition  : Int64;
  FeatureListPosition : Int64;
  LookupListPosition  : Int64;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 10 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read version
   FVersion := TFixedPoint(ReadSwappedCardinal(Stream));

   if Version.Value <> 1
    then raise Exception.Create(RCStrUnsupportedVersion);

   // read script list offset
   ScriptListPosition := Position - 4 + ReadSwappedWord(Stream);

   // read feature list offset
   FeatureListPosition := Position - 6 + ReadSwappedWord(Stream);

   // read lookup list offset
   LookupListPosition := Position - 8 + ReadSwappedWord(Stream);

   // locate script list position
   Position := ScriptListPosition;

   // load script table
   FScriptListTable.LoadFromStream(Stream);

   // locate feature list position
   Position := FeatureListPosition;

   // load script table
   FFeatureListTable.LoadFromStream(Stream);

   // locate lookup list position
   Position := LookupListPosition;

   // load lookup table
   FLookupListTable.LoadFromStream(Stream);
  end;
end;

procedure TCustomOpenTypeCommonTable.SaveToStream(Stream: TStream);
var
  StartPos : Int64;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // write version
   WriteSwappedCardinal(Stream, Cardinal(FVersion));

   // write script list offset (fixed!)
   WriteSwappedWord(Stream, 10);

   Position := StartPos + 10;
   FScriptListTable.SaveToStream(Stream);

(*
   // write script list offset
   WriteSwappedWord(Stream, FScriptListOffset);

   // write feature list offset
   WriteSwappedWord(Stream, FFeatureListOffset);

   // write lookup list offset
   WriteSwappedWord(Stream, FLookupListOffset);
*)
  end;
end;

procedure TCustomOpenTypeCommonTable.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TCustomOpenTypeCommonTable.VersionChanged;
begin
 Changed;
end;


{ TOpenTypeGlyphPositionTable }

class function TOpenTypeGlyphPositionTable.GetTableType: TTableType;
begin
 Result := 'GPOS';
end;


{ TOpenTypeGlyphSubstitutionTable }

class function TOpenTypeGlyphSubstitutionTable.GetTableType: TTableType;
begin
 Result := 'GSUB';
end;


{ TOpenTypeExtenderGlyphTable }

procedure TOpenTypeExtenderGlyphTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomOpenTypeLanguageSystemTable(Dest) do
   begin
    FGlyphID := Self.FGlyphID;
   end
 else inherited;
end;

procedure TOpenTypeExtenderGlyphTable.ResetToDefaults;
begin
 SetLength(FGlyphID, 0);
 inherited;
end;

procedure TOpenTypeExtenderGlyphTable.LoadFromStream(Stream: TStream);
var
  GlyphIdIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // set length of glyphID array
   SetLength(FGlyphID, ReadSwappedWord(Stream));

   // read glyph IDs from stream
   for GlyphIdIndex := 0 to Length(FGlyphID) - 1
    do FGlyphID[GlyphIdIndex] := ReadSwappedWord(Stream)
  end;
end;

procedure TOpenTypeExtenderGlyphTable.SaveToStream(Stream: TStream);
var
  GlyphIdIndex: Integer;
begin
 inherited;

 with Stream do
  begin
   // write length of glyphID array to stream
   WriteSwappedWord(Stream, Length(FGlyphID));

   // write glyph IDs to stream
   for GlyphIdIndex := 0 to Length(FGlyphID) - 1
    do WriteSwappedWord(Stream, FGlyphID[GlyphIdIndex]);
  end;
end;


{ TCustomOpenTypeJustificationLanguageSystemTable }

constructor TCustomOpenTypeJustificationLanguageSystemTable.Create(
  Storage: IPascalTypeStorageTable);
begin
 inherited Create(Storage);
end;

destructor TCustomOpenTypeJustificationLanguageSystemTable.Destroy;
begin
 inherited;
end;

procedure TCustomOpenTypeJustificationLanguageSystemTable.AssignTo(
  Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomOpenTypeLanguageSystemTable(Dest) do
   begin
   end
 else inherited;
end;

procedure TCustomOpenTypeJustificationLanguageSystemTable.ResetToDefaults;
begin
  inherited;

end;

procedure TCustomOpenTypeJustificationLanguageSystemTable.LoadFromStream(
  Stream: TStream);
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise Exception.Create(RCStrTableIncomplete);
  end;
end;

procedure TCustomOpenTypeJustificationLanguageSystemTable.SaveToStream(
  Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TOpenTypeJustificationLanguageSystemTable }

class function TOpenTypeJustificationLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Default';
end;

class function TOpenTypeJustificationLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DFLT';
end;


{ TCustomOpenTypeJustificationScriptTable }

constructor TCustomOpenTypeJustificationScriptTable.Create(Storage: IPascalTypeStorageTable);
begin
 FLanguageSystemTables := TObjectList.Create;
 inherited Create(Storage);
end;

destructor TCustomOpenTypeJustificationScriptTable.Destroy;
begin
 if Assigned(FDefaultLangSys)
  then FreeAndNil(FDefaultLangSys);

 if Assigned(FExtenderGlyphTable)
  then FreeAndNil(FExtenderGlyphTable);

 FreeAndNil(FLanguageSystemTables);

 inherited;
end;

procedure TCustomOpenTypeJustificationScriptTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomOpenTypeJustificationScriptTable(Dest) do
   begin
   end
 else inherited;
end;

procedure TCustomOpenTypeJustificationScriptTable.ResetToDefaults;
begin
 inherited;
end;

function TCustomOpenTypeJustificationScriptTable.GetLanguageSystemTable(
  Index: Integer): TCustomOpenTypeJustificationLanguageSystemTable;
begin
 if (Index >= 0) and (Index < FLanguageSystemTables.Count)
  then Result := TCustomOpenTypeJustificationLanguageSystemTable(FLanguageSystemTables[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

procedure TCustomOpenTypeJustificationScriptTable.SetDefaultLangSys(
  const Value: TCustomOpenTypeJustificationLanguageSystemTable);
begin
 FDefaultLangSys.Assign(Value);
 Changed;
end;

function TCustomOpenTypeJustificationScriptTable.GetLanguageSystemTableCount: Integer;
begin
 Result := FLanguageSystemTables.Count;
end;

procedure TCustomOpenTypeJustificationScriptTable.LoadFromStream(Stream: TStream);
var
  StartPos       : Int64;
  LangSysIndex   : Integer;
  LangSysRecords : array of TTagOffsetRecord;
  LangTable      : TCustomOpenTypeJustificationLanguageSystemTable;
  LangTableClass : TOpenTypeJustificationLanguageSystemTableClass;
  ExtenderGlyph  : Word;
  DefaultLangSys : Word;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   // check (minimum) table size
   if Position + 6 > Size
    then raise Exception.Create(RCStrTableIncomplete);

   // read extender glyph offset
   ExtenderGlyph := ReadSwappedWord(Stream);

   // read default language system offset
   DefaultLangSys := ReadSwappedWord(Stream);

   // read language system record count
   SetLength(LangSysRecords, ReadSwappedWord(Stream));

   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    begin
     // read table type
     Read(LangSysRecords[LangSysIndex].Tag, SizeOf(TTableType));

     // read offset
     LangSysRecords[LangSysIndex].Offset := ReadSwappedWord(Stream);
    end;

   // load default language system
   if ExtenderGlyph <> 0 then
    begin
     Position := StartPos + ExtenderGlyph;

     if not Assigned(FExtenderGlyphTable)
      then FExtenderGlyphTable := TOpenTypeExtenderGlyphTable.Create;

     FExtenderGlyphTable.LoadFromStream(Stream);
    end else
   if Assigned(FExtenderGlyphTable)
    then FreeAndNil(FExtenderGlyphTable);

   // load default language system
   if DefaultLangSys <> 0 then
    begin
     Position := StartPos + DefaultLangSys;

     if not Assigned(FDefaultLangSys)
      then FDefaultLangSys := TOpenTypeJustificationLanguageSystemTable.Create(FStorage);

     FDefaultLangSys.LoadFromStream(Stream);
    end else
   if Assigned(FDefaultLangSys)
    then FreeAndNil(FDefaultLangSys);

   // clear existing language tables
   FLanguageSystemTables.Clear;

   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    begin
     LangTableClass := FindJustificationLanguageSystemByType(LangSysRecords[LangSysIndex].Tag);

     if Assigned(LangTableClass) then
      begin
       // create language table entry
       LangTable := LangTableClass.Create(FStorage);

       // set position
       Position := StartPos + LangSysRecords[LangSysIndex].Offset;

       // read language system table entry from stream
       LangTable.LoadFromStream(Stream);

       // add to language system tables
       FLanguageSystemTables.Add(LangTable);
      end;
    end;
  end;
end;

procedure TCustomOpenTypeJustificationScriptTable.SaveToStream(Stream: TStream);
var
  StartPos       : Int64;
  LangSysIndex   : Integer;
  LangSysRecords : array of TTagOffsetRecord;
  Value16        : Word;
  DefLangSysOff  : Word;
  ExtGlyphOff    : Word;
begin
 inherited;

 with Stream do
  begin
   // remember start position of the stream
   StartPos := Position;

   // find offset for data
   if Assigned(FDefaultLangSys)
    then Value16 := 2 + 4 * FLanguageSystemTables.Count
    else Value16 := 0;
   if Assigned(FExtenderGlyphTable)
    then Value16 := Value16 + 2;

   Position := StartPos + Value16;

   // write extender glyph table
   if Assigned(FExtenderGlyphTable) then
    begin
     ExtGlyphOff := Word(Position - StartPos);
     FExtenderGlyphTable.SaveToStream(Stream);
    end else ExtGlyphOff := 0;

   // write default language system table
   if Assigned(FDefaultLangSys) then
    begin
     DefLangSysOff := Word(Position - StartPos);
     FDefaultLangSys.SaveToStream(Stream);
    end else DefLangSysOff := 0;

   // build directory (to be written later) and write data
   SetLength(LangSysRecords, FLanguageSystemTables.Count);
   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    with TCustomOpenTypeJustificationLanguageSystemTable(FLanguageSystemTables[LangSysIndex]) do
     begin
      // get table type
      LangSysRecords[LangSysIndex].Tag := TableType;
      LangSysRecords[LangSysIndex].Offset := Position;

      // write feature to stream
      SaveToStream(Stream);
     end;

   // write extender glyph offset
   WriteSwappedWord(Stream, ExtGlyphOff);

   // write default language system offset
   WriteSwappedWord(Stream, DefLangSysOff);

   // write directory
   Position := StartPos;

   for LangSysIndex := 0 to Length(LangSysRecords) - 1 do
    with LangSysRecords[LangSysIndex] do
     begin
      // write tag
      Write(Tag, SizeOf(TTableType));

      // write offset
      WriteSwappedWord(Stream, Offset);
     end;
  end;
end;


{ TOpenTypeJustificationScriptTable }

class function TOpenTypeJustificationScriptTable.GetDisplayName: string;
begin
 Result := 'Default';
end;

class function TOpenTypeJustificationScriptTable.GetTableType: TTableType;
begin
 Result := 'DFLT';
end;


{ TOpenTypeJustificationTable }

constructor TOpenTypeJustificationTable.Create;
begin
 FScripts := TObjectList.Create(True);
 inherited;
end;

destructor TOpenTypeJustificationTable.Destroy;
begin
 FreeAndNil(FScripts);
 inherited;
end;

class function TOpenTypeJustificationTable.GetTableType: TTableType;
begin
 Result := 'JSTF';
end;

procedure TOpenTypeJustificationTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TOpenTypeJustificationTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FScripts.Assign(Self.FScripts);
   end
 else inherited;
end;

function TOpenTypeJustificationTable.GetScriptCount: Cardinal;
begin
 Result := FScripts.Count;
end;

procedure TOpenTypeJustificationTable.ResetToDefaults;
begin
 FVersion.Value := 1;
 FScripts.Clear;
end;

procedure TOpenTypeJustificationTable.LoadFromStream(Stream: TStream);
var
  StartPos  : Int64;
  DirIndex  : Integer;
  Directory : array of TJustificationScriptDirectoryEntry;
  Script    : TCustomOpenTypeJustificationScriptTable;
begin
 inherited;

 with Stream do
  begin
   StartPos := Position;

   if Position + 6 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read version
   FVersion := TFixedPoint(ReadSwappedCardinal(Stream));

   if Version.Value <> 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read Justification Script Count
   SetLength(Directory, ReadSwappedWord(Stream));

   // check if table is complete
   if Position + Length(Directory) * SizeOf(TJustificationScriptDirectoryEntry) > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read directory entry
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex] do
     begin
      // read tag
      Read(Tag, SizeOf(Cardinal));

      // read offset
      Offset := ReadSwappedWord(Stream);
     end;

   // clear existing scripts
   FScripts.Clear;

   // read digital scripts
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex] do
     begin
      // TODO: Find matching justification script by tag!!!
      Script := TOpenTypeJustificationScriptTable.Create(FStorage);

      // jump to the right position
      Position := StartPos + Offset;

      // load digital signature from stream
      Script.LoadFromStream(Stream);

      FScripts.Add(Script);
     end;
  end;
end;

procedure TOpenTypeJustificationTable.SaveToStream(Stream: TStream);
var
  StartPos  : Int64;
  DirIndex  : Integer;
  Directory : array of TJustificationScriptDirectoryEntry;
begin
 inherited;

 with Stream do
  begin
   // store stream start position
   StartPos := Position;

   // write version
   WriteSwappedCardinal(Stream, Cardinal(FVersion));

   // write Justification Script Count
   WriteSwappedWord(Stream, Length(Directory));

   // set directory length
   SetLength(Directory, FScripts.Count);

   // offset directory
   Seek(soFromCurrent, FScripts.Count * 3 * SizeOf(Word));

   // build directory and store signature
   for DirIndex := 0 to FScripts.Count - 1 do
    with TOpenTypeJustificationTable(FScripts[DirIndex]) do
     begin
      Directory[DirIndex].Offset := Position - StartPos;
      Directory[DirIndex].Tag := GetTableType;
      SaveToStream(Stream);
     end;

   // locate directory
   Position := StartPos + 3 * SizeOf(Word);

   // write directory entries
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex], TCustomOpenTypeJustificationScriptTable(FScripts[DirIndex]) do
     begin
      // write tag
      Write(Tag, SizeOf(Cardinal));

      // write offset
      WriteSwappedWord(Stream, Offset);
     end;
  end;
end;

procedure TOpenTypeJustificationTable.SetVersion(
  const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TOpenTypeJustificationTable.VersionChanged;
begin
 Changed;
end;


////////////////////////////////////////////////////////////////////////////////

function IsLanguageSystemClassRegistered(LanguageSystemClass: TOpenTypeLanguageSystemTableClass): Boolean;
var
  TableClassIndex : Integer;
begin
 Result := False;
 for TableClassIndex := 0 to Length(GLanguageSystemClasses) - 1 do
  if GLanguageSystemClasses[TableClassIndex] = LanguageSystemClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterLanguageSystem(LanguageSystemClass: TOpenTypeLanguageSystemTableClass);
begin
 Assert(IsLanguageSystemClassRegistered(LanguageSystemClass) = False);
 SetLength(GLanguageSystemClasses, Length(GLanguageSystemClasses) + 1);
 GLanguageSystemClasses[Length(GLanguageSystemClasses) - 1] := LanguageSystemClass;
end;

procedure RegisterLanguageSystems(LanguageSystemClasses: array of TOpenTypeLanguageSystemTableClass);
var
  LanguageSystemIndex : Integer;
begin
 for LanguageSystemIndex := 0 to Length(LanguageSystemClasses) - 1
  do RegisterLanguageSystem(LanguageSystemClasses[LanguageSystemIndex]);
end;

function FindLanguageSystemByType(TableType: TTableType): TOpenTypeLanguageSystemTableClass;
var
  LanguageSystemIndex : Integer;
begin
 Result := nil;
 for LanguageSystemIndex := 0 to Length(GLanguageSystemClasses) - 1 do
  if GLanguageSystemClasses[LanguageSystemIndex].GetTableType = TableType then
   begin
    Result := GLanguageSystemClasses[LanguageSystemIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown Table Class: ' + TableType);
end;


////////////////////////////////////////////////////////////////////////////////

function IsScriptClassRegistered(ScriptClass: TOpenTypeScriptTableClass): Boolean;
var
  TableClassIndex : Integer;
begin
 Result := False;
 for TableClassIndex := 0 to Length(GScriptClasses) - 1 do
  if GScriptClasses[TableClassIndex] = ScriptClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterScript(ScriptClass: TOpenTypeScriptTableClass);
begin
 Assert(IsScriptClassRegistered(ScriptClass) = False);
 SetLength(GScriptClasses, Length(GScriptClasses) + 1);
 GScriptClasses[Length(GScriptClasses) - 1] := ScriptClass;
end;

procedure RegisterScripts(ScriptClasses: array of TOpenTypeScriptTableClass);
var
  ScriptIndex : Integer;
begin
 for ScriptIndex := 0 to Length(ScriptClasses) - 1
  do RegisterScript(ScriptClasses[ScriptIndex]);
end;

function FindScriptByType(TableType: TTableType): TOpenTypeScriptTableClass;
var
  ScriptIndex : Integer;
begin
 Result := nil;
 for ScriptIndex := 0 to Length(GScriptClasses) - 1 do
  if GScriptClasses[ScriptIndex].GetTableType = TableType then
   begin
    Result := GScriptClasses[ScriptIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown table class: ' + TableType);
end;


////////////////////////////////////////////////////////////////////////////////

function IsFeatureClassRegistered(FeatureClass: TOpenTypeFeatureTableClass): Boolean;
var
  TableClassIndex : Integer;
begin
 Result := False;
 for TableClassIndex := 0 to Length(GFeatureClasses) - 1 do
  if GFeatureClasses[TableClassIndex] = FeatureClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterFeature(FeatureClass: TOpenTypeFeatureTableClass);
begin
 Assert(IsFeatureClassRegistered(FeatureClass) = False);
 SetLength(GFeatureClasses, Length(GFeatureClasses) + 1);
 GFeatureClasses[Length(GFeatureClasses) - 1] := FeatureClass;
end;

procedure RegisterFeatures(FeaturesClasses: array of TOpenTypeFeatureTableClass);
var
  FeaturesIndex : Integer;
begin
 for FeaturesIndex := 0 to Length(FeaturesClasses) - 1
  do RegisterFeature(FeaturesClasses[FeaturesIndex]);
end;

function FindFeatureByType(TableType: TTableType): TOpenTypeFeatureTableClass;
var
  FeaturesIndex : Integer;
begin
 Result := nil;
 for FeaturesIndex := 0 to Length(GFeatureClasses) - 1 do
  if GFeatureClasses[FeaturesIndex].GetTableType = TableType then
   begin
    Result := GFeatureClasses[FeaturesIndex];
    Exit;
   end;
// raise Exception.Create('Unknown Table Class: ' + TableType);
end;


////////////////////////////////////////////////////////////////////////////////

function IsJustificationLanguageSystemClassRegistered(LanguageSystemClass: TOpenTypeJustificationLanguageSystemTableClass): Boolean;
var
  TableClassIndex : Integer;
begin
 Result := False;
 for TableClassIndex := 0 to Length(GJustificationLanguageSystemClasses) - 1 do
  if GJustificationLanguageSystemClasses[TableClassIndex] = LanguageSystemClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterJustificationLanguageSystem(LanguageSystemClass: TOpenTypeJustificationLanguageSystemTableClass);
begin
 Assert(IsJustificationLanguageSystemClassRegistered(LanguageSystemClass) = False);
 SetLength(GJustificationLanguageSystemClasses, Length(GJustificationLanguageSystemClasses) + 1);
 GJustificationLanguageSystemClasses[Length(GJustificationLanguageSystemClasses) - 1] := LanguageSystemClass;
end;

procedure RegisterJustificationLanguageSystems(LanguageSystemClasses: array of TOpenTypeJustificationLanguageSystemTableClass);
var
  LangSysIndex : Integer;
begin
 for LangSysIndex := 0 to Length(LanguageSystemClasses) - 1
  do RegisterJustificationLanguageSystem(LanguageSystemClasses[LangSysIndex]);
end;

function FindJustificationLanguageSystemByType(TableType: TTableType): TOpenTypeJustificationLanguageSystemTableClass;
var
  LangSysIndex : Integer;
begin
 Result := nil;
 for LangSysIndex := 0 to Length(GJustificationLanguageSystemClasses) - 1 do
  if GJustificationLanguageSystemClasses[LangSysIndex].GetTableType = TableType then
   begin
    Result := GJustificationLanguageSystemClasses[LangSysIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown Table Class: ' + TableType);
end;


initialization
  RegisterPascalTypeTables([TOpenTypeBaselineTable,
    TOpenTypeGlyphDefinitionTable, TOpenTypeGlyphPositionTable,
    TOpenTypeGlyphSubstitutionTable, TOpenTypeJustificationTable]);

  RegisterScript(TOpenTypeDefaultLanguageSystemTables);

end.
