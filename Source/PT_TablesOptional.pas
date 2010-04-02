unit PT_TablesOptional;

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
  Classes, Contnrs, PT_Types, PT_Tables;

type

  // table 'DSIG'
  TPascalTypeDigitalSignatureBlock = class(TCustomPascalTypeTable)
  private
    FReserved  : array [0..1] of Word; // Reserved for later use; 0 for now
    FSignature : array of Byte;        // PKCS#7 packet
    FFormat    : Cardinal;
    function GetSignatureByte(Index: Integer): Byte;
    function GetSignatureLength: Cardinal;
    procedure SetReserved(const Index: Integer; const Value: Word);
    procedure SetFormat(const Value: Cardinal);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure FormatChanged; virtual;
    procedure ReservedChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property SignatureLength: Cardinal read GetSignatureLength;
    property SignatureByte[Index: Integer]: Byte read GetSignatureByte;
    property Reserved1: Word index 0 read FReserved[0] write SetReserved;
    property Reserved2: Word index 1 read FReserved[1] write SetReserved;
    property Format: Cardinal read FFormat write SetFormat;
  end;

  TDigitalSignatureDirectory = packed record
    Format : Cardinal; // Format of the signature
    Length : Cardinal; // Length of signature in bytes
    Offset : Cardinal; // Offset to the signature block from the beginning of the table
  end;

  TPascalTypeDigitalSignatureTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion    : Cardinal; // Version number of the DSIG table (0x00000001)
    FFlags      : TDigitalSignatureFlags; // Permission flags: Bit 0: cannot be resigned, Bits 1-7: Reserved (Set to 0)
    FSignatures : TObjectList;
    procedure SetVersion(const Value: Cardinal);
    procedure SetFlags(const Value: TDigitalSignatureFlags);
    function GetSignatureCount: Integer;
    function GetSignatureBlock(Index: Integer): TPascalTypeDigitalSignatureBlock;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure FlagsChanged; virtual;
    procedure VersionChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Cardinal read FVersion write SetVersion;
    property Flags: TDigitalSignatureFlags read FFlags write SetFlags;
    property SignatureCount: Integer read GetSignatureCount;
    property SignatureBlock[Index: Integer]: TPascalTypeDigitalSignatureBlock read GetSignatureBlock;
  end;


  // table 'gasp'

const
  Gasp_GridFit = 1;
  Gasp_DoGray  = 2;

type
  TGaspRange = record
    MaxPPEM  : Byte;
    GaspFlag : Byte;
  end;

  TPascalTypeGridFittingAndScanConversionProcedureTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion    : Word;
    FGaspRanges : array of TGaspRange;
    procedure SetVersion(const Value: Word);
    function GetRangeCount: Integer;
    function GetRange(Index: Integer): TGaspRange;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure VersionChanged; virtual;
    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property RangeCount: Integer read GetRangeCount;
    property Range[Index: Integer]: TGaspRange read GetRange;
  end;


  // table 'hdmx'

  TPascalTypeHorizontalDeviceMetricsSubTable = class(TCustomPascalTypeInterfaceTable)
  private
    Fppem     : Byte;
    FMaxWidth : Byte;
    FWidths   : array of Byte;
    function GetWidth(Index: Integer): Byte;
    procedure SetMaxWidth(const Value: Byte);
    procedure Setppem(const Value: Byte);
    procedure MaxWidthChanged;
    procedure ppemChanged;
    function GetWidthCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property ppem: Byte read Fppem write Setppem;
    property MaxWidth: Byte read FMaxWidth write SetMaxWidth;
    property Width[Index: Integer]: Byte read GetWidth;
    property WidthCount: Integer read GetWidthCount;
  end;

  TPascalTypeHorizontalDeviceMetricsTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion   : Word;         // Table version number (0)
    FSubtables : TObjectList;
    procedure SetVersion(const Value: Word);
    function GetDeviceRecordCount: Word;
    function GetDeviceRecord(Index: Word): TPascalTypeHorizontalDeviceMetricsSubTable;
    procedure SetDeviceRecord(Index: Word; const Value: TPascalTypeHorizontalDeviceMetricsSubTable);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property DeviceRecordCount: Word read GetDeviceRecordCount;
    property DeviceRecord[Index: Word]: TPascalTypeHorizontalDeviceMetricsSubTable read GetDeviceRecord write SetDeviceRecord;
  end;


  // table 'kern'
  TCustomPascalTypeKerningFormatSubTable = class(TCustomPascalTypeTable)
  public
    function GetKerningValue(LeftGlyphIndex, RightGlyphIndex: Word): Word; virtual; abstract;
  end;
  TCustomPascalTypeKerningFormatSubTableClass = class of TCustomPascalTypeKerningFormatSubTable;

  TKerningFormat0SubTable = packed record
    Left  : Word; // The glyph index for the left-hand glyph in the kerning pair.
    Right : Word; // The glyph index for the right-hand glyph in the kerning pair.
    Value : SmallInt; // The kerning value for the above pair, in FUnits. If this value is greater than zero, the characters will be moved apart. If this value is less than zero, the character will be moved closer together.
  end;

  TPascalTypeKerningFormat0SubTable = class(TCustomPascalTypeKerningFormatSubTable)
  private
    FPairs : array of TKerningFormat0SubTable;
    function GetPairCount: Integer;
    function GetPair(Index: Integer): TKerningFormat0SubTable;
  protected
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    function GetKerningValue(LeftGlyphIndex: Word; RightGlyphIndex: Word): Word;
      override;

    property PairCount: Integer read GetPairCount;
    property Pair[Index: Integer]: TKerningFormat0SubTable read GetPair;
  end;

  TPascalTypeKerningFormat2SubTable = class(TCustomPascalTypeKerningFormatSubTable)
  protected
    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TPascalTypeKerningSubTable = class(TCustomPascalTypeTable)
  private
    FVersion     : Word;
    FLength      : Word;
    FCoverage    : Word;
    FFormatTable : TCustomPascalTypeKerningFormatSubTable;
    function GetFormat: Byte;
    function GetIsCrossStream: Boolean;
    function GetIsHorizontal: Boolean;
    function GetIsMinimum: Boolean;
    function GetIsReplace: Boolean;
    procedure SetFormat(const Value: Byte);
    procedure SetIsCrossStream(const Value: Boolean);
    procedure SetIsHorizontal(const Value: Boolean);
    procedure SetIsMinimum(const Value: Boolean);
    procedure SetIsReplace(const Value: Boolean);
    procedure SetVersion(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure AssignFormat; virtual;
    procedure CoverageChanged; virtual;
    procedure FormatChanged; virtual;
    procedure IsCrossStreamChanged; virtual;
    procedure IsHorizontalChanged; virtual;
    procedure IsMinimumChanged; virtual;
    procedure IsReplaceChanged; virtual;
    procedure VersionChanged; virtual;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property Length: Word read FLength;
    property Coverage: Word read FCoverage;

    property IsHorizontal: Boolean read GetIsHorizontal write SetIsHorizontal;
    property IsMinimum: Boolean read GetIsMinimum write SetIsMinimum;
    property IsCrossStream: Boolean read GetIsCrossStream write SetIsCrossStream;
    property IsReplace: Boolean read GetIsReplace write SetIsReplace;
    property Format: Byte read GetFormat write SetFormat;

    property FormatTable: TCustomPascalTypeKerningFormatSubTable read FFormatTable;
  end;

  TPascalTypeKerningTable = class(TCustomPascalTypeNamedTable)
  private
    FKerningSubtableList : TObjectList;
    FVersion             : Word;
    procedure SetVersion(const Value: Word);
    function GetKerningSubtableCount: Integer;
    function GetKerningSubtable(Index: Integer): TPascalTypeKerningSubTable;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    procedure VersionChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;

    property KerningSubtable[Index: Integer]: TPascalTypeKerningSubTable read GetKerningSubtable;
    property KerningSubtableCount: Integer read GetKerningSubtableCount;
  end;


  // table 'LTSH'

  TPascalTypeLinearThresholdTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion      : Word;
    FVerticalPels : array of Byte; // The vertical pel height at which the glyph can be assumed to scale linearly. On a per glyph basis.
    function GetVerticalPelCount: Integer;
    function GetVerticalPel(Index: Integer): Byte;
    procedure SetVersion(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property VerticalPelCount: Integer read GetVerticalPelCount;
    property VerticalPel[Index: Integer]: Byte read GetVerticalPel;
  end;


  // table 'PCLT'

  TPascalTypePCL5Table = class(TCustomPascalTypeNamedTable)
  private
    FVersion             : TFixedPoint;
    FFontNumber          : TPcl5FontNumber;
    FPitch               : Word;
    FXHeight             : Word;
    FStyle               : Word;
    FTypeFamily          : Word;
    FCapHeight           : Word;
    FSymbolSet           : Word;
    FTypeface            : array [0..15] of AnsiChar;
    FCharacterComplement : array [0..7] of AnsiChar;
    FFileName            : array [0..5] of AnsiChar;
    FStrokeWeight        : AnsiChar;
    FWidthType           : AnsiChar;
    FSerifStyle          : Byte;
    FPadding             : Byte; // Reserved (set to 0)
    function GetCharacterComplement: string;
    function GetFileName: string;
    function GetTypeface: string;
    procedure SetVersion(const Value: TFixedPoint);
    procedure SetCapHeight(const Value: Word);
    procedure SetFontNumber(const Value: TPcl5FontNumber);
    procedure SetPadding(const Value: Byte);
    procedure SetPitch(const Value: Word);
    procedure SetSerifStyle(const Value: Byte);
    procedure SetStrokeWeight(const Value: AnsiChar);
    procedure SetStyle(const Value: Word);
    procedure SetSymbolSet(const Value: Word);
    procedure SetTypeFamily(const Value: Word);
    procedure SetWidthType(const Value: AnsiChar);
    procedure SetXHeight(const Value: Word);
    procedure SetCharacterComplement(const Value: string);
    procedure SetFileName(const Value: string);
    procedure SetTypeface(const Value: string);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
    procedure CapHeightChanged; virtual;
    procedure FontNumberChanged; virtual;
    procedure PaddingChanged; virtual;
    procedure PitchChanged; virtual;
    procedure SerifStyleChanged; virtual;
    procedure StrokeWeightChanged; virtual;
    procedure StyleChanged; virtual;
    procedure SymbolSetChanged; virtual;
    procedure TypeFamilyChanged; virtual;
    procedure WidthTypeChanged; virtual;
    procedure XHeightChanged; virtual;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
    property FontNumber: TPcl5FontNumber read FFontNumber write SetFontNumber;
    property Pitch: Word read FPitch write SetPitch;
    property XHeight: Word read FXHeight write SetXHeight;
    property Style: Word read FStyle write SetStyle;
    property TypeFamily: Word read FTypeFamily write SetTypeFamily;
    property CapHeight: Word read FCapHeight write SetCapHeight;
    property SymbolSet: Word read FSymbolSet write SetSymbolSet;
    property Typeface: string read GetTypeface write SetTypeface;
    property CharacterComplement: string read GetCharacterComplement write SetCharacterComplement;
    property FileName: string read GetFileName write SetFileName;
    property StrokeWeight: AnsiChar read FStrokeWeight write SetStrokeWeight;
    property WidthType: AnsiChar read FWidthType write SetWidthType;
    property SerifStyle: Byte read FSerifStyle write SetSerifStyle;
    property Padding: Byte read FPadding write SetPadding; // Reserved (set to 0 read FPadding write SetPadding)
  end;


  // table 'VDMX'

  TVDMXHeightRecord = packed record
    yPelHeight : Word; // yPelHeight to which values apply.
    yMax : SmallInt; // Maximum value (in pels) for this yPelHeight.
    yMin : SmallInt; // Minimum value (in pels) for this yPelHeight.
  end;

  TPascalTypeVDMXGroupTable = class(TCustomPascalTypeTable)
  private
    FStartsz : Byte; // Starting yPelHeight
    FEndsz   : Byte; // Ending yPelHeight
    FEntry   : array of TVDMXHeightRecord; // The VDMX records
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TVDMXRatioRecord = packed record
    bCharSet    : Byte; // Character set (see below).
    xRatio      : Byte; // Value to use for x-Ratio
    yStartRatio : Byte; // Starting y-Ratio value.
    yEndRatio   : Byte; // Ending y-Ratio value.
  end;

  TPascalTypeVerticalDeviceMetricsTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion : Word; // Version number (0 or 1).
    FRatios  : array of TVDMXRatioRecord;
    FGroups  : TObjectList;
    procedure SetVersion(const Value: Word);
    function GetRatioCount: Word;
    function GetGroupCount: Word;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: Word read FVersion write SetVersion;
    property RatioCount: Word read GetRatioCount;
    property GroupCount: Word read GetGroupCount;
  end;


  // table 'vhea'
  TPascalTypeVerticalHeaderTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion              : TFixedPoint;
    FAscent               : SmallInt; // Distance in FUnits from the centerline to the previous line’s descent.
    FDescent              : SmallInt; // Distance in FUnits from the centerline to the next line’s ascent.
    FLineGap              : SmallInt; // Reserved; set to 0
    FAdvanceHeightMax     : SmallInt; // The maximum advance height measurement -in FUnits found in the font. This value must be consistent with the entries in the vertical metrics table.
    FMinTopSideBearing    : SmallInt; // The minimum top sidebearing measurement found in the font, in FUnits. This value must be consistent with the entries in the vertical metrics table.
    FMinBottomSideBearing : SmallInt; // The minimum bottom sidebearing measurement found in the font, in FUnits. This value must be consistent with the entries in the vertical metrics table.
    FYMaxExtent           : SmallInt; // Defined as yMaxExtent= minTopSideBearing+(yMax-yMin)
    FCaretSlopeRise       : SmallInt; // The value of the caretSlopeRise field divided by the value of the caretSlopeRun Field determines the slope of the caret. A value of 0 for the rise and a value of 1 for the run specifies a horizontal caret. A value of 1 for the rise and a value of 0 for the run specifies a vertical caret. Intermediate values are desirable for fonts whose glyphs are oblique or italic. For a vertical font, a horizontal caret is best.
    FCaretSlopeRun        : SmallInt; // See the caretSlopeRise field. Value=1 for nonslanted vertical fonts.
    FCaretOffset          : SmallInt; // The amount by which the highlight on a slanted glyph needs to be shifted away from the glyph in order to produce the best appearance. Set value equal to 0 for nonslanted fonts.
    FReserved             : Array [0..3] of SmallInt; // Set to 0.
    FMetricDataFormat     : SmallInt;       // Set to 0.
    FNumOfLongVerMetrics  : Word;     // Number of advance heights in the vertical metrics table.

    procedure SetVersion(const Value: TFixedPoint);
    procedure SetAdvanceHeightMax(const Value: SmallInt);
    procedure SetAscent(const Value: SmallInt);
    procedure SetCaretOffset(const Value: SmallInt);
    procedure SetCaretSlopeRise(const Value: SmallInt);
    procedure SetCaretSlopeRun(const Value: SmallInt);
    procedure SetDescent(const Value: SmallInt);
    procedure SetLineGap(const Value: SmallInt);
    procedure SetMetricDataFormat(const Value: SmallInt);
    procedure SetMinBottomSideBearing(const Value: SmallInt);
    procedure SetMinTopSideBearing(const Value: SmallInt);
    procedure SetNumOfLongVerMetrics(const Value: Word);
    procedure SetYMaxExtent(const Value: SmallInt);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    procedure AdvanceHeightMaxChanged; virtual;
    procedure AscentChanged; virtual;
    procedure CaretOffsetChanged; virtual;
    procedure CaretSlopeRiseChanged; virtual;
    procedure CaretSlopeRunChanged; virtual;
    procedure DescentChanged; virtual;
    procedure LineGapChanged; virtual;
    procedure MetricDataFormatChanged; virtual;
    procedure MinBottomSideBearingChanged; virtual;
    procedure MinTopSideBearingChanged; virtual;
    procedure NumOfLongVerMetricsChanged; virtual;
    procedure VersionChanged; virtual;
    procedure YMaxExtentChanged; virtual;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
    property Ascent: SmallInt read FAscent write SetAscent;
    property Descent: SmallInt read FDescent write SetDescent;
    property LineGap: SmallInt read FLineGap write SetLineGap;
    property AdvanceHeightMax: SmallInt read FAdvanceHeightMax write SetAdvanceHeightMax;
    property MinTopSideBearing: SmallInt read FMinTopSideBearing write SetMinTopSideBearing;
    property MinBottomSideBearing: SmallInt read FMinBottomSideBearing write SetMinBottomSideBearing;
    property YMaxExtent: SmallInt read FYMaxExtent write SetYMaxExtent;
    property CaretSlopeRise: SmallInt read FCaretSlopeRise write SetCaretSlopeRise;
    property CaretSlopeRun: SmallInt read FCaretSlopeRun write SetCaretSlopeRun;
    property CaretOffset: SmallInt read FCaretOffset write SetCaretOffset;
    property MetricDataFormat: SmallInt read FMetricDataFormat write SetMetricDataFormat;
    property NumOfLongVerMetrics: Word read FNumOfLongVerMetrics write SetNumOfLongVerMetrics;
  end;


  // table 'vmtx'

  TVerticalMetric = record
    AdvanceHeight  : Word;
    TopSideBearing : SmallInt;
  end;

  TPascalTypeVerticalMetricsTable = class(TCustomPascalTypeNamedTable)
  private
    FVerticalMetrics : array of TVerticalMetric;
    function GetVerticalMetric(Index: Integer): TVerticalMetric;
    function GetVerticalMetricCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property VerticalMetric[Index: Integer]: TVerticalMetric read GetVerticalMetric;
    property VerticalMetricCount: Integer read GetVerticalMetricCount;
  end;


implementation

uses
  Math, SysUtils, PT_ResourceStrings;


{ TPascalTypeDigitalSignatureBlock }

procedure TPascalTypeDigitalSignatureBlock.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeDigitalSignatureBlock(Dest) do
   begin
    FReserved[0] := Self.FReserved[0];
    FReserved[1] := Self.FReserved[1];
    FSignature := Self.FSignature;
   end
 else inherited;
end;

procedure TPascalTypeDigitalSignatureBlock.ResetToDefaults;
begin
 FReserved[0] := 0;
 FReserved[1] := 0;
 SetLength(FSignature, 0);
end;

function TPascalTypeDigitalSignatureBlock.GetSignatureByte(
  Index: Integer): Byte;
begin
 if (Index >= 0) and (Index < Length(FSignature))
  then Result := FSignature[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeDigitalSignatureBlock.GetSignatureLength: Cardinal;
begin
 Result := Length(FSignature);
end;

procedure TPascalTypeDigitalSignatureBlock.LoadFromStream(Stream: TStream);
var
  Value32  : Cardinal;
  Value16  : Word;
begin
 inherited;
 
 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read reserved 1
   Read(Value16, SizeOf(Word));
   FReserved[0] := Swap16(Value16);

   // read reserved 2
   Read(Value16, SizeOf(Word));
   FReserved[1] := Swap16(Value16);

   // read signature length
   Read(Value32, SizeOf(Cardinal));
   SetLength(FSignature, Swap32(Value32));

   // check if table contains the entire signature
   if Position + Length(FSignature) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read signature length
   Read(FSignature[0], Length(FSignature));
  end;
end;

procedure TPascalTypeDigitalSignatureBlock.SaveToStream(Stream: TStream);
var
  Value32  : Cardinal;
  Value16  : Word;
begin
 with Stream do
  begin
   // write reserved 1
   Value16 := Swap16(FReserved[0]);
   Write(Value16, SizeOf(Word));

   // write reserved 2
   Value16 := Swap16(FReserved[1]);
   Write(Value16, SizeOf(Word));

   // write signature length
   Value32 := Swap32(Length(FSignature));
   Write(Value32, SizeOf(Cardinal));

   // write signature length
   Write(FSignature[0], Length(FSignature));
  end;
end;

procedure TPascalTypeDigitalSignatureBlock.SetFormat(const Value: Cardinal);
begin
 if FFormat <> Value then
  begin
   FFormat := Value;
   FormatChanged;
  end;
end;

procedure TPascalTypeDigitalSignatureBlock.SetReserved(const Index: Integer;
  const Value: Word);
begin
 if FReserved[Index] <> Value then
  begin
   FReserved[Index] := Value;
   ReservedChanged;
  end;
end;

procedure TPascalTypeDigitalSignatureBlock.ReservedChanged;
begin
 Changed;
end;

procedure TPascalTypeDigitalSignatureBlock.FormatChanged;
begin
 Changed;
end;


{ TPascalTypeDigitalSignatureTable }

constructor TPascalTypeDigitalSignatureTable.Create;
begin
 FSignatures := TObjectList.Create(True);
 inherited;
end;

destructor TPascalTypeDigitalSignatureTable.Destroy;
begin
 FreeAndNil(FSignatures);
 inherited;
end;

procedure TPascalTypeDigitalSignatureTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeDigitalSignatureTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FFlags := Self.FFlags;
    FSignatures.Assign(Self.FSignatures);
   end
 else inherited;
end;

class function TPascalTypeDigitalSignatureTable.GetTableType: TTableType;
begin
 Result := 'DSIG';
end;

procedure TPascalTypeDigitalSignatureTable.ResetToDefaults;
begin
 FVersion := 1;
 FFlags := [];

 // clear signatures
 FSignatures.Clear;
end;

function TPascalTypeDigitalSignatureTable.GetSignatureBlock(
  Index: Integer): TPascalTypeDigitalSignatureBlock;
begin
 if (Index >= 0) and (Index < SignatureCount)
  then Result := TPascalTypeDigitalSignatureBlock(FSignatures[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeDigitalSignatureTable.GetSignatureCount: Integer;
begin
 Result := FSignatures.Count;
end;

procedure TPascalTypeDigitalSignatureTable.LoadFromStream(Stream: TStream);
var
  StartPos  : Int64;
  DirIndex  : Integer;
  Directory : array of TDigitalSignatureDirectory;
  SigBlock  : TPascalTypeDigitalSignatureBlock;
  Value32   : Cardinal;
  Value16   : Word;
begin
 inherited;
 
 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // store stream start position
   StartPos := Position;

   // read version
   Read(Value32, SizeOf(Cardinal));
   FVersion := Swap32(Value32);

   if Version <> 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read directory entry count
   Read(Value16, SizeOf(Word));
   SetLength(Directory, Swap16(Value16));

   // read flags
   Read(Value16, SizeOf(Word));
   FFlags := WordToDigitalSignatureFlags(Swap16(Value16));

   if Position + Length(Directory) * SizeOf(TDigitalSignatureDirectory) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read directory entry
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex] do
     begin
      // read format
      Read(Value32, SizeOf(Cardinal));
      Format := Swap32(Value32);

      // read length
      Read(Value32, SizeOf(Cardinal));
      Length := Swap32(Value32);

      // read offset
      Read(Value32, SizeOf(Cardinal));
      Offset := Swap32(Value32);
     end;

   // clear existing signatures
   FSignatures.Clear;

   // read digital signatures
   for DirIndex := 0 to Length(Directory) - 1 do
    with Directory[DirIndex] do
     begin
      SigBlock := TPascalTypeDigitalSignatureBlock.Create;

      Position := StartPos + Offset;

      // check if table contains the entire signature
      if Position + Length > Size
       then raise EPascalTypeError.Create(RCStrTableIncomplete);

      // load digital signature from stream
      SigBlock.LoadFromStream(Stream);

      FSignatures.Add(SigBlock);
     end;
  end;
end;

procedure TPascalTypeDigitalSignatureTable.SaveToStream(Stream: TStream);
var
  StartPos  : Int64;
  DirIndex  : Integer;
  Directory : array of TDigitalSignatureDirectory;
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
   Value16 := Swap16(FSignatures.Count);
   Write(Value16, SizeOf(Word));

   // write flags
   Value16 := Swap16(DigitalSignatureFlagsToWord(FFlags));
   Write(Value16, SizeOf(Word));

   SetLength(Directory, FSignatures.Count);

   // offset directory
   Seek(soFromCurrent, FSignatures.Count * 3 * SizeOf(Cardinal));

   // build directory and store signature
   for DirIndex := 0 to FSignatures.Count - 1 do
    with TPascalTypeDigitalSignatureBlock(FSignatures[DirIndex]) do
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
    with Directory[DirIndex], TPascalTypeDigitalSignatureBlock(FSignatures[DirIndex]) do
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
  end;
end;

procedure TPascalTypeDigitalSignatureTable.SetFlags(
  const Value: TDigitalSignatureFlags);
begin
 if FFlags <> Value then
  begin
   FFlags := Value;
   FlagsChanged;
  end;
end;

procedure TPascalTypeDigitalSignatureTable.SetVersion(
  const Value: Cardinal);
begin
 if (Version <> Value) then
  begin
   Version := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeDigitalSignatureTable.FlagsChanged;
begin
 Changed;
end;

procedure TPascalTypeDigitalSignatureTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeGridFittingAndScanConversionProcedureTable }

procedure TPascalTypeGridFittingAndScanConversionProcedureTable.AssignTo(
  Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeGridFittingAndScanConversionProcedureTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FGaspRanges := Self.FGaspRanges;
   end
 else inherited;
end;

class function TPascalTypeGridFittingAndScanConversionProcedureTable.GetTableType: TTableType;
begin
 Result := 'gasp';
end;

procedure TPascalTypeGridFittingAndScanConversionProcedureTable.ResetToDefaults;
begin
 FVersion := 0;
 SetLength(FGaspRanges, 0);
end;

function TPascalTypeGridFittingAndScanConversionProcedureTable.GetRange(
  Index: Integer): TGaspRange;
begin
 if (Index >= 0) and (Index < Length(FGaspRanges))
  then Result := FGaspRanges[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeGridFittingAndScanConversionProcedureTable.GetRangeCount: Integer;
begin
 Result := Length(FGaspRanges);
end;

procedure TPascalTypeGridFittingAndScanConversionProcedureTable.LoadFromStream(
  Stream: TStream);
var
  RangeIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   FVersion := ReadSwappedWord(Stream);

   // check version
   if not (Version in [0..1])
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read version
   SetLength(FGaspRanges, ReadSwappedWord(Stream));

   // check (minimum) table size
   if Position + 4 * Length(FGaspRanges) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   for RangeIndex := 0 to Length(FGaspRanges) - 1 do
    begin
     // read MaxPPEM
     FGaspRanges[RangeIndex].MaxPPEM := ReadSwappedWord(Stream);

     // read GaspFlag
     FGaspRanges[RangeIndex].GaspFlag := ReadSwappedWord(Stream);
    end;
  end;
end;

procedure TPascalTypeGridFittingAndScanConversionProcedureTable.SaveToStream(
  Stream: TStream);
var
  RangeIndex : Integer;
begin
 with Stream do
  begin
   // write version
   WriteSwappedWord(Stream, FVersion);

   // write numRanges
   WriteSwappedWord(Stream, Length(FGaspRanges));

   for RangeIndex := 0 to Length(FGaspRanges) - 1 do
    begin
     // write MaxPPEM
     WriteSwappedWord(Stream, FGaspRanges[RangeIndex].MaxPPEM);

     // write GaspFlag
     WriteSwappedWord(Stream, FGaspRanges[RangeIndex].GaspFlag);
    end;
  end;
end;

procedure TPascalTypeGridFittingAndScanConversionProcedureTable.SetVersion(
  const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeGridFittingAndScanConversionProcedureTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeHorizontalDeviceMetricsSubTable }

procedure TPascalTypeHorizontalDeviceMetricsSubTable.AssignTo(
  Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeHorizontalDeviceMetricsSubTable(Dest) do
   begin
    Fppem := Self.Fppem;
    FMaxWidth := Self.FMaxWidth;
    FWidths := Self.FWidths;
   end
 else inherited;
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.ResetToDefaults;
begin
 inherited;
 Fppem := 0;
 FMaxWidth := 0;
 SetLength(FWidths, 0);
end;

function TPascalTypeHorizontalDeviceMetricsSubTable.GetWidth(
  Index: Integer): Byte;
begin
 if (Index >= 0) and (Index < Length(FWidths))
  then Result := FWidths[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeHorizontalDeviceMetricsSubTable.GetWidthCount: Integer;
begin
 Result := Length(FWidths);
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.LoadFromStream(
  Stream: TStream);
var
  MaxProfile : TPascalTypeMaximumProfileTable;
begin
 inherited;

 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read ppem
   Read(Fppem, 1);

   // read max width
   Read(FMaxWidth, 1);

   // set length of widths to number of glyphs
   SetLength(FWidths, MaxProfile.NumGlyphs);

   // check (minimum) table size
   if Position + Length(FWidths) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read widths
   Read(FWidths[0], Length(FWidths));
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.SaveToStream(
  Stream: TStream);
begin
 inherited;

 with Stream do
  begin
   // write ppem
   Write(Fppem, SizeOf(Word));

   // write max width
   Write(FMaxWidth, SizeOf(Word));

   // write widths
   Write(FWidths[0], Length(FWidths));
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.SetMaxWidth(
  const Value: Byte);
begin
 if FMaxWidth <> Value then
  begin
   FMaxWidth := Value;
   MaxWidthChanged;
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.Setppem(
  const Value: Byte);
begin
 if Fppem <> Value then
  begin
   Fppem := Value;
   ppemChanged;
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.MaxWidthChanged;
begin
 Changed;
end;

procedure TPascalTypeHorizontalDeviceMetricsSubTable.ppemChanged;
begin
 Changed;
end;


{ TPascalTypeHorizontalDeviceMetricsTable }

constructor TPascalTypeHorizontalDeviceMetricsTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
 FSubtables := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeHorizontalDeviceMetricsTable.Destroy;
begin
 FreeAndNil(FSubtables);
 inherited;
end;

procedure TPascalTypeHorizontalDeviceMetricsTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeHorizontalDeviceMetricsTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FSubtables.Assign(Self.FSubtables);
   end
 else inherited;
end;

function TPascalTypeHorizontalDeviceMetricsTable.GetDeviceRecord(
  Index: Word): TPascalTypeHorizontalDeviceMetricsSubTable;
begin
 if (Index < FSubtables.Count)
  then Result := TPascalTypeHorizontalDeviceMetricsSubTable(FSubtables[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeHorizontalDeviceMetricsTable.GetDeviceRecordCount: Word;
begin
 Result := FSubtables.Count;
end;

class function TPascalTypeHorizontalDeviceMetricsTable.GetTableType: TTableType;
begin
 Result := 'hdmx';
end;

procedure TPascalTypeHorizontalDeviceMetricsTable.ResetToDefaults;
begin
 FVersion := 0;
 FSubtables.Clear;
end;

procedure TPascalTypeHorizontalDeviceMetricsTable.LoadFromStream(
  Stream: TStream);
var
  OffsetPosition   : Int64;
  SizeDeviceRecord : Cardinal;
  NumRecords       : SmallInt;
  RecordIndex      : Integer;
  SubTableRecord   : TPascalTypeHorizontalDeviceMetricsSubTable;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read format type
   FVersion := ReadSwappedWord(Stream);

   if Version <> 0
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read num records
   NumRecords := ReadSwappedSmallInt(Stream);

   // read device record size
   SizeDeviceRecord := ReadSwappedCardinal(Stream);

   // store offset position
   OffsetPosition := Position;

   for RecordIndex := 0 to NumRecords - 1 do
    begin
     // locate current record
     Position := OffsetPosition + RecordIndex * SizeDeviceRecord;

     // create subtable entry
     SubTableRecord := TPascalTypeHorizontalDeviceMetricsSubTable.Create(FInterpreter);

     // load subtable entry from stream
     SubTableRecord.LoadFromStream(Stream);

     // add subtable entry to subtables
     FSubtables.Add(SubTableRecord);
    end;
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsTable.SaveToStream(
  Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write format type
   Value16 := Swap16(FVersion);
   Write(Value16, SizeOf(Word));

   // write num records
   Value16 := Swap16(FSubtables.Count);
   Write(Value16, SizeOf(Word));

(* TODO

   // write device record size
   Value16 := Swap16(FSizeDeviceRecord);
   Write(Value16, SizeOf(Word));
*)   
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsTable.SetDeviceRecord(Index: Word;
  const Value: TPascalTypeHorizontalDeviceMetricsSubTable);
begin

end;

procedure TPascalTypeHorizontalDeviceMetricsTable.SetVersion(
  const Value: Word);
begin
 if (FVersion <> Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeHorizontalDeviceMetricsTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeKerningFormat0SubTable }

procedure TPascalTypeKerningFormat0SubTable.ResetToDefaults;
begin
 inherited;

 SetLength(FPairs, 0);
end;

function TPascalTypeKerningFormat0SubTable.GetKerningValue(LeftGlyphIndex,
  RightGlyphIndex: Word): Word;
var
  PairIndex : Integer;
begin
 Result := 0;
 for PairIndex := 0 to Length(FPairs) - 1 do
  if FPairs[PairIndex].Left = LeftGlyphIndex then
   if FPairs[PairIndex].Right = RightGlyphIndex then
    begin
     Result := FPairs[PairIndex].Value;
     Exit;
    end;
end;

function TPascalTypeKerningFormat0SubTable.GetPair(
  Index: Integer): TKerningFormat0SubTable;
begin
 if (Index >= 0) and (Index < Length(FPairs))
  then Result := FPairs[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeKerningFormat0SubTable.GetPairCount: Integer;
begin
 Result := Length(FPairs);
end;

procedure TPascalTypeKerningFormat0SubTable.LoadFromStream(Stream: TStream);
var
  Value16       : Word;
  PairIndex     : Integer;
  SearchRange   : Word;
  EntrySelector : Word;
  RangeShift    : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read number of pairs
   Read(Value16, SizeOf(Word));
   SetLength(FPairs, Swap16(Value16));

   // read search range
   SearchRange := ReadSwappedWord(Stream);

   // confirm search range has a valid value
   if SearchRange > Round(6 * (Power(2, Floor(Log2(Length(FPairs))))))
    then raise EPascalTypeError.Create(RCStrErrorInKerningSubTable + ': ' + RCStrWrongSearchRange);

   // read entry selector
   EntrySelector := ReadSwappedWord(Stream);

   // confirm entry selector has a valid value
   if EntrySelector < Round(Log2(SearchRange / 6))
    then raise EPascalTypeError.Create(RCStrErrorInKerningSubTable + ': ' + RCStrWrongEntrySelector);

   // read range shift
   RangeShift := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   // confirm range shift has a valid value
   if RangeShift <> (6 * Length(FPairs) - SearchRange)
    then raise EPascalTypeError.Create(RCStrErrorInKerningSubTable + ': ' + RCStrWrongRangeShift);
   {$ENDIF}

   for PairIndex := 0 to Length(FPairs) - 1 do
    with FPairs[PairIndex] do
     begin
      // read left
      Left := ReadSwappedWord(Stream);

      // read right
      Right := ReadSwappedWord(Stream);

      // read value
      Value := ReadSwappedSmallInt(Stream);
     end;
  end;
end;

procedure TPascalTypeKerningFormat0SubTable.SaveToStream(Stream: TStream);
var
  Value16       : Word;
  PairIndex     : Integer;
  SearchRange   : Word;
  EntrySelector : Word;
  RangeShift    : Word;
begin
 inherited;

 with Stream do
  begin
   // write number of pairs
   Value16 := Swap16(Length(FPairs));
   Write(Value16, SizeOf(Word));

   // write search range
   SearchRange := Round(6 * (Power(2, Floor(Log2(Length(FPairs))))));
   Value16 := Swap16(SearchRange);
   Write(Value16, SizeOf(Word));

   // write entry selector
   EntrySelector := Round(Log2(SearchRange / 6));
   Value16 := Swap16(EntrySelector);
   Write(Value16, SizeOf(Word));

   // write range shift
   RangeShift := 6 * Length(FPairs) - SearchRange;
   Value16 := Swap16(RangeShift);
   Write(Value16, SizeOf(Word));

   for PairIndex := 0 to Length(FPairs) - 1 do
    with FPairs[PairIndex] do
     begin
      // write left
      Value16 := Swap16(Left);
      Write(Value16, SizeOf(Word));

      // write right
      Value16 := Swap16(Right);
      Write(Value16, SizeOf(Word));

      // write value
      Value := Swap16(Value16);
      Write(Value16, SizeOf(Word));
     end;
  end;
end;


{ TPascalTypeKerningFormat2SubTable }

procedure TPascalTypeKerningFormat2SubTable.ResetToDefaults;
begin
 inherited;
end;

procedure TPascalTypeKerningFormat2SubTable.LoadFromStream(Stream: TStream);
begin
 inherited;

 raise EPascalTypeError.Create('not yet implemented');
end;

procedure TPascalTypeKerningFormat2SubTable.SaveToStream(Stream: TStream);
begin
 inherited;

 raise EPascalTypeError.Create('not yet implemented');
end;


{ TPascalTypeKerningSubTable }

constructor TPascalTypeKerningSubTable.Create;
begin
 FFormatTable := TPascalTypeKerningFormat0SubTable.Create;
 inherited;
end;

destructor TPascalTypeKerningSubTable.Destroy;
begin
 FreeAndNil(FFormatTable);
 inherited;
end;

procedure TPascalTypeKerningSubTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeKerningTable(Dest) do
   begin
    FVersion  := Self.FVersion;
    FLength   := Self.FLength;
    FCoverage := Self.FCoverage;
   end
  else inherited;
end;

procedure TPascalTypeKerningSubTable.ResetToDefaults;
begin
 inherited;
 FVersion := 0;
 FLength := 0;
 FCoverage := 0;
 AssignFormat;
end;

procedure TPascalTypeKerningSubTable.LoadFromStream(Stream: TStream);
var
  Value16       : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value16, SizeOf(Word));
   FVersion := Swap16(Value16);

   if FVersion <> 0
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read length
   Read(Value16, SizeOf(Word));
   FLength := Swap16(Value16);

   // read coverage
   Read(Value16, SizeOf(Word));
   FCoverage := Swap16(Value16);
   AssignFormat;

   case Format of
    0, 2 : FFormatTable.LoadFromStream(Stream);
    else
     begin
      // check minimum size
      if Position + FLength - 6 > Size
       then raise EPascalTypeError.Create(RCStrTableIncomplete);

      Seek(soFromCurrent, FLength - 6);
     end;
   end;
  end;
end;

procedure TPascalTypeKerningSubTable.SaveToStream(Stream: TStream);
var
  Value16       : Word;
begin
 inherited;

 with Stream do
  begin
   // write version
   Value16 := Swap16(FVersion);
   Write(Value16, SizeOf(Word));

   // write length
   Value16 := Swap16(FLength);
   Write(Value16, SizeOf(Word));

   // write coverage
   Value16 := Swap16(FCoverage);
   Write(Value16, SizeOf(Word));
  end;
end;

function TPascalTypeKerningSubTable.GetFormat: Byte;
begin
 Result := (FCoverage shr 8) and $FF;
end;

function TPascalTypeKerningSubTable.GetIsCrossStream: Boolean;
begin
 Result := (FCoverage and (1 shl 2)) > 0;
end;

function TPascalTypeKerningSubTable.GetIsHorizontal: Boolean;
begin
 Result := (FCoverage and 1) > 0;
end;

function TPascalTypeKerningSubTable.GetIsMinimum: Boolean;
begin
 Result := (FCoverage and (1 shl 1)) > 0;
end;

function TPascalTypeKerningSubTable.GetIsReplace: Boolean;
begin
 Result := (FCoverage and (1 shl 3)) > 0;
end;

procedure TPascalTypeKerningSubTable.SetFormat(const Value: Byte);
begin
 if Value <> Format then
  begin
   FCoverage := (FCoverage and $FF) or ((Value and $FF) shl 8);
   FormatChanged;
  end;
end;

procedure TPascalTypeKerningSubTable.SetIsCrossStream(const Value: Boolean);
begin
 if IsCrossStream <> Value then
  begin
   FCoverage := (FCoverage and (not (1 shl 2))) or (Integer(Value = True) shl 2);
   IsCrossStreamChanged;
  end;
end;

procedure TPascalTypeKerningSubTable.SetIsHorizontal(const Value: Boolean);
begin
 if IsHorizontal <> Value then
  begin
   FCoverage := (FCoverage and (not 1)) or (Integer(Value = True));
   IsHorizontalChanged;
  end;
end;

procedure TPascalTypeKerningSubTable.SetIsMinimum(const Value: Boolean);
begin
 if IsMinimum <> Value then
  begin
   FCoverage := (FCoverage and (not (1 shl 1))) or (Integer(Value = True) shl 1);
   IsMinimumChanged;
  end;
end;

procedure TPascalTypeKerningSubTable.SetIsReplace(const Value: Boolean);
begin
 if IsReplace <> Value then
  begin
   FCoverage := (FCoverage and (not (1 shl 3))) or (Integer(Value = True) shl 3);
   IsReplaceChanged;
  end;
end;

procedure TPascalTypeKerningSubTable.SetVersion(const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeKerningSubTable.AssignFormat;
var
  OldFormatTable : TCustomPascalTypeKerningFormatSubTable;
const
  CFormatClasses : array [0..1] of TCustomPascalTypeKerningFormatSubTableClass =
    (TPascalTypeKerningFormat0SubTable, TPascalTypeKerningFormat2SubTable);
begin
 case Format of
  0, 2 : if not (FFormatTable is CFormatClasses[Format shr 1]) then
       begin
        OldFormatTable := FFormatTable;
        FFormatTable := CFormatClasses[Format shr 1].Create;
        if Assigned(OldFormatTable) then
         begin
          FFormatTable.Assign(OldFormatTable);
          FreeAndNil(OldFormatTable);
         end;
       end;
  else raise EPascalTypeError.Create(RCStrUnsupportedVersion);
 end;
end;

procedure TPascalTypeKerningSubTable.FormatChanged;
begin
 AssignFormat;
 CoverageChanged;
end;

procedure TPascalTypeKerningSubTable.IsCrossStreamChanged;
begin
 CoverageChanged;
end;

procedure TPascalTypeKerningSubTable.IsHorizontalChanged;
begin
 CoverageChanged;
end;

procedure TPascalTypeKerningSubTable.IsMinimumChanged;
begin
 CoverageChanged;
end;

procedure TPascalTypeKerningSubTable.IsReplaceChanged;
begin
 CoverageChanged;
end;

procedure TPascalTypeKerningSubTable.CoverageChanged;
begin
 Changed;
end;

procedure TPascalTypeKerningSubTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeKerningTable }

constructor TPascalTypeKerningTable.Create;
begin
 FKerningSubtableList := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeKerningTable.Destroy;
begin
 FreeAndNil(FKerningSubtableList);
 inherited;
end;

procedure TPascalTypeKerningTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeKerningTable(Dest) do
   begin
    FVersion := Self.FVersion;
   end
  else inherited;
end;

function TPascalTypeKerningTable.GetKerningSubtable(
  Index: Integer): TPascalTypeKerningSubTable;
begin
 if (Index >= 0) and (Index < FKerningSubtableList.Count)
  then Result := TPascalTypeKerningSubTable(FKerningSubtableList[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeKerningTable.GetKerningSubtableCount: Integer;
begin
 Result := FKerningSubtableList.Count;
end;

class function TPascalTypeKerningTable.GetTableType: TTableType;
begin
 Result := 'kern';
end;

procedure TPascalTypeKerningTable.ResetToDefaults;
begin
 inherited;
 FKerningSubtableList.Clear;
end;

procedure TPascalTypeKerningTable.LoadFromStream(Stream: TStream);
var
  SubTableIndex : Integer;
  SubTable      : TPascalTypeKerningSubTable;
  SubTableCount : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   FVersion := ReadSwappedWord(Stream);

   if FVersion <> 0
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read number of glyphs
   SubTableCount := ReadSwappedWord(Stream);

   // clear eventually existing tables
   FKerningSubtableList.Clear;

   for SubTableIndex := 0 to SubTableCount - 1 do
    begin
     SubTable := TPascalTypeKerningSubTable.Create;

     // load from stream
     SubTable.LoadFromStream(Stream);

     FKerningSubtableList.Add(SubTable);
    end;
  end;
end;

procedure TPascalTypeKerningTable.SaveToStream(Stream: TStream);
var
  Value16       : Word;
  SubTableIndex : Integer;
begin
 with Stream do
  begin
   // write version
   Value16 := Swap16(FVersion);
   Write(Value16, SizeOf(Word));

   // write number of glyphs
   Value16 := Swap16(FKerningSubtableList.Count);
   Write(Value16, SizeOf(Word));

   // save to stream
   for SubTableIndex := 0 to FKerningSubtableList.Count - 1
    do TPascalTypeKerningSubTable(FKerningSubtableList[SubTableIndex]).SaveToStream(Stream);
  end;
end;

procedure TPascalTypeKerningTable.SetVersion(const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeKerningTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeLinearThresholdTable }

procedure TPascalTypeLinearThresholdTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeLinearThresholdTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FVerticalPels := Self.FVerticalPels;
   end
 else inherited;
end;

class function TPascalTypeLinearThresholdTable.GetTableType: TTableType;
begin
 Result := 'LTSH';
end;

function TPascalTypeLinearThresholdTable.GetVerticalPel(Index: Integer): Byte;
begin
 if (Index >= 0) and (Index < Length(FVerticalPels))
  then Result := FVerticalPels[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeLinearThresholdTable.GetVerticalPelCount: Integer;
begin
 Result := Length(FVerticalPels);
end;

procedure TPascalTypeLinearThresholdTable.ResetToDefaults;
begin
 FVersion := 0;
 SetLength(FVerticalPels, 0);
end;

procedure TPascalTypeLinearThresholdTable.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value16, SizeOf(Word));
   Version := Swap16(Value16);

   if Version <> 0
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read number of glyphs
   Read(Value16, SizeOf(Word));
   SetLength(FVerticalPels, Swap16(Value16));
                                  
   if Position + Length(FVerticalPels) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read vertical pel height
   Read(FVerticalPels[0], Length(FVerticalPels));
  end;
end;

procedure TPascalTypeLinearThresholdTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write version
   Value16 := Swap16(Version);
   Write(Value16, SizeOf(Word));

   // write number of glyphs
   Value16 := Swap16(Length(FVerticalPels));
   Write(Value16, SizeOf(Word));

   // write vertical pel height
   Write(FVerticalPels[0], Length(FVerticalPels));
  end;
end;

procedure TPascalTypeLinearThresholdTable.SetVersion(const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeLinearThresholdTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypePCL5Table }

procedure TPascalTypePCL5Table.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePCL5Table(Dest) do
   begin
    FVersion.Value := Self.FVersion.Value;
    FFontNumber := Self.FFontNumber;
    FPitch := Self.FPitch;
    FXHeight := Self.FXHeight;
    FStyle := Self.FStyle;
    FTypeFamily := Self.FTypeFamily;
    FCapHeight := Self.FCapHeight;
    FSymbolSet := Self.FSymbolSet;
    Move(Self.FTypeface, FTypeface, 16);
    Move(Self.FCharacterComplement, FCharacterComplement, 8);
    Move(Self.FFileName, FFileName, 6);
    FStrokeWeight := Self.FStrokeWeight;
    FWidthType := Self.FWidthType;
    FSerifStyle := Self.FSerifStyle;
    FPadding := Self.FPadding;
   end
 else inherited;
end;

class function TPascalTypePCL5Table.GetTableType: TTableType;
begin
 Result := 'PCLT';
end;

function TPascalTypePCL5Table.GetCharacterComplement: string;
begin
 Result := string(FTypeface);
end;

function TPascalTypePCL5Table.GetFileName: string;
begin
 Result := string(FFileName);
end;

function TPascalTypePCL5Table.GetTypeface: string;
begin
 Result := string(FTypeface);
end;

procedure TPascalTypePCL5Table.ResetToDefaults;
begin
 FVersion.Value := 1;
 FFontNumber.Vendor := 0;
 FFontNumber.Specific[0] := 0;
 FFontNumber.Specific[1] := 0;
 FFontNumber.Specific[2] := 0;
 FPitch := 0;
 FXHeight := 0;
 FStyle := 0;
 FTypeFamily := 0;
 FCapHeight := 0;
 FSymbolSet := 0;
 FillChar(FTypeface[0], 16, 0);
 FillChar(FCharacterComplement[0], 8, 0);
 FillChar(FFileName[0], 6, 0);
 FStrokeWeight := #0;
 FWidthType := #0;
 FSerifStyle := 0;
 FPadding := 0;
end;

procedure TPascalTypePCL5Table.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 54 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   FVersion := TFixedPoint(Swap32(Value32));

   if Version.Value <> 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read font number
   Read(Value32, SizeOf(Cardinal));
   FFontNumber := TPcl5FontNumber(Value32);

   // read pitch
   Read(Value16, SizeOf(Word));
   FPitch := Swap16(Value16);

   // read x-height
   Read(Value16, SizeOf(Word));
   FXHeight := Swap16(Value16);

   // read style
   Read(Value16, SizeOf(Word));
   FStyle := Swap16(Value16);

   // read type family
   Read(Value16, SizeOf(Word));
   FTypeFamily := Swap16(Value16);

   // read capital height
   Read(Value16, SizeOf(Word));
   FCapHeight := Swap16(Value16);

   // read symbol set
   Read(Value16, SizeOf(Word));
   FSymbolSet := Swap16(Value16);

   // read typeface
   Read(FTypeface, 16);

   // read character complement
   Read(FCharacterComplement, 8);

   // read filename
   Read(FFileName, 6);

   // read stroke weight
   Read(FStrokeWeight, SizeOf(AnsiChar));

   // read width type
   Read(FWidthType, SizeOf(AnsiChar));

   // read serif style
   Read(FSerifStyle, SizeOf(Byte));

   // read Padding
   Read(FPadding, SizeOf(Byte));
  end;
end;

procedure TPascalTypePCL5Table.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
begin
 with Stream do
  begin
   // write version
   Value32 := Swap32(Cardinal(FVersion));
   Write(Value32, SizeOf(TFixedPoint));

   // write font number
   Value32 := Swap32(Cardinal(FFontNumber));
   Write(Value32, SizeOf(Cardinal));

   // write pitch
   Value16 := Swap16(FPitch);
   Write(Value16, SizeOf(Word));

   // write XHeight
   Value16 := Swap16(FXHeight);
   Write(Value16, SizeOf(Word));

   // write Pitch
   Value16 := Swap16(FPitch);
   Write(Value16, SizeOf(Word));

   // write x-height
   Value16 := Swap16(FXHeight);
   Write(Value16, SizeOf(Word));

   // write style
   Value16 := Swap16(FStyle);
   Write(Value16, SizeOf(Word));

   // write type family
   Value16 := Swap16(FTypeFamily);
   Write(Value16, SizeOf(Word));

   // write capital height
   Value16 := Swap16(FCapHeight);
   Write(Value16, SizeOf(Word));

   // write symbol set
   Value16 := Swap16(FSymbolSet);
   Write(Value16, SizeOf(Word));

   // write typeface
   Write(FTypeface, 16);

   // write character complement
   Write(FCharacterComplement, 8);

   // write filename
   Write(FFileName, 6);

   // write stroke weight
   Write(FStrokeWeight, SizeOf(AnsiChar));

   // write width type
   Write(FWidthType, SizeOf(AnsiChar));

   // write serif style
   Write(FSerifStyle, SizeOf(Byte));

   // write Padding
   Write(FPadding, SizeOf(Byte));
  end;
end;

procedure TPascalTypePCL5Table.SetCapHeight(const Value: Word);
begin
 if FCapHeight <> Value then
  begin
   FCapHeight := Value;
   CapHeightChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetCharacterComplement(const Value: string);
begin
 FillChar(FCharacterComplement[0], 8, 0);
 Move(Value[1], FCharacterComplement[0], Min(8, Length(Value)));
end;

procedure TPascalTypePCL5Table.SetFileName(const Value: string);
begin
 FillChar(FCharacterComplement[0], 6, 0);
 Move(Value[1], FCharacterComplement[0], Min(6, Length(Value)));
end;

procedure TPascalTypePCL5Table.SetFontNumber(const Value: TPcl5FontNumber);
begin
 if Cardinal(FFontNumber) <> Cardinal(Value) then
  begin
   FFontNumber := Value;
   FontNumberChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetPadding(const Value: Byte);
begin
 if FPadding <> Value then
  begin
   FPadding := Value;
   PaddingChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetPitch(const Value: Word);
begin
 if FPitch <> Value then
  begin
   FPitch := Value;
   PitchChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetSerifStyle(const Value: Byte);
begin
 if FSerifStyle <> Value then
  begin
   FSerifStyle := Value;
   SerifStyleChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetStrokeWeight(const Value: AnsiChar);
begin
 if FStrokeWeight <> Value then
  begin
   FStrokeWeight := Value;
   StrokeWeightChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetStyle(const Value: Word);
begin
 if FStyle <> Value then
  begin
   FStyle := Value;
   StyleChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetSymbolSet(const Value: Word);
begin
 if FSymbolSet <> Value then
  begin
   FSymbolSet := Value;
   SymbolSetChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetTypeface(const Value: string);
begin
 FillChar(FCharacterComplement[0], 16, 0);
 Move(Value[1], FCharacterComplement[0], Min(16, Length(Value)));
end;

procedure TPascalTypePCL5Table.SetTypeFamily(const Value: Word);
begin
 if FTypeFamily <> Value then
  begin
   FTypeFamily := Value;
   TypeFamilyChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetVersion(const Value: TFixedPoint);
begin
 if (FVersion.Fract <> Value.Fract) or
    (FVersion.Value <> Value.Value) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetWidthType(const Value: AnsiChar);
begin
 if FWidthType <> Value then
  begin
   FWidthType := Value;
   WidthTypeChanged;
  end;
end;

procedure TPascalTypePCL5Table.SetXHeight(const Value: Word);
begin
 if FXHeight <> Value then
  begin
   FXHeight := Value;
   XHeightChanged;
  end;
end;

procedure TPascalTypePCL5Table.CapHeightChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.FontNumberChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.PaddingChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.PitchChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.SerifStyleChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.StrokeWeightChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.StyleChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.SymbolSetChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.TypeFamilyChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.VersionChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.WidthTypeChanged;
begin
 Changed;
end;

procedure TPascalTypePCL5Table.XHeightChanged;
begin
 Changed;
end;


{ TPascalTypeVDMXGroupTable }

procedure TPascalTypeVDMXGroupTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeVDMXGroupTable(Dest) do
   begin
    FStartsz := Self.FStartsz;
    FEndsz   := Self.FEndsz;
    FEntry   := Self.FEntry;
   end
 else inherited;
end;

procedure TPascalTypeVDMXGroupTable.ResetToDefaults;
begin
 inherited;
 FStartsz := 0;
 FEndsz   := 0;
 SetLength(FEntry, 0);
end;

procedure TPascalTypeVDMXGroupTable.LoadFromStream(Stream: TStream);
var
  EntryIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read number of height records
   SetLength(FEntry, ReadSwappedWord(Stream));

   // read starting yPelHeight
   Read(FStartsz, 1);

   // read ending yPelHeight
   Read(FEndsz, 1);

   for EntryIndex := 0 to Length(FEntry) - 1 do
    with FEntry[EntryIndex] do
     begin
      // read yPelHeight to which values apply.
      yPelHeight := ReadSwappedWord(Stream);

      // read Maximum value (in pels) for this yPelHeight.
      yMax := ReadSwappedSmallInt(Stream);

      // read Minimum value (in pels) for this yPelHeight.
      yMin := ReadSwappedSmallInt(Stream);
     end;
  end;
end;

procedure TPascalTypeVDMXGroupTable.SaveToStream(Stream: TStream);
var
  EntryIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // write number of height records
   WriteSwappedWord(Stream, Length(FEntry));

   // write starting yPelHeight
   Write(FStartsz, 1);

   // write ending yPelHeight
   Write(FEndsz, 1);

   for EntryIndex := 0 to Length(FEntry) - 1 do
    with FEntry[EntryIndex] do
     begin
      // write yPelHeight to which values apply.
      WriteSwappedWord(Stream, yPelHeight);

      // write Maximum value (in pels) for this yPelHeight.
      WriteSwappedSmallInt(Stream, yMax);

      // write Minimum value (in pels) for this yPelHeight.
      WriteSwappedSmallInt(Stream, yMin);
     end;
  end;
end;


{ TPascalTypeVerticalDeviceMetricsTable }

constructor TPascalTypeVerticalDeviceMetricsTable.Create(Interpreter: IPascalTypeInterpreter);
begin
 FGroups := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeVerticalDeviceMetricsTable.Destroy;
begin
 FreeAndNil(FGroups);
 inherited;
end;

procedure TPascalTypeVerticalDeviceMetricsTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeVerticalDeviceMetricsTable(Dest) do
   begin
    FVersion := Self.FVersion;
    FRatios := Self.FRatios;
    FGroups.Assign(Self.FGroups);
   end
 else inherited;
end;

function TPascalTypeVerticalDeviceMetricsTable.GetGroupCount: Word;
begin
 Result := FGroups.Count;
end;

function TPascalTypeVerticalDeviceMetricsTable.GetRatioCount: Word;
begin
 Result := Length(FRatios);
end;

class function TPascalTypeVerticalDeviceMetricsTable.GetTableType: TTableType;
begin
 Result := 'VDMX';
end;

procedure TPascalTypeVerticalDeviceMetricsTable.ResetToDefaults;
begin
 FVersion := 0;
 SetLength(FRatios, 0);
 FGroups.Clear;
end;

procedure TPascalTypeVerticalDeviceMetricsTable.LoadFromStream(
  Stream: TStream);
var
  RatioIndex : Integer;
  Offsets    : array of Word;
  NumRecs    : Word;
  Group      : TPascalTypeVDMXGroupTable;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 6 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   FVersion := ReadSwappedWord(Stream);

   // check version in 0..1
   if not (FVersion in [0..1])
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read number of VDMX groups present
   NumRecs := ReadSwappedWord(Stream);

   // read number of aspect ratio groupings
   SetLength(FRatios, ReadSwappedWord(Stream));
   SetLength(Offsets, Length(FRatios));

   // check (minimum) table size
   if Position + 6 * Length(FRatios) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read ratios
   for RatioIndex := 0 to Length(FRatios) - 1 do
    with FRatios[RatioIndex] do
     begin
      Read(bCharSet, 1);
      Read(xRatio, 1);
      Read(yStartRatio, 1);
      Read(yEndRatio, 1);
     end;

   // read offsets
   for RatioIndex := 0 to Length(FRatios) - 1
    do Offsets[RatioIndex] := ReadSwappedWord(Stream);

   // read groups
   for RatioIndex := 0 to NumRecs - 1 do
    begin
     // create new group
     Group := TPascalTypeVDMXGroupTable.Create;

     // load gropu from stream
     Group.LoadFromStream(Stream);

     // add group to list
     FGroups.Add(Group);
    end;
  end;
end;

procedure TPascalTypeVerticalDeviceMetricsTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write version
   Value16 := Swap16(FVersion);
   Write(Value16, SizeOf(Word));

   // write number of VDMX groups present
   Value16 := Swap16(FGroups.Count);
   Write(Value16, SizeOf(Word));

   // write number of aspect ratio groupings
   WriteSwappedWord(Stream, Length(FRatios));
  end;
end;

procedure TPascalTypeVerticalDeviceMetricsTable.SetVersion(const Value: Word);
begin
 if FVersion <> Value then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeVerticalDeviceMetricsTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeVerticalHeaderTable }

procedure TPascalTypeVerticalHeaderTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeVerticalHeaderTable(Dest) do
   begin
    FVersion              := Self.FVersion;
    FAscent               := Self.FAscent;
    FDescent              := Self.FDescent;
    FLineGap              := Self.FLineGap;
    FAdvanceHeightMax     := Self.FAdvanceHeightMax;
    FMinTopSideBearing    := Self.FMinTopSideBearing;
    FMinBottomSideBearing := Self.FMinBottomSideBearing;
    FYMaxExtent           := Self.FYMaxExtent;
    FCaretSlopeRise       := Self.FCaretSlopeRise;
    FCaretSlopeRun        := Self.FCaretSlopeRun;
    FCaretOffset          := Self.FCaretOffset;
    FMetricDataFormat     := Self.FMetricDataFormat;
    FNumOfLongVerMetrics  := Self.FNumOfLongVerMetrics;
   end
  else inherited;
end;

class function TPascalTypeVerticalHeaderTable.GetTableType: TTableType;
begin
 Result := 'vhea';
end;

procedure TPascalTypeVerticalHeaderTable.ResetToDefaults;
begin
 // not implemented yet
 FVersion.Value := 1;
 FVersion.Fract := 0;
 FAscent := 0;
 FDescent := 0;
 FLineGap := 0;
 FAdvanceHeightMax := 0;
 FMinTopSideBearing := 0;
 FMinBottomSideBearing := 0;
 FYMaxExtent := 0;
 FCaretSlopeRise := 0;
 FCaretSlopeRun := 0;
 FCaretOffset := 0;
 FillChar(FReserved[0], 8, 0);
 FMetricDataFormat := 0;
 FNumOfLongVerMetrics := 0;

 inherited;
end;

procedure TPascalTypeVerticalHeaderTable.LoadFromStream(
  Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : SmallInt;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 36 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   FVersion := TFixedPoint(Swap32(Value32));

   if Version.Value <> 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

//   if Version.Fract <> 0
//    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);

   // read ascent
   Read(Value16, SizeOf(SmallInt));
   FAscent := Swap16(Value16);

   // read descent
   Read(Value16, SizeOf(SmallInt));
   FDescent := Swap16(Value16);

   // read line gap
   Read(Value16, SizeOf(SmallInt));
   FLineGap := Swap16(Value16);

   // read advanced height max
   Read(Value16, SizeOf(SmallInt));
   FAdvanceHeightMax := Swap16(Value16);

   // read minimum side bearing
   Read(Value16, SizeOf(SmallInt));
   FMinTopSideBearing := Swap16(Value16);

   // read minimum bottom bearing
   Read(Value16, SizeOf(SmallInt));
   FMinBottomSideBearing := Swap16(Value16);

   // read y-max extent
   Read(Value16, SizeOf(SmallInt));
   FYMaxExtent := Swap16(Value16);

   // read caret slope rise
   Read(Value16, SizeOf(SmallInt));
   FCaretSlopeRise := Swap16(Value16);

   // read caret slope run
   Read(Value16, SizeOf(SmallInt));
   FCaretSlopeRun := Swap16(Value16);

   // read caret offset
   Read(Value16, SizeOf(SmallInt));
   FCaretOffset := Swap16(Value16);

   // read reserved
   Read(Value32, SizeOf(Cardinal));
   Assert(Value32 = 0);

   // read metric data format
   Read(Value16, SizeOf(Word));
   FMetricDataFormat := Swap16(Value16);

   // read metric data format
   Read(Value16, SizeOf(Word));
   FNumOfLongVerMetrics := Swap16(Word(Value16));
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : SmallInt;
begin
 inherited;

 with Stream do
  begin
   // write version
   Value32 := Swap32(Cardinal(FVersion));
   Write(Value32, SizeOf(TFixedPoint));

   // write ascent
   Value16 := Swap16(FAscent);
   Write(Value16, SizeOf(SmallInt));

   // write descent
   Value16 := Swap16(FDescent);
   Write(Value16, SizeOf(SmallInt));

   // write line gap
   Value16 := Swap16(FLineGap);
   Write(Value16, SizeOf(SmallInt));

   // write advanced height max
   Value16 := Swap16(FAdvanceHeightMax);
   Write(Value16, SizeOf(SmallInt));

   // write minimum side bearing
   Value16 := Swap16(FMinTopSideBearing);
   Write(Value16, SizeOf(SmallInt));

   // write minimum bottom bearing
   Value16 := Swap16(FMinBottomSideBearing);
   Write(Value16, SizeOf(SmallInt));

   // write y-max extent
   Value16 := Swap16(FYMaxExtent);
   Write(Value16, SizeOf(SmallInt));

   // write caret slope rise
   Value16 := Swap16(FCaretSlopeRise);
   Write(Value16, SizeOf(SmallInt));

   // write caret slope run
   Value16 := Swap16(FCaretSlopeRun);
   Write(Value16, SizeOf(SmallInt));

   // write caret offset
   Value16 := Swap16(FCaretOffset);
   Write(Value16, SizeOf(SmallInt));

   // write reserved
   Assert(Value32 = 0);
   Write(Value32, SizeOf(Cardinal));

   // write metric data format
   Value16 := Swap16(FMetricDataFormat);
   Write(Value16, SizeOf(Word));

   // write number of long vertical metrics
   Value16 := Swap16(Word(FNumOfLongVerMetrics));
   Write(Value16, SizeOf(Word));
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetAdvanceHeightMax(
  const Value: SmallInt);
begin
 if FAdvanceHeightMax <> Value then
  begin
   FAdvanceHeightMax := Value;
   AdvanceHeightMaxChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetAscent(
  const Value: SmallInt);
begin
 if Ascent <> Value then
  begin
   FAscent := Value;
   AscentChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetCaretOffset(
  const Value: SmallInt);
begin
 if CaretOffset <> Value then
  begin
   FCaretOffset := Value;
   CaretOffsetChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetCaretSlopeRise(
  const Value: SmallInt);
begin
 if CaretSlopeRise <> Value then
  begin
   FCaretSlopeRise := Value;
   CaretSlopeRiseChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetCaretSlopeRun(
  const Value: SmallInt);
begin
 if CaretSlopeRun <> Value then
  begin
   FCaretSlopeRun := Value;
   CaretSlopeRunChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetDescent(
  const Value: SmallInt);
begin
 if Descent <> Value then
  begin
   FDescent := Value;
   DescentChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetLineGap(
  const Value: SmallInt);
begin
 if LineGap <> Value then
  begin
   FLineGap := Value;
   LineGapChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetMetricDataFormat(
  const Value: SmallInt);
begin
 if MetricDataFormat <> Value then
  begin
   FMetricDataFormat := Value;
   MetricDataFormatChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetMinBottomSideBearing(
  const Value: SmallInt);
begin
 if MinBottomSideBearing <> Value then
  begin
   FMinBottomSideBearing := Value;
   MinBottomSideBearingChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetMinTopSideBearing(
  const Value: SmallInt);
begin
 if MinTopSideBearing <> Value then
  begin
   FMinTopSideBearing := Value;
   MinTopSideBearingChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetNumOfLongVerMetrics(
  const Value: Word);
begin
 if NumOfLongVerMetrics <> Value then
  begin
   FNumOfLongVerMetrics := Value;
   NumOfLongVerMetricsChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetVersion(
  const Value: TFixedPoint);
begin
 if (FVersion.Value <> Value.Value) or
    (FVersion.Fract <> Value.Fract) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.SetYMaxExtent(
  const Value: SmallInt);
begin
 if YMaxExtent <> Value then
  begin
   FYMaxExtent := Value;
   YMaxExtentChanged;
  end;
end;

procedure TPascalTypeVerticalHeaderTable.VersionChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.AscentChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.CaretOffsetChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.CaretSlopeRiseChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.CaretSlopeRunChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.DescentChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.AdvanceHeightMaxChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.LineGapChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.MetricDataFormatChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.MinBottomSideBearingChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.MinTopSideBearingChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.NumOfLongVerMetricsChanged;
begin
 Changed;
end;

procedure TPascalTypeVerticalHeaderTable.YMaxExtentChanged;
begin
 Changed;
end;


{ TPascalTypeVerticalMetricsTable }

procedure TPascalTypeVerticalMetricsTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeVerticalMetricsTable(Dest) do
   begin
    FVerticalMetrics := Self.FVerticalMetrics;
   end
 else inherited;
end;

class function TPascalTypeVerticalMetricsTable.GetTableType: TTableType;
begin
 Result := 'vdmx';
end;

function TPascalTypeVerticalMetricsTable.GetVerticalMetric(
  Index: Integer): TVerticalMetric;
begin
 if (Index >= 0) and (Index < Length(FVerticalMetrics))
  then Result := FVerticalMetrics[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeVerticalMetricsTable.GetVerticalMetricCount: Integer;
begin
 Result := Length(FVerticalMetrics);
end;

procedure TPascalTypeVerticalMetricsTable.ResetToDefaults;
begin
 inherited;

 SetLength(FVerticalMetrics, 0);
end;

procedure TPascalTypeVerticalMetricsTable.LoadFromStream(Stream: TStream);
var
  MtxIndex       : Integer;
  VerticalHeader : TPascalTypeVerticalHeaderTable;
  MaximumProfile : TPascalTypeMaximumProfileTable;
  Value16        : Word;
begin
 inherited;

 // locate vertical metrics header
 VerticalHeader := TPascalTypeVerticalHeaderTable(FInterpreter.GetTableByTableClass(TPascalTypeVerticalHeaderTable));
 MaximumProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));
 Assert(Assigned(MaximumProfile));

 // check if vertical metrics header is available
 if VerticalHeader = nil
  then raise EPascalTypeError.Create(RCStrNoVerticalHeader);

 // set length of vertical metrics
 SetLength(FVerticalMetrics, MaximumProfile.NumGlyphs);

 with Stream do
  begin
   for MtxIndex := 0 to VerticalHeader.NumOfLongVerMetrics - 1 do
    with FVerticalMetrics[MtxIndex] do
     begin
      // read advance width
      Read(Value16, SizeOf(SmallInt));
      AdvanceHeight := SmallInt(Swap16(Value16));

      // read left side bearing
      Read(Value16, SizeOf(SmallInt));
      TopSideBearing := Swap16(Value16);
     end;

   for MtxIndex := VerticalHeader.NumOfLongVerMetrics to Length(FVerticalMetrics)  - 1 do
    with FVerticalMetrics[MtxIndex] do
     begin
      // read advance width / left side bearing at once
      Read(Value16, SizeOf(SmallInt));
      AdvanceHeight := Swap16(Value16);
      TopSideBearing := Swap16(Value16);
     end;
  end;
end;

procedure TPascalTypeVerticalMetricsTable.SaveToStream(Stream: TStream);
var
  MtxIndex       : Integer;
  VerticalHeader : TPascalTypeVerticalHeaderTable;
  Value16        : Word;
begin
 inherited;

 // locate vertical metrics header
 VerticalHeader := TPascalTypeVerticalHeaderTable(FInterpreter.GetTableByTableClass(TPascalTypeVerticalHeaderTable));

 // check if vertical metrics header is available
 if VerticalHeader = nil
  then raise EPascalTypeError.Create(RCStrNoVerticalHeader);

 with Stream do
  begin
   for MtxIndex := 0 to VerticalHeader.NumOfLongVerMetrics - 1 do
    with FVerticalMetrics[MtxIndex] do
     begin
      // read advance width
      Value16 := Swap16(AdvanceHeight);
      Write(Value16, SizeOf(SmallInt));

      // read left side bearing
      Value16 := Swap16(TopSideBearing);
      Write(Value16, SizeOf(SmallInt));
     end;

   for MtxIndex := VerticalHeader.NumOfLongVerMetrics to Length(FVerticalMetrics)  - 1 do
    with FVerticalMetrics[MtxIndex] do
     begin
      // write advance width / left side bearing at once
      Value16 := Swap16(AdvanceHeight);
      Write(Value16, SizeOf(SmallInt));
     end;
  end;
end;


initialization
  RegisterPascalTypeTables([TPascalTypeDigitalSignatureTable,
    TPascalTypeGridFittingAndScanConversionProcedureTable,
    TPascalTypeHorizontalDeviceMetricsTable, TPascalTypeKerningTable,
    TPascalTypeLinearThresholdTable, TPascalTypePCL5Table,
    TPascalTypeVerticalDeviceMetricsTable, TPascalTypeVerticalHeaderTable,
    TPascalTypeVerticalMetricsTable]);

end.
