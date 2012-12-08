unit FE_FontHeader;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFrameFontHeader = class(TFrame)
    CbAdvancedWidthInstructions: TCheckBox;
    CbBaselineAtZero: TCheckBox;
    CbBold: TCheckBox;
    CbCondensed: TCheckBox;
    CbCreated: TDateTimePicker;
    CbExtended: TCheckBox;
    CbFontConverted: TCheckBox;
    CbFontDirection: TComboBox;
    CbFontOptimizedFotCleartype: TCheckBox;
    CbForceppEm: TCheckBox;
    CbItalic: TCheckBox;
    CbLeftSidebearing: TCheckBox;
    CbLinguisticRendering: TCheckBox;
    CbLosslessFontData: TCheckBox;
    CbModified: TDateTimePicker;
    CbPointSizeInstructions: TCheckBox;
    CbShadow: TCheckBox;
    CbUnderline: TCheckBox;
    CbVerticalFont: TCheckBox;
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
  end;

implementation

{$R *.dfm}

end.
