unit PT_PanoseClassifications;

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
  Classes, Sysutils, PT_Types, PT_Tables;

type
  TPascalTypeLatinTextPanoseTable = class(TCustomPascalTypePanoseTable)
  private
    function GetArmStyle: Byte;
    function GetContrast: Byte;
    function GetLetterform: Byte;
    function GetMidline: Byte;
    function GetProportion: Byte;
    function GetSerifStyle: Byte;
    function GetStrokeVariation: Byte;
    function GetWeight: Byte;
    function GetXHeight: Byte;
    procedure SetArmStyle(const Value: Byte);
    procedure SetContrast(const Value: Byte);
    procedure SetLetterform(const Value: Byte);
    procedure SetMidline(const Value: Byte);
    procedure SetProportion(const Value: Byte);
    procedure SetSerifStyle(const Value: Byte);
    procedure SetStrokeVariation(const Value: Byte);
    procedure SetWeight(const Value: Byte);
    procedure SetXHeight(const Value: Byte);
  protected
    class function GetFamilyType: Byte; override;

    procedure SerifStyleChanged; virtual;
    procedure WeightChanged; virtual;
    procedure ProportionChanged; virtual;
    procedure ContrastChanged; virtual;
    procedure StrokeVariationChanged; virtual;
    procedure ArmStyleChanged; virtual;
    procedure LetterformChanged; virtual;
    procedure MidlineChanged; virtual;
    procedure XHeightChanged; virtual;
  public
    property SerifStyle: Byte read GetSerifStyle write SetSerifStyle;
    property Weight: Byte read GetWeight write SetWeight;
    property Proportion: Byte read GetProportion write SetProportion;
    property Contrast: Byte read GetContrast write SetContrast;
    property StrokeVariation: Byte read GetStrokeVariation write SetStrokeVariation;
    property ArmStyle: Byte read GetArmStyle write SetArmStyle;
    property Letterform: Byte read GetLetterform write SetLetterform;
    property Midline: Byte read GetMidline write SetMidline;
    property XHeight: Byte read GetXHeight write SetXHeight;
  end;

  TPascalTypeLatinHandWrittenPanoseTable = class(TCustomPascalTypePanoseTable)
  private
    function GetAspectRatio: Byte;
    function GetContrast: Byte;
    function GetFinials: Byte;
    function GetForm: Byte;
    function GetSpacing: Byte;
    function GetToolKind: Byte;
    function GetTopology: Byte;
    function GetWeight: Byte;
    function GetXAscent: Byte;
    procedure SetAspectRatio(const Value: Byte);
    procedure SetContrast(const Value: Byte);
    procedure SetFinials(const Value: Byte);
    procedure SetForm(const Value: Byte);
    procedure SetSpacing(const Value: Byte);
    procedure SetToolKind(const Value: Byte);
    procedure SetTopology(const Value: Byte);
    procedure SetWeight(const Value: Byte);
    procedure SetXAscent(const Value: Byte);
  protected
    class function GetFamilyType: Byte; override;

    procedure ToolKindChanged; virtual;
    procedure WeightChanged; virtual;
    procedure SpacingChanged; virtual;
    procedure AspectRatioChanged; virtual;
    procedure ContrastChanged; virtual;
    procedure TopologyChanged; virtual;
    procedure FormChanged; virtual;
    procedure FinialsChanged; virtual;
    procedure XAscentChanged; virtual;
  public
    property ToolKind: Byte read GetToolKind write SetToolKind;
    property Weight: Byte read GetWeight write SetWeight;
    property Spacing: Byte read GetSpacing write SetSpacing;
    property AspectRatio: Byte read GetAspectRatio write SetAspectRatio;
    property Contrast: Byte read GetContrast write SetContrast;
    property Topology: Byte read GetTopology write SetTopology;
    property Form: Byte read GetForm write SetForm;
    property Finials: Byte read GetFinials write SetFinials;
    property XAscent: Byte read GetXAscent write SetXAscent;
  end;

  TPascalTypeLatinDecorativePanoseTable = class(TCustomPascalTypePanoseTable)
  private
    function GetAspect: Byte;
    function GetContrast: Byte;
    function GetFontClass: Byte;
    function GetLining: Byte;
    function GetRangeOfCharacters: Byte;
    function GetSerifVariant: Byte;
    function GetTopology: Byte;
    function GetTreatment: Byte;
    function GetWeight: Byte;
    procedure SetAspect(const Value: Byte);
    procedure SetContrast(const Value: Byte);
    procedure SetFontClass(const Value: Byte);
    procedure SetLining(const Value: Byte);
    procedure SetRangeOfCharacters(const Value: Byte);
    procedure SetSerifVariant(const Value: Byte);
    procedure SetTopology(const Value: Byte);
    procedure SetTreatment(const Value: Byte);
    procedure SetWeight(const Value: Byte);
  protected
    class function GetFamilyType: Byte; override;

    procedure FontClassChanged; virtual;
    procedure WeightChanged; virtual;
    procedure AspectChanged; virtual;
    procedure ContrastChanged; virtual;
    procedure SerifVariantChanged; virtual;
    procedure TreatmentChanged; virtual;
    procedure LiningChanged; virtual;
    procedure TopologyChanged; virtual;
    procedure RangeOfCharactersChanged; virtual;
  public
    property FontClass: Byte read GetFontClass write SetFontClass;
    property Weight: Byte read GetWeight write SetWeight;
    property Aspect: Byte read GetAspect write SetAspect;
    property Contrast: Byte read GetContrast write SetContrast;
    property SerifVariant: Byte read GetSerifVariant write SetSerifVariant;
    property Treatment: Byte read GetTreatment write SetTreatment;
    property Lining: Byte read GetLining write SetLining;
    property Topology: Byte read GetTopology write SetTopology;
    property RangeOfCharacters: Byte read GetRangeOfCharacters write SetRangeOfCharacters;
  end;

  TPascalTypeLatinSymbolPanoseTable = class(TCustomPascalTypePanoseTable)
  private
    function GetAspectRatioCharacter119: Byte;
    function GetAspectRatioCharacter157: Byte;
    function GetAspectRatioCharacter163: Byte;
    function GetAspectRatioCharacter211: Byte;
    function GetAspectRatioCharacter94: Byte;
    function GetAspectRatioContrast: Byte;
    function GetKind: Byte;
    function GetSpacing: Byte;
    function GetWeight: Byte;
    procedure SetAspectRatioCharacter119(const Value: Byte);
    procedure SetAspectRatioCharacter157(const Value: Byte);
    procedure SetAspectRatioCharacter163(const Value: Byte);
    procedure SetAspectRatioCharacter211(const Value: Byte);
    procedure SetAspectRatioCharacter94(const Value: Byte);
    procedure SetAspectRatioContrast(const Value: Byte);
    procedure SetKind(const Value: Byte);
    procedure SetSpacing(const Value: Byte);
    procedure SetWeight(const Value: Byte);
  protected
    class function GetFamilyType: Byte; override;
    procedure KindChanged; virtual;
    procedure WeightChanged; virtual;
    procedure SpacingChanged; virtual;
    procedure AspectRatioContrastChanged; virtual;
    procedure AspectRatioCharacter94Changed; virtual;
    procedure AspectRatioCharacter119Changed; virtual;
    procedure AspectRatioCharacter157Changed; virtual;
    procedure AspectRatioCharacter163Changed; virtual;
    procedure AspectRatioCharacter211Changed; virtual;
  public
    property Kind: Byte read GetKind write SetKind;
    property Weight: Byte read GetWeight write SetWeight;
    property Spacing: Byte read GetSpacing write SetSpacing;
    property AspectRatioContrast: Byte read GetAspectRatioContrast write SetAspectRatioContrast;
    property AspectRatioCharacter94: Byte read GetAspectRatioCharacter94 write SetAspectRatioCharacter94;
    property AspectRatioCharacter119: Byte read GetAspectRatioCharacter119 write SetAspectRatioCharacter119;
    property AspectRatioCharacter157: Byte read GetAspectRatioCharacter157 write SetAspectRatioCharacter157;
    property AspectRatioCharacter163: Byte read GetAspectRatioCharacter163 write SetAspectRatioCharacter163;
    property AspectRatioCharacter211: Byte read GetAspectRatioCharacter211 write SetAspectRatioCharacter211;
  end;

function LatinTextSerifStyleToString(SerifStyle: Byte): string;
function LatinTextWeightToString(Weight: Byte): string;
function LatinTextProportionToString(Proportion: Byte): string;
function LatinTextContrastToString(Contrast: Byte): string;
function LatinTextStrokeVariationToString(StrokeVariation: Byte): string;
function LatinTextArmStyleToString(ArmStyle: Byte): string;
function LatinTextLetterformToString(Letterform: Byte): string;
function LatinTextMidlineToString(Midline: Byte): string;
function LatinTextXHeightToString(XHeight: Byte): string;

function LatinHandWrittenToolKindToString(ToolKind: Byte): string;
function LatinHandWrittenWeightToString(Weight: Byte): string;
function LatinHandWrittenSpacingToString(Spacing: Byte): string;
function LatinHandWrittenAspectRatioToString(AspectRatio: Byte): string;
function LatinHandWrittenContrastToString(Contrast: Byte): string;
function LatinHandWrittenTopologyToString(Topology: Byte): string;
function LatinHandWrittenFormToString(Form: Byte): string;
function LatinHandWrittenFinialsToString(Finials: Byte): string;
function LatinHandWrittenXAscentToString(XAscent: Byte): string;

function LatinDecorativeFontClassToString(FontClass: Byte): string;
function LatinDecorativeWeightToString(Weight: Byte): string;
function LatinDecorativeAspectToString(Aspect: Byte): string;
function LatinDecorativeContrastToString(Contrast: Byte): string;
function LatinDecorativeSerifVariantToString(SerifVariant: Byte): string;
function LatinDecorativeTreatmentToString(Treatment: Byte): string;
function LatinDecorativeLiningToString(Lining: Byte): string;
function LatinDecorativeTopologyToString(Topology: Byte): string;
function LatinDecorativeRangeOfCharactersToString(RangeOfCharacters: Byte): string;

function LatinSymboleKindToString(Kind: Byte): string;
function LatinSymboleWeightToString(Weight: Byte): string;
function LatinSymboleSpacingToString(Spacing: Byte): string;
function LatinSymboleAspectRatioContrastToString(AspectRatioContrast: Byte): string;
function LatinSymboleAspectRatioCharacter94ToString(AspectRatio: Byte): string;
function LatinSymboleAspectRatioCharacter119ToString(AspectRatio: Byte): string;
function LatinSymboleAspectRatioCharacter157ToString(AspectRatio: Byte): string;
function LatinSymboleAspectRatioCharacter163ToString(AspectRatio: Byte): string;
function LatinSymboleAspectRatioCharacter211ToString(AspectRatio: Byte): string;

implementation

function LatinTextSerifStyleToString(SerifStyle: Byte): string;
const
  CLatinTextSerifStyleText : array [0..15] of string = ('Any', 'No Fit',
    'Cove', 'Obtuse Cove', 'Square Cove', 'Obtuse Square Cove', 'Square',
    'Thin', 'Oval', 'Exaggerated', 'Triangle', 'Normal Sans', 'Obtuse Sans',
    'Perpendicular Sans', 'Flared', 'Rounded');
begin
 if SerifStyle in [0..15]
  then Result := CLatinTextSerifStyleText[SerifStyle]
  else Result := 'Unknown';
end;

function LatinTextWeightToString(Weight: Byte): string;
const
  CLatinTextWeightText : array [0..11] of string = ('Any', 'No Fit',
    'Very Light', 'Light', 'Thin', 'Book', 'Medium', 'Demi', 'Bold', 'Heavy',
    'Black', 'Extra Black');
begin
 if Weight in [0..11]
  then Result := CLatinTextWeightText[Weight]
  else Result := 'Unknown';
end;

function LatinTextProportionToString(Proportion: Byte): string;
const
  CLatinTextProportionText : array [0..9] of string = ('Any', 'No Fit',
    'Old Style', 'Modern', 'Even Width', 'Extended', 'Condensed',
    'Very Extended', 'Very Condensed', 'Monospaced');
begin
 if Proportion in [0..9]
  then Result := CLatinTextProportionText[Proportion]
  else Result := 'Unknown';
end;

function LatinTextContrastToString(Contrast: Byte): string;
const
  CLatinTextContrastText : array [0..9] of string = ('Any', 'No Fit',
    'None', 'Very Low', 'Low', 'Medium Low', 'Medium', 'Medium High',
    'High', 'Very High');
begin
 if Contrast in [0..9]
  then Result := CLatinTextContrastText[Contrast]
  else Result := 'Unknown';
end;

function LatinTextStrokeVariationToString(StrokeVariation: Byte): string;
const
  CLatinTextStrokeVariationText : array [0..10] of string = ('Any', 'No Fit',
    'No Variation', 'Gradual/Diagonal', 'Gradual/Transitional',
    'Gradual/Vertical', 'Gradual/Horizontal', 'Rapid/Vertical',
    'Rapid/Horizontal', 'Instant/Vertical', 'Instant/Horizontal');
begin
 if StrokeVariation in [0..10]
  then Result := CLatinTextStrokeVariationText[StrokeVariation]
  else Result := 'Unknown';
end;

function LatinTextArmStyleToString(ArmStyle: Byte): string;
const
  CLatinTextArmStyleText : array [0..11] of string = ('Any', 'No Fit',
    'Straight Arms/Horizontal', 'Straight Arms/Wedge',
    'Straight Arms/Vertical', 'Straight Arms/Single Serif',
    'Straight Arms/Double Serif', 'Non-Straight/Horizontal',
    'Non-Straight/Wedge', 'Non-Straight/Vertical', 'Non-Straight/Single Serif',
    'Non-Straight/Double Serif');
begin
 if ArmStyle in [0..11]
  then Result := CLatinTextArmStyleText[ArmStyle]
  else Result := 'Unknown';
end;

function LatinTextLetterformToString(Letterform: Byte): string;
const
  CLatinTextLetterformText : array [0..15] of string = ('Any', 'No Fit',
    'Normal/Contact', 'Normal/Weighted', 'Normal/Boxed', 'Normal/Flattened',
    'Normal/Rounded', 'Normal/Off Center', 'Normal/Square', 'Oblique/Contact',
    'Oblique/Weighted', 'Oblique/Boxed', 'Oblique/Flattened', 'Oblique/Rounded',
    'Oblique/Off Center', 'Oblique/Square');
begin
 if Letterform in [0..15]
  then Result := CLatinTextLetterformText[Letterform]
  else Result := 'Unknown';
end;

function LatinTextMidlineToString(Midline: Byte): string;
const
  CLatinTextMidlineText : array [0..13] of string = ('Any', 'No Fit',
    'Standard/Trimmed', 'Standard/Pointed', 'Standard/Serifed',
    'High/Trimmed', 'High/Pointed', 'High/Serifed', 'Constant/Trimmed',
    'Constant/Pointed', 'Constant/Serifed', 'Low/Trimmed', 'Low/Pointed',
    'Low/Serifed');
begin
 if Midline in [0..13]
  then Result := CLatinTextMidlineText[Midline]
  else Result := 'Unknown';
end;

function LatinTextXHeightToString(XHeight: Byte): string;
const
  CLatinTextXHeightText : array [0..7] of string = ('Any', 'No Fit',
    'Constant/Small', 'Constant/Standard', 'Constant/Large',
    'Ducking/Small', 'Ducking/Standard', 'Ducking/Large');
begin
 if XHeight in [0..7]
  then Result := CLatinTextXHeightText[XHeight]
  else Result := 'Unknown';
end;

////////////////////////////////////////////////////////////////////////////////

function LatinHandWrittenToolKindToString(ToolKind: Byte): string;
const
  CLatinHandWrittenToolKindText : array [0..9] of string = ('Any', 'No Fit',
    'Flat Nib', 'Pressure Point', 'Engraved', 'Ball (Round Cap)', 'Brush',
    'Rough', 'Felt Pen/Brush Tip', 'Wild Brush - Drips a lot');
begin
 if ToolKind in [0..9]
  then Result := CLatinHandWrittenToolKindText[ToolKind]
  else Result := 'Unknown';
end;

function LatinHandWrittenWeightToString(Weight: Byte): string;
const
  CLatinHandWrittenWeightText : array [0..11] of string = ('Any', 'No Fit',
    'Very Light', 'Light', 'Thin', 'Book', 'Medium', 'Demi', 'Bold', 'Heavy',
    'Black', 'Extra Black (Nord)');
begin
 if Weight in [0..11]
  then Result := CLatinHandWrittenWeightText[Weight]
  else Result := 'Unknown';
end;

function LatinHandWrittenSpacingToString(Spacing: Byte): string;
const
  CLatinHandWrittenSpacingText : array [0..3] of string = ('Any', 'No Fit',
    'Proportional Spaced', 'Monospaced');
begin
 if Spacing in [0..3]
  then Result := CLatinHandWrittenSpacingText[Spacing]
  else Result := 'Unknown';
end;

function LatinHandWrittenAspectRatioToString(AspectRatio: Byte): string;
const
  CLatinHandWrittenAspectRatioText : array [0..6] of string = ('Any', 'No Fit',
    'Very Condensed', 'Condensed', 'Normal', 'Expanded', 'Very Expanded');
begin
 if AspectRatio in [0..6]
  then Result := CLatinHandWrittenAspectRatioText[AspectRatio]
  else Result := 'Unknown';
end;

function LatinHandWrittenContrastToString(Contrast: Byte): string;
const
  CLatinHandWrittenContrastText : array [0..9] of string = ('Any', 'No Fit',
    'None', 'Very Low', 'Low', 'Medium Low', 'Medium', 'Medium High', 'High',
    'Very High');
begin
 if Contrast in [0..9]
  then Result := CLatinHandWrittenContrastText[Contrast]
  else Result := 'Unknown';
end;

function LatinHandWrittenTopologyToString(Topology: Byte): string;
const
  CLatinHandWrittenTopologyText : array [0..10] of string = ('Any', 'No Fit',
    'Roman Disconnected', 'Roman Trailing', 'Roman Connected',
    'Cursive Disconnected', 'Cursive Trailing', 'Cursive Connected',
    'Blackletter Disconnected', 'Blackletter Trailing',
    'Blackletter Connected');
begin
 if Topology in [0..10]
  then Result := CLatinHandWrittenTopologyText[Topology]
  else Result := 'Unknown';
end;

function LatinHandWrittenFormToString(Form: Byte): string;
const
  CLatinHandWrittenFormText : array [0..13] of string = ('Any', 'No Fit',
    'Upright / No Wrapping', 'Upright / Some Wrapping',
    'Upright / More Wrapping', 'Upright / Extreme Wrapping',
    'Oblique / No Wrapping', 'Oblique / Some Wrapping',
    'Oblique / More Wrapping', 'Oblique / Extreme Wrapping',
    'Exaggerated / No Wrapping', 'Exaggerated / Some Wrapping',
    'Exaggerated / More Wrapping', 'Exaggerated / Extreme Wrapping');
begin
 if Form in [0..13]
  then Result := CLatinHandWrittenFormText[Form]
  else Result := 'Unknown';
end;

function LatinHandWrittenFinialsToString(Finials: Byte): string;
const
  CLatinHandWrittenFinialsText : array [0..13] of string = ('Any', 'No Fit',
    'None / No loops', 'None / Closed loops', 'None / Open loops',
    'Sharp / No loops', 'Sharp / Closed loops', 'Sharp / Open loops',
    'Tapered / No loops', 'Tapered / Closed loops', 'Tapered / Open loops',
    'Round / No loops', 'Round / Closed loops', 'Round / Open loops');
begin
 if Finials in [0..13]
  then Result := CLatinHandWrittenFinialsText[Finials]
  else Result := 'Unknown';
end;

function LatinHandWrittenXAscentToString(XAscent: Byte): string;
const
  CLatinHandWrittenXAscentText : array [0..6] of string = ('Any', 'No Fit',
    'Very Low', 'Low', 'Medium', 'High', 'Very High');
begin
 if XAscent in [0..6]
  then Result := CLatinHandWrittenXAscentText[XAscent]
  else Result := 'Unknown';
end;

////////////////////////////////////////////////////////////////////////////////

function LatinDecorativeFontClassToString(FontClass: Byte): string;
const
  CLatinDecorativeFontClassText : array [0..12] of string = ('Any', 'No Fit',
    'Derivative', 'Non-standard Topology', 'Non-standard Elements',
    'Non-standard Aspect', 'Initials', 'Cartoon', 'Picture Stems',
    'Ornamented', 'Text and Background', 'Collage', 'Montage');
begin
 if FontClass in [0..12]
  then Result := CLatinDecorativeFontClassText[FontClass]
  else Result := 'Unknown';
end;

function LatinDecorativeWeightToString(Weight: Byte): string;
const
  CLatinDecorativeWeightText : array [0..11] of string = ('Any', 'No Fit',
    'Very Light', 'Light', 'Thin', 'Book', 'Medium', 'Demi', 'Bold',
    'Heavy', 'Black', 'Extra Black');
begin
 if Weight in [0..11]
  then Result := CLatinDecorativeWeightText[Weight]
  else Result := 'Unknown';
end;

function LatinDecorativeAspectToString(Aspect: Byte): string;
const
  CLatinDecorativeAspectText : array [0..9] of string = ('Any', 'No Fit',
    'Super Condensed', 'Very Condensed', 'Condensed', 'Normal', 'Extended',
    'Very Extended', 'Super Extended', 'Monospaced');
begin
 if Aspect in [0..9]
  then Result := CLatinDecorativeAspectText[Aspect]
  else Result := 'Unknown';
end;

function LatinDecorativeContrastToString(Contrast: Byte): string;
const
  CLatinDecorativeContrastText : array [0..13] of string = ('Any', 'No Fit',
    'None', 'Very Low', 'Low', 'Medium Low', 'Medium', 'Medium High',
    'High', 'Very High', 'Horizontal Low', 'Horizontal Medium',
    'Horizontal High', 'Broken');
begin
 if Contrast in [0..13]
  then Result := CLatinDecorativeContrastText[Contrast]
  else Result := 'Unknown';
end;

function LatinDecorativeSerifVariantToString(SerifVariant: Byte): string;
const
  CLatinDecorativeSerifVariantText : array [0..16] of string = ('Any', 'No Fit',
    'Cove', 'Obtuse Cove', 'Square Cove', 'Obtuse Square Cove', 'Square',
    'Thin', 'Oval', 'Exaggerated', 'Triangle', 'Normal Sans', 'Obtuse Sans',
    'Perpendicular Sans', 'Flared', 'Rounded', 'Script');
begin
 if SerifVariant in [0..16]
  then Result := CLatinDecorativeSerifVariantText[SerifVariant]
  else Result := 'Unknown';
end;

function LatinDecorativeTreatmentToString(Treatment: Byte): string;
const
  CLatinDecorativeTreatmentText : array [0..7] of string = ('Any', 'No Fit',
    'None - Standard Solid Fill', 'White / No Fill', 'Patterned Fill',
    'Complex Fill', 'Shaped Fill', 'Drawn / Distressed');
begin
 if Treatment in [0..7]
  then Result := CLatinDecorativeTreatmentText[Treatment]
  else Result := 'Unknown';
end;

function LatinDecorativeLiningToString(Lining: Byte): string;
const
  CLatinDecorativeLiningText : array [0..8] of string = ('Any', 'No Fit',
    'None', 'Inline', 'Outline', 'Engraved (Multiple Lines)', 'Shadow',
    'Relief', 'Backdrop');
begin
 if Lining in [0..8]
  then Result := CLatinDecorativeLiningText[Lining]
  else Result := 'Unknown';
end;

function LatinDecorativeTopologyToString(Topology: Byte): string;
const
  CLatinDecorativeTopologyText : array [0..15] of string = ('Any', 'No Fit',
    'Standard', 'Square', 'Multiple Segment', 'Deco (E,M,S) Waco midlines',
    'Uneven Weighting', 'Diverse Arms', 'Diverse Forms', 'Lombardic Forms',
    'Upper Case in Lower Case', 'Implied Topology', 'Horseshoe E and A',
    'Cursive', 'Blackletter', 'Swash Variance');
begin
 if Topology in [0..15]
  then Result := CLatinDecorativeTopologyText[Topology]
  else Result := 'Unknown';
end;

function LatinDecorativeRangeOfCharactersToString(RangeOfCharacters: Byte): string;
const
  CLatinDecorativeRangeOfCharactersText : array [0..5] of string = ('Any',
    'No Fit', 'Extended Collection', 'Litterals', 'No Lower Case',
    'Small Caps');
begin
 if RangeOfCharacters in [0..5]
  then Result := CLatinDecorativeRangeOfCharactersText[RangeOfCharacters]
  else Result := 'Unknown';
end;

////////////////////////////////////////////////////////////////////////////////

function LatinSymboleKindToString(Kind: Byte): string;
const
  CLatinSymboleKindText : array [0..5] of string = ('Any', 'No Fit',
    'Latin Text', 'Latin Hand Written', 'Latin Decorative', 'Latin Symbol');
begin
 if Kind in [0..5]
  then Result := CLatinSymboleKindText[Kind]
  else Result := 'Unknown';
end;

function LatinSymboleWeightToString(Weight: Byte): string;
const
  CLatinSymboleWeightText : array [0..12] of string = ('Any', 'No Fit',
    'Montages', 'Pictures', 'Shapes', 'Scientific', 'Music',
    'Expert', 'Patterns', 'Boarders', 'Icons', 'Logos', 'Industry specific');
begin
 if Weight in [0..12]
  then Result := CLatinSymboleWeightText[Weight]
  else Result := 'Unknown';
end;

function LatinSymboleSpacingToString(Spacing: Byte): string;
const
  CLatinSymboleSpacingText : array [0..3] of string = ('Any', 'No Fit',
    'Proportional Spaced', 'Monospaced');
begin
 if Spacing in [0..3]
  then Result := CLatinSymboleSpacingText[Spacing]
  else Result := 'Unknown';
end;

function LatinSymboleAspectRatioContrastToString(AspectRatioContrast: Byte): string;
begin
 if AspectRatioContrast = 1
  then Result := 'No Fit'
  else Result := 'Unknown';
end;

function LatinSymboleAspectRatioCharacter94ToString(AspectRatio: Byte): string;
const
  CLatinSymboleAspectRatioText : array [0..9] of string = ('Any', 'No Fit',
    'No Width', 'Exceptionally Wide', 'Super Wide', 'Very Wide', 'Wide',
    'Normal', 'Narrow', 'Very Narrow');
begin
 if AspectRatio in [0..9]
  then Result := CLatinSymboleAspectRatioText[AspectRatio]
  else Result := 'Unknown';
end;

function LatinSymboleAspectRatioCharacter119ToString(AspectRatio: Byte): string;
const
  CLatinSymboleAspectRatioText : array [0..9] of string = ('Any', 'No Fit',
    'No Width', 'Exceptionally Wide', 'Super Wide', 'Very Wide', 'Wide',
    'Normal', 'Narrow', 'Very Narrow');
begin
 if AspectRatio in [0..9]
  then Result := CLatinSymboleAspectRatioText[AspectRatio]
  else Result := 'Unknown';
end;

function LatinSymboleAspectRatioCharacter157ToString(AspectRatio: Byte): string;
const
  CLatinSymboleAspectRatioText : array [0..9] of string = ('Any', 'No Fit',
    'No Width', 'Exceptionally Wide', 'Super Wide', 'Very Wide', 'Wide',
    'Normal', 'Narrow', 'Very Narrow');
begin
 if AspectRatio in [0..9]
  then Result := CLatinSymboleAspectRatioText[AspectRatio]
  else Result := 'Unknown';
end;

function LatinSymboleAspectRatioCharacter163ToString(AspectRatio: Byte): string;
const
  CLatinSymboleAspectRatioText : array [0..9] of string = ('Any', 'No Fit',
    'No Width', 'Exceptionally Wide', 'Super Wide', 'Very Wide', 'Wide',
    'Normal', 'Narrow', 'Very Narrow');
begin
 if AspectRatio in [0..9]
  then Result := CLatinSymboleAspectRatioText[AspectRatio]
  else Result := 'Unknown';
end;

function LatinSymboleAspectRatioCharacter211ToString(AspectRatio: Byte): string;
const
  CLatinSymboleAspectRatioText : array [0..9] of string = ('Any', 'No Fit',
    'No Width', 'Exceptionally Wide', 'Super Wide', 'Very Wide', 'Wide',
    'Normal', 'Narrow', 'Very Narrow');
begin
 if AspectRatio in [0..9]
  then Result := CLatinSymboleAspectRatioText[AspectRatio]
  else Result := 'Unknown';
end;



{ TPascalTypeLatinTextPanoseTable }

class function TPascalTypeLatinTextPanoseTable.GetFamilyType: Byte;
begin
 Result := 2;
end;

function TPascalTypeLatinTextPanoseTable.GetSerifStyle: Byte;
begin
 Result := FData[0];
end;

function TPascalTypeLatinTextPanoseTable.GetWeight: Byte;
begin
 Result := FData[1];
end;

function TPascalTypeLatinTextPanoseTable.GetProportion: Byte;
begin
 Result := FData[2];
end;

function TPascalTypeLatinTextPanoseTable.GetContrast: Byte;
begin
 Result := FData[3];
end;

function TPascalTypeLatinTextPanoseTable.GetStrokeVariation: Byte;
begin
 Result := FData[4];
end;

function TPascalTypeLatinTextPanoseTable.GetArmStyle: Byte;
begin
 Result := FData[5];
end;

function TPascalTypeLatinTextPanoseTable.GetLetterform: Byte;
begin
 Result := FData[6];
end;

function TPascalTypeLatinTextPanoseTable.GetMidline: Byte;
begin
 Result := FData[7];
end;

function TPascalTypeLatinTextPanoseTable.GetXHeight: Byte;
begin
 Result := FData[8];
end;

procedure TPascalTypeLatinTextPanoseTable.SetSerifStyle(const Value: Byte);
begin
 if FData[0] <> Value then
  begin
   FData[0] := Value;
   SerifStyleChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetWeight(const Value: Byte);
begin
 if FData[1] <> Value then
  begin
   FData[1] := Value;
   WeightChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetProportion(const Value: Byte);
begin
 if FData[2] <> Value then
  begin
   FData[2] := Value;
   ProportionChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetContrast(const Value: Byte);
begin
 if FData[3] <> Value then
  begin
   FData[3] := Value;
   ContrastChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetStrokeVariation(const Value: Byte);
begin
 if FData[4] <> Value then
  begin
   FData[4] := Value;
   StrokeVariationChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetArmStyle(const Value: Byte);
begin
 if FData[5] <> Value then
  begin
   FData[5] := Value;
   ArmStyleChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetLetterform(const Value: Byte);
begin
 if FData[6] <> Value then
  begin
   FData[6] := Value;
   LetterformChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetMidline(const Value: Byte);
begin
 if FData[7] <> Value then
  begin
   FData[7] := Value;
   MidlineChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.SetXHeight(const Value: Byte);
begin
 if FData[8] <> Value then
  begin
   FData[8] := Value;
   XHeightChanged;
  end;
end;

procedure TPascalTypeLatinTextPanoseTable.ArmStyleChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.ContrastChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.LetterformChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.MidlineChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.ProportionChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.SerifStyleChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.StrokeVariationChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.WeightChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinTextPanoseTable.XHeightChanged;
begin
 Changed;
end;


{ TPascalTypeLatinHandWrittenPanoseTable }

class function TPascalTypeLatinHandWrittenPanoseTable.GetFamilyType: Byte;
begin
 Result := 3;
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetToolKind: Byte;
begin
 Result := FData[0];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetWeight: Byte;
begin
 Result := FData[1];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetSpacing: Byte;
begin
 Result := FData[2];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetAspectRatio: Byte;
begin
 Result := FData[3];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetContrast: Byte;
begin
 Result := FData[4];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetTopology: Byte;
begin
 Result := FData[5];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetForm: Byte;
begin
 Result := FData[6];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetFinials: Byte;
begin
 Result := FData[7];
end;

function TPascalTypeLatinHandWrittenPanoseTable.GetXAscent: Byte;
begin
 Result := FData[8];
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetToolKind(const Value: Byte);
begin
 if FData[0] <> Value then
  begin
   FData[0] := Value;
   ToolKindChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetWeight(const Value: Byte);
begin
 if FData[1] <> Value then
  begin
   FData[1] := Value;
   WeightChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetSpacing(const Value: Byte);
begin
 if FData[2] <> Value then
  begin
   FData[2] := Value;
   SpacingChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetAspectRatio(const Value: Byte);
begin
 if FData[3] <> Value then
  begin
   FData[3] := Value;
   AspectRatioChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetContrast(const Value: Byte);
begin
 if FData[4] <> Value then
  begin
   FData[4] := Value;
   ContrastChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetTopology(const Value: Byte);
begin
 if FData[5] <> Value then
  begin
   FData[5] := Value;
   TopologyChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetForm(const Value: Byte);
begin
 if FData[6] <> Value then
  begin
   FData[6] := Value;
   FormChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetFinials(const Value: Byte);
begin
 if FData[7] <> Value then
  begin
   FData[7] := Value;
   FinialsChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SetXAscent(const Value: Byte);
begin
 if FData[8] <> Value then
  begin
   FData[8] := Value;
   XAscentChanged;
  end;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.TopologyChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.AspectRatioChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.FormChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.FinialsChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.SpacingChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.ToolKindChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.ContrastChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.WeightChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinHandWrittenPanoseTable.XAscentChanged;
begin
 Changed;
end;


{ TPascalTypeLatinDecorativePanoseTable }

class function TPascalTypeLatinDecorativePanoseTable.GetFamilyType: Byte;
begin
 Result := 4;
end;

function TPascalTypeLatinDecorativePanoseTable.GetFontClass: Byte;
begin
 Result := FData[0];
end;

function TPascalTypeLatinDecorativePanoseTable.GetWeight: Byte;
begin
 Result := FData[1];
end;

function TPascalTypeLatinDecorativePanoseTable.GetAspect: Byte;
begin
 Result := FData[2];
end;

function TPascalTypeLatinDecorativePanoseTable.GetContrast: Byte;
begin
 Result := FData[3];
end;

function TPascalTypeLatinDecorativePanoseTable.GetSerifVariant: Byte;
begin
 Result := FData[4];
end;

function TPascalTypeLatinDecorativePanoseTable.GetTreatment: Byte;
begin
 Result := FData[5];
end;

function TPascalTypeLatinDecorativePanoseTable.GetLining: Byte;
begin
 Result := FData[6];
end;

function TPascalTypeLatinDecorativePanoseTable.GetTopology: Byte;
begin
 Result := FData[7];
end;

function TPascalTypeLatinDecorativePanoseTable.GetRangeOfCharacters: Byte;
begin
 Result := FData[8];
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetFontClass(const Value: Byte);
begin
 if FData[0] <> Value then
  begin
   FData[0] := Value;
   FontClassChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetWeight(const Value: Byte);
begin
 if FData[1] <> Value then
  begin
   FData[1] := Value;
   WeightChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetAspect(const Value: Byte);
begin
 if FData[2] <> Value then
  begin
   FData[2] := Value;
   AspectChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetContrast(const Value: Byte);
begin
 if FData[3] <> Value then
  begin
   FData[3] := Value;
   ContrastChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetSerifVariant(const Value: Byte);
begin
 if FData[4] <> Value then
  begin
   FData[4] := Value;
   SerifVariantChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetTreatment(const Value: Byte);
begin
 if FData[5] <> Value then
  begin
   FData[5] := Value;
   TreatmentChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetLining(const Value: Byte);
begin
 if FData[6] <> Value then
  begin
   FData[6] := Value;
   LiningChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetTopology(const Value: Byte);
begin
 if FData[7] <> Value then
  begin
   FData[7] := Value;
   TopologyChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SetRangeOfCharacters(const Value: Byte);
begin
 if FData[8] <> Value then
  begin
   FData[8] := Value;
   RangeOfCharactersChanged;
  end;
end;

procedure TPascalTypeLatinDecorativePanoseTable.TreatmentChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.ContrastChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.LiningChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.TopologyChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.AspectChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.FontClassChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.SerifVariantChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.WeightChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinDecorativePanoseTable.RangeOfCharactersChanged;
begin
 Changed;
end;


{ TPascalTypeLatinSymbolPanoseTable }

class function TPascalTypeLatinSymbolPanoseTable.GetFamilyType: Byte;
begin
 Result := 5;
end;

function TPascalTypeLatinSymbolPanoseTable.GetKind: Byte;
begin
 Result := FData[0];
end;

function TPascalTypeLatinSymbolPanoseTable.GetWeight: Byte;
begin
 Result := FData[1];
end;

function TPascalTypeLatinSymbolPanoseTable.GetSpacing: Byte;
begin
 Result := FData[2];
end;

function TPascalTypeLatinSymbolPanoseTable.GetAspectRatioContrast: Byte;
begin
 Result := FData[3];
end;

function TPascalTypeLatinSymbolPanoseTable.GetAspectRatioCharacter94: Byte;
begin
 Result := FData[4];
end;

function TPascalTypeLatinSymbolPanoseTable.GetAspectRatioCharacter119: Byte;
begin
 Result := FData[5];
end;

function TPascalTypeLatinSymbolPanoseTable.GetAspectRatioCharacter157: Byte;
begin
 Result := FData[6];
end;

function TPascalTypeLatinSymbolPanoseTable.GetAspectRatioCharacter163: Byte;
begin
 Result := FData[7];
end;

function TPascalTypeLatinSymbolPanoseTable.GetAspectRatioCharacter211: Byte;
begin
 Result := FData[8];
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetKind(const Value: Byte);
begin
 if FData[0] <> Value then
  begin
   FData[0] := Value;
   KindChanged;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetWeight(const Value: Byte);
begin
 if FData[1] <> Value then
  begin
   FData[1] := Value;
   WeightChanged;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetSpacing(const Value: Byte);
begin
 if FData[2] <> Value then
  begin
   FData[2] := Value;
   SpacingChanged;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetAspectRatioContrast(const Value: Byte);
begin
 if FData[3] <> Value then
  begin
   FData[3] := Value;
   AspectRatioContrastChanged;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetAspectRatioCharacter94(const Value: Byte);
begin
 if FData[4] <> Value then
  begin
   FData[4] := Value;
   AspectRatioCharacter94Changed;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetAspectRatioCharacter119(const Value: Byte);
begin
 if FData[5] <> Value then
  begin
   FData[5] := Value;
   AspectRatioCharacter119Changed;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetAspectRatioCharacter157(const Value: Byte);
begin
 if FData[6] <> Value then
  begin
   FData[6] := Value;
   AspectRatioCharacter157Changed;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetAspectRatioCharacter163(const Value: Byte);
begin
 if FData[7] <> Value then
  begin
   FData[7] := Value;
   AspectRatioCharacter163Changed;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SetAspectRatioCharacter211(const Value: Byte);
begin
 if FData[8] <> Value then
  begin
   FData[8] := Value;
   AspectRatioCharacter211Changed;
  end;
end;

procedure TPascalTypeLatinSymbolPanoseTable.AspectRatioCharacter119Changed;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.AspectRatioContrastChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.AspectRatioCharacter157Changed;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.AspectRatioCharacter163Changed;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.SpacingChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.KindChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.AspectRatioCharacter94Changed;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.WeightChanged;
begin
 Changed;
end;

procedure TPascalTypeLatinSymbolPanoseTable.AspectRatioCharacter211Changed;
begin
 Changed;
end;


initialization
  RegisterPascalTypePanoses([TPascalTypeLatinTextPanoseTable,
    TPascalTypeLatinHandWrittenPanoseTable,
    TPascalTypeLatinDecorativePanoseTable,
    TPascalTypeLatinSymbolPanoseTable]);

end.
