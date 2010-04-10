unit PT_Tables;

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
  Classes, Contnrs, SysUtils, PT_Types;

type
  TCustomPascalTypeNamedTable = class;
  TCustomPascalTypeNamedTableClass = class of TCustomPascalTypeNamedTable;

  IPascalTypeInterpreter = interface(IUnknown)
  ['{A990D67B-BC60-4DA4-9D90-3C1D30AEC003}']
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
  end;

  TCustomPascalTypeTable = class(TInterfacedPersistent, IStreamPersist)
  protected
    procedure Changed; virtual;

    procedure ResetToDefaults; virtual; abstract;
  public
    constructor Create; virtual;

    procedure LoadFromStream(Stream: TStream); virtual; abstract;
    procedure SaveToStream(Stream: TStream); virtual; abstract;
  end;

  TCustomPascalTypeInterfaceTable = class(TCustomPascalTypeTable)
  protected
    FInterpreter : IPascalTypeInterpreter;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); reintroduce; virtual;
  end;

  TCustomPascalTypeGlyphDataTable = class(TCustomPascalTypeInterfaceTable);

  TCustomPascalTypeNamedTable = class(TCustomPascalTypeInterfaceTable)
  protected
    function GetInternalTableType: TTableType; virtual;
    class function GetTableType: TTableType; virtual; abstract;
  public
    property TableType: TTableType read GetInternalTableType;
  end;


  // Unknown Table

  TPascalTypeUnknownTable = class(TCustomPascalTypeNamedTable)
  private
    FTableType : TTableType;
    FStream    : TMemoryStream;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    function GetInternalTableType: TTableType; override;
    procedure ResetToDefaults; override;
    class function GetTableType: TTableType; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter;
      TableTye: TTableType); reintroduce; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Stream: TMemoryStream read FStream;
  end;


  // Header Table

  TPascalTypeHeaderTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion            : TFixedPoint; // = $00010000
    FFontRevision       : TFixedPoint; // set by font manufacturer
    FCheckSumAdjustment : Longint;     // To compute: set it to 0, calculate the checksum for the 'head' table and put it in the table directory, sum the entire font as uint32, then store B1B0AFBA - sum. The checksum for the 'head' table will not be wrong. That is OK.
    FMagicNumber        : Cardinal;    // set to $5F0F3CF5
    FFlags              : TFontHeaderTableFlags;
    FUnitsPerEm         : Word;       // range from 64 to 16384
    FCreatedDate        : Int64;      // created international date
    FModifiedDate       : Int64;      // modified international date
    FxMin               : SmallInt;   // for all glyph bounding boxes
    FyMin               : SmallInt;   // for all glyph bounding boxes
    FxMax               : SmallInt;   // for all glyph bounding boxes
    FyMax               : SmallInt;   // for all glyph bounding boxes
    FMacStyle           : TMacStyles; // see TMacStyles
    FLowestRecPPEM      : Word;       // smallest readable size in pixels
    FFontDirectionHint  : TFontDirectionHint;
    FIndexToLocFormat   : TIndexToLocationFormat;
    FGlyphDataFormat    : Word; // 0 for current format
    procedure SetCheckSumAdjustment(const Value: Longint);
    procedure SetCreatedDate(const Value: Int64);
    procedure SetFlags(const Value: TFontHeaderTableFlags);
    procedure SetFontDirectionHint(const Value: TFontDirectionHint);
    procedure SetFontRevision(const Value: TFixedPoint);
    procedure SetGlyphDataFormat(const Value: Word);
    procedure SetIndexToLocFormat(const Value: TIndexToLocationFormat);
    procedure SetLowestRecPPEM(const Value: Word);
    procedure SetMacStyle(const Value: TMacStyles);
    procedure SetModifiedDate(const Value: Int64);
    procedure SetUnitsPerEm(const Value: Word);
    procedure SetVersion(const Value: TFixedPoint);
    procedure SetXMax(const Value: SmallInt);
    procedure SetXMin(const Value: SmallInt);
    procedure SetYMax(const Value: SmallInt);
    procedure SetYMin(const Value: SmallInt);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure CheckSumAdjustmentChanged; virtual;
    procedure CreatedDateChanged; virtual;
    procedure FlagsChanged; virtual;
    procedure FontDirectionHintChanged; virtual;
    procedure FontRevisionChanged; virtual;
    procedure GlyphDataFormatChanged; virtual;
    procedure IndexToLocFormatChanged; virtual;
    procedure LowestRecPPEMChanged; virtual;
    procedure MacStyleChanged; virtual;
    procedure ModifiedDateChanged; virtual;
    procedure ResetToDefaults; override;
    procedure UnitsPerEmChanged; virtual;
    procedure VersionChanged; virtual;
    procedure XMaxChanged; virtual;
    procedure XMinChanged; virtual;
    procedure YMaxChanged; virtual;
    procedure YMinChanged; virtual;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    // table data
    property Version: TFixedPoint read FVersion write SetVersion; // = $00010000
    property FontRevision: TFixedPoint read FFontRevision write SetFontRevision; // set by font manufacturer
    property CheckSumAdjustment: Longint read FCheckSumAdjustment write SetCheckSumAdjustment; // To compute: set it to 0, calculate the checksum for the 'head' table and put it in the table directory, sum the entire font as uint32, then store B1B0AFBA - sum. The checksum for the 'head' table will not be wrong. That is OK.
    property Flags: TFontHeaderTableFlags read FFlags write SetFlags;
    property UnitsPerEm: Word read FUnitsPerEm write SetUnitsPerEm;  // range from 64 to 16384
    property CreatedDate: Int64 read FCreatedDate write SetCreatedDate; // created international date
    property ModifiedDate: Int64 read FModifiedDate write SetModifiedDate; // modified international date
    property XMin: SmallInt read FXMin write SetXMin; // for all glyph bounding boxes
    property YMin: SmallInt read FYMin write SetYMin; // for all glyph bounding boxes
    property XMax: SmallInt read FXMax write SetXMax; // for all glyph bounding boxes
    property YMax: SmallInt read FYMax write SetYMax; // for all glyph bounding boxes
    property MacStyle: TMacStyles read FMacStyle write SetMacStyle;
    property LowestRecPPEM: Word read FLowestRecPPEM write SetLowestRecPPEM; //smallest readable size in pixels
    property FontDirectionHint: TFontDirectionHint read FFontDirectionHint write SetFontDirectionHint; //0 Mixed directional glyphs
    property IndexToLocationFormat: TIndexToLocationFormat read FIndexToLocFormat write SetIndexToLocFormat; // 0 for short offsets, 1 for long
    property GlyphDataFormat: Word read FGlyphDataFormat write SetGlyphDataFormat; // 0 for current format
  end;


  // 'cmap' tables

  TCustomPascalTypeCharacterMap = class(TCustomPascalTypeTable)
  protected
    function GetFormat: Word; virtual; abstract;
  public
    function CharacterToGlyph(CharacterIndex: Integer): Integer; virtual; abstract;

    property Format: Word read GetFormat;
  end;

  TPascalTypeFormat0CharacterMap = class(TCustomPascalTypeCharacterMap)
  private
    FLength       : Word; // This is the length in bytes of the subtable.
    FLanguage     : Word; // Please see 'Note on the language field in 'cmap' subtables' in this document.
    FGlyphIdArray : array [0..255] of Byte; // An array that maps character codes to glyph index values.
  protected
    function GetFormat: Word; override;
    procedure ResetToDefaults; override;
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
    function GetFormat: Word; override;
    procedure ResetToDefaults; override;
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
    function GetFormat: Word; override;
    procedure ResetToDefaults; override;
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
    function GetFormat: Word; override;
    procedure ResetToDefaults; override;
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
    function GetFormat: Word; override;
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
  end;

  TCustomPascalTypeCharacterMapDirectory = class(TCustomPascalTypeTable)
  private
    FCharacterMap : TCustomPascalTypeCharacterMap;
    FEncodingID   : Word;
    function GetEncodingIDAsWord: Word;
    procedure SetEncodingIDAsWord(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    function GetPlatformID: TPlatformID; virtual; abstract;
    procedure EncodingIDChanged; virtual;
    property PlatformSpecificID: Word read GetEncodingIDAsWord write SetEncodingIDAsWord;
  public
    constructor Create(EncodingID: Word); reintroduce; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; virtual;

    property PlatformID: TPlatformID read GetPlatformID;
    property EncodingID: Word read GetEncodingIDAsWord;
    property CharacterMap: TCustomPascalTypeCharacterMap read FCharacterMap;
  end;

  TPascalTypeCharacterMapUnicodeDirectory = class(TCustomPascalTypeCharacterMapDirectory)
  private
    procedure SetEncodingID(const Value: TUnicodeEncodingID);
    function GetEncodingID: TUnicodeEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID: TUnicodeEncodingID read GetEncodingID write SetEncodingID;
  end;

  TPascalTypeCharacterMapMacintoshDirectory = class(TCustomPascalTypeCharacterMapDirectory)
  private
    procedure SetEncodingID(const Value: TAppleEncodingID);
    function GetEncodingID: TAppleEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID: TAppleEncodingID read GetEncodingID write SetEncodingID;
  end;

  TPascalTypeCharacterMapMicrosoftDirectory = class(TCustomPascalTypeCharacterMapDirectory)
  private
    procedure SetEncodingID(const Value: TMicrosoftEncodingID);
    function GetEncodingID: TMicrosoftEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID: TMicrosoftEncodingID read GetEncodingID write SetEncodingID;
  end;

  TPascalTypeCharacterMapDirectoryGenericEntry = class(TCustomPascalTypeCharacterMapDirectory)
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID;
  end;

  TPascalTypeCharacterMapTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion      : Word; // Version number (Set to zero)
    FSubtableList : TObjectList;
    procedure SetVersion(const Value: Word);
    function GetCharacterMapSubtableCount: Word;
    function GetCharacterMapSubtable(Index: Integer): TCustomPascalTypeCharacterMapDirectory;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure CharacterMapDirectoryChanged; virtual;
    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property CharacterMapSubtableCount: Word read GetCharacterMapSubtableCount;
    property CharacterMapSubtable[Index : Integer]: TCustomPascalTypeCharacterMapDirectory read GetCharacterMapSubtable;
  end;


  // Table 'maxp' of Maximum Profile

  TPascalTypeMaximumProfileTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion               : TFixedPoint;
    FNumGlyphs             : Word;
    FMaxPoints             : Word;
    FMaxContours           : Word;
    FMaxCompositePoints    : Word;
    FMaxCompositeContours  : Word;
    FMaxZones              : Word;
    FMaxTwilightPoints     : Word;
    FMaxStorage            : Word;
    FMaxFunctionDefs       : Word;
    FMaxInstructionDefs    : Word;
    FMaxStackElements      : Word;
    FMaxSizeOfInstructions : Word;
    FMaxComponentElements  : Word;
    FMaxComponentDepth     : Word;
    procedure SetVersion(const Value: TFixedPoint);
    procedure SetMaxComponentDepth(const Value: Word);
    procedure SetMaxComponentElements(const Value: Word);
    procedure SetMaxCompositeContours(const Value: Word);
    procedure SetMaxCompositePoints(const Value: Word);
    procedure SetMaxContours(const Value: Word);
    procedure SetMaxFunctionDefs(const Value: Word);
    procedure SetMaxInstructionDefs(const Value: Word);
    procedure SetMaxPoints(const Value: Word);
    procedure SetMaxSizeOfInstructions(const Value: Word);
    procedure SetMaxStackElements(const Value: Word);
    procedure SetMaxStorage(const Value: Word);
    procedure SetMaxTwilightPoints(const Value: Word);
    procedure SetMaxZones(const Value: Word);
    procedure SetNumGlyphs(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure MaxComponentDepthChanged; virtual;
    procedure MaxComponentElementsChanged; virtual;
    procedure MaxCompositeContoursChanged; virtual;
    procedure MaxCompositePointsChanged; virtual;
    procedure MaxContoursChanged; virtual;
    procedure MaxFunctionDefsChanged; virtual;
    procedure MaxInstructionDefsChanged; virtual;
    procedure MaxPointsChanged; virtual;
    procedure MaxSizeOfInstructionsChanged; virtual;
    procedure MaxStackElementsChanged; virtual;
    procedure MaxStorageChanged; virtual;
    procedure MaxTwilightPointsChanged; virtual;
    procedure MaxZonesChanged; virtual;
    procedure NumGlyphsChanged; virtual;
    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  published
    property Version: TFixedPoint read FVersion write SetVersion;
    property NumGlyphs: Word read FNumGlyphs write SetNumGlyphs;
    property MaxPoints: Word read FMaxPoints write SetMaxPoints;
    property MaxContours: Word read FMaxContours write SetMaxContours;
    property MaxCompositePoints: Word read FMaxCompositePoints write SetMaxCompositePoints;
    property MaxCompositeContours: Word read FMaxCompositeContours write SetMaxCompositeContours;
    property MaxZones: Word read FMaxZones write SetMaxZones;
    property MaxTwilightPoints: Word read FMaxTwilightPoints write SetMaxTwilightPoints;
    property MaxStorage: Word read FMaxStorage write SetMaxStorage;
    property MaxFunctionDefs: Word read FMaxFunctionDefs write SetMaxFunctionDefs;
    property MaxInstructionDefs: Word read FMaxInstructionDefs write SetMaxInstructionDefs;
    property MaxStackElements: Word read FMaxStackElements write SetMaxStackElements;
    property MaxSizeOfInstruction: Word read FMaxSizeOfInstructions write SetMaxSizeOfInstructions;
    property MaxComponentElements: Word read FMaxComponentElements write SetMaxComponentElements;
    property MaxComponentDepth: Word read FMaxComponentDepth write SetMaxComponentDepth;
  end;


  // Table 'hhea' of Horizontal Header

  TPascalTypeHorizontalHeaderTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion             : TFixedPoint; // set to 1.0
    FAscent              : SmallInt; // Distance from baseline of highest ascender
    FDescent             : SmallInt; // Distance from baseline of lowest descender
    FLineGap             : SmallInt; // typographic line gap
    FAdvanceWidthMax     : Word; // must be consistent with horizontal metrics
    FMinLeftSideBearing  : SmallInt; // must be consistent with horizontal metrics
    FMinRightSideBearing : SmallInt; // must be consistent with horizontal metrics
    FXMaxExtent          : SmallInt; // max(lsb + (xMax-xMin))
    FCaretSlopeRise      : SmallInt; // used to calculate the slope of the caret (rise/run) set to 1 for vertical caret
    FCaretSlopeRun       : SmallInt; // 0 for vertical
    FCaretOffset         : SmallInt; // set value to 0 for non-slanted fonts
    FMetricDataFormat    : SmallInt; // 0 for current format
    FNumOfLongHorMetrics : Word; // number of advance widths in metrics table
    procedure SetAdvanceWidthMax(const Value: Word);
    procedure SetAscent(const Value: SmallInt);
    procedure SetCaretOffset(const Value: SmallInt);
    procedure SetCaretSlopeRise(const Value: SmallInt);
    procedure SetCaretSlopeRun(const Value: SmallInt);
    procedure SetDescent(const Value: SmallInt);
    procedure SetLineGap(const Value: SmallInt);
    procedure SetMetricDataFormat(const Value: SmallInt);
    procedure SetMinLeftSideBearing(const Value: SmallInt);
    procedure SetMinRightSideBearing(const Value: SmallInt);
    procedure SetNumOfLongHorMetrics(const Value: Word);
    procedure SetVersion(const Value: TFixedPoint);
    procedure SetXMaxExtent(const Value: SmallInt);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure AdvanceWidthMaxChanged; virtual;
    procedure AscentChanged; virtual;
    procedure CaretOffsetChanged; virtual;
    procedure CaretSlopeRiseChanged; virtual;
    procedure CaretSlopeRunChanged; virtual;
    procedure DescentChanged; virtual;
    procedure LineGapChanged; virtual;
    procedure MetricDataFormatChanged; virtual;
    procedure MinLeftSideBearingChanged; virtual;
    procedure MinRightSideBearingChanged; virtual;
    procedure NumOfLongHorMetricsChanged; virtual;
    procedure VersionChanged; virtual;
    procedure XMaxExtentChanged; virtual;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  published
    property Version: TFixedPoint read FVersion write SetVersion;
    property Ascent: SmallInt read FAscent write SetAscent;
    property Descent: SmallInt read FDescent write SetDescent;
    property LineGap: SmallInt read FLineGap write SetLineGap;
    property AdvanceWidthMax: Word read FAdvanceWidthMax write SetAdvanceWidthMax;
    property MinLeftSideBearing: SmallInt read FMinLeftSideBearing write SetMinLeftSideBearing;
    property MinRightSideBearing: SmallInt read FMinRightSideBearing write SetMinRightSideBearing;
    property XMaxExtent: SmallInt read FXMaxExtent write SetXMaxExtent;
    property CaretSlopeRise: SmallInt read FCaretSlopeRise write SetCaretSlopeRise;
    property CaretSlopeRun: SmallInt read FCaretSlopeRun write SetCaretSlopeRun;
    property CaretOffset: SmallInt read FCaretOffset write SetCaretOffset;
    property MetricDataFormat: SmallInt read FMetricDataFormat write SetMetricDataFormat;
    property NumOfLongHorMetrics: Word read FNumOfLongHorMetrics write SetNumOfLongHorMetrics;
  end;


  // table 'HMTX'

  THorizontalMetric = record
    AdvanceWidth : Word;
    Bearing      : SmallInt;
  end;

  TPascalTypeHorizontalMetricsTable = class(TCustomPascalTypeNamedTable)
  private
    FHorizontalMetrics : array of THorizontalMetric;
    function GetHorizontalMetric(Index: Integer): THorizontalMetric;
    function GetHorizontalMetricCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property HorizontalMetric[Index: Integer]: THorizontalMetric read GetHorizontalMetric;
    property HorizontalMetricCount: Integer read GetHorizontalMetricCount;
  end;


  // table 'name'

  TCustomTrueTypeFontNamePlatform = class(TCustomPascalTypeTable)
  private
    FEncodingID : Word;        // Platform-specific encoding identifier.
    FLanguageID : Word;        // Language identifier.
    FNameID     : TNameID;     // Name identifiers.
    FNameString : WideString;
    function GetEncodingIDAsWord: Word;
    procedure SetEncodingIDAsWord(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    function GetPlatformID: TPlatformID; virtual; abstract;
    procedure EncodingIDChanged; virtual;

    property PlatformSpecificID: Word read GetEncodingIDAsWord write SetEncodingIDAsWord;
  public
    procedure ReadStringFromStream(Stream: TStream; Length: Word); virtual; abstract;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Name: WideString read FNameString;
    property NameID: TNameID read FNameID;
    property PlatformID: TPlatformID read GetPlatformID;
    property LanguageID: Word read FLanguageID;
  end;

  TTrueTypeFontNamePlatformUnicode = class(TCustomTrueTypeFontNamePlatform)
  private
    procedure SetEncodingID(const Value: TUnicodeEncodingID);
    function GetEncodingID: TUnicodeEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    procedure ReadStringFromStream(Stream: TStream; Length: Word); override;

    property PlatformSpecificID: TUnicodeEncodingID read GetEncodingID write SetEncodingID;
  end;

  TTrueTypeFontNamePlatformApple = class(TCustomTrueTypeFontNamePlatform)
  private
    function GetEncodingID: TAppleEncodingID;
    procedure SetEncodingID(const Value: TAppleEncodingID);
  protected
    function GetPlatformID: TPlatformID; override;
  public
    procedure ReadStringFromStream(Stream: TStream; Length: Word); override;

    property PlatformSpecificID: TAppleEncodingID read GetEncodingID write SetEncodingID;
  end;

  TTrueTypeFontNamePlatformMicrosoft = class(TCustomTrueTypeFontNamePlatform)
  private
    function GetEncodingID: TMicrosoftEncodingID;
    procedure SetEncodingID(const Value: TMicrosoftEncodingID);
  protected
    function GetPlatformID: TPlatformID; override;
  public
    procedure ReadStringFromStream(Stream: TStream; Length: Word); override;

    property PlatformSpecificID: TMicrosoftEncodingID read GetEncodingID write SetEncodingID;
  end;

  TTrueTypeFontNamePlatformISO = class(TCustomTrueTypeFontNamePlatform)
  protected
    function GetPlatformID: TPlatformID; override;
  public
    procedure ReadStringFromStream(Stream: TStream; Length: Word); override;
  end;

  TPascalTypeNameTable = class(TCustomPascalTypeNamedTable)
  private
    FFormat      : Word; // Format selector. Set to 0.
    FNameRecords : TObjectList;
    procedure SetFormat(const Value: Word);
    function GetNameRecord(Index: Word): TCustomTrueTypeFontNamePlatform;
    function GetNameRecordCount: Word;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    procedure FormatChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Format: Word read FFormat write SetFormat;
    property NameRecordCount: Word read GetNameRecordCount;
    property NameRecord[Index: Word]: TCustomTrueTypeFontNamePlatform read GetNameRecord;
  end;


  // Table "OS/2"

  TCustomPascalTypePanoseTable = class(TCustomPascalTypeTable)
  private
    function GetData(Index: Byte): Byte;
    procedure SetData(Index: Byte; const Value: Byte);
  protected
    FData : array [0..8] of Byte;

    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    class function GetFamilyType: Byte; virtual; abstract;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Data[Index: Byte]: Byte read GetData write SetData;
    property FamilyType: Byte read GetFamilyType;
  end;
  TCustomPascalTypePanoseClass = class of TCustomPascalTypePanoseTable;

  TPascalTypeDefaultPanoseTable = class(TCustomPascalTypePanoseTable)
  private
    FFamilyType : Byte;
  protected
    class function GetFamilyType: Byte; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property FamilyType: Byte read FFamilyType;
  end;

  TPascalTypeUnicodeRangeTable = class(TCustomPascalTypeTable)
  private
    FUnicodeRange : TOS2UnicodeRange; // Field is split into two bit fields of 96 and 36 bits each. The low 96 bits are used to specify the Unicode blocks encompassed by the font file. The high 32 bits are used to specify the character or script sets covered by the font file. Bit assignments are pending. Set to 01

    function GetAsCardinal(Index: Byte): Cardinal;
    procedure SetAsCardinal(Index: Byte; const Value: Cardinal);
    function GetAsString: string;
    function GetSupportsAegeanNumbers: Boolean;
    function GetSupportsAlphabeticPresentationForms: Boolean;
    function GetSupportsAncientGreekNumbers: Boolean;
    function GetSupportsAncientSymbols: Boolean;
    function GetSupportsArabic: Boolean;
    function GetSupportsArabicPresentationFormsA: Boolean;
    function GetSupportsArabicPresentationFormsB: Boolean;
    function GetSupportsArabicSupplement: Boolean;
    function GetSupportsArmenian: Boolean;
    function GetSupportsArrows: Boolean;
    function GetSupportsBalinese: Boolean;
    function GetSupportsBasicLatin: Boolean;
    function GetSupportsBengali: Boolean;
    function GetSupportsBlockElements: Boolean;
    function GetSupportsBopomofo: Boolean;
    function GetSupportsBopomofoExtended: Boolean;
    function GetSupportsBoxDrawing: Boolean;
    function GetSupportsBraillePatterns: Boolean;
    function GetSupportsBuginese: Boolean;
    function GetSupportsBuhid: Boolean;
    function GetSupportsCarian: Boolean;
    function GetSupportsCham: Boolean;
    function GetSupportsCherokee: Boolean;
    function GetSupportsCJKCompatibility: Boolean;
    function GetSupportsCJKCompatibilityForms: Boolean;
    function GetSupportsCJKCompatibilityIdeographs: Boolean;
    function GetSupportsCJKCompatibilityIdeographsSupplement: Boolean;
    function GetSupportsCJKRadicalsSupplement: Boolean;
    function GetSupportsCJKStrokes: Boolean;
    function GetSupportsCJKSymbolsAndPunctuation: Boolean;
    function GetSupportsCJKUnifiedIdeographs: Boolean;
    function GetSupportsCombiningDiacriticalMarks: Boolean;
    function GetSupportsCombiningDiacriticalMarksForSymbols: Boolean;
    function GetSupportsCombiningDiacriticalMarksSupplement: Boolean;
    function GetSupportsCombiningHalfMarks: Boolean;
    function GetSupportsControlPictures: Boolean;
    function GetSupportsCoptic: Boolean;
    function GetSupportsCountingRodNumerals: Boolean;
    function GetSupportsCuneiform: Boolean;
    function GetSupportsCypriotSyllabary: Boolean;
    function GetSupportsCyrillic: Boolean;
    function GetSupportsCyrillicExtendedA: Boolean;
    function GetSupportsCyrillicExtendedB: Boolean;
    function GetSupportsCyrillicSupplement: Boolean;
    function GetSupportsDeseret: Boolean;
    function GetSupportsDevanagari: Boolean;
    function GetSupportsDingbats: Boolean;
    function GetSupportsDominoTiles: Boolean;
    function GetSupportsEnclosedAlphanumerics: Boolean;
    function GetSupportsEthiopic: Boolean;
    function GetSupportsEthiopicExtended: Boolean;
    function GetSupportsEthiopicSupplement: Boolean;
    function GetSupportsGeneralPunctuation: Boolean;
    function GetSupportsGeometricShapes: Boolean;
    function GetSupportsGeorgian: Boolean;
    function GetSupportsGeorgianSupplement: Boolean;
    function GetSupportsGlagolitic: Boolean;
    function GetSupportsGothic: Boolean;
    function GetSupportsGreekandCoptic: Boolean;
    function GetSupportsGreekExtended: Boolean;
    function GetSupportsGujarati: Boolean;
    function GetSupportsGurmukhi: Boolean;
    function GetSupportsHalfwidthAndFullwidthForms: Boolean;
    function GetSupportsHangulCompatibilityJamo: Boolean;
    function GetSupportsHangulJamo: Boolean;
    function GetSupportsHangulSyllables: Boolean;
    function GetSupportsHanunoo: Boolean;
    function GetSupportsHebrew: Boolean;
    function GetSupportsHiragana: Boolean;
    function GetSupportsIPAExtensions: Boolean;
    function GetSupportsKanbun: Boolean;
    function GetSupportsKangxiRadicals: Boolean;
    function GetSupportsKannada: Boolean;
    function GetSupportsKatakana: Boolean;
    function GetSupportsKatakanaPhoneticExtensions: Boolean;
    function GetSupportsKayahLi: Boolean;
    function GetSupportsKharoshthi: Boolean;
    function GetSupportsKhmer: Boolean;
    function GetSupportsKhmerSymbols: Boolean;
    function GetSupportsLao: Boolean;
    function GetSupportsLatin1Supplement: Boolean;
    function GetSupportsLatinExtendedA: Boolean;
    function GetSupportsLatinExtendedAdditional: Boolean;
    function GetSupportsLatinExtendedB: Boolean;
    function GetSupportsLatinExtendedC: Boolean;
    function GetSupportsLatinExtendedD: Boolean;
    function GetSupportsLepcha: Boolean;
    function GetSupportsLetterlikeSymbols: Boolean;
    function GetSupportsLimbu: Boolean;
    function GetSupportsLinearBIdeograms: Boolean;
    function GetSupportsLinearBSyllabary: Boolean;
    function GetSupportsLycian: Boolean;
    function GetSupportsLydian: Boolean;
    function GetSupportsMahjongTiles: Boolean;
    function GetSupportsMalayalam: Boolean;
    function GetSupportsMathematicalOperators: Boolean;
    function GetSupportsMiscellaneousMathematicalSymbolsA: Boolean;
    function GetSupportsMiscellaneousMathematicalSymbolsB: Boolean;
    function GetSupportsMiscellaneousSymbols: Boolean;
    function GetSupportsMiscellaneousSymbolsAndArrows: Boolean;
    function GetSupportsMiscellaneousTechnical: Boolean;
    function GetSupportsModifierToneLetters: Boolean;
    function GetSupportsMongolian: Boolean;
    function GetSupportsMusicalSymbols: Boolean;
    function GetSupportsMyanmar: Boolean;
    function GetSupportsNKo: Boolean;
    function GetSupportsNonPlane0: Boolean;
    function GetSupportsOgham: Boolean;
    function GetSupportsOlChiki: Boolean;
    function GetSupportsOldItalic: Boolean;
    function GetSupportsOldPersian: Boolean;
    function GetSupportsOpticalCharacterRecognition: Boolean;
    function GetSupportsOriya: Boolean;
    function GetSupportsOsmanya: Boolean;
    function GetSupportsPhagsPa: Boolean;
    function GetSupportsPhaistosDisc: Boolean;
    function GetSupportsPhoenician: Boolean;
    function GetSupportsPhoneticExtensions: Boolean;
    function GetSupportsPhoneticExtensionsSupplement: Boolean;
    function GetSupportsPrivateUseAreaPlane0: Boolean;
    function GetSupportsPrivateUsePlane15: Boolean;
    function GetSupportsPrivateUsePlane16: Boolean;
    function GetSupportsRejang: Boolean;
    function GetSupportsRunic: Boolean;
    function GetSupportsSaurashtra: Boolean;
    function GetSupportsShavian: Boolean;
    function GetSupportsSinhala: Boolean;
    function GetSupportsSmallFormVariants: Boolean;
    function GetSupportsSpacingModifierLetters: Boolean;
    function GetSupportsSpecials: Boolean;
    function GetSupportsSundanese: Boolean;
    function GetSupportsSuperscriptsAndSubscripts: Boolean;
    function GetSupportsSupplementalArrowsA: Boolean;
    function GetSupportsSupplementalArrowsB: Boolean;
    function GetSupportsSupplementalMathematicalOperators: Boolean;
    function GetSupportsSupplementalPunctuation: Boolean;
    function GetSupportsSylotiNagri: Boolean;
    function GetSupportsSyriac: Boolean;
    function GetSupportsTagalog: Boolean;
    function GetSupportsTagbanwa: Boolean;
    function GetSupportsTags: Boolean;
    function GetSupportsTaiLe: Boolean;
    function GetSupportsTaiXuanJingSymbols: Boolean;
    function GetSupportsTamil: Boolean;
    function GetSupportsTelugu: Boolean;
    function GetSupportsThaana: Boolean;
    function GetSupportsThai: Boolean;
    function GetSupportsTibetan: Boolean;
    function GetSupportsTifinagh: Boolean;
    function GetSupportsUgaritic: Boolean;
    function GetSupportsUnifiedCanadianAboriginalSyllabics: Boolean;
    function GetSupportsVai: Boolean;
    function GetSupportsVariationSelectors: Boolean;
    function GetSupportsVariationSelectorsSupplement: Boolean;
    function GetSupportsVerticalForms: Boolean;
    function GetSupportsYijingHexagramSymbols: Boolean;
    function GetSupportsYiRadicals: Boolean;
    function GetSupportsYiSyllables: Boolean;
    function GetSupportsCurrencySymbols: Boolean;
    function GetSupportsNumberForms: Boolean;
    function GetSupportsEnclosedCJKLettersAndMonths: Boolean;
    function GetSupportsIdeographicDescriptionCharacters: Boolean;
    function GetSupportsCJKUnifiedIdeographsExtensionA: Boolean;
    function GetSupportsCJKUnifiedIdeographsExtensionB: Boolean;
    function GetSupportsAncientGreekMusicalNotation: Boolean;
    function GetSupportsByzantineMusicalSymbols: Boolean;
    function GetSupportsMathematicalAlphanumericSymbols: Boolean;
    function GetSupportsNewTaiLue: Boolean;
    function GetSupportsCuneiformNumbersAndPunctuation: Boolean;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property AsCardinal[Index: Byte]: Cardinal read GetAsCardinal write SetAsCardinal;
    property AsString: string read GetAsString;

    property SupportsBasicLatin: Boolean read GetSupportsBasicLatin;
    property SupportsLatin1Supplement: Boolean read GetSupportsLatin1Supplement;
    property SupportsLatinExtendedA: Boolean read GetSupportsLatinExtendedA;
    property SupportsLatinExtendedB: Boolean read GetSupportsLatinExtendedB;
    property SupportsIPAExtensions: Boolean read GetSupportsIPAExtensions;
    property SupportsPhoneticExtensions: Boolean read GetSupportsPhoneticExtensions;
    property SupportsPhoneticExtensionsSupplement: Boolean read GetSupportsPhoneticExtensionsSupplement;
    property SupportsSpacingModifierLetters: Boolean read GetSupportsSpacingModifierLetters;
    property SupportsModifierToneLetters: Boolean read GetSupportsModifierToneLetters;
    property SupportsCombiningDiacriticalMarks: Boolean read GetSupportsCombiningDiacriticalMarks;
    property SupportsCombiningDiacriticalMarksSupplement: Boolean read GetSupportsCombiningDiacriticalMarksSupplement;
    property SupportsGreekandCoptic: Boolean read GetSupportsGreekandCoptic;
    property SupportsCoptic: Boolean read GetSupportsCoptic;
    property SupportsCyrillic: Boolean read GetSupportsCyrillic;
    property SupportsCyrillicSupplement: Boolean read GetSupportsCyrillicSupplement;
    property SupportsCyrillicExtendedA: Boolean read GetSupportsCyrillicExtendedA;
    property SupportsCyrillicExtendedB: Boolean read GetSupportsCyrillicExtendedB;
    property SupportsArmenian: Boolean read GetSupportsArmenian;
    property SupportsHebrew: Boolean read GetSupportsHebrew;
    property SupportsVai: Boolean read GetSupportsVai;
    property SupportsArabic: Boolean read GetSupportsArabic;
    property SupportsArabicSupplement: Boolean read GetSupportsArabicSupplement;
    property SupportsNKo: Boolean read GetSupportsNKo;
    property SupportsDevanagari: Boolean read GetSupportsDevanagari;
    property SupportsBengali: Boolean read GetSupportsBengali;
    property SupportsGurmukhi: Boolean read GetSupportsGurmukhi;
    property SupportsGujarati: Boolean read GetSupportsGujarati;
    property SupportsOriya: Boolean read GetSupportsOriya;
    property SupportsTamil: Boolean read GetSupportsTamil;
    property SupportsTelugu: Boolean read GetSupportsTelugu;
    property SupportsKannada: Boolean read GetSupportsKannada;
    property SupportsMalayalam: Boolean read GetSupportsMalayalam;
    property SupportsThai: Boolean read GetSupportsThai;
    property SupportsLao: Boolean read GetSupportsLao;
    property SupportsGeorgian: Boolean read GetSupportsGeorgian;
    property SupportsGeorgianSupplement: Boolean read GetSupportsGeorgianSupplement;
    property SupportsBalinese: Boolean read GetSupportsBalinese;
    property SupportsHangulJamo: Boolean read GetSupportsHangulJamo;
    property SupportsLatinExtendedAdditional: Boolean read GetSupportsLatinExtendedAdditional;
    property SupportsLatinExtendedC: Boolean read GetSupportsLatinExtendedC;
    property SupportsLatinExtendedD: Boolean read GetSupportsLatinExtendedD;
    property SupportsGreekExtended: Boolean read GetSupportsGreekExtended;
    property SupportsGeneralPunctuation: Boolean read GetSupportsGeneralPunctuation;
    property SupportsSupplementalPunctuation: Boolean read GetSupportsSupplementalPunctuation;
    property SupportsSuperscriptsAndSubscripts: Boolean read GetSupportsSuperscriptsAndSubscripts;
    property SupportsCurrencySymbols: Boolean read GetSupportsCurrencySymbols;
    property SupportsCombiningDiacriticalMarksForSymbols: Boolean read GetSupportsCombiningDiacriticalMarksForSymbols;
    property SupportsLetterlikeSymbols: Boolean read GetSupportsLetterlikeSymbols;
    property SupportsNumberForms: Boolean read GetSupportsNumberForms;
    property SupportsArrows: Boolean read GetSupportsArrows;
    property SupportsSupplementalArrowsA: Boolean read GetSupportsSupplementalArrowsA;
    property SupportsSupplementalArrowsB: Boolean read GetSupportsSupplementalArrowsB;
    property SupportsMiscellaneousSymbolsAndArrows: Boolean read GetSupportsMiscellaneousSymbolsAndArrows;
    property SupportsMathematicalOperators: Boolean read GetSupportsMathematicalOperators;
    property SupportsSupplementalMathematicalOperators: Boolean read GetSupportsSupplementalMathematicalOperators;
    property SupportsMiscellaneousMathematicalSymbolsA: Boolean read GetSupportsMiscellaneousMathematicalSymbolsA;
    property SupportsMiscellaneousMathematicalSymbolsB: Boolean read GetSupportsMiscellaneousMathematicalSymbolsB;
    property SupportsMiscellaneousTechnical: Boolean read GetSupportsMiscellaneousTechnical;
    property SupportsControlPictures: Boolean read GetSupportsControlPictures;
    property SupportsOpticalCharacterRecognition: Boolean read GetSupportsOpticalCharacterRecognition;
    property SupportsEnclosedAlphanumerics: Boolean read GetSupportsEnclosedAlphanumerics;
    property SupportsBoxDrawing: Boolean read GetSupportsBoxDrawing;
    property SupportsBlockElements: Boolean read GetSupportsBlockElements;
    property SupportsGeometricShapes: Boolean read GetSupportsGeometricShapes;
    property SupportsMiscellaneousSymbols: Boolean read GetSupportsMiscellaneousSymbols;
    property SupportsDingbats: Boolean read GetSupportsDingbats;
    property SupportsCJKSymbolsAndPunctuation: Boolean read GetSupportsCJKSymbolsAndPunctuation;
    property SupportsHiragana: Boolean read GetSupportsHiragana;
    property SupportsKatakana: Boolean read GetSupportsKatakana;
    property SupportsKatakanaPhoneticExtensions: Boolean read GetSupportsKatakanaPhoneticExtensions;
    property SupportsBopomofo: Boolean read GetSupportsBopomofo;
    property SupportsBopomofoExtended: Boolean read GetSupportsBopomofoExtended;
    property SupportsHangulCompatibilityJamo: Boolean read GetSupportsHangulCompatibilityJamo;
    property SupportsPhagsPa: Boolean read GetSupportsPhagsPa;
    property SupportsEnclosedCJKLettersAndMonths: Boolean read GetSupportsEnclosedCJKLettersAndMonths;
    property SupportsCJKCompatibility: Boolean read GetSupportsCJKCompatibility;
    property SupportsHangulSyllables: Boolean read GetSupportsHangulSyllables;
    property SupportsNonPlane0: Boolean read GetSupportsNonPlane0;
    property SupportsPhoenician: Boolean read GetSupportsPhoenician;
    property SupportsCJKUnifiedIdeographs: Boolean read GetSupportsCJKUnifiedIdeographs;
    property SupportsCJKRadicalsSupplement: Boolean read GetSupportsCJKRadicalsSupplement;
    property SupportsKangxiRadicals: Boolean read GetSupportsKangxiRadicals;
    property SupportsIdeographicDescriptionCharacters: Boolean read GetSupportsIdeographicDescriptionCharacters;
    property SupportsCJKUnifiedIdeographsExtensionA: Boolean read GetSupportsCJKUnifiedIdeographsExtensionA;
    property SupportsCJKUnifiedIdeographsExtensionB: Boolean read GetSupportsCJKUnifiedIdeographsExtensionB;
    property SupportsKanbun: Boolean read GetSupportsKanbun;
    property SupportsPrivateUseAreaPlane0: Boolean read GetSupportsPrivateUseAreaPlane0;
    property SupportsCJKStrokes: Boolean read GetSupportsCJKStrokes;
    property SupportsCJKCompatibilityIdeographs: Boolean read GetSupportsCJKCompatibilityIdeographs;
    property SupportsCJKCompatibilityIdeographsSupplement: Boolean read GetSupportsCJKCompatibilityIdeographsSupplement;
    property SupportsAlphabeticPresentationForms: Boolean read GetSupportsAlphabeticPresentationForms;
    property SupportsArabicPresentationFormsA: Boolean read GetSupportsArabicPresentationFormsA;
    property SupportsCombiningHalfMarks: Boolean read GetSupportsCombiningHalfMarks;
    property SupportsVerticalForms: Boolean read GetSupportsVerticalForms;
    property SupportsCJKCompatibilityForms: Boolean read GetSupportsCJKCompatibilityForms;
    property SupportsSmallFormVariants: Boolean read GetSupportsSmallFormVariants;
    property SupportsArabicPresentationFormsB: Boolean read GetSupportsArabicPresentationFormsB;
    property SupportsHalfwidthAndFullwidthForms: Boolean read GetSupportsHalfwidthAndFullwidthForms;
    property SupportsSpecials: Boolean read GetSupportsSpecials;
    property SupportsTibetan: Boolean read GetSupportsTibetan;
    property SupportsSyriac: Boolean read GetSupportsSyriac;
    property SupportsThaana: Boolean read GetSupportsThaana;
    property SupportsSinhala: Boolean read GetSupportsSinhala;
    property SupportsMyanmar: Boolean read GetSupportsMyanmar;
    property SupportsEthiopic: Boolean read GetSupportsEthiopic;
    property SupportsEthiopicSupplement: Boolean read GetSupportsEthiopicSupplement;
    property SupportsEthiopicExtended: Boolean read GetSupportsEthiopicExtended;
    property SupportsCherokee: Boolean read GetSupportsCherokee;
    property SupportsUnifiedCanadianAboriginalSyllabics: Boolean read GetSupportsUnifiedCanadianAboriginalSyllabics;
    property SupportsOgham: Boolean read GetSupportsOgham;
    property SupportsRunic: Boolean read GetSupportsRunic;
    property SupportsKhmer: Boolean read GetSupportsKhmer;
    property SupportsKhmerSymbols: Boolean read GetSupportsKhmerSymbols;
    property SupportsMongolian: Boolean read GetSupportsMongolian;
    property SupportsBraillePatterns: Boolean read GetSupportsBraillePatterns;
    property SupportsYiSyllables: Boolean read GetSupportsYiSyllables;
    property SupportsYiRadicals: Boolean read GetSupportsYiRadicals;
    property SupportsTagalog: Boolean read GetSupportsTagalog;
    property SupportsHanunoo: Boolean read GetSupportsHanunoo;
    property SupportsBuhid: Boolean read GetSupportsBuhid;
    property SupportsTagbanwa: Boolean read GetSupportsTagbanwa;
    property SupportsOldItalic: Boolean read GetSupportsOldItalic;
    property SupportsGothic: Boolean read GetSupportsGothic;
    property SupportsDeseret: Boolean read GetSupportsDeseret;
    property SupportsByzantineMusicalSymbols: Boolean read GetSupportsByzantineMusicalSymbols;
    property SupportsMusicalSymbols: Boolean read GetSupportsMusicalSymbols;
    property SupportsAncientGreekMusicalNotation: Boolean read GetSupportsAncientGreekMusicalNotation;
    property SupportsMathematicalAlphanumericSymbols: Boolean read GetSupportsMathematicalAlphanumericSymbols;
    property SupportsPrivateUsePlane15: Boolean read GetSupportsPrivateUsePlane15;
    property SupportsPrivateUsePlane16: Boolean read GetSupportsPrivateUsePlane16;
    property SupportsVariationSelectors: Boolean read GetSupportsVariationSelectors;
    property SupportsVariationSelectorsSupplement: Boolean read GetSupportsVariationSelectorsSupplement;
    property SupportsTags: Boolean read GetSupportsTags;
    property SupportsLimbu: Boolean read GetSupportsLimbu;
    property SupportsTaiLe: Boolean read GetSupportsTaiLe;
    property SupportsNewTaiLue: Boolean read GetSupportsNewTaiLue;
    property SupportsBuginese: Boolean read GetSupportsBuginese;
    property SupportsGlagolitic: Boolean read GetSupportsGlagolitic;
    property SupportsTifinagh: Boolean read GetSupportsTifinagh;
    property SupportsYijingHexagramSymbols: Boolean read GetSupportsYijingHexagramSymbols;
    property SupportsSylotiNagri: Boolean read GetSupportsSylotiNagri;
    property SupportsLinearBSyllabary: Boolean read GetSupportsLinearBSyllabary;
    property SupportsLinearBIdeograms: Boolean read GetSupportsLinearBIdeograms;
    property SupportsAegeanNumbers: Boolean read GetSupportsAegeanNumbers;
    property SupportsAncientGreekNumbers: Boolean read GetSupportsAncientGreekNumbers;
    property SupportsUgaritic: Boolean read GetSupportsUgaritic;
    property SupportsOldPersian: Boolean read GetSupportsOldPersian;
    property SupportsShavian: Boolean read GetSupportsShavian;
    property SupportsOsmanya: Boolean read GetSupportsOsmanya;
    property SupportsCypriotSyllabary: Boolean read GetSupportsCypriotSyllabary;
    property SupportsKharoshthi: Boolean read GetSupportsKharoshthi;
    property SupportsTaiXuanJingSymbols: Boolean read GetSupportsTaiXuanJingSymbols;
    property SupportsCuneiform: Boolean read GetSupportsCuneiform;
    property SupportsCuneiformNumbersAndPunctuation: Boolean read GetSupportsCuneiformNumbersAndPunctuation;
    property SupportsCountingRodNumerals: Boolean read GetSupportsCountingRodNumerals;
    property SupportsSundanese: Boolean read GetSupportsSundanese;
    property SupportsLepcha: Boolean read GetSupportsLepcha;
    property SupportsOlChiki: Boolean read GetSupportsOlChiki;
    property SupportsSaurashtra: Boolean read GetSupportsSaurashtra;
    property SupportsKayahLi: Boolean read GetSupportsKayahLi;
    property SupportsRejang: Boolean read GetSupportsRejang;
    property SupportsCham: Boolean read GetSupportsCham;
    property SupportsAncientSymbols: Boolean read GetSupportsAncientSymbols;
    property SupportsPhaistosDisc: Boolean read GetSupportsPhaistosDisc;
    property SupportsCarian: Boolean read GetSupportsCarian;
    property SupportsLycian: Boolean read GetSupportsLycian;
    property SupportsLydian: Boolean read GetSupportsLydian;
    property SupportsDominoTiles: Boolean read GetSupportsDominoTiles;
    property SupportsMahjongTiles: Boolean read GetSupportsMahjongTiles;
  end;

  TPascalTypeOS2CodePageRangeTable = class(TCustomPascalTypeTable)
  private
    FCodePageRange : TOS2CodePageRange;
    function GetSupportsAlternativeArabic: Boolean;
    function GetSupportsAlternativeHebrew: Boolean;
    function GetSupportsArabic: Boolean;
    function GetSupportsASMO708: Boolean;
    function GetSupportsChineseSimplified: Boolean;
    function GetSupportsChineseTraditional: Boolean;
    function GetSupportsCyrillic: Boolean;
    function GetSupportsGreek: Boolean;
    function GetSupportsGreekFormer437G: Boolean;
    function GetSupportsHebrew: Boolean;
    function GetSupportsIBMCyrillic: Boolean;
    function GetSupportsIBMGreek: Boolean;
    function GetSupportsIBMTurkish: Boolean;
    function GetSupportsJISJapan: Boolean;
    function GetSupportsKoreanJohab: Boolean;
    function GetSupportsKoreanWansung: Boolean;
    function GetSupportsLatin1: Boolean;
    function GetSupportsLatin2: Boolean;
    function GetSupportsLatin2EasternEurope: Boolean;
    function GetSupportsMacintoshCharacterSet: Boolean;
    function GetSupportsMSDOSBaltic: Boolean;
    function GetSupportsMSDOSCanadianFrench: Boolean;
    function GetSupportsMSDOSIcelandic: Boolean;
    function GetSupportsMSDOSNordic: Boolean;
    function GetSupportsMSDOSPortuguese: Boolean;
    function GetSupportsMSDOSRussian: Boolean;
    function GetSupportsOEMCharacter: Boolean;
    function GetSupportsThai: Boolean;
    function GetSupportsTurkish: Boolean;
    function GetSupportsUS: Boolean;
    function GetSupportsVietnamese: Boolean;
    function GetSupportsWELatin1: Boolean;
    function GetSupportsWindowsBaltic: Boolean;
    function GetSupportsSymbolCharacterSet: Boolean;
    function GetAsCardinal(Index: Byte): Cardinal;
    function GetAsString: string;
    procedure SetAsCardinal(Index: Byte; const Value: Cardinal);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property AsCardinal[Index: Byte]: Cardinal read GetAsCardinal write SetAsCardinal;
    property AsString: string read GetAsString;

    property SupportsLatin1: Boolean read GetSupportsLatin1;
    property SupportsLatin2EasternEurope: Boolean read GetSupportsLatin2EasternEurope;
    property SupportsCyrillic: Boolean read GetSupportsCyrillic;
    property SupportsGreek: Boolean read GetSupportsGreek;
    property SupportsTurkish: Boolean read GetSupportsTurkish;
    property SupportsHebrew: Boolean read GetSupportsHebrew;
    property SupportsArabic: Boolean read GetSupportsArabic;
    property SupportsWindowsBaltic: Boolean read GetSupportsWindowsBaltic;
    property SupportsVietnamese: Boolean read GetSupportsVietnamese;
    property SupportsThai: Boolean read GetSupportsThai;
    property SupportsJISJapan: Boolean read GetSupportsJISJapan;
    property SupportsChineseSimplified: Boolean read GetSupportsChineseSimplified;
    property SupportsKoreanWansung: Boolean read GetSupportsKoreanWansung;
    property SupportsChineseTraditional: Boolean read GetSupportsChineseTraditional;
    property SupportsKoreanJohab: Boolean read GetSupportsKoreanJohab;
    property SupportsMacintoshCharacterSet: Boolean read GetSupportsMacintoshCharacterSet;
    property SupportsOEMCharacter: Boolean read GetSupportsOEMCharacter;
    property SupportsSymbolCharacterSet: Boolean read GetSupportsSymbolCharacterSet;
    property SupportsIBMGreek: Boolean read GetSupportsIBMGreek;
    property SupportsMSDOSRussian: Boolean read GetSupportsMSDOSRussian;
    property SupportsMSDOSNordic: Boolean read GetSupportsMSDOSNordic;
    property SupportsAlternativeArabic: Boolean read GetSupportsAlternativeArabic;
    property SupportsMSDOSCanadianFrench: Boolean read GetSupportsMSDOSCanadianFrench;
    property SupportsAlternativeHebrew: Boolean read GetSupportsAlternativeHebrew;
    property SupportsMSDOSIcelandic: Boolean read GetSupportsMSDOSIcelandic;
    property SupportsMSDOSPortuguese: Boolean read GetSupportsMSDOSPortuguese;
    property SupportsIBMTurkish: Boolean read GetSupportsIBMTurkish;
    property SupportsIBMCyrillic: Boolean read GetSupportsIBMCyrillic;
    property SupportsLatin2: Boolean read GetSupportsLatin2;
    property SupportsMSDOSBaltic: Boolean read GetSupportsMSDOSBaltic;
    property SupportsGreekFormer437G: Boolean read GetSupportsGreekFormer437G;
    property SupportsArabicASMO708: Boolean read GetSupportsASMO708;
    property SupportsWELatin1: Boolean read GetSupportsWELatin1;
    property SupportsUS: Boolean read GetSupportsUS;
  end;

  TPascalTypeOS2AddendumTable = class(TCustomPascalTypeTable)
  private
    FXHeight     : SmallInt;
    FCapHeight   : SmallInt;
    FDefaultChar : Word;
    FBreakChar   : Word;
    FMaxContext  : Word;
    procedure SetBreakChar(const Value: Word);
    procedure SetCapHeight(const Value: SmallInt);
    procedure SetDefaultChar(const Value: Word);
    procedure SetMaxContext(const Value: Word);
    procedure SetXHeight(const Value: SmallInt);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure BreakCharChanged; virtual;
    procedure CapHeightChanged; virtual;
    procedure DefaultCharChanged; virtual;
    procedure MaxContextChanged; virtual;
    procedure XHeightChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property XHeight: SmallInt read FXHeight write SetXHeight;
    property CapHeight: SmallInt read FCapHeight write SetCapHeight;
    property DefaultChar: Word read FDefaultChar write SetDefaultChar;
    property BreakChar: Word read FBreakChar write SetBreakChar;
    property MaxContext: Word read FMaxContext write SetMaxContext;
  end;

  TPascalTypeOS2Table = class(TCustomPascalTypeNamedTable)
  private
    FVersion               : Word;       // table version number (set to 0)
    FAverageCharacterWidth : SmallInt;   // average weighted advance width of lower case letters and space
    FWeight                : Word;       // visual weight (degree of blackness or thickness) of stroke in glyphs
    FWidthType             : Word;       // relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in the font
    FFontEmbeddingFlags    : Word;       // characteristics and properties of this font (set undefined bits to zero)
    FSubscriptSizeX       : SmallInt;   // recommended horizontal size in pixels for subscripts
    FSubscriptSizeY       : SmallInt;   // recommended vertical size in pixels for subscripts
    FSubScriptOffsetX     : SmallInt;   // recommended horizontal offset for subscripts
    FSubscriptYOffsetY     : SmallInt;   // recommended vertical offset form the baseline for subscripts
    FSuperscriptSizeX     : SmallInt;   // recommended horizontal size in pixels for superscripts
    FSuperscriptSizeY     : SmallInt;   // recommended vertical size in pixels for superscripts
    FSuperscriptOffsetX   : SmallInt;   // recommended horizontal offset for superscripts
    FSuperscriptOffsetY   : SmallInt;   // recommended vertical offset from the baseline for superscripts
    FStrikeoutSize        : SmallInt;   // width of the strikeout stroke
    FStrikeoutPosition    : SmallInt;   // position of the strikeout stroke relative to the baseline
    FFontFamilyType        : Word;       // classification of font-family design.
    FFontVendorID          : TTableType; // four character identifier for the font vendor
    FFontSelection         : Word;       // 2-byte bit field containing information concerning the nature of the font patterns
    FUnicodeFirstCharIndex : Word;       // The minimum Unicode index in this font.
    FUnicodeLastCharIndex  : Word;       // The maximum Unicode index in this font.
    FTypographicAscent   : SmallInt;
    FTypographicDescent  : SmallInt;
    FTypographicLineGap    : SmallInt;
    FWindowsAscent         : Word;
    FWindowsDescent        : Word;

    FPanose                : TCustomPascalTypePanoseTable;
    FUnicodeRangeTable     : TPascalTypeUnicodeRangeTable;
    FCodePageRange         : TPascalTypeOS2CodePageRangeTable;
    FAddendumTable         : TPascalTypeOS2AddendumTable;
    function GetFontEmbeddingRights: TOS2FontEmbeddingRights;
    function GetFontFamilyClassID: Byte;
    function GetFontFamilySubClassID: Byte;
    function GetFontSelectionFlags: TOS2FontSelectionFlags;
    function GetWeightClass: TOS2WeightClass;
    function GetWidthClass: TOS2WidthClass;
    procedure SetFontEmbeddingFlags(const Value: Word);
    procedure SetFontEmbeddingRights(const Value: TOS2FontEmbeddingRights);
    procedure SetFontFamilyClassID(const Value: Byte);
    procedure SetFontFamilySubClassID(const Value: Byte);
    procedure SetFontFamilyType(const Value: Word);
    procedure SetFontSelection(const Value: Word);
    procedure SetFontSelectionFlags(const Value: TOS2FontSelectionFlags);
    procedure SetFontVendorID(const Value: TTableType);
    procedure SetPanose(const Value: TCustomPascalTypePanoseTable);
    procedure SetTypographicAscent(const Value: SmallInt);
    procedure SetTypographicDescent(const Value: SmallInt);
    procedure SetTypographicLineGap(const Value: SmallInt);
    procedure SetUnicodeFirstCharIndex(const Value: Word);
    procedure SetUnicodeLastCharIndex(const Value: Word);
    procedure SetWindowsAscent(const Value: Word);
    procedure SetWindowsDescent(const Value: Word);
    procedure SetVersion(const Value: Word);
    procedure SetWeight(const Value: Word);
    procedure SetWeightClass(const Value: TOS2WeightClass);
    procedure SetWidthClass(const Value: TOS2WidthClass);
    procedure SetWidthType(const Value: Word);
    procedure SetAverageCharacterWidth(const Value: SmallInt);
    procedure SetStrikeoutPosition(const Value: SmallInt);
    procedure SetStrikeoutSize(const Value: SmallInt);
    procedure SetSubScriptOffsetX(const Value: SmallInt);
    procedure SetSubscriptSizeX(const Value: SmallInt);
    procedure SetSubscriptOffsetY(const Value: SmallInt);
    procedure SetSubscriptSizeY(const Value: SmallInt);
    procedure SetSuperscriptOffsetX(const Value: SmallInt);
    procedure SetSuperscriptXSizeX(const Value: SmallInt);
    procedure SetSuperscriptOffsetY(const Value: SmallInt);
    procedure SetSuperscriptYSizeY(const Value: SmallInt);
    procedure SetCodePageRange(const Value: TPascalTypeOS2CodePageRangeTable);
    procedure SetAddendumTable(const Value: TPascalTypeOS2AddendumTable);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure FontVendorIDChanged; virtual;
    procedure FontSelectionChanged; virtual;
    procedure FontEmbeddingRightsChanged; virtual;
    procedure FontFamilyChanged; virtual;
    procedure TypographicAscentChanged; virtual;
    procedure TypographicDescentChanged; virtual;
    procedure TypographicLineGapChanged; virtual;
    procedure UnicodeFirstCharIndexChanged; virtual;
    procedure UnicodeLastCharIndexChanged; virtual;
    procedure WindowsAscentChanged; virtual;
    procedure WindowsDescentChanged; virtual;
    procedure VersionChanged; virtual;
    procedure WeightChanged; virtual;
    procedure WidthTypeChanged; virtual;
    procedure AverageCharacterWidthChanged; virtual;
    procedure StrikeoutPositionChanged; virtual;
    procedure StrikeoutSizeChanged; virtual;
    procedure SubScriptOffsetXChanged; virtual;
    procedure SubscriptSizeXChanged; virtual;
    procedure SubscriptOffsetYChanged; virtual;
    procedure SubscriptSizeYChanged; virtual;
    procedure SuperscriptOffsetXChanged; virtual;
    procedure SuperscriptSizeXChanged; virtual;
    procedure SuperscriptOffsetYChanged; virtual;
    procedure SuperscriptSizeYChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property AddendumTable: TPascalTypeOS2AddendumTable read FAddendumTable write SetAddendumTable;
    property AverageCharacterWidth: SmallInt read FAverageCharacterWidth write SetAverageCharacterWidth;
    property CodePageRange: TPascalTypeOS2CodePageRangeTable read FCodePageRange write SetCodePageRange;
    property FontEmbeddingFlags: Word read FFontEmbeddingFlags write SetFontEmbeddingFlags;
    property FontEmbeddingRights: TOS2FontEmbeddingRights read GetFontEmbeddingRights write SetFontEmbeddingRights;
    property FontFamilyClassID: Byte read GetFontFamilyClassID write SetFontFamilyClassID;
    property FontFamilySubClassID: Byte read GetFontFamilySubClassID write SetFontFamilySubClassID;
    property FontFamilyType: Word read FFontFamilyType write SetFontFamilyType;
    property FontSelection: Word read FFontSelection write SetFontSelection;
    property FontSelectionFlags: TOS2FontSelectionFlags read GetFontSelectionFlags write SetFontSelectionFlags;
    property FontVendorID: TTableType read FFontVendorID write SetFontVendorID;
    property Panose: TCustomPascalTypePanoseTable read FPanose write SetPanose;
    property StrikeoutPosition: SmallInt read FStrikeoutPosition write SetStrikeoutPosition;
    property StrikeoutSize: SmallInt read FStrikeoutSize write SetStrikeoutSize;
    property SubScriptOffsetX: SmallInt read FSubScriptOffsetX write SetSubScriptOffsetX;
    property SubscriptOffsetY: SmallInt read FSubscriptYOffsetY write SetSubscriptOffsetY;
    property SubscriptSizeX: SmallInt read FSubscriptSizeX write SetSubscriptSizeX;
    property SubscriptSizeY: SmallInt read FSubscriptSizeY write SetSubscriptSizeY;
    property SuperscriptOffsetX: SmallInt read FSuperscriptOffsetX write SetSuperscriptOffsetX;
    property SuperscriptOffsetY: SmallInt read FSuperscriptOffsetY write SetSuperscriptOffsetY;
    property SuperscriptSizeX: SmallInt read FSuperscriptSizeX write SetSuperscriptXSizeX;
    property SuperscriptSizeY: SmallInt read FSuperscriptSizeY write SetSuperscriptYSizeY;
    property TypographicAscent: SmallInt read FTypographicAscent write SetTypographicAscent;
    property TypographicDescent: SmallInt read FTypographicDescent write SetTypographicDescent;
    property TypographicLineGap: SmallInt read FTypographicLineGap write SetTypographicLineGap;
    property UnicodeFirstCharacterIndex: Word read FUnicodeFirstCharIndex write SetUnicodeFirstCharIndex;
    property UnicodeLastCharacterIndex: Word read FUnicodeLastCharIndex write SetUnicodeLastCharIndex;
    property UnicodeRange: TPascalTypeUnicodeRangeTable read FUnicodeRangeTable write FUnicodeRangeTable;
    property Version: Word read FVersion write SetVersion;
    property Weight: Word read FWeight write SetWeight;
    property WeightClass: TOS2WeightClass read GetWeightClass write SetWeightClass;
    property WidthClass: TOS2WidthClass read GetWidthClass write SetWidthClass;
    property WidthType: Word read FWidthType write SetWidthType;
    property WindowsAscent: Word read FWindowsAscent write SetWindowsAscent;
    property WindowsDescent: Word read FWindowsDescent write SetWindowsDescent;
  end;


  // table 'post'

  TPascalTypePostscriptVersion2Table = class(TCustomPascalTypeTable)
  private
    FGlyphNameIndex : array of Word;   // This is not an offset, but is the ordinal number of the glyph in 'post' string tables.
    FNames          : array of ShortString;
    function GetGlyphIndexCount: Integer; // Glyph names with length bytes [variable] (a Pascal string).
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function GlyphIndexToString(GlyphIndex: Integer): string;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphIndexCount: Integer read GetGlyphIndexCount;
  end;

  TPascalTypePostscriptTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion            : TFixedPoint; // Format of this table
    FItalicAngle        : TFixedPoint; // Italic angle in degrees
    FUnderlinePosition  : SmallInt;    // Underline position
    FUnderlineThickness : SmallInt;    // Underline thickness
    FIsFixedPitch       : LongInt;     // Font is monospaced; set to 1 if the font is monospaced and 0 otherwise (N.B., to maintain compatibility with older versions of the TrueType spec, accept any non-zero value as meaning that the font is monospaced)
    FMinMemType42       : LongInt;     // Minimum memory usage when a TrueType font is downloaded as a Type 42 font
    FMaxMemType42       : LongInt;     // Maximum memory usage when a TrueType font is downloaded as a Type 42 font
    FMinMemType1        : LongInt;     // Minimum memory usage when a TrueType font is downloaded as a Type 1 font
    FMaxMemType1        : LongInt;     // Maximum memory usage when a TrueType font is downloaded as a Type 1 font
    FPostscriptV2Table  : TPascalTypePostscriptVersion2Table;
    procedure SetVersion(const Value: TFixedPoint);
    procedure SetIsFixedPitch(const Value: LongInt);
    procedure SetItalicAngle(const Value: TFixedPoint);
    procedure SetMaxMemType1(const Value: LongInt);
    procedure SetMaxMemType42(const Value: LongInt);
    procedure SetMinMemType1(const Value: LongInt);
    procedure SetMinMemType42(const Value: LongInt);
    procedure SetUnderlinePosition(const Value: SmallInt);
    procedure SetUnderlineThickness(const Value: SmallInt);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure VersionChanged; virtual;
    procedure IsFixedPitchChanged; virtual;
    procedure ItalicAngleChanged; virtual;
    procedure MaxMemType1Changed; virtual;
    procedure MaxMemType42Changed; virtual;
    procedure MinMemType1Changed; virtual;
    procedure MinMemType42Changed; virtual;
    procedure UnderlinePositionChanged; virtual;
    procedure UnderlineThicknessChanged; virtual;
  public
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
    property ItalicAngle: TFixedPoint read FItalicAngle write SetItalicAngle;
    property UnderlinePosition: SmallInt read FUnderlinePosition write SetUnderlinePosition;
    property UnderlineThickness: SmallInt read FUnderlineThickness write SetUnderlineThickness;
    property IsFixedPitch: LongInt read FIsFixedPitch write SetIsFixedPitch;
    property MinMemType42: LongInt read FMinMemType42 write SetMinMemType42;
    property MaxMemType42: LongInt read FMaxMemType42 write SetMaxMemType42;
    property MinMemType1: LongInt read FMinMemType1 write SetMinMemType1;
    property MaxMemType1: LongInt read FMaxMemType1 write SetMaxMemType1;
    property PostscriptV2Table: TPascalTypePostscriptVersion2Table read FPostscriptV2Table;
  end;


// various swap functions for converting big-endian data  
function Swap16(Value: Word): Word;
function Swap32(Value: Cardinal): Cardinal;
function Swap64(Value: Int64): Int64;

// big-endian stream I/O
function ReadSwappedWord(Stream: TStream): Word; {$IFDEF UseInline} inline; {$ENDIF}
function ReadSwappedSmallInt(Stream: TStream): SmallInt; {$IFDEF UseInline} inline; {$ENDIF}
function ReadSwappedCardinal(Stream: TStream): Cardinal; {$IFDEF UseInline} inline; {$ENDIF}
function ReadSwappedInt64(Stream: TStream): Int64; {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedWord(Stream: TStream; Value : Word); {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedSmallInt(Stream: TStream; Value : SmallInt); {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedCardinal(Stream: TStream; Value: Cardinal); {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedInt64(Stream: TStream; Value: Int64); {$IFDEF UseInline} inline; {$ENDIF}

procedure RegisterPascalTypePanose(PanoseClass: TCustomPascalTypePanoseClass);
procedure RegisterPascalTypePanoses(PanoseClasses: array of TCustomPascalTypePanoseClass);
function FindPascalTypePanoseByType(PanoseType: Byte): TCustomPascalTypePanoseClass;

procedure RegisterPascalTypeTable(TableClass: TCustomPascalTypeNamedTableClass);
procedure RegisterPascalTypeTables(TableClasses: array of TCustomPascalTypeNamedTableClass);
function FindPascalTypeTableByType(TableType: TTableType): TCustomPascalTypeNamedTableClass;

implementation

uses
  Math, PT_ResourceStrings;


var
  GPanoseClasses : array of TCustomPascalTypePanoseClass;
  GTableClasses : array of TCustomPascalTypeNamedTableClass;

function Swap16(Value: Word): Word;
begin
 Result := Swap(Value);
end;

function Swap32(Value: Cardinal): Cardinal;
type
  TTwoWords = array [0..1] of Word;
begin
 TTwoWords(Result)[1] := Swap(TTwoWords(Value)[0]);
 TTwoWords(Result)[0] := Swap(TTwoWords(Value)[1]);
end;

function Swap64(Value: Int64): Int64;
type
  TFourWords = array [0..3] of Word;
begin
 TFourWords(Result)[3] := Swap(TFourWords(Value)[0]);
 TFourWords(Result)[2] := Swap(TFourWords(Value)[1]);
 TFourWords(Result)[1] := Swap(TFourWords(Value)[2]);
 TFourWords(Result)[0] := Swap(TFourWords(Value)[3]);
end;

function ReadSwappedWord(Stream: TStream): Word;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Word)) <> SizeOf(Word)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Word));
 {$ENDIF}
 Result := Swap16(Result);
end;

function ReadSwappedSmallInt(Stream: TStream): SmallInt;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(SmallInt)) <> SizeOf(SmallInt)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(SmallInt));
 {$ENDIF}
 Result := Swap16(Result);
end;

function ReadSwappedCardinal(Stream: TStream): Cardinal;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Cardinal)) <> SizeOf(Cardinal)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Cardinal));
 {$ENDIF}
 Result := Swap32(Result);
end;

function ReadSwappedInt64(Stream: TStream): Int64;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Int64)) <> SizeOf(Int64)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Int64));
 {$ENDIF}
 Result := Swap64(Result);
end;

procedure WriteSwappedWord(Stream: TStream; Value: Word);
begin
 Value := Swap16(Value);
 Stream.Write(Value, SizeOf(Word));
end;

procedure WriteSwappedSmallInt(Stream: TStream; Value: SmallInt);
begin
 Value := Swap16(Value);
 Stream.Write(Value, SizeOf(SmallInt));
end;

procedure WriteSwappedCardinal(Stream: TStream; Value: Cardinal);
begin
 Value := Swap32(Value);
 Stream.Write(Value, SizeOf(Cardinal));
end;

procedure WriteSwappedInt64(Stream: TStream; Value: Int64);
begin
 Value := Swap64(Value);
 Stream.Write(Value, SizeOf(Int64));
end;


{ TCustomPascalTypeTable }

constructor TCustomPascalTypeTable.Create;
begin
 ResetToDefaults;
 inherited Create;
end;

procedure TCustomPascalTypeTable.Changed;
begin
 // nothing in here yet!
end;


{ TCustomPascalTypeInterfaceTable }

constructor TCustomPascalTypeInterfaceTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
 FInterpreter := Interpreter;
 inherited Create;
end;


{ TCustomPascalTypeNamedTable }

function TCustomPascalTypeNamedTable.GetInternalTableType: TTableType;
begin
 Result := GetTableType;
end;


{ TPascalTypeUnknownTable }

constructor TPascalTypeUnknownTable.Create(Interpreter: IPascalTypeInterpreter;
  TableTye: TTableType);
begin
 FTableType := TableTye; 
 FStream := TMemoryStream.Create;
 inherited Create(Interpreter);
end;

destructor TPascalTypeUnknownTable.Destroy;
begin
 FreeAndNil(FStream);
 inherited;
end;

procedure TPascalTypeUnknownTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeUnknownTable(Dest) do
   begin
    FTableType := Self.FTableType;

    // assign streams
    FStream.Seek(0, soFromBeginning);
    Self.FStream.Seek(0, soFromBeginning);
    FStream.CopyFrom(Self.FStream, Self.Stream.Size);
   end
  else inherited;
end;

function TPascalTypeUnknownTable.GetInternalTableType: TTableType;
begin
 Result := FTableType;
end;

class function TPascalTypeUnknownTable.GetTableType: TTableType;
begin
 Result := '    ';
end;

procedure TPascalTypeUnknownTable.ResetToDefaults;
begin
 FStream.Clear;
end;

procedure TPascalTypeUnknownTable.LoadFromStream(Stream: TStream);
begin
 FStream.Seek(0, soFromBeginning);
 FStream.CopyFrom(Stream, Stream.Size - Stream.Position);
end;

procedure TPascalTypeUnknownTable.SaveToStream(Stream: TStream);
begin
 FStream.Seek(0, soFromBeginning);
 Stream.CopyFrom(Stream, FStream.Size);
end;


{ TPascalTypeHeaderTable }

procedure TPascalTypeHeaderTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeHeaderTable(Dest) do
   begin
    FVersion            := Self.FVersion;
    FFontRevision       := Self.FFontRevision;
    FCheckSumAdjustment := Self.FCheckSumAdjustment;
    FMagicNumber        := Self.FMagicNumber;
    FFlags              := Self.FFlags;
    FUnitsPerEm         := Self.FUnitsPerEm;
    FCreatedDate        := Self.FCreatedDate;
    FModifiedDate       := Self.FModifiedDate;
    FxMin               := Self.FxMin;
    FyMin               := Self.FyMin;
    FxMax               := Self.FxMax;
    FyMax               := Self.FyMax;
    FMacStyle           := Self.FMacStyle;
    FLowestRecPPEM      := Self.FLowestRecPPEM;
    FFontDirectionHint  := Self.FFontDirectionHint;
    FIndexToLocFormat   := Self.FIndexToLocFormat;
    FGlyphDataFormat    := Self.FGlyphDataFormat;
   end
 else inherited;
end;

class function TPascalTypeHeaderTable.GetTableType: TTableType;
begin
 Result := 'head';
end;

procedure TPascalTypeHeaderTable.ResetToDefaults;
begin
 FVersion.Value := 1;
 FVersion.Fract := 0;
 FFontRevision.Value := 1;
 FFontRevision.Fract := 0;
 FCheckSumAdjustment := 0;
 FMagicNumber := $F53C0F5F;
 FUnitsPerEm := 2048;
end;

procedure TPascalTypeHeaderTable.LoadFromStream(Stream: TStream);
var
  Value64 : Int64;
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 54 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   FVersion := TFixedPoint(Swap32(Value32));

   // check version
   if not (Version.Value = 1)
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read font revision
   Read(Value32, SizeOf(TFixedPoint));
   FFontRevision := TFixedPoint(Swap32(Value32));

   // read check sum adjust
   Read(Value32, SizeOf(LongInt));
   FCheckSumAdjustment := Swap32(Value32);

   // read magic number
   Read(Value32, SizeOf(TFixedPoint));
   FMagicNumber := Swap32(Value32);

   // check for magic
   if not (FMagicNumber = $5F0F3CF5)
    then raise EPascalTypeError.Create(RCStrNoMagic);

   // read flags
   Value16 := ReadSwappedWord(Stream);
   FFlags := WordToFontHeaderTableFlags(Value16);

   {$IFDEF AmbigiousExceptions}
   if (Value16 shr 14) <> 0
    then raise EPascalTypeError.Create(RCStrHeaderFlagError);
   {$ENDIF}

   // read UnitsPerEm
   FUnitsPerEm := ReadSwappedWord(Stream);

   // read CreatedDate
   Read(Value64, SizeOf(Int64));
   FCreatedDate := Swap64(Value64);

   // read ModifiedDate
   Read(Value64, SizeOf(Int64));
   FModifiedDate := Swap64(Value64);

   // read xMin
   FxMin := ReadSwappedSmallInt(Stream);

   // read yMin
   FyMin := ReadSwappedSmallInt(Stream);

   // read xMax
   FxMax := ReadSwappedSmallInt(Stream);

   // read xMax
   FyMax := ReadSwappedSmallInt(Stream);

   // read MacStyle
   FMacStyle := WordToMacStyles(ReadSwappedWord(Stream));

   // read LowestRecPPEM
   FLowestRecPPEM := ReadSwappedWord(Stream);

   // read FontDirectionHint
   FFontDirectionHint := TFontDirectionHint(ReadSwappedSmallInt(Stream));

   // read IndexToLocFormat
   Value16 := ReadSwappedSmallInt(Stream);
   case Value16 of
    0 : FIndexToLocFormat := ilShort;
    1 : FIndexToLocFormat := ilLong;
    else raise EPascalTypeError.CreateFmt(RCStrWrongIndexToLocFormat, [Value16]);
   end;

   // read GlyphDataFormat
   FGlyphDataFormat := ReadSwappedSmallInt(Stream);
  end;
end;

procedure TPascalTypeHeaderTable.SaveToStream(Stream: TStream);
begin
 // write version
 WriteSwappedCardinal(Stream, Cardinal(FVersion));

 // write font revision
 WriteSwappedCardinal(Stream, Cardinal(FFontRevision));

 // write check sum adjust
 WriteSwappedCardinal(Stream, FCheckSumAdjustment);

 // write magic number
 WriteSwappedCardinal(Stream, FMagicNumber);

 // write flags
 WriteSwappedWord(Stream, FontHeaderTableFlagsToWord(FFlags));

 // write UnitsPerEm
 WriteSwappedWord(Stream, FUnitsPerEm);

 // write CreatedDate
 WriteSwappedInt64(Stream, FCreatedDate);

 // write ModifiedDate
 WriteSwappedInt64(Stream, FModifiedDate);

 // write xMin
 WriteSwappedSmallInt(Stream, FxMin);

 // write yMin
 WriteSwappedSmallInt(Stream, FyMin);

 // write xMax
 WriteSwappedSmallInt(Stream, FxMax);

 // write xMax
 WriteSwappedSmallInt(Stream, FyMax);

 // write MacStyle
 WriteSwappedWord(Stream, MacStylesToWord(FMacStyle));

 // write LowestRecPPEM
 WriteSwappedWord(Stream, FLowestRecPPEM);

 // write FontDirectionHint
 WriteSwappedWord(Stream, Word(FFontDirectionHint));

 // write IndexToLocFormat
 case FIndexToLocFormat of
  ilShort : WriteSwappedWord(Stream, 0);
   ilLong : WriteSwappedWord(Stream, 1);
  else raise EPascalTypeError.CreateFmt(RCStrWrongIndexToLocFormat, [Word(FIndexToLocFormat)]);
 end;

 // write GlyphDataFormat
 WriteSwappedWord(Stream, FGlyphDataFormat);
end;

procedure TPascalTypeHeaderTable.SetCheckSumAdjustment(const Value: Longint);
begin
 if FCheckSumAdjustment <> Value then
  begin
   FCheckSumAdjustment := Value;
   CheckSumAdjustmentChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetCreatedDate(const Value: Int64);
begin
 if FCreatedDate <> CreatedDate then
  begin
   FCreatedDate := Value;
   CreatedDateChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetFlags(const Value: TFontHeaderTableFlags);
begin
 if FFlags <> Value then
  begin
   FFlags := Value;
   FlagsChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetFontDirectionHint(
  const Value: TFontDirectionHint);
begin
 if FFontDirectionHint <> Value then
  begin
   FFontDirectionHint := Value;
   FontDirectionHintChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetFontRevision(const Value: TFixedPoint);
begin
 if (FFontRevision.Fract <> Value.Fract) or
    (FFontRevision.Value <> Value.Value) then
  begin
   FFontRevision := Value;
   FontRevisionChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetGlyphDataFormat(const Value: Word);
begin
 if FGlyphDataFormat <> Value then
  begin
   FGlyphDataFormat := Value;
   GlyphDataFormatChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetIndexToLocFormat(const Value: TIndexToLocationFormat);
begin
 if FIndexToLocFormat <> Value then
  begin
   FIndexToLocFormat := Value;
   IndexToLocFormatChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetLowestRecPPEM(const Value: Word);
begin
 if FLowestRecPPEM <> Value then
  begin
   FLowestRecPPEM := Value;
   LowestRecPPEMChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetMacStyle(const Value: TMacStyles);
begin
 if FMacStyle <> Value then
  begin
   FMacStyle := Value;
   MacStyleChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetModifiedDate(const Value: Int64);
begin
 if FModifiedDate <> Value then
  begin
   FModifiedDate := Value;
   ModifiedDateChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetUnitsPerEm(const Value: Word);
begin
 if FUnitsPerEm <> Value then
  begin
   FUnitsPerEm := Value;
   UnitsPerEmChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetXMax(const Value: SmallInt);
begin
 if FXMax <> Value then
  begin
   FXMax := Value;
   XMaxChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetXMin(const Value: SmallInt);
begin
 if FXMin <> Value then
  begin
   FXMin := Value;
   XMinChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetYMax(const Value: SmallInt);
begin
 if FYMax <> Value then
  begin
   FYMax := Value;
   YMaxChanged;
  end;
end;

procedure TPascalTypeHeaderTable.SetYMin(const Value: SmallInt);
begin
 if FYMin <> Value then
  begin
   FYMin := Value;
   YMinChanged;
  end;
end;

procedure TPascalTypeHeaderTable.CheckSumAdjustmentChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.CreatedDateChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.FlagsChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.FontDirectionHintChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.FontRevisionChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.GlyphDataFormatChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.IndexToLocFormatChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.LowestRecPPEMChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.MacStyleChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.ModifiedDateChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.UnitsPerEmChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.VersionChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.XMaxChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.XMinChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.YMaxChanged;
begin
 Changed;
end;

procedure TPascalTypeHeaderTable.YMinChanged;
begin
 Changed;
end;


{ TPascalTypeFormat0CharacterMap }

function TPascalTypeFormat0CharacterMap.GetFormat: Word;
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

function TPascalTypeFormat0CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 if CharacterIndex in [0..255]
  then Result := FGlyphIdArray[CharacterIndex]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [CharacterIndex]);
end;


{ TPascalTypeFormat2CharacterMap }

function TPascalTypeFormat2CharacterMap.GetFormat: Word;
begin
 Result := 2;
end;

procedure TPascalTypeFormat2CharacterMap.ResetToDefaults;
begin
 FLength   := 0;
 FLanguage := 0;
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

function TPascalTypeFormat4CharacterMap.GetFormat: Word;
begin
 Result := 4;
end;

procedure TPascalTypeFormat4CharacterMap.ResetToDefaults;
begin
 FLength   := 0;
 FLanguage := 0;
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

function TPascalTypeFormat6CharacterMap.GetFormat: Word;
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

function TPascalTypeFormat12CharacterMap.GetFormat: Word;
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
 raise EPascalTypeError.Create(RCStrNotImplemented);
end;


{ TCustomPascalTypeCharacterMapDirectory }

constructor TCustomPascalTypeCharacterMapDirectory.Create(EncodingID: Word);
begin
 inherited Create;
 FEncodingID := EncodingID;
end;

destructor TCustomPascalTypeCharacterMapDirectory.Destroy;
begin
 if Assigned(FCharacterMap)
  then FreeAndNil(FCharacterMap);

 inherited;
end;

procedure TCustomPascalTypeCharacterMapDirectory.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomPascalTypeCharacterMapDirectory(Dest) do
   begin
    FEncodingID := Self.FEncodingID;
    FCharacterMap.Assign(Self.FCharacterMap);
   end else inherited;
end;

procedure TCustomPascalTypeCharacterMapDirectory.ResetToDefaults;
begin
 if Assigned(FCharacterMap)
  then FreeAndNil(FCharacterMap);

 FEncodingID := 0;
end;

procedure TCustomPascalTypeCharacterMapDirectory.EncodingIDChanged;
begin
 Changed;
end;

function TCustomPascalTypeCharacterMapDirectory.GetEncodingIDAsWord: Word;
begin
 Result := FEncodingID;
end;

function TCustomPascalTypeCharacterMapDirectory.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 if Assigned(FCharacterMap)
  then Result := FCharacterMap.CharacterToGlyph(CharacterIndex)
  else raise Exception.Create('Character map not set properly!');
end;

procedure TCustomPascalTypeCharacterMapDirectory.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
  OldMap  : TCustomPascalTypeCharacterMap;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read format
   Value16 := ReadSwappedWord(Stream);
   case Value16 of
     0 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TPascalTypeFormat0CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
     2 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TPascalTypeFormat2CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
     4 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TPascalTypeFormat4CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
     6 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TPascalTypeFormat6CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
    12 : begin
         OldMap := FCharacterMap;
         FCharacterMap := TPascalTypeFormat12CharacterMap.Create;
         if Assigned(OldMap)
          then FreeAndNil(OldMap);
        end;
    else raise EPascalTypeError.CreateFmt('Unknown character map (%d)', [Value16]);
   end;

   if Assigned(FCharacterMap)
    then FCharacterMap.LoadFromStream(Stream);
  end;
end;

procedure TCustomPascalTypeCharacterMapDirectory.SaveToStream(Stream: TStream);
begin
 if Assigned(FCharacterMap)
  then FCharacterMap.SaveToStream(Stream);
end;

procedure TCustomPascalTypeCharacterMapDirectory.SetEncodingIDAsWord(
  const Value: Word);
begin
 if Value <> FEncodingID then
  begin
   FEncodingID := Value;
   EncodingIDChanged;
  end;
end;


{ TPascalTypeCharacterMapDirectoryGenericEntry }

function TPascalTypeCharacterMapDirectoryGenericEntry.GetPlatformID: TPlatformID;
begin
 Result := piCustom;
end;


{ TPascalTypeCharacterMapUnicodeDirectory }

function TPascalTypeCharacterMapUnicodeDirectory.GetEncodingID: TUnicodeEncodingID;
begin
 Result := TUnicodeEncodingID(FEncodingID);
end;

function TPascalTypeCharacterMapUnicodeDirectory.GetPlatformID: TPlatformID;
begin
 Result := piUnicode;
end;

procedure TPascalTypeCharacterMapUnicodeDirectory.SetEncodingID(
  const Value: TUnicodeEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TPascalTypeCharacterMapMacintoshDirectory }

function TPascalTypeCharacterMapMacintoshDirectory.GetEncodingID: TAppleEncodingID;
begin
 Result := TAppleEncodingID(FEncodingID);
end;

function TPascalTypeCharacterMapMacintoshDirectory.GetPlatformID: TPlatformID;
begin
 Result := piApple;
end;

procedure TPascalTypeCharacterMapMacintoshDirectory.SetEncodingID(
  const Value: TAppleEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TPascalTypeCharacterMapMicrosoftDirectory }

function TPascalTypeCharacterMapMicrosoftDirectory.GetEncodingID: TMicrosoftEncodingID;
begin
 Result := TMicrosoftEncodingID(FEncodingID);
end;

function TPascalTypeCharacterMapMicrosoftDirectory.GetPlatformID: TPlatformID;
begin
 Result := piMicrosoft;
end;

procedure TPascalTypeCharacterMapMicrosoftDirectory.SetEncodingID(
  const Value: TMicrosoftEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TPascalTypeCharacterMapTable }

constructor TPascalTypeCharacterMapTable.Create;
begin
 FSubtableList := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeCharacterMapTable.Destroy;
begin
 FreeAndNil(FSubtableList);
 inherited;
end;

procedure TPascalTypeCharacterMapTable.AssignTo(Dest: TPersistent);
(*
var
  SubTableIndex : Integer;
*)
begin
 if Dest is Self.ClassType then
  with TPascalTypeCharacterMapTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FSubtableList.Assign(Self.FSubtableList);

(*
    for SubTableIndex := 0 to Self.FSubtableList.Count - 1 do
      begin
       Self.FSubtableList[SubTableIndex].ClassType.Create;
      end;
*)
    // damn hack!!! (it is necessary to create a separate instance!!!)
    Self.FSubtableList.OwnsObjects := False;
   end
 else inherited;
end;

function TPascalTypeCharacterMapTable.GetCharacterMapSubtable(
  Index: Integer): TCustomPascalTypeCharacterMapDirectory;
begin
 if (Index >= 0) and (Index < FSubtableList.Count)
  then Result := TCustomPascalTypeCharacterMapDirectory(FSubtableList[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeCharacterMapTable.GetCharacterMapSubtableCount: Word;
begin
 Result := FSubtableList.Count;
end;

class function TPascalTypeCharacterMapTable.GetTableType: TTableType;
begin
 Result := 'cmap';
end;

procedure TPascalTypeCharacterMapTable.ResetToDefaults;
begin
 FVersion := 0;
 FSubtableList.Clear;
end;

procedure TPascalTypeCharacterMapTable.LoadFromStream(Stream: TStream);
var
  StartPos        : Int64;
  SubtableCount   : Integer;
  SubtableIndex   : Integer;
  CharMapDirEntry : TCustomPascalTypeCharacterMapDirectory;
  Value32         : Cardinal;
  PlatformID      : Word;
  EncodingID      : Word;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // store stream start position
   StartPos := Position;
   Assert(StartPos = 0); // assert this for the damn hack used in this table!!!

   // read Version
   FVersion := ReadSwappedWord(Stream);

   // check version
   if not (FVersion = 0)
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // clear subtable list
   FSubtableList.Clear;

   // read subtable count
   SubtableCount := ReadSwappedWord(Stream);

   // check if table is complete
   if Position + SubtableCount * 8 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read directory entry
   for SubtableIndex := 0 to SubtableCount - 1 do
    begin
     Position := StartPos + 4 + SubtableIndex * 8;

     // read Platform ID
     PlatformID := ReadSwappedWord(Stream);

     // read encoding ID
     EncodingID := ReadSwappedWord(Stream);

     // create character map based on encoding
     case PlatformID of
       0 : CharMapDirEntry := TPascalTypeCharacterMapUnicodeDirectory.Create(EncodingID);
       1 : CharMapDirEntry := TPascalTypeCharacterMapMacintoshDirectory.Create(EncodingID);
       3 : CharMapDirEntry := TPascalTypeCharacterMapMicrosoftDirectory.Create(EncodingID);
      else CharMapDirEntry := TPascalTypeCharacterMapDirectoryGenericEntry.Create(EncodingID);
     end;

     // read and apply offset
     Read(Value32, SizeOf(Cardinal));
     Position := StartPos + Swap32(Value32);

     // load character map entry from stream
     CharMapDirEntry.LoadFromStream(Stream);

     if Assigned(CharMapDirEntry)
      then FSubtableList.Add(CharMapDirEntry);
    end;
  end;
end;

procedure TPascalTypeCharacterMapTable.SaveToStream(Stream: TStream);
var
  StartPos  : Int64;
  DirIndex  : Integer;
  Directory : array of Cardinal;
  Value32   : Cardinal;
begin
 with Stream do
  begin
   // store stream start position
   StartPos := Position;

   // write format type
   WriteSwappedWord(Stream, FVersion);

   // write directory entry count
   WriteSwappedWord(Stream, FSubtableList.Count);

   // offset directory
   Seek(soFromCurrent, 6 * FSubtableList.Count);

   // build directory (to be written later) and write data
   SetLength(Directory, FSubtableList.Count);

   for DirIndex := 0 to FSubtableList.Count - 1 do
    with TCustomPascalTypeCharacterMapDirectory(FSubtableList[DirIndex]) do
     begin
      Directory[DirIndex] := Cardinal(Position - StartPos);
      SaveToStream(Stream);
     end;

   // locate directory
   Position := StartPos + 4;

   for DirIndex := 0 to FSubtableList.Count - 1 do
    with TCustomPascalTypeCharacterMapDirectory(FSubtableList[DirIndex]) do
     begin
      // write format
      WriteSwappedWord(Stream, Word(PlatformID));

      // write encoding ID
      WriteSwappedWord(Stream, EncodingID);

      // write offset
      Value32 := Directory[DirIndex];
      Write(Value32, SizeOf(Cardinal));
     end;
  end;
end;

procedure TPascalTypeCharacterMapTable.SetVersion(const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   CharacterMapDirectoryChanged;
  end;
end;

procedure TPascalTypeCharacterMapTable.CharacterMapDirectoryChanged;
begin
 Changed;
end;


{ TPascalTypeHorizontalHeaderTable }

procedure TPascalTypeHorizontalHeaderTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeHorizontalHeaderTable(Dest) do
   begin
    FVersion             := Self.FVersion;
    FAscent              := Self.FAscent;
    FDescent             := Self.FDescent;
    FLineGap             := Self.FLineGap;
    FAdvanceWidthMax     := Self.FAdvanceWidthMax;
    FMinLeftSideBearing  := Self.FMinLeftSideBearing;
    FMinRightSideBearing := Self.FMinRightSideBearing;
    FXMaxExtent          := Self.FXMaxExtent;
    FCaretSlopeRise      := Self.FCaretSlopeRise;
    FCaretSlopeRun       := Self.FCaretSlopeRun;
    FCaretOffset         := Self.FCaretOffset;
    FMetricDataFormat    := Self.FMetricDataFormat;
    FNumOfLongHorMetrics := Self.FNumOfLongHorMetrics;
   end
 else inherited;
end;

class function TPascalTypeHorizontalHeaderTable.GetTableType: TTableType;
begin
 Result := 'hhea';
end;

procedure TPascalTypeHorizontalHeaderTable.ResetToDefaults;
begin
 FVersion.Value := 1;
 FVersion.Fract := 0;
 FAscent := 0;
 FDescent := 0;
 FLineGap := 0;
 FAdvanceWidthMax := 0;
 FMinLeftSideBearing := 0;
 FMinRightSideBearing := 0;
 FXMaxExtent := 0;
 FCaretSlopeRise := 0;
 FCaretSlopeRun := 0;
 FCaretOffset := 0;
 FMetricDataFormat := 0;
 FNumOfLongHorMetrics := 0;
end;

procedure TPascalTypeHorizontalHeaderTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 32 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   FVersion := TFixedPoint(Swap32(Value32));

   // check version
   if not (Version.Value = 1)
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read Ascent
   FAscent := ReadSwappedSmallInt(Stream);

   // read Descent
   FDescent := ReadSwappedSmallInt(Stream);

   // read LineGap
   FLineGap := ReadSwappedSmallInt(Stream);

   // read AdvanceWidthMax
   FAdvanceWidthMax := ReadSwappedWord(Stream);

   // read MinLeftSideBearing
   FMinLeftSideBearing := ReadSwappedSmallInt(Stream);

   // read MinRightSideBearing
   FMinRightSideBearing := ReadSwappedSmallInt(Stream);

   // read XMaxExtent
   FXMaxExtent := ReadSwappedSmallInt(Stream);

   // read CaretSlopeRise
   FCaretSlopeRise := ReadSwappedSmallInt(Stream);

   // read CaretSlopeRun
   FCaretSlopeRun := ReadSwappedSmallInt(Stream);

   // read CaretOffset
   FCaretOffset := ReadSwappedSmallInt(Stream);

   {$IFDEF AmbigiousExceptions}
   Read(Value32, SizeOf(Cardinal));
   if Value32 <> 0
    then raise EPascalTypeError.Create(RCStrHorizontalHeaderReserved);

   Read(Value32, SizeOf(Cardinal));
   if Value32 <> 0
    then raise EPascalTypeError.Create(RCStrHorizontalHeaderReserved);
   {$ELSE}
   // reserved (ignore!)
   Position := Position + 8;
   {$ENDIF}

   // read MetricDataFormat
   FMetricDataFormat := ReadSwappedSmallInt(Stream);

   // read NumOfLongHorMetrics
   FNumOfLongHorMetrics := ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SaveToStream(Stream: TStream);
begin
 // write version
 WriteSwappedCardinal(Stream, Cardinal(FVersion));

 // write Ascent
 WriteSwappedSmallInt(Stream, FAscent);

 // write Descent
 WriteSwappedSmallInt(Stream, FDescent);

 // write LineGap
 WriteSwappedSmallInt(Stream, FLineGap);

 // write AdvanceWidthMax
 WriteSwappedWord(Stream, FAdvanceWidthMax);

 // write MinLeftSideBearing
 WriteSwappedSmallInt(Stream, FMinLeftSideBearing);

 // write MinRightSideBearing
 WriteSwappedSmallInt(Stream, FMinRightSideBearing);

 // write XMaxExtent
 WriteSwappedSmallInt(Stream, FXMaxExtent);

 // write CaretSlopeRise
 WriteSwappedSmallInt(Stream, FCaretSlopeRise);

 // write CaretSlopeRun
 WriteSwappedSmallInt(Stream, FCaretSlopeRun);

 // write CaretOffset
 WriteSwappedSmallInt(Stream, FCaretOffset);

 // reserved, set to zero!
 WriteSwappedCardinal(Stream, 0);
 WriteSwappedCardinal(Stream, 0);

 // write MetricDataFormat
 WriteSwappedSmallInt(Stream, FMetricDataFormat);

 // write NumOfLongHorMetrics
 WriteSwappedWord(Stream, FNumOfLongHorMetrics);
end;

procedure TPascalTypeHorizontalHeaderTable.SetAdvanceWidthMax(
  const Value: Word);
begin
 if FAdvanceWidthMax <> Value then
  begin
   FAdvanceWidthMax := Value;
   AdvanceWidthMaxChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetAscent(const Value: SmallInt);
begin
 if FAscent <> Value then
  begin
   FAscent := Value;
   AscentChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetCaretOffset(
  const Value: SmallInt);
begin
 if FCaretOffset <> Value then
  begin
   FCaretOffset := Value;
   CaretOffsetChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetCaretSlopeRise(
  const Value: SmallInt);
begin
 if FCaretSlopeRise <> Value then
  begin
   FCaretSlopeRise := Value;
   CaretSlopeRiseChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetCaretSlopeRun(
  const Value: SmallInt);
begin
 if FCaretSlopeRun <> Value then
  begin
   FCaretSlopeRun := Value;
   CaretSlopeRunChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetDescent(const Value: SmallInt);
begin
 if FDescent <> Value then
  begin
   FDescent := Value;
   DescentChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetLineGap(const Value: SmallInt);
begin
 if FLineGap <> Value then
  begin
   FLineGap := Value;
   LineGapChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetMetricDataFormat(
  const Value: SmallInt);
begin
 if FMetricDataFormat <> Value then
  begin
   FMetricDataFormat := Value;
   MetricDataFormatChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetMinLeftSideBearing(
  const Value: SmallInt);
begin
 if FMinLeftSideBearing <> Value then
  begin
   FMinLeftSideBearing := Value;
   MinLeftSideBearingChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetMinRightSideBearing(
  const Value: SmallInt);
begin
 if FMinRightSideBearing <> Value then
  begin
   FMinRightSideBearing := Value;
   MinRightSideBearingChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetNumOfLongHorMetrics(
  const Value: Word);
begin
 if FNumOfLongHorMetrics <> Value then
  begin
   FNumOfLongHorMetrics := Value;
   NumOfLongHorMetricsChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SetXMaxExtent(
  const Value: SmallInt);
begin
 if FXMaxExtent <> Value then
  begin
   FXMaxExtent := Value;
   XMaxExtentChanged;
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.AdvanceWidthMaxChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.AscentChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.CaretOffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.CaretSlopeRiseChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.CaretSlopeRunChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.DescentChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.LineGapChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.MetricDataFormatChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.MinLeftSideBearingChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.MinRightSideBearingChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.NumOfLongHorMetricsChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.VersionChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalHeaderTable.XMaxExtentChanged;
begin
 Changed;
end;


{ TPascalTypeHorizontalMetricsTable }

procedure TPascalTypeHorizontalMetricsTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeHorizontalMetricsTable(Dest) do
   begin
    FHorizontalMetrics := Self.FHorizontalMetrics;
   end
 else inherited;
end;

class function TPascalTypeHorizontalMetricsTable.GetTableType: TTableType;
begin
 Result := 'hmtx';
end;

procedure TPascalTypeHorizontalMetricsTable.ResetToDefaults;
begin
 SetLength(FHorizontalMetrics, 1);
end;

procedure TPascalTypeHorizontalMetricsTable.LoadFromStream(Stream: TStream);
var
  HorHead  : TPascalTypeHorizontalHeaderTable;
  MaxProf  : TPascalTypeMaximumProfileTable;
  MtxIndex : Integer;
begin
 inherited;

 HorHead := TPascalTypeHorizontalHeaderTable(FInterpreter.GetTableByTableType('hhea'));
 Assert(Assigned(HorHead));
 MaxProf := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));
 Assert(Assigned(MaxProf));

 // check if vertical metrics header is available
 if HorHead = nil
  then raise EPascalTypeError.Create(RCStrNoHorizontalHeader);

 // set length of horizontal metrics
 SetLength(FHorizontalMetrics, MaxProf.NumGlyphs);

 with Stream do
  begin
   for MtxIndex := 0 to HorHead.NumOfLongHorMetrics - 1 do
    with FHorizontalMetrics[MtxIndex] do
     begin
      // read advance width
      AdvanceWidth := ReadSwappedSmallInt(Stream);

      // read left side bearing
      Bearing := ReadSwappedSmallInt(Stream);
     end;

   for MtxIndex := HorHead.NumOfLongHorMetrics to Length(FHorizontalMetrics)  - 1 do
    with FHorizontalMetrics[MtxIndex] do
     begin
      // read advance width / left side bearing at once
      AdvanceWidth := ReadSwappedSmallInt(Stream);
      Bearing := AdvanceWidth;
     end;
  end;
end;

procedure TPascalTypeHorizontalMetricsTable.SaveToStream(Stream: TStream);
var
  MtxIndex : Integer;
  HorHead  : TPascalTypeHorizontalHeaderTable;
begin
 inherited;

 // locate horizontal header
 HorHead := TPascalTypeHorizontalHeaderTable(FInterpreter.GetTableByTableType('hhea'));

 // check if vertical metrics header is available
 if HorHead = nil
  then raise EPascalTypeError.Create(RCStrNoHorizontalHeader);

 with Stream do
  begin
   // check (minimum) table size
   if Position + 6 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   for MtxIndex := 0 to HorHead.NumOfLongHorMetrics - 1 do
    with FHorizontalMetrics[MtxIndex] do
     begin
      // write advance width
      WriteSwappedSmallInt(Stream, AdvanceWidth);

      // write left side bearing
      WriteSwappedSmallInt(Stream, Bearing);
     end;

   for MtxIndex := HorHead.NumOfLongHorMetrics to Length(FHorizontalMetrics)  - 1 do
    with FHorizontalMetrics[MtxIndex] do
     begin
      // write advance width / left side bearing at once
      WriteSwappedSmallInt(Stream, AdvanceWidth);
     end;
  end;
end;

function TPascalTypeHorizontalMetricsTable.GetHorizontalMetric(
  Index: Integer): THorizontalMetric;
begin
 if (Index >= 0) and (Index < Length(FHorizontalMetrics))
  then Result := FHorizontalMetrics[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;


function TPascalTypeHorizontalMetricsTable.GetHorizontalMetricCount: Integer;
begin
 Result := Length(FHorizontalMetrics);
end;


{ TCustomTrueTypeFontNamePlatform }

procedure TCustomTrueTypeFontNamePlatform.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomTrueTypeFontNamePlatform(Dest) do
   begin
   end else inherited;
end;

procedure TCustomTrueTypeFontNamePlatform.ResetToDefaults;
begin
 FEncodingID := 0;
 FLanguageID := 0;
 FNameID := niCopyrightNotice;
 FNameString := '';
end;

function TCustomTrueTypeFontNamePlatform.GetEncodingIDAsWord: Word;
begin
 Result := FEncodingID;
end;

procedure TCustomTrueTypeFontNamePlatform.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 6 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read encoding ID
   FEncodingID := ReadSwappedWord(Stream);

   // read language ID
   FLanguageID := ReadSwappedWord(Stream);

   // read name ID
   FNameID := TNameID(ReadSwappedWord(Stream));
  end;
end;

procedure TCustomTrueTypeFontNamePlatform.SaveToStream(Stream: TStream);
begin
 // write encoding ID
 WriteSwappedWord(Stream, FEncodingID);

 // write language ID
 WriteSwappedWord(Stream, FLanguageID);

 // write name ID
 WriteSwappedWord(Stream, Word(FNameID));
end;

procedure TCustomTrueTypeFontNamePlatform.SetEncodingIDAsWord(
  const Value: Word);
begin
 if Value <> FEncodingID then
  begin
   FEncodingID := Value;
   EncodingIDChanged;
  end;
end;

procedure TCustomTrueTypeFontNamePlatform.EncodingIDChanged;
begin
 Changed;
end;


{ TTrueTypeFontNamePlatformUnicode }

function TTrueTypeFontNamePlatformUnicode.GetPlatformID: TPlatformID;
begin
 Result := piUnicode;
end;

procedure TTrueTypeFontNamePlatformUnicode.ReadStringFromStream(Stream: TStream;
  Length: Word);
var
  StrOffset  : Integer;
begin
 with Stream do
  begin
   // reset name string
   FNameString := '';

   // actually read the string
   for StrOffset := 0 to Length div 2 - 1
    do FNameString := FNameString + WideChar(ReadSwappedWord(Stream));
  end;
end;

function TTrueTypeFontNamePlatformUnicode.GetEncodingID: TUnicodeEncodingID;
begin
 Result := TUnicodeEncodingID(FEncodingID);
end;

procedure TTrueTypeFontNamePlatformUnicode.SetEncodingID(
  const Value: TUnicodeEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TTrueTypeFontNamePlatformApple }

function TTrueTypeFontNamePlatformApple.GetPlatformID: TPlatformID;
begin
 Result := piApple;
end;

procedure TTrueTypeFontNamePlatformApple.ReadStringFromStream(Stream: TStream;
  Length: Word);
var
  str : string;
begin
 with Stream do
  begin
   // reset name string
   FNameString := '';

   // actually read the string
   SetLength(str, Length);
   Read(str[1], Length);
   FNameString := str;
  end;
end;

function TTrueTypeFontNamePlatformApple.GetEncodingID: TAppleEncodingID;
begin
 Result := TAppleEncodingID(FEncodingID);
end;

procedure TTrueTypeFontNamePlatformApple.SetEncodingID(
  const Value: TAppleEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;



{ TTrueTypeFontNamePlatformMicrosoft }

function TTrueTypeFontNamePlatformMicrosoft.GetPlatformID: TPlatformID;
begin
 Result := piMicrosoft;
end;

procedure TTrueTypeFontNamePlatformMicrosoft.ReadStringFromStream(
  Stream: TStream; Length: Word);
var
  StrOffset  : Integer;
begin
 with Stream do
  begin
   // reset name string
   FNameString := '';

   // actually read the string
   for StrOffset := 0 to Length div 2 - 1
    do FNameString := FNameString + WideChar(ReadSwappedWord(Stream));
  end;
end;

function TTrueTypeFontNamePlatformMicrosoft.GetEncodingID: TMicrosoftEncodingID;
begin
 Result := TMicrosoftEncodingID(FEncodingID);
end;

procedure TTrueTypeFontNamePlatformMicrosoft.SetEncodingID(
  const Value: TMicrosoftEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TTrueTypeFontNamePlatformISO }

function TTrueTypeFontNamePlatformISO.GetPlatformID: TPlatformID;
begin
 Result := piISO;
end;

procedure TTrueTypeFontNamePlatformISO.ReadStringFromStream(Stream: TStream;
  Length: Word);
var
  str       : string;
  StrOffset : Integer;
begin
 with Stream do
  case FEncodingID of
   0 : begin
        // reset name string
        FNameString := '';

        // actually read the string
        SetLength(str, Length);
        Read(str[1], Length);
        FNameString := str;
       end;
   1 : begin
        // reset name string
        FNameString := '';

        // actually read the string
        for StrOffset := 0 to Length div 2 - 1
         do FNameString := FNameString + WideChar(ReadSwappedWord(Stream));
       end;
  else raise EPascalTypeError.Create('Unsupported encoding');
 end;
end;


{ TPascalTypeNameTable }

constructor TPascalTypeNameTable.Create;
begin
 FNameRecords := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeNameTable.Destroy;
begin
 FreeAndNil(FNameRecords);
 inherited;
end;

function TPascalTypeNameTable.GetNameRecord(Index: Word): TCustomTrueTypeFontNamePlatform;
begin
 if (Index < FNameRecords.Count)
  then Result := TCustomTrueTypeFontNamePlatform(FNameRecords[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeNameTable.GetNameRecordCount: Word;
begin
 Result := FNameRecords.Count;
end;

class function TPascalTypeNameTable.GetTableType: TTableType;
begin
 Result := 'name'
end;

procedure TPascalTypeNameTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeNameTable(Dest) do
   begin
    FFormat := Self.FFormat;

    Self.FNameRecords.OwnsObjects := False;
    FNameRecords.Assign(Self.FNameRecords);
   end
 else inherited;
end;

procedure TPascalTypeNameTable.ResetToDefaults;
begin
 FFormat := 0;
 FNameRecords.Clear;
end;

procedure TPascalTypeNameTable.LoadFromStream(Stream: TStream);
var
  StoragePos  : Int64;
  OldPosition : Int64;
  NameIndex   : Integer;
  NameRecord  : TCustomTrueTypeFontNamePlatform;
  NumRecords  : Word;
  StrLength   : Word;
  StrOffset   : Word;
  Value16     : Word;
begin
 with Stream do
  begin
   // check for minimum table size
   if Position + 6 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // store start position as preliminary storage position in stream
   StoragePos := Position;

   // read format
   FFormat := ReadSwappedWord(Stream);

   if not (FFormat in [0..1])
    then raise EPascalTypeError.Create(RCStrUnknownFormat);

   // internally store number of records
   NumRecords := ReadSwappedWord(Stream);

   // read storage offset and add to preliminary storage position
   StoragePos := StoragePos + ReadSwappedWord(Stream);

   // check for minimum table size
   if Position + NumRecords * 12 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // clear current name record list 
   FNameRecords.Clear;

   for NameIndex := 0 to NumRecords - 1 do
    begin
     // read platform ID
     Value16 := ReadSwappedWord(Stream);
     case TPlatformID(Value16) of
        piUnicode : NameRecord := TTrueTypeFontNamePlatformUnicode.Create;
          piApple : NameRecord := TTrueTypeFontNamePlatformApple.Create;
            piISO : NameRecord := TTrueTypeFontNamePlatformISO.Create;
      piMicrosoft : NameRecord := TTrueTypeFontNamePlatformMicrosoft.Create;
      else raise EPascalTypeError.CreateFmt(RCStrUnsupportedPlatform, [Value16]);
     end;

     NameRecord.LoadFromStream(Stream);

     // read length
     StrLength := ReadSwappedWord(Stream);

     // read offset
     StrOffset := ReadSwappedWord(Stream);

     // store current position and jump to string definition
     OldPosition := Position;
     Position := StoragePos + StrOffset;

     NameRecord.ReadStringFromStream(Stream, StrLength);

     Position := OldPosition;

     // add to name record list
     FNameRecords.Add(NameRecord);
    end;

   // ignore format 1 addition
   if FFormat = 1
    then Position := Position + ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeNameTable.SaveToStream(Stream: TStream);
begin
 raise EPascalTypeError.Create(RCStrNotImplemented);
end;

procedure TPascalTypeNameTable.SetFormat(const Value: Word);
begin
 if FFormat <> Value then
  begin
   FFormat := Value;
   FormatChanged;
  end;
end;

procedure TPascalTypeNameTable.FormatChanged;
begin
 Changed;
end;


{ TPascalTypeMaximumProfileTable }

procedure TPascalTypeMaximumProfileTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeMaximumProfileTable(Dest) do
   begin
    FVersion               := Self.FVersion;
    FNumGlyphs             := Self.FNumGlyphs;
    FMaxPoints             := Self.FMaxPoints;
    FMaxContours           := Self.FMaxContours;
    FMaxCompositePoints    := Self.FMaxCompositePoints;
    FMaxCompositeContours  := Self.FMaxCompositeContours;
    FMaxZones              := Self.FMaxZones;
    FMaxTwilightPoints     := Self.FMaxTwilightPoints;
    FMaxStorage            := Self.FMaxStorage;
    FMaxFunctionDefs       := Self.FMaxFunctionDefs;
    FMaxInstructionDefs    := Self.FMaxInstructionDefs;
    FMaxStackElements      := Self.FMaxStackElements;
    FMaxSizeOfInstructions := Self.FMaxSizeOfInstructions;
    FMaxComponentElements  := Self.FMaxComponentElements;
    FMaxComponentDepth     := Self.FMaxComponentDepth;
   end
 else inherited;
end;

class function TPascalTypeMaximumProfileTable.GetTableType: TTableType;
begin
 Result := 'maxp';
end;

procedure TPascalTypeMaximumProfileTable.ResetToDefaults;
begin
 FVersion.Value := 1;
 FNumGlyphs := 0;
 FMaxPoints := 0;
 FMaxContours := 0;
 FMaxCompositePoints := 0;
 FMaxCompositeContours := 0;
 FMaxZones := 0;
 FMaxTwilightPoints := 0;
 FMaxStorage := 0;
 FMaxFunctionDefs := 0;
 FMaxInstructionDefs := 0;
 FMaxStackElements := 0;
 FMaxSizeOfInstructions := 0;
 FMaxComponentElements := 0;
 FMaxComponentDepth := 0;
end;

procedure TPascalTypeMaximumProfileTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + $20 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   FVersion := TFixedPoint(Swap32(Value32));

   if Version.Value <> 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read glyphs count
   FNumGlyphs := ReadSwappedWord(Stream);

   // read max points
   FMaxPoints := ReadSwappedWord(Stream);

   // read max contours
   FMaxContours := ReadSwappedWord(Stream);

   // read max composite points
   FMaxCompositePoints := ReadSwappedWord(Stream);

   // read max composite contours
   FMaxCompositeContours := ReadSwappedWord(Stream);

   // read max zones
   FMaxZones := ReadSwappedWord(Stream);

   // read max twilight points
   FMaxTwilightPoints := ReadSwappedWord(Stream);

   // read max storage
   FMaxStorage := ReadSwappedWord(Stream);

   // read max function defs
   FMaxFunctionDefs := ReadSwappedWord(Stream);

   // read max instruction defs
   FMaxInstructionDefs := ReadSwappedWord(Stream);

   // read max stack elements
   FMaxStackElements := ReadSwappedWord(Stream);

   // read max size of instructions
   FMaxSizeOfInstructions := ReadSwappedWord(Stream);

   // read max component elements
   FMaxComponentElements := ReadSwappedWord(Stream);

   // read max component depth
   FMaxComponentDepth := ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeMaximumProfileTable.SaveToStream(Stream: TStream);
begin
 // write version
 WriteSwappedCardinal(Stream, Cardinal(FVersion));

 // write glyphs count
 WriteSwappedWord(Stream, FNumGlyphs);

 // write max points
 WriteSwappedWord(Stream, FMaxPoints);

 // write max contours
 WriteSwappedWord(Stream, FMaxContours);

 // write max composite points
 WriteSwappedWord(Stream, FMaxCompositePoints);

 // write max composite contours
 WriteSwappedWord(Stream, FMaxCompositeContours);

 // write max zones
 WriteSwappedWord(Stream, FMaxZones);

 // write max twilight points
 WriteSwappedWord(Stream, FMaxTwilightPoints);

 // write max storage
 WriteSwappedWord(Stream, FMaxStorage);

 // write max function defs
 WriteSwappedWord(Stream, FMaxFunctionDefs);

 // write max instruction defs
 WriteSwappedWord(Stream, FMaxInstructionDefs);

 // write max stack elements
 WriteSwappedWord(Stream, FMaxStackElements);

 // write max size of instructions
 WriteSwappedWord(Stream, FMaxSizeOfInstructions);

 // write max component elements
 WriteSwappedWord(Stream, FMaxComponentElements);

 // write max component depth
 WriteSwappedWord(Stream, FMaxComponentDepth);
end;

procedure TPascalTypeMaximumProfileTable.SetMaxComponentDepth(
  const Value: Word);
begin
 if FMaxComponentDepth <> Value then
  begin
   FMaxComponentDepth := Value;
   MaxComponentDepthChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxComponentElements(
  const Value: Word);
begin
 if FMaxComponentElements <> Value then
  begin
   FMaxComponentElements := Value;
   MaxComponentElementsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxCompositeContours(
  const Value: Word);
begin
 if FMaxCompositeContours <> Value then
  begin
   FMaxCompositeContours := Value;
   MaxCompositeContoursChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxCompositePoints(
  const Value: Word);
begin
 if FMaxCompositePoints <> Value then
  begin
   FMaxCompositePoints := Value;
   MaxCompositePointsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxContours(const Value: Word);
begin
 if FMaxContours <> Value then
  begin
   FMaxContours := Value;
   MaxContoursChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxFunctionDefs(
  const Value: Word);
begin
 if FMaxFunctionDefs <> Value then
  begin
   FMaxFunctionDefs := Value;
   MaxFunctionDefsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxInstructionDefs(
  const Value: Word);
begin
 if FMaxInstructionDefs <> Value then
  begin
   FMaxInstructionDefs := Value;
   MaxInstructionDefsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxPoints(const Value: Word);
begin
 if FMaxPoints <> Value then
  begin
   FMaxPoints := Value;
   MaxPointsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxSizeOfInstructions(
  const Value: Word);
begin
 if FMaxSizeOfInstructions <> Value then
  begin
   FMaxSizeOfInstructions := Value;
   MaxSizeOfInstructionsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxStackElements(
  const Value: Word);
begin
 if FMaxStackElements <> Value then
  begin
   FMaxStackElements := Value;
   MaxStackElementsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxStorage(const Value: Word);
begin
 if FMaxStorage <> Value then
  begin
   FMaxStorage := Value;
   MaxStorageChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxTwilightPoints(
  const Value: Word);
begin
 if FMaxTwilightPoints <> Value then
  begin
   FMaxTwilightPoints := Value;
   MaxTwilightPointsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxZones(const Value: Word);
begin
 if FMaxZones <> Value then
  begin
   FMaxZones := Value;
   MaxZonesChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetNumGlyphs(const Value: Word);
begin
 if FNumGlyphs <> Value then
  begin
   FNumGlyphs := Value;
   NumGlyphsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.MaxComponentDepthChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxComponentElementsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxCompositeContoursChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxCompositePointsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxContoursChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxFunctionDefsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxInstructionDefsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxPointsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxSizeOfInstructionsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxStackElementsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxStorageChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxTwilightPointsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.MaxZonesChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.NumGlyphsChanged;
begin
 Changed;
end;

procedure TPascalTypeMaximumProfileTable.VersionChanged;
begin
 Changed;
end;

{ TCustomPascalTypePanoseTable }

procedure TCustomPascalTypePanoseTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomPascalTypePanoseTable(Dest)
   do FData := Self.FData;
 inherited;
end;

procedure TCustomPascalTypePanoseTable.ResetToDefaults;
begin
 FillChar(FData[0], 9, 0);
end;

function TCustomPascalTypePanoseTable.GetData(Index: Byte): Byte;
begin
 if Index in [0..8]
  then Result := FData[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

procedure TCustomPascalTypePanoseTable.SetData(Index: Byte; const Value: Byte);
begin
 if Index in [0..8]
  then FData[Index] := Value
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

procedure TCustomPascalTypePanoseTable.LoadFromStream(Stream: TStream);
begin
 inherited;

 Stream.Read(FData[0], 9);
end;

procedure TCustomPascalTypePanoseTable.SaveToStream(Stream: TStream);
begin
 inherited;

 Stream.Write(FData[0], 9);
end;


{ TPascalTypeDefaultPanoseTable }

class function TPascalTypeDefaultPanoseTable.GetFamilyType: Byte;
begin
 Result := 0; // not specified and thus identifier for unknown panose type
end;

procedure TPascalTypeDefaultPanoseTable.LoadFromStream(Stream: TStream);
begin
 // read family type frem stream prior to any other data
 Stream.Read(FFamilyType, 1);

 inherited;
end;

procedure TPascalTypeDefaultPanoseTable.SaveToStream(Stream: TStream);
begin
 // write family type frem stream prior to any other data
 Stream.Write(FFamilyType, 1);

 inherited;
end;


{ TPascalTypeUnicodeRangeTable }

procedure TPascalTypeUnicodeRangeTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeUnicodeRangeTable(Dest) do
   begin
    FUnicodeRange := Self.FUnicodeRange;
   end
 else inherited;
end;

procedure TPascalTypeUnicodeRangeTable.ResetToDefaults;
begin
 FillChar(FUnicodeRange, SizeOf(TOS2UnicodeRange), 0);
end;

procedure TPascalTypeUnicodeRangeTable.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 16 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read range from stream
   FUnicodeRange[0] := ReadSwappedCardinal(Stream);
   FUnicodeRange[1] := ReadSwappedCardinal(Stream);
   FUnicodeRange[2] := ReadSwappedCardinal(Stream);
   FUnicodeRange[3] := ReadSwappedCardinal(Stream);
  end;
end;

procedure TPascalTypeUnicodeRangeTable.SaveToStream(Stream: TStream);
begin
 // write range to stream
 WriteSwappedCardinal(Stream, FUnicodeRange[0]);
 WriteSwappedCardinal(Stream, FUnicodeRange[1]);
 WriteSwappedCardinal(Stream, FUnicodeRange[2]);
 WriteSwappedCardinal(Stream, FUnicodeRange[3]);
end;

procedure TPascalTypeUnicodeRangeTable.SetAsCardinal(Index: Byte;
  const Value: Cardinal);
begin
 if Index in [0..3]
  then FUnicodeRange[Index] := Value
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeUnicodeRangeTable.GetAsCardinal(Index: Byte): Cardinal;
begin
 if Index in [0..3]
  then Result := FUnicodeRange[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeUnicodeRangeTable.GetAsString: string;
begin
 Result := UnicodeRangeToString(FUnicodeRange);
end;

function TPascalTypeUnicodeRangeTable.GetSupportsAegeanNumbers: Boolean;
begin
 Result := (FUnicodeRange[3] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsAlphabeticPresentationForms: Boolean;
begin
 Result := (FUnicodeRange[1] and (1 shl 30)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsAncientGreekMusicalNotation: Boolean;
begin
 Result := (FUnicodeRange[2] and (1 shl 24)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsAncientGreekNumbers: Boolean;
begin
 Result := (FUnicodeRange[3] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsAncientSymbols: Boolean;
begin
 Result := (FUnicodeRange[3] and (1 shl 23)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsArabic: Boolean;
begin
 Result := (FUnicodeRange[0] and (1 shl 13)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsArabicPresentationFormsA: Boolean;
begin
 Result := (FUnicodeRange[1] and (1 shl 31)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsArabicPresentationFormsB: Boolean;
begin
 Result := (FUnicodeRange[2] and (1 shl 3)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsArabicSupplement: Boolean;
begin
 Result := SupportsArabic;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsArmenian: Boolean;
begin
 Result := (FUnicodeRange[0] and (1 shl 10)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsArrows: Boolean;
begin
 Result := (FUnicodeRange[1] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBalinese: Boolean;
begin
 Result := (FUnicodeRange[0] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBasicLatin: Boolean;
begin
 Result := (FUnicodeRange[0] and 1) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBengali: Boolean;
begin
 Result := (FUnicodeRange[0] and (1 shl 16)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBlockElements: Boolean;
begin
 Result := (FUnicodeRange[1] and (1 shl 12)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBopomofo: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 19)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBopomofoExtended: Boolean;
begin
 Result := GetSupportsBopomofo;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBoxDrawing: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 11)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBraillePatterns: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 18)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBuginese: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 0)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsBuhid: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsByzantineMusicalSymbols: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 24)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCarian: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 25)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCham: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 22)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCherokee: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 12)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKCompatibility: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 23)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKCompatibilityForms: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 1)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKCompatibilityIdeographs: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 29)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKCompatibilityIdeographsSupplement: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 29)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKRadicalsSupplement: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKStrokes: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 29)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKSymbolsAndPunctuation: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 16)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKUnifiedIdeographs: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKUnifiedIdeographsExtensionA: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCJKUnifiedIdeographsExtensionB: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCombiningDiacriticalMarks: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCombiningDiacriticalMarksForSymbols: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 2)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCombiningDiacriticalMarksSupplement: Boolean;
begin
 Result := GetSupportsCombiningDiacriticalMarks;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCombiningHalfMarks: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 0)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsControlPictures: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 8)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCoptic: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 8)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCountingRodNumerals: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 15)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCuneiform: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 14)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCuneiformNumbersAndPunctuation: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 14)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCurrencySymbols: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 1)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCypriotSyllabary: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 11)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCyrillic: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 9)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCyrillicExtendedA: Boolean;
begin
 Result := GetSupportsCyrillic
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCyrillicExtendedB: Boolean;
begin
 Result := GetSupportsCyrillic
end;

function TPascalTypeUnicodeRangeTable.GetSupportsCyrillicSupplement: Boolean;
begin
 Result := GetSupportsCyrillic
end;

function TPascalTypeUnicodeRangeTable.GetSupportsDeseret: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 23)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsDevanagari: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 15)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsDingbats: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 15)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsDominoTiles: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 26)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsEnclosedAlphanumerics: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 10)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsEnclosedCJKLettersAndMonths: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 22)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsEthiopic: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 11)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsEthiopicExtended: Boolean;
begin
 Result := GetSupportsEthiopic;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsEthiopicSupplement: Boolean;
begin
 Result := GetSupportsEthiopic;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGeneralPunctuation: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 31)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGeometricShapes: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 13)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGeorgian: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 26)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGeorgianSupplement: Boolean;
begin
 Result := GetSupportsGeorgian;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGlagolitic: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 1)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGothic: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 22)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGreekandCoptic: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 7)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGreekExtended: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 30)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGujarati: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 18)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsGurmukhi: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 17)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHalfwidthAndFullwidthForms: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHangulCompatibilityJamo: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHangulJamo: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 28)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHangulSyllables: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 24)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHanunoo: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHebrew: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 11)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsHiragana: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 17)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsIdeographicDescriptionCharacters: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsIPAExtensions: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKanbun: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKangxiRadicals: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKannada: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 22)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKatakana: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 18)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKatakanaPhoneticExtensions: Boolean;
begin
 Result := GetSupportsKatakana;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKayahLi: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKharoshthi: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 12)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKhmer: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 16)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsKhmerSymbols: Boolean;
begin
 Result := GetSupportsKhmer;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLao: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 25)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLatin1Supplement: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 1)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLatinExtendedA: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 2)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLatinExtendedAdditional: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 29)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLatinExtendedB: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 3)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLatinExtendedC: Boolean;
begin
 Result := GetSupportsLatinExtendedAdditional;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLatinExtendedD: Boolean;
begin
 Result := GetSupportsLatinExtendedAdditional;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLepcha: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 17)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLetterlikeSymbols: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 3)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLimbu: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 29)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLinearBIdeograms: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLinearBSyllabary: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLycian: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 25)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsLydian: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 25)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMahjongTiles: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 26)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMalayalam: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 23)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMathematicalAlphanumericSymbols: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 25)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMathematicalOperators: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMiscellaneousMathematicalSymbolsA: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMiscellaneousMathematicalSymbolsB: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMiscellaneousSymbols: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 14)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMiscellaneousSymbolsAndArrows: Boolean;
begin
 Result := (FUnicodeRange[1] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMiscellaneousTechnical: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 7)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsModifierToneLetters: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMongolian: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 17)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMusicalSymbols: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 24)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsMyanmar: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 10)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsNewTaiLue: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 31)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsNKo: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 14)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsNonPlane0: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 25)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsNumberForms: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOgham: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 14)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOlChiki: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 18)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOldItalic: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 21)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOldPersian: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 8)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOpticalCharacterRecognition: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 9)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOriya: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 19)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsOsmanya: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 10)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPhagsPa: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 21)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPhaistosDisc: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 24)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPhoenician: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 26)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPhoneticExtensions: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPhoneticExtensionsSupplement: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPrivateUseAreaPlane0: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 28)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPrivateUsePlane15: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 26)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsPrivateUsePlane16: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 26)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsRejang: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 21)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsRunic: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 15)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSaurashtra: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 19)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsShavian: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 9)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSinhala: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 9)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSmallFormVariants: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 2)) <> 0
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSpacingModifierLetters: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSpecials: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 5)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSundanese: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 16)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSuperscriptsAndSubscripts: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 0)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSupplementalArrowsA: Boolean;
begin
 Result := GetSupportsArrows;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSupplementalArrowsB: Boolean;
begin
 Result := GetSupportsArrows;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSupplementalMathematicalOperators: Boolean;
begin
 Result := (FUniCodeRange[1] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSupplementalPunctuation: Boolean;
begin
 Result := GetSupportsGeneralPunctuation;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSylotiNagri: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 4)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsSyriac: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 7)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTagalog: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTagbanwa: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTags: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 28)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTaiLe: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 30)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTaiXuanJingSymbols: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 13)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTamil: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 20)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTelugu: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 21)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsThaana: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 8)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsThai: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 24)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTibetan: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 6)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsTifinagh: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 2)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsUgaritic: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 7)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsUnifiedCanadianAboriginalSyllabics: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 13)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsVai: Boolean;
begin
 Result := (FUniCodeRange[0] and (1 shl 12)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsVariationSelectors: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsVariationSelectorsSupplement: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 27)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsVerticalForms: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 1)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsYijingHexagramSymbols: Boolean;
begin
 Result := (FUniCodeRange[3] and (1 shl 3)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsYiRadicals: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 19)) <> 0;
end;

function TPascalTypeUnicodeRangeTable.GetSupportsYiSyllables: Boolean;
begin
 Result := (FUniCodeRange[2] and (1 shl 19)) <> 0;
end;


{ TPascalTypeOS2CodePageRangeTable }

procedure TPascalTypeOS2CodePageRangeTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TPascalTypeOS2CodePageRangeTable(Self) do
   begin
    FCodePageRange[0] := Self.FCodePageRange[0];
    FCodePageRange[1] := Self.FCodePageRange[1];
   end;
end;

procedure TPascalTypeOS2CodePageRangeTable.ResetToDefaults;
begin
 FCodePageRange[0] := 0;
 FCodePageRange[1] := 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetAsCardinal(Index: Byte): Cardinal;
begin
 if Index in [0..1]
  then Result := FCodePageRange[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeOS2CodePageRangeTable.GetAsString: string;
begin
 Result := CodePageRangeToString(FCodePageRange);
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsAlternativeArabic: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 19)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsAlternativeHebrew: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 21)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsArabic: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 6)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsASMO708: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 29)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsChineseSimplified: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 18)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsChineseTraditional: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 20)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsCyrillic: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 2)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsGreek: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 3)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsGreekFormer437G: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 28)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsHebrew: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 5)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsIBMCyrillic: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 25)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsIBMGreek: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 16)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsIBMTurkish: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 24)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsJISJapan: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 17)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsKoreanJohab: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 21)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsKoreanWansung: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 19)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsLatin1: Boolean;
begin
 Result := (FCodePageRange[0] and 1) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsLatin2: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 26)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsLatin2EasternEurope: Boolean;
begin
 Result := (FCodePageRange[0] and 2) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMacintoshCharacterSet: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 29)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMSDOSBaltic: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 27)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMSDOSCanadianFrench: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 20)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMSDOSIcelandic: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 22)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMSDOSNordic: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 18)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMSDOSPortuguese: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 23)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsMSDOSRussian: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 17)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsOEMCharacter: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 30)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsSymbolCharacterSet: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 31)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsThai: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 16)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsTurkish: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 4)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsUS: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 31)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsVietnamese: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 8)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsWELatin1: Boolean;
begin
 Result := (FCodePageRange[1] and (1 shl 30)) <> 0;
end;

function TPascalTypeOS2CodePageRangeTable.GetSupportsWindowsBaltic: Boolean;
begin
 Result := (FCodePageRange[0] and (1 shl 7)) <> 0;
end;

procedure TPascalTypeOS2CodePageRangeTable.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read first cardinal
   FCodePageRange[0] := ReadSwappedCardinal(Stream);

   // read second cardinal
   FCodePageRange[1] := ReadSwappedCardinal(Stream);
  end;
end;

procedure TPascalTypeOS2CodePageRangeTable.SaveToStream(Stream: TStream);
begin
 // write first cardinal
 WriteSwappedCardinal(Stream, FCodePageRange[0]);

 // write second cardinal
 WriteSwappedCardinal(Stream, FCodePageRange[1]);
end;

procedure TPascalTypeOS2CodePageRangeTable.SetAsCardinal(Index: Byte;
  const Value: Cardinal);
begin
 if Index in [0..1]
  then FCodePageRange[Index] := Value
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;


{ TPascalTypeOS2AddendumTable }

procedure TPascalTypeOS2AddendumTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeOS2AddendumTable(Dest) do
   begin

   end
  else inherited;
end;

procedure TPascalTypeOS2AddendumTable.ResetToDefaults;
begin
 FXHeight     := 0;
 FCapHeight   := 0;
 FDefaultChar := 0;
 FBreakChar   := 0;
 FMaxContext  := 0;
end;

procedure TPascalTypeOS2AddendumTable.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 10 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read x-Height
   FXHeight := ReadSwappedWord(Stream);

   // read capital height
   FCapHeight := ReadSwappedWord(Stream);

   // read default character
   FDefaultChar := ReadSwappedWord(Stream);

   // read break character
   FBreakChar := ReadSwappedWord(Stream);

   // read max. context
   FMaxContext := ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeOS2AddendumTable.SaveToStream(Stream: TStream);
begin
 // write x-Height
 WriteSwappedWord(Stream, FXHeight);

 // write capital height
 WriteSwappedWord(Stream, FCapHeight);

 // write default character
 WriteSwappedWord(Stream, FDefaultChar);

 // write break character
 WriteSwappedWord(Stream, FBreakChar);

 // write max. context
 WriteSwappedWord(Stream, FMaxContext);
end;

procedure TPascalTypeOS2AddendumTable.SetBreakChar(const Value: Word);
begin
 if FBreakChar <> Value then
  begin
   FBreakChar := Value;
   BreakCharChanged;
  end;
end;

procedure TPascalTypeOS2AddendumTable.SetCapHeight(const Value: SmallInt);
begin
 if FCapHeight <> Value then
  begin
   FCapHeight := Value;
   CapHeightChanged;
  end;
end;

procedure TPascalTypeOS2AddendumTable.SetDefaultChar(const Value: Word);
begin
 if FDefaultChar <> Value then
  begin
   FDefaultChar := Value;
   DefaultCharChanged;
  end;
end;

procedure TPascalTypeOS2AddendumTable.SetMaxContext(const Value: Word);
begin
 if FMaxContext <> Value then
  begin
   FMaxContext := Value;
   MaxContextChanged;
  end;
end;

procedure TPascalTypeOS2AddendumTable.SetXHeight(const Value: SmallInt);
begin
 if FXHeight <> Value then
  begin
   FXHeight := Value;
   XHeightChanged;
  end;
end;

procedure TPascalTypeOS2AddendumTable.BreakCharChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2AddendumTable.CapHeightChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2AddendumTable.DefaultCharChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2AddendumTable.MaxContextChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2AddendumTable.XHeightChanged;
begin
 Changed;
end;


{ TPascalTypeOS2Table }

constructor TPascalTypeOS2Table.Create(Interpreter: IPascalTypeInterpreter);
begin
 FPanose := TPascalTypeDefaultPanoseTable.Create;
 FUnicodeRangeTable := TPascalTypeUnicodeRangeTable.Create;
 inherited;
end;

destructor TPascalTypeOS2Table.Destroy;
begin
 FreeAndNil(FPanose);
 FreeAndNil(FUnicodeRangeTable);
 if Assigned(FCodePageRange)
  then FreeAndNil(FCodePageRange);
 if Assigned(FAddendumTable)
  then FreeAndNil(FAddendumTable);
 inherited;
end;

procedure TPascalTypeOS2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeNameTable(Dest) do
   begin
    FVersion               := Self.FVersion;
    FAverageCharacterWidth := Self.FAverageCharacterWidth;
    FWeight                := Self.FWeight;
    FWidthType             := Self.FWidthType;
    FFontEmbeddingFlags    := Self.FFontEmbeddingFlags;
    FSubscriptSizeX        := Self.FSubscriptSizeX;
    FSubscriptSizeY        := Self.FSubscriptSizeY;
    FSubScriptOffsetX      := Self.FSubScriptOffsetX;
    FSubscriptYOffsetY     := Self.FSubscriptYOffsetY;
    FSuperscriptSizeX      := Self.FSuperscriptSizeX;
    FSuperscriptSizeY      := Self.FSuperscriptSizeY;
    FSuperscriptOffsetX    := Self.FSuperscriptOffsetX;
    FSuperscriptOffsetY    := Self.FSuperscriptOffsetY;
    FStrikeoutSize         := Self.FStrikeoutSize;
    FStrikeoutPosition     := Self.FStrikeoutPosition;
    FFontFamilyType        := Self.FFontFamilyType;
    FFontVendorID          := Self.FFontVendorID;
    FFontSelection         := Self.FFontSelection;
    FUnicodeFirstCharIndex := Self.FUnicodeFirstCharIndex;
    FUnicodeLastCharIndex  := Self.FUnicodeLastCharIndex;
    FTypographicAscent     := Self.FTypographicAscent;
    FTypographicDescent    := Self.FTypographicDescent;
    FTypographicLineGap    := Self.FTypographicLineGap;
    FWindowsAscent         := Self.FWindowsAscent;
    FWindowsDescent        := Self.FWindowsDescent;
    FPanose.Assign(Self.FPanose);
    FUnicodeRangeTable.Assign(Self.FUnicodeRangeTable);
    FCodePageRange.AssignTo(Self.FCodePageRange);
    FAddendumTable.AssignTo(Self.FAddendumTable);
   end
 else inherited;
end;

function TPascalTypeOS2Table.GetFontEmbeddingRights: TOS2FontEmbeddingRights;
begin
 Result := FontEmbeddingFlagsToRights(FFontEmbeddingFlags);
end;

function TPascalTypeOS2Table.GetFontFamilyClassID: Byte;
begin
 Result := FFontFamilyType shr 8;
end;

function TPascalTypeOS2Table.GetFontFamilySubClassID: Byte;
begin
 Result := FFontFamilyType and $FF;
end;

function TPascalTypeOS2Table.GetFontSelectionFlags: TOS2FontSelectionFlags;
begin
 Result := WordToFontSelectionFlags(FFontSelection);
end;

class function TPascalTypeOS2Table.GetTableType: TTableType;
begin
 Result := 'OS/2';
end;

procedure TPascalTypeOS2Table.ResetToDefaults;
begin
 FVersion := 0;
 FAverageCharacterWidth := 0;
 FWeight := 400;
 FWidthType := 5;
 FFontEmbeddingFlags := 0;
 FSubscriptSizeX := 0;
 FSubscriptSizeY := 0;
 FSubScriptOffsetX := 0;
 FSubscriptYOffsetY := 0;
 FSuperscriptSizeX := 0;
 FSuperscriptSizeY := 0;
 FSuperscriptOffsetX := 0;
 FSuperscriptOffsetY := 0;
 FStrikeoutSize := 0;
 FStrikeoutPosition := 0;
 FFontFamilyType := 0;
 FFontVendorID := #0#0#0#0;
 FFontSelection := 0;
 FUnicodeFirstCharIndex := 0;
 FUnicodeLastCharIndex := 0;
 FTypographicAscent := 0;
 FTypographicDescent := 0;
 FTypographicLineGap := 0;
 FWindowsAscent := 0;
 FWindowsDescent := 0;

 // reset panose
 if not (FPanose is TPascalTypeDefaultPanoseTable) then
  begin
   // free other panose object
   FreeAndNil(FPanose);

   // create new default panose object
   FPanose := TPascalTypeDefaultPanoseTable.Create;
  end else FPanose.ResetToDefaults;

 FUnicodeRangeTable.ResetToDefaults;
end;

procedure TPascalTypeOS2Table.LoadFromStream(Stream: TStream);
var
  PanoseFamilyKind  : Byte;
  PanoseFamilyClass : TCustomPascalTypePanoseClass;
  {$IFDEF AmbigiousExceptions}
  HorizontalHeader  : TPascalTypeHorizontalHeaderTable;
  {$ENDIF}
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 68 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read version
   FVersion := ReadSwappedWord(Stream);

   // check version
   if not (Version in [0..3])
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read average horizontal character width
   FAverageCharacterWidth := ReadSwappedWord(Stream);

   // read weight
   FWeight := ReadSwappedWord(Stream);

   // read width type
   FWidthType := ReadSwappedWord(Stream);

   // read font embedding right flags
   FFontEmbeddingFlags := ReadSwappedWord(Stream);

   // read SubscriptSizeX
   FSubscriptSizeX := ReadSwappedWord(Stream);

   // read SubscriptSizeY
   FSubscriptSizeY := ReadSwappedWord(Stream);

   // read SubScriptOffsetX
   FSubScriptOffsetX := ReadSwappedWord(Stream);

   // read SubscriptOffsetX
   FSubscriptYOffsetY := ReadSwappedWord(Stream);

   // read SuperscriptSizeX
   FSuperscriptSizeX := ReadSwappedWord(Stream);

   // read SuperscriptSizeY
   FSuperscriptSizeY := ReadSwappedWord(Stream);

   // read SuperscriptOffsetX
   FSuperscriptOffsetX := ReadSwappedWord(Stream);

   // read SuperscriptOffsetY
   FSuperscriptOffsetY := ReadSwappedWord(Stream);

   // read StrikeoutSize
   FStrikeoutSize := ReadSwappedWord(Stream);

   // read StrikeoutPosition
   FStrikeoutPosition := ReadSwappedWord(Stream);

   // read font family type
   FFontFamilyType := ReadSwappedWord(Stream);

   // read panose
   Read(PanoseFamilyKind, 1);

   // find panose family class by type
   PanoseFamilyClass := FindPascalTypePanoseByType(PanoseFamilyKind);

   if not Assigned(PanoseFamilyClass) then
    begin
     if not (FPanose is TPascalTypeDefaultPanoseTable) then
      begin
       // free other panose object
       FreeAndNil(FPanose);

       // create new latin text panose object
       FPanose := TPascalTypeDefaultPanoseTable.Create;
      end;

     // rewind current position to read the family type as well
     Seek(-1, soFromCurrent);
    end
   else
    if not (FPanose is PanoseFamilyClass) then
     begin
      // free other panose object
      FreeAndNil(FPanose);

      // create new latin text panose object
      FPanose := PanoseFamilyClass.Create;
     end;

   // load panose object from stream
   FPanose.LoadFromStream(Stream);

   // read unicode range
   FUnicodeRangeTable.LoadFromStream(Stream);

   // read font vendor identification
   Read(FFontVendorID, 4);

   // read font selection flags
   FFontSelection := ReadSwappedWord(Stream);
   if FVersion < 4
    then FFontSelection := FFontSelection and $7F
   {$IFDEF AmbigiousExceptions}
    else if FVersion = 4 then
     if (FFontSelection and $FF80) <> 0
      then raise EPascalTypeError.Create(RCStrReservedValueError)
   {$ENDIF};

   // read UnicodeFirstCharacterIndex
   FUnicodeFirstCharIndex := ReadSwappedWord(Stream);

   // read UnicodeLastCharacterIndex
   FUnicodeLastCharIndex := ReadSwappedWord(Stream);

   // read TypographicAscent
   FTypographicAscent := ReadSwappedWord(Stream);

   // read TypographicDescent
   FTypographicDescent := ReadSwappedWord(Stream);

   // read TypographicLineGap
   FTypographicLineGap := ReadSwappedWord(Stream);

   // read WindowsAscent
   FWindowsAscent := ReadSwappedWord(Stream);

   // read WindowsDescent
   FWindowsDescent := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   HorizontalHeader := TPascalTypeHorizontalHeaderTable(FInterpreter.GetTableByTableType('hhea'));
   Assert(Assigned(HorizontalHeader));
   with HorizontalHeader do
    begin
     if fsfUseTypoMetrics in FontSelectionFlags then
      begin
       if Abs(Ascent) <> Abs(FTypographicAscent)
        then raise EPascalTypeError.Create('Error: Typographic ascender should be equal to the ascender defined in the horizontal header table');

       if Abs(Descent) <> Abs(FTypographicDescent)
        then raise EPascalTypeError.Create('Error: Typographic descender should be equal to the descender defined in the horizontal header table');

       if Abs(LineGap) <> Abs(FTypographicLineGap)
        then raise EPascalTypeError.Create('Error: Typographic line gap should be equal to the line gap defined in the horizontal header table');
      end
     else
      begin
       if Abs(Ascent) <> Abs(FWindowsAscent)
        then raise EPascalTypeError.Create('Error: Windows ascender should be equal to the ascender defined in the horizontal header table');

       if Abs(Descent) <> Abs(FDescent)
        then raise EPascalTypeError.Create('Error: Windows descender should be equal to the descender defined in the horizontal header table');
      end;
    end;
   {$ENDIF}

   // eventually load further tables
   if Version > 0 then
    begin
     // check if codepage range exists
     if not Assigned(FCodePageRange)
      then FCodePageRange := TPascalTypeOS2CodePageRangeTable.Create;

     // load codepage range from stream
     FCodePageRange.LoadFromStream(Stream);

     // eventually load addendum table
     if Version >= 2 then
      begin
       // check if addendum table exists
       if not Assigned(FAddendumTable)
        then FAddendumTable := TPascalTypeOS2AddendumTable.Create;

       // load addendum table from stream
       FAddendumTable.LoadFromStream(Stream);
      end;
    end;
  end;
end;

procedure TPascalTypeOS2Table.SaveToStream(Stream: TStream);
begin
 // write version
 WriteSwappedWord(Stream, FVersion);

 // write average horizontal character width
 WriteSwappedWord(Stream, FAverageCharacterWidth);

 // write weight
 WriteSwappedWord(Stream, FWeight);

 // write width class
 WriteSwappedWord(Stream, FWidthType);

 // write font embedding rights
 WriteSwappedWord(Stream, FFontEmbeddingFlags);

 // write SubscriptSizeX
 WriteSwappedWord(Stream, FSubscriptSizeX);

 // write SubscriptSizeY
 WriteSwappedWord(Stream, FSubscriptSizeY);

 // write SubScriptOffsetX
 WriteSwappedWord(Stream, FSubScriptOffsetX);

 // write SubscriptOffsetX
 WriteSwappedWord(Stream, FSubscriptYOffsetY);

 // write SuperscriptSizeX
 WriteSwappedWord(Stream, FSuperscriptSizeX);

 // write SuperscriptSizeY
 WriteSwappedWord(Stream, FSuperscriptSizeY);

 // write SuperscriptOffsetX
 WriteSwappedWord(Stream, FSuperscriptOffsetX);

 // write SuperscriptOffsetY
 WriteSwappedWord(Stream, FSuperscriptOffsetY);

 // write StrikeoutSize
 WriteSwappedWord(Stream, FStrikeoutSize);

 // write StrikeoutPosition
 WriteSwappedWord(Stream, FStrikeoutPosition);

 // write font family type
 WriteSwappedWord(Stream, FFontFamilyType);

 // write panose
 FPanose.SaveToStream(Stream);

 // write unicode range
 FUnicodeRangeTable.SaveToStream(Stream);

 // read font vendor identification
 Stream.Write(FFontVendorID, 4);

 // write font selection
 WriteSwappedWord(Stream, FFontSelection);

 // write UnicodeFirstCharacterIndex
 WriteSwappedWord(Stream, FUnicodeFirstCharIndex);

 // write UnicodeLastCharacterIndex
 WriteSwappedWord(Stream, FUnicodeLastCharIndex);

 // write TypographicAscent
 WriteSwappedWord(Stream, FTypographicAscent);

 // write TypographicDescent
 WriteSwappedWord(Stream, FTypographicDescent);

 // write TypographicLineGap
 WriteSwappedWord(Stream, FTypographicLineGap);

 // write WindowsAscent
 WriteSwappedWord(Stream, FWindowsAscent);

 // write WindowsDescent
 WriteSwappedWord(Stream, FWindowsDescent);

 // eventually write code page range and addendum table
 if (FVersion > 0) then
  begin
   // check if code page range has been set and eventually save to stream
   if Assigned(FCodePageRange)
    then FCodePageRange.SaveToStream(Stream)
    else raise EPascalTypeError.Create(RCStrCodePageRangeTableUndefined);

   // check if addendum table has been set and eventually save to stream
   if Version >= 2 then
    if Assigned(FAddendumTable)
     then FAddendumTable.SaveToStream(Stream)
     else raise EPascalTypeError.Create(RCStrAddendumTableUndefined);
  end;
end;

function TPascalTypeOS2Table.GetWeightClass: TOS2WeightClass;
begin
 case FWeight of
   100 :  Result := wcThin;
   200 :  Result := wcExtraLight;
   300 :  Result := wcLight;
   400 :  Result := wcNormal;
   500 :  Result := wcMedium;
   600 :  Result := wcSemiBold;
   700 :  Result := wcBold;
   800 :  Result := wcExtraBold;
   900 :  Result := wcBlack;
  else Result := wcUnknownWeight;
 end;
end;

function TPascalTypeOS2Table.GetWidthClass: TOS2WidthClass;
begin
 case FWidthType of
   1 : Result := wcUltraCondensed;
   2 : Result := wcExtraCondensed;
   3 : Result := wcCondensed;
   4 : Result := wcSemiCondensed;
   5 : Result := wcMediumNormal;
   6 : Result := wcSemiExpanded;
   7 : Result := wcExpanded;
   8 : Result := wcExtraExpanded;
   9 : Result := wcUltraExpanded;
  else Result := wcUnknownWidth;
 end;
end;

procedure TPascalTypeOS2Table.SetFontVendorID(const Value: TTableType);
begin
 if FFontVendorID <> Value then
  begin
   FFontVendorID := Value;
   FontVendorIDChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFontSelection(const Value: Word);
begin
 if FFontSelection <> Value then
  begin
   FFontSelection := Value;
   FontSelectionChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFontSelectionFlags(
  const Value: TOS2FontSelectionFlags);
begin
 if FontSelectionFlags <> Value then
  begin
   FFontSelection := FontSelectionFlagsToWord(Value);
   FontSelectionChanged
  end;
end;

procedure TPascalTypeOS2Table.SetPanose(
  const Value: TCustomPascalTypePanoseTable);
begin
 FPanose.Assign(Value);
end;

procedure TPascalTypeOS2Table.SetAddendumTable(
  const Value: TPascalTypeOS2AddendumTable);
begin
 if Assigned(FAddendumTable) then
  if Assigned(Value)
   then FAddendumTable.Assign(Value)
   else FreeAndNil(FAddendumTable)
 else
  if Assigned(Value) then
   begin
    FAddendumTable := TPascalTypeOS2AddendumTable.Create;
    FAddendumTable.Assign(Value);
   end;
end;

procedure TPascalTypeOS2Table.SetCodePageRange(
  const Value: TPascalTypeOS2CodePageRangeTable);
begin
 if Assigned(FCodePageRange) then
  if Assigned(Value)
   then FCodePageRange.Assign(Value)
   else FreeAndNil(FCodePageRange)
 else
  if Assigned(Value) then
   begin
    FCodePageRange := TPascalTypeOS2CodePageRangeTable.Create;
    FCodePageRange.Assign(Value);
   end;
end;

procedure TPascalTypeOS2Table.SetFontEmbeddingFlags(const Value: Word);
begin
 if FFontEmbeddingFlags <> Value then
  begin
   FFontEmbeddingFlags := Value;
   FontEmbeddingRightsChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFontEmbeddingRights(const Value: TOS2FontEmbeddingRights);
begin
 if FontEmbeddingRights <> Value then
  begin
   FFontEmbeddingFlags := FontEmbeddingRightsToFlags(Value);
   FontEmbeddingRightsChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFontFamilyClassID(const Value: Byte);
begin
 if FontFamilyClassID <> Value then
  begin
   FFontFamilyType := (FFontFamilyType and $FF) or (Value shl 8);
   FontFamilyChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFontFamilySubClassID(const Value: Byte);
begin
 if FontFamilySubClassID <> Value then
  begin
   FFontFamilyType := (FFontFamilyType and $FF00) or Value;
   FontFamilyChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFontFamilyType(const Value: Word);
begin
 if FFontFamilyType <> Value then
  begin
   FFontFamilyType := Value;
   FontFamilyChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetTypographicAscent(const Value: SmallInt);
begin
 if FTypographicAscent <> Value then
  begin
   FTypographicAscent := Value;
   TypographicAscentChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetTypographicDescent(const Value: SmallInt);
begin
 if FTypographicDescent <> Value then
  begin
   FTypographicDescent := Value;
   TypographicDescentChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetTypographicLineGap(const Value: SmallInt);
begin
 if FTypographicLineGap <> Value then
  begin
   FTypographicLineGap := Value;
   TypographicLineGapChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetUnicodeFirstCharIndex(const Value: Word);
begin
 if FUnicodeFirstCharIndex <> Value then
  begin
   FUnicodeFirstCharIndex := Value;
   UnicodeFirstCharIndexChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetUnicodeLastCharIndex(const Value: Word);
begin
 if FUnicodeLastCharIndex <> Value then
  begin
   FUnicodeLastCharIndex := Value;
   UnicodeLastCharIndexChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetWidthClass(const Value: TOS2WidthClass);
begin
 if Value = wcUnknownWidth
  then Exit;

 if WidthClass <> Value then
  begin
   FWidthType := Word(Value);
   WidthTypeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetWidthType(const Value: Word);
begin
 if FWidthType <> Value then
  begin
   FWidthType := Value;
   WidthTypeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetWindowsAscent(const Value: Word);
begin
 if FWindowsAscent <> Value then
  begin
   FWindowsAscent := Value;
   WindowsAscentChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetWindowsDescent(const Value: Word);
begin
 if FWindowsDescent <> Value then
  begin
   FWindowsDescent := Value;
   WindowsDescentChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetAverageCharacterWidth(const Value: SmallInt);
begin
 if FAverageCharacterWidth <> Value then
  begin
   FAverageCharacterWidth := Value;
   AverageCharacterWidthChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetStrikeoutPosition(const Value: SmallInt);
begin
 if FStrikeoutPosition <> Value then
  begin
   FStrikeoutPosition := Value;
   StrikeoutPositionChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetStrikeoutSize(const Value: SmallInt);
begin
 if FStrikeoutSize <> Value then
  begin
   FStrikeoutSize := Value;
   StrikeoutSizeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSubScriptOffsetX(const Value: SmallInt);
begin
 if FSubScriptOffsetX <> Value then
  begin
   FSubScriptOffsetX := Value;
   SubScriptOffsetXChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSubscriptSizeX(const Value: SmallInt);
begin
 if FSubscriptSizeX <> Value then
  begin
   FSubscriptSizeX := Value;
   SubscriptSizeXChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSubscriptOffsetY(const Value: SmallInt);
begin
 if FSubscriptYOffsetY <> Value then
  begin
   FSubscriptYOffsetY := Value;
   SubscriptOffsetYChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSubscriptSizeY(const Value: SmallInt);
begin
 if FSubscriptSizeY <> Value then
  begin
   FSubscriptSizeY := Value;
   SubscriptSizeYChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSuperscriptOffsetX(const Value: SmallInt);
begin
 if FSuperscriptOffsetX <> Value then
  begin
   FSuperscriptOffsetX := Value;
   SuperscriptOffsetXChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSuperscriptXSizeX(const Value: SmallInt);
begin
 if FSuperscriptSizeX <> Value then
  begin
   FSuperscriptSizeX := Value;
   SuperscriptSizeXChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSuperscriptOffsetY(const Value: SmallInt);
begin
 if FSuperscriptOffsetY <> Value then
  begin
   FSuperscriptOffsetY := Value;
   SuperscriptOffsetYChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSuperscriptYSizeY(const Value: SmallInt);
begin
 if FSuperscriptSizeY <> Value then
  begin
   FSuperscriptSizeY := Value;
   SuperscriptSizeYChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetVersion(const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetWeight(const Value: Word);
begin
 if FWeight <> Value then
  begin
   FWeight := Value;
   WeightChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetWeightClass(const Value: TOS2WeightClass);
begin
 if Value = wcUnknownWeight
  then Exit;

 if WeightClass <> Value then
  begin
   FWeight := Word(Value);
   WeightChanged;
  end;
end;

procedure TPascalTypeOS2Table.FontVendorIDChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.FontSelectionChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.FontEmbeddingRightsChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.FontFamilyChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.TypographicAscentChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.TypographicDescentChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.TypographicLineGapChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.UnicodeFirstCharIndexChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.UnicodeLastCharIndexChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.WeightChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.WidthTypeChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.WindowsAscentChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.WindowsDescentChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.VersionChanged;
begin
 // make sure a code page range objects exists if necessary
 if FVersion > 0 then
  begin
   // create code page range table if it doesn't exists
   if not Assigned(FCodePageRange)
    then FCodePageRange := TPascalTypeOS2CodePageRangeTable.Create;

   if FVersion >= 2 then
    begin
     // create addendum table if it doesn't exists
     if not Assigned(FAddendumTable)
      then FAddendumTable := TPascalTypeOS2AddendumTable.Create;
    end else
   if Assigned(FAddendumTable)
    then FreeAndNil(FAddendumTable);
  end
 else
  begin
   // free code page range if not needed
   if Assigned(FCodePageRange)
    then FreeAndNil(FCodePageRange);

   // free addendum table if not needed
   if Assigned(FAddendumTable)
    then FreeAndNil(FAddendumTable);
  end;

 Changed;
end;

procedure TPascalTypeOS2Table.AverageCharacterWidthChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.StrikeoutPositionChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.StrikeoutSizeChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SubScriptOffsetXChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SubscriptSizeXChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SubscriptOffsetYChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SubscriptSizeYChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SuperscriptOffsetXChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SuperscriptSizeXChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SuperscriptOffsetYChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.SuperscriptSizeYChanged;
begin
 Changed;
end;


{ TPascalTypePostscriptTable }

destructor TPascalTypePostscriptTable.Destroy;
begin
 if Assigned(FPostscriptV2Table)
  then FreeAndNil(FPostscriptV2Table);

 inherited;
end;

class function TPascalTypePostscriptTable.GetTableType: TTableType;
begin
 Result := 'post';
end;

procedure TPascalTypePostscriptTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FItalicAngle := Self.FItalicAngle;
    FUnderlinePosition := Self.FUnderlinePosition;
    FUnderlineThickness := Self.FUnderlineThickness;
    FIsFixedPitch := Self.FIsFixedPitch;
    FMinMemType42 := Self.FMinMemType42;
    FMaxMemType42 := Self.FMaxMemType42;
    FMinMemType1 := Self.FMinMemType1;
    FMaxMemType1 := Self.FMaxMemType1;
    if Assigned(Self.FPostscriptV2Table) then
     begin
      if not Assigned(FPostscriptV2Table)
       then FPostscriptV2Table := TPascalTypePostscriptVersion2Table.Create;
      FPostscriptV2Table.Assign(Self.FPostscriptV2Table);
     end;
   end
 else inherited;
end;

procedure TPascalTypePostscriptTable.ResetToDefaults;
begin
 FVersion.Value := 2;
 FVersion.Fract := 0;
 FItalicAngle.Value := 0;
 FItalicAngle.Fract := 0;
 FUnderlinePosition := 0;
 FUnderlineThickness := 0;
 FIsFixedPitch := 0;
 FMinMemType42 := 0;
 FMaxMemType42 := 0;
 FMinMemType1 := 0;
 FMaxMemType1 := 0;
end;

procedure TPascalTypePostscriptTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 32 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read format type
   Read(Value32, SizeOf(Cardinal));
   FVersion := TFixedPoint(Swap32(Value32));

   // read italic angle
   Read(Value32, SizeOf(Cardinal));
   FItalicAngle := TFixedPoint(Swap32(Value32));

   // read underline position
   FUnderlinePosition := ReadSwappedWord(Stream);

   // read underline thickness
   FUnderlineThickness := ReadSwappedWord(Stream);

   // read is fixed pitch
   Read(Value32, SizeOf(Cardinal));
   FIsFixedPitch := Swap32(Value32);

   // read minimum memory usage (type 42)
   Read(Value32, SizeOf(Cardinal));
   FMinMemType42 := Swap32(Value32);

   // read maximum memory usage (type 42)
   Read(Value32, SizeOf(Cardinal));
   FMaxMemType42 := Swap32(Value32);

   // read minimum memory usage (type 1)
   Read(Value32, SizeOf(Cardinal));
   FMinMemType1 := Swap32(Value32);

   // read maximum memory usage (type 1)
   Read(Value32, SizeOf(Cardinal));
   FMaxMemType1 := Swap32(Value32);

   if FVersion.Value = 2 then
    begin
     if not Assigned(FPostscriptV2Table)
      then FPostscriptV2Table := TPascalTypePostscriptVersion2Table.Create;
     FPostscriptV2Table.LoadFromStream(Stream);
    end;
  end;
end;

procedure TPascalTypePostscriptTable.SaveToStream(Stream: TStream);
begin
 // write format type
 WriteSwappedCardinal(Stream, Cardinal(FVersion));

 // write italic angle
 WriteSwappedCardinal(Stream, Cardinal(FItalicAngle));

 // write underline position
 WriteSwappedWord(Stream, FUnderlinePosition);

 // write underline thickness
 WriteSwappedWord(Stream, FUnderlineThickness);

 // write is fixed pitch
 WriteSwappedCardinal(Stream, FIsFixedPitch);

 // write minimum memory usage (type 42)
 WriteSwappedCardinal(Stream, FMinMemType42);

 // write maximum memory usage (type 42)
 WriteSwappedCardinal(Stream, FMaxMemType42);

 // write minimum memory usage (type 1)
 WriteSwappedCardinal(Stream, FMinMemType1);

 // write maximum memory usage (type 1)
 WriteSwappedCardinal(Stream, FMaxMemType1);
end;

procedure TPascalTypePostscriptTable.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Value <> Value.Value) or
    (FVersion.Fract <> Value.Fract) then
  begin
   Version := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypePostscriptTable.SetIsFixedPitch(const Value: LongInt);
begin
 if FIsFixedPitch <> Value then
  begin
   FIsFixedPitch := Value;
   IsFixedPitchChanged;
  end;
end;

procedure TPascalTypePostscriptTable.SetItalicAngle(const Value: TFixedPoint);
begin
 if (FItalicAngle.Value <> Value.Value) or
    (FItalicAngle.Fract <> Value.Fract) then
  begin
   FItalicAngle := Value;
   ItalicAngleChanged;
  end;
end;

procedure TPascalTypePostscriptTable.SetMaxMemType1(const Value: LongInt);
begin
 if FMaxMemType1 <> Value then
  begin
   FMaxMemType1 := Value;
   MaxMemType1Changed;
  end;
end;

procedure TPascalTypePostscriptTable.SetMaxMemType42(const Value: LongInt);
begin
 if FMaxMemType42 <> Value then
  begin
   FMaxMemType42 := Value;
   MaxMemType42Changed;
  end;
end;

procedure TPascalTypePostscriptTable.SetMinMemType1(const Value: LongInt);
begin
 if FMinMemType1 <> Value then
  begin
   FMinMemType1 := Value;
   MinMemType1Changed;
  end;
end;

procedure TPascalTypePostscriptTable.SetMinMemType42(const Value: LongInt);
begin
 if FMinMemType42 <> Value then
  begin
   FMinMemType42 := Value;
   MinMemType42Changed;
  end;
end;

procedure TPascalTypePostscriptTable.SetUnderlinePosition(
  const Value: SmallInt);
begin
 if FUnderlinePosition <> Value then
  begin
   FUnderlinePosition := Value;
   UnderlinePositionChanged;
  end;
end;

procedure TPascalTypePostscriptTable.SetUnderlineThickness(
  const Value: SmallInt);
begin
 if FUnderlineThickness <> Value then
  begin
   FUnderlineThickness := Value;
   UnderlineThicknessChanged;
  end;
end;

procedure TPascalTypePostscriptTable.VersionChanged;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.IsFixedPitchChanged;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.ItalicAngleChanged;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.MaxMemType1Changed;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.MaxMemType42Changed;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.MinMemType1Changed;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.MinMemType42Changed;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.UnderlinePositionChanged;
begin
 Changed;
end;

procedure TPascalTypePostscriptTable.UnderlineThicknessChanged;
begin
 Changed;
end;


{ TPascalTypePostscriptVersion2Table }

constructor TPascalTypePostscriptVersion2Table.Create;
begin
 inherited;
end;

destructor TPascalTypePostscriptVersion2Table.Destroy;
begin
 inherited;
end;

function TPascalTypePostscriptVersion2Table.GetGlyphIndexCount: Integer;
begin
 Result := Length(FGlyphNameIndex);
end;

function TPascalTypePostscriptVersion2Table.GlyphIndexToString(
  GlyphIndex: Integer): string;
begin
 if FGlyphNameIndex[GlyphIndex] < 258
  then Result := DefaultGlyphName(FGlyphNameIndex[GlyphIndex])
  else Result := FNames[FGlyphNameIndex[GlyphIndex] - 258];
end;

procedure TPascalTypePostscriptVersion2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptVersion2Table(Dest) do
   begin
    FGlyphNameIndex := Self.FGlyphNameIndex;
    FNames := Self.FNames;
   end else inherited;
end;

procedure TPascalTypePostscriptVersion2Table.ResetToDefaults;
begin
 SetLength(FGlyphNameIndex, 0);
 SetLength(FNames, 0);
end;

procedure TPascalTypePostscriptVersion2Table.LoadFromStream(Stream: TStream);
var
  GlyphIndex : Integer;
  Value8     : Byte;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // load number of glyphs
   SetLength(FGlyphNameIndex, ReadSwappedWord(Stream));

   // read glyph name index array
   for GlyphIndex := 0 to Length(FGlyphNameIndex) - 1
    do FGlyphNameIndex[GlyphIndex] := ReadSwappedWord(Stream);

   while Position < Size do
    begin
     Read(Value8, SizeOf(Byte));
     SetLength(FNames, Length(FNames) + 1);
     SetLength(FNames[Length(FNames) - 1], Value8);
     Read(FNames[Length(FNames) - 1][1], Value8);
    end;
  end;
end;

procedure TPascalTypePostscriptVersion2Table.SaveToStream(Stream: TStream);
begin
 raise EPascalTypeError.Create(RCStrNotImplemented);
end;


////////////////////////////////////////////////////////////////////////////////

function IsPascalTypePanoseRegistered(PanoseClass: TCustomPascalTypePanoseClass): Boolean;
var
  PanoseClassIndex : Integer;
begin
 Result := False;
 for PanoseClassIndex := 0 to Length(GPanoseClasses) - 1 do
  if GPanoseClasses[PanoseClassIndex] = PanoseClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterPascalTypePanose(PanoseClass: TCustomPascalTypePanoseClass);
begin
 Assert(IsPascalTypePanoseRegistered(PanoseClass) = False);
 SetLength(GPanoseClasses, Length(GPanoseClasses) + 1);
 GPanoseClasses[Length(GPanoseClasses) - 1] := PanoseClass;
end;

procedure RegisterPascalTypePanoses(PanoseClasses: array of TCustomPascalTypePanoseClass);
var
  PanoseClassIndex : Integer;
begin
 for PanoseClassIndex := 0 to Length(PanoseClasses) - 1
  do RegisterPascalTypePanose(PanoseClasses[PanoseClassIndex]);
end;

function FindPascalTypePanoseByType(PanoseType: Byte): TCustomPascalTypePanoseClass;
var
  PanoseClassIndex : Integer;
begin
 Result := nil;
 for PanoseClassIndex := 0 to Length(GPanoseClasses) - 1 do
  if GPanoseClasses[PanoseClassIndex].GetFamilyType = PanoseType then
   begin
    Result := GPanoseClasses[PanoseClassIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown Table Class: ' + TableType);
end;


////////////////////////////////////////////////////////////////////////////////

function IsPascalTypeTableRegistered(TableClass: TCustomPascalTypeNamedTableClass): Boolean;
var
  TableClassIndex : Integer;
begin
 Result := False;
 for TableClassIndex := 0 to Length(GTableClasses) - 1 do
  if GTableClasses[TableClassIndex] = TableClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterPascalTypeTable(TableClass: TCustomPascalTypeNamedTableClass);
begin
 Assert(IsPascalTypeTableRegistered(TableClass) = False);
 SetLength(GTableClasses, Length(GTableClasses) + 1);
 GTableClasses[Length(GTableClasses) - 1] := TableClass;
end;

procedure RegisterPascalTypeTables(TableClasses: array of TCustomPascalTypeNamedTableClass);
var
  TableClassIndex : Integer;
begin
 for TableClassIndex := 0 to Length(TableClasses) - 1
  do RegisterPascalTypeTable(TableClasses[TableClassIndex]);
end;

function FindPascalTypeTableByType(TableType: TTableType): TCustomPascalTypeNamedTableClass;
var
  TableClassIndex : Integer;
begin
 Result := nil;
 for TableClassIndex := 0 to Length(GTableClasses) - 1 do
  if GTableClasses[TableClassIndex].GetTableType = TableType then
   begin
    Result := GTableClasses[TableClassIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown Table Class: ' + TableType);
end;


initialization
  RegisterPascalTypeTables([TPascalTypeHeaderTable,
    TPascalTypeCharacterMapTable, TPascalTypeHorizontalHeaderTable,
    TPascalTypeHorizontalMetricsTable, TPascalTypeNameTable,
    TPascalTypeMaximumProfileTable, TPascalTypePostscriptTable,
    TPascalTypeOS2Table]);

end.
