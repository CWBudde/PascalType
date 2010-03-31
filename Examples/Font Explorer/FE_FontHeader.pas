unit FE_FontHeader;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, JvExComCtrls, JvDateTimePicker;

type
  TFrameFontHeader = class(TFrame)
    CbAdvancedWidthInstructions: TCheckBox;
    CbBaselineAtZero: TCheckBox;
    CbBold: TCheckBox;
    CbFontConverted: TCheckBox;
    CbForceppEm: TCheckBox;
    CbItalic: TCheckBox;
    CbLeftSidebearing: TCheckBox;
    CbLosslessFontData: TCheckBox;
    CbPointSizeInstructions: TCheckBox;
    EdFontRevision: TEdit;
    EdLowestRecPPEM: TEdit;
    EdUnitsPerEm: TEdit;
    GbFlags: TGroupBox;
    GbStyle: TGroupBox;
    LbCreated: TLabel;
    LbFontDirection: TLabel;
    LbFontRevision: TLabel;
    LbLowestRecPPEM: TLabel;
    LbModified: TLabel;
    LbUnitsPerEm: TLabel;
    CbFontDirection: TComboBox;
    CbCreated: TDateTimePicker;
    CbModified: TDateTimePicker;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

end.
