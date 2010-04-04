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

function LatinTextSerifStyleToString(SerifStyle: Byte): string;
function LatinTextWeightToString(Weight: Byte): string;
function LatinTextProportionToString(Proportion: Byte): string;

implementation

var
  GTableClasses : array of TCustomPascalTypeNamedTableClass;

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
 if Proportion in [0..11]
  then Result := CLatinTextProportionText[Proportion]
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

initialization
  RegisterPascalTypePanoses([TPascalTypeLatinTextPanoseTable]);

end.
