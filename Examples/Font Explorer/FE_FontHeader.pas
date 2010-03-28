unit FE_FontHeader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls;

type
  TFrameFontHeader = class(TFrame)
    LbFontRevision: TLabel;
    EdFontRevision: TEdit;
    LbFontDirection: TLabel;
    CbFontDirection: TComboBox;
    GbFlags: TGroupBox;
    CbBaselineAtZero: TCheckBox;
    CbLeftSidebearing: TCheckBox;
    CbPointSizeInstructions: TCheckBox;
    CbForceppEm: TCheckBox;
    CbAdvancedWidthInstructions: TCheckBox;
    CbLosslessFontData: TCheckBox;
    CbFontConverted: TCheckBox;
    LbUnitsPerEm: TLabel;
    EdUnitsPerEm: TEdit;
    LbLowestRecPPEM: TLabel;
    EdLowestRecPPEM: TEdit;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

end.
