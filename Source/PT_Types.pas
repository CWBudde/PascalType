unit PT_Types;

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

uses
  SysUtils;

type
  EPascalTypeError = class(Exception);
  EPascalTypeTableIncomplete = class(EPascalTypeError);
  EPascalTypeNotImplemented = class(EPascalTypeError);

  {$IFDEF ValidateEveryReadOperation}
  EPascalTypeStremReadError = class(EPascalTypeTableIncomplete);
  {$ENDIF}

  {$IFDEF ChecksumTest}
  EPascalTypeChecksumError = class(EPascalTypeError);
  {$ENDIF}

  TTableName = array [0..3] of AnsiChar;

  TTableType = record
  {$IFDEF SUPPORTS_ENHANCED_RECORDS}
    constructor Create(const Value: Integer); overload;
    constructor Create(const Value: AnsiString); overload;

    class operator Equal(const Lhs, Rhs: TTableType): Boolean; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
    class operator NotEqual(const Lhs, Rhs: TTableType): Boolean; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}

    class operator Implicit(const Value: AnsiString): TTableType; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
    class operator Implicit(const Value: TTableName): TTableType; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
    class operator Implicit(const Value: Integer): TTableType; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
    class operator Explicit(const Value: TTableType): string; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
    class operator Explicit(const Value: TTableType): AnsiString; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
    class operator Explicit(const Value: TTableType): Integer; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
  {$ENDIF}
  case Integer of
    0: (AsCardinal : Cardinal);
    1: (AsInteger  : Integer);
    2: (AsAnsiChar : TTableName);
  end;

  TFixedPoint = packed record
  {$IFDEF SUPPORTS_ENHANCED_RECORDS}
  public
    constructor Create(const Fixed: Integer); overload;
    constructor Create(const Fract: Word; Value: SmallInt); overload;

    // operator overloads
    class operator Equal(const Lhs, Rhs: TFixedPoint): Boolean;
    class operator NotEqual(const Lhs, Rhs: TFixedPoint): Boolean;
    class operator LessThan(const Lhs, Rhs: TFixedPoint): Boolean;
    class operator LessThanOrEqual(const Lhs, Rhs: TFixedPoint): Boolean;
    class operator GreaterThan(const Lhs, Rhs: TFixedPoint): Boolean;
    class operator GreaterThanOrEqual(const Lhs, Rhs: TFixedPoint): Boolean;
    class operator Negative(const Value: TFixedPoint): TFixedPoint;
    class operator Positive(const Value: TFixedPoint): TFixedPoint;
    class operator Add(const Lhs, Rhs: TFixedPoint): TFixedPoint;
    class operator Subtract(const Lhs, Rhs: TFixedPoint): TFixedPoint;
    class operator Multiply(const Lhs, Rhs: TFixedPoint): TFixedPoint;
    class operator Divide(const Lhs, Rhs: TFixedPoint): TFixedPoint;
    class operator Round(const Value: TFixedPoint): Integer;
    class operator LeftShift(const Value: TFixedPoint; Shift: Byte): TFixedPoint;
    class operator RightShift(const Value: TFixedPoint; Shift: Byte): TFixedPoint;

    class function Zero: TFixedPoint; inline; static;
    class function One: TFixedPoint; inline; static;
    class function Two: TFixedPoint; inline; static;
    class function Half: TFixedPoint; inline; static;

    class operator Implicit(const Value: Single): TFixedPoint;
    class operator Implicit(const Value: Double): TFixedPoint;
    class operator Implicit(const Value: Integer): TFixedPoint;
    class operator Explicit(const Value: TFixedPoint): Single;
    class operator Explicit(const Value: TFixedPoint): Double;

    function AsSingle: Single;
  {$ENDIF}
  case Integer of
    0: (Fixed: Integer);
    1: (Fract: Word; Value: SmallInt);
  end;

  TF26Dot6 = type Integer;
  TF2Dot14 = type SmallInt;

  {$IFDEF UseFloatingPoint}
  TScaleType = type Double;
  {$ELSE}
  TScaleType = type TF26Dot6;
  {$ENDIF}

  {$IFDEF UseFloatingPoint}
  TSmallScaleType = type Single;
  {$ELSE}
  TSmallScaleType = type TF2Dot14;
  {$ENDIF}

  TSmallScaleMatrix = array [0..1, 0..1] of TSmallScaleType;

  TShortFrac = type SmallInt;

  TTransformationMatrix = packed record
    xx: TFixedPoint;
    xy: TFixedPoint;
    yx: TFixedPoint;
    yy: TFixedPoint;
  end;

  TGetGlyphOutlineFlag = (ggoGlyphIndex  = 7, ggoUnhinted = 8, ggoBezier = 9);
  TGetGlyphOutlineFlags = set of TGetGlyphOutlineFlag;

  TGetGlyphOutlineFormat = (
    ggoMetrics     =   0,
    ggoBitmap      =   1,
    ggoNative      =   2,
    ggoGray2Bitmap =   4,
    ggoGray4Bitmap =   5,
    ggoGray8Bitmap =   6
  );

  TGetGlyphOutlineUnion = record
  case Boolean of
   True  : (Format : TGetGlyphOutlineFormat);
   False : (Flags  : TGetGlyphOutlineFlags);
  end;

  {$Z2}
  TFontHeaderTableFlag = (
    htfZeroSpecBaseline,  // bit 0 - y value of 0 specifies baseline
    htfXPosLSB,           // bit 1 - x position of left most black bit is LSB
    htfScaledSizeDiffers, // bit 2 - scaled point size and actual point size will differ (i.e. 24 point glyph differs from 12 point glyph scaled by factor of 2)
    htfIntegerScaling,    // bit 3 - use integer scaling instead of fractional
    htfAdvanceWidth,      // bit 4 - (used by the Microsoft implementation of the TrueType scaler)
    htfVertical,          // bit 5 - This bit should be set in fonts that are intended to e laid out vertically, and in which the glyphs have been drawn such that an x-coordinate of 0 corresponds to the desired vertical baseline.
    htfZero,              // bit 6 - This bit must be set to zero.
    htfLinguistic,        // bit 7 - This bit should be set if the font requires layout for correct linguistic rendering (e.g. Arabic fonts).
    htfMetamorphosis,     // bit 8 - This bit should be set for a GX font which has one or more metamorphosis effects designated as happening by default.
    htfRightToLeft,       // bit 9 - This bit should be set if the font contains any strong right-to-left glyphs.
    htfRearrangement,     // bit 10 - This bit should be set if the font contains Indic-style rearrangement effects.
    htfLossless,          // bit 11 - Font data is 'lossless,' as a result of having been compressed and decompressed with the Agfa MicroType Express engine.
    htfFontConverted,     // bit 12 - Font converted (produce compatible metrics)
    htfClearType          // bit 13 - Font optimized for ClearType™. Note, fonts that rely on embedded bitmaps (EBDT) for rendering should not be considered optimized for ClearType, and therefore should keep this bit cleared.
    );
  TFontHeaderTableFlags = set of TFontHeaderTableFlag;

  TGlyphDataOutlineFlag = (
    ofOnCurve = 0,      // If set, the point is on the curve; Otherwise, it is off the curve.
    ofXShortVector = 1, // If set, the corresponding x-coordinate is 1 byte long; Otherwise, the corresponding x-coordinate is 2 bytes long
    ofYShortVector = 2, // If set, the corresponding y-coordinate is 1 byte long; Otherwise, the corresponding y-coordinate is 2 bytes long
    ofRepeat = 3,       // If set, the next byte specifies the number of additional times this set of flags is to be repeated. In this way, the number of flags listed can be smaller than the number of points in a character.
    ofNoXChange = 4,    // This flag has one of two meanings, depending on how the x-Short Vector flag is set. If the x-Short Vector bit is set, this bit describes the sign of the value, with a value of 1 equalling positive and a zero value negative. If the x-short Vector bit is not set, and this bit is set, then the current x-coordinate is the same as the previous x-coordinate. If the x-short Vector bit is not set, and this bit is not set, the current x-coordinate is a signed 16-bit delta vector. In this case, the delta vector is the change in x
    ofNoYChange = 5     // This flag has one of two meanings, depending on how the y-Short Vector flag is set. If the y-Short Vector bit is set, this bit describes the sign of the value, with a value of 1 equalling positive and a zero value negative. If the y-short Vector bit is not set, and this bit is set, then the current y-coordinate is the same as the previous y-coordinate. If the y-short Vector bit is not set, and this bit is not set, the current y-coordinate is a signed 16-bit delta vector. In this case, the delta vector is the change in y
  );

  {$Z2}
  TMacStyle = (msBold, msItalic, msUnderline, msOutline, msShadow,
    msCondensed, msExtended);
  TMacStyles = set of TMacStyle;
  PMacStyles = ^TMacStyles;

  TFontStyle = (fsBold, fsItalic, fsUnderline, fsStrikeOut);
  TFontStyles = set of TFontStyle;

  TIndexToLocationFormat = (ilShort = 0, ilLong = 1);

  TOS2WeightClass = (
    wcUnknownWeight = 0,
    wcThin = 100,
    wcExtraLight = 200,
    wcLight = 300,
    wcNormal = 400,
    wcMedium = 500,
    wcSemiBold = 600,
    wcBold = 700,
    wcExtraBold = 800,
    wcBlack = 900
  );

  {$A2}
  TOS2WidthClass = (
    wcUnknownWidth = 0,
    wcUltraCondensed = 1,
    wcExtraCondensed = 2,
    wcCondensed = 3,
    wcSemiCondensed = 4,
    wcMediumNormal = 5,
    wcSemiExpanded = 6,
    wcExpanded = 7,
    wcExtraExpanded = 8,
    wcUltraExpanded = 9
  );

  TOS2FontEmbeddingRight = (
    wcRestricted,
    wcPreviewAndPrint,
    wcEditableEmbedding,
    wcNoSubsetting,
    wcBitmapEmbeddingOnly
  );
  TOS2FontEmbeddingRights = set of TOS2FontEmbeddingRight;

  TOS2UnicodeRange = array [0..3] of Cardinal;
  TOS2CodePageRange = array [0..1] of Cardinal;

  TOS2FontSelectionFlag = (
    fsfItalic         = 0, // Font contains italic or oblique characters, otherwise they are upright.
    fsfUnderscore     = 1, // Characters are underscored.
    fsfNegative       = 2, // Characters have their foreground and background reversed.
    fsfOutlined       = 3, // Outline (hollow) characters, otherwise they are solid.
    fsfStrikeout      = 4, // Characters are overstruck.
    fsfBold           = 5, // Characters are emboldened.
    fsfRegular        = 6, // Characters are in the standard weight/style for the font.
    fsfUseTypoMetrics = 7, // If set, it is strongly recommended to use OS/2.sTypoAscender - OS/2.sTypoDescender + OS/2.sTypoLineGap as a value for default line spacing for this font.
    fsfWws            = 8, // The font has ‘name’ table strings consistent with a weight/width/slope family without requiring use of ‘name’ IDs 21 and 22.
    fsfOblique        = 9  // Font contains oblique characters.
  );
  TOS2FontSelectionFlags = set of TOS2FontSelectionFlag;

  TFontDirectionHint = (           // Deprecated (set to 2)
    fdhRightToLeftNeutrals = -2,   // right to left glyphs containing neutrals
    fdhRightToLeft = -1,           // Only strongly right to left glyphs
    fdhMixedDirectionalGlyphs = 0, // Mixed directional glyphs
    fdhLeftToRight =  1,           // Only strongly left to right glyphs
    fdhLeftToRightNeutrals =  2    // left to right glyphs containing neutrals
  );

  {$Z2}
  TPlatformID = (
    piUnicode   = 0,  // Indicates Unicode version.
    piApple     = 1,  // Script Manager code.
    piISO       = 2,  // ISO encoding (do not use)
    piMicrosoft = 3,  // Microsoft encoding
    piCustom    = 4   // Custom
  );

  TUnicodeEncodingID = (
    ueDefaultSemantics = 0,  // Default semantics
    ueVersion1Semantics = 1, // Version 1.1 semantics
    ueISO_10646_1993 = 2,    // semantics (deprecated)
    ueUnicode2BMP = 3,       // Unicode 2.0 and onwards semantics, Unicode BMP only
    ueUnicode2Full = 4,      // Unicode 2.0 and onwards semantics, Unicode full repertoire
    ueUnicodeVarSeq = 5      // Unicode Variation Sequences
  );

  TMicrosoftEncodingID = (
    meSymbol =  0,
    meUnicodeBMP =  1,
    meShiftJIS =  2,
    mePRC =  3,
    meBig5 =  4,
    meWansung =  5,
    meJohab =  6,
    meUnicodeUCS4 = 10
  );

  TAppleEncodingID = (
    aeRoman = 0,
    aeJapanese = 1,
    aeTraditionalChinese = 2,
    aeKorean = 3,
    aeArabic = 4,
    aeHebrew = 5,
    aeGreek = 6,
    aeRussian = 7,
    aeRSymbol = 8,
    aeDevanagari = 9,
    aeGurmukhi = 10,
    aeGujarati = 11,
    aeOriya = 12,
    aeBengali = 13,
    aeTamil = 14,
    aeTelugu = 15,
    aeKannada = 16,
    aeMalayalam = 17,
    aeSinhalese = 18,
    aeBurmese = 19,
    aeKhmer = 20,
    aeThai = 21,
    aeLaotian = 22,
    aeGeorgian = 23,
    aeArmenian = 24,
    aeSimplifiedChinese = 25,
    aeTibetan = 26,
    aeMongolian = 27,
    aeGeez = 28,
    aeSlavic = 29,
    aeVietnamese = 30,
    aeSindhi = 31,
    aeUninterpreted = 32
  );

  TMacLanguageID = (
    mlEnglish = 0,
    mlFrench = 1,
    mlGerman = 2,
    mlItalian = 3,
    mlDutch = 4,
    mlSwedish = 5,
    mlSpanish = 6,
    mlDanish = 7,
    mlPortuguese = 8,
    mlNorwegian = 9,
    mlHebrew = 10,
    mlJapanese = 11,
    mlArabic = 12,
    mlFinnish = 13,
    mlGreek = 14,
    mlIcelandic = 15,
    mlMaltese = 16,
    mlTurkish = 17,
    mlCroatian = 18,
    mlChineseTraditional = 19,
    mlUrdu = 20,
    mlHindi = 21,
    mlThai = 22,
    mlKorean = 23,
    mlLithuanian = 24,
    mlPolish = 25,
    mlHungarian = 26,
    mlEstonian = 27,
    mlLatvian = 28,
    mlSami = 29,
    mlFaroese = 30,
    mlFarsiPersian = 31,
    mlRussian = 32,
    mlChineseSimplified = 33,
    mlFlemish = 34,
    mlIrishGaelic = 35,
    mlAlbanian = 36,
    mlRomanian = 37,
    mlCzech = 38,
    mlSlovak = 39,
    mlSlovenian = 40,
    mlYiddish = 41,
    mlSerbian = 42,
    mlMacedonian = 43,
    mlBulgarian = 44,
    mlUkrainian = 45,
    mlByelorussian = 46,
    mlUzbek = 47,
    mlKazakh = 48,
    mlAzerbaijaniCyrillic = 49,
    mlAzerbaijaniArabic = 50,
    mlArmenian = 51,
    mlGeorgian = 52,
    mlMoldavian = 53,
    mlKirghiz = 54,
    mlTajiki = 55,
    mlTurkmen = 56,
    mlMongolian = 57,
    mlMongolianCyrillic = 58,
    mlPashto = 59,
    mlKurdish = 60,
    mlKashmiri = 61,
    mlSindhi = 62,
    mlTibetan = 63,
    mlNepali = 64,
    mlSanskrit = 65,
    mlMarathi = 66,
    mlBengali = 67,
    mlAssamese = 68,
    mlGujarati = 69,
    mlPunjabi = 70,
    mlOriya = 71,
    mlMalayalam = 72,
    mlKannada = 73,
    mlTamil = 74,
    mlTelugu = 75,
    mlSinhalese = 76,
    mlBurmese = 77,
    mlKhmer = 78,
    mlLao = 79,
    mlVietnamese = 80,
    mlIndonesian = 81,
    mlTagalog = 82,
    mlMalayRoman = 83,
    mlMalayArabic = 84,
    mlAmharic = 85,
    mlTigrinya = 86,
    mlGalla = 87,
    mlSomali = 88,
    mlSwahili = 89,
    mlKinyarwandaRuanda = 90,
    mlRundi = 91,
    mlNyanjaChewa = 92,
    mlMalagasy = 93,
    mlEsperanto = 94,
    mlWelsh = 128,
    mlBasque = 129,
    mlCatalan = 130,
    mlLatin = 131,
    mlQuechua = 132,
    mlGuarani = 133,
    mlAymara = 134,
    mlTatar = 135,
    mlUighur = 136,
    mlDzongkha = 137,
    mlJavaneseRoman = 138,
    mlSundaneseRoman = 139,
    mlGalician = 140,
    mlAfrikaans = 141,
    mlBreton = 142,
    mlInuktitut = 143,
    mlScottishGaelic = 144,
    mlManxGaelic = 145,
    mlIrishGaelicDotAbove = 146,
    mlTongan = 147,
    mlGreekPolytonic = 148,
    mlGreenlandic = 149,
    mlAzerbaijaniRoman = 150
  );

  TIsoEncodings = (
    ieASCII = 0,
    ieISO10646 = 1,
    ieISO8859 = 2
  );

  TNameID = (
    niCopyrightNotice = 0,
    niFamily = 1,
    niSubfamily = 2,
    niUniqueIdentifier = 3,
    niFullName = 4,
    niVersion = 5,
    niPostscriptName = 6,
    niTrademark = 7,
    niVendorName = 8,
    niDesignerName = 9,
    niDescription = 10,
    niVendorURL = 11,
    niDesignerURL = 12,
    niLicenseDescription = 13,
    niLicenseInformation = 14,
    niReserved = 15,
    niPreferredFamily = 16,
    niPreferredSubfamily = 17,
    niCompatibleFull = 18,
    niSampleText = 19,
    niFutureExpansion,
    niFontSpecific
  );

  TCoverageFormat = (
    cfList = 1,
    cfRange = 2
  );

  TGlyphPosition = (
    gpSingleAdjustment         = 1, // Adjust position of a single glyph
    gpPairAdjustment           = 2, // Adjust position of a pair of glyphs
    gpCursiveAttachment        = 3, // Attach cursive glyphs
    gpMarkToBaseAttachment     = 4, // Attach a combining mark to a base glyph
    gpMarkToLigatureAttachment = 5, // Attach a combining mark to a ligature
    gpMarkToMarkAttachment     = 6, // Attach a combining mark to another mark
    gpContextPositioning       = 7, // Position one or more glyphs in context
    gpChainedContext           = 8, // positioning 	Position one or more glyphs in chained context
    gpExtensionPositioning     = 9  // Extension mechanism for other positionings
  );

  TGlyphSubstitution = (
    gsSingle                       = 1, // Replace one glyph with one glyph
    gsMultiple                     = 2, // Replace one glyph with more than one glyph
    gsAlternate                    = 3, // Replace one glyph with one of many glyphs
    gsLigature                     = 4, // Replace multiple glyphs with one glyph
    gsContext                      = 5, // Replace one or more glyphs in context
    gsChainingContext              = 6, // Replace one or more glyphs in chained context
    gsExtensionSubstitution        = 7, // Extension mechanism for other substitutions (i.e. this excludes the Extension type substitution itself)
    gsReverseChainingContextSingle = 8  // Applied in reverse order, replace single glyph in chaining context
  );

  TNonAlphabeticCode = (
    nacAlphabetic = 0,
    nacDingbats = 1,
    nacPiCharacters = 2,
    nacFleurons = 3,
    nacDecorativeBorders = 4,
    nacInternationalSymbols = 5,
    nacMathSymbols = 6
  );

  {$Z2}
  TDigitalSignatureFlag = (dsfResigningProhibited);
  TDigitalSignatureFlags = set of TDigitalSignatureFlag;

  TPcl5FontNumber = packed record
    Vendor : Byte;
    Specific : array [0..2] of Byte;
  end;

  TPcl5FontNumberVendor = (
    fnAdobeSystems = Ord('A'),
    fnBitstreamInc = Ord('B'),
    fnAgfaCorporation = Ord('C'),
    fnBigelowHolmes = Ord('H'),
    fnLinotypeCompany = Ord('L'),
    fnMonotypeTypography = Ord('M')
  );

  TPcl5FontStyle = (
    fsSolid                =  0, // (normal, black)
    fsOutline              =  1, // (hollow)
    fsInline               =  2, // (incised, engraved)
    fsContour              =  3, // edged (antique, distressed)
    fsSolidShadow          =  4, // with shadow
    fsOutlineShadow        =  5, // with shadow
    fsInlineShadow         =  6, //  with shadow
    fsContourShadow        =  7, // or edged, with shadow
    fsPatternFilled        =  8,
    fsPatternFilled1       =  9, // (when more than one pattern)
    fsPatternFilled2       = 10, // (when more than two patterns)
    fsPatternFilled3       = 11, // (when more than three patterns)
    fsPatternFilledShadow  = 12, // with shadow
    fsPatternFilled1Shadow = 13, // with shadow #1 (when more than one pattern or shadow)
    fsPatternFilled2Shadow = 14, // with shadow #2 (when more than two patterns or shadows)
    fsPatternFilled3Shadow = 15, // with shadow #3 (when more than three patterns or shadows)
    fsInverse              = 16, // inverse
    fsInverseBorder        = 17  // inverse with border
  );

  TPcl5FontWidth = (       // (bits 2-4)
    fwNormal = 0,
    fwCondensed = 1,
    fwCompressed = 2,
    fwExtraCompressed = 3,
    fwUltraCompressed = 4,
    fwReserved = 5,
    fwExpanded = 6,
    fwExtraExpanded = 7
  );


  TPcl5FontPosture = (       // (bits 0-1)
    fpOblique = 0,
    fpAlternateItalic = 1,   // (backslanted, cursive, swash)
    fpReserved = 2);

  TPcl5VendorCodes = (
    vcAgfaCorporation,
    vcBitstream,
    vcLinotypeCompany,
    vcMonotypeTypography,
    vcAdobeSystems,
    vfFontRepackagers,
    vcVendorsOfUniqueTypefaces);

function CompareTableType(TableType: TTableType; TableName: TTableName): Boolean; {$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
function VersionToString(Value: TFixedPoint): string;
function FontHeaderTableFlagsToWord(Value: TFontHeaderTableFlags): Word;
function WordToFontHeaderTableFlags(Value: Word): TFontHeaderTableFlags;
function WordToDigitalSignatureFlags(Value: Word): TDigitalSignatureFlags;
function DigitalSignatureFlagsToWord(Value: TDigitalSignatureFlags): Word;
function MacStylesToWord(Value: TMacStyles): Word;
function WordToMacStyles(Value: Word): TMacStyles;
function FontEmbeddingRightsToFlags(Value: TOS2FontEmbeddingRights): Word;
function FontEmbeddingFlagsToRights(Value: Word): TOS2FontEmbeddingRights;
function FontEmbeddingRightsToString(Value: TOS2FontEmbeddingRights): string;
function FontFamilyTypeToString(Value: Word): string;
function FontFamilyClassToString(Value: Byte): string;
function UnicodeRangeToString(Value: TOS2UnicodeRange): string;
function CodePageRangeToString(Value: TOS2CodePageRange): string;
function WordToFontSelectionFlags(Value: Word): TOS2FontSelectionFlags;
function FontSelectionFlagsToWord(Value: TOS2FontSelectionFlags): Word;
function FontSelectionFlagsToString(Value: TOS2FontSelectionFlags): string;

function MacStylesToString(Value: TMacStyles): String;

function InstructionByteToString(Value: Byte): string;
function DefaultGlyphName(Value: Word): string;
function FixedPointToNonAlphabeticCode(Value: TFixedPoint): TNonAlphabeticCode;
function NonAlphabeticCodeToFixedPoint(Value: TNonAlphabeticCode): TFixedPoint;

implementation


function CompareTableType(TableType: TTableType; TableName: TTableName): Boolean;
var
  TableNameAsCardinal : Cardinal absolute TableName;
begin
  Result := TableType.AsCardinal = TableNameAsCardinal;
end;

function VersionToString(Value: TFixedPoint): string;
begin
 Result := IntToStr(Round(100 * Value.Fract / (1 shl 16)));
 if Length(Result) < 2 then Result := '0' + Result;
 if Length(Result) < 3 then Result := '0' + Result;
 Result := IntToStr(Value.Value) + '.' + Result;
end;


function FontHeaderTableFlagsToWord(Value: TFontHeaderTableFlags): Word;
begin
 if htfZeroSpecBaseline in Value then Result := 1 else Result := 0;
 if htfXPosLSB in Value then Result := Result + (1 shl 1);
 if htfScaledSizeDiffers in Value then Result := Result + (1 shl 2);
 if htfIntegerScaling in Value then Result := Result + (1 shl 3);
 if htfAdvanceWidth in Value then Result := Result + (1 shl 4);
 if htfVertical in Value then Result := Result + (1 shl 5);
 if htfZero in Value then Result := Result + (1 shl 6);
 if htfLinguistic in Value then Result := Result + (1 shl 7);
 if htfMetamorphosis in Value then Result := Result + (1 shl 8);
 if htfRightToLeft in Value then Result := Result + (1 shl 9);
 if htfRearrangement in Value then Result := Result + (1 shl 10);
 if htfLossless in Value then Result := Result + (1 shl 11);
 if htfFontConverted in Value then Result := Result + (1 shl 12);
 if htfClearType in Value then Result := Result + (1 shl 13);
end;

function WordToFontHeaderTableFlags(Value: Word): TFontHeaderTableFlags;
begin
 if (Value and 1) <> 0 then Result := [htfZeroSpecBaseline] else Result := [];
 if (Value and (1 shl  1)) <> 0 then Result := Result + [htfXPosLSB];
 if (Value and (1 shl  2)) <> 0 then Result := Result + [htfScaledSizeDiffers];
 if (Value and (1 shl  3)) <> 0 then Result := Result + [htfIntegerScaling];
 if (Value and (1 shl  4)) <> 0 then Result := Result + [htfAdvanceWidth];
 if (Value and (1 shl  5)) <> 0 then Result := Result + [htfVertical];
 if (Value and (1 shl  6)) <> 0 then Result := Result + [htfZero];
 if (Value and (1 shl  7)) <> 0 then Result := Result + [htfLinguistic];
 if (Value and (1 shl  8)) <> 0 then Result := Result + [htfMetamorphosis];
 if (Value and (1 shl  9)) <> 0 then Result := Result + [htfRightToLeft];
 if (Value and (1 shl 10)) <> 0 then Result := Result + [htfRearrangement];
 if (Value and (1 shl 11)) <> 0 then Result := Result + [htfLossless];
 if (Value and (1 shl 12)) <> 0 then Result := Result + [htfFontConverted];
 if (Value and (1 shl 13)) <> 0 then Result := Result + [htfClearType];
end;

function MacStylesToWord(Value: TMacStyles): Word;
begin
 if msBold in Value then Result := 1 else Result := 0;
 if msItalic in Value then Result := Result + (1 shl 1);
 if msUnderline in Value then Result := Result + (1 shl 2);
 if msOutline in Value then Result := Result + (1 shl 3);
 if msShadow in Value then Result := Result + (1 shl 4);
 if msCondensed in Value then Result := Result + (1 shl 5);
 if msExtended in Value then Result := Result + (1 shl 6);
end;

function WordToMacStyles(Value: Word): TMacStyles;
begin
 if (Value and 1) <> 0 then Result := [msBold] else Result := [];
 if (Value and (1 shl  1)) <> 0 then Result := Result + [msItalic];
 if (Value and (1 shl  2)) <> 0 then Result := Result + [msUnderline];
 if (Value and (1 shl  3)) <> 0 then Result := Result + [msOutline];
 if (Value and (1 shl  4)) <> 0 then Result := Result + [msShadow];
 if (Value and (1 shl  5)) <> 0 then Result := Result + [msCondensed];
 if (Value and (1 shl  6)) <> 0 then Result := Result + [msExtended];
end;

function MacStylesToString(Value: TMacStyles): String;
begin
 if msBold in Value then Result := 'Bold, ' else Result := '';
 if msItalic in Value then Result := Result + 'Italic, ';
 if msUnderline in Value then Result := Result + 'Underline, ';
 if msOutline in Value then Result := Result + 'Outline, ';
 if msShadow in Value then Result := Result + 'Shadow, ';
 if msCondensed in Value then Result := Result + 'Condensed, ';
 if msExtended in Value then Result := Result + 'Extended, ';

 // eventually remove last comma
 if Length(Result) > 2 then SetLength(Result, Length(Result) - 2);
end;

function InstructionByteToString(Value: Byte): string;
begin
 case Value of
  $00..$01 : Result := 'SVTCA[a]';
  $02..$03 : Result := 'SPVTCA[a]';
  $04..$05 : Result := 'SFVTCA[a]';
  $06..$07 : Result := 'SPVTL[a]';
  $08..$09 : Result := 'SFVTL[a]';
  $0A      : Result := 'SPVFS';
  $0B      : Result := 'SFVFS';
  $0C      : Result := 'GPV';
  $0D      : Result := 'GFV';
  $0E      : Result := 'SFVTPV';
  $0F      : Result := 'ISECT';
  $10      : Result := 'SRP0';
  $11      : Result := 'SRP1';
  $12      : Result := 'SRP2';
  $13      : Result := 'SZP0';
  $14      : Result := 'SZP1';
  $15      : Result := 'SZP2';
  $16      : Result := 'SZPS';
  $17      : Result := 'SLOOP';
  $18      : Result := 'RTG';
  $19      : Result := 'RTHG';
  $1A      : Result := 'SMD';
  $1B      : Result := 'ELSE';
  $1C      : Result := 'JMPR';
  $1D      : Result := 'SCVTCI';
  $1E      : Result := 'SSWCI';
  $1F      : Result := 'SSW';
  $20      : Result := 'DUP';
  $21      : Result := 'POP';
  $22      : Result := 'CLEAR';
  $23      : Result := 'SWAP';
  $24      : Result := 'DEPTH';
  $25      : Result := 'CINDEX';
  $26      : Result := 'MINDEX';
  $27      : Result := 'ALIGNPTS';
  $29      : Result := 'UTP';
  $2A      : Result := 'LOOPCALL';
  $2B      : Result := 'CALL';
  $2C      : Result := 'FDEF';
  $2D      : Result := 'ENDF';
  $2E..$2F : Result := 'MDAP[ a ]';
  $30..$31 : Result := 'IUP[a]';
  $32..$33 : Result := 'SHP[a]';
  $34..$35 : Result := 'SHC[a]';
  $36..$37 : Result := 'SHZ[a]';
  $38      : Result := 'SHPIX';
  $39      : Result := 'IP';
  $3A..$3B : Result := 'MSIRP[a]';
  $3C      : Result := 'ALIGNRP';
  $3D      : Result := 'RTDG';
  $3E..$3F : Result := 'MIAP[a]';
  $40      : Result := 'NPUSHB';
  $41      : Result := 'NPUSHW';
  $42      : Result := 'WS';
  $43      : Result := 'RS';
  $44      : Result := 'WCVTP';
  $45      : Result := 'RCVT';
  $46..$47 : Result := 'GC[a]';
  $48      : Result := 'SCFS';
  $49..$4A : Result := 'MD[a]';
  $4B      : Result := 'MPPEM';
  $4C      : Result := 'MPS';
  $4D      : Result := 'FLIPON';
  $4E      : Result := 'FLIPOFF';
  $4F      : Result := 'DEBUG';
  $50      : Result := 'LT';
  $51      : Result := 'LTEQ';
  $52      : Result := 'GT';
  $53      : Result := 'GTEQ';
  $54      : Result := 'EQ';
  $55      : Result := 'NEQ';
  $56      : Result := 'ODD';
  $57      : Result := 'EVEN';
  $58      : Result := 'IF';
  $59      : Result := 'EIF';
  $5A      : Result := 'AND';
  $5B      : Result := 'OR';
  $5C      : Result := 'NOT';
  $5D      : Result := 'DELTAP1';
  $5E      : Result := 'SDB';
  $5F      : Result := 'SDS';
  $60      : Result := 'ADD';
  $61      : Result := 'SUB';
  $62      : Result := 'DIV';
  $63      : Result := 'MUL';
  $64      : Result := 'ABS';
  $65      : Result := 'NEG';
  $66      : Result := 'FLOOR';
  $67      : Result := 'CEILING';
  $68..$6B : Result := 'ROUND[ab]';
  $6C..$6F : Result := 'NROUND[ab]';
  $70      : Result := 'WCVTF';
  $71      : Result := 'DELTAP2';
  $72      : Result := 'DELTAP3';
  $73      : Result := 'DELTAC1,';
  $74      : Result := 'DELTAC2';
  $75      : Result := 'DELTAC3';
  $76      : Result := 'SROUND';
  $77      : Result := 'S45ROUND';
  $78      : Result := 'JROT';
  $79      : Result := 'JROF';
  $7A      : Result := 'ROFF';
  $7C      : Result := 'RUTG';
  $7D      : Result := 'RDTG';
  $7E      : Result := 'SANGW';
  $7F      : Result := 'AA';
  $80      : Result := 'FLIPPT';
  $81      : Result := 'FLIPRGON';
  $82      : Result := 'FLIPRGOFF';
  $85      : Result := 'SCANCTRL';
  $86..$87 : Result := 'SDPVTL[a]';
  $88      : Result := 'GETINFO';
  $89      : Result := 'IDEF';
  $8a      : Result := 'ROLL';
  $8B      : Result := 'MAX';
  $8C      : Result := 'MIN';
  $8D      : Result := 'SCANTYPE';
  $8E      : Result := 'INSTCTRL';
  $B0..$B7 : Result := 'PUSHB';
  $B8..$BF : Result := 'PUSHW';
  $C0..$DF : Result := 'MDRP[abcde]';
  $E0..$FF : Result := 'MIRP[abcde]';
  else Result := 'opcode undefined'
 end;
end;

function WordToDigitalSignatureFlags(Value: Word): TDigitalSignatureFlags;
begin
 if Value = 1
  then Result := [dsfResigningProhibited]
  else Result := [];
end;

function DigitalSignatureFlagsToWord(Value: TDigitalSignatureFlags): Word;
begin
 if dsfResigningProhibited in Value
  then Result := 1
  else Result := 0;
end;

function FontEmbeddingRightsToFlags(Value: TOS2FontEmbeddingRights): Word;
begin
 if wcRestricted in Value then Result := 2 else Result := 0;
 if wcPreviewAndPrint in Value then Result := Result + 1 shl 2;
 if wcEditableEmbedding in Value then Result := Result + 1 shl 3;
 if wcNoSubsetting in Value then Result := Result + 1 shl 8;
 if wcBitmapEmbeddingOnly in Value then Result := Result + 1 shl 9;
end;

function FontEmbeddingFlagsToRights(Value: Word): TOS2FontEmbeddingRights;
begin
 if (Value and (1 shl 1)) <> 0 then Result := [wcRestricted] else Result := [];
 if (Value and (1 shl 2)) <> 0 then Result := Result + [wcPreviewAndPrint];
 if (Value and (1 shl 3)) <> 0 then Result := Result + [wcEditableEmbedding];
 if (Value and (1 shl 8)) <> 0 then Result := Result + [wcNoSubsetting];
 if (Value and (1 shl 9)) <> 0 then Result := Result + [wcBitmapEmbeddingOnly];
end;

function FontEmbeddingRightsToString(Value: TOS2FontEmbeddingRights): string;
begin
 if wcRestricted in Value then Result := 'Restricted, ' else Result := '';
 if wcPreviewAndPrint in Value then Result := Result + 'Preview and Print, ';
 if wcEditableEmbedding in Value then Result := Result + 'Editable Embedding, ';
 if wcNoSubsetting in Value then Result := Result + 'No Subsetting, ';
 if wcBitmapEmbeddingOnly in Value then Result := Result + 'Bitmap Embedding Only, ';

 // eventually remove last comma
 if Length(Result) > 0
  then SetLength(Result, Length(Result) - 2);
end;

function FontFamilyTypeToString(Value: Word): string;
begin
 case Value shr 8 of
   0: Result := 'No classification';
   1: begin
       Result := 'Oldstyle Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - IBM Rounded Legibility';
         2 : Result := Result + ' - Garalde';
         3 : Result := Result + ' - Venetian';
         4 : Result := Result + ' - Modified Venetian';
         5 : Result := Result + ' - Dutch Modern';
         6 : Result := Result + ' - Dutch Traditional';
         7 : Result := Result + ' - Contemporary';
         8 : Result := Result + ' - Calligraphic';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   2: begin
       Result := 'Transitional Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Direct Line';
         2 : Result := Result + ' - Script';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   3: begin
       Result := 'Modern Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Italian';
         2 : Result := Result + ' - Script';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   4: begin
       Result := 'Clarendon Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Clarendon';
         2 : Result := Result + ' - Modern';
         3 : Result := Result + ' - Traditional';
         4 : Result := Result + ' - Newspaper';
         5 : Result := Result + ' - Stub Serif';
         6 : Result := Result + ' - Monotone';
         7 : Result := Result + ' - Typewriter';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   5: begin
       Result := 'Slab Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Monotone';
         2 : Result := Result + ' - Humanist';
         3 : Result := Result + ' - Geometric';
         4 : Result := Result + ' - Swiss';
         5 : Result := Result + ' - Typewriter';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   7: begin
       Result := 'Freeform Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Modern';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   8: begin
       Result := 'Sans Serifs';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - IBM Neo-grotesque Gothic';
         2 : Result := Result + ' - Humanist';
         3 : Result := Result + ' - Low-x Round Geometric';
         4 : Result := Result + ' - High-x Round Geometric';
         5 : Result := Result + ' - Neo-grotesque Gothic';
         6 : Result := Result + ' - Modified Neo-grotesque Gothic';
         9 : Result := Result + ' - Typewriter Gothic';
        10 : Result := Result + ' - Matrix';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
   9: begin
       Result := 'Ornamentals';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Engraver';
         2 : Result := Result + ' - Black Letter';
         3 : Result := Result + ' - Decorative';
         4 : Result := Result + ' - Three Dimensional';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
  10: begin
       Result := 'Scripts';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         1 : Result := Result + ' - Uncial';
         2 : Result := Result + ' - Brush Joined';
         3 : Result := Result + ' - Formal Joined';
         4 : Result := Result + ' - Monotone Joined';
         5 : Result := Result + ' - Calligraphic';
         6 : Result := Result + ' - Brush Unjoined';
         7 : Result := Result + ' - Formal Unjoined';
         8 : Result := Result + ' - Monotone Unjoined';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
  12: begin
       Result := 'Symbolic';
       case (Value and $FF) of
         0 : Result := Result + ' - No Classification';
         3 : Result := Result + ' - Mixed Serif';
         6 : Result := Result + ' - Oldstyle Serif';
         7 : Result := Result + ' - Neo-grotesque Sans Serif';
        15 : Result := Result + ' - Miscellaneous';
        else Result := Result + ' - Unknown';
       end;
      end;
  else Result := 'Unknown';
 end;
end;

function FontFamilyClassToString(Value: Byte): string;
begin
 case Value shr 8 of
   0: Result := 'No classification';
   1: Result := 'Oldstyle Serifs';
   2: Result := 'Transitional Serifs';
   3: Result := 'Modern Serifs';
   4: Result := 'Clarendon Serifs';
   5: Result := 'Slab Serifs';
   7: Result := 'Freeform Serifs';
   8: Result := 'Sans Serifs';
   9: Result := 'Ornamentals';
  10: Result := 'Scripts';
  12: Result := 'Symbolic';
 else Result := 'Unknown';
 end;
end;

function UnicodeRangeToString(Value: TOS2UnicodeRange): string;
begin
 if (Value[0] and 1) <> 0 then Result := 'Basic Latin, ' else Result := '';
 if (Value[0] and (1 shl  1)) <> 0 then Result := Result + 'Latin-1 Supplement, ';
 if (Value[0] and (1 shl  2)) <> 0 then Result := Result + 'Latin Extended-A, ';
 if (Value[0] and (1 shl  3)) <> 0 then Result := Result + 'Latin Extended-B, ';
 if (Value[0] and (1 shl  4)) <> 0 then Result := Result + 'IPA & Phonetic Extensions, ';
 if (Value[0] and (1 shl  5)) <> 0 then Result := Result + 'Spacing Modifier & Modifier Tone Letters, ';
 if (Value[0] and (1 shl  6)) <> 0 then Result := Result + 'Combining Diacritical Marks, ';
 if (Value[0] and (1 shl  7)) <> 0 then Result := Result + 'Greek and Coptic, ';
 if (Value[0] and (1 shl  8)) <> 0 then Result := Result + 'Coptic, ';
 if (Value[0] and (1 shl  9)) <> 0 then Result := Result + 'Cyrillic, ';
 if (Value[0] and (1 shl 10)) <> 0 then Result := Result + 'Armenian, ';
 if (Value[0] and (1 shl 11)) <> 0 then Result := Result + 'Hebrew, ';
 if (Value[0] and (1 shl 12)) <> 0 then Result := Result + 'Vai, ';
 if (Value[0] and (1 shl 13)) <> 0 then Result := Result + 'Arabic, ';
 if (Value[0] and (1 shl 14)) <> 0 then Result := Result + 'N''Ko, ';
 if (Value[0] and (1 shl 15)) <> 0 then Result := Result + 'Devanagari, ';
 if (Value[0] and (1 shl 16)) <> 0 then Result := Result + 'Bengali, ';
 if (Value[0] and (1 shl 17)) <> 0 then Result := Result + 'Gurmukhi, ';
 if (Value[0] and (1 shl 18)) <> 0 then Result := Result + 'Gujarati, ';
 if (Value[0] and (1 shl 19)) <> 0 then Result := Result + 'Oriya, ';
 if (Value[0] and (1 shl 20)) <> 0 then Result := Result + 'Tamil, ';
 if (Value[0] and (1 shl 21)) <> 0 then Result := Result + 'Telugu, ';
 if (Value[0] and (1 shl 22)) <> 0 then Result := Result + 'Kannada, ';
 if (Value[0] and (1 shl 23)) <> 0 then Result := Result + 'Malayalam, ';
 if (Value[0] and (1 shl 24)) <> 0 then Result := Result + 'Thai, ';
 if (Value[0] and (1 shl 25)) <> 0 then Result := Result + 'Lao, ';
 if (Value[0] and (1 shl 26)) <> 0 then Result := Result + 'Georgian, ';
 if (Value[0] and (1 shl 27)) <> 0 then Result := Result + 'Balinese, ';
 if (Value[0] and (1 shl 28)) <> 0 then Result := Result + 'Hangul Jamo, ';
 if (Value[0] and (1 shl 29)) <> 0 then Result := Result + 'Latin Extended Additional, ';
 if (Value[0] and (1 shl 30)) <> 0 then Result := Result + 'Greek Extended, ';
 if (Value[0] and (1 shl 31)) <> 0 then Result := Result + 'General & Supplemental Punctuation, ';
 if (Value[1] and (1 shl  0)) <> 0 then Result := Result + 'Superscripts And Subscripts, ';
 if (Value[1] and (1 shl  1)) <> 0 then Result := Result + 'Currency Symbols, ';
 if (Value[1] and (1 shl  2)) <> 0 then Result := Result + 'Combining Diacritical Marks For Symbols, ';
 if (Value[1] and (1 shl  3)) <> 0 then Result := Result + 'Letterlike Symbols, ';
 if (Value[1] and (1 shl  4)) <> 0 then Result := Result + 'Number Forms, ';
 if (Value[1] and (1 shl  5)) <> 0 then Result := Result + 'Arrows & Miscellaneous Symbols, ';
 if (Value[1] and (1 shl  6)) <> 0 then Result := Result + 'Mathematical Operators & Symbols, ';
 if (Value[1] and (1 shl  7)) <> 0 then Result := Result + 'Miscellaneous Technical, ';
 if (Value[1] and (1 shl  8)) <> 0 then Result := Result + 'Control Pictures, ';
 if (Value[1] and (1 shl  9)) <> 0 then Result := Result + 'Optical Character Recognition, ';
 if (Value[1] and (1 shl 10)) <> 0 then Result := Result + 'Enclosed Alphanumerics, ';
 if (Value[1] and (1 shl 11)) <> 0 then Result := Result + 'Box Drawing, ';
 if (Value[1] and (1 shl 12)) <> 0 then Result := Result + 'Block Elements, ';
 if (Value[1] and (1 shl 13)) <> 0 then Result := Result + 'Geometric Shapes, ';
 if (Value[1] and (1 shl 14)) <> 0 then Result := Result + 'Miscellaneous Symbols, ';
 if (Value[1] and (1 shl 15)) <> 0 then Result := Result + 'Dingbats, ';
 if (Value[1] and (1 shl 16)) <> 0 then Result := Result + 'CJK Symbols And Punctuation, ';
 if (Value[1] and (1 shl 17)) <> 0 then Result := Result + 'Hiragana, ';
 if (Value[1] and (1 shl 18)) <> 0 then Result := Result + 'Katakana, ';
 if (Value[1] and (1 shl 19)) <> 0 then Result := Result + 'Bopomofo, ';
 if (Value[1] and (1 shl 20)) <> 0 then Result := Result + 'Hangul Compatibility Jamo, ';
 if (Value[1] and (1 shl 21)) <> 0 then Result := Result + 'Phags-pa, ';
 if (Value[1] and (1 shl 22)) <> 0 then Result := Result + 'Enclosed CJK Letters And Months, ';
 if (Value[1] and (1 shl 23)) <> 0 then Result := Result + 'CJK Compatibility, ';
 if (Value[1] and (1 shl 24)) <> 0 then Result := Result + 'Hangul Syllables, ';
 if (Value[1] and (1 shl 25)) <> 0 then Result := Result + 'Non-Plane 0 *, ';
 if (Value[1] and (1 shl 26)) <> 0 then Result := Result + 'Phoenician, ';
 if (Value[1] and (1 shl 27)) <> 0 then Result := Result + 'CJK Unified Ideographs ' +
   '& Radicals Supplement, Kangxi Radicals, ' +
   'Ideographic Description Characters, CJK Radicals, Kanbun';
 if (Value[1] and (1 shl 28)) <> 0 then Result := Result + 'Private Use Area (plane 0), ';
 if (Value[1] and (1 shl 29)) <> 0 then Result := Result + 'CJK Strokes & Compatibility Ideographs, ';
 if (Value[1] and (1 shl 30)) <> 0 then Result := Result + 'Alphabetic Presentation Forms, ';
 if (Value[1] and (1 shl 31)) <> 0 then Result := Result + 'Arabic Presentation Forms-A, ';
 if (Value[2] and (1 shl  0)) <> 0 then Result := Result + 'Combining Half Marks, ';
 if (Value[2] and (1 shl  1)) <> 0 then Result := Result + 'Vertical & CJK Compatibility Forms, ';
 if (Value[2] and (1 shl  2)) <> 0 then Result := Result + 'Small Form Variants, ';
 if (Value[2] and (1 shl  3)) <> 0 then Result := Result + 'Arabic Presentation Forms-B, ';
 if (Value[2] and (1 shl  4)) <> 0 then Result := Result + 'Halfwidth And Fullwidth Forms, ';
 if (Value[2] and (1 shl  5)) <> 0 then Result := Result + 'Specials, ';
 if (Value[2] and (1 shl  6)) <> 0 then Result := Result + 'Tibetan, ';
 if (Value[2] and (1 shl  7)) <> 0 then Result := Result + 'Syriac, ';
 if (Value[2] and (1 shl  8)) <> 0 then Result := Result + 'Thaana, ';
 if (Value[2] and (1 shl  9)) <> 0 then Result := Result + 'Sinhala, ';
 if (Value[2] and (1 shl 10)) <> 0 then Result := Result + 'Myanmar, ';
 if (Value[2] and (1 shl 11)) <> 0 then Result := Result + 'Ethiopic, ';
 if (Value[2] and (1 shl 12)) <> 0 then Result := Result + 'Cherokee, ';
 if (Value[2] and (1 shl 13)) <> 0 then Result := Result + 'Unified Canadian Aboriginal Syllabics, ';
 if (Value[2] and (1 shl 14)) <> 0 then Result := Result + 'Ogham, ';
 if (Value[2] and (1 shl 15)) <> 0 then Result := Result + 'Runic, ';
 if (Value[2] and (1 shl 16)) <> 0 then Result := Result + 'Khmer, ';
 if (Value[2] and (1 shl 17)) <> 0 then Result := Result + 'Mongolian, ';
 if (Value[2] and (1 shl 18)) <> 0 then Result := Result + 'Braille Patterns, ';
 if (Value[2] and (1 shl 19)) <> 0 then Result := Result + 'Yi Syllables & Radicals, ';
 if (Value[2] and (1 shl 20)) <> 0 then Result := Result + 'Tagalog, Hanunoo, Buhid, Tagbanwa, ';
 if (Value[2] and (1 shl 21)) <> 0 then Result := Result + 'Old Italic, ';
 if (Value[2] and (1 shl 22)) <> 0 then Result := Result + 'Gothic, ';
 if (Value[2] and (1 shl 23)) <> 0 then Result := Result + 'Deseret, ';
 if (Value[2] and (1 shl 24)) <> 0 then Result := Result + 'Byzantine Musical Symbols, Musical Symbols, Ancient Greek Musical Notation';
 if (Value[2] and (1 shl 25)) <> 0 then Result := Result + 'Mathematical Alphanumeric Symbols, ';
 if (Value[2] and (1 shl 26)) <> 0 then Result := Result + 'Private Use (plane 15-15), ';
 if (Value[2] and (1 shl 27)) <> 0 then Result := Result + 'Variation Selectors, ';
 if (Value[2] and (1 shl 28)) <> 0 then Result := Result + 'Tags, ';
 if (Value[2] and (1 shl 29)) <> 0 then Result := Result + 'Limbu, ';
 if (Value[2] and (1 shl 30)) <> 0 then Result := Result + 'Tai Le, ';
 if (Value[2] and (1 shl 31)) <> 0 then Result := Result + 'New Tai Lue, ';
 if (Value[3] and (1 shl  0)) <> 0 then Result := Result + 'Buginese, ';
 if (Value[3] and (1 shl  1)) <> 0 then Result := Result + 'Glagolitic, ';
 if (Value[3] and (1 shl  2)) <> 0 then Result := Result + 'Tifinagh, ';
 if (Value[3] and (1 shl  3)) <> 0 then Result := Result + 'Yijing Hexagram Symbols, ';
 if (Value[3] and (1 shl  4)) <> 0 then Result := Result + 'Syloti Nagri, ';
 if (Value[3] and (1 shl  5)) <> 0 then Result := Result + 'Linear B Syllabary & Ideograms, Aegean Numbers, ';
 if (Value[3] and (1 shl  6)) <> 0 then Result := Result + 'Ancient Greek Numbers, ';
 if (Value[3] and (1 shl  7)) <> 0 then Result := Result + 'Ugaritic, ';
 if (Value[3] and (1 shl  8)) <> 0 then Result := Result + 'Old Persian, ';
 if (Value[3] and (1 shl  9)) <> 0 then Result := Result + 'Shavian, ';
 if (Value[3] and (1 shl 10)) <> 0 then Result := Result + 'Osmanya, ';
 if (Value[3] and (1 shl 11)) <> 0 then Result := Result + 'Cypriot Syllabary, ';
 if (Value[3] and (1 shl 12)) <> 0 then Result := Result + 'Kharoshthi, ';
 if (Value[3] and (1 shl 13)) <> 0 then Result := Result + 'Tai Xuan Jing Symbols, ';
 if (Value[3] and (1 shl 14)) <> 0 then Result := Result + 'Cuneiform, ';
 if (Value[3] and (1 shl 15)) <> 0 then Result := Result + 'Counting Rod Numerals, ';
 if (Value[3] and (1 shl 16)) <> 0 then Result := Result + 'Sundanese, ';
 if (Value[3] and (1 shl 17)) <> 0 then Result := Result + 'Lepcha, ';
 if (Value[3] and (1 shl 18)) <> 0 then Result := Result + 'Ol Chiki, ';
 if (Value[3] and (1 shl 19)) <> 0 then Result := Result + 'Saurashtra, ';
 if (Value[3] and (1 shl 20)) <> 0 then Result := Result + 'Kayah Li, ';
 if (Value[3] and (1 shl 21)) <> 0 then Result := Result + 'Rejang, ';
 if (Value[3] and (1 shl 22)) <> 0 then Result := Result + 'Cham, ';
 if (Value[3] and (1 shl 23)) <> 0 then Result := Result + 'Ancient Symbols, ';
 if (Value[3] and (1 shl 24)) <> 0 then Result := Result + 'Phaistos Disc, ';
 if (Value[3] and (1 shl 25)) <> 0 then Result := Result + 'Carian, Lycian & Lydian, ';
 if (Value[3] and (1 shl 26)) <> 0 then Result := Result + 'Domino & Mahjong Tiles, ';

 // remove last comma
 if Length(Result) > 0
  then SetLength(Result, Length(Result) - 2);
end;

function CodePageRangeToString(Value: TOS2CodePageRange): string;
begin
 if (Value[0] and 1) <> 0 then Result := 'Latin 1, ' else Result := '';
 if (Value[0] and (1 shl  1)) <> 0 then Result := Result + 'Latin 2: Eastern Europe, ';
 if (Value[0] and (1 shl 2)) <> 0 then Result := Result + 'Cyrillic, ';
 if (Value[0] and (1 shl 3)) <> 0 then Result := Result + 'Greek, ';
 if (Value[0] and (1 shl 4)) <> 0 then Result := Result + 'Turkish, ';
 if (Value[0] and (1 shl 5)) <> 0 then Result := Result + 'Hebrew, ';
 if (Value[0] and (1 shl 6)) <> 0 then Result := Result + 'Arabic, ';
 if (Value[0] and (1 shl 7)) <> 0 then Result := Result + 'Windows Baltic, ';
 if (Value[0] and (1 shl 8)) <> 0 then Result := Result + 'Vietnamese, ';
 if (Value[0] and (1 shl 16)) <> 0 then Result := Result + 'Thai, ';
 if (Value[0] and (1 shl 17)) <> 0 then Result := Result + 'JIS/Japan, ';
 if (Value[0] and (1 shl 18)) <> 0 then Result := Result + 'Chinese: Simplified chars--PRC and Singapore, ';
 if (Value[0] and (1 shl 19)) <> 0 then Result := Result + 'Korean Wansung, ';
 if (Value[0] and (1 shl 20)) <> 0 then Result := Result + 'Chinese: Traditional chars--Taiwan and Hong Kong, ';
 if (Value[0] and (1 shl 21)) <> 0 then Result := Result + 'Korean Johab, ';
 if (Value[0] and (1 shl 29)) <> 0 then Result := Result + 'Character Set (US Roman), ';
 if (Value[0] and (1 shl 30)) <> 0 then Result := Result + 'Character Set, ';
 if (Value[0] and (1 shl 31)) <> 0 then Result := Result + 'Character Set, ';
 if (Value[0] and (1 shl 16)) <> 0 then Result := Result + 'IBM Greek, ';
 if (Value[1] and (1 shl 17)) <> 0 then Result := Result + 'MS-DOS Russian, ';
 if (Value[1] and (1 shl 18)) <> 0 then Result := Result + 'MS-DOS Nordic, ';
 if (Value[1] and (1 shl 19)) <> 0 then Result := Result + 'Arabic, ';
 if (Value[1] and (1 shl 20)) <> 0 then Result := Result + 'MS-DOS Canadian French, ';
 if (Value[1] and (1 shl 21)) <> 0 then Result := Result + 'Hebrew, ';
 if (Value[1] and (1 shl 22)) <> 0 then Result := Result + 'MS-DOS Icelandic, ';
 if (Value[1] and (1 shl 23)) <> 0 then Result := Result + 'MS-DOS Portuguese, ';
 if (Value[1] and (1 shl 24)) <> 0 then Result := Result + 'IBM Turkish, ';
 if (Value[1] and (1 shl 25)) <> 0 then Result := Result + 'IBM Cyrillic; primarily Russian, ';
 if (Value[1] and (1 shl 26)) <> 0 then Result := Result + 'Latin 2, ';
 if (Value[1] and (1 shl 27)) <> 0 then Result := Result + 'MS-DOS Baltic, ';
 if (Value[1] and (1 shl 28)) <> 0 then Result := Result + 'Greek; former 437 G, ';
 if (Value[1] and (1 shl 29)) <> 0 then Result := Result + 'Arabic; ASMO 708, ';
 if (Value[1] and (1 shl 30)) <> 0 then Result := Result + 'WE/Latin 1, ';
 if (Value[1] and (1 shl 31)) <> 0 then Result := Result + 'US, ';

 // remove last comma
 if Length(Result) > 0
  then SetLength(Result, Length(Result) - 2);
end;

function WordToFontSelectionFlags(Value: Word): TOS2FontSelectionFlags;
begin
 if (Value and 1) <> 0 then Result := [fsfItalic] else Result := [];
 if (Value and (1 shl 1)) <> 0 then Result := Result + [fsfUnderscore];
 if (Value and (1 shl 2)) <> 0 then Result := Result + [fsfNegative];
 if (Value and (1 shl 3)) <> 0 then Result := Result + [fsfOutlined];
 if (Value and (1 shl 4)) <> 0 then Result := Result + [fsfStrikeout];
 if (Value and (1 shl 5)) <> 0 then Result := Result + [fsfBold];
 if (Value and (1 shl 6)) <> 0 then Result := Result + [fsfRegular];
 if (Value and (1 shl 7)) <> 0 then Result := Result + [fsfUseTypoMetrics];
 if (Value and (1 shl 8)) <> 0 then Result := Result + [fsfWws];
 if (Value and (1 shl 9)) <> 0 then Result := Result + [fsfOblique];
end;

function FontSelectionFlagsToWord(Value: TOS2FontSelectionFlags): Word;
begin
 if fsfItalic in Value then Result := 1 else Result := 0;
 if fsfUnderscore in Value then Result := Result + 1 shl 1;
 if fsfNegative in Value then Result := Result + 1 shl 2;
 if fsfOutlined in Value then Result := Result + 1 shl 3;
 if fsfStrikeout in Value then Result := Result + 1 shl 4;
 if fsfBold in Value then Result := Result + 1 shl 5;
 if fsfRegular in Value then Result := Result + 1 shl 6;
 if fsfUseTypoMetrics in Value then Result := Result + 1 shl 7;
 if fsfWws in Value then Result := Result + 1 shl 8;
 if fsfOblique in Value then Result := Result + 1 shl 9;
end;

function FontSelectionFlagsToString(Value: TOS2FontSelectionFlags): string;
begin
 if fsfItalic in Value then Result := 'Italic, ' else Result := '';
 if fsfUnderscore in Value then Result := Result + 'Underscore, ';
 if fsfNegative in Value then Result := Result + 'Negative, ';
 if fsfOutlined in Value then Result := Result + 'Outlined, ';
 if fsfStrikeout in Value then Result := Result + 'Strikeout, ';
 if fsfBold in Value then Result := Result + 'Bold, ';
 if fsfRegular in Value then Result := Result + 'Regular, ';
 if fsfUseTypoMetrics in Value then Result := Result + 'Use Typo Metrics, ';
 if fsfWws in Value then Result := Result + 'Weight/Width/Slope, ';
 if fsfOblique in Value then Result := Result + 'Oblique, ';

 // remove last comma
 if Length(Result) > 0
  then SetLength(Result, Length(Result) - 2);
end;

function DefaultGlyphName(Value: Word): string;
const
  CDefaultGlyphNames : array [0..257] of string = ('.notdef',
    '.null', 'nonmarkingreturn', 'space', 'exclam', 'quotedbl', 'numbersign',
     'dollar', 'percent', 'ampersand', 'quotesingle', 'parenleft', 'parenright',
     'asterisk', 'plus', 'comma', 'hyphen', 'period', 'slash', 'zero', 'one',
     'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'colon',
     'semicolon', 'less', 'equal', 'greater', 'question', 'at', 'A', 'B', 'C',
     'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
     'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'bracketleft', 'backslash',
     'bracketright', 'asciicircum', 'underscore', 'grave', 'a', 'b', 'c', 'd',
     'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
     't', 'u', 'v', 'w', 'x', 'y', 'z', 'braceleft', 'bar', 'braceright',
     'asciitilde', 'Adieresis', 'Aring', 'Ccedilla', 'Eacute', 'Ntilde',
     'Odieresis', 'Udieresis', 'aacute', 'agrave', 'acircumflex', 'adieresis',
     'atilde', 'aring', 'ccedilla', 'eacute', 'egrave', 'ecircumflex',
     'edieresis', 'iacute', 'igrave', 'icircumflex', 'idieresis', 'ntilde',
     'oacute', 'ograve', 'ocircumflex', 'odieresis', 'otilde', 'uacute',
     'ugrave', 'ucircumflex', 'udieresis', 'dagger', 'degree', 'cent',
     'sterling', 'section', 'bullet', 'paragraph', 'germandbls', 'registered',
     'copyright', 'trademark', 'acute', 'dieresis', 'notequal', 'AE', 'Oslash',
     'infinity', 'plusminus', 'lessequal', 'greaterequal', 'yen', 'mu',
     'partialdiff', 'summation', 'product', 'pi', 'integral', 'ordfeminine',
     'ordmasculine', 'Omega', 'ae', 'oslash', 'questiondown', 'exclamdown',
     'logicalnot', 'radical', 'florin', 'approxequal', 'Delta',
     'guillemotleft', 'guillemotright', 'ellipsis', 'nonbreakingspace',
     'Agrave', 'Atilde', 'Otilde', 'OE', 'oe', 'endash', 'emdash',
     'quotedblleft', 'quotedblright', 'quoteleft', 'quoteright', 'divide',
     'lozenge', 'ydieresis', 'Ydieresis', 'fraction', 'currency',
     'guilsinglleft', 'guilsinglright', 'fi', 'fl', 'daggerdbl',
     'periodcentered', 'quotesinglbase', 'quotedblbase', 'perthousand',
     'Acircumflex', 'Ecircumflex', 'Aacute', 'Edieresis', 'Egrave', 'Iacute',
     'Icircumflex', 'Idieresis', 'Igrave', 'Oacute', 'Ocircumflex', 'apple',
     'Ograve', 'Uacute', 'Ucircumflex', 'Ugrave', 'dotlessi', 'circumflex',
     'tilde', 'macron', 'breve', 'dotaccent', 'ring', 'cedilla', 'hungarumlaut',
     'ogonek', 'caron', 'Lslash', 'lslash', 'Scaron', 'scaron', 'Zcaron',
     'zcaron', 'brokenbar', 'Eth', 'eth', 'Yacute', 'yacute', 'Thorn',
     'thorn', 'minus', 'multiply', 'onesuperior', 'twosuperior',
     'threesuperior', 'onehalf', 'onequarter', 'threequarters', 'franc',
     'Gbreve', 'gbreve', 'Idotaccent', 'Scedilla', 'scedilla', 'Cacute',
     'cacute', 'Ccaron', 'ccaron', 'dcroat');
begin
  if Value < 258 then
    Result := CDefaultGlyphNames[Value]
  else
    Result := '';
end;

function FixedPointToNonAlphabeticCode(Value: TFixedPoint): TNonAlphabeticCode;
begin
 case Value.Fract of
   0: Result := nacAlphabetic;
   1: Result := nacDingbats;
   2: Result := nacPiCharacters;
   3: Result := nacFleurons;
   4: Result := nacDecorativeBorders;
   5: Result := nacInternationalSymbols;
   6: Result := nacMathSymbols;
   else raise EPascalTypeError.Create('Undefined code');
 end;
end;

function NonAlphabeticCodeToFixedPoint(Value: TNonAlphabeticCode): TFixedPoint;
begin
 Result.Value := 0;
 Result.Fract := Word(Value);
end;


{$IFDEF SUPPORTS_ENHANCED_RECORDS}

{ TTableType }

constructor TTableType.Create(const Value: Integer);
begin
  Self.AsInteger := Value;
end;

constructor TTableType.Create(const Value: AnsiString);
begin
  case Length(Value) of
   0    : ;
   1..4 : Move(Value[1], Self.AsAnsiChar[0], Length(Value));
   else Move(Value[1], Self.AsAnsiChar[0], 4);
  end;
end;

class operator TTableType.Equal(const Lhs, Rhs: TTableType): Boolean;
begin
  Result := Lhs.AsInteger = Rhs.AsInteger;
end;

class operator TTableType.Explicit(const Value: TTableType): string;
begin
  Result := string(Value.AsAnsiChar);
end;

class operator TTableType.Explicit(const Value: TTableType): AnsiString;
begin
  Result := Value.AsAnsiChar;
end;

class operator TTableType.Explicit(const Value: TTableType): Integer;
begin
  Result := Value.AsInteger;
end;

class operator TTableType.NotEqual(const Lhs, Rhs: TTableType): Boolean;
begin
  Result := Lhs.AsInteger <> Rhs.AsInteger;
end;

class operator TTableType.Implicit(const Value: AnsiString): TTableType;
begin
  case Length(Value) of
   0    : ;
   1..4 : Move(Value[1], Result.AsAnsiChar[0], Length(Value));
   else Move(Value[1], Result.AsAnsiChar[0], 4);
  end;
end;

class operator TTableType.Implicit(const Value: TTableName): TTableType;
begin
  Move(Value[0], Result.AsAnsiChar[0], 4);
end;

class operator TTableType.Implicit(const Value: Integer): TTableType;
begin
  Result.AsInteger := Value;
end;


{ TFixedPoint }

const
  CFixedPointToFloat = 1 / $10000;

constructor TFixedPoint.Create(const Fixed: Integer);
begin
  Self.Fixed := Fixed;
end;

constructor TFixedPoint.Create(const Fract: Word; Value: SmallInt);
begin
  Self.Fract := Fract;
  Self.Value := Value;
end;

class operator TFixedPoint.Equal(const Lhs, Rhs: TFixedPoint): Boolean;
begin
  Result := Lhs.Fixed = Rhs.Fixed;
end;

class operator TFixedPoint.NotEqual(const Lhs, Rhs: TFixedPoint): Boolean;
begin
  Result := Lhs.Fixed <> Rhs.Fixed;
end;

class operator TFixedPoint.LessThan(const Lhs, Rhs: TFixedPoint): Boolean;
begin
  Result := Lhs.Fixed < Rhs.Fixed;
end;

class operator TFixedPoint.LessThanOrEqual(const Lhs, Rhs: TFixedPoint): Boolean;
begin
  Result := Lhs.Fixed <= Rhs.Fixed;
end;

class operator TFixedPoint.GreaterThan(const Lhs, Rhs: TFixedPoint): Boolean;
begin
  Result := Lhs.Fixed > Rhs.Fixed;
end;

class operator TFixedPoint.GreaterThanOrEqual(const Lhs, Rhs: TFixedPoint): Boolean;
begin
  Result := Lhs.Fixed >= Rhs.Fixed;
end;

class operator TFixedPoint.Negative(const Value: TFixedPoint): TFixedPoint;
begin
  Result.Fixed := -Value.Fixed;
end;

class operator TFixedPoint.Positive(const Value: TFixedPoint): TFixedPoint;
begin
  Result.Fixed := Abs(Value.Fixed);
end;

class operator TFixedPoint.Add(const Lhs, Rhs: TFixedPoint): TFixedPoint;
begin
  Result.Fixed := Lhs.Fixed + Rhs.Fixed;
end;

class operator TFixedPoint.Subtract(const Lhs, Rhs: TFixedPoint): TFixedPoint;
begin
  Result.Fixed := Lhs.Fixed - Rhs.Fixed;
end;

function FixedMul(A, B: TFixedPoint): TFixedPoint;
{$IFDEF PUREPASCAL}
var
  IntResult : Integer absolute Result;
begin
  IntResult := Round(A.Fixed * CFixed16Dot16ToFloat * B.Fixed);
{$ELSE}
asm
    {$IFDEF CPUx86_64}
    MOV     EAX, A
    IMUL    B
    SHRD    EAX, EDX, 16
    {$ELSE}
    IMUL    B
    SHRD    A, B, 16
    {$ENDIF}
{$ENDIF}
end;

function FixedDiv(A, B: TFixedPoint): TFixedPoint;
{$IFDEF PUREPASCAL}
var
  IntResult : Integer absolute Result;
begin
  IntResult := Round(A.Fixed / B.Fixed * CFixed16Dot16One.Fixed);
{$ELSE}
asm
    {$IFDEF CPUx86_64}
    MOV     RAX, RCX
    MOV     RCX, RDX
    CDQ
    SHLD    RDX, RAX, 16
    SHL     RAX, 16
    IDIV    RDX
    {$ELSE}
    MOV     ECX, B
    CDQ
    SHLD    B, A, 16
    SHL     A, 16
    IDIV    ECX
    {$ENDIF}
{$ENDIF}
end;

function FixedRound(Value: TFixedPoint): Integer;
{$IFDEF PUREPASCAL}
begin
  Result := FixedRoundHalfUp(Value) - ((((Value.Fixed + $17FFF) and $1FFFF) + 1) shr 17);
{$ELSE}
asm
    MOV     EDX, Value
    ADD     Value, $8000
    SAR     Value, 16
    ADD     EDX, $17FFF
    AND     EDX, $1FFFF
    ADD     EDX, 1
    SHR     EDX, $11
    SUB     Value, EDX
    {$IFDEF CPUx86_64}
    MOV     Result, Value
    {$ENDIF}
{$ENDIF}
end;

function FixedRoundHalfUp(Value: TFixedPoint): Integer;
{$IFDEF PUREPASCAL}
begin
  Value.Fixed := Value.Fixed + $8000;
  Result := Integer((((Value.Fixed) shr 16) or -((Value.Fixed) shr 31) shl 16));
{$ELSE}
asm
    ADD     Value, $8000
    SAR     Value, 16
    {$IFDEF CPUx86_64}
    MOV     Result, Value
    {$ENDIF}
{$ENDIF}
end;

class operator TFixedPoint.Multiply(const Lhs, Rhs: TFixedPoint): TFixedPoint;
begin
  Result := FixedMul(Lhs, Rhs);
end;

class operator TFixedPoint.Divide(const Lhs, Rhs: TFixedPoint): TFixedPoint;
begin
  Result := FixedDiv(Lhs, Rhs);
end;

class operator TFixedPoint.Round(const Value: TFixedPoint): Integer;
begin
  Result := FixedRound(Value);
end;

class operator TFixedPoint.LeftShift(const Value: TFixedPoint; Shift: Byte): TFixedPoint;
begin
  Result.Fixed := Value.Fixed shl Shift;
end;

class operator TFixedPoint.RightShift(const Value: TFixedPoint; Shift: Byte): TFixedPoint;
begin
  Result.Fixed := Value.Fixed shr Shift;
end;

class function TFixedPoint.Zero: TFixedPoint;
begin
  Result.Fixed := $0;
end;

class function TFixedPoint.One: TFixedPoint;
begin
  Result.Fixed := $10000;
end;

class function TFixedPoint.Two: TFixedPoint;
begin
  Result.Fixed := $20000;
end;

class function TFixedPoint.Half: TFixedPoint;
begin
  Result.Fixed := $8000;
end;

class operator TFixedPoint.Implicit(const Value: Single): TFixedPoint;
begin
  Result.Fixed := Round(Value * $10000);
end;

class operator TFixedPoint.Implicit(const Value: Double): TFixedPoint;
begin
  Result.Fixed := Round(Value * $10000);
end;

class operator TFixedPoint.Implicit(const Value: Integer): TFixedPoint;
begin
  Result.Fixed := Value shl 16;
end;

class operator TFixedPoint.Explicit(const Value: TFixedPoint): Single;
begin
  Result := Value.Fixed * CFixedPointToFloat;
end;

class operator TFixedPoint.Explicit(const Value: TFixedPoint): Double;
begin
  Result := Value.Fixed * CFixedPointToFloat;
end;

function TFixedPoint.AsSingle: Single;
begin
  Result := Self.Fixed * CFixedPointToFloat;
end;

{$ENDIF}

end.
