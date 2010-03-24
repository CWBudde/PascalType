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
//  Portions created by Christian-W. Budde are Copyright (C) 2010             //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

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

{ TOpenTypeAbazaLanguageSystemTable }

class function TOpenTypeAbazaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Abaza';
end;

class function TOpenTypeAbazaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ABA ';
end;


{ TOpenTypeAbkhazianLanguageSystemTable }

class function TOpenTypeAbkhazianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Abkhazian';
end;

class function TOpenTypeAbkhazianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ABK ';
end;


{ TOpenTypeAdygheLanguageSystemTable }

class function TOpenTypeAdygheLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Adyghe';
end;

class function TOpenTypeAdygheLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ADY ';
end;


{ TOpenTypeAfrikaansLanguageSystemTable }

class function TOpenTypeAfrikaansLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Afrikaans';
end;

class function TOpenTypeAfrikaansLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AFK ';
end;


{ TOpenTypeAfarLanguageSystemTable }

class function TOpenTypeAfarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Afar';
end;

class function TOpenTypeAfarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AFR ';
end;


{ TOpenTypeAgawLanguageSystemTable }

class function TOpenTypeAgawLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Agaw';
end;

class function TOpenTypeAgawLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AGW ';
end;


{ TOpenTypeAlsatianLanguageSystemTable }

class function TOpenTypeAlsatianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Alsatian';
end;

class function TOpenTypeAlsatianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ALS ';
end;


{ TOpenTypeAltaiLanguageSystemTable }

class function TOpenTypeAltaiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Altai';
end;

class function TOpenTypeAltaiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ALT ';
end;


{ TOpenTypeAmharicLanguageSystemTable }

class function TOpenTypeAmharicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Amharic';
end;

class function TOpenTypeAmharicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AMH ';
end;


{ TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable }

class function TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Phonetic transcription—Americanist conventions';
end;

class function TOpenTypePhoneticTranscriptionAmericanistConventionsLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'APPH';
end;


{ TOpenTypeArabicLanguageSystemTable }

class function TOpenTypeArabicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Arabic';
end;

class function TOpenTypeArabicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ARA ';
end;


{ TOpenTypeAariLanguageSystemTable }

class function TOpenTypeAariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Aari';
end;

class function TOpenTypeAariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ARI ';
end;


{ TOpenTypeArakaneseLanguageSystemTable }

class function TOpenTypeArakaneseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Arakanese';
end;

class function TOpenTypeArakaneseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ARK ';
end;


{ TOpenTypeAssameseLanguageSystemTable }

class function TOpenTypeAssameseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Assamese';
end;

class function TOpenTypeAssameseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ASM ';
end;


{ TOpenTypeAthapaskanLanguageSystemTable }

class function TOpenTypeAthapaskanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Athapaskan';
end;

class function TOpenTypeAthapaskanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ATH ';
end;


{ TOpenTypeAvarLanguageSystemTable }

class function TOpenTypeAvarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Avar';
end;

class function TOpenTypeAvarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AVR ';
end;


{ TOpenTypeAwadhiLanguageSystemTable }

class function TOpenTypeAwadhiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Awadhi';
end;

class function TOpenTypeAwadhiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AWA ';
end;


{ TOpenTypeAymaraLanguageSystemTable }

class function TOpenTypeAymaraLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Aymara';
end;

class function TOpenTypeAymaraLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AYM ';
end;


{ TOpenTypeAzeriLanguageSystemTable }

class function TOpenTypeAzeriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Azeri';
end;

class function TOpenTypeAzeriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'AZE ';
end;


{ TOpenTypeBadagaLanguageSystemTable }

class function TOpenTypeBadagaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Badaga';
end;

class function TOpenTypeBadagaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BAD ';
end;


{ TOpenTypeBaghelkhandiLanguageSystemTable }

class function TOpenTypeBaghelkhandiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Baghelkhandi';
end;

class function TOpenTypeBaghelkhandiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BAG ';
end;


{ TOpenTypeBalkarLanguageSystemTable }

class function TOpenTypeBalkarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Balkar';
end;

class function TOpenTypeBalkarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BAL ';
end;


{ TOpenTypeBauleLanguageSystemTable }

class function TOpenTypeBauleLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Baule';
end;

class function TOpenTypeBauleLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BAU ';
end;


{ TOpenTypeBerberLanguageSystemTable }

class function TOpenTypeBerberLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Berber';
end;

class function TOpenTypeBerberLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BBR ';
end;


{ TOpenTypeBenchLanguageSystemTable }

class function TOpenTypeBenchLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bench';
end;

class function TOpenTypeBenchLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BCH ';
end;


{ TOpenTypeBibleCreeLanguageSystemTable }

class function TOpenTypeBibleCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bible Cree';
end;

class function TOpenTypeBibleCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BCR ';
end;


{ TOpenTypeBelarussianLanguageSystemTable }

class function TOpenTypeBelarussianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Belarussian';
end;

class function TOpenTypeBelarussianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BEL ';
end;


{ TOpenTypeBembaLanguageSystemTable }

class function TOpenTypeBembaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bemba';
end;

class function TOpenTypeBembaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BEM ';
end;


{ TOpenTypeBengaliLanguageSystemTable }

class function TOpenTypeBengaliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bengali';
end;

class function TOpenTypeBengaliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BEN ';
end;


{ TOpenTypeBulgarianLanguageSystemTable }

class function TOpenTypeBulgarianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bulgarian';
end;

class function TOpenTypeBulgarianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BGR ';
end;


{ TOpenTypeBhiliLanguageSystemTable }

class function TOpenTypeBhiliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bhili';
end;

class function TOpenTypeBhiliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BHI ';
end;


{ TOpenTypeBhojpuriLanguageSystemTable }

class function TOpenTypeBhojpuriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bhojpuri';
end;

class function TOpenTypeBhojpuriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BHO ';
end;


{ TOpenTypeBikolLanguageSystemTable }

class function TOpenTypeBikolLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bikol';
end;

class function TOpenTypeBikolLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BIK ';
end;


{ TOpenTypeBilenLanguageSystemTable }

class function TOpenTypeBilenLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bilen';
end;

class function TOpenTypeBilenLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BIL ';
end;


{ TOpenTypeBlackfootLanguageSystemTable }

class function TOpenTypeBlackfootLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Blackfoot';
end;

class function TOpenTypeBlackfootLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BKF ';
end;


{ TOpenTypeBalochiLanguageSystemTable }

class function TOpenTypeBalochiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Balochi';
end;

class function TOpenTypeBalochiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BLI ';
end;


{ TOpenTypeBalanteLanguageSystemTable }

class function TOpenTypeBalanteLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Balante';
end;

class function TOpenTypeBalanteLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BLN ';
end;


{ TOpenTypeBaltiLanguageSystemTable }

class function TOpenTypeBaltiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Balti';
end;

class function TOpenTypeBaltiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BLT ';
end;


{ TOpenTypeBambaraLanguageSystemTable }

class function TOpenTypeBambaraLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bambara';
end;

class function TOpenTypeBambaraLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BMB ';
end;


{ TOpenTypeBamilekeLanguageSystemTable }

class function TOpenTypeBamilekeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bamileke';
end;

class function TOpenTypeBamilekeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BML ';
end;


{ TOpenTypeBosnianLanguageSystemTable }

class function TOpenTypeBosnianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bosnian';
end;

class function TOpenTypeBosnianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BOS ';
end;


{ TOpenTypeBretonLanguageSystemTable }

class function TOpenTypeBretonLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Breton';
end;

class function TOpenTypeBretonLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BRE ';
end;


{ TOpenTypeBrahuiLanguageSystemTable }

class function TOpenTypeBrahuiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Brahui';
end;

class function TOpenTypeBrahuiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BRH ';
end;


{ TOpenTypeBrajBhashaLanguageSystemTable }

class function TOpenTypeBrajBhashaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Braj Bhasha';
end;

class function TOpenTypeBrajBhashaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BRI ';
end;


{ TOpenTypeBurmeseLanguageSystemTable }

class function TOpenTypeBurmeseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Burmese';
end;

class function TOpenTypeBurmeseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BRM ';
end;


{ TOpenTypeBashkirLanguageSystemTable }

class function TOpenTypeBashkirLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Bashkir';
end;

class function TOpenTypeBashkirLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BSH ';
end;


{ TOpenTypeBetiLanguageSystemTable }

class function TOpenTypeBetiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Beti';
end;

class function TOpenTypeBetiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'BTI ';
end;


{ TOpenTypeCatalanLanguageSystemTable }

class function TOpenTypeCatalanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Catalan';
end;

class function TOpenTypeCatalanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CAT ';
end;


{ TOpenTypeCebuanoLanguageSystemTable }

class function TOpenTypeCebuanoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Cebuano';
end;

class function TOpenTypeCebuanoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CEB ';
end;


{ TOpenTypeChechenLanguageSystemTable }

class function TOpenTypeChechenLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chechen';
end;

class function TOpenTypeChechenLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHE ';
end;


{ TOpenTypeChahaGurageLanguageSystemTable }

class function TOpenTypeChahaGurageLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chaha Gurage';
end;

class function TOpenTypeChahaGurageLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHG ';
end;


{ TOpenTypeChattisgarhiLanguageSystemTable }

class function TOpenTypeChattisgarhiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chattisgarhi';
end;

class function TOpenTypeChattisgarhiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHH ';
end;


{ TOpenTypeChichewaLanguageSystemTable }

class function TOpenTypeChichewaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chichewa';
end;

class function TOpenTypeChichewaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHI ';
end;


{ TOpenTypeChukchiLanguageSystemTable }

class function TOpenTypeChukchiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chukchi';
end;

class function TOpenTypeChukchiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHK ';
end;


{ TOpenTypeChipewyanLanguageSystemTable }

class function TOpenTypeChipewyanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chipewyan';
end;

class function TOpenTypeChipewyanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHP ';
end;


{ TOpenTypeCherokeeLanguageSystemTable }

class function TOpenTypeCherokeeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Cherokee';
end;

class function TOpenTypeCherokeeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHR ';
end;


{ TOpenTypeChuvashLanguageSystemTable }

class function TOpenTypeChuvashLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chuvash';
end;

class function TOpenTypeChuvashLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CHU ';
end;


{ TOpenTypeComorianLanguageSystemTable }

class function TOpenTypeComorianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Comorian';
end;

class function TOpenTypeComorianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CMR ';
end;


{ TOpenTypeCopticLanguageSystemTable }

class function TOpenTypeCopticLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Coptic';
end;

class function TOpenTypeCopticLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'COP ';
end;


{ TOpenTypeCorsicanLanguageSystemTable }

class function TOpenTypeCorsicanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Corsican';
end;

class function TOpenTypeCorsicanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'COS ';
end;


{ TOpenTypeCreeLanguageSystemTable }

class function TOpenTypeCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Cree';
end;

class function TOpenTypeCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CRE ';
end;


{ TOpenTypeCarrierLanguageSystemTable }

class function TOpenTypeCarrierLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Carrier';
end;

class function TOpenTypeCarrierLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CRR ';
end;


{ TOpenTypeCrimeanTatarLanguageSystemTable }

class function TOpenTypeCrimeanTatarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Crimean Tatar';
end;

class function TOpenTypeCrimeanTatarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CRT ';
end;


{ TOpenTypeChurchSlavonicLanguageSystemTable }

class function TOpenTypeChurchSlavonicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Church Slavonic';
end;

class function TOpenTypeChurchSlavonicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CSL ';
end;


{ TOpenTypeCzechLanguageSystemTable }

class function TOpenTypeCzechLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Czech';
end;

class function TOpenTypeCzechLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'CSY ';
end;


{ TOpenTypeDanishLanguageSystemTable }

class function TOpenTypeDanishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Danish';
end;

class function TOpenTypeDanishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DAN ';
end;


{ TOpenTypeDargwaLanguageSystemTable }

class function TOpenTypeDargwaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dargwa';
end;

class function TOpenTypeDargwaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DAR ';
end;


{ TOpenTypeWoodsCreeLanguageSystemTable }

class function TOpenTypeWoodsCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Woods Cree';
end;

class function TOpenTypeWoodsCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DCR ';
end;


{ TOpenTypeGermanLanguageSystemTable }

class function TOpenTypeGermanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'German';
end;

class function TOpenTypeGermanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DEU ';
end;


{ TOpenTypeDogriLanguageSystemTable }

class function TOpenTypeDogriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dogri';
end;

class function TOpenTypeDogriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DGR ';
end;


{ TOpenTypeDhivehiLanguageSystemTable }

class function TOpenTypeDhivehiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dhivehi';
end;

class function TOpenTypeDhivehiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DHV ';
end;


{ TOpenTypeDhivehiDeprecatedLanguageSystemTable }

class function TOpenTypeDhivehiDeprecatedLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dhivehi';
end;

class function TOpenTypeDhivehiDeprecatedLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DIV ';
end;


{ TOpenTypeDjermaLanguageSystemTable }

class function TOpenTypeDjermaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Djerma';
end;

class function TOpenTypeDjermaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DJR ';
end;


{ TOpenTypeDangmeLanguageSystemTable }

class function TOpenTypeDangmeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dangme';
end;

class function TOpenTypeDangmeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DNG ';
end;


{ TOpenTypeDinkaLanguageSystemTable }

class function TOpenTypeDinkaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dinka';
end;

class function TOpenTypeDinkaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DNK ';
end;


{ TOpenTypeDariLanguageSystemTable }

class function TOpenTypeDariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dari';
end;

class function TOpenTypeDariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DRI ';
end;


{ TOpenTypeDunganLanguageSystemTable }

class function TOpenTypeDunganLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dungan';
end;

class function TOpenTypeDunganLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DUN ';
end;


{ TOpenTypeDzongkhaLanguageSystemTable }

class function TOpenTypeDzongkhaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dzongkha';
end;

class function TOpenTypeDzongkhaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'DZN ';
end;


{ TOpenTypeEbiraLanguageSystemTable }

class function TOpenTypeEbiraLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ebira';
end;

class function TOpenTypeEbiraLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EBI ';
end;


{ TOpenTypeEasternCreeLanguageSystemTable }

class function TOpenTypeEasternCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Eastern Cree';
end;

class function TOpenTypeEasternCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ECR ';
end;


{ TOpenTypeEdoLanguageSystemTable }

class function TOpenTypeEdoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Edo';
end;

class function TOpenTypeEdoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EDO ';
end;


{ TOpenTypeEfikLanguageSystemTable }

class function TOpenTypeEfikLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Efik';
end;

class function TOpenTypeEfikLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EFI ';
end;


{ TOpenTypeGreekLanguageSystemTable }

class function TOpenTypeGreekLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Greek';
end;

class function TOpenTypeGreekLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ELL ';
end;


{ TOpenTypeEnglishLanguageSystemTable }

class function TOpenTypeEnglishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'English';
end;

class function TOpenTypeEnglishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ENG ';
end;


{ TOpenTypeErzyaLanguageSystemTable }

class function TOpenTypeErzyaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Erzya';
end;

class function TOpenTypeErzyaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ERZ ';
end;


{ TOpenTypeSpanishLanguageSystemTable }

class function TOpenTypeSpanishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Spanish';
end;

class function TOpenTypeSpanishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ESP ';
end;


{ TOpenTypeEstonianLanguageSystemTable }

class function TOpenTypeEstonianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Estonian';
end;

class function TOpenTypeEstonianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ETI ';
end;


{ TOpenTypeBasqueLanguageSystemTable }

class function TOpenTypeBasqueLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Basque';
end;

class function TOpenTypeBasqueLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EUQ ';
end;


{ TOpenTypeEvenkiLanguageSystemTable }

class function TOpenTypeEvenkiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Evenki';
end;

class function TOpenTypeEvenkiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EVK ';
end;


{ TOpenTypeEvenLanguageSystemTable }

class function TOpenTypeEvenLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Even';
end;

class function TOpenTypeEvenLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EVN ';
end;


{ TOpenTypeEweLanguageSystemTable }

class function TOpenTypeEweLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ewe';
end;

class function TOpenTypeEweLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'EWE ';
end;


{ TOpenTypeFrenchAntilleanLanguageSystemTable }

class function TOpenTypeFrenchAntilleanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'French Antillean';
end;

class function TOpenTypeFrenchAntilleanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FAN ';
end;


{ TOpenTypeFarsiLanguageSystemTable }

class function TOpenTypeFarsiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Farsi';
end;

class function TOpenTypeFarsiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FAR ';
end;


{ TOpenTypeFinnishLanguageSystemTable }

class function TOpenTypeFinnishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Finnish';
end;

class function TOpenTypeFinnishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FIN ';
end;


{ TOpenTypeFijianLanguageSystemTable }

class function TOpenTypeFijianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Fijian';
end;

class function TOpenTypeFijianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FJI ';
end;


{ TOpenTypeFlemishLanguageSystemTable }

class function TOpenTypeFlemishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Flemish';
end;

class function TOpenTypeFlemishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FLE ';
end;


{ TOpenTypeForestNenetsLanguageSystemTable }

class function TOpenTypeForestNenetsLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Forest Nenets';
end;

class function TOpenTypeForestNenetsLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FNE ';
end;


{ TOpenTypeFonLanguageSystemTable }

class function TOpenTypeFonLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Fon';
end;

class function TOpenTypeFonLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FON ';
end;


{ TOpenTypeFaroeseLanguageSystemTable }

class function TOpenTypeFaroeseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Faroese';
end;

class function TOpenTypeFaroeseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FOS ';
end;


{ TOpenTypeFrenchLanguageSystemTable }

class function TOpenTypeFrenchLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'French';
end;

class function TOpenTypeFrenchLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FRA ';
end;


{ TOpenTypeFrisianLanguageSystemTable }

class function TOpenTypeFrisianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Frisian';
end;

class function TOpenTypeFrisianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FRI ';
end;


{ TOpenTypeFriulianLanguageSystemTable }

class function TOpenTypeFriulianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Friulian';
end;

class function TOpenTypeFriulianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FRL ';
end;


{ TOpenTypeFutaLanguageSystemTable }

class function TOpenTypeFutaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Futa';
end;

class function TOpenTypeFutaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FTA ';
end;


{ TOpenTypeFulaniLanguageSystemTable }

class function TOpenTypeFulaniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Fulani';
end;

class function TOpenTypeFulaniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'FUL ';
end;


{ TOpenTypeGaLanguageSystemTable }

class function TOpenTypeGaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ga';
end;

class function TOpenTypeGaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GAD ';
end;


{ TOpenTypeGaelicLanguageSystemTable }

class function TOpenTypeGaelicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Gaelic';
end;

class function TOpenTypeGaelicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GAE ';
end;


{ TOpenTypeGagauzLanguageSystemTable }

class function TOpenTypeGagauzLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Gagauz';
end;

class function TOpenTypeGagauzLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GAG ';
end;


{ TOpenTypeGalicianLanguageSystemTable }

class function TOpenTypeGalicianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Galician';
end;

class function TOpenTypeGalicianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GAL ';
end;


{ TOpenTypeGarshuniLanguageSystemTable }

class function TOpenTypeGarshuniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Garshuni';
end;

class function TOpenTypeGarshuniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GA  ';
end;


{ TOpenTypeGarhwaliLanguageSystemTable }

class function TOpenTypeGarhwaliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Garhwali';
end;

class function TOpenTypeGarhwaliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GAW ';
end;


{ TOpenTypeGeEzLanguageSystemTable }

class function TOpenTypeGeEzLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ge''ez';
end;

class function TOpenTypeGeEzLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GEZ ';
end;


{ TOpenTypeGilyakLanguageSystemTable }

class function TOpenTypeGilyakLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Gilyak';
end;

class function TOpenTypeGilyakLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GIL ';
end;


{ TOpenTypeGumuzLanguageSystemTable }

class function TOpenTypeGumuzLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Gumuz';
end;

class function TOpenTypeGumuzLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GMZ ';
end;


{ TOpenTypeGondiLanguageSystemTable }

class function TOpenTypeGondiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Gondi';
end;

class function TOpenTypeGondiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GON ';
end;


{ TOpenTypeGreenlandicLanguageSystemTable }

class function TOpenTypeGreenlandicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Greenlandic';
end;

class function TOpenTypeGreenlandicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GRN ';
end;


{ TOpenTypeGaroLanguageSystemTable }

class function TOpenTypeGaroLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Garo';
end;

class function TOpenTypeGaroLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GRO ';
end;


{ TOpenTypeGuaraniLanguageSystemTable }

class function TOpenTypeGuaraniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Guarani';
end;

class function TOpenTypeGuaraniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GUA ';
end;


{ TOpenTypeGujaratiLanguageSystemTable }

class function TOpenTypeGujaratiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Gujarati';
end;

class function TOpenTypeGujaratiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'GUJ ';
end;


{ TOpenTypeHaitianLanguageSystemTable }

class function TOpenTypeHaitianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Haitian';
end;

class function TOpenTypeHaitianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HAI ';
end;


{ TOpenTypeHalamLanguageSystemTable }

class function TOpenTypeHalamLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Halam';
end;

class function TOpenTypeHalamLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HAL ';
end;


{ TOpenTypeHarautiLanguageSystemTable }

class function TOpenTypeHarautiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Harauti';
end;

class function TOpenTypeHarautiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HAR ';
end;


{ TOpenTypeHausaLanguageSystemTable }

class function TOpenTypeHausaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hausa';
end;

class function TOpenTypeHausaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HAU ';
end;


{ TOpenTypeHawaiinLanguageSystemTable }

class function TOpenTypeHawaiinLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hawaiin';
end;

class function TOpenTypeHawaiinLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HAW ';
end;


{ TOpenTypeHammerBannaLanguageSystemTable }

class function TOpenTypeHammerBannaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hammer-Banna';
end;

class function TOpenTypeHammerBannaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HBN ';
end;


{ TOpenTypeHiligaynonLanguageSystemTable }

class function TOpenTypeHiligaynonLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hiligaynon';
end;

class function TOpenTypeHiligaynonLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HIL ';
end;


{ TOpenTypeHindiLanguageSystemTable }

class function TOpenTypeHindiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hindi';
end;

class function TOpenTypeHindiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HIN ';
end;


{ TOpenTypeHighMariLanguageSystemTable }

class function TOpenTypeHighMariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'High Mari';
end;

class function TOpenTypeHighMariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HMA ';
end;


{ TOpenTypeHindkoLanguageSystemTable }

class function TOpenTypeHindkoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hindko';
end;

class function TOpenTypeHindkoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HND ';
end;


{ TOpenTypeHoLanguageSystemTable }

class function TOpenTypeHoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ho';
end;

class function TOpenTypeHoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HO  ';
end;


{ TOpenTypeHarariLanguageSystemTable }

class function TOpenTypeHarariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Harari';
end;

class function TOpenTypeHarariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HRI ';
end;


{ TOpenTypeCroatianLanguageSystemTable }

class function TOpenTypeCroatianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Croatian';
end;

class function TOpenTypeCroatianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HRV ';
end;


{ TOpenTypeHungarianLanguageSystemTable }

class function TOpenTypeHungarianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hungarian';
end;

class function TOpenTypeHungarianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HUN ';
end;


{ TOpenTypeArmenianLanguageSystemTable }

class function TOpenTypeArmenianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Armenian';
end;

class function TOpenTypeArmenianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'HYE ';
end;


{ TOpenTypeIgboLanguageSystemTable }

class function TOpenTypeIgboLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Igbo';
end;

class function TOpenTypeIgboLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IBO ';
end;


{ TOpenTypeIjoLanguageSystemTable }

class function TOpenTypeIjoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ijo';
end;

class function TOpenTypeIjoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IJO ';
end;


{ TOpenTypeIlokanoLanguageSystemTable }

class function TOpenTypeIlokanoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ilokano';
end;

class function TOpenTypeIlokanoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ILO ';
end;


{ TOpenTypeIndonesianLanguageSystemTable }

class function TOpenTypeIndonesianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Indonesian';
end;

class function TOpenTypeIndonesianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IND ';
end;


{ TOpenTypeIngushLanguageSystemTable }

class function TOpenTypeIngushLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ingush';
end;

class function TOpenTypeIngushLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ING ';
end;


{ TOpenTypeInuktitutLanguageSystemTable }

class function TOpenTypeInuktitutLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Inuktitut';
end;

class function TOpenTypeInuktitutLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'INU ';
end;


{ TOpenTypePhoneticTranscriptionLanguageSystemTable }

class function TOpenTypePhoneticTranscriptionLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Phonetic transcription—IPA conventions';
end;

class function TOpenTypePhoneticTranscriptionLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IPP ';
end;


{ TOpenTypeIrishLanguageSystemTable }

class function TOpenTypeIrishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Irish';
end;

class function TOpenTypeIrishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IRI ';
end;


{ TOpenTypeIrishTraditionalLanguageSystemTable }

class function TOpenTypeIrishTraditionalLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Irish Traditional';
end;

class function TOpenTypeIrishTraditionalLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IRT ';
end;


{ TOpenTypeIcelandicLanguageSystemTable }

class function TOpenTypeIcelandicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Icelandic';
end;

class function TOpenTypeIcelandicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ISL ';
end;


{ TOpenTypeInariSamiLanguageSystemTable }

class function TOpenTypeInariSamiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Inari Sami';
end;

class function TOpenTypeInariSamiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ISM ';
end;


{ TOpenTypeItalianLanguageSystemTable }

class function TOpenTypeItalianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Italian';
end;

class function TOpenTypeItalianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ITA ';
end;


{ TOpenTypeHebrewLanguageSystemTable }

class function TOpenTypeHebrewLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Hebrew';
end;

class function TOpenTypeHebrewLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'IWR ';
end;


{ TOpenTypeJavaneseLanguageSystemTable }

class function TOpenTypeJavaneseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Javanese';
end;

class function TOpenTypeJavaneseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'JAV ';
end;


{ TOpenTypeYiddishLanguageSystemTable }

class function TOpenTypeYiddishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Yiddish';
end;

class function TOpenTypeYiddishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'JII ';
end;


{ TOpenTypeJapaneseLanguageSystemTable }

class function TOpenTypeJapaneseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Japanese';
end;

class function TOpenTypeJapaneseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'JAN ';
end;


{ TOpenTypeJudezmoLanguageSystemTable }

class function TOpenTypeJudezmoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Judezmo';
end;

class function TOpenTypeJudezmoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'JUD ';
end;


{ TOpenTypeJulaLanguageSystemTable }

class function TOpenTypeJulaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Jula';
end;

class function TOpenTypeJulaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'JUL ';
end;


{ TOpenTypeKabardianLanguageSystemTable }

class function TOpenTypeKabardianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kabardian';
end;

class function TOpenTypeKabardianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAB ';
end;


{ TOpenTypeKachchiLanguageSystemTable }

class function TOpenTypeKachchiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kachchi';
end;

class function TOpenTypeKachchiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAC ';
end;


{ TOpenTypeKalenjinLanguageSystemTable }

class function TOpenTypeKalenjinLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kalenjin';
end;

class function TOpenTypeKalenjinLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAL ';
end;


{ TOpenTypeKannadaLanguageSystemTable }

class function TOpenTypeKannadaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kannada';
end;

class function TOpenTypeKannadaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAN ';
end;


{ TOpenTypeKarachayLanguageSystemTable }

class function TOpenTypeKarachayLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Karachay';
end;

class function TOpenTypeKarachayLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAR ';
end;


{ TOpenTypeGeorgianLanguageSystemTable }

class function TOpenTypeGeorgianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Georgian';
end;

class function TOpenTypeGeorgianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAT ';
end;


{ TOpenTypeKazakhLanguageSystemTable }

class function TOpenTypeKazakhLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kazakh';
end;

class function TOpenTypeKazakhLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KAZ ';
end;


{ TOpenTypeKebenaLanguageSystemTable }

class function TOpenTypeKebenaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kebena';
end;

class function TOpenTypeKebenaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KEB ';
end;


{ TOpenTypeKhutsuriGeorgianLanguageSystemTable }

class function TOpenTypeKhutsuriGeorgianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khutsuri Georgian';
end;

class function TOpenTypeKhutsuriGeorgianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KGE ';
end;


{ TOpenTypeKhakassLanguageSystemTable }

class function TOpenTypeKhakassLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khakass';
end;

class function TOpenTypeKhakassLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KHA ';
end;


{ TOpenTypeKhantyKazimLanguageSystemTable }

class function TOpenTypeKhantyKazimLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khanty-Kazim';
end;

class function TOpenTypeKhantyKazimLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KHK ';
end;


{ TOpenTypeKhmerLanguageSystemTable }

class function TOpenTypeKhmerLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khmer';
end;

class function TOpenTypeKhmerLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KHM ';
end;


{ TOpenTypeKhantyShurishkarLanguageSystemTable }

class function TOpenTypeKhantyShurishkarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khanty-Shurishkar';
end;

class function TOpenTypeKhantyShurishkarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KHS ';
end;


{ TOpenTypeKhantyVakhiLanguageSystemTable }

class function TOpenTypeKhantyVakhiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khanty-Vakhi';
end;

class function TOpenTypeKhantyVakhiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KHV ';
end;


{ TOpenTypeKhowarLanguageSystemTable }

class function TOpenTypeKhowarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khowar';
end;

class function TOpenTypeKhowarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KHW ';
end;


{ TOpenTypeKikuyuLanguageSystemTable }

class function TOpenTypeKikuyuLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kikuyu';
end;

class function TOpenTypeKikuyuLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KIK ';
end;


{ TOpenTypeKirghizLanguageSystemTable }

class function TOpenTypeKirghizLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kirghiz';
end;

class function TOpenTypeKirghizLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KIR ';
end;


{ TOpenTypeKisiiLanguageSystemTable }

class function TOpenTypeKisiiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kisii';
end;

class function TOpenTypeKisiiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KIS ';
end;


{ TOpenTypeKokniLanguageSystemTable }

class function TOpenTypeKokniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kokni';
end;

class function TOpenTypeKokniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KKN ';
end;


{ TOpenTypeKalmykLanguageSystemTable }

class function TOpenTypeKalmykLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kalmyk';
end;

class function TOpenTypeKalmykLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KLM ';
end;


{ TOpenTypeKambaLanguageSystemTable }

class function TOpenTypeKambaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kamba';
end;

class function TOpenTypeKambaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KMB ';
end;


{ TOpenTypeKumaoniLanguageSystemTable }

class function TOpenTypeKumaoniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kumaoni';
end;

class function TOpenTypeKumaoniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KMN ';
end;


{ TOpenTypeKomoLanguageSystemTable }

class function TOpenTypeKomoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Komo';
end;

class function TOpenTypeKomoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KMO ';
end;


{ TOpenTypeKomsoLanguageSystemTable }

class function TOpenTypeKomsoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Komso';
end;

class function TOpenTypeKomsoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KMS ';
end;


{ TOpenTypeKanuriLanguageSystemTable }

class function TOpenTypeKanuriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kanuri';
end;

class function TOpenTypeKanuriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KNR ';
end;


{ TOpenTypeKodaguLanguageSystemTable }

class function TOpenTypeKodaguLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kodagu';
end;

class function TOpenTypeKodaguLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KOD ';
end;


{ TOpenTypeKoreanOldHangulLanguageSystemTable }

class function TOpenTypeKoreanOldHangulLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Korean Old Hangul';
end;

class function TOpenTypeKoreanOldHangulLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KOH ';
end;


{ TOpenTypeKonkaniLanguageSystemTable }

class function TOpenTypeKonkaniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Konkani';
end;

class function TOpenTypeKonkaniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KOK ';
end;


{ TOpenTypeKikongoLanguageSystemTable }

class function TOpenTypeKikongoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kikongo';
end;

class function TOpenTypeKikongoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KON ';
end;


{ TOpenTypeKomiPermyakLanguageSystemTable }

class function TOpenTypeKomiPermyakLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Komi-Permyak';
end;

class function TOpenTypeKomiPermyakLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KOP ';
end;


{ TOpenTypeKoreanLanguageSystemTable }

class function TOpenTypeKoreanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Korean';
end;

class function TOpenTypeKoreanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KOR ';
end;


{ TOpenTypeKomiZyrianLanguageSystemTable }

class function TOpenTypeKomiZyrianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Komi-Zyrian';
end;

class function TOpenTypeKomiZyrianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KOZ ';
end;


{ TOpenTypeKpelleLanguageSystemTable }

class function TOpenTypeKpelleLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kpelle';
end;

class function TOpenTypeKpelleLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KPL ';
end;


{ TOpenTypeKrioLanguageSystemTable }

class function TOpenTypeKrioLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Krio';
end;

class function TOpenTypeKrioLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KRI ';
end;


{ TOpenTypeKarakalpakLanguageSystemTable }

class function TOpenTypeKarakalpakLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Karakalpak';
end;

class function TOpenTypeKarakalpakLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KRK ';
end;


{ TOpenTypeKarelianLanguageSystemTable }

class function TOpenTypeKarelianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Karelian';
end;

class function TOpenTypeKarelianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KRL ';
end;


{ TOpenTypeKaraimLanguageSystemTable }

class function TOpenTypeKaraimLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Karaim';
end;

class function TOpenTypeKaraimLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KRM ';
end;


{ TOpenTypeKarenLanguageSystemTable }

class function TOpenTypeKarenLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Karen';
end;

class function TOpenTypeKarenLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KRN ';
end;


{ TOpenTypeKooreteLanguageSystemTable }

class function TOpenTypeKooreteLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Koorete';
end;

class function TOpenTypeKooreteLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KRT ';
end;


{ TOpenTypeKashmiriLanguageSystemTable }

class function TOpenTypeKashmiriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kashmiri';
end;

class function TOpenTypeKashmiriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KSH ';
end;


{ TOpenTypeKhasiLanguageSystemTable }

class function TOpenTypeKhasiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Khasi';
end;

class function TOpenTypeKhasiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KSI ';
end;


{ TOpenTypeKildinSamiLanguageSystemTable }

class function TOpenTypeKildinSamiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kildin Sami';
end;

class function TOpenTypeKildinSamiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KSM ';
end;


{ TOpenTypeKuiLanguageSystemTable }

class function TOpenTypeKuiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kui';
end;

class function TOpenTypeKuiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KUI ';
end;


{ TOpenTypeKulviLanguageSystemTable }

class function TOpenTypeKulviLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kulvi';
end;

class function TOpenTypeKulviLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KUL ';
end;


{ TOpenTypeKumykLanguageSystemTable }

class function TOpenTypeKumykLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kumyk';
end;

class function TOpenTypeKumykLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KUM ';
end;


{ TOpenTypeKurdishLanguageSystemTable }

class function TOpenTypeKurdishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kurdish';
end;

class function TOpenTypeKurdishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KUR ';
end;


{ TOpenTypeKurukhLanguageSystemTable }

class function TOpenTypeKurukhLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kurukh';
end;

class function TOpenTypeKurukhLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KUU ';
end;


{ TOpenTypeKuyLanguageSystemTable }

class function TOpenTypeKuyLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Kuy';
end;

class function TOpenTypeKuyLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KUY ';
end;


{ TOpenTypeKoryakLanguageSystemTable }

class function TOpenTypeKoryakLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Koryak';
end;

class function TOpenTypeKoryakLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'KYK ';
end;


{ TOpenTypeLadinLanguageSystemTable }

class function TOpenTypeLadinLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ladin';
end;

class function TOpenTypeLadinLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAD ';
end;


{ TOpenTypeLahuliLanguageSystemTable }

class function TOpenTypeLahuliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lahuli';
end;

class function TOpenTypeLahuliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAH ';
end;


{ TOpenTypeLakLanguageSystemTable }

class function TOpenTypeLakLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lak';
end;

class function TOpenTypeLakLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAK ';
end;


{ TOpenTypeLambaniLanguageSystemTable }

class function TOpenTypeLambaniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lambani';
end;

class function TOpenTypeLambaniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAM ';
end;


{ TOpenTypeLaoLanguageSystemTable }

class function TOpenTypeLaoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lao';
end;

class function TOpenTypeLaoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAO ';
end;


{ TOpenTypeLatinLanguageSystemTable }

class function TOpenTypeLatinLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Latin';
end;

class function TOpenTypeLatinLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAT ';
end;


{ TOpenTypeLazLanguageSystemTable }

class function TOpenTypeLazLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Laz';
end;

class function TOpenTypeLazLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LAZ ';
end;


{ TOpenTypeLCreeLanguageSystemTable }

class function TOpenTypeLCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'L-Cree';
end;

class function TOpenTypeLCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LCR ';
end;


{ TOpenTypeLadakhiLanguageSystemTable }

class function TOpenTypeLadakhiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ladakhi';
end;

class function TOpenTypeLadakhiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LDK ';
end;


{ TOpenTypeLezgiLanguageSystemTable }

class function TOpenTypeLezgiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lezgi';
end;

class function TOpenTypeLezgiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LEZ ';
end;


{ TOpenTypeLingalaLanguageSystemTable }

class function TOpenTypeLingalaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lingala';
end;

class function TOpenTypeLingalaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LIN ';
end;


{ TOpenTypeLowMariLanguageSystemTable }

class function TOpenTypeLowMariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Low Mari';
end;

class function TOpenTypeLowMariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LMA ';
end;


{ TOpenTypeLimbuLanguageSystemTable }

class function TOpenTypeLimbuLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Limbu';
end;

class function TOpenTypeLimbuLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LMB ';
end;


{ TOpenTypeLomweLanguageSystemTable }

class function TOpenTypeLomweLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lomwe';
end;

class function TOpenTypeLomweLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LMW ';
end;


{ TOpenTypeLowerSorbianLanguageSystemTable }

class function TOpenTypeLowerSorbianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lower Sorbian';
end;

class function TOpenTypeLowerSorbianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LSB ';
end;


{ TOpenTypeLuleSamiLanguageSystemTable }

class function TOpenTypeLuleSamiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lule Sami';
end;

class function TOpenTypeLuleSamiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LSM ';
end;


{ TOpenTypeLithuanianLanguageSystemTable }

class function TOpenTypeLithuanianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Lithuanian';
end;

class function TOpenTypeLithuanianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LTH ';
end;


{ TOpenTypeLuxembourgishLanguageSystemTable }

class function TOpenTypeLuxembourgishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Luxembourgish';
end;

class function TOpenTypeLuxembourgishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LTZ ';
end;


{ TOpenTypeLubaLanguageSystemTable }

class function TOpenTypeLubaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Luba';
end;

class function TOpenTypeLubaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LUB ';
end;


{ TOpenTypeLugandaLanguageSystemTable }

class function TOpenTypeLugandaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Luganda';
end;

class function TOpenTypeLugandaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LUG ';
end;


{ TOpenTypeLuhyaLanguageSystemTable }

class function TOpenTypeLuhyaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Luhya';
end;

class function TOpenTypeLuhyaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LUH ';
end;


{ TOpenTypeLuoLanguageSystemTable }

class function TOpenTypeLuoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Luo';
end;

class function TOpenTypeLuoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LUO ';
end;


{ TOpenTypeLatvianLanguageSystemTable }

class function TOpenTypeLatvianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Latvian';
end;

class function TOpenTypeLatvianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'LVI ';
end;


{ TOpenTypeMajangLanguageSystemTable }

class function TOpenTypeMajangLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Majang';
end;

class function TOpenTypeMajangLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAJ ';
end;


{ TOpenTypeMakuaLanguageSystemTable }

class function TOpenTypeMakuaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Makua';
end;

class function TOpenTypeMakuaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAK ';
end;


{ TOpenTypeMalayalamTraditionalLanguageSystemTable }

class function TOpenTypeMalayalamTraditionalLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Malayalam Traditional';
end;

class function TOpenTypeMalayalamTraditionalLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAL ';
end;


{ TOpenTypeMansiLanguageSystemTable }

class function TOpenTypeMansiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mansi';
end;

class function TOpenTypeMansiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAN ';
end;


{ TOpenTypeMapudungunLanguageSystemTable }

class function TOpenTypeMapudungunLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mapudungun';
end;

class function TOpenTypeMapudungunLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAP ';
end;


{ TOpenTypeMarathiLanguageSystemTable }

class function TOpenTypeMarathiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Marathi';
end;

class function TOpenTypeMarathiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAR ';
end;


{ TOpenTypeMarwariLanguageSystemTable }

class function TOpenTypeMarwariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Marwari';
end;

class function TOpenTypeMarwariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MAW ';
end;


{ TOpenTypeMbunduLanguageSystemTable }

class function TOpenTypeMbunduLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mbundu';
end;

class function TOpenTypeMbunduLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MBN ';
end;


{ TOpenTypeManchuLanguageSystemTable }

class function TOpenTypeManchuLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Manchu';
end;

class function TOpenTypeManchuLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MCH ';
end;


{ TOpenTypeMooseCreeLanguageSystemTable }

class function TOpenTypeMooseCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Moose Cree';
end;

class function TOpenTypeMooseCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MCR ';
end;


{ TOpenTypeMendeLanguageSystemTable }

class function TOpenTypeMendeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mende';
end;

class function TOpenTypeMendeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MDE ';
end;


{ TOpenTypeMeEnLanguageSystemTable }

class function TOpenTypeMeEnLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Me''en';
end;

class function TOpenTypeMeEnLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MEN ';
end;


{ TOpenTypeMizoLanguageSystemTable }

class function TOpenTypeMizoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mizo';
end;

class function TOpenTypeMizoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MIZ ';
end;


{ TOpenTypeMacedonianLanguageSystemTable }

class function TOpenTypeMacedonianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Macedonian';
end;

class function TOpenTypeMacedonianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MKD ';
end;


{ TOpenTypeMaleLanguageSystemTable }

class function TOpenTypeMaleLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Male';
end;

class function TOpenTypeMaleLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MLE ';
end;


{ TOpenTypeMalagasyLanguageSystemTable }

class function TOpenTypeMalagasyLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Malagasy';
end;

class function TOpenTypeMalagasyLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MLG ';
end;


{ TOpenTypeMalinkeLanguageSystemTable }

class function TOpenTypeMalinkeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Malinke';
end;

class function TOpenTypeMalinkeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MLN ';
end;


{ TOpenTypeMalayalamReformedLanguageSystemTable }

class function TOpenTypeMalayalamReformedLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Malayalam Reformed';
end;

class function TOpenTypeMalayalamReformedLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MLR ';
end;


{ TOpenTypeMalayLanguageSystemTable }

class function TOpenTypeMalayLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Malay';
end;

class function TOpenTypeMalayLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MLY ';
end;


{ TOpenTypeMandinkaLanguageSystemTable }

class function TOpenTypeMandinkaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mandinka';
end;

class function TOpenTypeMandinkaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MND ';
end;


{ TOpenTypeMongolianLanguageSystemTable }

class function TOpenTypeMongolianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mongolian';
end;

class function TOpenTypeMongolianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MNG ';
end;


{ TOpenTypeManipuriLanguageSystemTable }

class function TOpenTypeManipuriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Manipuri';
end;

class function TOpenTypeManipuriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MNI ';
end;


{ TOpenTypeManinkaLanguageSystemTable }

class function TOpenTypeManinkaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Maninka';
end;

class function TOpenTypeManinkaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MNK ';
end;


{ TOpenTypeManxGaelicLanguageSystemTable }

class function TOpenTypeManxGaelicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Manx Gaelic';
end;

class function TOpenTypeManxGaelicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MNX ';
end;


{ TOpenTypeMohawkLanguageSystemTable }

class function TOpenTypeMohawkLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mohawk';
end;

class function TOpenTypeMohawkLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MOH ';
end;


{ TOpenTypeMokshaLanguageSystemTable }

class function TOpenTypeMokshaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Moksha';
end;

class function TOpenTypeMokshaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MOK ';
end;


{ TOpenTypeMoldavianLanguageSystemTable }

class function TOpenTypeMoldavianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Moldavian';
end;

class function TOpenTypeMoldavianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MOL ';
end;


{ TOpenTypeMonLanguageSystemTable }

class function TOpenTypeMonLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mon';
end;

class function TOpenTypeMonLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MON ';
end;


{ TOpenTypeMoroccanLanguageSystemTable }

class function TOpenTypeMoroccanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Moroccan';
end;

class function TOpenTypeMoroccanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MO  ';
end;


{ TOpenTypeMaoriLanguageSystemTable }

class function TOpenTypeMaoriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Maori';
end;

class function TOpenTypeMaoriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MRI ';
end;


{ TOpenTypeMaithiliLanguageSystemTable }

class function TOpenTypeMaithiliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Maithili';
end;

class function TOpenTypeMaithiliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MTH ';
end;


{ TOpenTypeMalteseLanguageSystemTable }

class function TOpenTypeMalteseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Maltese';
end;

class function TOpenTypeMalteseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MTS ';
end;


{ TOpenTypeMundariLanguageSystemTable }

class function TOpenTypeMundariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Mundari';
end;

class function TOpenTypeMundariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'MUN ';
end;


{ TOpenTypeNagaAssameseLanguageSystemTable }

class function TOpenTypeNagaAssameseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Naga-Assamese';
end;

class function TOpenTypeNagaAssameseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NAG ';
end;


{ TOpenTypeNanaiLanguageSystemTable }

class function TOpenTypeNanaiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nanai';
end;

class function TOpenTypeNanaiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NAN ';
end;


{ TOpenTypeNaskapiLanguageSystemTable }

class function TOpenTypeNaskapiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Naskapi';
end;

class function TOpenTypeNaskapiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NAS ';
end;


{ TOpenTypeNLanguageSystemTable }

class function TOpenTypeNLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'N-Cree';
end;

class function TOpenTypeNLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NCR ';
end;


{ TOpenTypeNdebeleLanguageSystemTable }

class function TOpenTypeNdebeleLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ndebele';
end;

class function TOpenTypeNdebeleLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NDB ';
end;


{ TOpenTypeNdongaLanguageSystemTable }

class function TOpenTypeNdongaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ndonga';
end;

class function TOpenTypeNdongaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NDG ';
end;


{ TOpenTypeNepaliLanguageSystemTable }

class function TOpenTypeNepaliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nepali';
end;

class function TOpenTypeNepaliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NEP ';
end;


{ TOpenTypeNewariLanguageSystemTable }

class function TOpenTypeNewariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Newari';
end;

class function TOpenTypeNewariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NEW ';
end;


{ TOpenTypeNagariLanguageSystemTable }

class function TOpenTypeNagariLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nagari';
end;

class function TOpenTypeNagariLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NG  ';
end;


{ TOpenTypeNorwayHouseCreeLanguageSystemTable }

class function TOpenTypeNorwayHouseCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Norway House Cree';
end;

class function TOpenTypeNorwayHouseCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NHC ';
end;


{ TOpenTypeNisiLanguageSystemTable }

class function TOpenTypeNisiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nisi';
end;

class function TOpenTypeNisiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NIS ';
end;


{ TOpenTypeNiueanLanguageSystemTable }

class function TOpenTypeNiueanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Niuean';
end;

class function TOpenTypeNiueanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NIU ';
end;


{ TOpenTypeNkoleLanguageSystemTable }

class function TOpenTypeNkoleLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nkole';
end;

class function TOpenTypeNkoleLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NKL ';
end;


{ TOpenTypeNKoLanguageSystemTable }

class function TOpenTypeNKoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'N''Ko';
end;

class function TOpenTypeNKoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NKO ';
end;


{ TOpenTypeDutchLanguageSystemTable }

class function TOpenTypeDutchLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Dutch';
end;

class function TOpenTypeDutchLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NLD ';
end;


{ TOpenTypeNogaiLanguageSystemTable }

class function TOpenTypeNogaiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nogai';
end;

class function TOpenTypeNogaiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NOG ';
end;


{ TOpenTypeNorwegianLanguageSystemTable }

class function TOpenTypeNorwegianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Norwegian';
end;

class function TOpenTypeNorwegianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NOR ';
end;


{ TOpenTypeNorthernSamiLanguageSystemTable }

class function TOpenTypeNorthernSamiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Northern Sami';
end;

class function TOpenTypeNorthernSamiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NSM ';
end;


{ TOpenTypeNorthernTaiLanguageSystemTable }

class function TOpenTypeNorthernTaiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Northern Tai';
end;

class function TOpenTypeNorthernTaiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NTA ';
end;


{ TOpenTypeEsperantoLanguageSystemTable }

class function TOpenTypeEsperantoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Esperanto';
end;

class function TOpenTypeEsperantoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NTO ';
end;


{ TOpenTypeNynorskLanguageSystemTable }

class function TOpenTypeNynorskLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Nynorsk';
end;

class function TOpenTypeNynorskLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'NYN ';
end;


{ TOpenTypeOccitanLanguageSystemTable }

class function TOpenTypeOccitanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Occitan';
end;

class function TOpenTypeOccitanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'OCI ';
end;


{ TOpenTypeOjiCreeLanguageSystemTable }

class function TOpenTypeOjiCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Oji-Cree';
end;

class function TOpenTypeOjiCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'OCR ';
end;


{ TOpenTypeOjibwayLanguageSystemTable }

class function TOpenTypeOjibwayLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ojibway';
end;

class function TOpenTypeOjibwayLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'OJB ';
end;


{ TOpenTypeOriyaLanguageSystemTable }

class function TOpenTypeOriyaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Oriya';
end;

class function TOpenTypeOriyaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ORI ';
end;


{ TOpenTypeOromoLanguageSystemTable }

class function TOpenTypeOromoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Oromo';
end;

class function TOpenTypeOromoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ORO ';
end;


{ TOpenTypeOssetianLanguageSystemTable }

class function TOpenTypeOssetianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ossetian';
end;

class function TOpenTypeOssetianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'OSS ';
end;


{ TOpenTypePalestinianAramaicLanguageSystemTable }

class function TOpenTypePalestinianAramaicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Palestinian Aramaic';
end;

class function TOpenTypePalestinianAramaicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PAA ';
end;


{ TOpenTypePaliLanguageSystemTable }

class function TOpenTypePaliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Pali';
end;

class function TOpenTypePaliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PAL ';
end;


{ TOpenTypePunjabiLanguageSystemTable }

class function TOpenTypePunjabiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Punjabi';
end;

class function TOpenTypePunjabiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PAN ';
end;


{ TOpenTypePalpaLanguageSystemTable }

class function TOpenTypePalpaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Palpa';
end;

class function TOpenTypePalpaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PAP ';
end;


{ TOpenTypePashtoLanguageSystemTable }

class function TOpenTypePashtoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Pashto';
end;

class function TOpenTypePashtoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PAS ';
end;


{ TOpenTypePolytonicGreekLanguageSystemTable }

class function TOpenTypePolytonicGreekLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Polytonic Greek';
end;

class function TOpenTypePolytonicGreekLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PGR ';
end;


{ TOpenTypeFilipinoLanguageSystemTable }

class function TOpenTypeFilipinoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Filipino';
end;

class function TOpenTypeFilipinoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PIL ';
end;


{ TOpenTypePalaungLanguageSystemTable }

class function TOpenTypePalaungLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Palaung';
end;

class function TOpenTypePalaungLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PLG ';
end;


{ TOpenTypePolishLanguageSystemTable }

class function TOpenTypePolishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Polish';
end;

class function TOpenTypePolishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PLK ';
end;


{ TOpenTypeProvencalLanguageSystemTable }

class function TOpenTypeProvencalLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Provencal';
end;

class function TOpenTypeProvencalLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PRO ';
end;


{ TOpenTypePortugueseLanguageSystemTable }

class function TOpenTypePortugueseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Portuguese';
end;

class function TOpenTypePortugueseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'PTG ';
end;


{ TOpenTypeChinLanguageSystemTable }

class function TOpenTypeChinLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chin';
end;

class function TOpenTypeChinLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'QIN ';
end;


{ TOpenTypeRajasthaniLanguageSystemTable }

class function TOpenTypeRajasthaniLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Rajasthani';
end;

class function TOpenTypeRajasthaniLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RAJ ';
end;


{ TOpenTypeRCreeLanguageSystemTable }

class function TOpenTypeRCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'R-Cree';
end;

class function TOpenTypeRCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RCR ';
end;


{ TOpenTypeRussianBuriatLanguageSystemTable }

class function TOpenTypeRussianBuriatLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Russian Buriat';
end;

class function TOpenTypeRussianBuriatLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RBU ';
end;


{ TOpenTypeRiangLanguageSystemTable }

class function TOpenTypeRiangLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Riang';
end;

class function TOpenTypeRiangLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RIA ';
end;


{ TOpenTypeRhaetoRomanicLanguageSystemTable }

class function TOpenTypeRhaetoRomanicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Rhaeto-Romanic';
end;

class function TOpenTypeRhaetoRomanicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RMS ';
end;


{ TOpenTypeRomanianLanguageSystemTable }

class function TOpenTypeRomanianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Romanian';
end;

class function TOpenTypeRomanianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ROM ';
end;


{ TOpenTypeRomanyLanguageSystemTable }

class function TOpenTypeRomanyLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Romany';
end;

class function TOpenTypeRomanyLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ROY ';
end;


{ TOpenTypeRusynLanguageSystemTable }

class function TOpenTypeRusynLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Rusyn';
end;

class function TOpenTypeRusynLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RSY ';
end;


{ TOpenTypeRuandaLanguageSystemTable }

class function TOpenTypeRuandaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ruanda';
end;

class function TOpenTypeRuandaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RUA ';
end;


{ TOpenTypeRussianLanguageSystemTable }

class function TOpenTypeRussianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Russian';
end;

class function TOpenTypeRussianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'RUS ';
end;


{ TOpenTypeSadriLanguageSystemTable }

class function TOpenTypeSadriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sadri';
end;

class function TOpenTypeSadriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SAD ';
end;


{ TOpenTypeSanskritLanguageSystemTable }

class function TOpenTypeSanskritLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sanskrit';
end;

class function TOpenTypeSanskritLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SAN ';
end;


{ TOpenTypeSantaliLanguageSystemTable }

class function TOpenTypeSantaliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Santali';
end;

class function TOpenTypeSantaliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SAT ';
end;


{ TOpenTypeSayisiLanguageSystemTable }

class function TOpenTypeSayisiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sayisi';
end;

class function TOpenTypeSayisiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SAY ';
end;


{ TOpenTypeSekotaLanguageSystemTable }

class function TOpenTypeSekotaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sekota';
end;

class function TOpenTypeSekotaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SEK ';
end;


{ TOpenTypeSelkupLanguageSystemTable }

class function TOpenTypeSelkupLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Selkup';
end;

class function TOpenTypeSelkupLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SEL ';
end;


{ TOpenTypeSangoLanguageSystemTable }

class function TOpenTypeSangoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sango';
end;

class function TOpenTypeSangoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SGO ';
end;


{ TOpenTypeShanLanguageSystemTable }

class function TOpenTypeShanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Shan';
end;

class function TOpenTypeShanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SHN ';
end;


{ TOpenTypeSibeLanguageSystemTable }

class function TOpenTypeSibeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sibe';
end;

class function TOpenTypeSibeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SIB ';
end;


{ TOpenTypeSidamoLanguageSystemTable }

class function TOpenTypeSidamoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sidamo';
end;

class function TOpenTypeSidamoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SID ';
end;


{ TOpenTypeSilteGurageLanguageSystemTable }

class function TOpenTypeSilteGurageLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Silte Gurage';
end;

class function TOpenTypeSilteGurageLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SIG ';
end;


{ TOpenTypeSkoltSamiLanguageSystemTable }

class function TOpenTypeSkoltSamiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Skolt Sami';
end;

class function TOpenTypeSkoltSamiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SKS ';
end;


{ TOpenTypeSlovakLanguageSystemTable }

class function TOpenTypeSlovakLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Slovak';
end;

class function TOpenTypeSlovakLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SKY ';
end;


{ TOpenTypeSlaveyLanguageSystemTable }

class function TOpenTypeSlaveyLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Slavey';
end;

class function TOpenTypeSlaveyLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SLA ';
end;


{ TOpenTypeSlovenianLanguageSystemTable }

class function TOpenTypeSlovenianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Slovenian';
end;

class function TOpenTypeSlovenianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SLV ';
end;


{ TOpenTypeSomaliLanguageSystemTable }

class function TOpenTypeSomaliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Somali';
end;

class function TOpenTypeSomaliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SML ';
end;


{ TOpenTypeSamoanLanguageSystemTable }

class function TOpenTypeSamoanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Samoan';
end;

class function TOpenTypeSamoanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SMO ';
end;


{ TOpenTypeSenaLanguageSystemTable }

class function TOpenTypeSenaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sena';
end;

class function TOpenTypeSenaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SNA ';
end;


{ TOpenTypeSindhiLanguageSystemTable }

class function TOpenTypeSindhiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sindhi';
end;

class function TOpenTypeSindhiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SND ';
end;


{ TOpenTypeSinhaleseLanguageSystemTable }

class function TOpenTypeSinhaleseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sinhalese';
end;

class function TOpenTypeSinhaleseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SNH ';
end;


{ TOpenTypeSoninkeLanguageSystemTable }

class function TOpenTypeSoninkeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Soninke';
end;

class function TOpenTypeSoninkeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SNK ';
end;


{ TOpenTypeSodoGurageLanguageSystemTable }

class function TOpenTypeSodoGurageLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sodo Gurage';
end;

class function TOpenTypeSodoGurageLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SOG ';
end;


{ TOpenTypeSothoLanguageSystemTable }

class function TOpenTypeSothoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sotho';
end;

class function TOpenTypeSothoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SOT ';
end;


{ TOpenTypeAlbanianLanguageSystemTable }

class function TOpenTypeAlbanianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Albanian';
end;

class function TOpenTypeAlbanianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SQI ';
end;


{ TOpenTypeSerbianLanguageSystemTable }

class function TOpenTypeSerbianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Serbian';
end;

class function TOpenTypeSerbianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SRB ';
end;


{ TOpenTypeSaraikiLanguageSystemTable }

class function TOpenTypeSaraikiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Saraiki';
end;

class function TOpenTypeSaraikiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SRK ';
end;


{ TOpenTypeSererLanguageSystemTable }

class function TOpenTypeSererLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Serer';
end;

class function TOpenTypeSererLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SRR ';
end;


{ TOpenTypeSouthSlaveyLanguageSystemTable }

class function TOpenTypeSouthSlaveyLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'South Slavey';
end;

class function TOpenTypeSouthSlaveyLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SSL ';
end;


{ TOpenTypeSouthernSamiLanguageSystemTable }

class function TOpenTypeSouthernSamiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Southern Sami';
end;

class function TOpenTypeSouthernSamiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SSM ';
end;


{ TOpenTypeSuriLanguageSystemTable }

class function TOpenTypeSuriLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Suri';
end;

class function TOpenTypeSuriLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SUR ';
end;


{ TOpenTypeSvanLanguageSystemTable }

class function TOpenTypeSvanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Svan';
end;

class function TOpenTypeSvanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SVA ';
end;


{ TOpenTypeSwedishLanguageSystemTable }

class function TOpenTypeSwedishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Swedish';
end;

class function TOpenTypeSwedishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SVE ';
end;


{ TOpenTypeSwadayaAramaicLanguageSystemTable }

class function TOpenTypeSwadayaAramaicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Swadaya Aramaic';
end;

class function TOpenTypeSwadayaAramaicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SWA ';
end;


{ TOpenTypeSwahiliLanguageSystemTable }

class function TOpenTypeSwahiliLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Swahili';
end;

class function TOpenTypeSwahiliLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SWK ';
end;


{ TOpenTypeSwaziLanguageSystemTable }

class function TOpenTypeSwaziLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Swazi';
end;

class function TOpenTypeSwaziLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SWZ ';
end;


{ TOpenTypeSutuLanguageSystemTable }

class function TOpenTypeSutuLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Sutu';
end;

class function TOpenTypeSutuLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SXT ';
end;


{ TOpenTypeSyriacLanguageSystemTable }

class function TOpenTypeSyriacLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Syriac';
end;

class function TOpenTypeSyriacLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'SYR ';
end;


{ TOpenTypeTabasaranLanguageSystemTable }

class function TOpenTypeTabasaranLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tabasaran';
end;

class function TOpenTypeTabasaranLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TAB ';
end;


{ TOpenTypeTajikiLanguageSystemTable }

class function TOpenTypeTajikiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tajiki';
end;

class function TOpenTypeTajikiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TAJ ';
end;


{ TOpenTypeTamilLanguageSystemTable }

class function TOpenTypeTamilLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tamil';
end;

class function TOpenTypeTamilLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TAM ';
end;


{ TOpenTypeTatarLanguageSystemTable }

class function TOpenTypeTatarLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tatar';
end;

class function TOpenTypeTatarLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TAT ';
end;


{ TOpenTypeTHCreeLanguageSystemTable }

class function TOpenTypeTHCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'TH-Cree';
end;

class function TOpenTypeTHCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TCR ';
end;


{ TOpenTypeTeluguLanguageSystemTable }

class function TOpenTypeTeluguLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Telugu';
end;

class function TOpenTypeTeluguLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TEL ';
end;


{ TOpenTypeTonganLanguageSystemTable }

class function TOpenTypeTonganLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tongan';
end;

class function TOpenTypeTonganLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TGN ';
end;


{ TOpenTypeTigreLanguageSystemTable }

class function TOpenTypeTigreLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tigre';
end;

class function TOpenTypeTigreLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TGR ';
end;


{ TOpenTypeTigrinyaLanguageSystemTable }

class function TOpenTypeTigrinyaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tigrinya';
end;

class function TOpenTypeTigrinyaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TGY ';
end;


{ TOpenTypeThaiLanguageSystemTable }

class function TOpenTypeThaiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Thai';
end;

class function TOpenTypeThaiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'THA ';
end;


{ TOpenTypeTahitianLanguageSystemTable }

class function TOpenTypeTahitianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tahitian';
end;

class function TOpenTypeTahitianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'THT ';
end;


{ TOpenTypeTibetanLanguageSystemTable }

class function TOpenTypeTibetanLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tibetan';
end;

class function TOpenTypeTibetanLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TIB ';
end;


{ TOpenTypeTurkmenLanguageSystemTable }

class function TOpenTypeTurkmenLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Turkmen';
end;

class function TOpenTypeTurkmenLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TKM ';
end;


{ TOpenTypeTemneLanguageSystemTable }

class function TOpenTypeTemneLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Temne';
end;

class function TOpenTypeTemneLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TMN ';
end;


{ TOpenTypeTswanaLanguageSystemTable }

class function TOpenTypeTswanaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tswana';
end;

class function TOpenTypeTswanaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TNA ';
end;


{ TOpenTypeTundraNenetsLanguageSystemTable }

class function TOpenTypeTundraNenetsLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tundra Nenets';
end;

class function TOpenTypeTundraNenetsLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TNE ';
end;


{ TOpenTypeTongaLanguageSystemTable }

class function TOpenTypeTongaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tonga';
end;

class function TOpenTypeTongaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TNG ';
end;


{ TOpenTypeTodoLanguageSystemTable }

class function TOpenTypeTodoLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Todo';
end;

class function TOpenTypeTodoLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TOD ';
end;


{ TOpenTypeTurkishLanguageSystemTable }

class function TOpenTypeTurkishLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Turkish';
end;

class function TOpenTypeTurkishLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TRK ';
end;


{ TOpenTypeTsongaLanguageSystemTable }

class function TOpenTypeTsongaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tsonga';
end;

class function TOpenTypeTsongaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TSG ';
end;


{ TOpenTypeTuroyoAramaicLanguageSystemTable }

class function TOpenTypeTuroyoAramaicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Turoyo Aramaic';
end;

class function TOpenTypeTuroyoAramaicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TUA ';
end;


{ TOpenTypeTuluLanguageSystemTable }

class function TOpenTypeTuluLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tulu';
end;

class function TOpenTypeTuluLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TUL ';
end;


{ TOpenTypeTuvinLanguageSystemTable }

class function TOpenTypeTuvinLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tuvin';
end;

class function TOpenTypeTuvinLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TUV ';
end;


{ TOpenTypeTwiLanguageSystemTable }

class function TOpenTypeTwiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Twi';
end;

class function TOpenTypeTwiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'TWI ';
end;


{ TOpenTypeUdmurtLanguageSystemTable }

class function TOpenTypeUdmurtLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Udmurt';
end;

class function TOpenTypeUdmurtLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'UDM ';
end;


{ TOpenTypeUkrainianLanguageSystemTable }

class function TOpenTypeUkrainianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Ukrainian';
end;

class function TOpenTypeUkrainianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'UKR ';
end;


{ TOpenTypeUrduLanguageSystemTable }

class function TOpenTypeUrduLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Urdu';
end;

class function TOpenTypeUrduLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'URD ';
end;


{ TOpenTypeUpperSorbianLanguageSystemTable }

class function TOpenTypeUpperSorbianLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Upper Sorbian';
end;

class function TOpenTypeUpperSorbianLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'USB ';
end;


{ TOpenTypeUyghurLanguageSystemTable }

class function TOpenTypeUyghurLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Uyghur';
end;

class function TOpenTypeUyghurLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'UYG ';
end;


{ TOpenTypeUzbekLanguageSystemTable }

class function TOpenTypeUzbekLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Uzbek';
end;

class function TOpenTypeUzbekLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'UZB ';
end;


{ TOpenTypeVendaLanguageSystemTable }

class function TOpenTypeVendaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Venda';
end;

class function TOpenTypeVendaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'VEN ';
end;


{ TOpenTypeVietnameseLanguageSystemTable }

class function TOpenTypeVietnameseLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Vietnamese';
end;

class function TOpenTypeVietnameseLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'VIT ';
end;


{ TOpenTypeWaLanguageSystemTable }

class function TOpenTypeWaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Wa';
end;

class function TOpenTypeWaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'WA  ';
end;


{ TOpenTypeWagdiLanguageSystemTable }

class function TOpenTypeWagdiLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Wagdi';
end;

class function TOpenTypeWagdiLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'WAG ';
end;


{ TOpenTypeWestCreeLanguageSystemTable }

class function TOpenTypeWestCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'West-Cree';
end;

class function TOpenTypeWestCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'WCR ';
end;


{ TOpenTypeWelshLanguageSystemTable }

class function TOpenTypeWelshLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Welsh';
end;

class function TOpenTypeWelshLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'WEL ';
end;


{ TOpenTypeWolofLanguageSystemTable }

class function TOpenTypeWolofLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Wolof';
end;

class function TOpenTypeWolofLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'WLF ';
end;


{ TOpenTypeTaiLueLanguageSystemTable }

class function TOpenTypeTaiLueLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Tai Lue';
end;

class function TOpenTypeTaiLueLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'XBD ';
end;


{ TOpenTypeXhosaLanguageSystemTable }

class function TOpenTypeXhosaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Xhosa';
end;

class function TOpenTypeXhosaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'XHS ';
end;


{ TOpenTypeYakutLanguageSystemTable }

class function TOpenTypeYakutLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Yakut';
end;

class function TOpenTypeYakutLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'YAK ';
end;


{ TOpenTypeYorubaLanguageSystemTable }

class function TOpenTypeYorubaLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Yoruba';
end;

class function TOpenTypeYorubaLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'YBA ';
end;


{ TOpenTypeYCreeLanguageSystemTable }

class function TOpenTypeYCreeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Y-Cree';
end;

class function TOpenTypeYCreeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'YCR ';
end;


{ TOpenTypeYiClassicLanguageSystemTable }

class function TOpenTypeYiClassicLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Yi Classic';
end;

class function TOpenTypeYiClassicLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'YI  ';
end;


{ TOpenTypeYiModernLanguageSystemTable }

class function TOpenTypeYiModernLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Yi Modern';
end;

class function TOpenTypeYiModernLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'YIM ';
end;


{ TOpenTypeChineseHongKongLanguageSystemTable }

class function TOpenTypeChineseHongKongLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chinese Hong Kong';
end;

class function TOpenTypeChineseHongKongLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ZHH ';
end;


{ TOpenTypeChinesePhoneticLanguageSystemTable }

class function TOpenTypeChinesePhoneticLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chinese Phonetic';
end;

class function TOpenTypeChinesePhoneticLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ZHP ';
end;


{ TOpenTypeChineseSimplifiedLanguageSystemTable }

class function TOpenTypeChineseSimplifiedLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chinese Simplified';
end;

class function TOpenTypeChineseSimplifiedLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ZHS ';
end;


{ TOpenTypeChineseTraditionalLanguageSystemTable }

class function TOpenTypeChineseTraditionalLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Chinese Traditional';
end;

class function TOpenTypeChineseTraditionalLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ZHT ';
end;


{ TOpenTypeZandeLanguageSystemTable }

class function TOpenTypeZandeLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Zande';
end;

class function TOpenTypeZandeLanguageSystemTable.GetTableType: TTableType;
begin
 Result := 'ZND ';
end;


{ TOpenTypeZuluLanguageSystemTable }

class function TOpenTypeZuluLanguageSystemTable.GetDisplayName: string;
begin
 Result := 'Zulu';
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
    TOpenTypeBaghelkhandiLanguageSystemTable,
    TOpenTypeBalkarLanguageSystemTable, TOpenTypeBauleLanguageSystemTable,
    TOpenTypeBerberLanguageSystemTable, TOpenTypeBenchLanguageSystemTable,
    TOpenTypeBibleCreeLanguageSystemTable,
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
    TOpenTypeChipewyanLanguageSystemTable,
    TOpenTypeCherokeeLanguageSystemTable, TOpenTypeChuvashLanguageSystemTable,
    TOpenTypeComorianLanguageSystemTable, TOpenTypeCopticLanguageSystemTable,
    TOpenTypeCorsicanLanguageSystemTable, TOpenTypeCreeLanguageSystemTable,
    TOpenTypeCarrierLanguageSystemTable,
    TOpenTypeCrimeanTatarLanguageSystemTable,
    TOpenTypeChurchSlavonicLanguageSystemTable,
    TOpenTypeCzechLanguageSystemTable, TOpenTypeDanishLanguageSystemTable,
    TOpenTypeDargwaLanguageSystemTable, TOpenTypeWoodsCreeLanguageSystemTable,
    TOpenTypeGermanLanguageSystemTable, TOpenTypeDogriLanguageSystemTable,
    TOpenTypeDhivehiLanguageSystemTable,
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
    TOpenTypeEweLanguageSystemTable,
    TOpenTypeFrenchAntilleanLanguageSystemTable,
    TOpenTypeFarsiLanguageSystemTable, TOpenTypeFinnishLanguageSystemTable,
    TOpenTypeFijianLanguageSystemTable, TOpenTypeFlemishLanguageSystemTable,
    TOpenTypeForestNenetsLanguageSystemTable,
    TOpenTypeFonLanguageSystemTable, TOpenTypeFaroeseLanguageSystemTable,
    TOpenTypeFrenchLanguageSystemTable, TOpenTypeFrisianLanguageSystemTable,
    TOpenTypeFriulianLanguageSystemTable, TOpenTypeFutaLanguageSystemTable,
    TOpenTypeFulaniLanguageSystemTable, TOpenTypeGaLanguageSystemTable,
    TOpenTypeGaelicLanguageSystemTable, TOpenTypeGagauzLanguageSystemTable,
    TOpenTypeGalicianLanguageSystemTable, TOpenTypeGarshuniLanguageSystemTable,
    TOpenTypeGarhwaliLanguageSystemTable, TOpenTypeGeEzLanguageSystemTable,
    TOpenTypeGilyakLanguageSystemTable, TOpenTypeGumuzLanguageSystemTable,
    TOpenTypeGondiLanguageSystemTable, TOpenTypeGreenlandicLanguageSystemTable,
    TOpenTypeGaroLanguageSystemTable, TOpenTypeGuaraniLanguageSystemTable,
    TOpenTypeGujaratiLanguageSystemTable, TOpenTypeHaitianLanguageSystemTable,
    TOpenTypeHalamLanguageSystemTable, TOpenTypeHarautiLanguageSystemTable,
    TOpenTypeHausaLanguageSystemTable,  TOpenTypeHawaiinLanguageSystemTable,
    TOpenTypeHammerBannaLanguageSystemTable,
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
    TOpenTypeIcelandicLanguageSystemTable,
    TOpenTypeInariSamiLanguageSystemTable, TOpenTypeItalianLanguageSystemTable,
    TOpenTypeHebrewLanguageSystemTable, TOpenTypeJavaneseLanguageSystemTable,
    TOpenTypeYiddishLanguageSystemTable, TOpenTypeJapaneseLanguageSystemTable,
    TOpenTypeJudezmoLanguageSystemTable, TOpenTypeJulaLanguageSystemTable,
    TOpenTypeKabardianLanguageSystemTable, TOpenTypeKachchiLanguageSystemTable,
    TOpenTypeKalenjinLanguageSystemTable, TOpenTypeKannadaLanguageSystemTable,
    TOpenTypeKarachayLanguageSystemTable, TOpenTypeGeorgianLanguageSystemTable,
    TOpenTypeKazakhLanguageSystemTable, TOpenTypeKebenaLanguageSystemTable,
    TOpenTypeKhutsuriGeorgianLanguageSystemTable,
    TOpenTypeKhakassLanguageSystemTable,
    TOpenTypeKhantyKazimLanguageSystemTable, TOpenTypeKhmerLanguageSystemTable,
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
    TOpenTypeKomiPermyakLanguageSystemTable,
    TOpenTypeKoreanLanguageSystemTable, TOpenTypeKomiZyrianLanguageSystemTable,
    TOpenTypeKpelleLanguageSystemTable, TOpenTypeKrioLanguageSystemTable,
    TOpenTypeKarakalpakLanguageSystemTable,
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
    TOpenTypeLuleSamiLanguageSystemTable,
    TOpenTypeLithuanianLanguageSystemTable,
    TOpenTypeLuxembourgishLanguageSystemTable,
    TOpenTypeLubaLanguageSystemTable, TOpenTypeLugandaLanguageSystemTable,
    TOpenTypeLuhyaLanguageSystemTable, TOpenTypeLuoLanguageSystemTable,
    TOpenTypeLatvianLanguageSystemTable, TOpenTypeMajangLanguageSystemTable,
    TOpenTypeMakuaLanguageSystemTable,
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
    TOpenTypeMundariLanguageSystemTable,
    TOpenTypeNagaAssameseLanguageSystemTable,
    TOpenTypeNanaiLanguageSystemTable, TOpenTypeNaskapiLanguageSystemTable,
    TOpenTypeNLanguageSystemTable, TOpenTypeNdebeleLanguageSystemTable,
    TOpenTypeNdongaLanguageSystemTable, TOpenTypeNepaliLanguageSystemTable,
    TOpenTypeNewariLanguageSystemTable, TOpenTypeNagariLanguageSystemTable,
    TOpenTypeNorwayHouseCreeLanguageSystemTable,
    TOpenTypeNisiLanguageSystemTable, TOpenTypeNiueanLanguageSystemTable,
    TOpenTypeNkoleLanguageSystemTable, TOpenTypeNKoLanguageSystemTable,
    TOpenTypeDutchLanguageSystemTable, TOpenTypeNogaiLanguageSystemTable,
    TOpenTypeNorwegianLanguageSystemTable,
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
    TOpenTypeRussianBuriatLanguageSystemTable,
    TOpenTypeRiangLanguageSystemTable,
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
    TOpenTypeSouthernSamiLanguageSystemTable,
    TOpenTypeSuriLanguageSystemTable, TOpenTypeSvanLanguageSystemTable,
    TOpenTypeSwedishLanguageSystemTable,
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
    TOpenTypeTswanaLanguageSystemTable,
    TOpenTypeTundraNenetsLanguageSystemTable, TOpenTypeTongaLanguageSystemTable,
    TOpenTypeTodoLanguageSystemTable, TOpenTypeTurkishLanguageSystemTable,
    TOpenTypeTsongaLanguageSystemTable,
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
