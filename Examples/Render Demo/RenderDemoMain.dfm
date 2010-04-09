object FmRenderDemo: TFmRenderDemo
  Left = 270
  Top = 140
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
  object LbText: TLabel
    Left = 8
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Text:'
  end
  object LbFont: TLabel
    Left = 199
    Top = 11
    Width = 26
    Height = 13
    Caption = 'Font:'
  end
  object LbFontSize: TLabel
    Left = 391
    Top = 11
    Width = 23
    Height = 13
    Caption = 'Size:'
  end
  object LbRasterizer: TLabel
    Left = 8
    Top = 159
    Width = 53
    Height = 13
    Caption = 'Rasterizer:'
  end
  object EdText: TEdit
    Left = 40
    Top = 8
    Width = 153
    Height = 21
    TabOrder = 0
    Text = 'PascalType Render Demo'
    OnChange = EdTextChange
  end
  object CbFont: TComboBox
    Left = 231
    Top = 8
    Width = 154
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = CbFontChange
  end
  object CbFontSize: TComboBox
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
    ItemHeight = 13
    ItemIndex = 8
    ParentFont = False
    TabOrder = 2
    Text = '20'
    OnChange = CbFontSizeChange
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
  object PnText: TPanel
    Left = 8
    Top = 35
    Width = 455
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    TabOrder = 3
    OnResize = PnTextResize
    object PaintBox: TPaintBox
      Left = 0
      Top = 0
      Width = 451
      Height = 119
      Align = alClient
      OnPaint = PaintBoxPaint
    end
  end
  object RbWindows: TRadioButton
    Left = 67
    Top = 158
    Width = 62
    Height = 17
    Caption = 'Windows'
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = RbWindowsClick
  end
  object RbPascalType: TRadioButton
    Left = 135
    Top = 158
    Width = 74
    Height = 17
    Caption = 'PascalType'
    TabOrder = 5
    OnClick = RbPascalTypeClick
  end
end
