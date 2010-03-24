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

uses
  Classes, Contnrs, SysUtils, PT_Types;

{$DEFINE AmbigiousExceptions}

type
  TCustomPascalTypeNamedTable = class;
  TCustomPascalTypeNamedTableClass = class of TCustomPascalTypeNamedTable;

  EPascalTypeError = class(Exception);

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
    constructor Create(Interpreter: IPascalTypeInterpreter); virtual;
  end;

  // TrueType Table Directory type
  TDirectoryTable = packed record
    Version       : Cardinal;  // A tag to indicate the OFA scaler (should be $10000)
    NumTables     : Word;      // number of tables
    SearchRange   : Word;      // (maximum power of 2 <= numTables) * 16
    EntrySelector : Word;      // log2(maximum power of 2 <= numTables)
    RangeShift    : Word;      // numTables * 16 - searchRange
  end;

  // TrueType Table Directory Entry type
  TDirectoryTableEntry = packed record
    TableType : TTableType;  // Table type
    CheckSum  : Cardinal;    // Table checksum
    Offset    : Cardinal;    // Table file offset
    Length    : Cardinal;    // Table length
  end;

  TPascalTypeDirectoryTableEntry = class(TCustomPascalTypeInterfaceTable)
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
    FFontDirectionHint  : TFontDirectionHint; //0 Mixed directional glyphs
       {
          1 Only strongly left to right glyphs
          2 Like 1 but also contains neutrals
          -1 Only strongly right to left glyphs
          -2 Like -1 but also contains neutrals
       }
    FIndexToLocFormat   : Word; // 0 for short offsets, 1 for long
    FGlyphDataFormat    : Word; // 0 for current format
    procedure SetCheckSumAdjustment(const Value: Longint);
    procedure SetCreatedDate(const Value: Int64);
    procedure SetFlags(const Value: TFontHeaderTableFlags);
    procedure SetFontDirectionHint(const Value: TFontDirectionHint);
    procedure SetFontRevision(const Value: TFixedPoint);
    procedure SetGlyphDataFormat(const Value: Word);
    procedure SetIndexToLocFormat(const Value: Word);
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
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

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
       {
          1 Only strongly left to right glyphs
          2 Like 1 but also contains neutrals
          -1 Only strongly right to left glyphs
          -2 Like -1 but also contains neutrals
       }

    property IndexToLocFormat: Word read FIndexToLocFormat write SetIndexToLocFormat; // 0 for short offsets, 1 for long
    property GlyphDataFormat: Word read FGlyphDataFormat write SetGlyphDataFormat; // 0 for current format
  end;


  // 'cmap' tables

  TCustomTrueTypeFontCharacterMap = class(TCustomPascalTypeTable)
  protected
    function GetFormat: Word; virtual; abstract;
  public
    function CharacterToGlyph(CharacterIndex: Integer): Integer; virtual; abstract;
    function CharacterToGlyphId(CharacterIndex: Integer): Integer; virtual; abstract;

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
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
    function CharacterToGlyphId(CharacterIndex: Integer): Integer; override;
  end;

  TTrueTypeFontFormat2CharacterMap = class(TCustomTrueTypeFontCharacterMap)
  private
    FLength       : Word; // This is the length in bytes of the subtable.
    FLanguage     : Word; // Please see 'Note on the language field in 'cmap' subtables' in this document.
    FGlyphIdArray : array [0..255] of SmallInt; // An array that maps character codes to glyph index values.
  protected
    function GetFormat: Word; override;
    procedure ResetToDefaults; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
    function CharacterToGlyphId(CharacterIndex: Integer): Integer; override;
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
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function CharacterToGlyph(CharacterIndex: Integer): Integer; override;
    function CharacterToGlyphId(CharacterIndex: Integer): Integer; override;
  end;

  TCustomCharacterMapDirectoryEntry = class(TCustomPascalTypeTable)
  private
    FCharacterMap : TCustomTrueTypeFontCharacterMap;
    FEncodingID   : Word;
    FOffset       : LongInt;
    function GetEncodingIDAsWord: Word;
    procedure SetEncodingIDAsWord(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    function GetPlatformID: TPlatformID; virtual; abstract;
    procedure EncodingIDChanged; virtual;
    property PlatformSpecificID: Word read GetEncodingIDAsWord write SetEncodingIDAsWord;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property PlatformID: TPlatformID read GetPlatformID;
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
    function GetCharacterMapSubtable(
      Index: Integer): TCustomCharacterMapDirectoryEntry;
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


  // table 'glyf'

  // TCustomTrueTypeFontInstructionTable

  TTrueTypeFontGlyphInstructionTable = class(TCustomPascalTypeInterfaceTable)
  private
    FInstructions : array of Byte;
    function GetInstruction(Index: Integer): Byte;
    function GetInstructionCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Instruction[Index: Integer]: Byte read GetInstruction;
    property InstructionCount: Integer read GetInstructionCount;
  end;


  TCustomTrueTypeFontGlyphData = class(TCustomPascalTypeInterfaceTable)
  private
    procedure SetNumberOfContours(const Value: SmallInt);
    procedure SetXMax(const Value: SmallInt);
    procedure SetXMin(const Value: SmallInt);
    procedure SetYMax(const Value: SmallInt);
    procedure SetYMin(const Value: SmallInt);
    procedure SetGlyphIndex(const Value: Integer);
  protected
    FNumberOfContours : SmallInt; // If the number of contours is greater than or equal to zero, this is a single glyph; if negative, this is a composite glyph.
    FXMin             : SmallInt; // Minimum x for coordinate data.
    FYMin             : SmallInt; // Minimum y for coordinate data.
    FXMax             : SmallInt; // Maximum x for coordinate data.
    FYMax             : SmallInt; // Maximum y for coordinate data.
    FInstructions     : TTrueTypeFontGlyphInstructionTable;
    FGlyphIndex       : Integer;

    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    procedure GlyphIndexChanged; virtual;
    procedure NumberOfContoursChanged; virtual;
    procedure XMaxChanged; virtual;
    procedure XMinChanged; virtual;
    procedure YMaxChanged; virtual;
    procedure YMinChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property NumberOfContours: SmallInt read FNumberOfContours write SetNumberOfContours;
    property XMin: SmallInt read FXMin write SetXMin;
    property YMin: SmallInt read FYMin write SetYMin;
    property XMax: SmallInt read FXMax write SetXMax;
    property YMax: SmallInt read FYMax write SetYMax;

    property GlyphIndex: Integer read FGlyphIndex write SetGlyphIndex;

    property Instructions: TTrueTypeFontGlyphInstructionTable read FInstructions;
  end;

  TContourPointRecord = record
    XPos  : Integer;
    YPos  : Integer;
    Flags : Byte;
  end;

  TPascalTypeContour = class(TPersistent)
  private
    FPoints : array of TContourPointRecord;
    function GetPoint(Index: Integer): TContourPointRecord;
    function GetPointCount: Integer;
    procedure SetPoint(Index: Integer; const Value: TContourPointRecord);
    procedure SetPointCount(const Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure PointCountChanged; virtual;
  public
    property Point[Index : Integer]: TContourPointRecord read GetPoint write SetPoint;
    property PointCount: Integer read GetPointCount write SetPointCount;
  end;

  TTrueTypeFontSimpleGlyphData = class(TCustomTrueTypeFontGlyphData)
  private
    FContours : TObjectList;
    function GetContour(Index: Integer): TPascalTypeContour;
    function GetContourCount: Integer;
  protected
    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Contour[Index : Integer]: TPascalTypeContour read GetContour;
    property ContourCount: Integer read GetContourCount; 
  end;

  TPascalTypeCompositeGlyph = class(TCustomPascalTypeTable)
  private
    FFlags      : Word;     // Component flag
    FGlyphIndex : SmallInt; // Glyph index of component
    FArgument   : array [0..1] of Integer;
    FScale      : array of Single;
    procedure SetFlags(const Value: Word);
    procedure SetGlyphIndex(const Value: SmallInt);
    procedure FlagsChanged;
    procedure GlyphIndexChanged;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Flags: Word read FFlags write SetFlags;
    property GlyphIndex: SmallInt read FGlyphIndex write SetGlyphIndex;
    property ArgumentX: Integer read FArgument[0];
    property ArgumentY: Integer read FArgument[1];
  end;

  TTrueTypeFontCompositeGlyphData = class(TCustomTrueTypeFontGlyphData)
  private
    FGlyphs : TObjectList;
    function GetGlyphCount: Integer;
    function GetCompositeGlyph(Index: Integer): TPascalTypeCompositeGlyph;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphCount: Integer read GetGlyphCount;
    property Glyph[Index: Integer]: TPascalTypeCompositeGlyph read GetCompositeGlyph;
  end;

  TTrueTypeFontGlyphDataTable = class(TCustomPascalTypeNamedTable)
  private
    FGlyphDataList : TObjectList;
    function GetGlyphDataCount: Integer;
    function GetGlyphData(Index: Integer): TCustomTrueTypeFontGlyphData; // List of TCustomTrueTypeFontGlyphData
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphDataCount: Integer read GetGlyphDataCount;
    property GlyphData[Index: Integer]: TCustomTrueTypeFontGlyphData read GetGlyphData;
  end;


  // Table 'maxp' of Maximum Profile

  TMaximumProfile = packed record
    Version               : TFixedPoint;
    numGlyphs             : Word;
    maxPoints             : Word;
    maxContours           : Word;
    maxCompositePoints    : Word;
    maxCompositeContours  : Word;
    maxZones              : Word;
    maxTwilightPoints     : Word;
    maxStorage            : Word;
    maxFunctionDefs       : Word;
    maxInstructionDefs    : Word;
    maxStackElements      : Word;
    maxSizeOfInstructions : Word;
    maxComponentElements  : Word;
    maxComponentDepth     : Word;
  end;

  TPascalTypeMaximumProfileTable = class(TCustomPascalTypeNamedTable)
  private
    FMaximumProfile : TMaximumProfile;
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
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property MaximumProfile: TMaximumProfile read FMaximumProfile;
  published
    property Version: TFixedPoint read FMaximumProfile.Version write SetVersion;
    property NumGlyphs: Word read FMaximumProfile.NumGlyphs write SetNumGlyphs;
    property MaxPoints: Word read FMaximumProfile.MaxPoints write SetMaxPoints;
    property MaxContours: Word read FMaximumProfile.MaxContours write SetMaxContours;
    property MaxCompositePoints: Word read FMaximumProfile.MaxCompositePoints write SetMaxCompositePoints;
    property MaxCompositeContours: Word read FMaximumProfile.MaxCompositeContours write SetMaxCompositeContours;
    property MaxZones: Word read FMaximumProfile.MaxZones write SetMaxZones;
    property MaxTwilightPoints: Word read FMaximumProfile.MaxTwilightPoints write SetMaxTwilightPoints;
    property MaxStorage: Word read FMaximumProfile.MaxStorage write SetMaxStorage;
    property MaxFunctionDefs: Word read FMaximumProfile.MaxFunctionDefs write SetMaxFunctionDefs;
    property MaxInstructionDefs: Word read FMaximumProfile.MaxInstructionDefs write SetMaxInstructionDefs;
    property MaxStackElements: Word read FMaximumProfile.MaxStackElements write SetMaxStackElements;
    property MaxSizeOfInstruction: Word read FMaximumProfile.MaxSizeOfInstructions write SetMaxSizeOfInstructions;
    property MaxComponentElements: Word read FMaximumProfile.MaxComponentElements write SetMaxComponentElements;
    property MaxComponentDepth: Word read FMaximumProfile.MaxComponentDepth write SetMaxComponentDepth;
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
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

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


  // table 'loca'

  TTrueTypeFontLocationTable = class(TCustomPascalTypeNamedTable)
  private
    FLocations : array of Cardinal;
    function GetLocation(Index: Integer): Cardinal;
    function GetLocationCount: Cardinal;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Location[Index: Integer]: Cardinal read GetLocation; default;
    property LocationCount: Cardinal read GetLocationCount; 
  end;


  // table 'cvt '

  TTrueTypeFontControlValueTable = class(TCustomPascalTypeNamedTable)
  private
    FControlValues : array of SmallInt;
    function GetControlValue(Index: Integer): SmallInt;
    function GetControlValueCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property ControlValue[Index: Integer]: SmallInt read GetControlValue;
    property ControlValueCount: Integer read GetControlValueCount;
  end;


  // TCustomTrueTypeFontInstructionTable

  TCustomTrueTypeFontInstructionTable = class(TCustomPascalTypeNamedTable)
  private
    FInstructions : array of Byte;
    function GetInstruction(Index: Integer): Byte;
    function GetInstructionCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Instruction[Index: Integer]: Byte read GetInstruction;
    property InstructionCount: Integer read GetInstructionCount;
  end;


  // table 'fpgm'

  TTrueTypeFontFontProgramTable = class(TCustomTrueTypeFontInstructionTable)
  public
    class function GetTableType: TTableType; override;
  end;


  // table 'prep'

  TTrueTypeFontControlValueProgramTable = class(TCustomTrueTypeFontInstructionTable)
  public
    class function GetTableType: TTableType; override;
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

  TOS2Table = packed record
    Version             : Word;                     // table version number (set to 0)
    XAvgCharWidth       : SmallInt;                 // average weighted advance width of lower case letters and space
    UsWeightClass       : TOS2WeightClass;          // visual weight (degree of blackness or thickness) of stroke in glyphs
    UsWidthClass        : TOS2WidthClass;           // relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in the font
    FsType              : SmallInt;                 // characteristics and properties of this font (set undefined bits to zero)
    YSubscriptXSize     : SmallInt;                 // recommended horizontal size in pixels for subscripts
    YSubscriptYSize     : SmallInt;                 // recommended vertical size in pixels for subscripts
    YSubScriptXOffset   : SmallInt;                 // recommended horizontal offset for subscripts
    YSubscriptYOffset   : SmallInt;                 // recommended vertical offset form the baseline for subscripts
    YSuperscriptXSize   : SmallInt;                 // recommended horizontal size in pixels for superscripts
    YSuperscriptYSize   : SmallInt;                 // recommended vertical size in pixels for superscripts
    YSuperscriptXOffset : SmallInt;                 // recommended horizontal offset for superscripts
    YSuperscriptYOffset : SmallInt;                 // recommended vertical offset from the baseline for superscripts
    YStrikeoutSize      : SmallInt;                 // width of the strikeout stroke
    YStrikeoutPosition  : SmallInt;                 // position of the strikeout stroke relative to the baseline
    SFamilyClass        : SmallInt;                 // classification of font-family design.
    Panose              : array [0..9] of Byte;     // 10 byte series of number used to describe the visual characteristics of a given typeface
    UlUnicodeRange      : array [0..3] of Cardinal; // Field is split into two bit fields of 96 and 36 bits each. The low 96 bits are used to specify the Unicode blocks encompassed by the font file. The high 32 bits are used to specify the character or script sets covered by the font file. Bit assignments are pending. Set to 01
    AchVendID           : TTableType;               // four character identifier for the font vendor
    FsSelection         : Word;                     // 2-byte bit field containing information concerning the nature of the font patterns
    UsFirstCharIndex    : Word;                     // The minimum Unicode index in this font.
    UsLastCharIndex     : Word;                     // The maximum Unicode index in this font.
    STypoAscender       : SmallInt;
    STypoDescender      : SmallInt;
    STypoLineGap        : SmallInt;
    UsWinAscent         : Word;
    UsWinDescent        : Word;
  end;

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

  TTrueTypeFontOS2Table = class(TCustomPascalTypeNamedTable)
  private
    FOS2Table : TOS2Table;
    procedure SetVersion(const Value: Word);
    procedure SetAchVendID(const Value: TTableType);
    procedure SetFsSelection(const Value: Word);
    procedure SetFsType(const Value: SmallInt);
    procedure SetSFamilyClass(const Value: SmallInt);
    procedure SetSTypoAscender(const Value: SmallInt);
    procedure SetSTypoDescender(const Value: SmallInt);
    procedure SetSTypoLineGap(const Value: SmallInt);
    procedure SetUsFirstCharIndex(const Value: Word);
    procedure SetUsLastCharIndex(const Value: Word);
    procedure SetUsWeightClass(const Value: TOS2WeightClass);
    procedure SetUsWidthClass(const Value: TOS2WidthClass);
    procedure SetUsWinAscent(const Value: Word);
    procedure SetUsWinDescent(const Value: Word);
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
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure AchVendIDChanged; virtual;
    procedure FsSelectionChanged; virtual;
    procedure FsTypeChanged; virtual;
    procedure SFamilyClassChanged; virtual;
    procedure STypoAscenderChanged; virtual;
    procedure STypoDescenderChanged; virtual;
    procedure STypoLineGapChanged; virtual;
    procedure UsFirstCharIndexChanged; virtual;
    procedure UsLastCharIndexChanged; virtual;
    procedure UsWeightClassChanged; virtual;
    procedure UsWidthClassChanged; virtual;
    procedure UsWinAscentChanged; virtual;
    procedure UsWinDescentChanged; virtual;
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
    procedure VersionChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property OS2Table: TOS2Table read FOS2Table;

    property Version: Word read FOS2Table.Version write SetVersion;
    property XAvgCharWidth: SmallInt read FOS2Table.XAvgCharWidth write SetXAvgCharWidth;
    property UsWeightClass: TOS2WeightClass read FOS2Table.UsWeightClass write SetUsWeightClass;
    property UsWidthClass: TOS2WidthClass read FOS2Table.UsWidthClass write SetUsWidthClass;
    property FsType: SmallInt read FOS2Table.FsType write SetFsType;
    property YSubscriptXSize: SmallInt read FOS2Table.YSubscriptXSize write SetYSubscriptXSize;
    property YSubscriptYSize: SmallInt read FOS2Table.YSubscriptYSize write SetYSubscriptYSize;
    property YSubScriptXOffset: SmallInt read FOS2Table.YSubScriptXOffset write SetYSubScriptXOffset;
    property YSubscriptYOffset: SmallInt read FOS2Table.YSubscriptYOffset write SetYSubscriptYOffset;
    property YSuperscriptXSize: SmallInt read FOS2Table.YSuperscriptXSize write SetYSuperscriptXSize;
    property YSuperscriptYSize: SmallInt read FOS2Table.YSuperscriptYSize write SetYSuperscriptYSize;
    property YSuperscriptXOffset: SmallInt read FOS2Table.YSuperscriptXOffset write SetYSuperscriptXOffset;
    property YSuperscriptYOffset: SmallInt read FOS2Table.YSuperscriptYOffset write SetYSuperscriptYOffset;
    property YStrikeoutSize: SmallInt read FOS2Table.YStrikeoutSize write SetYStrikeoutSize;
    property YStrikeoutPosition: SmallInt read FOS2Table.YStrikeoutPosition write SetYStrikeoutPosition;
    property SFamilyClass: SmallInt read FOS2Table.SFamilyClass write SetSFamilyClass;
    property AchVendID: TTableType read FOS2Table.AchVendID write SetAchVendID;
    property FsSelection: Word read FOS2Table.FsSelection write SetFsSelection;
    property UsFirstCharIndex: Word read FOS2Table.UsFirstCharIndex write SetUsFirstCharIndex;
    property UsLastCharIndex: Word read FOS2Table.UsLastCharIndex write SetUsLastCharIndex;
    property STypoAscender: SmallInt read FOS2Table.STypoAscender write SetSTypoAscender;
    property STypoDescender: SmallInt read FOS2Table.STypoDescender write SetSTypoDescender;
    property STypoLineGap: SmallInt read FOS2Table.STypoLineGap write SetSTypoLineGap;
    property UsWinAscent: Word read FOS2Table.UsWinAscent write SetUsWinAscent;
    property UsWinDescent: Word read FOS2Table.UsWinDescent write SetUsWinDescent;
  end;


  // table 'post'

  TTrueTypeFontPostscriptVersion2Table = class(TCustomPascalTypeTable)
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
    FPostscriptV2Table  : TTrueTypeFontPostscriptVersion2Table;
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
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
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
    property PostscriptV2Table: TTrueTypeFontPostscriptVersion2Table read FPostscriptV2Table;
  end;


function Swap16(Value: Word): Word;
function Swap32(Value: Cardinal): Cardinal;
function Swap64(Value: Int64): Int64;

procedure RegisterTrueTypeFontTable(TableClass: TCustomPascalTypeNamedTableClass);
procedure RegisterTrueTypeFontTables(TableClasses: array of TCustomPascalTypeNamedTableClass);
function FindTrueTypeFontTableByType(TableType: TTableType): TCustomPascalTypeNamedTableClass;

implementation

uses
  Math, PT_ResourceStrings;

var
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
   TableType := #0#0#0#0;
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


{ TPascalTypeHeaderTable }

constructor TPascalTypeHeaderTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TPascalTypeHeaderTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TPascalTypeHeaderTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeHeaderTable then
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
   Read(Value16, SizeOf(Word));
   Value16 := Swap16(Value16);
   FFlags := WordToFontHeaderTableFlags(Value16);

   {$IFDEF AmbigiousExceptions}
   if (Value16 shr 14) <> 0
    then raise EPascalTypeError.Create(RCStrHeaderFlagError);
   {$ENDIF}

   // read UnitsPerEm
   Read(Value16, SizeOf(Word));
   FUnitsPerEm := Swap16(Value16);

   // read CreatedDate
   Read(Value64, SizeOf(Int64));
   FCreatedDate := Swap16(Value64);

   // read ModifiedDate
   Read(Value64, SizeOf(Int64));
   FModifiedDate := Swap16(Value64);

   // read xMin
   Read(Value16, SizeOf(SmallInt));
   FxMin := Swap16(Value16);

   // read yMin
   Read(Value16, SizeOf(SmallInt));
   FyMin := Swap16(Value16);

   // read xMax
   Read(Value16, SizeOf(SmallInt));
   FxMax := Swap16(Value16);

   // read xMax
   Read(Value16, SizeOf(SmallInt));
   FyMax := Swap16(Value16);

   // read MacStyle
   Read(Value16, SizeOf(Word));
   FMacStyle := WordToMacStyles(Swap16(Value16));

   // read LowestRecPPEM
   Read(Value16, SizeOf(Word));
   FLowestRecPPEM := Swap16(Value16);

   // read FontDirectionHint
   Read(Value16, SizeOf(SmallInt));
   FFontDirectionHint := TFontDirectionHint(Swap16(Value16));

   // read IndexToLocFormat
   Read(Value16, SizeOf(SmallInt));
   FIndexToLocFormat := Swap16(Value16);

   // read GlyphDataFormat
   Read(Value16, SizeOf(SmallInt));
   FGlyphDataFormat := Swap16(Value16);
  end;
end;

procedure TPascalTypeHeaderTable.SaveToStream(Stream: TStream);
var
  Value64 : Int64;
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream do
  begin
   // write version
   Value32 := Swap32(Cardinal(FVersion));
   Write(Value32, SizeOf(TFixedPoint));

   // write font revision
   Value32 := Swap32(Cardinal(FFontRevision));
   Write(Value32, SizeOf(TFixedPoint));

   // write check sum adjust
   Value32 := Swap32(FCheckSumAdjustment);
   Write(Value32, SizeOf(LongInt));

   // write magic number
   Value32 := Swap32(FMagicNumber);
   Write(Value32, SizeOf(TFixedPoint));

   // write flags
   Value16 := Swap16(FontHeaderTableFlagsToWord(FFlags));
   Write(Value16, SizeOf(Word));

   // write UnitsPerEm
   Value16 := Swap16(FUnitsPerEm);
   Write(Value16, SizeOf(Word));

   // write CreatedDate
   Value64 := Swap16(FCreatedDate);
   Write(Value64, SizeOf(Word));

   // write ModifiedDate
   Value64 := Swap16(FModifiedDate);
   Write(Value64, SizeOf(Word));

   // write xMin
   Value16 := Swap16(FxMin);
   Write(Value16, SizeOf(Word));

   // write yMin
   Value16 := Swap16(FyMin);
   Write(Value16, SizeOf(Word));

   // write xMax
   Value16 := Swap16(FxMax);
   Write(Value16, SizeOf(Word));

   // write xMax
   Value16 := Swap16(FyMax);
   Write(Value16, SizeOf(Word));

   // write MacStyle
   Value16 := Swap16(MacStylesToWord(FMacStyle));
   Write(Value16, SizeOf(Word));

   // write LowestRecPPEM
   Value16 := Swap16(FLowestRecPPEM);
   Write(Value16, SizeOf(Word));

   // write FontDirectionHint
   Value16 := Swap16(Word(FFontDirectionHint));
   Write(Value16, SizeOf(Word));

   // write IndexToLocFormat
   Value16 := Swap16(FIndexToLocFormat);
   Write(Value16, SizeOf(Word));

   // write GlyphDataFormat
   Value16 := Swap16(FGlyphDataFormat);
   Write(Value16, SizeOf(Word));
  end;
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

procedure TPascalTypeHeaderTable.SetIndexToLocFormat(const Value: Word);
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

constructor TTrueTypeFontFormat0CharacterMap.Create;
begin
 inherited;
end;

destructor TTrueTypeFontFormat0CharacterMap.Destroy;
begin
 inherited;
end;

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
var
  Value16   : Word;
  CharIndex : Byte;
begin
 with Stream do
  begin
   // read length
   Read(Value16, SizeOf(Word));
   FLength := Swap16(Value16);

   // read language
   Read(Value16, SizeOf(Word));
   FLanguage := Swap16(Value16);

   Read(FGlyphIdArray[0], 256);
  end;
end;

procedure TTrueTypeFontFormat0CharacterMap.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write length
   Value16 := Swap16(FLength);
   Write(Value16, SizeOf(Word));

   // write language
   Value16 := Swap16(FLanguage);
   Write(Value16, SizeOf(Word));
  end;
end;

function TTrueTypeFontFormat0CharacterMap.CharacterToGlyph(
  CharacterIndex: Integer): Integer;
begin
 if CharacterIndex in [0..255]
  then Result := FGlyphIdArray[CharacterIndex]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [CharacterIndex]);
end;

function TTrueTypeFontFormat0CharacterMap.CharacterToGlyphId(
  CharacterIndex: Integer): Integer;
begin
 Result := CharacterToGlyph(CharacterIndex);
end;


{ TTrueTypeFontFormat2CharacterMap }

constructor TTrueTypeFontFormat2CharacterMap.Create;
begin
 inherited;
end;

destructor TTrueTypeFontFormat2CharacterMap.Destroy;
begin
 inherited;
end;

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

function TTrueTypeFontFormat2CharacterMap.CharacterToGlyphId(
  CharacterIndex: Integer): Integer;
begin
 Result := CharacterIndex;
end;

procedure TTrueTypeFontFormat2CharacterMap.LoadFromStream(Stream: TStream);
var
  Value16   : Word;
begin
 with Stream do
  begin
   // read length
   Read(Value16, SizeOf(Word));
   FLength := Swap16(Value16);

   // read language
   Read(Value16, SizeOf(Word));
   FLanguage := Swap16(Value16);
  end;
end;

procedure TTrueTypeFontFormat2CharacterMap.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write length
   Value16 := Swap16(FLength);
   Write(Value16, SizeOf(Word));

   // write language
   Value16 := Swap16(FLanguage);
   Write(Value16, SizeOf(Word));
  end;
end;


{ TTrueTypeFontFormat4CharacterMap }

constructor TTrueTypeFontFormat4CharacterMap.Create;
begin
 inherited;
end;

destructor TTrueTypeFontFormat4CharacterMap.Destroy;
begin
 inherited;
end;

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

function TTrueTypeFontFormat4CharacterMap.CharacterToGlyphId(
  CharacterIndex: Integer): Integer;
begin
 Result := CharacterToGlyph(CharacterIndex);

 if (Result >= 0) and (Result < Length(FGlyphIdArray))
  then Result := FGlyphIdArray[Result]
  else raise EPascalTypeError.Create(RCStrWrongCharacterIndex);
end;

procedure TTrueTypeFontFormat4CharacterMap.LoadFromStream(Stream: TStream);
var
  StartPos : Int64;
  SegIndex : Integer;
  Value16  : Word;
begin
 with Stream do
  begin
   StartPos := Position;

   // read length
   Read(Value16, SizeOf(Word));
   FLength := Swap16(Value16);

   if StartPos + FLength - 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read language
   Read(Value16, SizeOf(Word));
   FLanguage := Swap16(Value16);

   // read segCountX2
   Read(Value16, SizeOf(Word));
   FSegCountX2 := Swap16(Value16);

   // read search range
   Read(Value16, SizeOf(Word));
   FSearchRange := Swap16(Value16);

   // confirm search range has a valid value
   if FSearchRange <> 2 * (Power(2, Floor(Log2(0.5 * FSegCountX2))))
    then raise EPascalTypeError.Create(RCStrCharMapError + ': ' + 'wrong search range!');

   // read entry selector
   Read(Value16, SizeOf(Word));
   FEntrySelector := Swap16(Value16);

   // confirm entry selector has a valid value
   if FEntrySelector <> Log2(FSearchRange * 0.5)
    then raise EPascalTypeError.Create(RCStrCharMapError + ': ' + 'wrong entry selector!');

   // read range shift
   Read(Value16, SizeOf(Word));
   FRangeShift := Swap16(Value16);

   // confirm range shift has a valid value
   if FRangeShift <> FSegCountX2 - FSearchRange
    then raise EPascalTypeError.Create(RCStrCharMapError + ': ' + 'wrong range shift!');

   SetLength(FEndCount, FSegCountX2 div 2);
   SetLength(FStartCount, FSegCountX2 div 2);
   SetLength(FIdDelta, FSegCountX2 div 2);
   SetLength(FIdRangeOffset, FSegCountX2 div 2);

   // read end count
   for SegIndex := 0 to Length(FEndCount) - 1 do
    begin
     Read(Value16, SizeOf(Word));
     FEndCount[SegIndex] := Swap16(Value16);
    end;

   // confirm end count is valid
   if FEndCount[Length(FEndCount) - 1] <> $FFFF
    then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorEndCount, [FEndCount[Length(FEndCount) - 1]]);

   // read reserved
   Read(Value16, SizeOf(Word));

   {$IFDEF AmbigiousExceptions}
   // confirm reserved value is valid
   if Value16 <> 0
    then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorReserved, [Value16]);
   {$ENDIF}

   // read start count
   for SegIndex := 0 to Length(FStartCount) - 1 do
    begin
     Read(Value16, SizeOf(Word));
     FStartCount[SegIndex] := Swap16(Value16);

     {$IFDEF AmbigiousExceptions}
     // confirm start count is valid
     if FStartCount[SegIndex] > FEndCount[SegIndex]
      then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorStartCount, [FStartCount[SegIndex]]);
     {$ENDIF}
    end;

   // read ID delta
   for SegIndex := 0 to Length(FIdDelta) - 1 do
    begin
     Read(Value16, SizeOf(Word));
     FIdDelta[SegIndex] := Swap16(Value16);
    end;

   // confirm ID delta is valid
   if FIdDelta[Length(FIdDelta) - 1] <> 1
    then raise EPascalTypeError.CreateFmt(RCStrCharMapErrorIdDelta, [FIdDelta[Length(FIdDelta) - 1]]);

   // read ID range offset
   for SegIndex := 0 to Length(FIdRangeOffset) - 1 do
    begin
     Read(Value16, SizeOf(Word));
     FIdRangeOffset[SegIndex] := Swap16(Value16);
    end;

   SetLength(FGlyphIdArray, (FLength - (Position - StartPos)) div 2);

   for SegIndex := 0 to Length(FGlyphIdArray) - 1 do
    begin
     Read(Value16, SizeOf(Word));
     FGlyphIdArray[SegIndex] := Swap16(Value16);
    end;

  end;
end;

procedure TTrueTypeFontFormat4CharacterMap.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write length
   Value16 := Swap16(FLength);
   Write(Value16, SizeOf(Word));

   // write language
   Value16 := Swap16(FLanguage);
   Write(Value16, SizeOf(Word));
  end;
end;


{ TCustomCharacterMapDirectoryEntry }

constructor TCustomCharacterMapDirectoryEntry.Create;
begin
 inherited;

end;

destructor TCustomCharacterMapDirectoryEntry.Destroy;
begin
 if Assigned(FCharacterMap)
  then FreeAndNil(FCharacterMap);

 inherited;
end;

procedure TCustomCharacterMapDirectoryEntry.AssignTo(Dest: TPersistent);
begin
 if Dest is TCustomCharacterMapDirectoryEntry then
  with TCustomCharacterMapDirectoryEntry(Dest) do
   begin
    FEncodingID   := Self.FEncodingID;
    FOffset       := Self.FOffset;
    FCharacterMap.Assign(Self.FCharacterMap);
   end else inherited;
end;

procedure TCustomCharacterMapDirectoryEntry.ResetToDefaults;
begin
 if Assigned(FCharacterMap)
  then FreeAndNil(FCharacterMap);

 FEncodingID := 0;
 FOffset := 0;
end;

procedure TCustomCharacterMapDirectoryEntry.EncodingIDChanged;
begin
 Changed;
end;

function TCustomCharacterMapDirectoryEntry.GetEncodingIDAsWord: Word;
begin
 Result := FEncodingID;
end;

procedure TCustomCharacterMapDirectoryEntry.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
  OldMap  : TCustomTrueTypeFontCharacterMap;
begin
 with Stream do
  begin
   // read encoding ID
   Read(Value16, SizeOf(Word));
   FEncodingID := Swap16(Value16);

   // read offset
   Read(Value32, SizeOf(Cardinal));
   FOffset := Swap32(Value32);

   // damn hack: assume that the stream starts at the beginning of the table
   Position := FOffset;

   // read offset
   Read(Value16, SizeOf(Word));
   Value16 := Swap16(Value16);

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
   end;

   if Assigned(FCharacterMap)
    then FCharacterMap.LoadFromStream(Stream);
  end;
end;

procedure TCustomCharacterMapDirectoryEntry.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream do
  begin
   // write encoding ID
   Value16 := Swap16(FEncodingID);
   Write(Value16, SizeOf(Word));

   // write offset
   Value32 := Swap32(FOffset);
   Write(Value32, SizeOf(Cardinal));
  end;
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
 if Dest is TPascalTypeCharacterMapTable then
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
  CharacterMap    : TCustomTrueTypeFontCharacterMap;
  Value32         : Cardinal;
  Value16         : Word;
begin
 with Stream do
  begin
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // store stream start position
   StartPos := Position;
   Assert(StartPos = 0); // asser this for the damn hack used in this table!!!

   // read Version
   Read(Value16, SizeOf(Word));
   FVersion := Swap16(Value16);

   // check version
   if not (FVersion = 0)
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // clear subtable list
   FSubtableList.Clear;

   // read subtable count
   Read(Value16, SizeOf(Word));
   SubtableCount := Swap16(Value16);

   // check if table is complete
   if Position + SubtableCount * 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read directory entry
   for SubtableIndex := 0 to SubtableCount - 1 do
    begin
     Position := StartPos + 4 + SubtableIndex * 8; 

     // read Platform ID
     Read(Value16, SizeOf(Word));
     Value16 := Swap16(Value16);

     case Value16 of
       0 : CharMapDirEntry := TUnicodeCharacterMapDirectoryEntry.Create;
       1 : CharMapDirEntry := TMacintoshCharacterMapDirectoryEntry.Create;
       3 : CharMapDirEntry := TMicrosoftCharacterMapDirectoryEntry.Create;
      else CharMapDirEntry := TGenericCharacterMapDirectoryEntry.Create;
     end;

     CharMapDirEntry.LoadFromStream(Stream);

     if Assigned(CharMapDirEntry)
      then FSubtableList.Add(CharMapDirEntry);
    end;

(*
     // read length
     Read(Value16, SizeOf(Word));
     PlatformSpecificID := Swap16(Value16);

     // read offset
     Read(Value32, SizeOf(Cardinal));
     Offset := Swap32(Value32);
   // clear existing signatures
   FCharacterMap.Clear;

   // read digital signatures
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex] do
     begin
      CharacterMap := TCustomTrueTypeFontCharacterMap.Create;

      Position := StartPos + Offset;

      // load digital signature from stream
      CharacterMap.LoadFromStream(Stream);

      FCharacterMap.Add(CharacterMap);
     end;
*)
  end;
end;

procedure TPascalTypeCharacterMapTable.SaveToStream(Stream: TStream);
var
  StartPos  : Int64;
  DirIndex  : Integer;
//  Directory : array of TCharacterMapDirectoryEntry;
  Value32   : Cardinal;
  Value16   : Word;
begin
 with Stream do
  begin
   // store stream start position
   StartPos := Position;

   // write format type
   Value16 := Swap16(FVersion);
   Write(Value16, SizeOf(Word));

   // write directory entry count
   Value16 := Swap16(FSubtableList.Count);
   Write(Value16, SizeOf(Word));

   // offset directory
   Seek(soFromCurrent, FSubtableList.Count * 3 * SizeOf(Cardinal));

(*
   // build directory and store signature
   for DirIndex := 0 to FCharacterMap.Count - 1 do
    with TCustomTrueTypeFontCharacterMap(FCharacterMap[DirIndex]) do
     begin
      Directory[DirIndex].Format := Format;
      Directory[DirIndex].Offset := Position - StartPos;
      SaveToStream(Stream);
      Directory[DirIndex].Length := (Position - StartPos) - Directory[DirIndex].Offset;
     end;

   // locate directory
   Position := StartPos + 3 * SizeOf(Word);

   // write directory entries
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex], TCustomTrueTypeFontCharacterMap(FSignatures[DirIndex]) do
     begin
      // write format
      Value32 := Swap32(Format);
      Write(Value32, SizeOf(Cardinal));

      // write length
      Value32 := Swap32(Length);
      Write(Value32, SizeOf(Cardinal));

      // write offset
      Value32 := Swap32(Offset);
      Write(Value32, SizeOf(Cardinal));
     end;
*)
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


{ TTrueTypeFontGlyphInstructionTable }

procedure TTrueTypeFontGlyphInstructionTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontGlyphInstructionTable then
  with TTrueTypeFontGlyphInstructionTable(Dest) do
   begin
    FInstructions := Self.FInstructions;
   end
 else inherited;
end;

function TTrueTypeFontGlyphInstructionTable.GetInstruction(Index: Integer): Byte;
begin
 if (Index < Length(FInstructions))
  then Result := FInstructions[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontGlyphInstructionTable.GetInstructionCount: Integer;
begin
 Result := Length(FInstructions);
end;

procedure TTrueTypeFontGlyphInstructionTable.ResetToDefaults;
begin
 SetLength(FInstructions, 0);
end;

procedure TTrueTypeFontGlyphInstructionTable.LoadFromStream(Stream: TStream);
var
  Value16    : Word;
  MaxProfile : TPascalTypeMaximumProfileTable;
begin
 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));
 Assert(Assigned(MaxProfile));

 with Stream do
  begin
   // read instruction size
   Read(Value16, SizeOf(Word));
   Value16 := Swap16(Value16);

   // check if instructions shall be ignored
   if Value16 = $FFFF
    then Exit;

   // check if too many instuctions are present -> possible stream error
   if Value16 > MaxProfile.MaxSizeOfInstruction
    then raise EPascalTypeError.CreateFmt(RCStrTooManyInstructions, [Value16]);

   // set instruction length
   SetLength(FInstructions, Value16);

   // read instructions
   Read(FInstructions[0], Length(FInstructions));
  end;
end;

procedure TTrueTypeFontGlyphInstructionTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write instruction size
   Value16 := Swap16(Length(FInstructions));
   Write(Value16, SizeOf(Word));

   // write instructions
   Write(FInstructions[0], Length(FInstructions));
  end;
end;


{ TCustomTrueTypeFontGlyphData }

constructor TCustomTrueTypeFontGlyphData.Create(Interpreter: IPascalTypeInterpreter);
begin
 FInstructions := TTrueTypeFontGlyphInstructionTable.Create(Interpreter);
 inherited;
end;

destructor TCustomTrueTypeFontGlyphData.Destroy;
begin
 FreeAndNil(FInstructions);
 inherited;
end;

procedure TCustomTrueTypeFontGlyphData.GlyphIndexChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.AssignTo(Dest: TPersistent);
begin
 if Dest is TCustomTrueTypeFontGlyphData then
  with TCustomTrueTypeFontGlyphData(Dest) do
   begin
    FNumberOfContours := Self.FNumberOfContours;
    FXMin             := Self.FXMin;
    FYMin             := Self.FYMin;
    FXMax             := Self.FXMax;
    FYMax             := Self.FYMax;
    FGlyphIndex       := Self.FGlyphIndex;
   end
 else inherited;
end;

procedure TCustomTrueTypeFontGlyphData.ResetToDefaults;
begin
 FNumberOfContours := 0;
 FXMin := 0;
 FYMin := 0;
 FXMax := 0;
 FYMax := 0;
 FGlyphIndex := -1;
end;

procedure TCustomTrueTypeFontGlyphData.LoadFromStream(Stream: TStream);
var
  MaxProfile : TPascalTypeMaximumProfileTable;
  Value16    : Word;
begin
 // get maximum profile
 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableClass(TPascalTypeMaximumProfileTable));

 with Stream do
  begin
   if Position + 2 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read number of contours
   Read(Value16, SizeOf(SmallInt));
   FNumberOfContours := Swap16(Value16);

   // check if maximum number of contours are exceeded
   if FNumberOfContours > MaxProfile.MaxContours
    then raise EPascalTypeError.CreateFmt(RCStrTooManyContours, [FNumberOfContours, MaxProfile.MaxContours]);

   // check if glyph contains any information at all
   if FNumberOfContours = 0
    then Exit;

   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read XMin
   Read(Value16, SizeOf(SmallInt));
   FXMin := Swap16(Value16);

   // read YMin
   Read(Value16, SizeOf(SmallInt));
   FYMin := Swap16(Value16);

   // read XMax
   Read(Value16, SizeOf(SmallInt));
   FXMax := Swap16(Value16);

   // read YMax
   Read(Value16, SizeOf(SmallInt));
   FYMax := Swap16(Value16);

   Assert(FXMin <= FXMax);
   Assert(FYMin <= FYMax);
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write number of contours
   Value16 := Swap16(FNumberOfContours);
   Write(Value16, SizeOf(SmallInt));

   // write XMin
   Value16 := Swap16(FXMin);
   Write(Value16, SizeOf(SmallInt));

   // write YMin
   Value16 := Swap16(FYMin);
   Write(Value16, SizeOf(SmallInt));

   // write XMax
   Value16 := Swap16(FXMax);
   Write(Value16, SizeOf(SmallInt));

   // write YMax
   Value16 := Swap16(FYMax);
   Write(Value16, SizeOf(SmallInt));
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetGlyphIndex(const Value: Integer);
begin
 if FGlyphIndex <> Value then
  begin
   FGlyphIndex := Value;
   GlyphIndexChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetNumberOfContours(
  const Value: SmallInt);
begin
 if FNumberOfContours <> Value then
  begin
   FNumberOfContours := Value;
   NumberOfContoursChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetXMax(const Value: SmallInt);
begin
 if FXMax <> Value then
  begin
   FXMax := Value;
   XMaxChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetXMin(const Value: SmallInt);
begin
 if FXMin <> Value then
  begin
   FXMin := Value;
   XMinChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetYMax(const Value: SmallInt);
begin
 if FYMax <> Value then
  begin
   FYMax := Value;
   YMaxChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetYMin(const Value: SmallInt);
begin
 if FYMin <> Value then
  begin
   FYMin := Value;
   YMinChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.NumberOfContoursChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.XMaxChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.XMinChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.YMaxChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.YMinChanged;
begin
 Changed;
end;


{ TPascalTypeContour }

procedure TPascalTypeContour.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeContour then
  with TPascalTypeContour(Dest) do
   begin

   end
  else inherited;
end;

function TPascalTypeContour.GetPoint(Index: Integer): TContourPointRecord;
begin
 if (Index >= 0) and (Index < Length(FPoints))
  then Result := FPoints[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

procedure TPascalTypeContour.SetPoint(Index: Integer;
  const Value: TContourPointRecord);
begin
 if (Index >= 0) and (Index < Length(FPoints))
  then FPoints[Index] := Value
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeContour.GetPointCount: Integer;
begin
 Result := Length(FPoints)
end;

procedure TPascalTypeContour.SetPointCount(const Value: Integer);
begin
 if Value <> Length(FPoints) then
  begin
   SetLength(FPoints, Value);
   PointCountChanged;
  end;
end;

procedure TPascalTypeContour.PointCountChanged;
begin
 // yet todo
end;


{ TTrueTypeFontSimpleGlyphData }

constructor TTrueTypeFontSimpleGlyphData.Create(
  Interpreter: IPascalTypeInterpreter);
begin
 FContours := TObjectList.Create;
 inherited Create(Interpreter);
end;

destructor TTrueTypeFontSimpleGlyphData.Destroy;
begin
 FreeAndNil(FContours);
 inherited;
end;

procedure TTrueTypeFontSimpleGlyphData.ResetToDefaults;
begin
 FInstructions.ResetToDefaults;
(*
 SetLength(FEndPtsOfContours, 0);
 SetLength(FFlags, 0);
*)
end;

function TTrueTypeFontSimpleGlyphData.GetContour(
  Index: Integer): TPascalTypeContour;
begin
 if (Index >= 0) and (Index < FContours.Count)
  then Result := TPascalTypeContour(FContours[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontSimpleGlyphData.GetContourCount: Integer;
begin
 Result := FContours.Count;
end;

procedure TTrueTypeFontSimpleGlyphData.LoadFromStream(Stream: TStream);
var
  ContourIndex : Integer;
  PointIndex   : Integer;
  CntrPntIndex : Integer;
  FlagIndex    : Integer;
  PointCount   : Integer;
  LastPoint    : Integer;
  Contour      : TPascalTypeContour;
  Value16      : Word;
  MaxProfile   : TPascalTypeMaximumProfileTable;
  EndPtsOfCont : array of SmallInt;
  Flag         : Byte;
  FlagCount    : Byte;
  Value8       : Byte absolute FlagCount;
begin
 inherited;

 // get maximum profile
 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableClass(TPascalTypeMaximumProfileTable));

 // check if glyph contains any information at all
 if FNumberOfContours = 0
  then Exit;

 with Stream do
  begin
   // set end points of contours array size
   SetLength(EndPtsOfCont, FNumberOfContours);

   // read end points
   for ContourIndex := 0 to FNumberOfContours - 1 do
    begin
     // read number of contours
     Read(Value16, SizeOf(Word));
     PointCount := Swap16(Value16);
     EndPtsOfCont[ContourIndex] := PointCount;
    end;

   // increase last end point to get the true point count 
   Inc(PointCount);

   // check if maximum points are exceeded
   if PointCount > MaxProfile.MaxPoints
    then raise EPascalTypeError.CreateFmt(RCStrTooManyPoints, [PointCount]);

   // read instructions
   FInstructions.LoadFromStream(Stream);

   // clear existing contours
   FContours.Clear;

   for ContourIndex := 0 to FNumberOfContours - 1 do
    begin
     // create new contour
     Contour := TPascalTypeContour.Create;

     // set contour point count
     if ContourIndex = 0
      then Contour.PointCount := EndPtsOfCont[ContourIndex] + 1
      else Contour.PointCount := (EndPtsOfCont[ContourIndex] - EndPtsOfCont[ContourIndex - 1]);

     // add contour to contour list
     FContours.Add(Contour);
    end;

   // reset point and contour index
   PointIndex := 0;
   ContourIndex := 0;
   CntrPntIndex := 0;

   // set first contour
   Contour := TPascalTypeContour(FContours[ContourIndex]);

   while PointIndex < PointCount do
    begin
     // eventually increase contour index
     if PointIndex > EndPtsOfCont[ContourIndex] then
      begin
       Inc(ContourIndex);
       CntrPntIndex := 0;

       // set next contour
       Contour := TPascalTypeContour(FContours[ContourIndex]);
      end;

     // read flag value
     Read(Flag, 1);

     {$IFDEF AmbigiousExceptions}
     if (Flag and (1 shl 6)) <> 0
      then raise EPascalTypeError.CreateFmt(RCStrGlyphDataFlagReservedError, [PointIndex, PointCount]);

     if (Flag and (1 shl 7)) <> 0
      then raise EPascalTypeError.CreateFmt(RCStrGlyphDataFlagReservedError, [PointIndex, PointCount]);
     {$ENDIF}

     // set flags
     Contour.FPoints[CntrPntIndex].Flags := Flag;

     // increase point index
     Inc(PointIndex);
     Inc(CntrPntIndex);

     // check for 'repeat' flag
     if (Flag and (1 shl 3)) <> 0 then
      begin
       // read repeat count
       Read(FlagCount, 1);

       if (PointIndex + FlagCount > PointCount)
        then raise EPascalTypeError.CreateFmt(RCStrGlyphDataFlagRepeatError, [PointIndex + FlagCount, PointCount]);

       while FlagCount > 0 do
        begin
         // eventually increase contour index
         if PointIndex > EndPtsOfCont[ContourIndex] then
          begin
           Inc(ContourIndex);
           CntrPntIndex := 0;

           // set next contour
           Contour := TPascalTypeContour(FContours[ContourIndex]);
          end;

         // set flags
         Contour.FPoints[CntrPntIndex].Flags := Flag;

         Inc(PointIndex);
         Inc(CntrPntIndex);
         Dec(FlagCount);
        end
      end
    end;

   // reset contour and point index
   ContourIndex := 0;
   CntrPntIndex := 0;

   // set first contour
   Contour := TPascalTypeContour(FContours[ContourIndex]);

   // reset last point
   LastPoint := 0;

   // read x-coordinates
   for PointIndex := 0 to PointCount - 1 do
    begin
     // eventually increase contour
     if PointIndex > EndPtsOfCont[ContourIndex] then
      begin
       Inc(ContourIndex);
       CntrPntIndex := 0;

       // set next contour
       Contour := TPascalTypeContour(FContours[ContourIndex])
      end;

     // check for short or long version
     with Contour, FPoints[CntrPntIndex] do
      begin
       if (Flags and (1 shl 1)) > 0 then
        begin
         Read(Value8, 1);

         // eventually change sign
         if (Flags and (1 shl 4)) > 0
          then XPos := LastPoint + Value8
          else XPos := LastPoint - Value8;
        end
       else
        begin
         // eventually use last point
         if (Flags and (1 shl 4)) > 0
          then XPos := LastPoint
          else
           begin
            Read(Value16, SizeOf(Word));
            XPos := LastPoint + SmallInt(Swap16(Value16));
           end;
        end;
       LastPoint := XPos;

       Inc(CntrPntIndex);
      end;
    end;


   // reset contour and point index
   ContourIndex := 0;
   CntrPntIndex := 0;

   // set first contour
   Contour := TPascalTypeContour(FContours[ContourIndex]);

   // reset last point
   LastPoint := 0;

   // read y-coordinates
   for PointIndex := 0 to PointCount - 1 do
    begin
     // eventually increase contour
     if PointIndex > EndPtsOfCont[ContourIndex] then
      begin
       Inc(ContourIndex);
       CntrPntIndex := 0;

       // set next contour
       Contour := TPascalTypeContour(FContours[ContourIndex])
      end;

     // check for short or long version
     with Contour, FPoints[CntrPntIndex] do
      begin
       if (Flags and (1 shl 2)) > 0 then
        begin
         Read(Value8, 1);

         // eventually change sign
         if (Flags and (1 shl 5)) > 0
          then YPos := LastPoint + Value8
          else YPos := LastPoint - Value8;
        end
       else
        begin
         // eventually use last point
         if (Flags and (1 shl 5)) > 0
          then YPos := LastPoint
          else
           begin
            Read(Value16, SizeOf(Word));
            YPos := LastPoint + SmallInt(Swap16(Value16));
           end;
        end;
       LastPoint := YPos;

       Inc(CntrPntIndex);
      end;

    end;

    Read(Value16, SizeOf(Word));
  end;
end;

procedure TTrueTypeFontSimpleGlyphData.SaveToStream(Stream: TStream);
begin

end;


{ TPascalTypeCompositeGlyph }

procedure TPascalTypeCompositeGlyph.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontCompositeGlyphData then
  with TTrueTypeFontCompositeGlyphData(Dest) do
   begin
    FFlags := Self.FFlags;
    FGlyphIndex := Self.FGlyphIndex;
    FArgument := Self.FArgument;
   end
 else inherited;
end;

procedure TPascalTypeCompositeGlyph.ResetToDefaults;
begin
 FFlags       := 0;
 FGlyphIndex  := 0;
 FArgument[0] := 0;
 FArgument[1] := 0;
end;

procedure TPascalTypeCompositeGlyph.LoadFromStream(Stream: TStream);
var
  Argument : array [0..1] of SmallInt;
  Value16  : Word;
  Value8   : Byte;
const
  CFixedPoint2Dot14Scale : Single = 1 / 16384;  
begin
 inherited;

 with Stream do
  begin
   // read flags
   Read(Value16, SizeOf(Word));
   FFlags := Swap16(Value16);

   {$IFDEF AmbigiousExceptions}
   // make sure the reserved flag is set to 0
   //   if (FFlags and (1 shl 4)) <> 0
   //    then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
   {$ENDIF}

   // read glyph index
   Read(Value16, SizeOf(Word));
   FGlyphIndex := Swap16(Value16);

   // read argument 1
   if (FFlags and 1) > 0 then
    begin
     Read(Value16, SizeOf(Word));
     Argument[0] := Swap16(Value16);
    end
   else
    begin
     Read(Value8, 1);
     Argument[0] := Value8;
    end;

   // read argument 2
   if (FFlags and 1) > 0 then
    begin
     Read(Value16, SizeOf(Word));
     Argument[1] := Swap16(Value16);
    end
   else
    begin
     Read(Value8, 1);
     Argument[1] := Value8;
    end;

   if (FFlags and (1 shl 3)) <> 0 then
    begin
     // one dimensional scale
     SetLength(FScale, 1);

     // read scale
     Read(Value16, SizeOf(Word));
     FScale[0] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     {$IFDEF AmbigiousExceptions}
     // make sure the reserved flag is set to 0
     if (FFlags and (1 shl 6)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     if (FFlags and (1 shl 7)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     {$ENDIF}
    end else
   if (FFlags and (1 shl 6)) <> 0 then
    begin
     // one dimensional scale
     SetLength(FScale, 2);

     // read x-scale
     Read(Value16, SizeOf(Word));
     FScale[0] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     // read y-scale
     Read(Value16, SizeOf(Word));
     FScale[1] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     {$IFDEF AmbigiousExceptions}
     // make sure the reserved flag is set to 0
     if (FFlags and (1 shl 3)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     if (FFlags and (1 shl 7)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     {$ENDIF}
    end else
   if (FFlags and (1 shl 7)) <> 0 then
    begin
     // one dimensional scale
     SetLength(FScale, 4);

     // read x-scale
     Read(Value16, SizeOf(Word));
     FScale[0] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     // read scale01
     Read(Value16, SizeOf(Word));
     FScale[1] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     // read scale10
     Read(Value16, SizeOf(Word));
     FScale[2] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     // read y-scale
     Read(Value16, SizeOf(Word));
     FScale[3] := SmallInt(Swap16(Value16)) * CFixedPoint2Dot14Scale;

     {$IFDEF AmbigiousExceptions}
     // make sure the reserved flag is set to 0
     if (FFlags and (1 shl 3)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     if (FFlags and (1 shl 6)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     {$ENDIF}
    end else
  end;
end;

procedure TPascalTypeCompositeGlyph.SaveToStream(Stream: TStream);
begin

end;

procedure TPascalTypeCompositeGlyph.SetFlags(const Value: Word);
begin
 if FFlags <> Value then
  begin
   FFlags := Value;
   FlagsChanged;
  end;
end;

procedure TPascalTypeCompositeGlyph.SetGlyphIndex(const Value: SmallInt);
begin
 if FGlyphIndex <> Value then
  begin
   FGlyphIndex := Value;
   GlyphIndexChanged;
  end;
end;

procedure TPascalTypeCompositeGlyph.FlagsChanged;
begin
 Changed;
end;

procedure TPascalTypeCompositeGlyph.GlyphIndexChanged;
begin
 Changed;
end;


{ TTrueTypeFontCompositeGlyphData }

constructor TTrueTypeFontCompositeGlyphData.Create;
begin
 FGlyphs := TObjectList.Create;
 inherited;
end;

destructor TTrueTypeFontCompositeGlyphData.Destroy;
begin
 FreeAndNil(FGlyphs);
 inherited;
end;

function TTrueTypeFontCompositeGlyphData.GetCompositeGlyph(
  Index: Integer): TPascalTypeCompositeGlyph;
begin
 if (Index >= 0) and (Index < FGlyphs.Count)
  then Result := TPascalTypeCompositeGlyph(FGlyphs[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontCompositeGlyphData.GetGlyphCount: Integer;
begin
 Result := FGlyphs.Count;
end;

procedure TTrueTypeFontCompositeGlyphData.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontCompositeGlyphData then
  with TTrueTypeFontCompositeGlyphData(Dest) do
   begin
    FGlyphs.Assign(Self.FGlyphs);
    Self.FGlyphs.OwnsObjects := False;
   end
 else inherited;
end;

procedure TTrueTypeFontCompositeGlyphData.ResetToDefaults;
begin
 FGlyphs.Clear;
end;

procedure TTrueTypeFontCompositeGlyphData.LoadFromStream(Stream: TStream);
var
  Glyph           : TPascalTypeCompositeGlyph;
  HasInstructions : Boolean;
begin
 inherited;

 // a default glyph does not contain instructions
 HasInstructions := False;

 // clear existing glyphs
 FGlyphs.Clear;

 with Stream do
  repeat
   Glyph := TPascalTypeCompositeGlyph.Create;

   Glyph.LoadFromStream(Stream);

   // add glyph to the glyph list
   FGlyphs.Add(Glyph);

   // check if glyph has instructions
   if (Glyph.Flags and (1 shl 8)) <> 1
    then HasInstructions := True;

  until (Glyph.Flags and (1 shl 5)) = 0;

 // eventually read instructions
 if HasInstructions
  then FInstructions.LoadFromStream(Stream);
end;

procedure TTrueTypeFontCompositeGlyphData.SaveToStream(Stream: TStream);
var
  GlyphIndex : Integer;
begin
 // save glyphs
 for GlyphIndex := 0 to FGlyphs.Count - 1 do
  with TPascalTypeCompositeGlyph(FGlyphs[GlyphIndex])
   do SaveToStream(Stream);

 // save instructions to stream
 FInstructions.SaveToStream(Stream);
end;


{ TTrueTypeFontGlyphDataTable }

constructor TTrueTypeFontGlyphDataTable.Create;
begin
 FGlyphDataList := TObjectList.Create;
 inherited;
end;

destructor TTrueTypeFontGlyphDataTable.Destroy;
begin
 FreeAndNil(FGlyphDataList);
 inherited;
end;

procedure TTrueTypeFontGlyphDataTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontGlyphDataTable then
  with TTrueTypeFontGlyphDataTable(Dest) do
   begin
    FGlyphDataList.Assign(Self.FGlyphDataList);
    Self.FGlyphDataList.OwnsObjects := False;
   end
 else inherited;
end;

function TTrueTypeFontGlyphDataTable.GetGlyphData(
  Index: Integer): TCustomTrueTypeFontGlyphData;
begin
 if (Index >= 0) and (Index < FGlyphDataList.Count)
  then Result := TCustomTrueTypeFontGlyphData(FGlyphDataList[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontGlyphDataTable.GetGlyphDataCount: Integer;
begin
 Result := FGlyphDataList.Count;
end;

class function TTrueTypeFontGlyphDataTable.GetTableType: TTableType;
begin
 Result := 'glyf';
end;

procedure TTrueTypeFontGlyphDataTable.ResetToDefaults;
begin
 FGlyphDataList.Clear;
end;

procedure TTrueTypeFontGlyphDataTable.LoadFromStream(Stream: TStream);
var
  StartPos  : Int64;
  GlyphData : TCustomTrueTypeFontGlyphData;
  Locations : TTrueTypeFontLocationTable;
  LocIndex  : Integer;
  Value16   : SmallInt;
begin
 // get location table
 Locations := TTrueTypeFontLocationTable(FInterpreter.GetTableByTableClass(TTrueTypeFontLocationTable));

 with Stream do
  begin
   // store initil position
   StartPos := Position;

   // check for minimal table size
   if Position + 10 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   if Assigned(Locations) then
    for LocIndex := 0 to Locations.LocationCount - 2 do
     begin
      Position := StartPos + Locations[LocIndex];

      Read(Value16, SizeOf(SmallInt));
      Value16 := Swap16(Value16);

      if (Value16 < -1)
       then raise EPascalTypeError.CreateFmt(RCStrUnknownGlyphDataType, [Value16]);

      // set position before number of contours
      Seek(-2, soFromCurrent);

      // read number of contours and create glyph data object
       if Value16 > 0
        then GlyphData := TTrueTypeFontSimpleGlyphData.Create(FInterpreter)
        else GlyphData := TTrueTypeFontCompositeGlyphData.Create(FInterpreter);

      try
       GlyphData.LoadFromStream(Stream);
       GlyphData.GlyphIndex := LocIndex;
       FGlyphDataList.Add(GlyphData);
      except
//       on e: EPascalTypeError do
//        raise EPascalTypeError.CreateFmt('Error loading glyph #%d' + #10 + E.Message, [LocIndex]);
      end;

//      if LocIndex > 4 then Exit;
     end
   else
    while Position + 10 < Size do
     begin
      Read(Value16, SizeOf(SmallInt));

      Assert(Value16 >= -1);

      // read number of contours and create glyph data object
      if Value16 > 0
       then GlyphData := TTrueTypeFontSimpleGlyphData.Create(FInterpreter)
       else GlyphData := TTrueTypeFontCompositeGlyphData.Create(FInterpreter);

      // set position before number of contours
      Seek(-2, soFromCurrent);

      GlyphData.LoadFromStream(Stream);

      FGlyphDataList.Add(GlyphData);

      if FGlyphDataList.Count > 0 then Exit;
     end;
  end;
end;

procedure TTrueTypeFontGlyphDataTable.SaveToStream(Stream: TStream);
var
  GlyphDataIndex : Integer;
begin
 for GlyphDataIndex := 0 to FGlyphDataList.Count - 1 do
  with TCustomTrueTypeFontGlyphData(FGlyphDataList[GlyphDataIndex])
   do SaveToStream(Stream);
end;


{ TPascalTypeHorizontalHeaderTable }

constructor TPascalTypeHorizontalHeaderTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TPascalTypeHorizontalHeaderTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TPascalTypeHorizontalHeaderTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeHorizontalHeaderTable then
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
  Value16 : Word;
  Value32 : Cardinal;
begin
 with Stream do
  begin
   if Position + 32 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   Version := TFixedPoint(Swap32(Value32));

   // check version
   if not (Version.Value = 1)
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read Ascent
   Read(Value16, SizeOf(SmallInt));
   Ascent := Swap16(Value16);

   // read Descent
   Read(Value16, SizeOf(SmallInt));
   Descent := Swap16(Value16);

   // read LineGap
   Read(Value16, SizeOf(SmallInt));
   LineGap := Swap16(Value16);

   // read AdvanceWidthMax
   Read(Value16, SizeOf(Word));
   AdvanceWidthMax := Swap16(Value16);

   // read MinLeftSideBearing
   Read(Value16, SizeOf(SmallInt));
   MinLeftSideBearing := Swap16(Value16);

   // read MinRightSideBearing
   Read(Value16, SizeOf(SmallInt));
   MinRightSideBearing := Swap16(Value16);

   // read XMaxExtent
   Read(Value16, SizeOf(SmallInt));
   XMaxExtent := Swap16(Value16);

   // read CaretSlopeRise
   Read(Value16, SizeOf(SmallInt));
   CaretSlopeRise := Swap16(Value16);

   // read CaretSlopeRun
   Read(Value16, SizeOf(SmallInt));
   CaretSlopeRun := Swap16(Value16);

   // read CaretOffset
   Read(Value16, SizeOf(SmallInt));
   CaretOffset := Swap16(Value16);

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
   Read(Value16, SizeOf(SmallInt));
   MetricDataFormat := Swap16(Value16);

   // read NumOfLongHorMetrics
   Read(Value16, SizeOf(Word));
   NumOfLongHorMetrics := Swap16(Value16);
  end;
end;

procedure TPascalTypeHorizontalHeaderTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
  Value32 : Cardinal;
begin
 with Stream do
  begin
   // write version
   Value32 := Swap32(Cardinal(FVersion));
   Write(Value32, SizeOf(TFixedPoint));

   // check version
   if not (Version.Value = 1)
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // write Ascent
   Value16 := Swap16(Ascent);
   Write(Value16, SizeOf(SmallInt));

   // write Descent
   Value16 := Swap16(Descent);
   Write(Value16, SizeOf(SmallInt));

   // write LineGap
   Value16 := Swap16(LineGap);
   Write(Value16, SizeOf(SmallInt));

   // write AdvanceWidthMax
   Value16 := Swap16(AdvanceWidthMax);
   Write(Value16, SizeOf(Word));

   // write MinLeftSideBearing
   Value16 := Swap16(MinLeftSideBearing);
   Write(Value16, SizeOf(SmallInt));

   // write MinRightSideBearing
   Value16 := Swap16(MinRightSideBearing);
   Write(Value16, SizeOf(SmallInt));

   // write XMaxExtent
   Value16 := Swap16(XMaxExtent);
   Write(Value16, SizeOf(SmallInt));

   // write CaretSlopeRise
   Value16 := Swap16(CaretSlopeRise);
   Write(Value16, SizeOf(SmallInt));

   // write CaretSlopeRun
   Value16 := Swap16(CaretSlopeRun);
   Write(Value16, SizeOf(SmallInt));

   // write CaretOffset
   Value16 := Swap16(CaretOffset);
   Write(Value16, SizeOf(SmallInt));

   // reserved, set to zero!
   Value32 := 0;
   Write(Value32, SizeOf(Cardinal));
   Write(Value32, SizeOf(Cardinal));

   // write MetricDataFormat
   Value16 := Swap16(MetricDataFormat);
   Write(Value16, SizeOf(SmallInt));

   // write NumOfLongHorMetrics
   Value16 := Swap16(NumOfLongHorMetrics);
   Write(Value16, SizeOf(Word));
  end;
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
 if Dest is TPascalTypeHorizontalMetricsTable then
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
  Value16  : Word;
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
      Read(Value16, SizeOf(SmallInt));
      AdvanceWidth := SmallInt(Swap16(Value16));

      // read left side bearing
      Read(Value16, SizeOf(SmallInt));
      Bearing := Swap16(Value16);
     end;

   for MtxIndex := HorHead.NumOfLongHorMetrics to Length(FHorizontalMetrics)  - 1 do
    with FHorizontalMetrics[MtxIndex] do
     begin
      // read advance width / left side bearing at once
      Read(Value16, SizeOf(SmallInt));
      AdvanceWidth := Swap16(Value16);
      Bearing := Swap16(Value16);
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

{ TTrueTypeFontLocationTable }

procedure TTrueTypeFontLocationTable.ResetToDefaults;
begin
 SetLength(FLocations, 0);
end;

procedure TTrueTypeFontLocationTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontLocationTable then
  with TTrueTypeFontLocationTable(Dest) do
   begin
    FLocations := Self.FLocations;
   end
 else inherited;
end;

function TTrueTypeFontLocationTable.GetLocation(Index: Integer): Cardinal;
begin
 if (Index >= 0) and (Index < Length(FLocations))
  then Result := FLocations[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontLocationTable.GetLocationCount: Cardinal;
begin
 Result := Length(FLocations);
end;

class function TTrueTypeFontLocationTable.GetTableType: TTableType;
begin
 Result := 'loca';
end;

procedure TTrueTypeFontLocationTable.LoadFromStream(Stream: TStream);
var
  LocationIndex : Integer;
  HeaderTable   : TPascalTypeHeaderTable;
  Value32       : Cardinal;
  Value16       : Word;
begin
 with Stream do
  begin
   HeaderTable := TPascalTypeHeaderTable(FInterpreter.GetTableByTableClass(TPascalTypeHeaderTable));
   Assert(Assigned(HeaderTable));

   case HeaderTable.IndexToLocFormat of
    0 : begin
         // short format
         SetLength(FLocations, Size div 2);
         for LocationIndex := 0 to Length(FLocations) - 1 do
          begin
           Read(Value16, SizeOf(Word));
           FLocations[LocationIndex] := 2 * Swap16(Value16);
          end;
        end;
    1 : begin
         // long format
         SetLength(FLocations, Size div 4);
         for LocationIndex := 0 to Length(FLocations) - 1 do
          begin
           Read(Value32, SizeOf(Cardinal));
           FLocations[LocationIndex] := Swap32(Value32);
          end;
        end;
   end;

  end;
end;

procedure TTrueTypeFontLocationTable.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   Write(FLocations[0], Length(FLocations) * SizeOf(Cardinal));
  end;
end;


{ TTrueTypeFontControlValueTable }

constructor TTrueTypeFontControlValueTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TTrueTypeFontControlValueTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TTrueTypeFontControlValueTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontControlValueTable then
  with TTrueTypeFontControlValueTable(Dest) do
   begin
    FControlValues := Self.FControlValues;
   end
 else inherited;
end;

class function TTrueTypeFontControlValueTable.GetTableType: TTableType;
begin
 Result := 'cvt ';
end;

procedure TTrueTypeFontControlValueTable.ResetToDefaults;
begin
 SetLength(FControlValues, 0);
end;

function TTrueTypeFontControlValueTable.GetControlValue(
  Index: Integer): SmallInt;
begin
 if (Index < Length(FControlValues))
  then Result := Swap16(FControlValues[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontControlValueTable.GetControlValueCount: Integer;
begin
 Result := Length(FControlValues);
end;

procedure TTrueTypeFontControlValueTable.LoadFromStream(Stream: TStream);
var
  ByteSize : Cardinal;
begin
 with Stream do
  begin
   SetLength(FControlValues, Size div 2);
   ByteSize := Read(FControlValues[0], Length(FControlValues) * SizeOf(Word));
   if ByteSize < Length(FControlValues) * SizeOf(Word)
    then raise EPascalTypeError.Create(RCStrTableIncomplete);
  end;
end;

procedure TTrueTypeFontControlValueTable.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   Write(FControlValues, Length(FControlValues) * SizeOf(Word));
  end;
end;



{ TCustomTrueTypeFontInstructionTable }

constructor TCustomTrueTypeFontInstructionTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TCustomTrueTypeFontInstructionTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TCustomTrueTypeFontInstructionTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TCustomTrueTypeFontInstructionTable then
  with TCustomTrueTypeFontInstructionTable(Dest) do
   begin
    FInstructions := Self.FInstructions;
   end
 else inherited;
end;

procedure TCustomTrueTypeFontInstructionTable.ResetToDefaults;
begin
 SetLength(FInstructions, 0);
end;

function TCustomTrueTypeFontInstructionTable.GetInstruction(Index: Integer): Byte;
begin
 if (Index < Length(FInstructions))
  then Result := FInstructions[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TCustomTrueTypeFontInstructionTable.GetInstructionCount: Integer;
begin
 Result := Length(FInstructions);
end;

procedure TCustomTrueTypeFontInstructionTable.LoadFromStream(Stream: TStream);
var
  ByteSize : Cardinal;
begin
 with Stream do
  begin
   SetLength(FInstructions, Size);

   ByteSize := Read(FInstructions[0], Length(FInstructions));
   if ByteSize < Length(FInstructions)
    then raise EPascalTypeError.Create(RCStrTableIncomplete);
  end;
end;

procedure TCustomTrueTypeFontInstructionTable.SaveToStream(Stream: TStream);
begin
 with Stream do
  begin
   Write(FInstructions[0], Length(FInstructions));
  end;
end;


{ TTrueTypeFontFontProgramTable }

class function TTrueTypeFontFontProgramTable.GetTableType: TTableType;
begin
 Result := 'fpgm';
end;


{ TTrueTypeFontControlValueProgramTable }

class function TTrueTypeFontControlValueProgramTable.GetTableType: TTableType;
begin
 Result := 'prep';
end;


{ TCustomTrueTypeFontNamePlatform }

procedure TCustomTrueTypeFontNamePlatform.AssignTo(Dest: TPersistent);
begin
 if Dest is TCustomTrueTypeFontNamePlatform then
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
var
  Value16  : Word;
begin
 with Stream do
  begin
   // read encoding ID
   Read(Value16, SizeOf(Word));
   FEncodingID := Swap16(Value16);

   // read language ID
   Read(Value16, SizeOf(Word));
   FLanguageID := Swap16(Value16);

   // read name ID
   Read(Value16, SizeOf(Word));
   FNameID := TNameID(Swap16(Value16));
  end;
end;

procedure TCustomTrueTypeFontNamePlatform.SaveToStream(Stream: TStream);
var
  Value16  : Word;
begin
 with Stream do
  begin
   // write encoding ID
   Value16 := Swap16(FEncodingID);
   Write(Value16, SizeOf(Word));

   // write language ID
   Value16 := Swap16(FLanguageID);
   Write(Value16, SizeOf(Word));

   // write name ID
   Value16 := Swap16(Word(FNameID));
   Write(Value16, SizeOf(Word));
  end;
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
  Value16    : Word;
  StrOffset  : Integer;
begin
 with Stream do
  begin
   // reset name string
   FNameString := '';

   // actually read the string
   for StrOffset := 0 to Length div 2 - 1 do
    begin
     Read(Value16, SizeOf(Word));
     Value16 := Swap16(Value16);
     FNameString := FNameString + WideChar(Value16);
    end;
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
  Value16    : Word;
  StrOffset  : Integer;
begin
 with Stream do
  begin
   // reset name string
   FNameString := '';

   // actually read the string
   for StrOffset := 0 to Length div 2 - 1 do
    begin
     Read(Value16, SizeOf(Word));
     Value16 := Swap16(Value16);
     FNameString := FNameString + WideChar(Value16);
    end;
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
 if Dest is TPascalTypeNameTable then
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
   Read(Value16, SizeOf(Word));
   FFormat := Swap16(Value16);

   if not (FFormat in [0..1])
    then raise EPascalTypeError.Create(RCStrUnknownFormat);

   // internally store number of records
   Read(Value16, SizeOf(Word));
   NumRecords := Swap16(Value16);

   // read storage offset and add to preliminary storage position
   Read(Value16, SizeOf(Word));
   StoragePos := StoragePos + Swap16(Value16);

   // check for minimum table size
   if Position + NumRecords * 12 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // clear current name record list 
   FNameRecords.Clear;

   for NameIndex := 0 to NumRecords - 1 do
    begin
     // read platform ID
     Read(Value16, SizeOf(Word));
     case TPlatformID(Swap16(Value16)) of
          piApple : NameRecord := TTrueTypeFontNamePlatformApple.Create;
        piUnicode : NameRecord := TTrueTypeFontNamePlatformUnicode.Create;
      piMicrosoft : NameRecord := TTrueTypeFontNamePlatformMicrosoft.Create;
      else raise EPascalTypeError.Create(RCStrUnsupportedPlatform);
     end;

     NameRecord.LoadFromStream(Stream);

     // read length
     Read(Value16, SizeOf(Word));
     StrLength := Swap16(Value16);

     // read offset
     Read(Value16, SizeOf(Word));
     StrOffset := Swap16(Value16);

     // store current position and jump to string definition
     OldPosition := Position;
     Position := StoragePos + StrOffset;

     NameRecord.ReadStringFromStream(Stream, StrLength);

     Position := OldPosition;

     // add to name record list
     FNameRecords.Add(NameRecord);
    end;

   // ignore format 1 addition
   if FFormat = 1 then
    begin
     Read(Value16, SizeOf(Word));
     Position := Position + Swap(Value16);
    end;
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

constructor TPascalTypeMaximumProfileTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TPascalTypeMaximumProfileTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TPascalTypeMaximumProfileTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeMaximumProfileTable then
  with TPascalTypeMaximumProfileTable(Dest) do
   begin
    FMaximumProfile := Self.FMaximumProfile;
   end
 else inherited;
end;

class function TPascalTypeMaximumProfileTable.GetTableType: TTableType;
begin
 Result := 'maxp';
end;

procedure TPascalTypeMaximumProfileTable.ResetToDefaults;
begin
 with FMaximumProfile do
  begin
   Version.Value := 1;
   numGlyphs := 0;
   maxPoints := 0;
   maxContours := 0;
   maxCompositePoints := 0;
   maxCompositeContours := 0;
   maxZones := 0;
   maxTwilightPoints := 0;
   maxStorage := 0;
   maxFunctionDefs := 0;
   maxInstructionDefs := 0;
   maxStackElements := 0;
   maxSizeOfInstructions := 0;
   maxComponentElements := 0;
   maxComponentDepth := 0;
  end;
end;

procedure TPascalTypeMaximumProfileTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream, FMaximumProfile do
  begin
   if Position + SizeOf(TMaximumProfile) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   Version := TFixedPoint(Swap32(Value32));

   if Version.Value <> 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read glyphs count
   Read(Value16, SizeOf(Word));
   numGlyphs := Swap16(Value16);

   // read max points
   Read(Value16, SizeOf(Word));
   maxPoints := Swap16(Value16);

   // read max contours
   Read(Value16, SizeOf(Word));
   maxContours := Swap16(Value16);

   // read max composite points
   Read(Value16, SizeOf(Word));
   maxCompositePoints := Swap16(Value16);

   // read max composite contours
   Read(Value16, SizeOf(Word));
   maxCompositeContours := Swap16(Value16);

   // read max zones
   Read(Value16, SizeOf(Word));
   maxZones := Swap16(Value16);

   // read max twilight points
   Read(Value16, SizeOf(Word));
   maxTwilightPoints := Swap16(Value16);

   // read max storage
   Read(Value16, SizeOf(Word));
   maxStorage := Swap16(Value16);

   // read max function defs
   Read(Value16, SizeOf(Word));
   maxFunctionDefs := Swap16(Value16);

   // read max instruction defs
   Read(Value16, SizeOf(Word));
   maxInstructionDefs := Swap16(Value16);

   // read max stack elements
   Read(Value16, SizeOf(Word));
   maxStackElements := Swap16(Value16);

   // read max size of instructions
   Read(Value16, SizeOf(Word));
   maxSizeOfInstructions := Swap16(Value16);

   // read max component elements
   Read(Value16, SizeOf(Word));
   maxComponentElements := Swap16(Value16);

   // read max component depth
   Read(Value16, SizeOf(Word));
   maxComponentDepth := Swap16(Value16);
  end;
end;

procedure TPascalTypeMaximumProfileTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream, FMaximumProfile do
  begin
   // write version
   Value32 := Swap32(Cardinal(Version));
   Write(Value32, SizeOf(TFixedPoint));

   // write glyphs count
   Value16 := Swap16(numGlyphs);
   Write(Value16, SizeOf(Word));

   // write max points
   Value16 := Swap16(maxPoints);
   Write(Value16, SizeOf(Word));

   // write max contours
   Value16 := Swap16(maxContours);
   Write(Value16, SizeOf(Word));

   // write max composite points
   Value16 := Swap16(maxCompositePoints);
   Write(Value16, SizeOf(Word));

   // write max composite contours
   Value16 := Swap16(maxCompositeContours);
   Write(Value16, SizeOf(Word));

   // write max zones
   Value16 := Swap16(maxZones);
   Write(Value16, SizeOf(Word));

   // write max twilight points
   Value16 := Swap16(maxTwilightPoints);
   Write(Value16, SizeOf(Word));

   // write max storage
   Value16 := Swap16(maxStorage);
   Write(Value16, SizeOf(Word));

   // write max function defs
   Value16 := Swap16(maxFunctionDefs);
   Write(Value16, SizeOf(Word));

   // write max instruction defs
   Value16 := Swap16(maxInstructionDefs);
   Write(Value16, SizeOf(Word));

   // write max stack elements
   Value16 := Swap16(maxStackElements);
   Write(Value16, SizeOf(Word));

   // write max size of instructions
   Value16 := Swap16(maxSizeOfInstructions);
   Write(Value16, SizeOf(Word));

   // write max component elements
   Value16 := Swap16(maxComponentElements);
   Write(Value16, SizeOf(Word));

   // write max component depth
   Value16 := Swap16(maxComponentDepth);
   Write(Value16, SizeOf(Word));
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxComponentDepth(
  const Value: Word);
begin
 if FMaximumProfile.maxComponentDepth <> Value then
  begin
   FMaximumProfile.maxComponentDepth := Value;
   MaxComponentDepthChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxComponentElements(
  const Value: Word);
begin
 if FMaximumProfile.maxComponentElements <> Value then
  begin
   FMaximumProfile.maxComponentElements := Value;
   MaxComponentElementsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxCompositeContours(
  const Value: Word);
begin
 if FMaximumProfile.maxCompositeContours <> Value then
  begin
   FMaximumProfile.maxCompositeContours := Value;
   MaxCompositeContoursChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxCompositePoints(
  const Value: Word);
begin
 if FMaximumProfile.maxCompositePoints <> Value then
  begin
   FMaximumProfile.maxCompositePoints := Value;
   MaxCompositePointsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxContours(const Value: Word);
begin
 if FMaximumProfile.maxContours <> Value then
  begin
   FMaximumProfile.maxContours := Value;
   MaxContoursChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxFunctionDefs(
  const Value: Word);
begin
 if FMaximumProfile.maxFunctionDefs <> Value then
  begin
   FMaximumProfile.maxFunctionDefs := Value;
   MaxFunctionDefsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxInstructionDefs(
  const Value: Word);
begin
 if FMaximumProfile.maxInstructionDefs <> Value then
  begin
   FMaximumProfile.maxInstructionDefs := Value;
   MaxInstructionDefsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxPoints(const Value: Word);
begin
 if FMaximumProfile.maxPoints <> Value then
  begin
   FMaximumProfile.maxPoints := Value;
   MaxPointsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxSizeOfInstructions(
  const Value: Word);
begin
 if FMaximumProfile.maxSizeOfInstructions <> Value then
  begin
   FMaximumProfile.maxSizeOfInstructions := Value;
   MaxSizeOfInstructionsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxStackElements(
  const Value: Word);
begin
 if FMaximumProfile.maxStackElements <> Value then
  begin
   FMaximumProfile.maxStackElements := Value;
   MaxStackElementsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxStorage(const Value: Word);
begin
 if FMaximumProfile.maxStorage <> Value then
  begin
   FMaximumProfile.maxStorage := Value;
   MaxStorageChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxTwilightPoints(
  const Value: Word);
begin
 if FMaximumProfile.maxTwilightPoints <> Value then
  begin
   FMaximumProfile.maxTwilightPoints := Value;
   MaxTwilightPointsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetMaxZones(const Value: Word);
begin
 if FMaximumProfile.maxZones <> Value then
  begin
   FMaximumProfile.maxZones := Value;
   MaxZonesChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetNumGlyphs(const Value: Word);
begin
 if FMaximumProfile.numGlyphs <> Value then
  begin
   FMaximumProfile.numGlyphs := Value;
   NumGlyphsChanged;
  end;
end;

procedure TPascalTypeMaximumProfileTable.SetVersion(const Value: TFixedPoint);
begin
 if (FMaximumProfile.Version.Fract <> Value.Fract) or
    (FMaximumProfile.Version.Value <> Value.Value) then
  begin
   FMaximumProfile.Version := Value;
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


{ TTrueTypeFontOS2Table }

constructor TTrueTypeFontOS2Table.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TTrueTypeFontOS2Table.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TTrueTypeFontOS2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeNameTable then
  with TPascalTypeNameTable(Dest) do
   begin
    FOS2Table := Self.FOS2Table;
   end
 else inherited;
end;

class function TTrueTypeFontOS2Table.GetTableType: TTableType;
begin
 Result := 'OS/2';
end;

procedure TTrueTypeFontOS2Table.ResetToDefaults;
begin
 with FOS2Table do
  begin
   Version := 0;
   XAvgCharWidth := 0;
   UsWeightClass := wcNormal;
   UsWidthClass := wcMediumNormal;
   FsType := 0;
   YSubscriptXSize := 0;
   YSubscriptYSize := 0;
   YSubScriptXOffset := 0;
   YSubscriptYOffset := 0;
   YSuperscriptXSize := 0;
   YSuperscriptYSize := 0;
   YSuperscriptXOffset := 0;
   YSuperscriptYOffset := 0;
   YStrikeoutSize := 0;
   YStrikeoutPosition := 0;
   SFamilyClass := 0;
   FillChar(Panose, 10, 0);
   FillChar(UlUnicodeRange, 4, 0);
   AchVendID := #0#0#0#0;
   FsSelection := 0;
   UsFirstCharIndex := 0;
   UsLastCharIndex := 0;
   STypoAscender := 0;
   STypoDescender := 0;
   STypoLineGap := 0;
   UsWinAscent := 0;
   UsWinDescent := 0;
  end;
end;

procedure TTrueTypeFontOS2Table.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream, FOS2Table do
  begin
   if Position + SizeOf(TOS2Table) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value16, SizeOf(Word));
   Version := Swap16(Value16);

   // check version
   if not (Version in [0..3])
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);


   // read XAvgCharWidth
   Read(Value16, SizeOf(Word));
   XAvgCharWidth := Swap16(Value16);

   // read UsWeightClass
   Read(Value16, SizeOf(Word));
//   UsWeightClass := Swap16(Value16);

   // read UsWidthClass
   Read(Value16, SizeOf(Word));
//   UsWidthClass := Swap16(Value16);

   // read FsType
   Read(Value16, SizeOf(Word));
   FsType := Swap16(Value16);

   // read YSubscriptXSize
   Read(Value16, SizeOf(Word));
   YSubscriptXSize := Swap16(Value16);

   // read YSubscriptYSize
   Read(Value16, SizeOf(Word));
   YSubscriptYSize := Swap16(Value16);

   // read YSubScriptXOffset
   Read(Value16, SizeOf(Word));
   YSubScriptXOffset := Swap16(Value16);

   // read YSubscriptYOffset
   Read(Value16, SizeOf(Word));
   YSubscriptYOffset := Swap16(Value16);

   // read YSuperscriptXSize
   Read(Value16, SizeOf(Word));
   YSuperscriptXSize := Swap16(Value16);

   // read YSuperscriptYSize
   Read(Value16, SizeOf(Word));
   YSuperscriptYSize := Swap16(Value16);

   // read YSuperscriptXOffset
   Read(Value16, SizeOf(Word));
   YSuperscriptXOffset := Swap16(Value16);

   // read YSuperscriptYOffset
   Read(Value16, SizeOf(Word));
   YSuperscriptYOffset := Swap16(Value16);

   // read YStrikeoutSize
   Read(Value16, SizeOf(Word));
   YStrikeoutSize := Swap16(Value16);

   // read YStrikeoutPosition
   Read(Value16, SizeOf(Word));
   YStrikeoutPosition := Swap16(Value16);

   // read SFamilyClass
   Read(Value16, SizeOf(Word));
   SFamilyClass := Swap16(Value16);

   // read Panose
   Read(Panose, 10);

   // read UlUnicodeRange
   Read(UlUnicodeRange, 4 * SizeOf(Cardinal));

   // read AchVendID
   Read(AchVendID, 4);

   // read FsSelection
   Read(Value16, SizeOf(Word));
   FsSelection := Swap16(Value16);

   // read UsFirstCharIndex
   Read(Value16, SizeOf(Word));
   UsFirstCharIndex := Swap16(Value16);

   // read UsLastCharIndex
   Read(Value16, SizeOf(Word));
   UsLastCharIndex := Swap16(Value16);

   // read STypoAscender
   Read(Value16, SizeOf(Word));
   STypoAscender := Swap16(Value16);

   // read STypoDescender
   Read(Value16, SizeOf(Word));
   STypoDescender := Swap16(Value16);

   // read STypoLineGap
   Read(Value16, SizeOf(Word));
   STypoLineGap := Swap16(Value16);

   // read UsWinAscent
   Read(Value16, SizeOf(Word));
   UsWinAscent := Swap16(Value16);

   // read UsWinDescent
   Read(Value16, SizeOf(Word));
   UsWinDescent := Swap16(Value16);
  end;
end;

procedure TTrueTypeFontOS2Table.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream, FOS2Table do
  begin
   // write version
   Value16 := Swap16(Version);
   Write(Value16, SizeOf(Word));

   // write XAvgCharWidth
   Value16 := Swap16(XAvgCharWidth);
   Write(Value16, SizeOf(Word));

   // write UsWeightClass
//   UsWeightClass := Swap16(Value16);
   Write(Value16, SizeOf(Word));

   // write UsWidthClass
//   UsWidthClass := Swap16(Value16);
   Write(Value16, SizeOf(Word));

   // write FsType
   Value16 := Swap16(FsType);
   Write(Value16, SizeOf(Word));

   // write YSubscriptXSize
   Value16 := Swap16(YSubscriptXSize);
   Write(Value16, SizeOf(Word));

   // write YSubscriptYSize
   Value16 := Swap16(YSubscriptYSize);
   Write(Value16, SizeOf(Word));

   // write YSubScriptXOffset
   Value16 := Swap16(YSubScriptXOffset);
   Write(Value16, SizeOf(Word));

   // write YSubscriptYOffset
   Value16 := Swap16(YSubscriptYOffset);
   Write(Value16, SizeOf(Word));

   // write YSuperscriptXSize
   Value16 := Swap16(YSuperscriptXSize);
   Write(Value16, SizeOf(Word));

   // write YSuperscriptYSize
   Value16 := Swap16(YSuperscriptYSize);
   Write(Value16, SizeOf(Word));

   // write YSuperscriptXOffset
   Value16 := Swap16(YSuperscriptXOffset);
   Write(Value16, SizeOf(Word));

   // write YSuperscriptYOffset
   Value16 := Swap16(YSuperscriptYOffset);
   Write(Value16, SizeOf(Word));

   // write YStrikeoutSize
   Value16 := Swap16(YStrikeoutSize);
   Write(Value16, SizeOf(Word));

   // write YStrikeoutPosition
   Value16 := Swap16(YStrikeoutPosition);
   Write(Value16, SizeOf(Word));

   // write SFamilyClass
   Value16 := Swap16(SFamilyClass);
   Write(Value16, SizeOf(Word));

   // read Panose
   Write(Panose, 10);

   // read UlUnicodeRange
   Write(UlUnicodeRange, 4 * SizeOf(Cardinal));

   // read AchVendID
   Write(AchVendID, 4);

   // write FsSelection
   Value16 := Swap16(FsSelection);
   Write(Value16, SizeOf(Word));

   // write UsFirstCharIndex
   Value16 := Swap16(UsFirstCharIndex);
   Write(Value16, SizeOf(Word));

   // write UsLastCharIndex
   Value16 := Swap16(UsLastCharIndex);
   Write(Value16, SizeOf(Word));

   // write STypoAscender
   Value16 := Swap16(STypoAscender);
   Write(Value16, SizeOf(Word));

   // write STypoDescender
   Value16 := Swap16(STypoDescender);
   Write(Value16, SizeOf(Word));

   // write STypoLineGap
   Value16 := Swap16(STypoLineGap);
   Write(Value16, SizeOf(Word));

   // write UsWinAscent
   Value16 := Swap16(UsWinAscent);
   Write(Value16, SizeOf(Word));

   // write UsWinDescent
   Value16 := Swap16(UsWinDescent);
   Write(Value16, SizeOf(Word));
  end;
end;

procedure TTrueTypeFontOS2Table.SetAchVendID(const Value: TTableType);
begin
 if FOS2Table.AchVendID <> Value then
  begin
   FOS2Table.AchVendID := Value;
   AchVendIDChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetFsSelection(const Value: Word);
begin
 if FOS2Table.FsSelection <> Value then
  begin
   FOS2Table.FsSelection := Value;
   FsSelectionChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetFsType(const Value: SmallInt);
begin
 if FOS2Table.FsType <> Value then
  begin
   FOS2Table.FsType := Value;
   FsTypeChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetSFamilyClass(const Value: SmallInt);
begin
 if FOS2Table.SFamilyClass <> Value then
  begin
   FOS2Table.SFamilyClass := Value;
   SFamilyClassChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetSTypoAscender(const Value: SmallInt);
begin
 if FOS2Table.STypoAscender <> Value then
  begin
   FOS2Table.STypoAscender := Value;
   STypoAscenderChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetSTypoDescender(const Value: SmallInt);
begin
 if FOS2Table.STypoDescender <> Value then
  begin
   FOS2Table.STypoDescender := Value;
   STypoDescenderChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetSTypoLineGap(const Value: SmallInt);
begin
 if FOS2Table.STypoLineGap <> Value then
  begin
   FOS2Table.STypoLineGap := Value;
   STypoLineGapChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetUsFirstCharIndex(const Value: Word);
begin
 if FOS2Table.UsFirstCharIndex <> Value then
  begin
   FOS2Table.UsFirstCharIndex := Value;
   UsFirstCharIndexChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetUsLastCharIndex(const Value: Word);
begin
 if FOS2Table.UsLastCharIndex <> Value then
  begin
   FOS2Table.UsLastCharIndex := Value;
   UsLastCharIndexChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetUsWeightClass(const Value: TOS2WeightClass);
begin
 if FOS2Table.UsWeightClass <> Value then
  begin
   FOS2Table.UsWeightClass := Value;
   UsWeightClassChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetUsWidthClass(const Value: TOS2WidthClass);
begin
 if FOS2Table.UsWidthClass <> Value then
  begin
   FOS2Table.UsWidthClass := Value;
   UsWidthClassChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetUsWinAscent(const Value: Word);
begin
 if FOS2Table.UsWinAscent <> Value then
  begin
   FOS2Table.UsWinAscent := Value;
   UsWinAscentChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetUsWinDescent(const Value: Word);
begin
 if FOS2Table.UsWinDescent <> Value then
  begin
   FOS2Table.UsWinDescent := Value;
   UsWinDescentChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetXAvgCharWidth(const Value: SmallInt);
begin
 if FOS2Table.XAvgCharWidth <> Value then
  begin
   FOS2Table.XAvgCharWidth := Value;
   XAvgCharWidthChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYStrikeoutPosition(const Value: SmallInt);
begin
 if FOS2Table.YStrikeoutPosition <> Value then
  begin
   FOS2Table.YStrikeoutPosition := Value;
   YStrikeoutPositionChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYStrikeoutSize(const Value: SmallInt);
begin
 if FOS2Table.YStrikeoutSize <> Value then
  begin
   FOS2Table.YStrikeoutSize := Value;
   YStrikeoutSizeChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSubScriptXOffset(const Value: SmallInt);
begin
 if FOS2Table.YSubScriptXOffset <> Value then
  begin
   FOS2Table.YSubScriptXOffset := Value;
   YSubScriptXOffsetChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSubscriptXSize(const Value: SmallInt);
begin
 if FOS2Table.YSubscriptXSize <> Value then
  begin
   FOS2Table.YSubscriptXSize := Value;
   YSubscriptXSizeChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSubscriptYOffset(const Value: SmallInt);
begin
 if FOS2Table.YSubscriptYOffset <> Value then
  begin
   FOS2Table.YSubscriptYOffset := Value;
   YSubscriptYOffsetChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSubscriptYSize(const Value: SmallInt);
begin
 if FOS2Table.YSubscriptYSize <> Value then
  begin
   FOS2Table.YSubscriptYSize := Value;
   YSubscriptYSizeChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSuperscriptXOffset(const Value: SmallInt);
begin
 if FOS2Table.YSuperscriptXOffset <> Value then
  begin
   FOS2Table.YSuperscriptXOffset := Value;
   YSuperscriptXOffsetChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSuperscriptXSize(const Value: SmallInt);
begin
 if FOS2Table.YSuperscriptXSize <> Value then
  begin
   FOS2Table.YSuperscriptXSize := Value;
   YSuperscriptXSizeChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSuperscriptYOffset(const Value: SmallInt);
begin
 if FOS2Table.YSuperscriptYOffset <> Value then
  begin
   FOS2Table.YSuperscriptYOffset := Value;
   YSuperscriptYOffsetChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetYSuperscriptYSize(const Value: SmallInt);
begin
 if FOS2Table.YSuperscriptYSize <> Value then
  begin
   FOS2Table.YSuperscriptYSize := Value;
   YSuperscriptYSizeChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.SetVersion(const Value: Word);
begin
 if FOS2Table.Version <> Value then
  begin
   FOS2Table.Version := Value;
   VersionChanged;
  end;
end;

procedure TTrueTypeFontOS2Table.AchVendIDChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.FsSelectionChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.FsTypeChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.SFamilyClassChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.STypoAscenderChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.STypoDescenderChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.STypoLineGapChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.UsFirstCharIndexChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.UsLastCharIndexChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.UsWeightClassChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.UsWidthClassChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.UsWinAscentChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.UsWinDescentChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.VersionChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.XAvgCharWidthChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YStrikeoutPositionChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YStrikeoutSizeChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSubScriptXOffsetChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSubscriptXSizeChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSubscriptYOffsetChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSubscriptYSizeChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSuperscriptXOffsetChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSuperscriptXSizeChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSuperscriptYOffsetChanged;
begin
 Changed;
end;

procedure TTrueTypeFontOS2Table.YSuperscriptYSizeChanged;
begin
 Changed;
end;


{ TPascalTypePostscriptTable }

constructor TPascalTypePostscriptTable.Create;
begin
 // nothing in here yet
 inherited;
end;

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
 if Dest is TPascalTypePostscriptTable then
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
       then FPostscriptV2Table := TTrueTypeFontPostscriptVersion2Table.Create;
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
  Value16 : Word;
begin
 with Stream do
  begin
   if Position + 32 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read format type
   Read(Value32, SizeOf(Cardinal));
   FVersion := TFixedPoint(Swap32(Value32));

   // read italic angle
   Read(Value32, SizeOf(Cardinal));
   FItalicAngle := TFixedPoint(Swap32(Value32));

   // read underline position
   Read(Value16, SizeOf(Word));
   FUnderlinePosition := Swap16(Value16);

   // read underline thickness
   Read(Value16, SizeOf(Word));
   FUnderlineThickness := Swap16(Value16);

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
      then FPostscriptV2Table := TTrueTypeFontPostscriptVersion2Table.Create;
     FPostscriptV2Table.LoadFromStream(Stream);
    end;
  end;
end;

procedure TPascalTypePostscriptTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream do
  begin
   // write format type
   Value32 := Swap32(Cardinal(FVersion));
   Write(Value32, SizeOf(Cardinal));

   // write italic angle
   Value32 := Swap32(Cardinal(FItalicAngle));
   Write(Value32, SizeOf(Cardinal));

   // write underline position
   Value16 := Swap16(FUnderlinePosition);
   Write(Value16, SizeOf(Word));

   // write underline thickness
   Value16 := Swap16(FUnderlineThickness);
   Write(Value16, SizeOf(Word));

   // write is fixed pitch
   Value32 := Swap32(FIsFixedPitch);
   Write(Value32, SizeOf(Cardinal));

   // write minimum memory usage (type 42)
   Value32 := Swap32(FMinMemType42);
   Write(Value32, SizeOf(Cardinal));

   // write maximum memory usage (type 42)
   Value32 := Swap32(FMaxMemType42);
   Write(Value32, SizeOf(Cardinal));

   // write minimum memory usage (type 1)
   Value32 := Swap32(FMinMemType1);
   Write(Value32, SizeOf(Cardinal));

   // write maximum memory usage (type 1)
   Value32 := Swap32(FMaxMemType1);
   Write(Value32, SizeOf(Cardinal));
  end;
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


{ TTrueTypeFontPostscriptVersion2Table }

constructor TTrueTypeFontPostscriptVersion2Table.Create;
begin
 inherited;
end;

destructor TTrueTypeFontPostscriptVersion2Table.Destroy;
begin
 inherited;
end;

function TTrueTypeFontPostscriptVersion2Table.GetGlyphIndexCount: Integer;
begin
 Result := Length(FGlyphNameIndex);
end;

function TTrueTypeFontPostscriptVersion2Table.GlyphIndexToString(
  GlyphIndex: Integer): string;
begin
 if FGlyphNameIndex[GlyphIndex] < 258
  then Result := DefaultGlyphName(FGlyphNameIndex[GlyphIndex])
  else Result := FNames[FGlyphNameIndex[GlyphIndex] - 258];
end;

procedure TTrueTypeFontPostscriptVersion2Table.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontPostscriptVersion2Table then
  with TTrueTypeFontPostscriptVersion2Table(Dest) do
   begin
    FGlyphNameIndex := Self.FGlyphNameIndex;
    FNames := Self.FNames;
   end else inherited;
end;

procedure TTrueTypeFontPostscriptVersion2Table.ResetToDefaults;
begin
 SetLength(FGlyphNameIndex, 0);
 SetLength(FNames, 0);
end;

procedure TTrueTypeFontPostscriptVersion2Table.LoadFromStream(Stream: TStream);
var
  GlyphIndex : Integer;
  Value16    : Word;
  Value8     : Byte;
begin
 with Stream do
  begin
   // check for minimum size
   if Position + 2 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // load number of glyphs
   Read(Value16, SizeOf(Word));
   SetLength(FGlyphNameIndex, Swap16(Value16));

   for GlyphIndex := 0 to Length(FGlyphNameIndex) - 1 do
    begin
     Read(Value16, SizeOf(Word));
     FGlyphNameIndex[GlyphIndex] := Swap16(Value16);
    end;

   while Position < Size do
    begin
     Read(Value8, SizeOf(Byte));
     SetLength(FNames, Length(FNames) + 1);
     SetLength(FNames[Length(FNames) - 1], Value8);
     Read(FNames[Length(FNames) - 1][1], Value8);
    end;
  end;
end;

procedure TTrueTypeFontPostscriptVersion2Table.SaveToStream(Stream: TStream);
begin
 raise EPascalTypeError.Create('yet todo!')
end;


////////////////////////////////////////////////////////////////////////////////

function IsTrueTypeFontTableRegistered(TableClass: TCustomPascalTypeNamedTableClass): Boolean;
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

procedure RegisterTrueTypeFontTable(TableClass: TCustomPascalTypeNamedTableClass);
begin
 Assert(IsTrueTypeFontTableRegistered(TableClass) = False);
 SetLength(GTableClasses, Length(GTableClasses) + 1);
 GTableClasses[Length(GTableClasses) - 1] := TableClass;
end;

procedure RegisterTrueTypeFontTables(TableClasses: array of TCustomPascalTypeNamedTableClass);
var
  TableClassIndex : Integer;
begin
 for TableClassIndex := 0 to Length(TableClasses) - 1
  do RegisterTrueTypeFontTable(TableClasses[TableClassIndex]);
end;

function FindTrueTypeFontTableByType(TableType: TTableType): TCustomPascalTypeNamedTableClass;
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
  RegisterTrueTypeFontTables([TPascalTypeHeaderTable,
    TPascalTypeCharacterMapTable, TPascalTypeHorizontalHeaderTable,
    TPascalTypeHorizontalMetricsTable, TPascalTypeNameTable,
    TPascalTypeMaximumProfileTable, TPascalTypePostscriptTable,
    TTrueTypeFontGlyphDataTable, TTrueTypeFontLocationTable,
    TTrueTypeFontControlValueTable, TTrueTypeFontFontProgramTable,
    TTrueTypeFontControlValueProgramTable, TTrueTypeFontOS2Table]);

end.
