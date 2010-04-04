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

  TCustomPascalTypeNamedTable = class(TCustomPascalTypeInterfaceTable)
  public
    class function GetTableType: TTableType; virtual; abstract;
    property TableType: TTableType read GetTableType;
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

  TCustomTrueTypeFontCharacterMap = class(TCustomPascalTypeTable)
  protected
    function GetFormat: Word; virtual; abstract;
  public
    function CharacterToGlyph(CharacterIndex: Integer): Integer; virtual; abstract;

    property Format: Word read GetFormat;
  end;

  TTrueTypeFontFormat0CharacterMap = class(TCustomTrueTypeFontCharacterMap)
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

  TTrueTypeFontFormat2CharacterMap = class(TCustomTrueTypeFontCharacterMap)
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

  TTrueTypeFontFormat4CharacterMap = class(TCustomTrueTypeFontCharacterMap)
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

  TTrueTypeFontFormat6CharacterMap = class(TCustomTrueTypeFontCharacterMap)
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

  TTrueTypeFontFormat12CharacterMap = class(TCustomTrueTypeFontCharacterMap)
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

  TCustomCharacterMapDirectoryEntry = class(TCustomPascalTypeTable)
  private
    FCharacterMap : TCustomTrueTypeFontCharacterMap;
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
    property CharacterMap: TCustomTrueTypeFontCharacterMap read FCharacterMap;
  end;

  TUnicodeCharacterMapDirectoryEntry = class(TCustomCharacterMapDirectoryEntry)
  private
    procedure SetEncodingID(const Value: TUnicodeEncodingID);
    function GetEncodingID: TUnicodeEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID: TUnicodeEncodingID read GetEncodingID write SetEncodingID;
  end;

  TMacintoshCharacterMapDirectoryEntry = class(TCustomCharacterMapDirectoryEntry)
  private
    procedure SetEncodingID(const Value: TAppleEncodingID);
    function GetEncodingID: TAppleEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID: TAppleEncodingID read GetEncodingID write SetEncodingID;
  end;

  TMicrosoftCharacterMapDirectoryEntry = class(TCustomCharacterMapDirectoryEntry)
  private
    procedure SetEncodingID(const Value: TMicrosoftEncodingID);
    function GetEncodingID: TMicrosoftEncodingID;
  protected
    function GetPlatformID: TPlatformID; override;
  public
    property PlatformSpecificID: TMicrosoftEncodingID read GetEncodingID write SetEncodingID;
  end;

  TGenericCharacterMapDirectoryEntry = class(TCustomCharacterMapDirectoryEntry)
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
    function GetCharacterMapSubtable(Index: Integer): TCustomCharacterMapDirectoryEntry;
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
    property CharacterMapSubtable[Index : Integer]: TCustomCharacterMapDirectoryEntry read GetCharacterMapSubtable;
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

  TOS2TableAddendum1 = packed record
    UlCodePageRange1    : Cardinal;
    UlCodePageRange2    : Cardinal;
  end;

  TOS2TableAddendum2 = packed record
    sxHeight            : SmallInt;
    sCapHeight          : SmallInt;
    usDefaultChar       : Word;
    usBreakChar         : Word;
    usMaxContext        : Word;
  end;

  TCustomPascalTypePanoseTable = class(TCustomPascalTypeTable)
  protected
    FData : array [0..8] of Byte;

    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    class function GetFamilyType: Byte; virtual; abstract;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property FamilyType: Byte read GetFamilyType;
  end;
  TCustomPascalTypePanoseClass = class of TCustomPascalTypePanoseTable;

  TPascalTypeDefaultPanoseTable = class(TCustomPascalTypePanoseTable)
  private
    FFamilyType : Byte;
    function GetData(Index: Byte): Byte;
    procedure SetData(Index: Byte; const Value: Byte);
  protected
    class function GetFamilyType: Byte; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Data[Index: Byte]: Byte read GetData write SetData;
    property FamilyType: Byte read FFamilyType;
  end;

  TPascalTypeOS2Table = class(TCustomPascalTypeNamedTable)
  private
    FVersion             : Word;                     // table version number (set to 0)
    FXAvgCharWidth       : SmallInt;                 // average weighted advance width of lower case letters and space
    FWeight              : Word;                     // visual weight (degree of blackness or thickness) of stroke in glyphs
    FWidthType           : Word;                     // relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in the font
    FFontEmbeddingFlags  : Word;                     // characteristics and properties of this font (set undefined bits to zero)
    FYSubscriptXSize     : SmallInt;                 // recommended horizontal size in pixels for subscripts
    FYSubscriptYSize     : SmallInt;                 // recommended vertical size in pixels for subscripts
    FYSubScriptXOffset   : SmallInt;                 // recommended horizontal offset for subscripts
    FYSubscriptYOffset   : SmallInt;                 // recommended vertical offset form the baseline for subscripts
    FYSuperscriptXSize   : SmallInt;                 // recommended horizontal size in pixels for superscripts
    FYSuperscriptYSize   : SmallInt;                 // recommended vertical size in pixels for superscripts
    FYSuperscriptXOffset : SmallInt;                 // recommended horizontal offset for superscripts
    FYSuperscriptYOffset : SmallInt;                 // recommended vertical offset from the baseline for superscripts
    FYStrikeoutSize      : SmallInt;                 // width of the strikeout stroke
    FYStrikeoutPosition  : SmallInt;                 // position of the strikeout stroke relative to the baseline
    FFontFamilyType      : Word;                     // classification of font-family design.
    FUlUnicodeRange      : array [0..3] of Cardinal; // Field is split into two bit fields of 96 and 36 bits each. The low 96 bits are used to specify the Unicode blocks encompassed by the font file. The high 32 bits are used to specify the character or script sets covered by the font file. Bit assignments are pending. Set to 01
    FAchVendID           : TTableType;               // four character identifier for the font vendor
    FFsSelection         : Word;                     // 2-byte bit field containing information concerning the nature of the font patterns
    FUsFirstCharIndex    : Word;                     // The minimum Unicode index in this font.
    FUsLastCharIndex     : Word;                     // The maximum Unicode index in this font.
    FSTypoAscender       : SmallInt;
    FSTypoDescender      : SmallInt;
    FSTypoLineGap        : SmallInt;
    FUsWinAscent         : Word;
    FUsWinDescent        : Word;

    FPanose              : TCustomPascalTypePanoseTable;
    function GetWeightClass: TOS2WeightClass;
    function GetWidthClass: TOS2WidthClass;
    function GetFontEmbeddingRights: TOS2FontEmbeddingRights;
    procedure SetAchVendID(const Value: TTableType);
    procedure SetFsSelection(const Value: Word);
    procedure SetFontEmbeddingFlags(const Value: Word);
    procedure SetFontEmbeddingRights(const Value: TOS2FontEmbeddingRights);
    procedure SetFontFamilyType(const Value: Word);
    procedure SetSTypoAscender(const Value: SmallInt);
    procedure SetSTypoDescender(const Value: SmallInt);
    procedure SetSTypoLineGap(const Value: SmallInt);
    procedure SetUsFirstCharIndex(const Value: Word);
    procedure SetUsLastCharIndex(const Value: Word);
    procedure SetUsWinAscent(const Value: Word);
    procedure SetUsWinDescent(const Value: Word);
    procedure SetVersion(const Value: Word);
    procedure SetWeight(const Value: Word);
    procedure SetWeightClass(const Value: TOS2WeightClass);
    procedure SetWidthClass(const Value: TOS2WidthClass);
    procedure SetWidthType(const Value: Word);
    procedure SetXAvgCharWidth(const Value: SmallInt);
    procedure SetYStrikeoutPosition(const Value: SmallInt);
    procedure SetYStrikeoutSize(const Value: SmallInt);
    procedure SetYSubScriptXOffset(const Value: SmallInt);
    procedure SetYSubscriptXSize(const Value: SmallInt);
    procedure SetYSubscriptYOffset(const Value: SmallInt);
    procedure SetYSubscriptYSize(const Value: SmallInt);
    procedure SetYSuperscriptXOffset(const Value: SmallInt);
    procedure SetYSuperscriptXSize(const Value: SmallInt);
    procedure SetYSuperscriptYOffset(const Value: SmallInt);
    procedure SetYSuperscriptYSize(const Value: SmallInt);
    function GetFontFamilyClassID: Byte;
    function GetFontFamilySubClassID: Byte;
    procedure SetFontFamilyClassID(const Value: Byte);
    procedure SetFontFamilySubClassID(const Value: Byte);
    procedure SetPanose(const Value: TCustomPascalTypePanoseTable);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure AchVendIDChanged; virtual;
    procedure FsSelectionChanged; virtual;
    procedure FontEmbeddingRightsChanged; virtual;
    procedure FontFamilyChanged; virtual;
    procedure STypoAscenderChanged; virtual;
    procedure STypoDescenderChanged; virtual;
    procedure STypoLineGapChanged; virtual;
    procedure UsFirstCharIndexChanged; virtual;
    procedure UsLastCharIndexChanged; virtual;
    procedure UsWinAscentChanged; virtual;
    procedure UsWinDescentChanged; virtual;
    procedure VersionChanged; virtual;
    procedure WeightChanged; virtual;
    procedure WidthTypeChanged; virtual;
    procedure XAvgCharWidthChanged; virtual;
    procedure YStrikeoutPositionChanged; virtual;
    procedure YStrikeoutSizeChanged; virtual;
    procedure YSubScriptXOffsetChanged; virtual;
    procedure YSubscriptXSizeChanged; virtual;
    procedure YSubscriptYOffsetChanged; virtual;
    procedure YSubscriptYSizeChanged; virtual;
    procedure YSuperscriptXOffsetChanged; virtual;
    procedure YSuperscriptXSizeChanged; virtual;
    procedure YSuperscriptYOffsetChanged; virtual;
    procedure YSuperscriptYSizeChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property XAvgCharWidth: SmallInt read FXAvgCharWidth write SetXAvgCharWidth;
    property Weight: Word read FWeight write SetWeight;
    property WeightClass: TOS2WeightClass read GetWeightClass write SetWeightClass;
    property WidthType: Word read FWidthType write SetWidthType;
    property WidthClass: TOS2WidthClass read GetWidthClass write SetWidthClass;
    property FontEmbeddingFlags: Word read FFontEmbeddingFlags write SetFontEmbeddingFlags;
    property FontEmbeddingRights: TOS2FontEmbeddingRights read GetFontEmbeddingRights write SetFontEmbeddingRights;
    property YSubscriptXSize: SmallInt read FYSubscriptXSize write SetYSubscriptXSize;
    property YSubscriptYSize: SmallInt read FYSubscriptYSize write SetYSubscriptYSize;
    property YSubScriptXOffset: SmallInt read FYSubScriptXOffset write SetYSubScriptXOffset;
    property YSubscriptYOffset: SmallInt read FYSubscriptYOffset write SetYSubscriptYOffset;
    property YSuperscriptXSize: SmallInt read FYSuperscriptXSize write SetYSuperscriptXSize;
    property YSuperscriptYSize: SmallInt read FYSuperscriptYSize write SetYSuperscriptYSize;
    property YSuperscriptXOffset: SmallInt read FYSuperscriptXOffset write SetYSuperscriptXOffset;
    property YSuperscriptYOffset: SmallInt read FYSuperscriptYOffset write SetYSuperscriptYOffset;
    property YStrikeoutSize: SmallInt read FYStrikeoutSize write SetYStrikeoutSize;
    property YStrikeoutPosition: SmallInt read FYStrikeoutPosition write SetYStrikeoutPosition;
    property FontFamilyType: Word read FFontFamilyType write SetFontFamilyType;
    property FontFamilyClassID: Byte read GetFontFamilyClassID write SetFontFamilyClassID;
    property FontFamilySubClassID: Byte read GetFontFamilySubClassID write SetFontFamilySubClassID;
    property Panose: TCustomPascalTypePanoseTable read FPanose write SetPanose;
    property AchVendID: TTableType read FAchVendID write SetAchVendID;
    property FsSelection: Word read FFsSelection write SetFsSelection;
    property UsFirstCharIndex: Word read FUsFirstCharIndex write SetUsFirstCharIndex;
    property UsLastCharIndex: Word read FUsLastCharIndex write SetUsLastCharIndex;
    property STypoAscender: SmallInt read FSTypoAscender write SetSTypoAscender;
    property STypoDescender: SmallInt read FSTypoDescender write SetSTypoDescender;
    property STypoLineGap: SmallInt read FSTypoLineGap write SetSTypoLineGap;
    property UsWinAscent: Word read FUsWinAscent write SetUsWinAscent;
    property UsWinDescent: Word read FUsWinDescent write SetUsWinDescent;
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
 TTwoWords(Result)[0] := Swap(TTwoWords(Value)[1]);;
end;

function Swap64(Value: Int64): Int64;
type
  TFourWords = array [0..3] of Word;
begin
 TFourWords(Result)[3] := Swap(TFourWords(Value)[0]);
 TFourWords(Result)[2] := Swap(TFourWords(Value)[1]);;
 TFourWords(Result)[1] := Swap(TFourWords(Value)[2]);
 TFourWords(Result)[0] := Swap(TFourWords(Value)[3]);;
end;

function ReadSwappedWord(Stream: TStream): Word;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Word)) <> SizeOf(Word)
  then raise EPascalTypeError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Word));
 {$ENDIF}
 Result := Swap16(Result);
end;

function ReadSwappedSmallInt(Stream: TStream): SmallInt;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(SmallInt)) <> SizeOf(SmallInt)
  then raise EPascalTypeError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(SmallInt));
 {$ENDIF}
 Result := Swap16(Result);
end;

function ReadSwappedCardinal(Stream: TStream): Cardinal;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Cardinal)) <> SizeOf(Cardinal)
  then raise EPascalTypeError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Cardinal));
 {$ENDIF}
 Result := Swap32(Result);
end;

function ReadSwappedInt64(Stream: TStream): Int64;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Int64)) <> SizeOf(Int64)
  then raise EPascalTypeError.Create(RCStrStreamReadError);
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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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


{ TTrueTypeFontFormat0CharacterMap }

function TTrueTypeFontFormat0CharacterMap.GetFormat: Word;
begin
 Result := 0;
end;

procedure TTrueTypeFontFormat0CharacterMap.ResetToDefaults;
var
  GlyphIdIndex : Byte;
begin
 FLength   := 0;
 FLanguage := 0;
 for GlyphIdIndex := Low(Byte) to High(Byte)
  do FGlyphIdArray[GlyphIdIndex] := GlyphIdIndex;
end;

procedure TTrueTypeFontFormat0CharacterMap.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read length
   FLength := ReadSwappedWord(Stream);

   // read language
   FLanguage := ReadSwappedWord(Stream);

   Read(FGlyphIdArray[0], 256);
  end;
end;

procedure TTrueTypeFontFormat0CharacterMap.SaveToStream(Stream: TStream);
begin
 // write length
 WriteSwappedWord(Stream, FLength);

 // write language
 WriteSwappedWord(Stream, FLanguage);
end;

function TTrueTypeFontFormat0CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 if CharacterIndex in [0..255]
  then Result := FGlyphIdArray[CharacterIndex]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [CharacterIndex]);
end;


{ TTrueTypeFontFormat2CharacterMap }

function TTrueTypeFontFormat2CharacterMap.GetFormat: Word;
begin
 Result := 2;
end;

procedure TTrueTypeFontFormat2CharacterMap.ResetToDefaults;
begin
 FLength   := 0;
 FLanguage := 0;
end;

function TTrueTypeFontFormat2CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 Result := CharacterIndex;
end;

procedure TTrueTypeFontFormat2CharacterMap.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read length
   FLength := ReadSwappedWord(Stream);

   // read language
   FLanguage := ReadSwappedWord(Stream);
  end;
end;

procedure TTrueTypeFontFormat2CharacterMap.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   // write length
   WriteSwappedWord(Stream, FLength);

   // write language
   WriteSwappedWord(Stream, FLanguage);
  end;
end;


{ TTrueTypeFontFormat4CharacterMap }

function TTrueTypeFontFormat4CharacterMap.GetFormat: Word;
begin
 Result := 4;
end;

procedure TTrueTypeFontFormat4CharacterMap.ResetToDefaults;
begin
 FLength   := 0;
 FLanguage := 0;
end;

function TTrueTypeFontFormat4CharacterMap.CharacterToGlyph(
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

procedure TTrueTypeFontFormat4CharacterMap.LoadFromStream(Stream: TStream);
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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read length
   FLength := ReadSwappedWord(Stream);

   // check (minimum) table size
   if StartPos + FLength - 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read language
   FLanguage := ReadSwappedWord(Stream);

   // read segCountX2
   FSegCountX2 := ReadSwappedWord(Stream);

   // read search range
   FSearchRange := ReadSwappedWord(Stream);

   // confirm search range has a valid value
   if FSearchRange <> 2 * (Power(2, Floor(Log2(0.5 * FSegCountX2))))
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

procedure TTrueTypeFontFormat4CharacterMap.SaveToStream(Stream: TStream);
begin
 // write length
 WriteSwappedWord(Stream, FLength);

 // write language
 WriteSwappedWord(Stream, FLanguage);
end;


{ TTrueTypeFontFormat6CharacterMap }

function TTrueTypeFontFormat6CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 Result := 0;
 if CharacterIndex >= FFirstCode then
  if CharacterIndex < FFirstCode + Length(FGlyphIdArray)
   then Result := FGlyphIdArray[CharacterIndex - FFirstCode];
end;

function TTrueTypeFontFormat6CharacterMap.GetEntryCount: Word;
begin
 Result := Length(FGlyphIdArray);
end;

function TTrueTypeFontFormat6CharacterMap.GetFormat: Word;
begin
 Result := 6
end;

procedure TTrueTypeFontFormat6CharacterMap.ResetToDefaults;
begin
 FLanguage := 0;
 FFirstCode := 0;
 SetLength(FGlyphIdArray, 0);
end;

procedure TTrueTypeFontFormat6CharacterMap.LoadFromStream(Stream: TStream);
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

procedure TTrueTypeFontFormat6CharacterMap.SaveToStream(Stream: TStream);
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


{ TTrueTypeFontFormat12CharacterMap }

function TTrueTypeFontFormat12CharacterMap.CharacterToGlyph(
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

function TTrueTypeFontFormat12CharacterMap.GetFormat: Word;
begin
 Result := 12;
end;

procedure TTrueTypeFontFormat12CharacterMap.ResetToDefaults;
begin
 FLanguage := 0;
 SetLength(FCoverageArray, 0);
end;

procedure TTrueTypeFontFormat12CharacterMap.LoadFromStream(Stream: TStream);
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

procedure TTrueTypeFontFormat12CharacterMap.SaveToStream(Stream: TStream);
begin
 raise EPascalTypeError.Create(RCStrNotImplemented);
end;


{ TCustomCharacterMapDirectoryEntry }

constructor TCustomCharacterMapDirectoryEntry.Create(EncodingID: Word);
begin
 FEncodingID := EncodingID;
 inherited Create;
end;

destructor TCustomCharacterMapDirectoryEntry.Destroy;
begin
 if Assigned(FCharacterMap)
  then FreeAndNil(FCharacterMap);

 inherited;
end;

procedure TCustomCharacterMapDirectoryEntry.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomCharacterMapDirectoryEntry(Dest) do
   begin
    FEncodingID := Self.FEncodingID;
    FCharacterMap.Assign(Self.FCharacterMap);
   end else inherited;
end;

procedure TCustomCharacterMapDirectoryEntry.ResetToDefaults;
begin
 if Assigned(FCharacterMap)
  then FreeAndNil(FCharacterMap);

 FEncodingID := 0;
end;

procedure TCustomCharacterMapDirectoryEntry.EncodingIDChanged;
begin
 Changed;
end;

function TCustomCharacterMapDirectoryEntry.GetEncodingIDAsWord: Word;
begin
 Result := FEncodingID;
end;

function TCustomCharacterMapDirectoryEntry.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 if Assigned(FCharacterMap)
  then Result := FCharacterMap.CharacterToGlyph(CharacterIndex)
  else raise Exception.Create('Character map not set properly!');
end;

procedure TCustomCharacterMapDirectoryEntry.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
  OldMap  : TCustomTrueTypeFontCharacterMap;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read format
   Value16 := ReadSwappedWord(Stream);
   case Value16 of
     0 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TTrueTypeFontFormat0CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
     2 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TTrueTypeFontFormat2CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
     4 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TTrueTypeFontFormat4CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
     6 : begin
          OldMap := FCharacterMap;
          FCharacterMap := TTrueTypeFontFormat6CharacterMap.Create;
          if Assigned(OldMap)
           then FreeAndNil(OldMap);
         end;
    12 : begin
         OldMap := FCharacterMap;
         FCharacterMap := TTrueTypeFontFormat12CharacterMap.Create;
         if Assigned(OldMap)
          then FreeAndNil(OldMap);
        end;
    else raise EPascalTypeError.CreateFmt('Unknown character map (%d)', [Value16]);
   end;

   if Assigned(FCharacterMap)
    then FCharacterMap.LoadFromStream(Stream);
  end;
end;

procedure TCustomCharacterMapDirectoryEntry.SaveToStream(Stream: TStream);
begin
 if Assigned(FCharacterMap)
  then FCharacterMap.SaveToStream(Stream);
end;

procedure TCustomCharacterMapDirectoryEntry.SetEncodingIDAsWord(
  const Value: Word);
begin
 if Value <> FEncodingID then
  begin
   FEncodingID := Value;
   EncodingIDChanged;
  end;
end;


{ TGenericCharacterMapDirectoryEntry }

function TGenericCharacterMapDirectoryEntry.GetPlatformID: TPlatformID;
begin
 Result := piCustom;
end;


{ TUnicodeCharacterMapDirectoryEntry }

function TUnicodeCharacterMapDirectoryEntry.GetEncodingID: TUnicodeEncodingID;
begin
 Result := TUnicodeEncodingID(FEncodingID);
end;

function TUnicodeCharacterMapDirectoryEntry.GetPlatformID: TPlatformID;
begin
 Result := piUnicode;
end;

procedure TUnicodeCharacterMapDirectoryEntry.SetEncodingID(
  const Value: TUnicodeEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TMacintoshCharacterMapDirectoryEntry }

function TMacintoshCharacterMapDirectoryEntry.GetEncodingID: TAppleEncodingID;
begin
 Result := TAppleEncodingID(FEncodingID);
end;

function TMacintoshCharacterMapDirectoryEntry.GetPlatformID: TPlatformID;
begin
 Result := piApple;
end;

procedure TMacintoshCharacterMapDirectoryEntry.SetEncodingID(
  const Value: TAppleEncodingID);
begin
 SetEncodingIDAsWord(Word(Value));
end;


{ TMicrosoftCharacterMapDirectoryEntry }

function TMicrosoftCharacterMapDirectoryEntry.GetEncodingID: TMicrosoftEncodingID;
begin
 Result := TMicrosoftEncodingID(FEncodingID);
end;

function TMicrosoftCharacterMapDirectoryEntry.GetPlatformID: TPlatformID;
begin
 Result := piMicrosoft;
end;

procedure TMicrosoftCharacterMapDirectoryEntry.SetEncodingID(
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
  Index: Integer): TCustomCharacterMapDirectoryEntry;
begin
 if (Index >= 0) and (Index < FSubtableList.Count)
  then Result := TCustomCharacterMapDirectoryEntry(FSubtableList[Index])
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
  CharMapDirEntry : TCustomCharacterMapDirectoryEntry;
  Value32         : Cardinal;
  PlatformID      : Word;
  EncodingID      : Word;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
       0 : CharMapDirEntry := TUnicodeCharacterMapDirectoryEntry.Create(EncodingID);
       1 : CharMapDirEntry := TMacintoshCharacterMapDirectoryEntry.Create(EncodingID);
       3 : CharMapDirEntry := TMicrosoftCharacterMapDirectoryEntry.Create(EncodingID);
      else CharMapDirEntry := TGenericCharacterMapDirectoryEntry.Create(EncodingID);
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
    with TCustomCharacterMapDirectoryEntry(FSubtableList[DirIndex]) do
     begin
      Directory[DirIndex] := Cardinal(Position - StartPos);
      SaveToStream(Stream);
     end;

   // locate directory
   Position := StartPos + 4;

   for DirIndex := 0 to FSubtableList.Count - 1 do
    with TCustomCharacterMapDirectoryEntry(FSubtableList[DirIndex]) do
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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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

procedure TPascalTypeHorizontalMetricsTable.LoadFromStream(Stream: TStream);
var
  HorHead  : TPascalTypeHorizontalHeaderTable;
  MaxProf  : TPascalTypeMaximumProfileTable;
  MtxIndex : Integer;
begin
 inherited;

 HorHead := TPascalTypeHorizontalHeaderTable(FInterpreter.GetTableByTableClass(TPascalTypeHorizontalHeaderTable));
 MaxProf := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableClass(TPascalTypeMaximumProfileTable));

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

procedure TPascalTypeHorizontalMetricsTable.ResetToDefaults;
begin
 SetLength(FHorizontalMetrics, 1);
end;

procedure TPascalTypeHorizontalMetricsTable.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   Write(FHorizontalMetrics[0], Length(FHorizontalMetrics) * SizeOf(THorizontalMetric));
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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
 with Stream do
  begin
//   Write(FNameTableHeader, SizeOf(TNameTableHeader));
  end;
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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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

function TPascalTypeDefaultPanoseTable.GetData(Index: Byte): Byte;
begin
 if Index in [0..8]
  then Result := FData[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

procedure TPascalTypeDefaultPanoseTable.SetData(Index: Byte; const Value: Byte);
begin
 if Index in [0..8]
  then FData[Index] := Value
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
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


{ TPascalTypeOS2Table }

constructor TPascalTypeOS2Table.Create(Interpreter: IPascalTypeInterpreter);
begin
 FPanose := TPascalTypeDefaultPanoseTable.Create;
 inherited;
end;

destructor TPascalTypeOS2Table.Destroy;
begin
 FreeAndNil(FPanose);
 inherited;
end;

procedure TPascalTypeOS2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeNameTable(Dest) do
   begin
    FVersion             := Self.FVersion;
    FXAvgCharWidth       := Self.FXAvgCharWidth;
    FWeight              := Self.FWeight;
    FWidthType           := Self.FWidthType;
    FFontEmbeddingFlags := Self.FFontEmbeddingFlags;
    FYSubscriptXSize     := Self.FYSubscriptXSize;
    FYSubscriptYSize     := Self.FYSubscriptYSize;
    FYSubScriptXOffset   := Self.FYSubScriptXOffset;
    FYSubscriptYOffset   := Self.FYSubscriptYOffset;
    FYSuperscriptXSize   := Self.FYSuperscriptXSize;
    FYSuperscriptYSize   := Self.FYSuperscriptYSize;
    FYSuperscriptXOffset := Self.FYSuperscriptXOffset;
    FYSuperscriptYOffset := Self.FYSuperscriptYOffset;
    FYStrikeoutSize      := Self.FYStrikeoutSize;
    FYStrikeoutPosition  := Self.FYStrikeoutPosition;
    FFontFamilyType      := Self.FFontFamilyType;
    FUlUnicodeRange      := Self.FUlUnicodeRange;
    FAchVendID           := Self.FAchVendID;
    FFsSelection         := Self.FFsSelection;
    FUsFirstCharIndex    := Self.FUsFirstCharIndex;
    FUsLastCharIndex     := Self.FUsLastCharIndex;
    FSTypoAscender       := Self.FSTypoAscender;
    FSTypoDescender      := Self.FSTypoDescender;
    FSTypoLineGap        := Self.FSTypoLineGap;
    FUsWinAscent         := Self.FUsWinAscent;
    FUsWinDescent        := Self.FUsWinDescent;
    FPanose.Assign(Self.FPanose);
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

class function TPascalTypeOS2Table.GetTableType: TTableType;
begin
 Result := 'OS/2';
end;

procedure TPascalTypeOS2Table.ResetToDefaults;
begin
 FVersion := 0;
 FXAvgCharWidth := 0;
 FWeight := 400;
 FWidthType := 5;
 FFontEmbeddingFlags := 0;
 FYSubscriptXSize := 0;
 FYSubscriptYSize := 0;
 FYSubScriptXOffset := 0;
 FYSubscriptYOffset := 0;
 FYSuperscriptXSize := 0;
 FYSuperscriptYSize := 0;
 FYSuperscriptXOffset := 0;
 FYSuperscriptYOffset := 0;
 FYStrikeoutSize := 0;
 FYStrikeoutPosition := 0;
 FFontFamilyType := 0;
 FillChar(FUlUnicodeRange, 4, 0);
 FAchVendID := #0#0#0#0;
 FFsSelection := 0;
 FUsFirstCharIndex := 0;
 FUsLastCharIndex := 0;
 FSTypoAscender := 0;
 FSTypoDescender := 0;
 FSTypoLineGap := 0;
 FUsWinAscent := 0;
 FUsWinDescent := 0;

 // reset panose
 if not (FPanose is TPascalTypeDefaultPanoseTable) then
  begin
   // free other panose object
   FreeAndNil(FPanose);

   // create new default panose object
   FPanose := TPascalTypeDefaultPanoseTable.Create;
  end else FPanose.ResetToDefaults;

end;

procedure TPascalTypeOS2Table.LoadFromStream(Stream: TStream);
var
  PanoseFamilyKind  : Byte;
  PanoseFamilyClass : TCustomPascalTypePanoseClass;
begin
 with Stream do
  begin
   // check (minimum) table size
   if Position + 68 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   FVersion := ReadSwappedWord(Stream);

   // check version
   if not (Version in [0..3])
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read average horizontal character width
   FXAvgCharWidth := ReadSwappedWord(Stream);

   // read weight
   FWeight := ReadSwappedWord(Stream);

   // read width type
   FWidthType := ReadSwappedWord(Stream);

   // read font embedding right flags
   FFontEmbeddingFlags := ReadSwappedWord(Stream);

   // read YSubscriptXSize
   FYSubscriptXSize := ReadSwappedWord(Stream);

   // read YSubscriptYSize
   FYSubscriptYSize := ReadSwappedWord(Stream);

   // read YSubScriptXOffset
   FYSubScriptXOffset := ReadSwappedWord(Stream);

   // read YSubscriptYOffset
   FYSubscriptYOffset := ReadSwappedWord(Stream);

   // read YSuperscriptXSize
   FYSuperscriptXSize := ReadSwappedWord(Stream);

   // read YSuperscriptYSize
   FYSuperscriptYSize := ReadSwappedWord(Stream);

   // read YSuperscriptXOffset
   FYSuperscriptXOffset := ReadSwappedWord(Stream);

   // read YSuperscriptYOffset
   FYSuperscriptYOffset := ReadSwappedWord(Stream);

   // read YStrikeoutSize
   FYStrikeoutSize := ReadSwappedWord(Stream);

   // read YStrikeoutPosition
   FYStrikeoutPosition := ReadSwappedWord(Stream);

   // read FontFamilyType
   FFontFamilyType := ReadSwappedWord(Stream);

   // read Panose
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

   // read UlUnicodeRange
   Read(FUlUnicodeRange, 4 * SizeOf(Cardinal));

   // read AchVendID
   Read(FAchVendID, 4);

   // read FsSelection
   FFsSelection := ReadSwappedWord(Stream);

   // read UsFirstCharIndex
   FUsFirstCharIndex := ReadSwappedWord(Stream);

   // read UsLastCharIndex
   FUsLastCharIndex := ReadSwappedWord(Stream);

   // read STypoAscender
   FSTypoAscender := ReadSwappedWord(Stream);

   // read STypoDescender
   FSTypoDescender := ReadSwappedWord(Stream);

   // read STypoLineGap
   FSTypoLineGap := ReadSwappedWord(Stream);

   // read UsWinAscent
   FUsWinAscent := ReadSwappedWord(Stream);

   // read UsWinDescent
   FUsWinDescent := ReadSwappedWord(Stream);
  end;
end;

procedure TPascalTypeOS2Table.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   // write version
   WriteSwappedWord(Stream, FVersion);

   // write average horizontal character width
   WriteSwappedWord(Stream, FXAvgCharWidth);

   // write weight
   WriteSwappedWord(Stream, FWeight);

   // write width class
   WriteSwappedWord(Stream, FWidthType);

   // write font embedding rights
   WriteSwappedWord(Stream, FFontEmbeddingFlags);

   // write YSubscriptXSize
   WriteSwappedWord(Stream, FYSubscriptXSize);

   // write YSubscriptYSize
   WriteSwappedWord(Stream, FYSubscriptYSize);

   // write YSubScriptXOffset
   WriteSwappedWord(Stream, FYSubScriptXOffset);

   // write YSubscriptYOffset
   WriteSwappedWord(Stream, FYSubscriptYOffset);

   // write YSuperscriptXSize
   WriteSwappedWord(Stream, FYSuperscriptXSize);

   // write YSuperscriptYSize
   WriteSwappedWord(Stream, FYSuperscriptYSize);

   // write YSuperscriptXOffset
   WriteSwappedWord(Stream, FYSuperscriptXOffset);

   // write YSuperscriptYOffset
   WriteSwappedWord(Stream, FYSuperscriptYOffset);

   // write YStrikeoutSize
   WriteSwappedWord(Stream, FYStrikeoutSize);

   // write YStrikeoutPosition
   WriteSwappedWord(Stream, FYStrikeoutPosition);

   // write FontFamilyType
   WriteSwappedWord(Stream, FFontFamilyType);

   // read Panose
   Write(FPanose, 10);

   // read UlUnicodeRange
   Write(FUlUnicodeRange, 4 * SizeOf(Cardinal));

   // read AchVendID
   Write(FAchVendID, 4);

   // write FsSelection
   WriteSwappedWord(Stream, FFsSelection);

   // write UsFirstCharIndex
   WriteSwappedWord(Stream, FUsFirstCharIndex);

   // write UsLastCharIndex
   WriteSwappedWord(Stream, FUsLastCharIndex);

   // write STypoAscender
   WriteSwappedWord(Stream, FSTypoAscender);

   // write STypoDescender
   WriteSwappedWord(Stream, FSTypoDescender);

   // write STypoLineGap
   WriteSwappedWord(Stream, FSTypoLineGap);

   // write UsWinAscent
   WriteSwappedWord(Stream, FUsWinAscent);

   // write UsWinDescent
   WriteSwappedWord(Stream, FUsWinDescent);
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

procedure TPascalTypeOS2Table.SetAchVendID(const Value: TTableType);
begin
 if FAchVendID <> Value then
  begin
   FAchVendID := Value;
   AchVendIDChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetFsSelection(const Value: Word);
begin
 if FFsSelection <> Value then
  begin
   FFsSelection := Value;
   FsSelectionChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetPanose(
  const Value: TCustomPascalTypePanoseTable);
begin
 FPanose.Assign(Value);
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

procedure TPascalTypeOS2Table.SetSTypoAscender(const Value: SmallInt);
begin
 if FSTypoAscender <> Value then
  begin
   FSTypoAscender := Value;
   STypoAscenderChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSTypoDescender(const Value: SmallInt);
begin
 if FSTypoDescender <> Value then
  begin
   FSTypoDescender := Value;
   STypoDescenderChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetSTypoLineGap(const Value: SmallInt);
begin
 if FSTypoLineGap <> Value then
  begin
   FSTypoLineGap := Value;
   STypoLineGapChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetUsFirstCharIndex(const Value: Word);
begin
 if FUsFirstCharIndex <> Value then
  begin
   FUsFirstCharIndex := Value;
   UsFirstCharIndexChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetUsLastCharIndex(const Value: Word);
begin
 if FUsLastCharIndex <> Value then
  begin
   FUsLastCharIndex := Value;
   UsLastCharIndexChanged;
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

procedure TPascalTypeOS2Table.SetUsWinAscent(const Value: Word);
begin
 if FUsWinAscent <> Value then
  begin
   FUsWinAscent := Value;
   UsWinAscentChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetUsWinDescent(const Value: Word);
begin
 if FUsWinDescent <> Value then
  begin
   FUsWinDescent := Value;
   UsWinDescentChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetXAvgCharWidth(const Value: SmallInt);
begin
 if FXAvgCharWidth <> Value then
  begin
   FXAvgCharWidth := Value;
   XAvgCharWidthChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYStrikeoutPosition(const Value: SmallInt);
begin
 if FYStrikeoutPosition <> Value then
  begin
   FYStrikeoutPosition := Value;
   YStrikeoutPositionChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYStrikeoutSize(const Value: SmallInt);
begin
 if FYStrikeoutSize <> Value then
  begin
   FYStrikeoutSize := Value;
   YStrikeoutSizeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSubScriptXOffset(const Value: SmallInt);
begin
 if FYSubScriptXOffset <> Value then
  begin
   FYSubScriptXOffset := Value;
   YSubScriptXOffsetChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSubscriptXSize(const Value: SmallInt);
begin
 if FYSubscriptXSize <> Value then
  begin
   FYSubscriptXSize := Value;
   YSubscriptXSizeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSubscriptYOffset(const Value: SmallInt);
begin
 if FYSubscriptYOffset <> Value then
  begin
   FYSubscriptYOffset := Value;
   YSubscriptYOffsetChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSubscriptYSize(const Value: SmallInt);
begin
 if FYSubscriptYSize <> Value then
  begin
   FYSubscriptYSize := Value;
   YSubscriptYSizeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSuperscriptXOffset(const Value: SmallInt);
begin
 if FYSuperscriptXOffset <> Value then
  begin
   FYSuperscriptXOffset := Value;
   YSuperscriptXOffsetChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSuperscriptXSize(const Value: SmallInt);
begin
 if FYSuperscriptXSize <> Value then
  begin
   FYSuperscriptXSize := Value;
   YSuperscriptXSizeChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSuperscriptYOffset(const Value: SmallInt);
begin
 if FYSuperscriptYOffset <> Value then
  begin
   FYSuperscriptYOffset := Value;
   YSuperscriptYOffsetChanged;
  end;
end;

procedure TPascalTypeOS2Table.SetYSuperscriptYSize(const Value: SmallInt);
begin
 if FYSuperscriptYSize <> Value then
  begin
   FYSuperscriptYSize := Value;
   YSuperscriptYSizeChanged;
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

procedure TPascalTypeOS2Table.AchVendIDChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.FsSelectionChanged;
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

procedure TPascalTypeOS2Table.STypoAscenderChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.STypoDescenderChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.STypoLineGapChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.UsFirstCharIndexChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.UsLastCharIndexChanged;
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

procedure TPascalTypeOS2Table.UsWinAscentChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.UsWinDescentChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.VersionChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.XAvgCharWidthChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YStrikeoutPositionChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YStrikeoutSizeChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSubScriptXOffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSubscriptXSizeChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSubscriptYOffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSubscriptYSizeChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSuperscriptXOffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSuperscriptXSizeChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSuperscriptYOffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeOS2Table.YSuperscriptYSizeChanged;
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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

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
