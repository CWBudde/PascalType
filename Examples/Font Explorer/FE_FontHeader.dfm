object FrameFontHeader: TFrameFontHeader
  Left = 0
  Top = 0
  Width = 271
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
    Width = 89
    Height = 13
    Caption = 'Font Direction Hint'
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
  object LbCreated: TLabel
    Left = 7
    Top = 295
    Width = 39
    Height = 13
    Caption = 'Created'
  end
  object LbModified: TLabel
    Left = 7
    Top = 338
    Width = 51
    Height = 13
    Caption = 'LbModified'
  end
  object EdFontRevision: TEdit
    Left = 7
    Top = 23
    Width = 74
    Height = 21
    TabOrder = 0
  end
  object GbFlags: TGroupBox
    Left = 7
    Top = 50
    Width = 258
    Height = 159
    Caption = 'Flags'
    TabOrder = 2
    object CbBaselineAtZero: TCheckBox
      Left = 9
      Top = 18
      Width = 102
      Height = 17
      Caption = 'Baseline at y = 0'
      TabOrder = 0
    end
    object CbLeftSidebearing: TCheckBox
      Left = 9
      Top = 37
      Width = 144
      Height = 17
      Caption = 'Left sidebearing at x = 0'
      TabOrder = 1
    end
    object CbPointSizeInstructions: TCheckBox
      Left = 9
      Top = 56
      Width = 203
      Height = 17
      Caption = 'Instructions may depend on point size'
      TabOrder = 2
    end
    object CbForceppEm: TCheckBox
      Left = 9
      Top = 75
      Width = 168
      Height = 17
      Caption = 'Force ppem to integer values'
      TabOrder = 3
    end
    object CbAdvancedWidthInstructions: TCheckBox
      Left = 9
      Top = 94
      Width = 203
      Height = 17
      Caption = 'Instructions may alter advanced width'
      TabOrder = 4
    end
    object CbLosslessFontData: TCheckBox
      Left = 9
      Top = 113
      Width = 117
      Height = 17
      Caption = 'Font data is lossless'
      TabOrder = 5
    end
    object CbFontConverted: TCheckBox
      Left = 9
      Top = 132
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
    ReadOnly = True
    TabOrder = 3
    Text = '2048'
  end
  object EdLowestRecPPEM: TEdit
    Left = 87
    Top = 242
    Width = 60
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = '9'
  end
  object GbStyle: TGroupBox
    Left = 168
    Top = 225
    Width = 97
    Height = 64
    Caption = 'Style'
    TabOrder = 5
    object CbBold: TCheckBox
      Left = 9
      Top = 18
      Width = 41
      Height = 17
      Caption = 'Bold'
      TabOrder = 0
    end
    object CbItalic: TCheckBox
      Left = 9
      Top = 37
      Width = 48
      Height = 17
      Caption = 'Italic'
      TabOrder = 1
    end
  end
  object CbFontDirection: TComboBox
    Left = 95
    Top = 23
    Width = 170
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Only strong left to right'
    Items.Strings = (
      'Only strong right to left, contains neutrals'
      'Only strong right to left'
      'Fully mixed directional glyphs'
      'Only strong left to right'
      'Only strong left to right, contains neutrals')
  end
  object CbCreated: TDateTimePicker
    Left = 7
    Top = 311
    Width = 258
    Height = 21
    Date = 40268.157690150460000000
    Format = 'dddd-MMMM-yyyy hh:mm'
    Time = 40268.157690150460000000
    TabOrder = 6
  end
  object CbModified: TDateTimePicker
    Left = 7
    Top = 354
    Width = 258
    Height = 21
    Date = 40268.157693298610000000
    Time = 40268.157693298610000000
    TabOrder = 7
  end
end
