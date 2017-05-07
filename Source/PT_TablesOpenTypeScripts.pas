unit PT_TablesOpenTypeScripts;

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
  Classes, Contnrs, PT_Types, PT_Tables, PT_TablesOpenType;

type
  // see: http://www.microsoft.com/typography/otspec/scripttags.htm
  TOpenTypeArabicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeArmenianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBalineseLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBengaliLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBengali2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBopomofoLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBrailleLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBugineseLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBuhidLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeByzantineLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCanadianSyllabicsLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCarianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChamLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCherokeeLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCJKIdeographicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCopticLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCypriotSyllabaryLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCyrillicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDeseretLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDevanagariLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDevanagari2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEthiopicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGeorgianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGlagoliticLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGothicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGreekLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGujaratiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGujarati2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGurmukhiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGurmukhi2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHangulLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHangulJamoLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHanunooLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHebrewLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHiraganaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeJavaneseLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKannadaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKannada2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKatakanaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKayahLiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKharosthiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhmerLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLaoLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLatinLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLepchaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLimbuLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLinearBLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLycianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLydianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalayalamLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalayalam2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMathematicalAlphanumericSymbolsLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMongolianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMusicalSymbolsLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMyanmarLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNewTaiLueLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNKoLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOghamLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOlChikiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOldItalicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOldPersianCuneiformLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOriyaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOriya2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOsmanyaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePhagsPaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePhoenicianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRejangLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRunicLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSaurashtraLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeShavianLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSinhalaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSumeroAkkadianCuneiformLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSundaneseLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSylotiNagriLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSyriacLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTagalogLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTagbanwaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTaiLeLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTamilLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTamil2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTeluguLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTelugu2LanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeThaanaLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeThaiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTibetanLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTifinaghLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUgariticCuneiformLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeVaiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYiLanguageSystemTables = class(TCustomOpenTypeScriptTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

implementation

resourcestring
  RCStrArabic = 'Arabic';
  RCStrArmenian = 'Armenian';
  RCStrBalinese = 'Balinese';
  RCStrBengali = 'Bengali';
  RCStrBengaliV2 = 'Bengali v.2';
  RCStrBopomofo = 'Bopomofo';
  RCStrBraille = 'Braille';
  RCStrBuginese = 'Buginese';
  RCStrBuhid = 'Buhid';
  RCStrByzantine = 'Byzantine';
  RCStrCanadianSyllabics = 'Canadian Syllabics';
  RCStrCarian = 'Carian';
  RCStrCham = 'Cham';
  RCStrCherokee = 'Cherokee';
  RCStrCJKIdeographic = 'CJK Ideographic';
  RCStrCoptic = 'Coptic';
  RCStrCypriotSyllabary = 'Cypriot Syllabary';
  RCStrCyrillic = 'Cyrillic';
  RCStrDeseret = 'Deseret';
  RCStrDevanagari = 'Devanagari';
  RCStrDevanagariV2 = 'Devanagari v.2';
  RCStrEthiopic = 'Ethiopic';
  RCStrGeorgian = 'Georgian';
  RCStrGlagolitic = 'Glagolitic';
  RCStrGothic = 'Gothic';
  RCStrGreek = 'Greek';
  RCStrGujarati = 'Gujarati';
  RCStrGujaratiV2 = 'Gujarati v.2';
  RCStrGurmukhi = 'Gurmukhi';
  RCStrGurmukhiV2 = 'Gurmukhi v.2';
  RCStrHangul = 'Hangul';
  RCStrHangulJamo = 'Hangul Jamo';
  RCStrHanunoo = 'Hanunoo';
  RCStrHebrew = 'Hebrew';
  RCStrHiragana = 'Hiragana';
  RCStrJavanese = 'Javanese';
  RCStrKannada = 'Kannada';
  RCStrKannadaV2 = 'Kannada v.2';
  RCStrKatakana = 'Katakana';
  RCStrKayahLi = 'Kayah Li';
  RCStrKharosthi = 'Kharosthi';
  RCStrKhmer = 'Khmer';
  RCStrLao = 'Lao';
  RCStrLatin = 'Latin';
  RCStrLepcha = 'Lepcha';
  RCStrLimbu = 'Limbu';
  RCStrLinearB = 'Linear B';
  RCStrLycian = 'Lycian';
  RCStrLydian = 'Lydian';
  RCStrMalayalam = 'Malayalam';
  RCStrMalayalamV2 = 'Malayalam v.2';
  RCStrMathematicalAlphanu = 'Mathematical Alphanumeric Symbols';
  RCStrMongolian = 'Mongolian';
  RCStrMusicalSymbols = 'Musical Symbols';
  RCStrMyanmar = 'Myanmar';
  RCStrNewTaiLue = 'New Tai Lue';
  RCStrNKo = 'N''Ko';
  RCStrOgham = 'Ogham';
  RCStrOlChiki = 'Ol Chiki';
  RCStrOldItalic = 'OldItalic';
  RCStrOldPersianCuneifor = 'Old Persian Cuneiform';
  RCStrOriya = 'Oriya';
  RCStrOriyaV2 = 'Oriya v.2';
  RCStrOsmanya = 'Osmanya';
  RCStrPhagspa = 'Phags-pa';
  RCStrPhoenician = 'Phoenician';
  RCStrRejang = 'Rejang';
  RCStrRunic = 'Runic';
  RCStrSaurashtra = 'Saurashtra';
  RCStrShavian = 'Shavian';
  RCStrSinhala = 'Sinhala';
  RCStrSumeroAkkadianCune = 'Sumero-Akkadian Cuneiform';
  RCStrSundanese = 'Sundanese';
  RCStrSylotiNagri = 'Syloti Nagri';
  RCStrSyriac = 'Syriac';
  RCStrTagalog = 'Tagalog';
  RCStrTagbanwa = 'Tagbanwa';
  RCStrTaiLe = 'Tai Le';
  RCStrTamil = 'Tamil';
  RCStrTamilV2 = 'Tamil v.2';
  RCStrTelugu = 'Telugu';
  RCStrTelugu2 = 'Telugu2';
  RCStrThaana = 'Thaana';
  RCStrThai = 'Thai';
  RCStrTibetan = 'Tibetan';
  RCStrTifinagh = 'Tifinagh';
  RCStrUgariticCuneiform = 'Ugaritic Cuneiform';
  RCStrVai = 'Vai';
  RCStrYi = 'Yi';


{ TOpenTypeArabicLanguageSystemTables }

class function TOpenTypeArabicLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrArabic;
end;

class function TOpenTypeArabicLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'arab';
end;


{ TOpenTypeArmenianLanguageSystemTables }

class function TOpenTypeArmenianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrArmenian;
end;

class function TOpenTypeArmenianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'armn';
end;


{ TOpenTypeBalineseLanguageSystemTables }

class function TOpenTypeBalineseLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBalinese;
end;

class function TOpenTypeBalineseLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'bali';
end;


{ TOpenTypeBengaliLanguageSystemTables }

class function TOpenTypeBengaliLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBengali;
end;

class function TOpenTypeBengaliLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'beng';
end;


{ TOpenTypeBengali2LanguageSystemTables }

class function TOpenTypeBengali2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBengaliV2;
end;

class function TOpenTypeBengali2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'bng2';
end;


{ TOpenTypeBopomofoLanguageSystemTables }

class function TOpenTypeBopomofoLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBopomofo;
end;

class function TOpenTypeBopomofoLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'bopo';
end;


{ TOpenTypeBrailleLanguageSystemTables }

class function TOpenTypeBrailleLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBraille;
end;

class function TOpenTypeBrailleLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'brai';
end;


{ TOpenTypeBugineseLanguageSystemTables }

class function TOpenTypeBugineseLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBuginese;
end;

class function TOpenTypeBugineseLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'bugi';
end;


{ TOpenTypeBuhidLanguageSystemTables }

class function TOpenTypeBuhidLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrBuhid;
end;

class function TOpenTypeBuhidLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'buhd';
end;


{ TOpenTypeByzantineLanguageSystemTables }

class function TOpenTypeByzantineLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrByzantine;
end;

class function TOpenTypeByzantineLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'byzm';
end;


{ TOpenTypeCanadianSyllabicsLanguageSystemTables }

class function TOpenTypeCanadianSyllabicsLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrCanadianSyllabics;
end;

class function TOpenTypeCanadianSyllabicsLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'cans';
end;


{ TOpenTypeCarianLanguageSystemTables }

class function TOpenTypeCarianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrCarian;
end;

class function TOpenTypeCarianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'cari';
end;


{ TOpenTypeChamLanguageSystemTables }

class function TOpenTypeChamLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrCham;
end;

class function TOpenTypeChamLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'cham';
end;


{ TOpenTypeCherokeeLanguageSystemTables }

class function TOpenTypeCherokeeLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrCherokee;
end;

class function TOpenTypeCherokeeLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'cher';
end;


{ TOpenTypeCJKIdeographicLanguageSystemTables }

class function TOpenTypeCJKIdeographicLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrCJKIdeographic;
end;

class function TOpenTypeCJKIdeographicLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'hani';
end;


{ TOpenTypeCopticLanguageSystemTables }

class function TOpenTypeCopticLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrCoptic;
end;

class function TOpenTypeCopticLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'copt';
end;


{ TOpenTypeCypriotSyllabaryLanguageSystemTables }

class function TOpenTypeCypriotSyllabaryLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrCypriotSyllabary;
end;

class function TOpenTypeCypriotSyllabaryLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'cprt';
end;


{ TOpenTypeCyrillicLanguageSystemTables }

class function TOpenTypeCyrillicLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrCyrillic;
end;

class function TOpenTypeCyrillicLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'cyrl';
end;


{ TOpenTypeDeseretLanguageSystemTables }

class function TOpenTypeDeseretLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrDeseret;
end;

class function TOpenTypeDeseretLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'dsrt';
end;


{ TOpenTypeDevanagariLanguageSystemTables }

class function TOpenTypeDevanagariLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrDevanagari;
end;

class function TOpenTypeDevanagariLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'deva';
end;


{ TOpenTypeDevanagari2LanguageSystemTables }

class function TOpenTypeDevanagari2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrDevanagariV2;
end;

class function TOpenTypeDevanagari2LanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'dev2';
end;


{ TOpenTypeEthiopicLanguageSystemTables }

class function TOpenTypeEthiopicLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrEthiopic;
end;

class function TOpenTypeEthiopicLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'ethi';
end;


{ TOpenTypeGeorgianLanguageSystemTables }

class function TOpenTypeGeorgianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGeorgian;
end;

class function TOpenTypeGeorgianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'geor';
end;


{ TOpenTypeGlagoliticLanguageSystemTables }

class function TOpenTypeGlagoliticLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGlagolitic;
end;

class function TOpenTypeGlagoliticLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'glag';
end;


{ TOpenTypeGothicLanguageSystemTables }

class function TOpenTypeGothicLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGothic;
end;

class function TOpenTypeGothicLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'goth';
end;


{ TOpenTypeGreekLanguageSystemTables }

class function TOpenTypeGreekLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGreek;
end;

class function TOpenTypeGreekLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'grek';
end;


{ TOpenTypeGujaratiLanguageSystemTables }

class function TOpenTypeGujaratiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGujarati;
end;

class function TOpenTypeGujaratiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'gujr';
end;


{ TOpenTypeGujarati2LanguageSystemTables }

class function TOpenTypeGujarati2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGujaratiV2;
end;

class function TOpenTypeGujarati2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'gjr2';
end;


{ TOpenTypeGurmukhiLanguageSystemTables }

class function TOpenTypeGurmukhiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGurmukhi;
end;

class function TOpenTypeGurmukhiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'guru';
end;


{ TOpenTypeGurmukhi2LanguageSystemTables }

class function TOpenTypeGurmukhi2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrGurmukhiV2;
end;

class function TOpenTypeGurmukhi2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'gur2';
end;


{ TOpenTypeHangulLanguageSystemTables }

class function TOpenTypeHangulLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrHangul;
end;

class function TOpenTypeHangulLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'hang';
end;


{ TOpenTypeHangulJamoLanguageSystemTables }

class function TOpenTypeHangulJamoLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrHangulJamo;
end;

class function TOpenTypeHangulJamoLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'jamo';
end;


{ TOpenTypeHanunooLanguageSystemTables }

class function TOpenTypeHanunooLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrHanunoo;
end;

class function TOpenTypeHanunooLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'hano';
end;


{ TOpenTypeHebrewLanguageSystemTables }

class function TOpenTypeHebrewLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrHebrew;
end;

class function TOpenTypeHebrewLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'hebr';
end;


{ TOpenTypeHiraganaLanguageSystemTables }

class function TOpenTypeHiraganaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrHiragana;
end;

class function TOpenTypeHiraganaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := '';
end;


{ TOpenTypeJavaneseLanguageSystemTables }

class function TOpenTypeJavaneseLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrJavanese;
end;

class function TOpenTypeJavaneseLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'java';
end;


{ TOpenTypeKannadaLanguageSystemTables }

class function TOpenTypeKannadaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrKannada;
end;

class function TOpenTypeKannadaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'knda';
end;


{ TOpenTypeKannada2LanguageSystemTables }

class function TOpenTypeKannada2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrKannadaV2;
end;

class function TOpenTypeKannada2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'knd2';
end;


{ TOpenTypeKatakanaLanguageSystemTables }

class function TOpenTypeKatakanaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrKatakana;
end;

class function TOpenTypeKatakanaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'kana';
end;


{ TOpenTypeKayahLiLanguageSystemTables }

class function TOpenTypeKayahLiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrKayahLi;
end;

class function TOpenTypeKayahLiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'kali';
end;


{ TOpenTypeKharosthiLanguageSystemTables }

class function TOpenTypeKharosthiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrKharosthi;
end;

class function TOpenTypeKharosthiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'khar';
end;


{ TOpenTypeKhmerLanguageSystemTables }

class function TOpenTypeKhmerLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrKhmer;
end;

class function TOpenTypeKhmerLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'khmr';
end;


{ TOpenTypeLaoLanguageSystemTables }

class function TOpenTypeLaoLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLao;
end;

class function TOpenTypeLaoLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'lao'#0;
end;


{ TOpenTypeLatinLanguageSystemTables }

class function TOpenTypeLatinLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLatin;
end;

class function TOpenTypeLatinLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'latn';
end;


{ TOpenTypeLepchaLanguageSystemTables }

class function TOpenTypeLepchaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLepcha;
end;

class function TOpenTypeLepchaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'lepc';
end;


{ TOpenTypeLimbuLanguageSystemTables }

class function TOpenTypeLimbuLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLimbu;
end;

class function TOpenTypeLimbuLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'limb';
end;


{ TOpenTypeLinearBLanguageSystemTables }

class function TOpenTypeLinearBLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLinearB;
end;

class function TOpenTypeLinearBLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'linb';
end;


{ TOpenTypeLycianLanguageSystemTables }

class function TOpenTypeLycianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLycian;
end;

class function TOpenTypeLycianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'lyci';
end;


{ TOpenTypeLydianLanguageSystemTables }

class function TOpenTypeLydianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrLydian;
end;

class function TOpenTypeLydianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'lydi';
end;


{ TOpenTypeMalayalamLanguageSystemTables }

class function TOpenTypeMalayalamLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrMalayalam;
end;

class function TOpenTypeMalayalamLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'mlym';
end;


{ TOpenTypeMalayalam2LanguageSystemTables }

class function TOpenTypeMalayalam2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrMalayalamV2;
end;

class function TOpenTypeMalayalam2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'mlm2';
end;


{ TOpenTypeMathematicalAlphanumericSymbolsLanguageSystemTables }

class function TOpenTypeMathematicalAlphanumericSymbolsLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrMathematicalAlphanu;
end;

class function TOpenTypeMathematicalAlphanumericSymbolsLanguageSystemTables.
  GetTableType: TTableType;
begin
  Result := 'math';
end;


{ TOpenTypeMongolianLanguageSystemTables }

class function TOpenTypeMongolianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrMongolian;
end;

class function TOpenTypeMongolianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'mong';
end;


{ TOpenTypeMusicalSymbolsLanguageSystemTables }

class function TOpenTypeMusicalSymbolsLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrMusicalSymbols;
end;

class function TOpenTypeMusicalSymbolsLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'musc';
end;


{ TOpenTypeMyanmarLanguageSystemTables }

class function TOpenTypeMyanmarLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrMyanmar;
end;

class function TOpenTypeMyanmarLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'mymr';
end;


{ TOpenTypeNewTaiLueLanguageSystemTables }

class function TOpenTypeNewTaiLueLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrNewTaiLue;
end;

class function TOpenTypeNewTaiLueLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'talu';
end;


{ TOpenTypeNKoLanguageSystemTables }

class function TOpenTypeNKoLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrNKo;
end;

class function TOpenTypeNKoLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'nko'#0;
end;


{ TOpenTypeOghamLanguageSystemTables }

class function TOpenTypeOghamLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrOgham;
end;

class function TOpenTypeOghamLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'olck';
end;


{ TOpenTypeOlChikiLanguageSystemTables }

class function TOpenTypeOlChikiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrOlChiki;
end;

class function TOpenTypeOlChikiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'olck';
end;


{ TOpenTypeOldItalicLanguageSystemTables }

class function TOpenTypeOldItalicLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrOldItalic;
end;

class function TOpenTypeOldItalicLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'ital';
end;


{ TOpenTypeOldPersianCuneiformLanguageSystemTables }

class function TOpenTypeOldPersianCuneiformLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrOldPersianCuneifor;
end;

class function TOpenTypeOldPersianCuneiformLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'xpeo';
end;


{ TOpenTypeOriyaLanguageSystemTables }

class function TOpenTypeOriyaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrOriya;
end;

class function TOpenTypeOriyaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'orya';
end;


{ TOpenTypeOriya2LanguageSystemTables }

class function TOpenTypeOriya2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrOriyaV2;
end;

class function TOpenTypeOriya2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'ory2';
end;


{ TOpenTypeOsmanyaLanguageSystemTables }

class function TOpenTypeOsmanyaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrOsmanya;
end;

class function TOpenTypeOsmanyaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'osma';
end;


{ TOpenTypePhagsPaLanguageSystemTables }

class function TOpenTypePhagsPaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrPhagspa;
end;

class function TOpenTypePhagsPaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'phag';
end;


{ TOpenTypePhoenicianLanguageSystemTables }

class function TOpenTypePhoenicianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrPhoenician;
end;

class function TOpenTypePhoenicianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'phnx';
end;


{ TOpenTypeRejangLanguageSystemTables }

class function TOpenTypeRejangLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrRejang;
end;

class function TOpenTypeRejangLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'rjng';
end;


{ TOpenTypeRunicLanguageSystemTables }

class function TOpenTypeRunicLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrRunic;
end;

class function TOpenTypeRunicLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'runr';
end;


{ TOpenTypeSaurashtraLanguageSystemTables }

class function TOpenTypeSaurashtraLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrSaurashtra;
end;

class function TOpenTypeSaurashtraLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'saur';
end;


{ TOpenTypeShavianLanguageSystemTables }

class function TOpenTypeShavianLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrShavian;
end;

class function TOpenTypeShavianLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'shaw';
end;


{ TOpenTypeSinhalaLanguageSystemTables }

class function TOpenTypeSinhalaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrSinhala;
end;

class function TOpenTypeSinhalaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'sinh';
end;


{ TOpenTypeSumeroAkkadianCuneiformLanguageSystemTables }

class function TOpenTypeSumeroAkkadianCuneiformLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrSumeroAkkadianCune;
end;

class function TOpenTypeSumeroAkkadianCuneiformLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'xsux';
end;


{ TOpenTypeSundaneseLanguageSystemTables }

class function TOpenTypeSundaneseLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrSundanese;
end;

class function TOpenTypeSundaneseLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'sund';
end;


{ TOpenTypeSylotiNagriLanguageSystemTables }

class function TOpenTypeSylotiNagriLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrSylotiNagri;
end;

class function TOpenTypeSylotiNagriLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'sylo';
end;


{ TOpenTypeSyriacLanguageSystemTables }

class function TOpenTypeSyriacLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrSyriac;
end;

class function TOpenTypeSyriacLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'syrc';
end;


{ TOpenTypeTagalogLanguageSystemTables }

class function TOpenTypeTagalogLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTagalog;
end;

class function TOpenTypeTagalogLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tglg';
end;


{ TOpenTypeTagbanwaLanguageSystemTables }

class function TOpenTypeTagbanwaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTagbanwa;
end;

class function TOpenTypeTagbanwaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tagb';
end;


{ TOpenTypeTaiLeLanguageSystemTables }

class function TOpenTypeTaiLeLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTaiLe;
end;

class function TOpenTypeTaiLeLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tale';
end;


{ TOpenTypeTamilLanguageSystemTables }

class function TOpenTypeTamilLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTamil;
end;

class function TOpenTypeTamilLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'taml';
end;


{ TOpenTypeTamil2LanguageSystemTables }

class function TOpenTypeTamil2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTamilV2;
end;

class function TOpenTypeTamil2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tml2';
end;


{ TOpenTypeTeluguLanguageSystemTables }

class function TOpenTypeTeluguLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTelugu;
end;

class function TOpenTypeTeluguLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'telu';
end;


{ TOpenTypeTelugu2LanguageSystemTables }

class function TOpenTypeTelugu2LanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTelugu2;
end;

class function TOpenTypeTelugu2LanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tel2';
end;


{ TOpenTypeThaanaLanguageSystemTables }

class function TOpenTypeThaanaLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrThaana;
end;

class function TOpenTypeThaanaLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'thaa';
end;


{ TOpenTypeThaiLanguageSystemTables }

class function TOpenTypeThaiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrThai;
end;

class function TOpenTypeThaiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'thai';
end;


{ TOpenTypeTibetanLanguageSystemTables }

class function TOpenTypeTibetanLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTibetan;
end;

class function TOpenTypeTibetanLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tibt';
end;


{ TOpenTypeTifinaghLanguageSystemTables }

class function TOpenTypeTifinaghLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrTifinagh;
end;

class function TOpenTypeTifinaghLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'tfng';
end;


{ TOpenTypeUgariticCuneiformLanguageSystemTables }

class function TOpenTypeUgariticCuneiformLanguageSystemTables.
  GetDisplayName: string;
begin
  Result := RCStrUgariticCuneiform;
end;

class function TOpenTypeUgariticCuneiformLanguageSystemTables.GetTableType
  : TTableType;
begin
  Result := 'ugar';
end;


{ TOpenTypeVaiLanguageSystemTables }

class function TOpenTypeVaiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrVai;
end;

class function TOpenTypeVaiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'vai';
end;


{ TOpenTypeYiLanguageSystemTables }

class function TOpenTypeYiLanguageSystemTables.GetDisplayName: string;
begin
  Result := RCStrYi;
end;

class function TOpenTypeYiLanguageSystemTables.GetTableType: TTableType;
begin
  Result := 'yi';
end;


initialization

RegisterScripts([TOpenTypeArabicLanguageSystemTables,
  TOpenTypeArmenianLanguageSystemTables, TOpenTypeBalineseLanguageSystemTables,
  TOpenTypeBengaliLanguageSystemTables, TOpenTypeBengali2LanguageSystemTables,
  TOpenTypeBopomofoLanguageSystemTables, TOpenTypeBrailleLanguageSystemTables,
  TOpenTypeBugineseLanguageSystemTables, TOpenTypeBuhidLanguageSystemTables,
  TOpenTypeByzantineLanguageSystemTables,
  TOpenTypeCanadianSyllabicsLanguageSystemTables,
  TOpenTypeCarianLanguageSystemTables, TOpenTypeChamLanguageSystemTables,
  TOpenTypeCherokeeLanguageSystemTables,
  TOpenTypeCJKIdeographicLanguageSystemTables,
  TOpenTypeCopticLanguageSystemTables,
  TOpenTypeCypriotSyllabaryLanguageSystemTables,
  TOpenTypeCyrillicLanguageSystemTables, TOpenTypeDeseretLanguageSystemTables,
  TOpenTypeDevanagariLanguageSystemTables,
  TOpenTypeDevanagari2LanguageSystemTables,
  TOpenTypeEthiopicLanguageSystemTables, TOpenTypeGeorgianLanguageSystemTables,
  TOpenTypeGlagoliticLanguageSystemTables, TOpenTypeGothicLanguageSystemTables,
  TOpenTypeGreekLanguageSystemTables, TOpenTypeGujaratiLanguageSystemTables,
  TOpenTypeGujarati2LanguageSystemTables, TOpenTypeGurmukhiLanguageSystemTables,
  TOpenTypeGurmukhi2LanguageSystemTables, TOpenTypeHangulLanguageSystemTables,
  TOpenTypeHangulJamoLanguageSystemTables, TOpenTypeHanunooLanguageSystemTables,
  TOpenTypeHebrewLanguageSystemTables, TOpenTypeHiraganaLanguageSystemTables,
  TOpenTypeJavaneseLanguageSystemTables, TOpenTypeKannadaLanguageSystemTables,
  TOpenTypeKannada2LanguageSystemTables, TOpenTypeKatakanaLanguageSystemTables,
  TOpenTypeKayahLiLanguageSystemTables, TOpenTypeKharosthiLanguageSystemTables,
  TOpenTypeKhmerLanguageSystemTables, TOpenTypeLaoLanguageSystemTables,
  TOpenTypeLatinLanguageSystemTables, TOpenTypeLepchaLanguageSystemTables,
  TOpenTypeLimbuLanguageSystemTables, TOpenTypeLinearBLanguageSystemTables,
  TOpenTypeLycianLanguageSystemTables, TOpenTypeLydianLanguageSystemTables,
  TOpenTypeMalayalamLanguageSystemTables,
  TOpenTypeMalayalam2LanguageSystemTables,
  TOpenTypeMathematicalAlphanumericSymbolsLanguageSystemTables,
  TOpenTypeMongolianLanguageSystemTables,
  TOpenTypeMusicalSymbolsLanguageSystemTables,
  TOpenTypeMyanmarLanguageSystemTables, TOpenTypeNewTaiLueLanguageSystemTables,
  TOpenTypeNKoLanguageSystemTables, TOpenTypeOghamLanguageSystemTables,
  TOpenTypeOlChikiLanguageSystemTables, TOpenTypeOldItalicLanguageSystemTables,
  TOpenTypeOldPersianCuneiformLanguageSystemTables,
  TOpenTypeOriyaLanguageSystemTables, TOpenTypeOriya2LanguageSystemTables,
  TOpenTypeOsmanyaLanguageSystemTables, TOpenTypePhagsPaLanguageSystemTables,
  TOpenTypePhoenicianLanguageSystemTables, TOpenTypeRejangLanguageSystemTables,
  TOpenTypeRunicLanguageSystemTables, TOpenTypeSaurashtraLanguageSystemTables,
  TOpenTypeShavianLanguageSystemTables, TOpenTypeSinhalaLanguageSystemTables,
  TOpenTypeSumeroAkkadianCuneiformLanguageSystemTables,
  TOpenTypeSundaneseLanguageSystemTables,
  TOpenTypeSylotiNagriLanguageSystemTables, TOpenTypeSyriacLanguageSystemTables,
  TOpenTypeTagalogLanguageSystemTables, TOpenTypeTagbanwaLanguageSystemTables,
  TOpenTypeTaiLeLanguageSystemTables, TOpenTypeTamilLanguageSystemTables,
  TOpenTypeTamil2LanguageSystemTables, TOpenTypeTeluguLanguageSystemTables,
  TOpenTypeTelugu2LanguageSystemTables, TOpenTypeThaanaLanguageSystemTables,
  TOpenTypeThaiLanguageSystemTables, TOpenTypeTibetanLanguageSystemTables,
  TOpenTypeTifinaghLanguageSystemTables,
  TOpenTypeUgariticCuneiformLanguageSystemTables,
  TOpenTypeVaiLanguageSystemTables, TOpenTypeYiLanguageSystemTables]);

end.
