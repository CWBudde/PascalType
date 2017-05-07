object FmRenderDemo: TFmRenderDemo
  Left = 322
  Top = 97
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PascalType Render Demo'
  ClientHeight = 183
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    471
    183)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelText: TLabel
    Left = 8
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Text:'
  end
  object LabelFont: TLabel
    Left = 199
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Font:'
  end
  object LabelFontSize: TLabel
    Left = 391
    Top = 11
    Width = 23
    Height = 13
    Caption = 'Size:'
  end
  object LabelFontEngine: TLabel
    Left = 8
    Top = 159
    Width = 62
    Height = 13
    Caption = 'Font-Engine:'
  end
  object EditText: TEdit
    Left = 40
    Top = 8
    Width = 153
    Height = 21
    TabOrder = 0
    Text = 'PascalType Render Demo'
    OnChange = EditTextChange
  end
  object ComboBoxFont: TComboBox
    Left = 231
    Top = 8
    Width = 154
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = ComboBoxFontChange
  end
  object ComboBoxFontSize: TComboBox
    Left = 420
    Top = 8
    Width = 43
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 8
    ParentFont = False
    TabOrder = 2
    Text = '20'
    OnChange = ComboBoxFontSizeChange
    Items.Strings = (
      '8'
      '9'
      '10'
      '11'
      '12'
      '14'
      '16'
      '18'
      '20'
      '22'
      '24'
      '26'
      '28'
      '36'
      '48'
      '72'
      '96'
      '128'
      '256')
  end
  object PanelText: TPanel
    Left = 8
    Top = 35
    Width = 455
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    TabOrder = 3
    OnResize = PanelTextResize
    object PaintBox: TPaintBox
      Left = 0
      Top = 0
      Width = 451
      Height = 119
      Align = alClient
      OnPaint = PaintBoxPaint
    end
  end
  object RadioButtonWindows: TRadioButton
    Left = 76
    Top = 158
    Width = 62
    Height = 17
    Caption = 'Windows'
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = RadioButtonWindowsClick
  end
  object RadioButtonPascalType: TRadioButton
    Left = 144
    Top = 158
    Width = 74
    Height = 17
    Caption = 'PascalType'
    TabOrder = 5
    OnClick = RadioButtonPascalTypeClick
  end
end
