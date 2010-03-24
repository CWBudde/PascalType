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
//  Portions created by Christian-W. Budde are Copyright (C) 2010             //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

uses
  SysUtils;

type
  EPascalTypeError = class(Exception);

  TTableType = array [0..3] of AnsiChar;

  TFixedPoint = packed record
    Fract: Word;
    Value: SmallInt;
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
    ofRepeat = 3        // If set, the next byte specifies the number of additional times this set of flags is to be repeated. In this way, the number of flags listed can be smaller than the number of points in a character.
(*
    This x is same (Positive x-Short vector) = 4, // This flag has one of two meanings, depending on how the x-Short Vector flag is set. If the x-Short Vector bit is set, this bit describes the sign of the value, with a value of 1 equalling positive and a zero value negative. If the x-short Vector bit is not set, and this bit is set, then the current x-coordinate is the same as the previous x-coordinate. If the x-short Vector bit is not set, and this bit is not set, the current x-coordinate is a signed 16-bit delta vector. In this case, the delta vector is the change in x
    This y is same (Positive y-Short vector) = 5, // This flag has one of two meanings, depending on how the y-Short Vector flag is set. If the y-Short Vector bit is set, this bit describes the sign of the value, with a value of 1 equalling positive and a zero value negative. If the y-short Vector bit is not set, and this bit is set, then the current y-coordinate is the same as the previous y-coordinate. If the y-short Vector bit is not set, and this bit is not set, the current y-coordinate is a signed 16-bit delta vector. In this case, the delta vector is the change in y
    ofReserved = 6 - 7, //Set to zero
*)
  );

  {$Z2}
  TMacStyle = (msBold, msItalic, msUnderline, msOutline, msShadow,
    msCondensed, msExtended);
  TMacStyles = set of TMacStyle;
  PMacStyles = ^TMacStyles;

  TOS2WeightClass = (
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

  {$A2} // ensure this works propertly!!!
  TOS2WidthClass = (
    wcUltraCondensed = 1,
    wcExtraCondensed = 2,
    wcCondensed = 3,
    wcSemiCondensed = 4,
    wcMediumNormal = 5,
    wcSemiExpanded = 6,
    wcExpanded = 7,
    wcExtraExpanded = 8,
    wcUltraExpanded = 9,
    wcReserved = 1000 // damn workaround, see above
  );

  TOS2FontEmbeddingRight = (
    wcReserved1,
    wcRestricted,
    wcPreviewAndPrint,
    wcEditableEmbedding,
    wcReserved4,
    wcReserved5,
    wcReserved6,
    wcReserved7,
    wcNoSubsetting,
    wcBitmapEmbeddingOnly
  );
  TOS2FontEmbeddingRights = set of TOS2FontEmbeddingRight;

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
    piReserved  = 2,  // ISO encoding (do not use)
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

(*
TypeFamily

The 4 most significant bits are font vendor codes. The 12 least significant bits are typeface family codes. Both are assigned by HP Boise Division.


Vendor Codes (bits 12-15)0	reserved
1	Agfa Corporation
2	Bitstream Inc.
3	Linotype Company
4	Monotype Typography Ltd.
5	Adobe Systems
6	font repackagers
7	vendors of unique typefaces
8-15	reserved

CapHeight

The height of the optical line describing the top of the uppercase H in FUnits. This might not be the same as the measured height of the uppercase H.
SymbolSet

The most significant 11 bits are the value of the symbol set “number” field. The value of the least significant 5 bits, when added to 64, is the ASCII value of the symbol set “ID” field. Symbol set values are assigned by HP Boise Division. Unbound fonts, or “typefaces” should have a symbol set value of 0. See the PCL 5 Printer Language Technical Reference Manual or the PCL 5 Comparison Guide for the most recent published list of codes.
Examples 	PCL 	decimal 
Windows 3.1 “ANSI”	19U	629
Windows 3.0 “ANSI”	9U	309
Adobe “Symbol”	19M	621
Macintosh	12J	394
PostScript ISO Latin 1	11J	362
PostScript Std. Encoding	10J	330
Code Page 1004	9J	298
DeskTop	7J	234

TypeFace

This 16-byte ASCII string appears in the “font print” of PCL printers. Care should be taken to insure that the base string for all typefaces of a family are consistent, and that the designators for bold, italic, etc. are standardized.
Example Times New	 
 Times New	 Bd
 Times New	 It
 Times New	 BdIt
 Courier New	 
 Courier New	 Bd
 Courier New	 It
 Courier New	 BdIt

CharacterComplement

This 8-byte field identifies the symbol collections provided by the font, each bit identifies a symbol collection and is independently interpreted. Symbol set bound fonts should have this field set to all F's (except bit 0).
ExampleDOS/PCL Complement	0xFFFFFFFF003FFFFE
Windows 3.1 “ANSI”	0xFFFFFFFF37FFFFFE
Macintosh	0xFFFFFFFF36FFFFFE
ISO 8859-1 Latin 1	0xFFFFFFFF3BFFFFFE
ISO 8859-1,2,9 Latin 1,2,5	0xFFFFFFFF0BFFFFFE


The character collections identified by each bit are as follows:31	ASCII (supports several standard interpretations)
30	Latin 1 extensions
29	Latin 2 extensions
28	Latin 5 extensions
27	Desktop Publishing Extensions
26	Accent Extensions (East and West Europe)
25	PCL Extensions
24	Macintosh Extensions
23	PostScript Extensions
22	Code Page Extensions
*)


function FontHeaderTableFlagsToWord(Value: TFontHeaderTableFlags): Word;
function WordToFontHeaderTableFlags(Value: Word): TFontHeaderTableFlags;
function WordToDigitalSignatureFlags(Value: Word): TDigitalSignatureFlags;
function DigitalSignatureFlagsToWord(Value: TDigitalSignatureFlags): Word;
function MacStylesToWord(Value: TMacStyles): Word;
function WordToMacStyles(Value: Word): TMacStyles;

function MacStylesToString(Value: TMacStyles): String;

function InstructionByteToString(Value: Byte): string;
function DefaultGlyphName(Value: Word): string;

implementation

function FontHeaderTableFlagsToWord(Value: TFontHeaderTableFlags): Word;
begin
 Result := Word(Value);
// Result := ^TFontHeaderTableFlags(@Value)^;
end;

function WordToFontHeaderTableFlags(Value: Word): TFontHeaderTableFlags;
begin
 Result := TFontHeaderTableFlags(Value);
// Result := ^TFontHeaderTableFlags(@Value)^;
end;

function MacStylesToWord(Value: TMacStyles): Word;
begin
 Result := PWord(@Value)^;
end;

function WordToMacStyles(Value: Word): TMacStyles;
begin
 Result := PMacStyles(@Value)^;
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

function DefaultGlyphName(Value: Word): string;
begin
  case Value of
     0 : Result := '.notdef';
     1 : Result := '.null';
     2 : Result := 'nonmarkingreturn';
     3 : Result := 'space';
     4 : Result := 'exclam';
     5 : Result := 'quotedbl';
     6 : Result := 'numbersign';
     7 : Result := 'dollar';
     8 : Result := 'percent';
     9 : Result := 'ampersand';
    10 : Result := 'quotesingle';
    11 : Result := 'parenleft';
    12 : Result := 'parenright';
    13 : Result := 'asterisk';
    14 : Result := 'plus';
    15 : Result := 'comma';
    16 : Result := 'hyphen';
    17 : Result := 'period';
    18 : Result := 'slash';
    19 : Result := 'zero';
    20 : Result := 'one';
    21 : Result := 'two';
    22 : Result := 'three';
    23 : Result := 'four';
    24 : Result := 'five';
    25 : Result := 'six';
    26 : Result := 'seven';
    27 : Result := 'eight';
    28 : Result := 'nine';
    29 : Result := 'colon';
    30 : Result := 'semicolon';
    31 : Result := 'less';
    32 : Result := 'equal';
    33 : Result := 'greater';
    34 : Result := 'question';
    35 : Result := 'at';
    36 : Result := 'A';
    37 : Result := 'B';
    38 : Result := 'C';
    39 : Result := 'D';
    40 : Result := 'E';
    41 : Result := 'F';
    42 : Result := 'G';
    43 : Result := 'H';
    44 : Result := 'I';
    45 : Result := 'J';
    46 : Result := 'K';
    47 : Result := 'L';
    48 : Result := 'M';
    49 : Result := 'N';
    50 : Result := 'O';
    51 : Result := 'P';
    52 : Result := 'Q';
    53 : Result := 'R';
    54 : Result := 'S';
    55 : Result := 'T';
    56 : Result := 'U';
    57 : Result := 'V';
    58 : Result := 'W';
    59 : Result := 'X';
    60 : Result := 'Y';
    61 : Result := 'Z';
    62 : Result := 'bracketleft';
    63 : Result := 'backslash';
    64 : Result := 'bracketright';
    65 : Result := 'asciicircum';
    66 : Result := 'underscore';
    67 : Result := 'grave';
    68 : Result := 'a';
    69 : Result := 'b';
    70 : Result := 'c';
    71 : Result := 'd';
    72 : Result := 'e';
    73 : Result := 'f';
    74 : Result := 'g';
    75 : Result := 'h';
    76 : Result := 'i';
    77 : Result := 'j';
    78 : Result := 'k';
    79 : Result := 'l';
    80 : Result := 'm';
    81 : Result := 'n';
    82 : Result := 'o';
    83 : Result := 'p';
    84 : Result := 'q';
    85 : Result := 'r';
    86 : Result := 's';
    87 : Result := 't';
    88 : Result := 'u';
    89 : Result := 'v';
    90 : Result := 'w';
    91 : Result := 'x';
    92 : Result := 'y';
    93 : Result := 'z';
    94 : Result := 'braceleft';
    95 : Result := 'bar';
    96 : Result := 'braceright';
    97 : Result := 'asciitilde';
    98 : Result := 'Adieresis';
    99 : Result := 'Aring';
   100 : Result := 'Ccedilla';
   101 : Result := 'Eacute';
   102 : Result := 'Ntilde';
   103 : Result := 'Odieresis';
   104 : Result := 'Udieresis';
   105 : Result := 'aacute';
   106 : Result := 'agrave';
   107 : Result := 'acircumflex';
   108 : Result := 'adieresis';
   109 : Result := 'atilde';
   110 : Result := 'aring';
   111 : Result := 'ccedilla';
   112 : Result := 'eacute';
   113 : Result := 'egrave';
   114 : Result := 'ecircumflex';
   115 : Result := 'edieresis';
   116 : Result := 'iacute';
   117 : Result := 'igrave';
   118 : Result := 'icircumflex';
   119 : Result := 'idieresis';
   120 : Result := 'ntilde';
   121 : Result := 'oacute';
   122 : Result := 'ograve';
   123 : Result := 'ocircumflex';
   124 : Result := 'odieresis';
   125 : Result := 'otilde';
   126 : Result := 'uacute';
   127 : Result := 'ugrave';
   128 : Result := 'ucircumflex';
   129 : Result := 'udieresis';
   130 : Result := 'dagger';
   131 : Result := 'degree';
   132 : Result := 'cent';
   133 : Result := 'sterling';
   134 : Result := 'section';
   135 : Result := 'bullet';
   136 : Result := 'paragraph';
   137 : Result := 'germandbls';
   138 : Result := 'registered';
   139 : Result := 'copyright';
   140 : Result := 'trademark';
   141 : Result := 'acute';
   142 : Result := 'dieresis';
   143 : Result := 'notequal';
   144 : Result := 'AE';
   145 : Result := 'Oslash';
   146 : Result := 'infinity';
   147 : Result := 'plusminus';
   148 : Result := 'lessequal';
   149 : Result := 'greaterequal';
   150 : Result := 'yen';
   151 : Result := 'mu';
   152 : Result := 'partialdiff';
   153 : Result := 'summation';
   154 : Result := 'product';
   155 : Result := 'pi';
   156 : Result := 'integral';
   157 : Result := 'ordfeminine';
   158 : Result := 'ordmasculine';
   159 : Result := 'Omega';
   160 : Result := 'ae';
   161 : Result := 'oslash';
   162 : Result := 'questiondown';
   163 : Result := 'exclamdown';
   164 : Result := 'logicalnot';
   165 : Result := 'radical';
   166 : Result := 'florin';
   167 : Result := 'approxequal';
   168 : Result := 'Delta';
   169 : Result := 'guillemotleft';
   170 : Result := 'guillemotright';
   171 : Result := 'ellipsis';
   172 : Result := 'nonbreakingspace';
   173 : Result := 'Agrave';
   174 : Result := 'Atilde';
   175 : Result := 'Otilde';
   176 : Result := 'OE';
   177 : Result := 'oe';
   178 : Result := 'endash';
   179 : Result := 'emdash';
   180 : Result := 'quotedblleft';
   181 : Result := 'quotedblright';
   182 : Result := 'quoteleft';
   183 : Result := 'quoteright';
   184 : Result := 'divide';
   185 : Result := 'lozenge';
   186 : Result := 'ydieresis';
   187 : Result := 'Ydieresis';
   188 : Result := 'fraction';
   189 : Result := 'currency';
   190 : Result := 'guilsinglleft';
   191 : Result := 'guilsinglright';
   192 : Result := 'fi';
   193 : Result := 'fl';
   194 : Result := 'daggerdbl';
   195 : Result := 'periodcentered';
   196 : Result := 'quotesinglbase';
   197 : Result := 'quotedblbase';
   198 : Result := 'perthousand';
   199 : Result := 'Acircumflex';
   200 : Result := 'Ecircumflex';
   201 : Result := 'Aacute';
   202 : Result := 'Edieresis';
   203 : Result := 'Egrave';
   204 : Result := 'Iacute';
   205 : Result := 'Icircumflex';
   206 : Result := 'Idieresis';
   207 : Result := 'Igrave';
   208 : Result := 'Oacute';
   209 : Result := 'Ocircumflex';
   210 : Result := 'apple';
   211 : Result := 'Ograve';
   212 : Result := 'Uacute';
   213 : Result := 'Ucircumflex';
   214 : Result := 'Ugrave';
   215 : Result := 'dotlessi';
   216 : Result := 'circumflex';
   217 : Result := 'tilde';
   218 : Result := 'macron';
   219 : Result := 'breve';
   220 : Result := 'dotaccent';
   221 : Result := 'ring';
   222 : Result := 'cedilla';
   223 : Result := 'hungarumlaut';
   224 : Result := 'ogonek';
   225 : Result := 'caron';
   226 : Result := 'Lslash';
   227 : Result := 'lslash';
   228 : Result := 'Scaron';
   229 : Result := 'scaron';
   230 : Result := 'Zcaron';
   231 : Result := 'zcaron';
   232 : Result := 'brokenbar';
   233 : Result := 'Eth';
   234 : Result := 'eth';
   235 : Result := 'Yacute';
   236 : Result := 'yacute';
   237 : Result := 'Thorn';
   238 : Result := 'thorn';
   239 : Result := 'minus';
   240 : Result := 'multiply';
   241 : Result := 'onesuperior';
   242 : Result := 'twosuperior';
   243 : Result := 'threesuperior';
   244 : Result := 'onehalf';
   245 : Result := 'onequarter';
   246 : Result := 'threequarters';
   247 : Result := 'franc';
   248 : Result := 'Gbreve';
   249 : Result := 'gbreve';
   250 : Result := 'Idotaccent';
   251 : Result := 'Scedilla';
   252 : Result := 'scedilla';
   253 : Result := 'Cacute';
   254 : Result := 'cacute';
   255 : Result := 'Ccaron';
   256 : Result := 'ccaron';
   257 : Result := 'dcroat';
  end
end;

end.
