object FmComparison: TFmComparison
  Left = 217
  Top = 81
  Caption = 'GDI vs. PascalType Comparison'
  ClientHeight = 478
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    582
    478)
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
    Left = 294
    Top = 8
    Width = 58
    Height = 13
    Caption = 'PascalType:'
  end
  object MemoPT: TMemo
    Left = 294
    Top = 24
    Width = 280
    Height = 415
    Anchors = [akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
  object MemoGDI: TMemo
    Left = 8
    Top = 24
    Width = 280
    Height = 415
    Anchors = [akLeft, akTop, akBottom]
    ReadOnly = True
    TabOrder = 2
  end
  object BtCompareGetTextMetrics: TButton
    Left = 8
    Top = 445
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Compare GetText&Metrics'
    Default = True
    TabOrder = 0
    OnClick = BtCompareGetTextMetricsClick
  end
  object BtCompareGetOutlineTextMetrics: TButton
    Left = 159
    Top = 445
    Width = 170
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Compare Get&OutlineTextMetrics'
    TabOrder = 3
    OnClick = BtCompareGetOutlineTextMetricsClick
  end
  object BtCompareTextExtentPoint32: TButton
    Left = 335
    Top = 445
    Width = 170
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Compare Get&TextExtentPoint32'
    TabOrder = 4
    OnClick = BtCompareTextExtentPoint32Click
  end
end
