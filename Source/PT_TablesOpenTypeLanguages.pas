unit PT_TablesOpenTypeLanguages;

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
  // see: http://www.microsoft.com/typography/otspec/languagetags.htm
  TOpenTypeAbazaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAbkhazianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAdygheLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAfrikaansLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAfarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAgawLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAlsatianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAltaiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAmharicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeArabicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeArakaneseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAssameseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAthapaskanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAvarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAwadhiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAymaraLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAzeriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBadagaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBaghelkhandiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBalkarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBauleLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBerberLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBenchLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBibleCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBelarussianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBembaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBengaliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBulgarianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBhiliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBhojpuriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBikolLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBilenLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBlackfootLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBalochiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBalanteLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBaltiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBambaraLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBamilekeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBosnianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBretonLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBrahuiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBrajBhashaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBurmeseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBashkirLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBetiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCatalanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCebuanoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChechenLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChahaGurageLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChattisgarhiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChichewaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChukchiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChipewyanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCherokeeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChuvashLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeComorianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCopticLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCorsicanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCarrierLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCrimeanTatarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChurchSlavonicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCzechLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDanishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDargwaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeWoodsCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGermanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDogriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDhivehiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDhivehiDeprecatedLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDjermaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDangmeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDinkaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDunganLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDzongkhaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEbiraLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEasternCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEdoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEfikLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGreekLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEnglishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeErzyaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSpanishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEstonianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeBasqueLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEvenkiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEvenLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEweLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFrenchAntilleanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFarsiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFinnishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFijianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFlemishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeForestNenetsLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFonLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFaroeseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFrenchLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFrisianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFriulianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFutaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFulaniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGaelicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGagauzLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGalicianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGarshuniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGarhwaliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGeEzLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGilyakLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGumuzLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGondiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGreenlandicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGaroLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGuaraniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGujaratiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHaitianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHalamLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHarautiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHausaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHawaiinLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHammerBannaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHiligaynonLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHindiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHighMariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHindkoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHarariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeCroatianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHungarianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeArmenianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIgboLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIjoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIlokanoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIndonesianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIngushLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeInuktitutLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePhoneticTranscriptionLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIrishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIrishTraditionalLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeIcelandicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeInariSamiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeItalianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeHebrewLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeJavaneseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYiddishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeJapaneseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeJudezmoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeJulaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKabardianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKachchiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKalenjinLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKannadaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKarachayLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeGeorgianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKazakhLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKebenaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhutsuriGeorgianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhakassLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhantyKazimLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhmerLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhantyShurishkarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhantyVakhiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhowarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKikuyuLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKirghizLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKisiiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKokniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKalmykLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKambaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKumaoniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKomoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKomsoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKanuriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKodaguLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKoreanOldHangulLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKonkaniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKikongoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKomiPermyakLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKoreanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKomiZyrianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKpelleLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKrioLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKarakalpakLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKarelianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKaraimLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKarenLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKooreteLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKashmiriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKhasiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKildinSamiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKuiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKulviLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKumykLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKurdishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKurukhLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKuyLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeKoryakLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLadinLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLahuliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLakLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLambaniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLaoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLatinLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLazLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLadakhiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLezgiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLingalaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLowMariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLimbuLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLomweLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLowerSorbianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLuleSamiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLithuanianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLuxembourgishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLubaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLugandaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLuhyaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLuoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeLatvianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMajangLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMakuaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalayalamTraditionalLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMansiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMapudungunLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMarathiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMarwariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMbunduLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeManchuLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMooseCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMendeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMeEnLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMizoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMacedonianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMaleLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalagasyLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalinkeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalayalamReformedLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalayLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMandinkaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMongolianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeManipuriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeManinkaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeManxGaelicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMohawkLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMokshaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMoldavianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMonLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMoroccanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMaoriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMaithiliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMalteseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeMundariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNagaAssameseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNanaiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNaskapiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNdebeleLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNdongaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNepaliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNewariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNagariLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNorwayHouseCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNisiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNiueanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNkoleLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNKoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeDutchLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNogaiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNorwegianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNorthernSamiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNorthernTaiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeEsperantoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeNynorskLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOccitanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOjiCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOjibwayLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOriyaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOromoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeOssetianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePalestinianAramaicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePaliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePunjabiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePalpaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePashtoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePolytonicGreekLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeFilipinoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePalaungLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePolishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeProvencalLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypePortugueseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChinLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRajasthaniLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRussianBuriatLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRiangLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRhaetoRomanicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRomanianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRomanyLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRusynLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRuandaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeRussianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSadriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSanskritLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSantaliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSayisiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSekotaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSelkupLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSangoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeShanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSibeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSidamoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSilteGurageLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSkoltSamiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSlovakLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSlaveyLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSlovenianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSomaliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSamoanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSenaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSindhiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSinhaleseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSoninkeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSodoGurageLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSothoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeAlbanianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSerbianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSaraikiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSererLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSouthSlaveyLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSouthernSamiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSuriLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSvanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSwedishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSwadayaAramaicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSwahiliLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSwaziLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSutuLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeSyriacLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTabasaranLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTajikiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTamilLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTatarLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTHCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTeluguLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTonganLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTigreLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTigrinyaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeThaiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTahitianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTibetanLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTurkmenLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTemneLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTswanaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTundraNenetsLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTongaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTodoLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTurkishLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTsongaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTuroyoAramaicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTuluLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTuvinLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTwiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUdmurtLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUkrainianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUrduLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUpperSorbianLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUyghurLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeUzbekLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeVendaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeVietnameseLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeWaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeWagdiLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeWestCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeWelshLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeWolofLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeTaiLueLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeXhosaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYakutLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYorubaLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYCreeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYiClassicLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeYiModernLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChineseHongKongLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChinesePhoneticLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChineseSimplifiedLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeChineseTraditionalLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeZandeLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  TOpenTypeZuluLanguageSystemTable = class(TCustomOpenTypeLanguageSystemTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

implementation

resourcestring
  RCStrAbaza = 'Abaza';
  RCStrAbkhazian = 'Abkhazian';
  RCStrAdyghe = 'Adyghe';
  RCStrAfrikaans = 'Afrikaans';
  RCStrAfar = 'Afar';
  RCStrAgaw = 'Agaw';
  RCStrAlsatian = 'Alsatian';
  RCStrAltai = 'Altai';
  RCStrAmharic = 'Amharic';
  RCStrPhoneticTranscriptionAmericanistConventions = 'Phonetic transcription' +
  '—Americanist conventions';
  RCStrArabic = 'Arabic';
  RCStrAari = 'Aari';
  RCStrArakanese = 'Arakanese';
  RCStrAssamese = 'Assamese';
  RCStrAthapaskan = 'Athapaskan';
  RCStrAvar = 'Avar';
  RCStrAwadhi = 'Awadhi';
  RCStrAymara = 'Aymara';
  RCStrAzeri = 'Azeri';
  RCStrBadaga = 'Badaga';
  RCStrBaghelkhandi = 'Baghelkhandi';
  RCStrBalkar = 'Balkar';
  RCStrBaule = 'Baule';
  RCStrBerber = 'Berber';
  RCStrBench = 'Bench';
  RCStrBibleCree = 'Bible Cree';
  RCStrBelarussian = 'Belarussian';
  RCStrBemba = 'Bemba';
  RCStrBengali = 'Bengali';
  RCStrBulgarian = 'Bulgarian';
  RCStrBhili = 'Bhili';
  RCStrBhojpuri = 'Bhojpuri';
  RCStrBikol = 'Bikol';
  RCStrBilen = 'Bilen';
  RCStrBlackfoot = 'Blackfoot';
  RCStrBalochi = 'Balochi';
  RCStrBalante = 'Balante';
  RCStrBalti = 'Balti';
  RCStrBambara = 'Bambara';
  RCStrBamileke = 'Bamileke';
  RCStrBosnian = 'Bosnian';
  RCStrBreton = 'Breton';
  RCStrBrahui = 'Brahui';
  RCStrBrajBhasha = 'Braj Bhasha';
  RCStrBurmese = 'Burmese';
  RCStrBashkir = 'Bashkir';
  RCStrBeti = 'Beti';
  RCStrCatalan = 'Catalan';
  RCStrCebuano = 'Cebuano';
  RCStrChechen = 'Chechen';
  RCStrChahaGurage = 'Chaha Gurage';
  RCStrChattisgarhi = 'Chattisgarhi';
  RCStrChichewa = 'Chichewa';
  RCStrChukchi = 'Chukchi';
  RCStrChipewyan = 'Chipewyan';
  RCStrCherokee = 'Cherokee';
  RCStrChuvash = 'Chuvash';
  RCStrComorian = 'Comorian';
  RCStrCoptic = 'Coptic';
  RCStrCorsican = 'Corsican';
  RCStrCree = 'Cree';
  RCStrCarrier = 'Carrier';
  RCStrCrimeanTatar = 'Crimean Tatar';
  RCStrChurchSlavonic = 'Church Slavonic';
  RCStrCzech = 'Czech';
  RCStrDanish = 'Danish';
  RCStrDargwa = 'Dargwa';
  RCStrWoodsCree = 'Woods Cree';
  RCStrGerman = 'German';
  RCStrDogri = 'Dogri';
  RCStrDhivehi = 'Dhivehi';
  RCStrDjerma = 'Djerma';
  RCStrDangme = 'Dangme';
  RCStrDinka = 'Dinka';
  RCStrDari = 'Dari';
  RCStrDungan = 'Dungan';
  RCStrDzongkha = 'Dzongkha';
  RCStrEbira = 'Ebira';
  RCStrEasternCree = 'Eastern Cree';
  RCStrEdo = 'Edo';
  RCStrEfik = 'Efik';
  RCStrGreek = 'Greek';
  RCStrEnglish = 'English';
  RCStrErzya = 'Erzya';
  RCStrSpanish = 'Spanish';
  RCStrEstonian = 'Estonian';
  RCStrBasque = 'Basque';
  RCStrEvenki = 'Evenki';
  RCStrEven = 'Even';
  RCStrEwe = 'Ewe';
  RCStrFrenchAntillean = 'French Antillean';
  RCStrFarsi = 'Farsi';
  RCStrFinnish = 'Finnish';
  RCStrFijian = 'Fijian';
  RCStrFlemish = 'Flemish';
  RCStrForestNenets = 'Forest Nenets';
  RCStrFon = 'Fon';
  RCStrFaroese = 'Faroese';
  RCStrFrench = 'French';
  RCStrFrisian = 'Frisian';
  RCStrFriulian = 'Friulian';
  RCStrFuta = 'Futa';
  RCStrFulani = 'Fulani';
  RCStrGa = 'Ga';
  RCStrGaelic = 'Gaelic';
  RCStrGagauz = 'Gagauz';
  RCStrGalician = 'Galician';
  RCStrGarshuni = 'Garshuni';
  RCStrGarhwali = 'Garhwali';
  RCStrGeez = 'Ge''ez';
  RCStrGilyak = 'Gilyak';
  RCStrGumuz = 'Gumuz';
  RCStrGondi = 'Gondi';
  RCStrGreenlandic = 'Greenlandic';
  RCStrGaro = 'Garo';
  RCStrGuarani = 'Guarani';
  RCStrGujarati = 'Gujarati';
  RCStrHaitian = 'Haitian';
  RCStrHalam = 'Halam';
  RCStrHarauti = 'Harauti';
  RCStrHausa = 'Hausa';
  RCStrHawaiin = 'Hawaiin';
  RCStrHammerBanna = 'Hammer-Banna';
  RCStrHiligaynon = 'Hiligaynon';
  RCStrHindi = 'Hindi';
  RCStrHighMari = 'High Mari';
  RCStrHindko = 'Hindko';
  RCStrHo = 'Ho';
  RCStrHarari = 'Harari';
  RCStrCroatian = 'Croatian';
  RCStrHungarian = 'Hungarian';
  RCStrArmenian = 'Armenian';
  RCStrIgbo = 'Igbo';
  RCStrIjo = 'Ijo';
  RCStrIlokano = 'Ilokano';
  RCStrIndonesian = 'Indonesian';
  RCStrIngush = 'Ingush';
  RCStrInuktitut = 'Inuktitut';
  RCStrPhoneticTranscriptionIpaConventions = 'Phonetic transcription—IPA con' +
  'ventions';
  RCStrIrish = 'Irish';
  RCStrIrishTraditional = 'Irish Traditional';
  RCStrIcelandic = 'Icelandic';
  RCStrInariSami = 'Inari Sami';
  RCStrItalian = 'Italian';
  RCStrHebrew = 'Hebrew';
  RCStrJavanese = 'Javanese';
  RCStrYiddish = 'Yiddish';
  RCStrJapanese = 'Japanese';
  RCStrJudezmo = 'Judezmo';
  RCStrJula = 'Jula';
  RCStrKabardian = 'Kabardian';
  RCStrKachchi = 'Kachchi';
  RCStrKalenjin = 'Kalenjin';
  RCStrKannada = 'Kannada';
  RCStrKarachay = 'Karachay';
  RCStrGeorgian = 'Georgian';
  RCStrKazakh = 'Kazakh';
  RCStrKebena = 'Kebena';
  RCStrKhutsuriGeorgian = 'Khutsuri Georgian';
  RCStrKhakass = 'Khakass';
  RCStrKhantyKazim = 'Khanty-Kazim';
  RCStrKhmer = 'Khmer';
  RCStrKhantyShurishkar = 'Khanty-Shurishkar';
  RCStrKhantyVakhi = 'Khanty-Vakhi';
  RCStrKhowar = 'Khowar';
  RCStrKikuyu = 'Kikuyu';
  RCStrKirghiz = 'Kirghiz';
  RCStrKisii = 'Kisii';
  RCStrKokni = 'Kokni';
  RCStrKalmyk = 'Kalmyk';
  RCStrKamba = 'Kamba';
  RCStrKumaoni = 'Kumaoni';
  RCStrKomo = 'Komo';
  RCStrKomso = 'Komso';
  RCStrKanuri = 'Kanuri';
  RCStrKodagu = 'Kodagu';
  RCStrKoreanOldHangul = 'Korean Old Hangul';
  RCStrKonkani = 'Konkani';
  RCStrKikongo = 'Kikongo';
  RCStrKomiPermyak = 'Komi-Permyak';
  RCStrKorean = 'Korean';
  RCStrKomiZyrian = 'Komi-Zyrian';
  RCStrKpelle = 'Kpelle';
  RCStrKrio = 'Krio';
  RCStrKarakalpak = 'Karakalpak';
  RCStrKarelian = 'Karelian';
  RCStrKaraim = 'Karaim';
  RCStrKaren = 'Karen';
  RCStrKoorete = 'Koorete';
  RCStrKashmiri = 'Kashmiri';
  RCStrKhasi = 'Khasi';
  RCStrKildinSami = 'Kildin Sami';
  RCStrKui = 'Kui';
  RCStrKulvi = 'Kulvi';
  RCStrKumyk = 'Kumyk';
  RCStrKurdish = 'Kurdish';
  RCStrKurukh = 'Kurukh';
  RCStrKuy = 'Kuy';
  RCStrKoryak = 'Koryak';
  RCStrLadin = 'Ladin';
  RCStrLahuli = 'Lahuli';
  RCStrLak = 'Lak';
  RCStrLambani = 'Lambani';
  RCStrLao = 'Lao';
  RCStrLatin = 'Latin';
  RCStrLaz = 'Laz';
  RCStrLCree = 'L-Cree';
  RCStrLadakhi = 'Ladakhi';
  RCStrLezgi = 'Lezgi';
  RCStrLingala = 'Lingala';
  RCStrLowMari = 'Low Mari';
  RCStrLimbu = 'Limbu';
  RCStrLomwe = 'Lomwe';
  RCStrLowerSorbian = 'Lower Sorbian';
  RCStrLuleSami = 'Lule Sami';
  RCStrLithuanian = 'Lithuanian';
  RCStrLuxembourgish = 'Luxembourgish';
  RCStrLuba = 'Luba';
  RCStrLuganda = 'Luganda';
  RCStrLuhya = 'Luhya';
  RCStrLuo = 'Luo';
  RCStrLatvian = 'Latvian';
  RCStrMajang = 'Majang';
  RCStrMakua = 'Makua';
  RCStrMalayalamTraditional = 'Malayalam Traditional';
  RCStrMansi = 'Mansi';
  RCStrMapudungun = 'Mapudungun';
  RCStrMarathi = 'Marathi';
  RCStrMarwari = 'Marwari';
  RCStrMbundu = 'Mbundu';
  RCStrManchu = 'Manchu';
  RCStrMooseCree = 'Moose Cree';
  RCStrMende = 'Mende';
  RCStrMeen = 'Me''en';
  RCStrMizo = 'Mizo';
  RCStrMacedonian = 'Macedonian';
  RCStrMale = 'Male';
  RCStrMalagasy = 'Malagasy';
  RCStrMalinke = 'Malinke';
  RCStrMalayalamReformed = 'Malayalam Reformed';
  RCStrMalay = 'Malay';
  RCStrMandinka = 'Mandinka';
  RCStrMongolian = 'Mongolian';
  RCStrManipuri = 'Manipuri';
  RCStrManinka = 'Maninka';
  RCStrManxGaelic = 'Manx Gaelic';
  RCStrMohawk = 'Mohawk';
  RCStrMoksha = 'Moksha';
  RCStrMoldavian = 'Moldavian';
  RCStrMon = 'Mon';
  RCStrMoroccan = 'Moroccan';
  RCStrMaori = 'Maori';
  RCStrMaithili = 'Maithili';
  RCStrMaltese = 'Maltese';
  RCStrMundari = 'Mundari';
  RCStrNagaAssamese = 'Naga-Assamese';
  RCStrNanai = 'Nanai';
  RCStrNaskapi = 'Naskapi';
  RCStrNCree = 'N-Cree';
  RCStrNdebele = 'Ndebele';
  RCStrNdonga = 'Ndonga';
  RCStrNepali = 'Nepali';
  RCStrNewari = 'Newari';
  RCStrNagari = 'Nagari';
  RCStrNorwayHouseCree = 'Norway House Cree';
  RCStrNisi = 'Nisi';
  RCStrNiuean = 'Niuean';
  RCStrNkole = 'Nkole';
  RCStrNKo = 'N''Ko';
  RCStrDutch = 'Dutch';
  RCStrNogai = 'Nogai';
  RCStrNorwegian = 'Norwegian';
  RCStrNorthernSami = 'Northern Sami';
  RCStrNorthernTai = 'Northern Tai';
  RCStrEsperanto = 'Esperanto';
  RCStrNynorsk = 'Nynorsk';
  RCStrOccitan = 'Occitan';
  RCStrOjiCree = 'Oji-Cree';
  RCStrOjibway = 'Ojibway';
  RCStrOriya = 'Oriya';
  RCStrOromo = 'Oromo';
  RCStrOssetian = 'Ossetian';
  RCStrPalestinianAramaic = 'Palestinian Aramaic';
  RCStrPali = 'Pali';
  RCStrPunjabi = 'Punjabi';
  RCStrPalpa = 'Palpa';
  RCStrPashto = 'Pashto';
  RCStrPolytonicGreek = 'Polytonic Greek';
  RCStrFilipino = 'Filipino';
  RCStrPalaung = 'Palaung';
  RCStrPolish = 'Polish';
  RCStrProvencal = 'Provencal';
  RCStrPortuguese = 'Portuguese';
  RCStrChin = 'Chin';
  RCStrRajasthani = 'Rajasthani';
  RCStrRCree = 'R-Cree';
  RCStrRussianBuriat = 'Russian Buriat';
  RCStrRiang = 'Riang';
  RCStrRhaetoRomanic = 'Rhaeto-Romanic';
  RCStrRomanian = 'Romanian';
  RCStrRomany = 'Romany';
  RCStrRusyn = 'Rusyn';
  RCStrRuanda = 'Ruanda';
  RCStrRussian = 'Russian';
  RCStrSadri = 'Sadri';
  RCStrSanskrit = 'Sanskrit';
  RCStrSantali = 'Santali';
  RCStrSayisi = 'Sayisi';
  RCStrSekota = 'Sekota';
  RCStrSelkup = 'Selkup';
  RCStrSango = 'Sango';
  RCStrShan = 'Shan';
  RCStrSibe = 'Sibe';
  RCStrSidamo = 'Sidamo';
  RCStrSilteGurage = 'Silte Gurage';
  RCStrSkoltSami = 'Skolt Sami';
  RCStrSlovak = 'Slovak';
  RCStrSlavey = 'Slavey';
  RCStrSlovenian = 'Slovenian';
  RCStrSomali = 'Somali';
  RCStrSamoan = 'Samoan';
  RCStrSena = 'Sena';
  RCStrSindhi = 'Sindhi';
  RCStrSinhalese = 'Sinhalese';
  RCStrSoninke = 'Soninke';
  RCStrSodoGurage = 'Sodo Gurage';
  RCStrSotho = 'Sotho';
  RCStrAlbanian = 'Albanian';
  RCStrSerbian = 'Serbian';
  RCStrSaraiki = 'Saraiki';
  RCStrSerer = 'Serer';
  RCStrSouthSlavey = 'South Slavey';
  RCStrSouthernSami = 'Southern Sami';
  RCStrSvan = 'Svan';
  RCStrSuri = 'Suri';
  RCStrSwedish = 'Swedish';
  RCStrSwadayaAramaic = 'Swadaya Aramaic';
  RCStrSwahili = 'Swahili';
  RCStrSwazi = 'Swazi';
  RCStrSutu = 'Sutu';
  RCStrSyriac = 'Syriac';
  RCStrTabasaran = 'Tabasaran';
  RCStrTajiki = 'Tajiki';
  RCStrTamil = 'Tamil';
  RCStrTatar = 'Tatar';
  RCStrTHCree = 'TH-Cree';
  RCStrTelugu = 'Telugu';
  RCStrTongan = 'Tongan';
  RCStrTigre = 'Tigre';
  RCStrTigrinya = 'Tigrinya';
  RCStrThai = 'Thai';
  RCStrTahitian = 'Tahitian';
  RCStrTibetan = 'Tibetan';
  RCStrTurkmen = 'Turkmen';
  RCStrTemne = 'Temne';
  RCStrTswana = 'Tswana';
  RCStrTundraNenets = 'Tundra Nenets';
  RCStrTonga = 'Tonga';
  RCStrTodo = 'Todo';
  RCStrTurkish = 'Turkish';
  RCStrTsonga = 'Tsonga';
  RCStrTuroyoAramaic = 'Turoyo Aramaic';
  RCStrTulu = 'Tulu';
  RCStrTuvin = 'Tuvin';
  RCStrTwi = 'Twi';
  RCStrUdmurt = 'Udmurt';
  RCStrUkrainian = 'Ukrainian';
  RCStrUrdu = 'Urdu';
  RCStrUpperSorbian = 'Upper Sorbian';
  RCStrUyghur = 'Uyghur';
  RCStrUzbek = 'Uzbek';
  RCStrVenda = 'Venda';
  RCStrVietnamese = 'Vietnamese';
  RCStrWa = 'Wa';
  RCStrWagdi = 'Wagdi';
  RCStrWestCree = 'West-Cree';
  RCStrWelsh = 'Welsh';
  RCStrWolof = 'Wolof';
  RCStrTaiLue = 'Tai Lue';
  RCStrXhosa = 'Xhosa';
  RCStrYakut = 'Yakut';
  RCStrYoruba = 'Yoruba';
  RCStrYCree = 'Y-Cree';
  RCStrYiClassic = 'Yi Classic';
  RCStrYiModern = 'Yi Modern';
  RCStrChineseHongKong = 'Chinese Hong Kong';
  RCStrChinesePhonetic = 'Chinese Phonetic';
  RCStrChineseSimplified = 'Chinese Simplified';
  RCStrChineseTraditional = 'Chinese Traditional';
  RCStrZande = 'Zande';
  RCStrZulu = 'Zulu';


{ TOpenTypeAbazaLanguageSystemTable }

class function TOpenTypeAbazaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAbaza;
end;

class function TOpenTypeAbazaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ABA ';
end;


{ TOpenTypeAbkhazianLanguageSystemTable }

class function TOpenTypeAbkhazianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAbkhazian;
end;

class function TOpenTypeAbkhazianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ABK ';
end;


{ TOpenTypeAdygheLanguageSystemTable }

class function TOpenTypeAdygheLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAdyghe;
end;

class function TOpenTypeAdygheLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ADY ';
end;


{ TOpenTypeAfrikaansLanguageSystemTable }

class function TOpenTypeAfrikaansLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAfrikaans;
end;

class function TOpenTypeAfrikaansLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AFK ';
end;


{ TOpenTypeAfarLanguageSystemTable }

class function TOpenTypeAfarLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAfar;
end;

class function TOpenTypeAfarLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AFR ';
end;


{ TOpenTypeAgawLanguageSystemTable }

class function TOpenTypeAgawLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAgaw;
end;

class function TOpenTypeAgawLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AGW ';
end;


{ TOpenTypeAlsatianLanguageSystemTable }

class function TOpenTypeAlsatianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAlsatian;
end;

class function TOpenTypeAlsatianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ALS ';
end;


{ TOpenTypeAltaiLanguageSystemTable }

class function TOpenTypeAltaiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAltai;
end;

class function TOpenTypeAltaiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ALT ';
end;


{ TOpenTypeAmharicLanguageSystemTable }

class function TOpenTypeAmharicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAmharic;
end;

class function TOpenTypeAmharicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AMH ';
end;


{ TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable }

class function
  TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrPhoneticTranscriptionAmericanistConventions;
end;

class function
  TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable.
  GetTableType: TTableType;
begin
  Result := 'APPH';
end;


{ TOpenTypeArabicLanguageSystemTable }

class function TOpenTypeArabicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrArabic;
end;

class function TOpenTypeArabicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ARA ';
end;


{ TOpenTypeAariLanguageSystemTable }

class function TOpenTypeAariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAari;
end;

class function TOpenTypeAariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ARI ';
end;


{ TOpenTypeArakaneseLanguageSystemTable }

class function TOpenTypeArakaneseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrArakanese;
end;

class function TOpenTypeArakaneseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ARK ';
end;


{ TOpenTypeAssameseLanguageSystemTable }

class function TOpenTypeAssameseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAssamese;
end;

class function TOpenTypeAssameseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ASM ';
end;


{ TOpenTypeAthapaskanLanguageSystemTable }

class function TOpenTypeAthapaskanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAthapaskan;
end;

class function TOpenTypeAthapaskanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ATH ';
end;


{ TOpenTypeAvarLanguageSystemTable }

class function TOpenTypeAvarLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAvar;
end;

class function TOpenTypeAvarLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AVR ';
end;


{ TOpenTypeAwadhiLanguageSystemTable }

class function TOpenTypeAwadhiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAwadhi;
end;

class function TOpenTypeAwadhiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AWA ';
end;


{ TOpenTypeAymaraLanguageSystemTable }

class function TOpenTypeAymaraLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAymara;
end;

class function TOpenTypeAymaraLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AYM ';
end;


{ TOpenTypeAzeriLanguageSystemTable }

class function TOpenTypeAzeriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAzeri;
end;

class function TOpenTypeAzeriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'AZE ';
end;


{ TOpenTypeBadagaLanguageSystemTable }

class function TOpenTypeBadagaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBadaga;
end;

class function TOpenTypeBadagaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BAD ';
end;


{ TOpenTypeBaghelkhandiLanguageSystemTable }

class function TOpenTypeBaghelkhandiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBaghelkhandi;
end;

class function TOpenTypeBaghelkhandiLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'BAG ';
end;


{ TOpenTypeBalkarLanguageSystemTable }

class function TOpenTypeBalkarLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBalkar;
end;

class function TOpenTypeBalkarLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BAL ';
end;


{ TOpenTypeBauleLanguageSystemTable }

class function TOpenTypeBauleLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBaule;
end;

class function TOpenTypeBauleLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BAU ';
end;


{ TOpenTypeBerberLanguageSystemTable }

class function TOpenTypeBerberLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBerber;
end;

class function TOpenTypeBerberLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BBR ';
end;


{ TOpenTypeBenchLanguageSystemTable }

class function TOpenTypeBenchLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBench;
end;

class function TOpenTypeBenchLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BCH ';
end;


{ TOpenTypeBibleCreeLanguageSystemTable }

class function TOpenTypeBibleCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBibleCree;
end;

class function TOpenTypeBibleCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BCR ';
end;


{ TOpenTypeBelarussianLanguageSystemTable }

class function TOpenTypeBelarussianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBelarussian;
end;

class function TOpenTypeBelarussianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BEL ';
end;


{ TOpenTypeBembaLanguageSystemTable }

class function TOpenTypeBembaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBemba;
end;

class function TOpenTypeBembaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BEM ';
end;


{ TOpenTypeBengaliLanguageSystemTable }

class function TOpenTypeBengaliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBengali;
end;

class function TOpenTypeBengaliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BEN ';
end;


{ TOpenTypeBulgarianLanguageSystemTable }

class function TOpenTypeBulgarianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBulgarian;
end;

class function TOpenTypeBulgarianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BGR ';
end;


{ TOpenTypeBhiliLanguageSystemTable }

class function TOpenTypeBhiliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBhili;
end;

class function TOpenTypeBhiliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BHI ';
end;


{ TOpenTypeBhojpuriLanguageSystemTable }

class function TOpenTypeBhojpuriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBhojpuri;
end;

class function TOpenTypeBhojpuriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BHO ';
end;


{ TOpenTypeBikolLanguageSystemTable }

class function TOpenTypeBikolLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBikol;
end;

class function TOpenTypeBikolLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BIK ';
end;


{ TOpenTypeBilenLanguageSystemTable }

class function TOpenTypeBilenLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBilen;
end;

class function TOpenTypeBilenLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BIL ';
end;


{ TOpenTypeBlackfootLanguageSystemTable }

class function TOpenTypeBlackfootLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBlackfoot;
end;

class function TOpenTypeBlackfootLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BKF ';
end;


{ TOpenTypeBalochiLanguageSystemTable }

class function TOpenTypeBalochiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBalochi;
end;

class function TOpenTypeBalochiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BLI ';
end;


{ TOpenTypeBalanteLanguageSystemTable }

class function TOpenTypeBalanteLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBalante;
end;

class function TOpenTypeBalanteLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BLN ';
end;


{ TOpenTypeBaltiLanguageSystemTable }

class function TOpenTypeBaltiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBalti;
end;

class function TOpenTypeBaltiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BLT ';
end;


{ TOpenTypeBambaraLanguageSystemTable }

class function TOpenTypeBambaraLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBambara;
end;

class function TOpenTypeBambaraLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BMB ';
end;


{ TOpenTypeBamilekeLanguageSystemTable }

class function TOpenTypeBamilekeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBamileke;
end;

class function TOpenTypeBamilekeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BML ';
end;


{ TOpenTypeBosnianLanguageSystemTable }

class function TOpenTypeBosnianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBosnian;
end;

class function TOpenTypeBosnianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BOS ';
end;


{ TOpenTypeBretonLanguageSystemTable }

class function TOpenTypeBretonLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBreton;
end;

class function TOpenTypeBretonLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BRE ';
end;


{ TOpenTypeBrahuiLanguageSystemTable }

class function TOpenTypeBrahuiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBrahui;
end;

class function TOpenTypeBrahuiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BRH ';
end;


{ TOpenTypeBrajBhashaLanguageSystemTable }

class function TOpenTypeBrajBhashaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBrajBhasha;
end;

class function TOpenTypeBrajBhashaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BRI ';
end;


{ TOpenTypeBurmeseLanguageSystemTable }

class function TOpenTypeBurmeseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBurmese;
end;

class function TOpenTypeBurmeseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BRM ';
end;


{ TOpenTypeBashkirLanguageSystemTable }

class function TOpenTypeBashkirLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBashkir;
end;

class function TOpenTypeBashkirLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BSH ';
end;


{ TOpenTypeBetiLanguageSystemTable }

class function TOpenTypeBetiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBeti;
end;

class function TOpenTypeBetiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'BTI ';
end;


{ TOpenTypeCatalanLanguageSystemTable }

class function TOpenTypeCatalanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCatalan;
end;

class function TOpenTypeCatalanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CAT ';
end;


{ TOpenTypeCebuanoLanguageSystemTable }

class function TOpenTypeCebuanoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCebuano;
end;

class function TOpenTypeCebuanoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CEB ';
end;


{ TOpenTypeChechenLanguageSystemTable }

class function TOpenTypeChechenLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChechen;
end;

class function TOpenTypeChechenLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHE ';
end;


{ TOpenTypeChahaGurageLanguageSystemTable }

class function TOpenTypeChahaGurageLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChahaGurage;
end;

class function TOpenTypeChahaGurageLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHG ';
end;


{ TOpenTypeChattisgarhiLanguageSystemTable }

class function TOpenTypeChattisgarhiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChattisgarhi;
end;

class function TOpenTypeChattisgarhiLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'CHH ';
end;


{ TOpenTypeChichewaLanguageSystemTable }

class function TOpenTypeChichewaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChichewa;
end;

class function TOpenTypeChichewaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHI ';
end;


{ TOpenTypeChukchiLanguageSystemTable }

class function TOpenTypeChukchiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChukchi;
end;

class function TOpenTypeChukchiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHK ';
end;


{ TOpenTypeChipewyanLanguageSystemTable }

class function TOpenTypeChipewyanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChipewyan;
end;

class function TOpenTypeChipewyanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHP ';
end;


{ TOpenTypeCherokeeLanguageSystemTable }

class function TOpenTypeCherokeeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCherokee;
end;

class function TOpenTypeCherokeeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHR ';
end;


{ TOpenTypeChuvashLanguageSystemTable }

class function TOpenTypeChuvashLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChuvash;
end;

class function TOpenTypeChuvashLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CHU ';
end;


{ TOpenTypeComorianLanguageSystemTable }

class function TOpenTypeComorianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrComorian;
end;

class function TOpenTypeComorianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CMR ';
end;


{ TOpenTypeCopticLanguageSystemTable }

class function TOpenTypeCopticLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCoptic;
end;

class function TOpenTypeCopticLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'COP ';
end;


{ TOpenTypeCorsicanLanguageSystemTable }

class function TOpenTypeCorsicanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCorsican;
end;

class function TOpenTypeCorsicanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'COS ';
end;


{ TOpenTypeCreeLanguageSystemTable }

class function TOpenTypeCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCree;
end;

class function TOpenTypeCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CRE ';
end;


{ TOpenTypeCarrierLanguageSystemTable }

class function TOpenTypeCarrierLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCarrier;
end;

class function TOpenTypeCarrierLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CRR ';
end;


{ TOpenTypeCrimeanTatarLanguageSystemTable }

class function TOpenTypeCrimeanTatarLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCrimeanTatar;
end;

class function TOpenTypeCrimeanTatarLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'CRT ';
end;


{ TOpenTypeChurchSlavonicLanguageSystemTable }

class function TOpenTypeChurchSlavonicLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrChurchSlavonic;
end;

class function TOpenTypeChurchSlavonicLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'CSL ';
end;


{ TOpenTypeCzechLanguageSystemTable }

class function TOpenTypeCzechLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCzech;
end;

class function TOpenTypeCzechLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'CSY ';
end;


{ TOpenTypeDanishLanguageSystemTable }

class function TOpenTypeDanishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDanish;
end;

class function TOpenTypeDanishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DAN ';
end;


{ TOpenTypeDargwaLanguageSystemTable }

class function TOpenTypeDargwaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDargwa;
end;

class function TOpenTypeDargwaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DAR ';
end;


{ TOpenTypeWoodsCreeLanguageSystemTable }

class function TOpenTypeWoodsCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrWoodsCree;
end;

class function TOpenTypeWoodsCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DCR ';
end;


{ TOpenTypeGermanLanguageSystemTable }

class function TOpenTypeGermanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGerman;
end;

class function TOpenTypeGermanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DEU ';
end;


{ TOpenTypeDogriLanguageSystemTable }

class function TOpenTypeDogriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDogri;
end;

class function TOpenTypeDogriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DGR ';
end;


{ TOpenTypeDhivehiLanguageSystemTable }

class function TOpenTypeDhivehiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDhivehi;
end;

class function TOpenTypeDhivehiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DHV ';
end;


{ TOpenTypeDhivehiDeprecatedLanguageSystemTable }

class function TOpenTypeDhivehiDeprecatedLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrDhivehi;
end;

class function TOpenTypeDhivehiDeprecatedLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'DIV ';
end;


{ TOpenTypeDjermaLanguageSystemTable }

class function TOpenTypeDjermaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDjerma;
end;

class function TOpenTypeDjermaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DJR ';
end;


{ TOpenTypeDangmeLanguageSystemTable }

class function TOpenTypeDangmeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDangme;
end;

class function TOpenTypeDangmeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DNG ';
end;


{ TOpenTypeDinkaLanguageSystemTable }

class function TOpenTypeDinkaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDinka;
end;

class function TOpenTypeDinkaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DNK ';
end;


{ TOpenTypeDariLanguageSystemTable }

class function TOpenTypeDariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDari;
end;

class function TOpenTypeDariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DRI ';
end;


{ TOpenTypeDunganLanguageSystemTable }

class function TOpenTypeDunganLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDungan;
end;

class function TOpenTypeDunganLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DUN ';
end;


{ TOpenTypeDzongkhaLanguageSystemTable }

class function TOpenTypeDzongkhaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDzongkha;
end;

class function TOpenTypeDzongkhaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'DZN ';
end;


{ TOpenTypeEbiraLanguageSystemTable }

class function TOpenTypeEbiraLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEbira;
end;

class function TOpenTypeEbiraLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EBI ';
end;


{ TOpenTypeEasternCreeLanguageSystemTable }

class function TOpenTypeEasternCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEasternCree;
end;

class function TOpenTypeEasternCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ECR ';
end;


{ TOpenTypeEdoLanguageSystemTable }

class function TOpenTypeEdoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEdo;
end;

class function TOpenTypeEdoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EDO ';
end;


{ TOpenTypeEfikLanguageSystemTable }

class function TOpenTypeEfikLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEfik;
end;

class function TOpenTypeEfikLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EFI ';
end;


{ TOpenTypeGreekLanguageSystemTable }

class function TOpenTypeGreekLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGreek;
end;

class function TOpenTypeGreekLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ELL ';
end;


{ TOpenTypeEnglishLanguageSystemTable }

class function TOpenTypeEnglishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEnglish;
end;

class function TOpenTypeEnglishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ENG ';
end;


{ TOpenTypeErzyaLanguageSystemTable }

class function TOpenTypeErzyaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrErzya;
end;

class function TOpenTypeErzyaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ERZ ';
end;


{ TOpenTypeSpanishLanguageSystemTable }

class function TOpenTypeSpanishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSpanish;
end;

class function TOpenTypeSpanishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ESP ';
end;


{ TOpenTypeEstonianLanguageSystemTable }

class function TOpenTypeEstonianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEstonian;
end;

class function TOpenTypeEstonianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ETI ';
end;


{ TOpenTypeBasqueLanguageSystemTable }

class function TOpenTypeBasqueLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrBasque;
end;

class function TOpenTypeBasqueLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EUQ ';
end;


{ TOpenTypeEvenkiLanguageSystemTable }

class function TOpenTypeEvenkiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEvenki;
end;

class function TOpenTypeEvenkiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EVK ';
end;


{ TOpenTypeEvenLanguageSystemTable }

class function TOpenTypeEvenLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEven;
end;

class function TOpenTypeEvenLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EVN ';
end;


{ TOpenTypeEweLanguageSystemTable }

class function TOpenTypeEweLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEwe;
end;

class function TOpenTypeEweLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'EWE ';
end;


{ TOpenTypeFrenchAntilleanLanguageSystemTable }

class function TOpenTypeFrenchAntilleanLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrFrenchAntillean;
end;

class function TOpenTypeFrenchAntilleanLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'FAN ';
end;


{ TOpenTypeFarsiLanguageSystemTable }

class function TOpenTypeFarsiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFarsi;
end;

class function TOpenTypeFarsiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FAR ';
end;


{ TOpenTypeFinnishLanguageSystemTable }

class function TOpenTypeFinnishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFinnish;
end;

class function TOpenTypeFinnishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FIN ';
end;


{ TOpenTypeFijianLanguageSystemTable }

class function TOpenTypeFijianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFijian;
end;

class function TOpenTypeFijianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FJI ';
end;


{ TOpenTypeFlemishLanguageSystemTable }

class function TOpenTypeFlemishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFlemish;
end;

class function TOpenTypeFlemishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FLE ';
end;


{ TOpenTypeForestNenetsLanguageSystemTable }

class function TOpenTypeForestNenetsLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrForestNenets;
end;

class function TOpenTypeForestNenetsLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'FNE ';
end;


{ TOpenTypeFonLanguageSystemTable }

class function TOpenTypeFonLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFon;
end;

class function TOpenTypeFonLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FON ';
end;


{ TOpenTypeFaroeseLanguageSystemTable }

class function TOpenTypeFaroeseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFaroese;
end;

class function TOpenTypeFaroeseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FOS ';
end;


{ TOpenTypeFrenchLanguageSystemTable }

class function TOpenTypeFrenchLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFrench;
end;

class function TOpenTypeFrenchLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FRA ';
end;


{ TOpenTypeFrisianLanguageSystemTable }

class function TOpenTypeFrisianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFrisian;
end;

class function TOpenTypeFrisianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FRI ';
end;


{ TOpenTypeFriulianLanguageSystemTable }

class function TOpenTypeFriulianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFriulian;
end;

class function TOpenTypeFriulianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FRL ';
end;


{ TOpenTypeFutaLanguageSystemTable }

class function TOpenTypeFutaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFuta;
end;

class function TOpenTypeFutaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FTA ';
end;


{ TOpenTypeFulaniLanguageSystemTable }

class function TOpenTypeFulaniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFulani;
end;

class function TOpenTypeFulaniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'FUL ';
end;


{ TOpenTypeGaLanguageSystemTable }

class function TOpenTypeGaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGa;
end;

class function TOpenTypeGaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GAD ';
end;


{ TOpenTypeGaelicLanguageSystemTable }

class function TOpenTypeGaelicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGaelic;
end;

class function TOpenTypeGaelicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GAE ';
end;


{ TOpenTypeGagauzLanguageSystemTable }

class function TOpenTypeGagauzLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGagauz;
end;

class function TOpenTypeGagauzLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GAG ';
end;


{ TOpenTypeGalicianLanguageSystemTable }

class function TOpenTypeGalicianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGalician;
end;

class function TOpenTypeGalicianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GAL ';
end;


{ TOpenTypeGarshuniLanguageSystemTable }

class function TOpenTypeGarshuniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGarshuni;
end;

class function TOpenTypeGarshuniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GA  ';
end;


{ TOpenTypeGarhwaliLanguageSystemTable }

class function TOpenTypeGarhwaliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGarhwali;
end;

class function TOpenTypeGarhwaliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GAW ';
end;


{ TOpenTypeGeEzLanguageSystemTable }

class function TOpenTypeGeEzLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGeez;
end;

class function TOpenTypeGeEzLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GEZ ';
end;


{ TOpenTypeGilyakLanguageSystemTable }

class function TOpenTypeGilyakLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGilyak;
end;

class function TOpenTypeGilyakLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GIL ';
end;


{ TOpenTypeGumuzLanguageSystemTable }

class function TOpenTypeGumuzLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGumuz;
end;

class function TOpenTypeGumuzLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GMZ ';
end;


{ TOpenTypeGondiLanguageSystemTable }

class function TOpenTypeGondiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGondi;
end;

class function TOpenTypeGondiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GON ';
end;


{ TOpenTypeGreenlandicLanguageSystemTable }

class function TOpenTypeGreenlandicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGreenlandic;
end;

class function TOpenTypeGreenlandicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GRN ';
end;


{ TOpenTypeGaroLanguageSystemTable }

class function TOpenTypeGaroLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGaro;
end;

class function TOpenTypeGaroLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GRO ';
end;


{ TOpenTypeGuaraniLanguageSystemTable }

class function TOpenTypeGuaraniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGuarani;
end;

class function TOpenTypeGuaraniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GUA ';
end;


{ TOpenTypeGujaratiLanguageSystemTable }

class function TOpenTypeGujaratiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGujarati;
end;

class function TOpenTypeGujaratiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'GUJ ';
end;


{ TOpenTypeHaitianLanguageSystemTable }

class function TOpenTypeHaitianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHaitian;
end;

class function TOpenTypeHaitianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HAI ';
end;


{ TOpenTypeHalamLanguageSystemTable }

class function TOpenTypeHalamLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHalam;
end;

class function TOpenTypeHalamLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HAL ';
end;


{ TOpenTypeHarautiLanguageSystemTable }

class function TOpenTypeHarautiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHarauti;
end;

class function TOpenTypeHarautiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HAR ';
end;


{ TOpenTypeHausaLanguageSystemTable }

class function TOpenTypeHausaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHausa;
end;

class function TOpenTypeHausaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HAU ';
end;


{ TOpenTypeHawaiinLanguageSystemTable }

class function TOpenTypeHawaiinLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHawaiin;
end;

class function TOpenTypeHawaiinLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HAW ';
end;


{ TOpenTypeHammerBannaLanguageSystemTable }

class function TOpenTypeHammerBannaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHammerBanna;
end;

class function TOpenTypeHammerBannaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HBN ';
end;


{ TOpenTypeHiligaynonLanguageSystemTable }

class function TOpenTypeHiligaynonLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHiligaynon;
end;

class function TOpenTypeHiligaynonLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HIL ';
end;


{ TOpenTypeHindiLanguageSystemTable }

class function TOpenTypeHindiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHindi;
end;

class function TOpenTypeHindiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HIN ';
end;


{ TOpenTypeHighMariLanguageSystemTable }

class function TOpenTypeHighMariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHighMari;
end;

class function TOpenTypeHighMariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HMA ';
end;


{ TOpenTypeHindkoLanguageSystemTable }

class function TOpenTypeHindkoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHindko;
end;

class function TOpenTypeHindkoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HND ';
end;


{ TOpenTypeHoLanguageSystemTable }

class function TOpenTypeHoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHo;
end;

class function TOpenTypeHoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HO  ';
end;


{ TOpenTypeHarariLanguageSystemTable }

class function TOpenTypeHarariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHarari;
end;

class function TOpenTypeHarariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HRI ';
end;


{ TOpenTypeCroatianLanguageSystemTable }

class function TOpenTypeCroatianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrCroatian;
end;

class function TOpenTypeCroatianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HRV ';
end;


{ TOpenTypeHungarianLanguageSystemTable }

class function TOpenTypeHungarianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHungarian;
end;

class function TOpenTypeHungarianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HUN ';
end;


{ TOpenTypeArmenianLanguageSystemTable }

class function TOpenTypeArmenianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrArmenian;
end;

class function TOpenTypeArmenianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'HYE ';
end;


{ TOpenTypeIgboLanguageSystemTable }

class function TOpenTypeIgboLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIgbo;
end;

class function TOpenTypeIgboLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'IBO ';
end;


{ TOpenTypeIjoLanguageSystemTable }

class function TOpenTypeIjoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIjo;
end;

class function TOpenTypeIjoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'IJO ';
end;


{ TOpenTypeIlokanoLanguageSystemTable }

class function TOpenTypeIlokanoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIlokano;
end;

class function TOpenTypeIlokanoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ILO ';
end;


{ TOpenTypeIndonesianLanguageSystemTable }

class function TOpenTypeIndonesianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIndonesian;
end;

class function TOpenTypeIndonesianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'IND ';
end;


{ TOpenTypeIngushLanguageSystemTable }

class function TOpenTypeIngushLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIngush;
end;

class function TOpenTypeIngushLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ING ';
end;


{ TOpenTypeInuktitutLanguageSystemTable }

class function TOpenTypeInuktitutLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrInuktitut;
end;

class function TOpenTypeInuktitutLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'INU ';
end;


{ TOpenTypePhoneticTranscriptionLanguageSystemTable }

class function TOpenTypePhoneticTranscriptionLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrPhoneticTranscriptionIpaConventions;
end;

class function TOpenTypePhoneticTranscriptionLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'IPP ';
end;


{ TOpenTypeIrishLanguageSystemTable }

class function TOpenTypeIrishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIrish;
end;

class function TOpenTypeIrishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'IRI ';
end;


{ TOpenTypeIrishTraditionalLanguageSystemTable }

class function TOpenTypeIrishTraditionalLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrIrishTraditional;
end;

class function TOpenTypeIrishTraditionalLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'IRT ';
end;


{ TOpenTypeIcelandicLanguageSystemTable }

class function TOpenTypeIcelandicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrIcelandic;
end;

class function TOpenTypeIcelandicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ISL ';
end;


{ TOpenTypeInariSamiLanguageSystemTable }

class function TOpenTypeInariSamiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrInariSami;
end;

class function TOpenTypeInariSamiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ISM ';
end;


{ TOpenTypeItalianLanguageSystemTable }

class function TOpenTypeItalianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrItalian;
end;

class function TOpenTypeItalianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ITA ';
end;


{ TOpenTypeHebrewLanguageSystemTable }

class function TOpenTypeHebrewLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrHebrew;
end;

class function TOpenTypeHebrewLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'IWR ';
end;


{ TOpenTypeJavaneseLanguageSystemTable }

class function TOpenTypeJavaneseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrJavanese;
end;

class function TOpenTypeJavaneseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'JAV ';
end;


{ TOpenTypeYiddishLanguageSystemTable }

class function TOpenTypeYiddishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrYiddish;
end;

class function TOpenTypeYiddishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'JII ';
end;


{ TOpenTypeJapaneseLanguageSystemTable }

class function TOpenTypeJapaneseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrJapanese;
end;

class function TOpenTypeJapaneseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'JAN ';
end;


{ TOpenTypeJudezmoLanguageSystemTable }

class function TOpenTypeJudezmoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrJudezmo;
end;

class function TOpenTypeJudezmoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'JUD ';
end;


{ TOpenTypeJulaLanguageSystemTable }

class function TOpenTypeJulaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrJula;
end;

class function TOpenTypeJulaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'JUL ';
end;


{ TOpenTypeKabardianLanguageSystemTable }

class function TOpenTypeKabardianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKabardian;
end;

class function TOpenTypeKabardianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAB ';
end;


{ TOpenTypeKachchiLanguageSystemTable }

class function TOpenTypeKachchiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKachchi;
end;

class function TOpenTypeKachchiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAC ';
end;


{ TOpenTypeKalenjinLanguageSystemTable }

class function TOpenTypeKalenjinLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKalenjin;
end;

class function TOpenTypeKalenjinLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAL ';
end;


{ TOpenTypeKannadaLanguageSystemTable }

class function TOpenTypeKannadaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKannada;
end;

class function TOpenTypeKannadaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAN ';
end;


{ TOpenTypeKarachayLanguageSystemTable }

class function TOpenTypeKarachayLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKarachay;
end;

class function TOpenTypeKarachayLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAR ';
end;


{ TOpenTypeGeorgianLanguageSystemTable }

class function TOpenTypeGeorgianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrGeorgian;
end;

class function TOpenTypeGeorgianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAT ';
end;


{ TOpenTypeKazakhLanguageSystemTable }

class function TOpenTypeKazakhLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKazakh;
end;

class function TOpenTypeKazakhLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KAZ ';
end;


{ TOpenTypeKebenaLanguageSystemTable }

class function TOpenTypeKebenaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKebena;
end;

class function TOpenTypeKebenaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KEB ';
end;


{ TOpenTypeKhutsuriGeorgianLanguageSystemTable }

class function TOpenTypeKhutsuriGeorgianLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrKhutsuriGeorgian;
end;

class function TOpenTypeKhutsuriGeorgianLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'KGE ';
end;


{ TOpenTypeKhakassLanguageSystemTable }

class function TOpenTypeKhakassLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKhakass;
end;

class function TOpenTypeKhakassLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KHA ';
end;


{ TOpenTypeKhantyKazimLanguageSystemTable }

class function TOpenTypeKhantyKazimLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKhantyKazim;
end;

class function TOpenTypeKhantyKazimLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KHK ';
end;


{ TOpenTypeKhmerLanguageSystemTable }

class function TOpenTypeKhmerLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKhmer;
end;

class function TOpenTypeKhmerLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KHM ';
end;


{ TOpenTypeKhantyShurishkarLanguageSystemTable }

class function TOpenTypeKhantyShurishkarLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrKhantyShurishkar;
end;

class function TOpenTypeKhantyShurishkarLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'KHS ';
end;


{ TOpenTypeKhantyVakhiLanguageSystemTable }

class function TOpenTypeKhantyVakhiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKhantyVakhi;
end;

class function TOpenTypeKhantyVakhiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KHV ';
end;


{ TOpenTypeKhowarLanguageSystemTable }

class function TOpenTypeKhowarLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKhowar;
end;

class function TOpenTypeKhowarLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KHW ';
end;


{ TOpenTypeKikuyuLanguageSystemTable }

class function TOpenTypeKikuyuLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKikuyu;
end;

class function TOpenTypeKikuyuLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KIK ';
end;


{ TOpenTypeKirghizLanguageSystemTable }

class function TOpenTypeKirghizLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKirghiz;
end;

class function TOpenTypeKirghizLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KIR ';
end;


{ TOpenTypeKisiiLanguageSystemTable }

class function TOpenTypeKisiiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKisii;
end;

class function TOpenTypeKisiiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KIS ';
end;


{ TOpenTypeKokniLanguageSystemTable }

class function TOpenTypeKokniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKokni;
end;

class function TOpenTypeKokniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KKN ';
end;


{ TOpenTypeKalmykLanguageSystemTable }

class function TOpenTypeKalmykLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKalmyk;
end;

class function TOpenTypeKalmykLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KLM ';
end;


{ TOpenTypeKambaLanguageSystemTable }

class function TOpenTypeKambaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKamba;
end;

class function TOpenTypeKambaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KMB ';
end;


{ TOpenTypeKumaoniLanguageSystemTable }

class function TOpenTypeKumaoniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKumaoni;
end;

class function TOpenTypeKumaoniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KMN ';
end;


{ TOpenTypeKomoLanguageSystemTable }

class function TOpenTypeKomoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKomo;
end;

class function TOpenTypeKomoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KMO ';
end;


{ TOpenTypeKomsoLanguageSystemTable }

class function TOpenTypeKomsoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKomso;
end;

class function TOpenTypeKomsoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KMS ';
end;


{ TOpenTypeKanuriLanguageSystemTable }

class function TOpenTypeKanuriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKanuri;
end;

class function TOpenTypeKanuriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KNR ';
end;


{ TOpenTypeKodaguLanguageSystemTable }

class function TOpenTypeKodaguLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKodagu;
end;

class function TOpenTypeKodaguLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KOD ';
end;


{ TOpenTypeKoreanOldHangulLanguageSystemTable }

class function TOpenTypeKoreanOldHangulLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrKoreanOldHangul;
end;

class function TOpenTypeKoreanOldHangulLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'KOH ';
end;


{ TOpenTypeKonkaniLanguageSystemTable }

class function TOpenTypeKonkaniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKonkani;
end;

class function TOpenTypeKonkaniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KOK ';
end;


{ TOpenTypeKikongoLanguageSystemTable }

class function TOpenTypeKikongoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKikongo;
end;

class function TOpenTypeKikongoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KON ';
end;


{ TOpenTypeKomiPermyakLanguageSystemTable }

class function TOpenTypeKomiPermyakLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKomiPermyak;
end;

class function TOpenTypeKomiPermyakLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KOP ';
end;


{ TOpenTypeKoreanLanguageSystemTable }

class function TOpenTypeKoreanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKorean;
end;

class function TOpenTypeKoreanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KOR ';
end;


{ TOpenTypeKomiZyrianLanguageSystemTable }

class function TOpenTypeKomiZyrianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKomiZyrian;
end;

class function TOpenTypeKomiZyrianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KOZ ';
end;


{ TOpenTypeKpelleLanguageSystemTable }

class function TOpenTypeKpelleLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKpelle;
end;

class function TOpenTypeKpelleLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KPL ';
end;


{ TOpenTypeKrioLanguageSystemTable }

class function TOpenTypeKrioLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKrio;
end;

class function TOpenTypeKrioLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KRI ';
end;


{ TOpenTypeKarakalpakLanguageSystemTable }

class function TOpenTypeKarakalpakLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKarakalpak;
end;

class function TOpenTypeKarakalpakLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KRK ';
end;


{ TOpenTypeKarelianLanguageSystemTable }

class function TOpenTypeKarelianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKarelian;
end;

class function TOpenTypeKarelianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KRL ';
end;


{ TOpenTypeKaraimLanguageSystemTable }

class function TOpenTypeKaraimLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKaraim;
end;

class function TOpenTypeKaraimLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KRM ';
end;


{ TOpenTypeKarenLanguageSystemTable }

class function TOpenTypeKarenLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKaren;
end;

class function TOpenTypeKarenLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KRN ';
end;


{ TOpenTypeKooreteLanguageSystemTable }

class function TOpenTypeKooreteLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKoorete;
end;

class function TOpenTypeKooreteLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KRT ';
end;


{ TOpenTypeKashmiriLanguageSystemTable }

class function TOpenTypeKashmiriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKashmiri;
end;

class function TOpenTypeKashmiriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KSH ';
end;


{ TOpenTypeKhasiLanguageSystemTable }

class function TOpenTypeKhasiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKhasi;
end;

class function TOpenTypeKhasiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KSI ';
end;


{ TOpenTypeKildinSamiLanguageSystemTable }

class function TOpenTypeKildinSamiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKildinSami;
end;

class function TOpenTypeKildinSamiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KSM ';
end;


{ TOpenTypeKuiLanguageSystemTable }

class function TOpenTypeKuiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKui;
end;

class function TOpenTypeKuiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KUI ';
end;


{ TOpenTypeKulviLanguageSystemTable }

class function TOpenTypeKulviLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKulvi;
end;

class function TOpenTypeKulviLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KUL ';
end;


{ TOpenTypeKumykLanguageSystemTable }

class function TOpenTypeKumykLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKumyk;
end;

class function TOpenTypeKumykLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KUM ';
end;


{ TOpenTypeKurdishLanguageSystemTable }

class function TOpenTypeKurdishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKurdish;
end;

class function TOpenTypeKurdishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KUR ';
end;


{ TOpenTypeKurukhLanguageSystemTable }

class function TOpenTypeKurukhLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKurukh;
end;

class function TOpenTypeKurukhLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KUU ';
end;


{ TOpenTypeKuyLanguageSystemTable }

class function TOpenTypeKuyLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKuy;
end;

class function TOpenTypeKuyLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KUY ';
end;


{ TOpenTypeKoryakLanguageSystemTable }

class function TOpenTypeKoryakLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrKoryak;
end;

class function TOpenTypeKoryakLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'KYK ';
end;


{ TOpenTypeLadinLanguageSystemTable }

class function TOpenTypeLadinLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLadin;
end;

class function TOpenTypeLadinLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAD ';
end;


{ TOpenTypeLahuliLanguageSystemTable }

class function TOpenTypeLahuliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLahuli;
end;

class function TOpenTypeLahuliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAH ';
end;


{ TOpenTypeLakLanguageSystemTable }

class function TOpenTypeLakLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLak;
end;

class function TOpenTypeLakLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAK ';
end;


{ TOpenTypeLambaniLanguageSystemTable }

class function TOpenTypeLambaniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLambani;
end;

class function TOpenTypeLambaniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAM ';
end;


{ TOpenTypeLaoLanguageSystemTable }

class function TOpenTypeLaoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLao;
end;

class function TOpenTypeLaoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAO ';
end;


{ TOpenTypeLatinLanguageSystemTable }

class function TOpenTypeLatinLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLatin;
end;

class function TOpenTypeLatinLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAT ';
end;


{ TOpenTypeLazLanguageSystemTable }

class function TOpenTypeLazLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLaz;
end;

class function TOpenTypeLazLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LAZ ';
end;


{ TOpenTypeLCreeLanguageSystemTable }

class function TOpenTypeLCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLCree;
end;

class function TOpenTypeLCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LCR ';
end;


{ TOpenTypeLadakhiLanguageSystemTable }

class function TOpenTypeLadakhiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLadakhi;
end;

class function TOpenTypeLadakhiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LDK ';
end;


{ TOpenTypeLezgiLanguageSystemTable }

class function TOpenTypeLezgiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLezgi;
end;

class function TOpenTypeLezgiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LEZ ';
end;


{ TOpenTypeLingalaLanguageSystemTable }

class function TOpenTypeLingalaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLingala;
end;

class function TOpenTypeLingalaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LIN ';
end;


{ TOpenTypeLowMariLanguageSystemTable }

class function TOpenTypeLowMariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLowMari;
end;

class function TOpenTypeLowMariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LMA ';
end;


{ TOpenTypeLimbuLanguageSystemTable }

class function TOpenTypeLimbuLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLimbu;
end;

class function TOpenTypeLimbuLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LMB ';
end;


{ TOpenTypeLomweLanguageSystemTable }

class function TOpenTypeLomweLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLomwe;
end;

class function TOpenTypeLomweLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LMW ';
end;


{ TOpenTypeLowerSorbianLanguageSystemTable }

class function TOpenTypeLowerSorbianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLowerSorbian;
end;

class function TOpenTypeLowerSorbianLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'LSB ';
end;


{ TOpenTypeLuleSamiLanguageSystemTable }

class function TOpenTypeLuleSamiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLuleSami;
end;

class function TOpenTypeLuleSamiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LSM ';
end;


{ TOpenTypeLithuanianLanguageSystemTable }

class function TOpenTypeLithuanianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLithuanian;
end;

class function TOpenTypeLithuanianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LTH ';
end;


{ TOpenTypeLuxembourgishLanguageSystemTable }

class function TOpenTypeLuxembourgishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLuxembourgish;
end;

class function TOpenTypeLuxembourgishLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'LTZ ';
end;


{ TOpenTypeLubaLanguageSystemTable }

class function TOpenTypeLubaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLuba;
end;

class function TOpenTypeLubaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LUB ';
end;


{ TOpenTypeLugandaLanguageSystemTable }

class function TOpenTypeLugandaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLuganda;
end;

class function TOpenTypeLugandaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LUG ';
end;


{ TOpenTypeLuhyaLanguageSystemTable }

class function TOpenTypeLuhyaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLuhya;
end;

class function TOpenTypeLuhyaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LUH ';
end;


{ TOpenTypeLuoLanguageSystemTable }

class function TOpenTypeLuoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLuo;
end;

class function TOpenTypeLuoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LUO ';
end;


{ TOpenTypeLatvianLanguageSystemTable }

class function TOpenTypeLatvianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrLatvian;
end;

class function TOpenTypeLatvianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'LVI ';
end;


{ TOpenTypeMajangLanguageSystemTable }

class function TOpenTypeMajangLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMajang;
end;

class function TOpenTypeMajangLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MAJ ';
end;


{ TOpenTypeMakuaLanguageSystemTable }

class function TOpenTypeMakuaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMakua;
end;

class function TOpenTypeMakuaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MAK ';
end;


{ TOpenTypeMalayalamTraditionalLanguageSystemTable }

class function TOpenTypeMalayalamTraditionalLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrMalayalamTraditional;
end;

class function TOpenTypeMalayalamTraditionalLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'MAL ';
end;


{ TOpenTypeMansiLanguageSystemTable }

class function TOpenTypeMansiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMansi;
end;

class function TOpenTypeMansiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MAN ';
end;


{ TOpenTypeMapudungunLanguageSystemTable }

class function TOpenTypeMapudungunLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMapudungun;
end;

class function TOpenTypeMapudungunLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MAP ';
end;


{ TOpenTypeMarathiLanguageSystemTable }

class function TOpenTypeMarathiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMarathi;
end;

class function TOpenTypeMarathiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MAR ';
end;


{ TOpenTypeMarwariLanguageSystemTable }

class function TOpenTypeMarwariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMarwari;
end;

class function TOpenTypeMarwariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MAW ';
end;


{ TOpenTypeMbunduLanguageSystemTable }

class function TOpenTypeMbunduLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMbundu;
end;

class function TOpenTypeMbunduLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MBN ';
end;


{ TOpenTypeManchuLanguageSystemTable }

class function TOpenTypeManchuLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrManchu;
end;

class function TOpenTypeManchuLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MCH ';
end;


{ TOpenTypeMooseCreeLanguageSystemTable }

class function TOpenTypeMooseCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMooseCree;
end;

class function TOpenTypeMooseCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MCR ';
end;


{ TOpenTypeMendeLanguageSystemTable }

class function TOpenTypeMendeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMende;
end;

class function TOpenTypeMendeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MDE ';
end;


{ TOpenTypeMeEnLanguageSystemTable }

class function TOpenTypeMeEnLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMeen;
end;

class function TOpenTypeMeEnLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MEN ';
end;


{ TOpenTypeMizoLanguageSystemTable }

class function TOpenTypeMizoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMizo;
end;

class function TOpenTypeMizoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MIZ ';
end;


{ TOpenTypeMacedonianLanguageSystemTable }

class function TOpenTypeMacedonianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMacedonian;
end;

class function TOpenTypeMacedonianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MKD ';
end;


{ TOpenTypeMaleLanguageSystemTable }

class function TOpenTypeMaleLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMale;
end;

class function TOpenTypeMaleLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MLE ';
end;


{ TOpenTypeMalagasyLanguageSystemTable }

class function TOpenTypeMalagasyLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMalagasy;
end;

class function TOpenTypeMalagasyLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MLG ';
end;


{ TOpenTypeMalinkeLanguageSystemTable }

class function TOpenTypeMalinkeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMalinke;
end;

class function TOpenTypeMalinkeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MLN ';
end;


{ TOpenTypeMalayalamReformedLanguageSystemTable }

class function TOpenTypeMalayalamReformedLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrMalayalamReformed;
end;

class function TOpenTypeMalayalamReformedLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'MLR ';
end;


{ TOpenTypeMalayLanguageSystemTable }

class function TOpenTypeMalayLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMalay;
end;

class function TOpenTypeMalayLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MLY ';
end;


{ TOpenTypeMandinkaLanguageSystemTable }

class function TOpenTypeMandinkaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMandinka;
end;

class function TOpenTypeMandinkaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MND ';
end;


{ TOpenTypeMongolianLanguageSystemTable }

class function TOpenTypeMongolianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMongolian;
end;

class function TOpenTypeMongolianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MNG ';
end;


{ TOpenTypeManipuriLanguageSystemTable }

class function TOpenTypeManipuriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrManipuri;
end;

class function TOpenTypeManipuriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MNI ';
end;


{ TOpenTypeManinkaLanguageSystemTable }

class function TOpenTypeManinkaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrManinka;
end;

class function TOpenTypeManinkaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MNK ';
end;


{ TOpenTypeManxGaelicLanguageSystemTable }

class function TOpenTypeManxGaelicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrManxGaelic;
end;

class function TOpenTypeManxGaelicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MNX ';
end;


{ TOpenTypeMohawkLanguageSystemTable }

class function TOpenTypeMohawkLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMohawk;
end;

class function TOpenTypeMohawkLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MOH ';
end;


{ TOpenTypeMokshaLanguageSystemTable }

class function TOpenTypeMokshaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMoksha;
end;

class function TOpenTypeMokshaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MOK ';
end;


{ TOpenTypeMoldavianLanguageSystemTable }

class function TOpenTypeMoldavianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMoldavian;
end;

class function TOpenTypeMoldavianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MOL ';
end;


{ TOpenTypeMonLanguageSystemTable }

class function TOpenTypeMonLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMon;
end;

class function TOpenTypeMonLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MON ';
end;


{ TOpenTypeMoroccanLanguageSystemTable }

class function TOpenTypeMoroccanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMoroccan;
end;

class function TOpenTypeMoroccanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MO  ';
end;


{ TOpenTypeMaoriLanguageSystemTable }

class function TOpenTypeMaoriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMaori;
end;

class function TOpenTypeMaoriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MRI ';
end;


{ TOpenTypeMaithiliLanguageSystemTable }

class function TOpenTypeMaithiliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMaithili;
end;

class function TOpenTypeMaithiliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MTH ';
end;


{ TOpenTypeMalteseLanguageSystemTable }

class function TOpenTypeMalteseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMaltese;
end;

class function TOpenTypeMalteseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MTS ';
end;


{ TOpenTypeMundariLanguageSystemTable }

class function TOpenTypeMundariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrMundari;
end;

class function TOpenTypeMundariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'MUN ';
end;


{ TOpenTypeNagaAssameseLanguageSystemTable }

class function TOpenTypeNagaAssameseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNagaAssamese;
end;

class function TOpenTypeNagaAssameseLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'NAG ';
end;


{ TOpenTypeNanaiLanguageSystemTable }

class function TOpenTypeNanaiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNanai;
end;

class function TOpenTypeNanaiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NAN ';
end;


{ TOpenTypeNaskapiLanguageSystemTable }

class function TOpenTypeNaskapiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNaskapi;
end;

class function TOpenTypeNaskapiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NAS ';
end;


{ TOpenTypeNLanguageSystemTable }

class function TOpenTypeNLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNCree;
end;

class function TOpenTypeNLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NCR ';
end;


{ TOpenTypeNdebeleLanguageSystemTable }

class function TOpenTypeNdebeleLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNdebele;
end;

class function TOpenTypeNdebeleLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NDB ';
end;


{ TOpenTypeNdongaLanguageSystemTable }

class function TOpenTypeNdongaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNdonga;
end;

class function TOpenTypeNdongaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NDG ';
end;


{ TOpenTypeNepaliLanguageSystemTable }

class function TOpenTypeNepaliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNepali;
end;

class function TOpenTypeNepaliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NEP ';
end;


{ TOpenTypeNewariLanguageSystemTable }

class function TOpenTypeNewariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNewari;
end;

class function TOpenTypeNewariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NEW ';
end;


{ TOpenTypeNagariLanguageSystemTable }

class function TOpenTypeNagariLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNagari;
end;

class function TOpenTypeNagariLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NG  ';
end;


{ TOpenTypeNorwayHouseCreeLanguageSystemTable }

class function TOpenTypeNorwayHouseCreeLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrNorwayHouseCree;
end;

class function TOpenTypeNorwayHouseCreeLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'NHC ';
end;


{ TOpenTypeNisiLanguageSystemTable }

class function TOpenTypeNisiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNisi;
end;

class function TOpenTypeNisiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NIS ';
end;


{ TOpenTypeNiueanLanguageSystemTable }

class function TOpenTypeNiueanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNiuean;
end;

class function TOpenTypeNiueanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NIU ';
end;


{ TOpenTypeNkoleLanguageSystemTable }

class function TOpenTypeNkoleLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNkole;
end;

class function TOpenTypeNkoleLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NKL ';
end;


{ TOpenTypeNKoLanguageSystemTable }

class function TOpenTypeNKoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNKo;
end;

class function TOpenTypeNKoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NKO ';
end;


{ TOpenTypeDutchLanguageSystemTable }

class function TOpenTypeDutchLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrDutch;
end;

class function TOpenTypeDutchLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NLD ';
end;


{ TOpenTypeNogaiLanguageSystemTable }

class function TOpenTypeNogaiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNogai;
end;

class function TOpenTypeNogaiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NOG ';
end;


{ TOpenTypeNorwegianLanguageSystemTable }

class function TOpenTypeNorwegianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNorwegian;
end;

class function TOpenTypeNorwegianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NOR ';
end;


{ TOpenTypeNorthernSamiLanguageSystemTable }

class function TOpenTypeNorthernSamiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNorthernSami;
end;

class function TOpenTypeNorthernSamiLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'NSM ';
end;


{ TOpenTypeNorthernTaiLanguageSystemTable }

class function TOpenTypeNorthernTaiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNorthernTai;
end;

class function TOpenTypeNorthernTaiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NTA ';
end;


{ TOpenTypeEsperantoLanguageSystemTable }

class function TOpenTypeEsperantoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrEsperanto;
end;

class function TOpenTypeEsperantoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NTO ';
end;


{ TOpenTypeNynorskLanguageSystemTable }

class function TOpenTypeNynorskLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrNynorsk;
end;

class function TOpenTypeNynorskLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'NYN ';
end;


{ TOpenTypeOccitanLanguageSystemTable }

class function TOpenTypeOccitanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrOccitan;
end;

class function TOpenTypeOccitanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'OCI ';
end;


{ TOpenTypeOjiCreeLanguageSystemTable }

class function TOpenTypeOjiCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrOjiCree;
end;

class function TOpenTypeOjiCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'OCR ';
end;


{ TOpenTypeOjibwayLanguageSystemTable }

class function TOpenTypeOjibwayLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrOjibway;
end;

class function TOpenTypeOjibwayLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'OJB ';
end;


{ TOpenTypeOriyaLanguageSystemTable }

class function TOpenTypeOriyaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrOriya;
end;

class function TOpenTypeOriyaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ORI ';
end;


{ TOpenTypeOromoLanguageSystemTable }

class function TOpenTypeOromoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrOromo;
end;

class function TOpenTypeOromoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ORO ';
end;


{ TOpenTypeOssetianLanguageSystemTable }

class function TOpenTypeOssetianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrOssetian;
end;

class function TOpenTypeOssetianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'OSS ';
end;


{ TOpenTypePalestinianAramaicLanguageSystemTable }

class function TOpenTypePalestinianAramaicLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrPalestinianAramaic;
end;

class function TOpenTypePalestinianAramaicLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'PAA ';
end;


{ TOpenTypePaliLanguageSystemTable }

class function TOpenTypePaliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPali;
end;

class function TOpenTypePaliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PAL ';
end;


{ TOpenTypePunjabiLanguageSystemTable }

class function TOpenTypePunjabiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPunjabi;
end;

class function TOpenTypePunjabiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PAN ';
end;


{ TOpenTypePalpaLanguageSystemTable }

class function TOpenTypePalpaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPalpa;
end;

class function TOpenTypePalpaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PAP ';
end;


{ TOpenTypePashtoLanguageSystemTable }

class function TOpenTypePashtoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPashto;
end;

class function TOpenTypePashtoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PAS ';
end;


{ TOpenTypePolytonicGreekLanguageSystemTable }

class function TOpenTypePolytonicGreekLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrPolytonicGreek;
end;

class function TOpenTypePolytonicGreekLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'PGR ';
end;


{ TOpenTypeFilipinoLanguageSystemTable }

class function TOpenTypeFilipinoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrFilipino;
end;

class function TOpenTypeFilipinoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PIL ';
end;


{ TOpenTypePalaungLanguageSystemTable }

class function TOpenTypePalaungLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPalaung;
end;

class function TOpenTypePalaungLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PLG ';
end;


{ TOpenTypePolishLanguageSystemTable }

class function TOpenTypePolishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPolish;
end;

class function TOpenTypePolishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PLK ';
end;


{ TOpenTypeProvencalLanguageSystemTable }

class function TOpenTypeProvencalLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrProvencal;
end;

class function TOpenTypeProvencalLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PRO ';
end;


{ TOpenTypePortugueseLanguageSystemTable }

class function TOpenTypePortugueseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrPortuguese;
end;

class function TOpenTypePortugueseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'PTG ';
end;


{ TOpenTypeChinLanguageSystemTable }

class function TOpenTypeChinLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrChin;
end;

class function TOpenTypeChinLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'QIN ';
end;


{ TOpenTypeRajasthaniLanguageSystemTable }

class function TOpenTypeRajasthaniLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRajasthani;
end;

class function TOpenTypeRajasthaniLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'RAJ ';
end;


{ TOpenTypeRCreeLanguageSystemTable }

class function TOpenTypeRCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRCree;
end;

class function TOpenTypeRCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'RCR ';
end;


{ TOpenTypeRussianBuriatLanguageSystemTable }

class function TOpenTypeRussianBuriatLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRussianBuriat;
end;

class function TOpenTypeRussianBuriatLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'RBU ';
end;


{ TOpenTypeRiangLanguageSystemTable }

class function TOpenTypeRiangLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRiang;
end;

class function TOpenTypeRiangLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'RIA ';
end;


{ TOpenTypeRhaetoRomanicLanguageSystemTable }

class function TOpenTypeRhaetoRomanicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRhaetoRomanic;
end;

class function TOpenTypeRhaetoRomanicLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'RMS ';
end;


{ TOpenTypeRomanianLanguageSystemTable }

class function TOpenTypeRomanianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRomanian;
end;

class function TOpenTypeRomanianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ROM ';
end;


{ TOpenTypeRomanyLanguageSystemTable }

class function TOpenTypeRomanyLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRomany;
end;

class function TOpenTypeRomanyLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ROY ';
end;


{ TOpenTypeRusynLanguageSystemTable }

class function TOpenTypeRusynLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRusyn;
end;

class function TOpenTypeRusynLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'RSY ';
end;


{ TOpenTypeRuandaLanguageSystemTable }

class function TOpenTypeRuandaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRuanda;
end;

class function TOpenTypeRuandaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'RUA ';
end;


{ TOpenTypeRussianLanguageSystemTable }

class function TOpenTypeRussianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrRussian;
end;

class function TOpenTypeRussianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'RUS ';
end;


{ TOpenTypeSadriLanguageSystemTable }

class function TOpenTypeSadriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSadri;
end;

class function TOpenTypeSadriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SAD ';
end;


{ TOpenTypeSanskritLanguageSystemTable }

class function TOpenTypeSanskritLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSanskrit;
end;

class function TOpenTypeSanskritLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SAN ';
end;


{ TOpenTypeSantaliLanguageSystemTable }

class function TOpenTypeSantaliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSantali;
end;

class function TOpenTypeSantaliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SAT ';
end;


{ TOpenTypeSayisiLanguageSystemTable }

class function TOpenTypeSayisiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSayisi;
end;

class function TOpenTypeSayisiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SAY ';
end;


{ TOpenTypeSekotaLanguageSystemTable }

class function TOpenTypeSekotaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSekota;
end;

class function TOpenTypeSekotaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SEK ';
end;


{ TOpenTypeSelkupLanguageSystemTable }

class function TOpenTypeSelkupLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSelkup;
end;

class function TOpenTypeSelkupLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SEL ';
end;


{ TOpenTypeSangoLanguageSystemTable }

class function TOpenTypeSangoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSango;
end;

class function TOpenTypeSangoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SGO ';
end;


{ TOpenTypeShanLanguageSystemTable }

class function TOpenTypeShanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrShan;
end;

class function TOpenTypeShanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SHN ';
end;


{ TOpenTypeSibeLanguageSystemTable }

class function TOpenTypeSibeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSibe;
end;

class function TOpenTypeSibeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SIB ';
end;


{ TOpenTypeSidamoLanguageSystemTable }

class function TOpenTypeSidamoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSidamo;
end;

class function TOpenTypeSidamoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SID ';
end;


{ TOpenTypeSilteGurageLanguageSystemTable }

class function TOpenTypeSilteGurageLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSilteGurage;
end;

class function TOpenTypeSilteGurageLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SIG ';
end;


{ TOpenTypeSkoltSamiLanguageSystemTable }

class function TOpenTypeSkoltSamiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSkoltSami;
end;

class function TOpenTypeSkoltSamiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SKS ';
end;


{ TOpenTypeSlovakLanguageSystemTable }

class function TOpenTypeSlovakLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSlovak;
end;

class function TOpenTypeSlovakLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SKY ';
end;


{ TOpenTypeSlaveyLanguageSystemTable }

class function TOpenTypeSlaveyLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSlavey;
end;

class function TOpenTypeSlaveyLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SLA ';
end;


{ TOpenTypeSlovenianLanguageSystemTable }

class function TOpenTypeSlovenianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSlovenian;
end;

class function TOpenTypeSlovenianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SLV ';
end;


{ TOpenTypeSomaliLanguageSystemTable }

class function TOpenTypeSomaliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSomali;
end;

class function TOpenTypeSomaliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SML ';
end;


{ TOpenTypeSamoanLanguageSystemTable }

class function TOpenTypeSamoanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSamoan;
end;

class function TOpenTypeSamoanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SMO ';
end;


{ TOpenTypeSenaLanguageSystemTable }

class function TOpenTypeSenaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSena;
end;

class function TOpenTypeSenaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SNA ';
end;


{ TOpenTypeSindhiLanguageSystemTable }

class function TOpenTypeSindhiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSindhi;
end;

class function TOpenTypeSindhiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SND ';
end;


{ TOpenTypeSinhaleseLanguageSystemTable }

class function TOpenTypeSinhaleseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSinhalese;
end;

class function TOpenTypeSinhaleseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SNH ';
end;


{ TOpenTypeSoninkeLanguageSystemTable }

class function TOpenTypeSoninkeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSoninke;
end;

class function TOpenTypeSoninkeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SNK ';
end;


{ TOpenTypeSodoGurageLanguageSystemTable }

class function TOpenTypeSodoGurageLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSodoGurage;
end;

class function TOpenTypeSodoGurageLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SOG ';
end;


{ TOpenTypeSothoLanguageSystemTable }

class function TOpenTypeSothoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSotho;
end;

class function TOpenTypeSothoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SOT ';
end;


{ TOpenTypeAlbanianLanguageSystemTable }

class function TOpenTypeAlbanianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrAlbanian;
end;

class function TOpenTypeAlbanianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SQI ';
end;


{ TOpenTypeSerbianLanguageSystemTable }

class function TOpenTypeSerbianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSerbian;
end;

class function TOpenTypeSerbianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SRB ';
end;


{ TOpenTypeSaraikiLanguageSystemTable }

class function TOpenTypeSaraikiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSaraiki;
end;

class function TOpenTypeSaraikiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SRK ';
end;


{ TOpenTypeSererLanguageSystemTable }

class function TOpenTypeSererLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSerer;
end;

class function TOpenTypeSererLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SRR ';
end;


{ TOpenTypeSouthSlaveyLanguageSystemTable }

class function TOpenTypeSouthSlaveyLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSouthSlavey;
end;

class function TOpenTypeSouthSlaveyLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SSL ';
end;


{ TOpenTypeSouthernSamiLanguageSystemTable }

class function TOpenTypeSouthernSamiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSouthernSami;
end;

class function TOpenTypeSouthernSamiLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'SSM ';
end;


{ TOpenTypeSuriLanguageSystemTable }

class function TOpenTypeSuriLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSuri;
end;

class function TOpenTypeSuriLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SUR ';
end;


{ TOpenTypeSvanLanguageSystemTable }

class function TOpenTypeSvanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSvan;
end;

class function TOpenTypeSvanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SVA ';
end;


{ TOpenTypeSwedishLanguageSystemTable }

class function TOpenTypeSwedishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSwedish;
end;

class function TOpenTypeSwedishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SVE ';
end;


{ TOpenTypeSwadayaAramaicLanguageSystemTable }

class function TOpenTypeSwadayaAramaicLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrSwadayaAramaic;
end;

class function TOpenTypeSwadayaAramaicLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'SWA ';
end;


{ TOpenTypeSwahiliLanguageSystemTable }

class function TOpenTypeSwahiliLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSwahili;
end;

class function TOpenTypeSwahiliLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SWK ';
end;


{ TOpenTypeSwaziLanguageSystemTable }

class function TOpenTypeSwaziLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSwazi;
end;

class function TOpenTypeSwaziLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SWZ ';
end;


{ TOpenTypeSutuLanguageSystemTable }

class function TOpenTypeSutuLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSutu;
end;

class function TOpenTypeSutuLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SXT ';
end;


{ TOpenTypeSyriacLanguageSystemTable }

class function TOpenTypeSyriacLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrSyriac;
end;

class function TOpenTypeSyriacLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'SYR ';
end;


{ TOpenTypeTabasaranLanguageSystemTable }

class function TOpenTypeTabasaranLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTabasaran;
end;

class function TOpenTypeTabasaranLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TAB ';
end;


{ TOpenTypeTajikiLanguageSystemTable }

class function TOpenTypeTajikiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTajiki;
end;

class function TOpenTypeTajikiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TAJ ';
end;


{ TOpenTypeTamilLanguageSystemTable }

class function TOpenTypeTamilLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTamil;
end;

class function TOpenTypeTamilLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TAM ';
end;


{ TOpenTypeTatarLanguageSystemTable }

class function TOpenTypeTatarLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTatar;
end;

class function TOpenTypeTatarLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TAT ';
end;


{ TOpenTypeTHCreeLanguageSystemTable }

class function TOpenTypeTHCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTHCree;
end;

class function TOpenTypeTHCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TCR ';
end;


{ TOpenTypeTeluguLanguageSystemTable }

class function TOpenTypeTeluguLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTelugu;
end;

class function TOpenTypeTeluguLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TEL ';
end;


{ TOpenTypeTonganLanguageSystemTable }

class function TOpenTypeTonganLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTongan;
end;

class function TOpenTypeTonganLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TGN ';
end;


{ TOpenTypeTigreLanguageSystemTable }

class function TOpenTypeTigreLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTigre;
end;

class function TOpenTypeTigreLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TGR ';
end;


{ TOpenTypeTigrinyaLanguageSystemTable }

class function TOpenTypeTigrinyaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTigrinya;
end;

class function TOpenTypeTigrinyaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TGY ';
end;


{ TOpenTypeThaiLanguageSystemTable }

class function TOpenTypeThaiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrThai;
end;

class function TOpenTypeThaiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'THA ';
end;


{ TOpenTypeTahitianLanguageSystemTable }

class function TOpenTypeTahitianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTahitian;
end;

class function TOpenTypeTahitianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'THT ';
end;


{ TOpenTypeTibetanLanguageSystemTable }

class function TOpenTypeTibetanLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTibetan;
end;

class function TOpenTypeTibetanLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TIB ';
end;


{ TOpenTypeTurkmenLanguageSystemTable }

class function TOpenTypeTurkmenLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTurkmen;
end;

class function TOpenTypeTurkmenLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TKM ';
end;


{ TOpenTypeTemneLanguageSystemTable }

class function TOpenTypeTemneLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTemne;
end;

class function TOpenTypeTemneLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TMN ';
end;


{ TOpenTypeTswanaLanguageSystemTable }

class function TOpenTypeTswanaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTswana;
end;

class function TOpenTypeTswanaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TNA ';
end;


{ TOpenTypeTundraNenetsLanguageSystemTable }

class function TOpenTypeTundraNenetsLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTundraNenets;
end;

class function TOpenTypeTundraNenetsLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'TNE ';
end;


{ TOpenTypeTongaLanguageSystemTable }

class function TOpenTypeTongaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTonga;
end;

class function TOpenTypeTongaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TNG ';
end;


{ TOpenTypeTodoLanguageSystemTable }

class function TOpenTypeTodoLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTodo;
end;

class function TOpenTypeTodoLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TOD ';
end;


{ TOpenTypeTurkishLanguageSystemTable }

class function TOpenTypeTurkishLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTurkish;
end;

class function TOpenTypeTurkishLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TRK ';
end;


{ TOpenTypeTsongaLanguageSystemTable }

class function TOpenTypeTsongaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTsonga;
end;

class function TOpenTypeTsongaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TSG ';
end;


{ TOpenTypeTuroyoAramaicLanguageSystemTable }

class function TOpenTypeTuroyoAramaicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTuroyoAramaic;
end;

class function TOpenTypeTuroyoAramaicLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'TUA ';
end;


{ TOpenTypeTuluLanguageSystemTable }

class function TOpenTypeTuluLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTulu;
end;

class function TOpenTypeTuluLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TUL ';
end;


{ TOpenTypeTuvinLanguageSystemTable }

class function TOpenTypeTuvinLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTuvin;
end;

class function TOpenTypeTuvinLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TUV ';
end;


{ TOpenTypeTwiLanguageSystemTable }

class function TOpenTypeTwiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTwi;
end;

class function TOpenTypeTwiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'TWI ';
end;


{ TOpenTypeUdmurtLanguageSystemTable }

class function TOpenTypeUdmurtLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrUdmurt;
end;

class function TOpenTypeUdmurtLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'UDM ';
end;


{ TOpenTypeUkrainianLanguageSystemTable }

class function TOpenTypeUkrainianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrUkrainian;
end;

class function TOpenTypeUkrainianLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'UKR ';
end;


{ TOpenTypeUrduLanguageSystemTable }

class function TOpenTypeUrduLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrUrdu;
end;

class function TOpenTypeUrduLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'URD ';
end;


{ TOpenTypeUpperSorbianLanguageSystemTable }

class function TOpenTypeUpperSorbianLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrUpperSorbian;
end;

class function TOpenTypeUpperSorbianLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'USB ';
end;


{ TOpenTypeUyghurLanguageSystemTable }

class function TOpenTypeUyghurLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrUyghur;
end;

class function TOpenTypeUyghurLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'UYG ';
end;


{ TOpenTypeUzbekLanguageSystemTable }

class function TOpenTypeUzbekLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrUzbek;
end;

class function TOpenTypeUzbekLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'UZB ';
end;


{ TOpenTypeVendaLanguageSystemTable }

class function TOpenTypeVendaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrVenda;
end;

class function TOpenTypeVendaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'VEN ';
end;


{ TOpenTypeVietnameseLanguageSystemTable }

class function TOpenTypeVietnameseLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrVietnamese;
end;

class function TOpenTypeVietnameseLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'VIT ';
end;


{ TOpenTypeWaLanguageSystemTable }

class function TOpenTypeWaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrWa;
end;

class function TOpenTypeWaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'WA  ';
end;


{ TOpenTypeWagdiLanguageSystemTable }

class function TOpenTypeWagdiLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrWagdi;
end;

class function TOpenTypeWagdiLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'WAG ';
end;


{ TOpenTypeWestCreeLanguageSystemTable }

class function TOpenTypeWestCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrWestCree;
end;

class function TOpenTypeWestCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'WCR ';
end;


{ TOpenTypeWelshLanguageSystemTable }

class function TOpenTypeWelshLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrWelsh;
end;

class function TOpenTypeWelshLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'WEL ';
end;


{ TOpenTypeWolofLanguageSystemTable }

class function TOpenTypeWolofLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrWolof;
end;

class function TOpenTypeWolofLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'WLF ';
end;


{ TOpenTypeTaiLueLanguageSystemTable }

class function TOpenTypeTaiLueLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrTaiLue;
end;

class function TOpenTypeTaiLueLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'XBD ';
end;


{ TOpenTypeXhosaLanguageSystemTable }

class function TOpenTypeXhosaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrXhosa;
end;

class function TOpenTypeXhosaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'XHS ';
end;


{ TOpenTypeYakutLanguageSystemTable }

class function TOpenTypeYakutLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrYakut;
end;

class function TOpenTypeYakutLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'YAK ';
end;


{ TOpenTypeYorubaLanguageSystemTable }

class function TOpenTypeYorubaLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrYoruba;
end;

class function TOpenTypeYorubaLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'YBA ';
end;


{ TOpenTypeYCreeLanguageSystemTable }

class function TOpenTypeYCreeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrYCree;
end;

class function TOpenTypeYCreeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'YCR ';
end;


{ TOpenTypeYiClassicLanguageSystemTable }

class function TOpenTypeYiClassicLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrYiClassic;
end;

class function TOpenTypeYiClassicLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'YI  ';
end;


{ TOpenTypeYiModernLanguageSystemTable }

class function TOpenTypeYiModernLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrYiModern;
end;

class function TOpenTypeYiModernLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'YIM ';
end;


{ TOpenTypeChineseHongKongLanguageSystemTable }

class function TOpenTypeChineseHongKongLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrChineseHongKong;
end;

class function TOpenTypeChineseHongKongLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'ZHH ';
end;


{ TOpenTypeChinesePhoneticLanguageSystemTable }

class function TOpenTypeChinesePhoneticLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrChinesePhonetic;
end;

class function TOpenTypeChinesePhoneticLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'ZHP ';
end;


{ TOpenTypeChineseSimplifiedLanguageSystemTable }

class function TOpenTypeChineseSimplifiedLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrChineseSimplified;
end;

class function TOpenTypeChineseSimplifiedLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'ZHS ';
end;


{ TOpenTypeChineseTraditionalLanguageSystemTable }

class function TOpenTypeChineseTraditionalLanguageSystemTable.
  GetDisplayName: string;
begin
  Result := RCStrChineseTraditional;
end;

class function TOpenTypeChineseTraditionalLanguageSystemTable.GetTableType
  : TTableType;
begin
  Result := 'ZHT ';
end;


{ TOpenTypeZandeLanguageSystemTable }

class function TOpenTypeZandeLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrZande;
end;

class function TOpenTypeZandeLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ZND ';
end;


{ TOpenTypeZuluLanguageSystemTable }

class function TOpenTypeZuluLanguageSystemTable.GetDisplayName: string;
begin
  Result := RCStrZulu;
end;

class function TOpenTypeZuluLanguageSystemTable.GetTableType: TTableType;
begin
  Result := 'ZUL ';
end;

initialization

RegisterLanguageSystems([TOpenTypeAbazaLanguageSystemTable,
  TOpenTypeAbkhazianLanguageSystemTable, TOpenTypeAdygheLanguageSystemTable,
  TOpenTypeAfrikaansLanguageSystemTable, TOpenTypeAfarLanguageSystemTable,
  TOpenTypeAgawLanguageSystemTable, TOpenTypeAlsatianLanguageSystemTable,
  TOpenTypeAltaiLanguageSystemTable, TOpenTypeAmharicLanguageSystemTable,
  TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable,
  TOpenTypeArabicLanguageSystemTable, TOpenTypeAariLanguageSystemTable,
  TOpenTypeArakaneseLanguageSystemTable, TOpenTypeAssameseLanguageSystemTable,
  TOpenTypeAthapaskanLanguageSystemTable, TOpenTypeAvarLanguageSystemTable,
  TOpenTypeAwadhiLanguageSystemTable, TOpenTypeAymaraLanguageSystemTable,
  TOpenTypeAzeriLanguageSystemTable, TOpenTypeBadagaLanguageSystemTable,
  TOpenTypeBaghelkhandiLanguageSystemTable, TOpenTypeBalkarLanguageSystemTable,
  TOpenTypeBauleLanguageSystemTable, TOpenTypeBerberLanguageSystemTable,
  TOpenTypeBenchLanguageSystemTable, TOpenTypeBibleCreeLanguageSystemTable,
  TOpenTypeBelarussianLanguageSystemTable, TOpenTypeBembaLanguageSystemTable,
  TOpenTypeBengaliLanguageSystemTable, TOpenTypeBulgarianLanguageSystemTable,
  TOpenTypeBhiliLanguageSystemTable, TOpenTypeBhojpuriLanguageSystemTable,
  TOpenTypeBikolLanguageSystemTable, TOpenTypeBilenLanguageSystemTable,
  TOpenTypeBlackfootLanguageSystemTable, TOpenTypeBalochiLanguageSystemTable,
  TOpenTypeBalanteLanguageSystemTable, TOpenTypeBaltiLanguageSystemTable,
  TOpenTypeBambaraLanguageSystemTable, TOpenTypeBamilekeLanguageSystemTable,
  TOpenTypeBosnianLanguageSystemTable, TOpenTypeBretonLanguageSystemTable,
  TOpenTypeBrahuiLanguageSystemTable, TOpenTypeBrajBhashaLanguageSystemTable,
  TOpenTypeBurmeseLanguageSystemTable, TOpenTypeBashkirLanguageSystemTable,
  TOpenTypeBetiLanguageSystemTable, TOpenTypeCatalanLanguageSystemTable,
  TOpenTypeCebuanoLanguageSystemTable, TOpenTypeChechenLanguageSystemTable,
  TOpenTypeChahaGurageLanguageSystemTable,
  TOpenTypeChattisgarhiLanguageSystemTable,
  TOpenTypeChichewaLanguageSystemTable, TOpenTypeChukchiLanguageSystemTable,
  TOpenTypeChipewyanLanguageSystemTable, TOpenTypeCherokeeLanguageSystemTable,
  TOpenTypeChuvashLanguageSystemTable, TOpenTypeComorianLanguageSystemTable,
  TOpenTypeCopticLanguageSystemTable, TOpenTypeCorsicanLanguageSystemTable,
  TOpenTypeCreeLanguageSystemTable, TOpenTypeCarrierLanguageSystemTable,
  TOpenTypeCrimeanTatarLanguageSystemTable,
  TOpenTypeChurchSlavonicLanguageSystemTable, TOpenTypeCzechLanguageSystemTable,
  TOpenTypeDanishLanguageSystemTable, TOpenTypeDargwaLanguageSystemTable,
  TOpenTypeWoodsCreeLanguageSystemTable, TOpenTypeGermanLanguageSystemTable,
  TOpenTypeDogriLanguageSystemTable, TOpenTypeDhivehiLanguageSystemTable,
  TOpenTypeDhivehiDeprecatedLanguageSystemTable,
  TOpenTypeDjermaLanguageSystemTable, TOpenTypeDangmeLanguageSystemTable,
  TOpenTypeDinkaLanguageSystemTable, TOpenTypeDariLanguageSystemTable,
  TOpenTypeDunganLanguageSystemTable, TOpenTypeDzongkhaLanguageSystemTable,
  TOpenTypeEbiraLanguageSystemTable, TOpenTypeEasternCreeLanguageSystemTable,
  TOpenTypeEdoLanguageSystemTable, TOpenTypeEfikLanguageSystemTable,
  TOpenTypeGreekLanguageSystemTable, TOpenTypeEnglishLanguageSystemTable,
  TOpenTypeErzyaLanguageSystemTable, TOpenTypeSpanishLanguageSystemTable,
  TOpenTypeEstonianLanguageSystemTable, TOpenTypeBasqueLanguageSystemTable,
  TOpenTypeEvenkiLanguageSystemTable, TOpenTypeEvenLanguageSystemTable,
  TOpenTypeEweLanguageSystemTable, TOpenTypeFrenchAntilleanLanguageSystemTable,
  TOpenTypeFarsiLanguageSystemTable, TOpenTypeFinnishLanguageSystemTable,
  TOpenTypeFijianLanguageSystemTable, TOpenTypeFlemishLanguageSystemTable,
  TOpenTypeForestNenetsLanguageSystemTable, TOpenTypeFonLanguageSystemTable,
  TOpenTypeFaroeseLanguageSystemTable, TOpenTypeFrenchLanguageSystemTable,
  TOpenTypeFrisianLanguageSystemTable, TOpenTypeFriulianLanguageSystemTable,
  TOpenTypeFutaLanguageSystemTable, TOpenTypeFulaniLanguageSystemTable,
  TOpenTypeGaLanguageSystemTable, TOpenTypeGaelicLanguageSystemTable,
  TOpenTypeGagauzLanguageSystemTable, TOpenTypeGalicianLanguageSystemTable,
  TOpenTypeGarshuniLanguageSystemTable, TOpenTypeGarhwaliLanguageSystemTable,
  TOpenTypeGeEzLanguageSystemTable, TOpenTypeGilyakLanguageSystemTable,
  TOpenTypeGumuzLanguageSystemTable, TOpenTypeGondiLanguageSystemTable,
  TOpenTypeGreenlandicLanguageSystemTable, TOpenTypeGaroLanguageSystemTable,
  TOpenTypeGuaraniLanguageSystemTable, TOpenTypeGujaratiLanguageSystemTable,
  TOpenTypeHaitianLanguageSystemTable, TOpenTypeHalamLanguageSystemTable,
  TOpenTypeHarautiLanguageSystemTable, TOpenTypeHausaLanguageSystemTable,
  TOpenTypeHawaiinLanguageSystemTable, TOpenTypeHammerBannaLanguageSystemTable,
  TOpenTypeHiligaynonLanguageSystemTable, TOpenTypeHindiLanguageSystemTable,
  TOpenTypeHighMariLanguageSystemTable, TOpenTypeHindkoLanguageSystemTable,
  TOpenTypeHoLanguageSystemTable, TOpenTypeHarariLanguageSystemTable,
  TOpenTypeCroatianLanguageSystemTable, TOpenTypeHungarianLanguageSystemTable,
  TOpenTypeArmenianLanguageSystemTable, TOpenTypeIgboLanguageSystemTable,
  TOpenTypeIjoLanguageSystemTable, TOpenTypeIlokanoLanguageSystemTable,
  TOpenTypeIndonesianLanguageSystemTable, TOpenTypeIngushLanguageSystemTable,
  TOpenTypeInuktitutLanguageSystemTable,
  TOpenTypePhoneticTranscriptionLanguageSystemTable,
  TOpenTypeIrishLanguageSystemTable,
  TOpenTypeIrishTraditionalLanguageSystemTable,
  TOpenTypeIcelandicLanguageSystemTable, TOpenTypeInariSamiLanguageSystemTable,
  TOpenTypeItalianLanguageSystemTable, TOpenTypeHebrewLanguageSystemTable,
  TOpenTypeJavaneseLanguageSystemTable, TOpenTypeYiddishLanguageSystemTable,
  TOpenTypeJapaneseLanguageSystemTable, TOpenTypeJudezmoLanguageSystemTable,
  TOpenTypeJulaLanguageSystemTable, TOpenTypeKabardianLanguageSystemTable,
  TOpenTypeKachchiLanguageSystemTable, TOpenTypeKalenjinLanguageSystemTable,
  TOpenTypeKannadaLanguageSystemTable, TOpenTypeKarachayLanguageSystemTable,
  TOpenTypeGeorgianLanguageSystemTable, TOpenTypeKazakhLanguageSystemTable,
  TOpenTypeKebenaLanguageSystemTable,
  TOpenTypeKhutsuriGeorgianLanguageSystemTable,
  TOpenTypeKhakassLanguageSystemTable, TOpenTypeKhantyKazimLanguageSystemTable,
  TOpenTypeKhmerLanguageSystemTable,
  TOpenTypeKhantyShurishkarLanguageSystemTable,
  TOpenTypeKhantyVakhiLanguageSystemTable, TOpenTypeKhowarLanguageSystemTable,
  TOpenTypeKikuyuLanguageSystemTable, TOpenTypeKirghizLanguageSystemTable,
  TOpenTypeKisiiLanguageSystemTable, TOpenTypeKokniLanguageSystemTable,
  TOpenTypeKalmykLanguageSystemTable, TOpenTypeKambaLanguageSystemTable,
  TOpenTypeKumaoniLanguageSystemTable, TOpenTypeKomoLanguageSystemTable,
  TOpenTypeKomsoLanguageSystemTable, TOpenTypeKanuriLanguageSystemTable,
  TOpenTypeKodaguLanguageSystemTable,
  TOpenTypeKoreanOldHangulLanguageSystemTable,
  TOpenTypeKonkaniLanguageSystemTable, TOpenTypeKikongoLanguageSystemTable,
  TOpenTypeKomiPermyakLanguageSystemTable, TOpenTypeKoreanLanguageSystemTable,
  TOpenTypeKomiZyrianLanguageSystemTable, TOpenTypeKpelleLanguageSystemTable,
  TOpenTypeKrioLanguageSystemTable, TOpenTypeKarakalpakLanguageSystemTable,
  TOpenTypeKarelianLanguageSystemTable, TOpenTypeKaraimLanguageSystemTable,
  TOpenTypeKarenLanguageSystemTable, TOpenTypeKooreteLanguageSystemTable,
  TOpenTypeKashmiriLanguageSystemTable, TOpenTypeKhasiLanguageSystemTable,
  TOpenTypeKildinSamiLanguageSystemTable, TOpenTypeKuiLanguageSystemTable,
  TOpenTypeKulviLanguageSystemTable, TOpenTypeKumykLanguageSystemTable,
  TOpenTypeKurdishLanguageSystemTable, TOpenTypeKurukhLanguageSystemTable,
  TOpenTypeKuyLanguageSystemTable, TOpenTypeKoryakLanguageSystemTable,
  TOpenTypeLadinLanguageSystemTable, TOpenTypeLahuliLanguageSystemTable,
  TOpenTypeLakLanguageSystemTable, TOpenTypeLambaniLanguageSystemTable,
  TOpenTypeLaoLanguageSystemTable, TOpenTypeLatinLanguageSystemTable,
  TOpenTypeLazLanguageSystemTable, TOpenTypeLCreeLanguageSystemTable,
  TOpenTypeLadakhiLanguageSystemTable, TOpenTypeLezgiLanguageSystemTable,
  TOpenTypeLingalaLanguageSystemTable, TOpenTypeLowMariLanguageSystemTable,
  TOpenTypeLimbuLanguageSystemTable, TOpenTypeLomweLanguageSystemTable,
  TOpenTypeLowerSorbianLanguageSystemTable,
  TOpenTypeLuleSamiLanguageSystemTable, TOpenTypeLithuanianLanguageSystemTable,
  TOpenTypeLuxembourgishLanguageSystemTable, TOpenTypeLubaLanguageSystemTable,
  TOpenTypeLugandaLanguageSystemTable, TOpenTypeLuhyaLanguageSystemTable,
  TOpenTypeLuoLanguageSystemTable, TOpenTypeLatvianLanguageSystemTable,
  TOpenTypeMajangLanguageSystemTable, TOpenTypeMakuaLanguageSystemTable,
  TOpenTypeMalayalamTraditionalLanguageSystemTable,
  TOpenTypeMansiLanguageSystemTable, TOpenTypeMapudungunLanguageSystemTable,
  TOpenTypeMarathiLanguageSystemTable, TOpenTypeMarwariLanguageSystemTable,
  TOpenTypeMbunduLanguageSystemTable, TOpenTypeManchuLanguageSystemTable,
  TOpenTypeMooseCreeLanguageSystemTable, TOpenTypeMendeLanguageSystemTable,
  TOpenTypeMeEnLanguageSystemTable, TOpenTypeMizoLanguageSystemTable,
  TOpenTypeMacedonianLanguageSystemTable, TOpenTypeMaleLanguageSystemTable,
  TOpenTypeMalagasyLanguageSystemTable, TOpenTypeMalinkeLanguageSystemTable,
  TOpenTypeMalayalamReformedLanguageSystemTable,
  TOpenTypeMalayLanguageSystemTable, TOpenTypeMandinkaLanguageSystemTable,
  TOpenTypeMongolianLanguageSystemTable, TOpenTypeManipuriLanguageSystemTable,
  TOpenTypeManinkaLanguageSystemTable, TOpenTypeManxGaelicLanguageSystemTable,
  TOpenTypeMohawkLanguageSystemTable, TOpenTypeMokshaLanguageSystemTable,
  TOpenTypeMoldavianLanguageSystemTable, TOpenTypeMonLanguageSystemTable,
  TOpenTypeMoroccanLanguageSystemTable, TOpenTypeMaoriLanguageSystemTable,
  TOpenTypeMaithiliLanguageSystemTable, TOpenTypeMalteseLanguageSystemTable,
  TOpenTypeMundariLanguageSystemTable, TOpenTypeNagaAssameseLanguageSystemTable,
  TOpenTypeNanaiLanguageSystemTable, TOpenTypeNaskapiLanguageSystemTable,
  TOpenTypeNLanguageSystemTable, TOpenTypeNdebeleLanguageSystemTable,
  TOpenTypeNdongaLanguageSystemTable, TOpenTypeNepaliLanguageSystemTable,
  TOpenTypeNewariLanguageSystemTable, TOpenTypeNagariLanguageSystemTable,
  TOpenTypeNorwayHouseCreeLanguageSystemTable, TOpenTypeNisiLanguageSystemTable,
  TOpenTypeNiueanLanguageSystemTable, TOpenTypeNkoleLanguageSystemTable,
  TOpenTypeNKoLanguageSystemTable, TOpenTypeDutchLanguageSystemTable,
  TOpenTypeNogaiLanguageSystemTable, TOpenTypeNorwegianLanguageSystemTable,
  TOpenTypeNorthernSamiLanguageSystemTable,
  TOpenTypeNorthernTaiLanguageSystemTable,
  TOpenTypeEsperantoLanguageSystemTable, TOpenTypeNynorskLanguageSystemTable,
  TOpenTypeOccitanLanguageSystemTable, TOpenTypeOjiCreeLanguageSystemTable,
  TOpenTypeOjibwayLanguageSystemTable, TOpenTypeOriyaLanguageSystemTable,
  TOpenTypeOromoLanguageSystemTable, TOpenTypeOssetianLanguageSystemTable,
  TOpenTypePalestinianAramaicLanguageSystemTable,
  TOpenTypePaliLanguageSystemTable, TOpenTypePunjabiLanguageSystemTable,
  TOpenTypePalpaLanguageSystemTable, TOpenTypePashtoLanguageSystemTable,
  TOpenTypePolytonicGreekLanguageSystemTable,
  TOpenTypeFilipinoLanguageSystemTable, TOpenTypePalaungLanguageSystemTable,
  TOpenTypePolishLanguageSystemTable, TOpenTypeProvencalLanguageSystemTable,
  TOpenTypePortugueseLanguageSystemTable, TOpenTypeChinLanguageSystemTable,
  TOpenTypeRajasthaniLanguageSystemTable, TOpenTypeRCreeLanguageSystemTable,
  TOpenTypeRussianBuriatLanguageSystemTable, TOpenTypeRiangLanguageSystemTable,
  TOpenTypeRhaetoRomanicLanguageSystemTable,
  TOpenTypeRomanianLanguageSystemTable, TOpenTypeRomanyLanguageSystemTable,
  TOpenTypeRusynLanguageSystemTable, TOpenTypeRuandaLanguageSystemTable,
  TOpenTypeRussianLanguageSystemTable, TOpenTypeSadriLanguageSystemTable,
  TOpenTypeSanskritLanguageSystemTable, TOpenTypeSantaliLanguageSystemTable,
  TOpenTypeSayisiLanguageSystemTable, TOpenTypeSekotaLanguageSystemTable,
  TOpenTypeSelkupLanguageSystemTable, TOpenTypeSangoLanguageSystemTable,
  TOpenTypeShanLanguageSystemTable, TOpenTypeSibeLanguageSystemTable,
  TOpenTypeSidamoLanguageSystemTable, TOpenTypeSilteGurageLanguageSystemTable,
  TOpenTypeSkoltSamiLanguageSystemTable, TOpenTypeSlovakLanguageSystemTable,
  TOpenTypeSlaveyLanguageSystemTable, TOpenTypeSlovenianLanguageSystemTable,
  TOpenTypeSomaliLanguageSystemTable, TOpenTypeSamoanLanguageSystemTable,
  TOpenTypeSenaLanguageSystemTable, TOpenTypeSindhiLanguageSystemTable,
  TOpenTypeSinhaleseLanguageSystemTable, TOpenTypeSoninkeLanguageSystemTable,
  TOpenTypeSodoGurageLanguageSystemTable, TOpenTypeSothoLanguageSystemTable,
  TOpenTypeAlbanianLanguageSystemTable, TOpenTypeSerbianLanguageSystemTable,
  TOpenTypeSaraikiLanguageSystemTable, TOpenTypeSererLanguageSystemTable,
  TOpenTypeSouthSlaveyLanguageSystemTable,
  TOpenTypeSouthernSamiLanguageSystemTable, TOpenTypeSuriLanguageSystemTable,
  TOpenTypeSvanLanguageSystemTable, TOpenTypeSwedishLanguageSystemTable,
  TOpenTypeSwadayaAramaicLanguageSystemTable,
  TOpenTypeSwahiliLanguageSystemTable, TOpenTypeSwaziLanguageSystemTable,
  TOpenTypeSutuLanguageSystemTable, TOpenTypeSyriacLanguageSystemTable,
  TOpenTypeTabasaranLanguageSystemTable, TOpenTypeTajikiLanguageSystemTable,
  TOpenTypeTamilLanguageSystemTable, TOpenTypeTatarLanguageSystemTable,
  TOpenTypeTHCreeLanguageSystemTable, TOpenTypeTeluguLanguageSystemTable,
  TOpenTypeTonganLanguageSystemTable, TOpenTypeTigreLanguageSystemTable,
  TOpenTypeTigrinyaLanguageSystemTable, TOpenTypeThaiLanguageSystemTable,
  TOpenTypeTahitianLanguageSystemTable, TOpenTypeTibetanLanguageSystemTable,
  TOpenTypeTurkmenLanguageSystemTable, TOpenTypeTemneLanguageSystemTable,
  TOpenTypeTswanaLanguageSystemTable, TOpenTypeTundraNenetsLanguageSystemTable,
  TOpenTypeTongaLanguageSystemTable, TOpenTypeTodoLanguageSystemTable,
  TOpenTypeTurkishLanguageSystemTable, TOpenTypeTsongaLanguageSystemTable,
  TOpenTypeTuroyoAramaicLanguageSystemTable, TOpenTypeTuluLanguageSystemTable,
  TOpenTypeTuvinLanguageSystemTable, TOpenTypeTwiLanguageSystemTable,
  TOpenTypeUdmurtLanguageSystemTable, TOpenTypeUkrainianLanguageSystemTable,
  TOpenTypeUrduLanguageSystemTable, TOpenTypeUpperSorbianLanguageSystemTable,
  TOpenTypeUyghurLanguageSystemTable, TOpenTypeUzbekLanguageSystemTable,
  TOpenTypeVendaLanguageSystemTable, TOpenTypeVietnameseLanguageSystemTable,
  TOpenTypeWaLanguageSystemTable, TOpenTypeWagdiLanguageSystemTable,
  TOpenTypeWestCreeLanguageSystemTable, TOpenTypeWelshLanguageSystemTable,
  TOpenTypeWolofLanguageSystemTable, TOpenTypeTaiLueLanguageSystemTable,
  TOpenTypeXhosaLanguageSystemTable, TOpenTypeYakutLanguageSystemTable,
  TOpenTypeYorubaLanguageSystemTable, TOpenTypeYCreeLanguageSystemTable,
  TOpenTypeYiClassicLanguageSystemTable, TOpenTypeYiModernLanguageSystemTable,
  TOpenTypeChineseHongKongLanguageSystemTable,
  TOpenTypeChinesePhoneticLanguageSystemTable,
  TOpenTypeChineseSimplifiedLanguageSystemTable,
  TOpenTypeChineseTraditionalLanguageSystemTable,
  TOpenTypeZandeLanguageSystemTable, TOpenTypeZuluLanguageSystemTable]);

end.
