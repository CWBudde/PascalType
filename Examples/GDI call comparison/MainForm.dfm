object FmComparison: TFmComparison
  Left = 470
  Top = 103
  Caption = 'GDI vs. PascalType Comparison'
  ClientHeight = 393
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    657
    393)
  PixelsPerInch = 96
  TextHeight = 13
  object LbGDI: TLabel
    Left = 8
    Top = 8
    Width = 22
    Height = 13
    Caption = 'GDI:'
  end
  object LbPascalType: TLabel
    Left = 335
    Top = 8
    Width = 58
    Height = 13
    Caption = 'PascalType:'
  end
  object MemoPT: TMemo
    Left = 335
    Top = 24
    Width = 314
    Height = 361
    Anchors = [akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 0
  end
  object MemoGDI: TMemo
    Left = 8
    Top = 24
    Width = 321
    Height = 361
    Anchors = [akLeft, akTop, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
  object MainMenu: TMainMenu
    Left = 120
    Top = 16
    object File1: TMenuItem
      Caption = '&File'
      object MiSaveGDILog: TMenuItem
        Caption = 'Save &GDI Log...'
        OnClick = MiSaveGDILogClick
      end
      object MiSavePascalTypeLog: TMenuItem
        Caption = 'Save &PascalType Log...'
        OnClick = MiSavePascalTypeLogClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MiExit: TMenuItem
        Caption = 'E&xit'
        OnClick = MiExitClick
      end
    end
    object MiCompare: TMenuItem
      Caption = '&Compare'
      object MiGetTextMetrics: TMenuItem
        Caption = '&GetTextMetrics'
        OnClick = MiGetTextMetricsClick
      end
      object MiGetOutlineTextMetrics: TMenuItem
        Caption = 'Get&OutlineTextMetrics'
        OnClick = MiGetOutlineTextMetricsClick
      end
      object MiGetTextExtentPoint32: TMenuItem
        Caption = 'Get&TextExtentPoint32'
        OnClick = MiGetTextExtentPoint32Click
      end
      object MiGetGlyphOutline: TMenuItem
        Caption = 'Get&GlyphOutline'
        OnClick = MiGetGlyphOutlineClick
      end
    end
  end
end
