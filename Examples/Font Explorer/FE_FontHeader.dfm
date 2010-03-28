object FrameFontHeader: TFrameFontHeader
  Left = 0
  Top = 0
  Width = 515
  Height = 382
  TabOrder = 0
  object LbFontRevision: TLabel
    Left = 7
    Top = 7
    Width = 65
    Height = 13
    Caption = 'Font Revision'
  end
  object LbFontDirection: TLabel
    Left = 95
    Top = 7
    Width = 65
    Height = 13
    Caption = 'Font Revision'
  end
  object LbUnitsPerEm: TLabel
    Left = 7
    Top = 225
    Width = 60
    Height = 13
    Caption = 'Units per em'
  end
  object LbLowestRecPPEM: TLabel
    Left = 87
    Top = 225
    Width = 75
    Height = 13
    Caption = 'lowestRecPPEM'
  end
  object EdFontRevision: TEdit
    Left = 7
    Top = 23
    Width = 74
    Height = 21
    TabOrder = 0
  end
  object CbFontDirection: TComboBox
    Left = 95
    Top = 23
    Width = 170
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 1
    Text = 'Only strong left to right'
    Items.Strings = (
      'Fully mixed directional glyphs'
      'Only strong left to right'
      'Only strong left to right, contains neutrals'
      'Only strong right to left'
      'Only strong right to left, contains neutrals')
  end
  object GbFlags: TGroupBox
    Left = 7
    Top = 50
    Width = 258
    Height = 154
    Caption = 'Flags'
    TabOrder = 2
    object CbBaselineAtZero: TCheckBox
      Left = 9
      Top = 14
      Width = 102
      Height = 17
      Caption = 'Baseline at y = 0'
      TabOrder = 0
    end
    object CbLeftSidebearing: TCheckBox
      Left = 9
      Top = 33
      Width = 144
      Height = 17
      Caption = 'Left sidebearing at x = 0'
      TabOrder = 1
    end
    object CbPointSizeInstructions: TCheckBox
      Left = 9
      Top = 52
      Width = 203
      Height = 17
      Caption = 'Instructions may depend on point size'
      TabOrder = 2
    end
    object CbForceppEm: TCheckBox
      Left = 9
      Top = 71
      Width = 168
      Height = 17
      Caption = 'Force ppem to integer values'
      TabOrder = 3
    end
    object CbAdvancedWidthInstructions: TCheckBox
      Left = 9
      Top = 90
      Width = 203
      Height = 17
      Caption = 'Instructions may alter advanced width'
      TabOrder = 4
    end
    object CbLosslessFontData: TCheckBox
      Left = 9
      Top = 109
      Width = 117
      Height = 17
      Caption = 'Font data is lossless'
      TabOrder = 5
    end
    object CbFontConverted: TCheckBox
      Left = 9
      Top = 128
      Width = 242
      Height = 17
      Caption = 'Font converted (produce compatible metrics)'
      TabOrder = 6
    end
  end
  object EdUnitsPerEm: TEdit
    Left = 7
    Top = 242
    Width = 60
    Height = 21
    TabOrder = 3
    Text = '2048'
  end
  object EdLowestRecPPEM: TEdit
    Left = 87
    Top = 242
    Width = 60
    Height = 21
    TabOrder = 4
    Text = '9'
  end
end
