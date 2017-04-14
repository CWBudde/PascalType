unit PT_TablesOpenTypeFeatures;

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
  Classes, Contnrs, PT_Types, PT_Tables, PT_TablesOpenType;

type
  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#aalt
  TOpenTypeAccessAllAlternatesTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#abvf
  TOpenTypeAboveBaseFormsTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#abvm
  TOpenTypeAboveBaseMarkPositioningTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#abvs
  TOpenTypeAboveBaseSubstitutionTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#afrc
  TOpenTypeAlternativeFractionsTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#akhn
  TOpenTypeAkhandTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#blwf
  TOpenTypeBelowBaseFormsTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#blwm
  TOpenTypeBelowBaseMarkPositioningTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#blws
  TOpenTypeBelowBaseSubstitutionTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#calt
  TOpenTypeContextualAlternatesTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#case
  TOpenTypeCaseSensitiveFormsTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#ccmp
  TOpenTypeCompositionFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#cfar
  TOpenTypeConjunctFormAfterRoFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#cjct
  TOpenTypeConjunctFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#clig
  TOpenTypeContextualLigaturesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#cpct
  TOpenTypeCJKPunctuationFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#cpsp
  TOpenTypeCapitalSpacingFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#cswh
  TOpenTypeContextualSwashFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#curs
  TOpenTypeCursivePositioningFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

(*
  Tag: 'cv01' - 'cv99'
  Friendly name: Character Variant 1 – Character Variant 99
*)

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#c2pc
  TOpenTypePetiteCapitalsFromCapitalsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#c2sc
  TOpenTypeSmallCapitalsFromCapitalsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#dist
  TOpenTypeDistancesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#dlig
  TOpenTypeDiscretionaryLigaturesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#dnom
  TOpenTypeDenominatorsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ae.htm#expt
  TOpenTypeExpertFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#falt
  TOpenTypeFinalGlyphOnLineAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#fin2
  TOpenTypeTerminalForm2FeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#fin3
  TOpenTypeTerminalForm3FeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#fina
  TOpenTypeTerminalFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#frac
  TOpenTypeFractionsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#fwid
  TOpenTypeFullWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#half
  TOpenTypeHalfFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#haln
  TOpenTypeHalantFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#halt
  TOpenTypeAlternateHalfWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#hist
  TOpenTypeHistoricalFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#hkna
  TOpenTypeHorizontalKanaAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#hlig
  TOpenTypeHistoricalLigaturesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#hngl
  TOpenTypeHangulFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#hojo
  TOpenTypeHojoKanjiFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#hwid
  TOpenTypeHalfWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#init
  TOpenTypeInitialFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#isol
  TOpenTypeIsolatedFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#ital
  TOpenTypeItalicsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#jalt
  TOpenTypeJustificationAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#jp78
  TOpenTypeJIS78FormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#jp83
  TOpenTypeJIS83FormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#jp90
  TOpenTypeJIS90FormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_fj.htm#jp04
  TOpenTypeJIS2004FormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#kern
  TOpenTypeKerningFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#lfbd
  TOpenTypeLeftBoundsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#liga
  TOpenTypeLigatureFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#ljmo
  TOpenTypeLeadingJamoFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#lnum
  TOpenTypeLiningFiguresFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#locl
  TOpenTypeLocalizedFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#ltra
  TOpenTypeLeftToRightGlyphAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#ltrm
  TOpenTypeLeftToRightMirroredFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#mark
  TOpenTypeMarkFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#med2
  TOpenTypeMedialForm3FeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#medi
  TOpenTypeMedialFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#mgrk
  TOpenTypeMathematicalGreekFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#mkmk
  TOpenTypeMarkToMarkFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#nalt
  TOpenTypeAlternateAnnotationFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#nlck
  TOpenTypeNLCKanjiFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#nukt
  TOpenTypeNuktaFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#numr
  TOpenTypeNumeratorsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#onum
  TOpenTypeOldstyleFiguresFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#opbd
  TOpenTypeOpticalBoundsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#ordn
  TOpenTypeOrdinalsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_ko.htm#ornm
  TOpenTypeOrnamentsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#palt
  TOpenTypeProportionalAlternateWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pcap
  TOpenTypePetiteCapitalsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pkna
  TOpenTypeProportionalKanaFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pnum
  TOpenTypeProportionalFiguresFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pref
  TOpenTypePreBaseFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pres
  TOpenTypePreBaseSubstitutionsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pstf
  TOpenTypePostBaseFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#psts
  TOpenTypePostBaseSubstitutionsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#pwid
  TOpenTypeProportionalWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#qwid
  TOpenTypeQuarterWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rand
  TOpenTypeRandomizeFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rlig
  TOpenTypeRequiredLigaturesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rkrf
  TOpenTypeRakarFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rphf
  TOpenTypeRephFormFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rtbd
  TOpenTypeRightBoundsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rtla
  TOpenTypeRightToLeftAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#rtlm
  TOpenTypeRightToLeftMirroredFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#ruby
  TOpenTypeRubyNotationFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#salt
  TOpenTypeStylisticAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#sinf
  TOpenTypeScientificInferiorsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#size
  TOpenTypeOpticalSizeFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#smcp
  TOpenTypeSmallCapitalsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#smpl
  TOpenTypeSimplifiedFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#subs
  TOpenTypeSubscriptFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#sups
  TOpenTypeSuperscriptFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#swsh
  TOpenTypeSwashFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#titl
  TOpenTypeTitlingFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#tjmo
  TOpenTypeTrailingJamoFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#tnam
  TOpenTypeTraditionalNameFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#tnum
  TOpenTypeTabularFiguresFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#trad
  TOpenTypeTraditionalFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_pt.htm#twid
  TOpenTypeThirdWidthsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#unic
  TOpenTypeUnicaseFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#valt
  TOpenTypeAlternateVerticalMetricsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vatu
  TOpenTypeVattuVariantsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vert
  TOpenTypeVerticalAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vhal
  TOpenTypeAlternateVerticalHalfMetricsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vjmo
  TOpenTypeVowelJamoFormsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vkna
  TOpenTypeVerticalKanaAlternatesFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vkrn
  TOpenTypeVerticalKerningFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vpal
  TOpenTypeProportionalAlternateVerticalMetricsFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#vrt2
  TOpenTypeVerticalAlternatesAndRotationFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;

  // see: http://www.microsoft.com/typography/otspec/features_uz.htm#zero
  TOpenTypeSlashedZeroFeatureTable = class(TCustomOpenTypeFeatureTable)
  protected
    class function GetDisplayName: string; override;
  public
    class function GetTableType: TTableType; override;
  end;


implementation

resourcestring
  RCStrAccessAllAlternates = 'Access All Alternates';
  RCStrAboveBaseForms = 'Above-base Forms';
  RCStrAboveBaseMarkPositioning = 'Above-base Mark Positioning';
  RCStrAboveBaseSubstitutions = 'Above-base Substitutions';
  RCStrAkhand = 'Akhand';
  RCStrGlyphCompositionDecomposition = 'Glyph Composition/Decomposition';
  RCStrAlternativeFractions = 'Alternative Fractions';
  RCStrBelowBaseForms = 'Below-base Forms';
  RCStrBelowBaseMarkPositioning = 'Below-base Mark Positioning';
  RCStrBelowBaseSubstitutions = 'Below-base Substitutions';
  RCStrContextualAlternates = 'Contextual Alternates';
  RCStrCaseSensitiveForms = 'Case-Sensitive Forms';
  RCStrConjunctFormAfterRo = 'Conjunct Form After Ro';
  RCStrConjunctForms = 'Conjunct Forms';
  RCStrContextualLigatures = 'Contextual Ligatures';
  RCStrCJKPunctuation = 'CJK Punctuation';
  RCStrCapitalSpacing = 'Capital Spacing';
  RCStrContextualSwash = 'Contextual Swash';
  RCStrCursivePositioning = 'Cursive Positioning';
  RCStrPetiteCapitalsFromCapitals = 'Petite Capitals From Capitals';
  RCStrSmallCapitalsFromCapitals = 'Small Capitals From Capitals';
  RCStrDistances = 'Distances';
  RCStrDiscretionaryLigatures = 'Discretionary Ligatures';
  RCStrDenominators = 'Denominators';
  RCStrExpertForms = 'Expert Forms';
  RCStrTerminalForm2 = 'Terminal Form #2';
  RCStrTerminalForm3 = 'Terminal Form #3';
  RCStrTerminalForms = 'Terminal Forms';
  RCStrFractions = 'Fractions';
  RCStrFullWidths = 'Full Widths';
  RCStrHalfForms = 'Half Forms';
  RCStrHalantForms = 'Halant Forms';
  RCStrAlternateHalfWidth = 'Alternate Half Widths';
  RCStrHistoricalForms = 'Historical Forms';
  RCStrHorizontalKanaAlternates = 'Horizontal Kana Alternates';
  RCStrHistoricalLigatures = 'Historical Ligatures';
  RCStrHangul = 'Hangul';
  RCStrHojoKanjiForms = 'Hojo Kanji Forms (JIS X 0212-1990 Kanji Forms)';
  RCStrHalfWidths = 'Half Widths';
  RCStrInitialForms = 'Initial Forms';
  RCStrIsolatedForms = 'Isolated Forms';
  RCStrItalics = 'Italics';
  RCStrJustificationAlternates = 'Justification Alternates';
  RCStrJIS78Forms = 'JIS78 Forms';
  RCStrJIS83Forms = 'JIS83 Forms';
  RCStrJIS90Forms = 'JIS90 Forms';
  RCStrJIS2004Forms = 'JIS2004 Forms';
  RCStrKerning = 'Kerning';
  RCStrLeftBounds = 'Left Bounds';
  RCStrLigature = 'Ligature';
  RCStrLeadingJamoForms = 'Leading Jamo Forms';
  RCStrLiningFigures = 'Lining Figures';
  RCStrLocalizedForms = 'Localized Forms';
  RCStrLeftToRightGlyphAlternates = 'Left-to-right glyph alternates';
  RCStrLeftToRightMirroredForms = 'Left-to-right mirrored forms';
  RCStrMarkPositioning = 'Mark Positioning';
  RCStrMedialForm3 = 'Medial Form #3';
  RCStrMedialForms = 'Medial Forms';
  RCStrMathematicalGreek = 'Mathematical Greek';
  RCStrMarkToMarkPositioning = 'Mark to Mark Positioning';
  RCStrAlternateAnnotationForms = 'Alternate Annotation Forms';
  RCStrNLCKanjiForms = 'NLC Kanji Forms';
  RCStrNuktaForms = 'Nukta Forms';
  RCStrNumerators = 'Numerators';
  RCStrOldstyleFigures = 'Oldstyle Figures';
  RCStrOpticalBounds = 'Optical Bounds';
  RCStrOrdinals = 'Ordinals';
  RCStrOrnaments = 'Ornaments';
  RCStrProportionalAlternateWidths = 'Proportional Alternate Widths';
  RCStrPetiteCapitals = 'Petite Capitals';
  RCStrProportionalKana = 'Proportional Kana';
  RCStrProportionalFigures = 'Proportional Figures';
  RCStrPrebaseForms = 'Pre-base Forms';
  RCStrPrebaseSubstitutions = 'Pre-base Substitutions';
  RCStrPostBaseForms = 'Post-base Forms';
  RCStrPostBaseSubstitutions = 'Post-base Substitutions';
  RCStrProportionalWidths = 'Proportional Widths';
  RCStrQuarterWidths = 'Quarter Widths';
  RCStrRandomize = 'Randomize';
  RCStrRequiredLigatures = 'Required Ligatures';
  RCStrRakarForms = 'Rakar Forms';
  RCStrRephForm = 'Reph Form';
  RCStrRightBounds = 'Right Bounds';
  RCStrRighttoleftAlternates = 'Right-to-left alternates';
  RCStrRightToLeftMirroredForms = 'Right-to-left mirrored forms';
  RCStrRubyNotationForms = 'Ruby Notation Forms';
  RCStrStylisticAlternates = 'Stylistic Alternates';
  RCStrScientificInferiors = 'Scientific Inferiors';
  RCStrOpticalSize = 'Optical size';
  RCStrSmallCapitals = 'Small Capitals';
  RCStrSimplifiedForms = 'Simplified Forms';
  RCStrSubscript = 'Subscript';
  RCStrSuperscript = 'Superscript';
  RCStrSwash = 'Swash';
  RCStrTitling = 'Titling';
  RCStrTrailingJamoForms = 'Trailing Jamo Forms';
  RCStrTraditionalNameForms = 'Traditional Name Forms';
  RCStrTabularFigures = 'Tabular Figures';
  RCStrTraditionalForms = 'Traditional Forms';
  RCStrThirdWidths = 'Third Widths';
  RCStrUnicase = 'Unicase';
  RCStrAlternateVerticalMetrics = 'Alternate Vertical Metrics';
  RCStrVattuVariants = 'Vattu Variants';
  RCStrVerticalAlternates = 'Vertical Alternates';
  RCStrAlternateVerticalHalfMetrics = 'Alternate Vertical Half Metrics';
  RCStrVowelJamoForms = 'Vowel Jamo Forms';
  RCStrVerticalKanaAlternates = 'Vertical Kana Alternates';
  RCStrVerticalKerning = 'Vertical Kerning';
  RCStrProportionalAlternateVerticalMetrics = 'Proportional Alternate ' +
  'Vertical Metrics';
  RCStrVerticalAlternatesAndRotation = 'Vertical Alternates and Rotation';
  RCStrSlashedZero = 'Slashed Zero';


{ TOpenTypeAccessAllAlternatesTable }

class function TOpenTypeAccessAllAlternatesTable.GetDisplayName: string;
begin
  Result := RCStrAccessAllAlternates;
end;

class function TOpenTypeAccessAllAlternatesTable.GetTableType: TTableType;
begin
  Result := 'aalt';
end;


{ TOpenTypeAboveBaseFormsTable }

class function TOpenTypeAboveBaseFormsTable.GetDisplayName: string;
begin
  Result := RCStrAboveBaseForms;
end;

class function TOpenTypeAboveBaseFormsTable.GetTableType: TTableType;
begin
  Result := 'abvf'
end;


{ TOpenTypeAboveBaseMarkPositioningTable }

class function TOpenTypeAboveBaseMarkPositioningTable.GetDisplayName: string;
begin
  Result := RCStrAboveBaseMarkPositioning;
end;

class function TOpenTypeAboveBaseMarkPositioningTable.GetTableType: TTableType;
begin
  Result := 'abvm';
end;


{ TOpenTypeAboveBaseSubstitutionTable }

class function TOpenTypeAboveBaseSubstitutionTable.GetDisplayName: string;
begin
  Result := RCStrAboveBaseSubstitutions;
end;

class function TOpenTypeAboveBaseSubstitutionTable.GetTableType: TTableType;
begin
  Result := 'abvs';
end;


{ TOpenTypeAkhandTable }

class function TOpenTypeAkhandTable.GetDisplayName: string;
begin
  Result := RCStrAkhand;
end;

class function TOpenTypeAkhandTable.GetTableType: TTableType;
begin
  Result := 'akhn';
end;


{ TOpenTypeCompositionFeatureTable }

class function TOpenTypeCompositionFeatureTable.GetDisplayName: string;
begin
  Result := RCStrGlyphCompositionDecomposition;
end;

class function TOpenTypeCompositionFeatureTable.GetTableType: TTableType;
begin
  Result := 'ccmp';
end;


{ TOpenTypeAlternativeFractionsTable }

class function TOpenTypeAlternativeFractionsTable.GetDisplayName: string;
begin
  Result := RCStrAlternativeFractions;
end;

class function TOpenTypeAlternativeFractionsTable.GetTableType: TTableType;
begin
  Result := 'afrc';
end;


{ TOpenTypeBelowBaseFormsTable }

class function TOpenTypeBelowBaseFormsTable.GetDisplayName: string;
begin
  Result := RCStrBelowBaseForms;
end;

class function TOpenTypeBelowBaseFormsTable.GetTableType: TTableType;
begin
  Result := 'blwf';
end;


{ TOpenTypeBelowBaseMarkPositioningTable }

class function TOpenTypeBelowBaseMarkPositioningTable.GetDisplayName: string;
begin
  Result := RCStrBelowBaseMarkPositioning;
end;

class function TOpenTypeBelowBaseMarkPositioningTable.GetTableType: TTableType;
begin
  Result := 'blwm';
end;


{ TOpenTypeBelowBaseSubstitutionTable }

class function TOpenTypeBelowBaseSubstitutionTable.GetDisplayName: string;
begin
  Result := RCStrBelowBaseSubstitutions;
end;

class function TOpenTypeBelowBaseSubstitutionTable.GetTableType: TTableType;
begin
  Result := 'blws';
end;


{ TOpenTypeContextualAlternatesTable }

class function TOpenTypeContextualAlternatesTable.GetDisplayName: string;
begin
  Result := RCStrContextualAlternates;
end;

class function TOpenTypeContextualAlternatesTable.GetTableType: TTableType;
begin
  Result := 'calt';
end;


{ TOpenTypeCaseSensitiveFormsTable }

class function TOpenTypeCaseSensitiveFormsTable.GetDisplayName: string;
begin
  Result := RCStrCaseSensitiveForms;
end;

class function TOpenTypeCaseSensitiveFormsTable.GetTableType: TTableType;
begin
  Result := 'case';
end;


{ TOpenTypeConjunctFormAfterRoFeatureTable }

class function TOpenTypeConjunctFormAfterRoFeatureTable.GetDisplayName: string;
begin
  Result := RCStrConjunctFormAfterRo;
end;

class function TOpenTypeConjunctFormAfterRoFeatureTable.GetTableType: TTableType;
begin
  Result := 'cfar'
end;


{ TOpenTypeConjunctFormsFeatureTable }

class function TOpenTypeConjunctFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrConjunctForms;
end;

class function TOpenTypeConjunctFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'cjct';
end;


{ TOpenTypeContextualLigaturesFeatureTable }

class function TOpenTypeContextualLigaturesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrContextualLigatures;
end;

class function TOpenTypeContextualLigaturesFeatureTable.GetTableType: TTableType;
begin
  Result := 'clig';
end;


{ TOpenTypeCJKPunctuationFeatureTable }

class function TOpenTypeCJKPunctuationFeatureTable.GetDisplayName: string;
begin
  Result := RCStrCJKPunctuation;
end;

class function TOpenTypeCJKPunctuationFeatureTable.GetTableType: TTableType;
begin
  Result := 'cpct';
end;


{ TOpenTypeCapitalSpacingFeatureTable }

class function TOpenTypeCapitalSpacingFeatureTable.GetDisplayName: string;
begin
  Result := RCStrCapitalSpacing;
end;

class function TOpenTypeCapitalSpacingFeatureTable.GetTableType: TTableType;
begin
  Result := 'cpsp';
end;


{ TOpenTypeContextualSwashFeatureTable }

class function TOpenTypeContextualSwashFeatureTable.GetDisplayName: string;
begin
  Result := RCStrContextualSwash;
end;

class function TOpenTypeContextualSwashFeatureTable.GetTableType: TTableType;
begin
  Result := 'cswh';
end;


{ TOpenTypeCursivePositioningFeatureTable }

class function TOpenTypeCursivePositioningFeatureTable.GetDisplayName: string;
begin
  Result := RCStrCursivePositioning;
end;

class function TOpenTypeCursivePositioningFeatureTable.GetTableType: TTableType;
begin
  Result := 'curs';
end;


{ TOpenTypePetiteCapitalsFromCapitalsFeatureTable }

class function TOpenTypePetiteCapitalsFromCapitalsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrPetiteCapitalsFromCapitals;
end;

class function TOpenTypePetiteCapitalsFromCapitalsFeatureTable.GetTableType: TTableType;
begin
  Result := 'c2pc';
end;


{ TOpenTypeSmallCapitalsFromCapitalsFeatureTable }

class function TOpenTypeSmallCapitalsFromCapitalsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSmallCapitalsFromCapitals;
end;

class function TOpenTypeSmallCapitalsFromCapitalsFeatureTable.GetTableType: TTableType;
begin
  Result := 'c2sc';
end;


{ TOpenTypeDistancesFeatureTable }

class function TOpenTypeDistancesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrDistances;
end;

class function TOpenTypeDistancesFeatureTable.GetTableType: TTableType;
begin
  Result := 'dist';
end;


{ TOpenTypeDiscretionaryLigaturesFeatureTable }

class function TOpenTypeDiscretionaryLigaturesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrDiscretionaryLigatures;
end;

class function TOpenTypeDiscretionaryLigaturesFeatureTable.GetTableType: TTableType;
begin
  Result := 'dlig';
end;


{ TOpenTypeDenominatorsFeatureTable }

class function TOpenTypeDenominatorsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrDenominators;
end;

class function TOpenTypeDenominatorsFeatureTable.GetTableType: TTableType;
begin
  Result := 'dnom';
end;


{ TOpenTypeExpertFormsFeatureTable }

class function TOpenTypeExpertFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrExpertForms;
end;

class function TOpenTypeExpertFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'expt';
end;


{ TOpenTypeFinalGlyphOnLineAlternatesFeatureTable }

class function TOpenTypeFinalGlyphOnLineAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := '';
end;

class function TOpenTypeFinalGlyphOnLineAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'falt';
end;


{ TOpenTypeTerminalForm2FeatureTable }

class function TOpenTypeTerminalForm2FeatureTable.GetDisplayName: string;
begin
  Result := RCStrTerminalForm2;
end;

class function TOpenTypeTerminalForm2FeatureTable.GetTableType: TTableType;
begin
  Result := 'fin2';
end;


{ TOpenTypeTerminalForm3FeatureTable }

class function TOpenTypeTerminalForm3FeatureTable.GetDisplayName: string;
begin
  Result := RCStrTerminalForm3;
end;

class function TOpenTypeTerminalForm3FeatureTable.GetTableType: TTableType;
begin
  Result := 'fin3';
end;


{ TOpenTypeTerminalFormsFeatureTable }

class function TOpenTypeTerminalFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrTerminalForms;
end;

class function TOpenTypeTerminalFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'fina';
end;


{ TOpenTypeFractionsFeatureTable }

class function TOpenTypeFractionsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrFractions;
end;

class function TOpenTypeFractionsFeatureTable.GetTableType: TTableType;
begin
  Result := 'frac';
end;


{ TOpenTypeFullWidthsFeatureTable }

class function TOpenTypeFullWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrFullWidths;
end;

class function TOpenTypeFullWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'fwid';
end;


{ TOpenTypeHalfFormsFeatureTable }

class function TOpenTypeHalfFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHalfForms;
end;

class function TOpenTypeHalfFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'half';
end;


{ TOpenTypeHalantFormsFeatureTable }

class function TOpenTypeHalantFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHalantForms;
end;

class function TOpenTypeHalantFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'haln';
end;


{ TOpenTypeAlternateHalfWidthsFeatureTable }

class function TOpenTypeAlternateHalfWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrAlternateHalfWidth;
end;

class function TOpenTypeAlternateHalfWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'halt';
end;


{ TOpenTypeHistoricalFormsFeatureTable }

class function TOpenTypeHistoricalFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHistoricalForms;
end;

class function TOpenTypeHistoricalFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'hist';
end;


{ TOpenTypeHorizontalKanaAlternatesFeatureTable }

class function TOpenTypeHorizontalKanaAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHorizontalKanaAlternates;
end;

class function TOpenTypeHorizontalKanaAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'hkna';
end;


{ TOpenTypeHistoricalLigaturesFeatureTable }

class function TOpenTypeHistoricalLigaturesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHistoricalLigatures;
end;

class function TOpenTypeHistoricalLigaturesFeatureTable.GetTableType: TTableType;
begin
  Result := 'hlig';
end;


{ TOpenTypeHangulFeatureTable }

class function TOpenTypeHangulFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHangul;
end;

class function TOpenTypeHangulFeatureTable.GetTableType: TTableType;
begin
  Result := 'hngl';
end;


{ TOpenTypeHojoKanjiFormsFeatureTable }

class function TOpenTypeHojoKanjiFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHojoKanjiForms;
end;

class function TOpenTypeHojoKanjiFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'hojo';
end;


{ TOpenTypeHalfWidthsFeatureTable }

class function TOpenTypeHalfWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrHalfWidths;
end;

class function TOpenTypeHalfWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'hwid';
end;


{ TOpenTypeInitialFormsFeatureTable }

class function TOpenTypeInitialFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrInitialForms;
end;

class function TOpenTypeInitialFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'init';
end;


{ TOpenTypeIsolatedFormsFeatureTable }

class function TOpenTypeIsolatedFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrIsolatedForms;
end;

class function TOpenTypeIsolatedFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'isol';
end;


{ TOpenTypeItalicsFeatureTable }

class function TOpenTypeItalicsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrItalics;
end;

class function TOpenTypeItalicsFeatureTable.GetTableType: TTableType;
begin
  Result := 'ital';
end;


{ TOpenTypeJustificationAlternatesFeatureTable }

class function TOpenTypeJustificationAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrJustificationAlternates;
end;

class function TOpenTypeJustificationAlternatesFeatureTable.GetTableType: TTableType;
begin
 Result := 'jalt';
end;


{ TOpenTypeJIS78FormsFeatureTable }

class function TOpenTypeJIS78FormsFeatureTable.GetDisplayName: string;
begin
 Result := RCStrJIS78Forms;
 end;

class function TOpenTypeJIS78FormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'jp78';
end;


{ TOpenTypeJIS83FormsFeatureTable }

class function TOpenTypeJIS83FormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrJIS83Forms;
end;

class function TOpenTypeJIS83FormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'jp83';
end;


{ TOpenTypeJIS90FormsFeatureTable }

class function TOpenTypeJIS90FormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrJIS90Forms;
end;

class function TOpenTypeJIS90FormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'jp90';
end;


{ TOpenTypeJIS2004FormsFeatureTable }

class function TOpenTypeJIS2004FormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrJIS2004Forms;
end;

class function TOpenTypeJIS2004FormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'jp04';
end;


{ TOpenTypeKerningFeatureTable }

class function TOpenTypeKerningFeatureTable.GetDisplayName: string;
begin
  Result := RCStrKerning;
end;

class function TOpenTypeKerningFeatureTable.GetTableType: TTableType;
begin
  Result := 'kern';
end;


{ TOpenTypeLeftBoundsFeatureTable }

class function TOpenTypeLeftBoundsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLeftBounds;
end;

class function TOpenTypeLeftBoundsFeatureTable.GetTableType: TTableType;
begin
  Result := 'lfbd';
end;


{ TOpenTypeLigatureFeatureTable }

class function TOpenTypeLigatureFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLigature;
end;

class function TOpenTypeLigatureFeatureTable.GetTableType: TTableType;
begin
  Result := 'liga';
end;


{ TOpenTypeLeadingJamoFormsFeatureTable }

class function TOpenTypeLeadingJamoFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLeadingJamoForms;
end;

class function TOpenTypeLeadingJamoFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'ljmo';
end;


{ TOpenTypeLiningFiguresFeatureTable }

class function TOpenTypeLiningFiguresFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLiningFigures;
end;

class function TOpenTypeLiningFiguresFeatureTable.GetTableType: TTableType;
begin
  Result := 'lnum';
end;


{ TOpenTypeLocalizedFormsFeatureTable }

class function TOpenTypeLocalizedFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLocalizedForms;
end;

class function TOpenTypeLocalizedFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'locl';
end;


{ TOpenTypeLeftToRightGlyphAlternatesFeatureTable }

class function TOpenTypeLeftToRightGlyphAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLeftToRightGlyphAlternates;
end;

class function TOpenTypeLeftToRightGlyphAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'ltra';
end;


{ TOpenTypeLeftToRightMirroredFormsFeatureTable }

class function TOpenTypeLeftToRightMirroredFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrLeftToRightMirroredForms;
end;

class function TOpenTypeLeftToRightMirroredFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'ltrm';
end;


{ TOpenTypeMarkFeatureTable }

class function TOpenTypeMarkFeatureTable.GetDisplayName: string;
begin
  Result := RCStrMarkPositioning;
end;

class function TOpenTypeMarkFeatureTable.GetTableType: TTableType;
begin
  Result := 'mark';
end;


{ TOpenTypeMedialForm3FeatureTable }

class function TOpenTypeMedialForm3FeatureTable.GetDisplayName: string;
begin
  Result := RCStrMedialForm3;
end;

class function TOpenTypeMedialForm3FeatureTable.GetTableType: TTableType;
begin
  Result := 'med2';
end;


{ TOpenTypeMedialFormsFeatureTable }

class function TOpenTypeMedialFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrMedialForms;
end;

class function TOpenTypeMedialFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'medi';
end;


{ TOpenTypeMathematicalGreekFeatureTable }

class function TOpenTypeMathematicalGreekFeatureTable.GetDisplayName: string;
begin
  Result := RCStrMathematicalGreek;
end;

class function TOpenTypeMathematicalGreekFeatureTable.GetTableType: TTableType;
begin
  Result := 'mgrk';
end;


{ TOpenTypeMarkToMarkFeatureTable }

class function TOpenTypeMarkToMarkFeatureTable.GetDisplayName: string;
begin
  Result := RCStrMarkToMarkPositioning;
end;

class function TOpenTypeMarkToMarkFeatureTable.GetTableType: TTableType;
begin
  Result := 'mkmk';
end;


{ TOpenTypeAlternateAnnotationFormsFeatureTable }

class function TOpenTypeAlternateAnnotationFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrAlternateAnnotationForms;
end;

class function TOpenTypeAlternateAnnotationFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'nalt';
end;


{ TOpenTypeNLCKanjiFormsFeatureTable }

class function TOpenTypeNLCKanjiFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrNLCKanjiForms;
end;

class function TOpenTypeNLCKanjiFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'nlck';
end;


{ TOpenTypeNuktaFormsFeatureTable }

class function TOpenTypeNuktaFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrNuktaForms;
end;

class function TOpenTypeNuktaFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'nukt';
end;


{ TOpenTypeNumeratorsFeatureTable }

class function TOpenTypeNumeratorsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrNumerators;
end;

class function TOpenTypeNumeratorsFeatureTable.GetTableType: TTableType;
begin
  Result := 'numr';
end;


{ TOpenTypeOldstyleFiguresFeatureTable }

class function TOpenTypeOldstyleFiguresFeatureTable.GetDisplayName: string;
begin
  Result := RCStrOldstyleFigures;
end;

class function TOpenTypeOldstyleFiguresFeatureTable.GetTableType: TTableType;
begin
  Result := 'onum';
end;


{ TOpenTypeOpticalBoundsFeatureTable }

class function TOpenTypeOpticalBoundsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrOpticalBounds;
end;

class function TOpenTypeOpticalBoundsFeatureTable.GetTableType: TTableType;
begin
  Result := 'opbd';
end;


{ TOpenTypeOrdinalsFeatureTable }

class function TOpenTypeOrdinalsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrOrdinals;
end;

class function TOpenTypeOrdinalsFeatureTable.GetTableType: TTableType;
begin
  Result := 'ordn';
end;


{ TOpenTypeOrnamentsFeatureTable }

class function TOpenTypeOrnamentsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrOrnaments;
end;

class function TOpenTypeOrnamentsFeatureTable.GetTableType: TTableType;
begin
  Result := 'ornm';
end;


{ TOpenTypeProportionalAlternateWidthsFeatureTable }

class function TOpenTypeProportionalAlternateWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrProportionalAlternateWidths;
end;

class function TOpenTypeProportionalAlternateWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'palt';
end;


{ TOpenTypePetiteCapitalsFeatureTable }

class function TOpenTypePetiteCapitalsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrPetiteCapitals;
end;

class function TOpenTypePetiteCapitalsFeatureTable.GetTableType: TTableType;
begin
  Result := 'pcap';
end;


{ TOpenTypeProportionalKanaFeatureTable }

class function TOpenTypeProportionalKanaFeatureTable.GetDisplayName: string;
begin
  Result := RCStrProportionalKana;
end;

class function TOpenTypeProportionalKanaFeatureTable.GetTableType: TTableType;
begin
  Result := 'pkna';
end;


{ TOpenTypeProportionalFiguresFeatureTable }

class function TOpenTypeProportionalFiguresFeatureTable.GetDisplayName: string;
begin
  Result := RCStrProportionalFigures;
end;

class function TOpenTypeProportionalFiguresFeatureTable.GetTableType: TTableType;
begin
  Result := 'pnum';
end;


{ TOpenTypePreBaseFormsFeatureTable }

class function TOpenTypePreBaseFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrPrebaseForms;
end;

class function TOpenTypePreBaseFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'pref';
end;


{ TOpenTypePreBaseSubstitutionsFeatureTable }

class function TOpenTypePreBaseSubstitutionsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrPrebaseSubstitutions;
end;

class function TOpenTypePreBaseSubstitutionsFeatureTable.GetTableType: TTableType;
begin
  Result := 'pres';
end;


{ TOpenTypePostBaseFormsFeatureTable }

class function TOpenTypePostBaseFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrPostBaseForms;
end;

class function TOpenTypePostBaseFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'pstf';
end;


{ TOpenTypePostBaseSubstitutionsFeatureTable }

class function TOpenTypePostBaseSubstitutionsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrPostBaseSubstitutions;
end;

class function TOpenTypePostBaseSubstitutionsFeatureTable.GetTableType: TTableType;
begin
  Result := 'psts';
end;


{ TOpenTypeProportionalWidthsFeatureTable }

class function TOpenTypeProportionalWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrProportionalWidths;
end;

class function TOpenTypeProportionalWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'pwid';
end;


{ TOpenTypeQuarterWidthsFeatureTable }

class function TOpenTypeQuarterWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrQuarterWidths;
end;

class function TOpenTypeQuarterWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'qwid';
end;


{ TOpenTypeRandomizeFeatureTable }

class function TOpenTypeRandomizeFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRandomize;
end;

class function TOpenTypeRandomizeFeatureTable.GetTableType: TTableType;
begin
  Result := 'rand';
end;


{ TOpenTypeRequiredLigaturesFeatureTable }

class function TOpenTypeRequiredLigaturesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRequiredLigatures;
end;

class function TOpenTypeRequiredLigaturesFeatureTable.GetTableType: TTableType;
begin
  Result := 'rlig';
end;


{ TOpenTypeRakarFormsFeatureTable }

class function TOpenTypeRakarFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRakarForms;
end;

class function TOpenTypeRakarFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'rkrf';
end;


{ TOpenTypeRephFormFeatureTable }

class function TOpenTypeRephFormFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRephForm;
end;

class function TOpenTypeRephFormFeatureTable.GetTableType: TTableType;
begin
  Result := 'rphf';
end;


{ TOpenTypeRightBoundsFeatureTable }

class function TOpenTypeRightBoundsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRightBounds;
end;

class function TOpenTypeRightBoundsFeatureTable.GetTableType: TTableType;
begin
  Result := 'rtbd';
end;


{ TOpenTypeRightToLeftAlternatesFeatureTable }

class function TOpenTypeRightToLeftAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRighttoleftAlternates;
end;

class function TOpenTypeRightToLeftAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'rtla';
end;


{ TOpenTypeRightToLeftMirroredFormsFeatureTable }

class function TOpenTypeRightToLeftMirroredFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRightToLeftMirroredForms;
end;

class function TOpenTypeRightToLeftMirroredFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'rtlm';
end;


{ TOpenTypeRubyNotationFormsFeatureTable }

class function TOpenTypeRubyNotationFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrRubyNotationForms;
end;

class function TOpenTypeRubyNotationFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'ruby';
end;


{ TOpenTypeStylisticAlternatesFeatureTable }

class function TOpenTypeStylisticAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrStylisticAlternates;
end;

class function TOpenTypeStylisticAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'salt';
end;


{ TOpenTypeScientificInferiorsFeatureTable }

class function TOpenTypeScientificInferiorsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrScientificInferiors;
end;

class function TOpenTypeScientificInferiorsFeatureTable.GetTableType: TTableType;
begin
  Result := 'sinf';
end;


{ TOpenTypeOpticalSizeFeatureTable }

class function TOpenTypeOpticalSizeFeatureTable.GetDisplayName: string;
begin
  Result := RCStrOpticalSize;
end;

class function TOpenTypeOpticalSizeFeatureTable.GetTableType: TTableType;
begin
  Result := 'size';
end;


{ TOpenTypeSmallCapitalsFeatureTable }

class function TOpenTypeSmallCapitalsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSmallCapitals;
end;

class function TOpenTypeSmallCapitalsFeatureTable.GetTableType: TTableType;
begin
  Result := 'smcp';
end;


{ TOpenTypeSimplifiedFormsFeatureTable }

class function TOpenTypeSimplifiedFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSimplifiedForms;
end;

class function TOpenTypeSimplifiedFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'smpl';
end;


{ TOpenTypeSubscriptFeatureTable }

class function TOpenTypeSubscriptFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSubscript;
end;

class function TOpenTypeSubscriptFeatureTable.GetTableType: TTableType;
begin
  Result := 'subs';
end;


{ TOpenTypeSuperscriptFeatureTable }

class function TOpenTypeSuperscriptFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSuperscript;
end;

class function TOpenTypeSuperscriptFeatureTable.GetTableType: TTableType;
begin
  Result := 'sups';
end;


{ TOpenTypeSwashFeatureTable }

class function TOpenTypeSwashFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSwash;
end;

class function TOpenTypeSwashFeatureTable.GetTableType: TTableType;
begin
  Result := 'swsh';
end;


{ TOpenTypeTitlingFeatureTable }

class function TOpenTypeTitlingFeatureTable.GetDisplayName: string;
begin
  Result := RCStrTitling;
end;

class function TOpenTypeTitlingFeatureTable.GetTableType: TTableType;
begin
  Result := 'titl';
end;


{ TOpenTypeTrailingJamoFormsFeatureTable }

class function TOpenTypeTrailingJamoFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrTrailingJamoForms;
end;

class function TOpenTypeTrailingJamoFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'tjmo';
end;


{ TOpenTypeTraditionalNameFormsFeatureTable }

class function TOpenTypeTraditionalNameFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrTraditionalNameForms;
end;

class function TOpenTypeTraditionalNameFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'tnam';
end;


{ TOpenTypeTabularFiguresFeatureTable }

class function TOpenTypeTabularFiguresFeatureTable.GetDisplayName: string;
begin
  Result := RCStrTabularFigures;
end;

class function TOpenTypeTabularFiguresFeatureTable.GetTableType: TTableType;
begin
  Result := 'tnum';
end;


{ TOpenTypeTraditionalFormsFeatureTable }

class function TOpenTypeTraditionalFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrTraditionalForms;
end;

class function TOpenTypeTraditionalFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'trad';
end;


{ TOpenTypeThirdWidthsFeatureTable }

class function TOpenTypeThirdWidthsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrThirdWidths;
end;

class function TOpenTypeThirdWidthsFeatureTable.GetTableType: TTableType;
begin
  Result := 'twid';
end;


{ TOpenTypeUnicaseFeatureTable }

class function TOpenTypeUnicaseFeatureTable.GetDisplayName: string;
begin
  Result := RCStrUnicase;
end;

class function TOpenTypeUnicaseFeatureTable.GetTableType: TTableType;
begin
  Result := 'unic';
end;


{ TOpenTypeAlternateVerticalMetricsFeatureTable }

class function TOpenTypeAlternateVerticalMetricsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrAlternateVerticalMetrics;
end;

class function TOpenTypeAlternateVerticalMetricsFeatureTable.GetTableType: TTableType;
begin
  Result := 'valt';
end;


{ TOpenTypeVattuVariantsFeatureTable }

class function TOpenTypeVattuVariantsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrVattuVariants;
end;

class function TOpenTypeVattuVariantsFeatureTable.GetTableType: TTableType;
begin
  Result := 'vatu';
end;


{ TOpenTypeVerticalAlternatesFeatureTable }

class function TOpenTypeVerticalAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrVerticalAlternates;
end;

class function TOpenTypeVerticalAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'vert';
end;


{ TOpenTypeAlternateVerticalHalfMetricsFeatureTable }

class function TOpenTypeAlternateVerticalHalfMetricsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrAlternateVerticalHalfMetrics;
end;

class function TOpenTypeAlternateVerticalHalfMetricsFeatureTable.GetTableType: TTableType;
begin
  Result := 'vhal';
end;


{ TOpenTypeVowelJamoFormsFeatureTable }

class function TOpenTypeVowelJamoFormsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrVowelJamoForms;
end;

class function TOpenTypeVowelJamoFormsFeatureTable.GetTableType: TTableType;
begin
  Result := 'vjmo';
end;


{ TOpenTypeVerticalKanaAlternatesFeatureTable }

class function TOpenTypeVerticalKanaAlternatesFeatureTable.GetDisplayName: string;
begin
  Result := RCStrVerticalKanaAlternates;
end;

class function TOpenTypeVerticalKanaAlternatesFeatureTable.GetTableType: TTableType;
begin
  Result := 'vkna';
end;


{ TOpenTypeVerticalKerningFeatureTable }

class function TOpenTypeVerticalKerningFeatureTable.GetDisplayName: string;
begin
  Result := RCStrVerticalKerning;
end;

class function TOpenTypeVerticalKerningFeatureTable.GetTableType: TTableType;
begin
  Result := 'vkrn';
end;


{ TOpenTypeProportionalAlternateVerticalMetricsFeatureTable }

class function TOpenTypeProportionalAlternateVerticalMetricsFeatureTable.GetDisplayName: string;
begin
  Result := RCStrProportionalAlternateVerticalMetrics;
end;

class function TOpenTypeProportionalAlternateVerticalMetricsFeatureTable.GetTableType: TTableType;
begin
  Result := 'vpal';
end;


{ TOpenTypeVerticalAlternatesAndRotationFeatureTable }

class function TOpenTypeVerticalAlternatesAndRotationFeatureTable.GetDisplayName: string;
begin
  Result := RCStrVerticalAlternatesAndRotation;
end;

class function TOpenTypeVerticalAlternatesAndRotationFeatureTable.GetTableType: TTableType;
begin
  Result := 'vrt2';
end;


{ TOpenTypeSlashedZeroFeatureTable }

class function TOpenTypeSlashedZeroFeatureTable.GetDisplayName: string;
begin
  Result := RCStrSlashedZero;
end;

class function TOpenTypeSlashedZeroFeatureTable.GetTableType: TTableType;
begin
  Result := 'zero';
end;


initialization
  RegisterFeatures([TOpenTypeAccessAllAlternatesTable,
    TOpenTypeAboveBaseFormsTable, TOpenTypeAboveBaseMarkPositioningTable,
    TOpenTypeAlternativeFractionsTable, TOpenTypeAkhandTable,
    TOpenTypeContextualAlternatesTable, TOpenTypeCaseSensitiveFormsTable,
    TOpenTypeCompositionFeatureTable, TOpenTypeConjunctFormAfterRoFeatureTable,
    TOpenTypeConjunctFormsFeatureTable,
    TOpenTypeContextualLigaturesFeatureTable,
    TOpenTypeCJKPunctuationFeatureTable, TOpenTypeCapitalSpacingFeatureTable,
    TOpenTypeContextualSwashFeatureTable,
    TOpenTypeCursivePositioningFeatureTable,
    TOpenTypePetiteCapitalsFromCapitalsFeatureTable,
    TOpenTypeSmallCapitalsFromCapitalsFeatureTable,
    TOpenTypeDistancesFeatureTable,
    TOpenTypeDiscretionaryLigaturesFeatureTable,
    TOpenTypeDenominatorsFeatureTable, TOpenTypeExpertFormsFeatureTable,
    TOpenTypeFinalGlyphOnLineAlternatesFeatureTable,
    TOpenTypeTerminalForm2FeatureTable, TOpenTypeTerminalForm3FeatureTable,
    TOpenTypeTerminalFormsFeatureTable, TOpenTypeFractionsFeatureTable,
    TOpenTypeFullWidthsFeatureTable, TOpenTypeHalfFormsFeatureTable,
    TOpenTypeHalantFormsFeatureTable, TOpenTypeAlternateHalfWidthsFeatureTable,
    TOpenTypeHistoricalFormsFeatureTable,
    TOpenTypeHorizontalKanaAlternatesFeatureTable,
    TOpenTypeHistoricalLigaturesFeatureTable, TOpenTypeHangulFeatureTable,
    TOpenTypeHojoKanjiFormsFeatureTable, TOpenTypeHalfWidthsFeatureTable,
    TOpenTypeInitialFormsFeatureTable, TOpenTypeIsolatedFormsFeatureTable,
    TOpenTypeItalicsFeatureTable, TOpenTypeJustificationAlternatesFeatureTable,
    TOpenTypeJIS78FormsFeatureTable, TOpenTypeJIS83FormsFeatureTable,
    TOpenTypeJIS90FormsFeatureTable, TOpenTypeJIS2004FormsFeatureTable,
    TOpenTypeKerningFeatureTable, TOpenTypeLeftBoundsFeatureTable,
    TOpenTypeLigatureFeatureTable, TOpenTypeLeadingJamoFormsFeatureTable,
    TOpenTypeLiningFiguresFeatureTable, TOpenTypeLocalizedFormsFeatureTable,
    TOpenTypeLeftToRightGlyphAlternatesFeatureTable,
    TOpenTypeLeftToRightMirroredFormsFeatureTable, TOpenTypeMarkFeatureTable,
    TOpenTypeMedialForm3FeatureTable, TOpenTypeMedialFormsFeatureTable,
    TOpenTypeMathematicalGreekFeatureTable, TOpenTypeMarkToMarkFeatureTable,
    TOpenTypeAlternateAnnotationFormsFeatureTable,
    TOpenTypeNLCKanjiFormsFeatureTable, TOpenTypeNuktaFormsFeatureTable,
    TOpenTypeNumeratorsFeatureTable, TOpenTypeOldstyleFiguresFeatureTable,
    TOpenTypeOpticalBoundsFeatureTable, TOpenTypeOrdinalsFeatureTable,
    TOpenTypeOrnamentsFeatureTable,
    TOpenTypeProportionalAlternateWidthsFeatureTable,
    TOpenTypePetiteCapitalsFeatureTable, TOpenTypeProportionalKanaFeatureTable,
    TOpenTypeProportionalFiguresFeatureTable, TOpenTypePreBaseFormsFeatureTable,
    TOpenTypePreBaseSubstitutionsFeatureTable,
    TOpenTypePostBaseFormsFeatureTable,
    TOpenTypePostBaseSubstitutionsFeatureTable,
    TOpenTypeProportionalWidthsFeatureTable, TOpenTypeQuarterWidthsFeatureTable,
    TOpenTypeRandomizeFeatureTable, TOpenTypeRequiredLigaturesFeatureTable,
    TOpenTypeRakarFormsFeatureTable, TOpenTypeRephFormFeatureTable,
    TOpenTypeRightBoundsFeatureTable,
    TOpenTypeRightToLeftAlternatesFeatureTable,
    TOpenTypeRightToLeftMirroredFormsFeatureTable,
    TOpenTypeRubyNotationFormsFeatureTable,
    TOpenTypeStylisticAlternatesFeatureTable,
    TOpenTypeScientificInferiorsFeatureTable, TOpenTypeOpticalSizeFeatureTable,
    TOpenTypeSmallCapitalsFeatureTable, TOpenTypeSimplifiedFormsFeatureTable,
    TOpenTypeSubscriptFeatureTable, TOpenTypeSuperscriptFeatureTable,
    TOpenTypeSwashFeatureTable, TOpenTypeTitlingFeatureTable,
    TOpenTypeTrailingJamoFormsFeatureTable,
    TOpenTypeTraditionalNameFormsFeatureTable,
    TOpenTypeTabularFiguresFeatureTable, TOpenTypeTraditionalFormsFeatureTable,
    TOpenTypeThirdWidthsFeatureTable, TOpenTypeUnicaseFeatureTable,
    TOpenTypeAlternateVerticalMetricsFeatureTable,
    TOpenTypeVattuVariantsFeatureTable, TOpenTypeVerticalAlternatesFeatureTable,
    TOpenTypeAlternateVerticalHalfMetricsFeatureTable,
    TOpenTypeVowelJamoFormsFeatureTable,
    TOpenTypeVerticalKanaAlternatesFeatureTable,
    TOpenTypeVerticalKerningFeatureTable,
    TOpenTypeProportionalAlternateVerticalMetricsFeatureTable,
    TOpenTypeVerticalAlternatesAndRotationFeatureTable,
    TOpenTypeSlashedZeroFeatureTable]);

end.
