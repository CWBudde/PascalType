unit FontExplorerMain;

interface

{$I PT_Compiler.inc}

{.$DEFINE ShowContours}
{$DEFINE ShowOpenType}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, StdCtrls, ExtCtrls, ToolWin, ActnList, StdActns, AppEvnts,
  ImgList, PT_Types, PT_Classes, PT_Tables, PT_CharacterMap, PT_TablesTrueType,
  PT_TablesOptional, PT_TablesBitmap, PT_TablesApple, PT_TablesShared,
  {$IFDEF ShowOpenType}
  PT_TablesOpenType,
  {$ENDIF}
  PT_TablesFontForge, PT_Storage, PT_StorageSFNT, PT_ByteCodeInterpreter,
  PT_UnicodeNames, PT_FontEngine, PT_PanoseClassifications, PT_Windows, 
  FE_FontHeader;

type
  TFmTTF = class(TForm)
    AcEditCopy: TEditCopy;
    AcEditCut: TEditCut;
    AcEditPaste: TEditPaste;
    AcEditUndo: TEditUndo;
    AcFileExit: TFileExit;
    AcFileOpen: TFileOpen;
    AcFileSaveAs: TFileSaveAs;
    ActionList: TActionList;
    CbFontSize: TComboBox;
    CoolBar: TCoolBar;
    FontDialog: TFontDialog;
    FrFontHeader: TFrameFontHeader;
    LbFontSize: TLabel;
    ListBox: TListBox;
    ListView: TListView;
    MainMenu: TMainMenu;
    MIAbout: TMenuItem;
    MIArial: TMenuItem;
    MIArialBold: TMenuItem;
    MIArialBoldItalic: TMenuItem;
    MIArialItalic: TMenuItem;
    MIArialRegular: TMenuItem;
    MiCopy: TMenuItem;
    MICourierNew: TMenuItem;
    MICourierNewBold: TMenuItem;
    MICourierNewBoldItalic: TMenuItem;
    MICourierNewItalic: TMenuItem;
    MICourierRegular: TMenuItem;
    MICut: TMenuItem;
    MIEdit: TMenuItem;
    MIExit: TMenuItem;
    MIFile: TMenuItem;
    MIHelp: TMenuItem;
    MIInternal: TMenuItem;
    MINew: TMenuItem;
    MIOpen: TMenuItem;
    MiOpenDefaultFonts: TMenuItem;
    MIOpenFromInstalled: TMenuItem;
    MIPaste: TMenuItem;
    MISave: TMenuItem;
    MISaveAs: TMenuItem;
    MIStatusBar: TMenuItem;
    MITimesNewRoman: TMenuItem;
    MITimesNewRomanBold: TMenuItem;
    MITimesNewRomanBoldItalic: TMenuItem;
    MITimesNewRomanItalic: TMenuItem;
    MITimesNewRomanRegular: TMenuItem;
    MIToolbar: TMenuItem;
    MIUndo: TMenuItem;
    MIView: TMenuItem;
    MIWingdings: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PaintBox: TPaintBox;
    PnMain: TPanel;
    PnPaintBox: TPanel;
    Splitter: TSplitter;
    StatusBar: TStatusBar;
    TbCopy: TToolButton;
    TbCut: TToolButton;
    TbOpen: TToolButton;
    TbPaste: TToolButton;
    TbSplit1: TToolButton;
    TbSplit2: TToolButton;
    ToolBar: TToolBar;
    ToolbarImages: TImageList;
    TreeView: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcFileOpenAccept(Sender: TObject);
    procedure CbFontSizeChange(Sender: TObject);
    procedure MIArialBoldClick(Sender: TObject);
    procedure MIArialBoldItalicClick(Sender: TObject);
    procedure MIArialItalicClick(Sender: TObject);
    procedure MIArialRegularClick(Sender: TObject);
    procedure MICourierNewBoldClick(Sender: TObject);
    procedure MICourierNewBoldItalicClick(Sender: TObject);
    procedure MICourierNewItalicClick(Sender: TObject);
    procedure MICourierRegularClick(Sender: TObject);
    procedure MIInternalClick(Sender: TObject);
    procedure MIOpenFromInstalledClick(Sender: TObject);
    procedure MIStatusBarClick(Sender: TObject);
    procedure MITimesNewRomanBoldClick(Sender: TObject);
    procedure MITimesNewRomanBoldItalicClick(Sender: TObject);
    procedure MITimesNewRomanItalicClick(Sender: TObject);
    procedure MITimesNewRomanRegularClick(Sender: TObject);
    procedure MIToolbarClick(Sender: TObject);
    procedure MIWingdingsClick(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    FFontEngine   : TPascalTypeFontEngine;
    FCurrentGlyph : TBitmap;
    FFontSize     : Integer;
    Fppem         : Integer;
    FScaler       : Single;
    procedure SetFontSize(const Value: Integer);
    procedure InitializeDefaultListView;
    procedure FontChanged;
  protected
    procedure ListViewColumns(Columns: Array of string);
    procedure ListViewData(Strings: Array of string);

    procedure DisplayAppleFeatureTable(FeatureTable: TPascalTypeFeatureTable);
    procedure DisplayBitmapLocationTable(BitmapLocationTable: TPascalTypeBitmapLocationTable);
    procedure DisplayBitmapSizeTable(BitmapSizeTable: TPascalTypeBitmapSizeTable);
    procedure DisplayCharacterMapSubTable(CharacterMapSubTable: TCustomPascalTypeCharacterMapDirectory);
    procedure DisplayCharacterMapTable(CharacterMapTable: TPascalTypeCharacterMapTable);
    procedure DisplayControlValueTable(ControlValueTable: TTrueTypeFontControlValueTable);
    procedure DisplayDigitalSignatureBlock(DigitalSignatureBlock: TPascalTypeDigitalSignatureBlock);
    procedure DisplayDigitalSignatureTable(DigitalSignatureTable: TPascalTypeDigitalSignatureTable);
    procedure DisplayEmbeddedBitmapDataTable(BitmapDataTable: TPascalTypeEmbeddedBitmapDataTable);
    procedure DisplayEmbeddedBitmapLocationTable(BitmapLocationTable: TPascalTypeEmbeddedBitmapLocationTable);
    procedure DisplayEmbeddedBitmapScalingTable(BitmapScalingTable: TPascalTypeEmbeddedBitmapScalingTable);
    procedure DisplayExtendedGlyphMetamorphosisTable(ExtendedGlyphMetamorphosisTable: TPascalTypeExtendedGlyphMetamorphosisTable);
    procedure DisplayFontDescriptionTable(FontDescription: TPascalTypeFontDescriptionTable);
    procedure DisplayFontForgeExtensionTable(FontForgeExtensionTable: TPascalTypeFontForgeExtensionTable);
    procedure DisplayFontForgeTimeStampTable(FontForgeTimeStampTable: TPascalTypeFontForgeTimeStampTable);
    procedure DisplayFontInstructionTable(InstructionTable: TCustomTrueTypeFontInstructionTable);
    procedure DisplayFontKerningSubTable(KerningSubtable: TPascalTypeKerningSubTable);
    procedure DisplayFontKerningTable(KerningTable: TPascalTypeKerningTable);
    procedure DisplayGaspTable(GaspTable: TPascalTypeGridFittingAndScanConversionProcedureTable);
    procedure DisplayGlyphData(GlyphData: TCustomTrueTypeFontGlyphData);
    procedure DisplayGlyphDataTable(GlyphDataTable: TTrueTypeFontGlyphDataTable);
    procedure DisplayGlyphInstructionTable(GlyphInstructionTable: TTrueTypeFontGlyphInstructionTable);
    procedure DisplayGlyphPropertiesTable(GlyphProperties: TPascalTypeGlyphPropertiesTable);
    procedure DisplayHeaderTable(HeaderTable: TPascalTypeHeaderTable);
    procedure DisplayHorizontalDeviceMetricsSubTable(HorDevMetricsTable: TPascalTypeHorizontalDeviceMetricsSubTable);
    procedure DisplayHorizontalDeviceMetricsTable(HorDevMetricsTable: TPascalTypeHorizontalDeviceMetricsTable);
    procedure DisplayHorizontalHeader(HorizontalHeaderTable: TPascalTypeHorizontalHeaderTable);
    procedure DisplayHorizontalMetrics(HorizontalMetricsTable: TPascalTypeHorizontalMetricsTable);
    procedure DisplayLinearThresholdTable(LinearThresholdTable: TPascalTypeLinearThresholdTable);
    procedure DisplayLocationTable(LocationTable: TTrueTypeFontLocationTable);
    procedure DisplayMaximumProfileTable(MaximumProfileTable: TPascalTypeMaximumProfileTable);
    procedure DisplayNameAppleTable(NameTable: TPascalTypeNameTable);
    procedure DisplayNameMicrosoftTable(NameTable: TPascalTypeNameTable);
    procedure DisplayNameTable(NameTable: TPascalTypeNameTable);
    procedure DisplayNameUnicodeTable(NameTable: TPascalTypeNameTable);
    procedure DisplayOS2Table(OS2Table: TPascalTypeOS2Table);
    procedure DisplayOS2PanoseTable(OS2Panose: TCustomPascalTypePanoseTable);
    procedure DisplayOS2UnicodeRangeTable(OS2UnicodeRange: TPascalTypeUnicodeRangeTable);
    procedure DisplayOS2CodePageRangeTable(OS2CodePageRange: TPascalTypeOS2CodePageRangeTable);
    procedure DisplayPCL5Table(PCL5Table: TPascalTypePCL5Table);
    procedure DisplayPostscriptTable(PostscriptTable: TPascalTypePostscriptTable);
    procedure DisplayPostscriptV2Table(PostscriptTable: TPascalTypePostscriptVersion2Table);
    procedure DisplayVerticalDeviceMetricsTable(VerticalDeviceMetricsTable: TPascalTypeVerticalDeviceMetricsTable);
    procedure DisplayVerticalHeader(VerticalHeaderTable: TPascalTypeVerticalHeaderTable);

    {$IFDEF ShowOpenType}
    procedure DisplayGlyphDefinitionTable(GlyphDefinitionTable: TOpenTypeGlyphDefinitionTable);
    procedure DisplayJustificationTable(JustificationTable: TOpenTypeJustificationTable);
    procedure DisplayOpenTypeCommonTable(OpenTypeCommonTable: TCustomOpenTypeCommonTable);
    procedure DisplayOpenTypeFeatureListTable(FeatureListTable: TOpenTypeFeatureListTable);
    procedure DisplayOpenTypeLookUpListTable(LookUpListTable: TOpenTypeLookupListTable);
    procedure DisplayOpenTypeScriptListTable(ScriptListTable: TOpenTypeScriptListTable);
    procedure DisplayCustomOpenTypeScriptTable(ScriptTable: TCustomOpenTypeScriptTable);
    procedure DisplayCustomOpenTypeLanguageSystemTable(LanguageSystemTable: TCustomOpenTypeLanguageSystemTable);
    procedure DisplayCustomOpenTypeFeatureTable(FeatureTable: TCustomOpenTypeFeatureTable);
    procedure DisplayCustomOpenTypeClassDefinitionTable(ClasDefinitionTable: TCustomOpenTypeClassDefinitionTable);
    procedure DisplayOpenTypeMarkGlyphSetTable(MarkGlyphSetTable: TOpenTypeMarkGlyphSetTable);
    procedure DisplayOpenTypeLookupTable(LookupTable: TOpenTypeLookupTable);
    {$ENDIF}

    procedure DisplayGlyphDataPoints(SimpleGlyphData: TTrueTypeFontSimpleGlyphData);
    procedure DisplayGlyphDataSimpleOutline(SimpleGlyphData: TTrueTypeFontSimpleGlyphData);
    procedure DisplayGlyphDataCompositeOutline(CompositeGlyphData: TTrueTypeFontCompositeGlyphData);
    procedure DisplayGlyphDataContour(Contour: TPascalTypeTrueTypeContour);

    procedure FontSizeChanged;
  public
    procedure LoadFromFile(Filename: TFileName);
    procedure LoadFromStream(Stream: TStream);

    property FontSize: Integer read FFontSize write SetFontSize;
  end;

var
  FmTTF: TFmTTF;

implementation

{$R *.dfm}

uses
  Inifiles, Math, Types;

procedure TFmTTF.FormCreate(Sender: TObject);
var
  PWindowsDir: array [0..MAX_PATH] of Char;
begin
 Application.OnHint := ShowHint;

 GetWindowsDirectory(PWindowsDir, MAX_PATH);
 AcFileOpen.Dialog.InitialDir := GetFontDirectory;

 FFontEngine := TPascalTypeFontEngine.Create;

 FCurrentGlyph := TBitmap.Create;
 FCurrentGlyph.PixelFormat := pf8bit;
 FFontSize := 96;
 FontSizeChanged;
end;

procedure TFmTTF.FormDestroy(Sender: TObject);
begin
 // free pascal type Storage
 FreeAndNil(FFontEngine);

 // free current glyph display bitmap
 FreeAndNil(FCurrentGlyph);
end;

procedure TFmTTF.FormShow(Sender: TObject);
begin
 if FileExists(ParamStr(1))
  then LoadFromFile(ParamStr(1))
  else LoadFromFile(GetFontDirectory + '\cour.ttf');
end;

procedure TFmTTF.FontSizeChanged;
begin
 Fppem := FFontSize * PixelsPerInch div 72;
 FScaler := Fppem / FFontEngine.Storage.HeaderTable.UnitsPerEm;
end;

procedure TFmTTF.InitializeDefaultListView;
begin
 // add columns
 ListViewColumns(['Name', 'Value']);
end;

procedure TFmTTF.ListViewColumns(Columns: array of string);
var
  ColumnIndex : Integer;
begin
 // clear list view
 ListView.Clear;

 // clear columns
 ListView.Columns.Clear;

 // add column
 for ColumnIndex := 0 to Length(Columns) - 1 do
  with ListView.Columns.Add do
   begin
    Caption := Columns[ColumnIndex];
    Width := Min(256, (ListView.Width - 16) div (Length(Columns)));
    MinWidth := 64;
    AutoSize := True;
   end;
end;

procedure TFmTTF.ListViewData(Strings: array of string);
var
  ValueIndex : Integer;
begin
 // add data
 with ListView.Items.Add do
  begin
   Caption := Strings[0];
   for ValueIndex := 1 to Length(Strings) - 1
    do SubItems.Add(Strings[ValueIndex]);
  end;
end;

procedure TFmTTF.SetFontSize(const Value: Integer);
begin
 if FFontSize <> Value then
  begin
   FFontSize := Value;
   FontSizeChanged;
  end;
end;

procedure TFmTTF.ShowHint(Sender: TObject);
begin
 if Length(Application.Hint) > 0 then
  begin
   StatusBar.SimplePanel := True;
   StatusBar.SimpleText := Application.Hint;
  end
 else StatusBar.SimplePanel := False;
end;

procedure TFmTTF.AcFileOpenAccept(Sender: TObject);
begin
 LoadFromFile(AcFileOpen.Dialog.Filename);
end;

procedure TFmTTF.MIStatusBarClick(Sender: TObject);
begin
 MIStatusBar.Checked := not MIStatusBar.Checked;
 StatusBar.Visible := MIStatusBar.Checked;
end;

procedure TFmTTF.MIToolbarClick(Sender: TObject);
begin
 MIToolbar.Checked := not MIToolbar.Checked;
 CoolBar.Visible := MIToolbar.Checked;
end;

procedure TFmTTF.MIArialRegularClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\Arial.ttf');
end;

procedure TFmTTF.MIArialBoldClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\arialbd.ttf');
end;

procedure TFmTTF.MIArialBoldItalicClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\arialbi.ttf');
end;

procedure TFmTTF.MIArialItalicClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\ariali.ttf');
end;

procedure TFmTTF.MICourierRegularClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\cour.ttf');
end;

procedure TFmTTF.MIInternalClick(Sender: TObject);
var
  ResourceStream : TResourceStream;
begin
 ResourceStream := TResourceStream.Create(HInstance, 'Default', 'TTFFONT');
 try
  LoadFromStream(ResourceStream);
 finally
  FreeAndNil(ResourceStream);
 end;
end;

procedure TFmTTF.MICourierNewBoldClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\courbd.ttf');
end;

procedure TFmTTF.MICourierNewBoldItalicClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\courbi.ttf');
end;

procedure TFmTTF.MICourierNewItalicClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\couri.ttf');
end;

procedure TFmTTF.MITimesNewRomanRegularClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\times.ttf');
end;

procedure TFmTTF.MITimesNewRomanBoldClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\timesbd.ttf');
end;

procedure TFmTTF.MITimesNewRomanItalicClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\timesbi.ttf');
end;

procedure TFmTTF.MITimesNewRomanBoldItalicClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\timesi.ttf');
end;

procedure TFmTTF.MIWingdingsClick(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\wingding.ttf');
end;

procedure TFmTTF.PaintBoxPaint(Sender: TObject);
begin
 PaintBox.Canvas.Draw((PaintBox.Width - FCurrentGlyph.Width) div 2,
   (PaintBox.Height - FCurrentGlyph.Height) div 2, FCurrentGlyph);
end;

procedure TFmTTF.CbFontSizeChange(Sender: TObject);
begin
 FontSize := StrToInt(CbFontSize.Text);
end;

procedure TFmTTF.DisplayBitmapLocationTable(
  BitmapLocationTable: TPascalTypeBitmapLocationTable);
begin
 with BitmapLocationTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayBitmapSizeTable(BitmapSizeTable: TPascalTypeBitmapSizeTable);
var
  str : string;
begin
 with BitmapSizeTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Index Tables Size', IntToStr(IndexTablesSize)]);
   ListViewData(['Number of Index Subtables', IntToStr(NumberOfIndexSubTables)]);
   ListViewData(['Color Reference', IntToStr(ColorRef)]);

   with HorizontalMetrics do
    begin
     ListViewData(['Ascender', IntToStr(Ascender)]);
     ListViewData(['Descender', IntToStr(Descender)]);
     ListViewData(['Maximum width', IntToStr(WidthMax)]);
     ListViewData(['Caret slope Numerator', IntToStr(CaretSlopeNumerator)]);
     ListViewData(['Caret slope Denominator', IntToStr(CaretSlopeDenominator)]);
     ListViewData(['Caret offset', IntToStr(CaretOffset)]);
     ListViewData(['Minimum origin SB', IntToStr(MinOriginSB)]);
     ListViewData(['Minimum advance SB', IntToStr(MinAdvanceSB)]);
     ListViewData(['Maximum before BL', IntToStr(MaxBeforeBL)]);
     ListViewData(['Minimum after BL', IntToStr(MinAfterBL)]);
    end;

   with VerticalMetrics do
    begin
     ListViewData(['Ascender', IntToStr(Ascender)]);
     ListViewData(['Descender', IntToStr(Descender)]);
     ListViewData(['Maximum width', IntToStr(WidthMax)]);
     ListViewData(['Caret slope numerator', IntToStr(CaretSlopeNumerator)]);
     ListViewData(['Caret slope denominator', IntToStr(CaretSlopeDenominator)]);
     ListViewData(['Caret offset', IntToStr(CaretOffset)]);
     ListViewData(['Minimum origin SB', IntToStr(MinOriginSB)]);
     ListViewData(['Minimum advance SB', IntToStr(MinAdvanceSB)]);
     ListViewData(['Maximum before BL', IntToStr(MaxBeforeBL)]);
     ListViewData(['Minimum after BL', IntToStr(MinAfterBL)]);
    end;

   ListViewData(['Start glyph index', IntToStr(StartGlyphIndex)]);
   ListViewData(['End glyph index', IntToStr(EndGlyphIndex)]);
   ListViewData(['ppem X', IntToStr(PpemX)]);
   ListViewData(['ppem Y', IntToStr(PpemY)]);
   case BitDepth of
    1 : ListViewData(['Bit depth', IntToStr(BitDepth) + ' = black/white']);
    2 : ListViewData(['Bit depth', IntToStr(BitDepth) + ' = 4 levels of gray']);
    4 : ListViewData(['Bit depth', IntToStr(BitDepth) + ' = 16 levels of gray']);
    8 : ListViewData(['Bit depth', IntToStr(BitDepth) + ' = 256 levels of gray']);
    else ListViewData(['Bit depth', IntToStr(BitDepth)]);
   end;

   // flags
   if (Flags and 1) <> 0 then str := 'horizontal' else str := '';
   if (Flags and 2) <> 0 then
    if str <> ''
     then str := str + ', vertical'
     else str := 'vertical';
   ListViewData(['Flags', str]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayCharacterMapSubTable(
  CharacterMapSubTable: TCustomPascalTypeCharacterMapDirectory);
var
  GlyphIndex : Integer;
  GlyphName  : string;
  CharIndex  : Word;
begin
 with CharacterMapSubTable do
  begin
   // add columns
   ListViewColumns(['Character', 'Glyph #', 'Description']);

   // set width
   ListView.Columns[0].Width := 64;
   ListView.Columns[1].Width := 64;
   ListView.Columns[2].Width := ListView.Width - 196;

   // begin update (lock)
   ListView.Items.BeginUpdate;

   if CharacterMap is TPascalTypeFormat0CharacterMap then
    for CharIndex := Low(Byte) to High(Byte) do
     with ListView.Items.Add do
      begin
       Caption := IntToStr(CharIndex);
       SubItems.Add(IntToStr(CharacterMap.CharacterToGlyph(CharIndex)));
      end else
   if CharacterMap is TPascalTypeFormat4CharacterMap then
    for CharIndex := $20 to $FFFF do
     begin
      // get glyph index
      GlyphIndex := CharacterMap.CharacterToGlyph(CharIndex);

      if GlyphIndex > 0 then
       begin
        GlyphName := GetUnicodeName(CharIndex);
        if GlyphName <> '' then
         with ListView.Items.Add do
          begin
           Caption := 'U+' + IntToHex(CharIndex, 4);
           SubItems.Add(IntToStr(CharacterMap.CharacterToGlyph(CharIndex)));
           SubItems.Add(GlyphName);
          end;
       end;
     end else
   if CharacterMap is TPascalTypeFormat12CharacterMap then
    for CharIndex := $20 to $FFFF do
     begin
      // get glyph index
      GlyphIndex := CharacterMap.CharacterToGlyph(CharIndex);

      if GlyphIndex > 0 then
       begin
        GlyphName := GetUnicodeName(CharIndex);
        if GlyphName <> '' then
         with ListView.Items.Add do
          begin
           Caption := 'U+' + IntToHex(CharIndex, 4);
           SubItems.Add(IntToStr(CharacterMap.CharacterToGlyph(CharIndex)));
           SubItems.Add(GlyphName);
          end;
       end;
     end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayCharacterMapTable(CharacterMapTable: TPascalTypeCharacterMapTable);
begin
 with CharacterMapTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', IntToStr(Version)]);

   // subtable count
   ListViewData(['Subtable Count', IntToStr(CharacterMapSubtableCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayControlValueTable(ControlValueTable: TTrueTypeFontControlValueTable);
var
  ControlValueIndex: Integer;
begin
 with ControlValueTable do
  begin
   // add columns
   ListViewColumns(['Index', 'Value']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   // add control values
   for ControlValueIndex := 0 to ControlValueCount - 1 do
    with ListView.Items.Add do
     begin
      Caption := IntToStr(ControlValueIndex);
      SubItems.Add(IntToStr(ControlValue[ControlValueIndex]));
     end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

{$IFDEF ShowOpenType}
procedure TFmTTF.DisplayCustomOpenTypeClassDefinitionTable(
  ClasDefinitionTable: TCustomOpenTypeClassDefinitionTable);
var
  ClassIndex : Integer;
  GlyphIndex : Integer;
begin
 with ClasDefinitionTable do
  begin
   // add columns
   ListViewColumns(['Glyph #', 'Class', 'Description']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   if ClasDefinitionTable is TOpenTypeClassDefinitionFormat1Table then
    with TOpenTypeClassDefinitionFormat1Table(ClasDefinitionTable) do
     for ClassIndex := 0 to ClassValueCount - 1 do
      with ListView.Items.Add do
       begin
        Caption := IntToStr(StartGlyph + ClassIndex + 1);
        SubItems.Add(IntToStr(ClassValue[ClassIndex]));
        case ClassValue[ClassIndex] of
         1 : SubItems.Add('Base glyph');
         2 : SubItems.Add('Ligature glyph');
         3 : SubItems.Add('Mark glyph');
         4 : SubItems.Add('Component glyph');
        end;
       end
    else
   if ClasDefinitionTable is TOpenTypeClassDefinitionFormat2Table then
    with TOpenTypeClassDefinitionFormat2Table(ClasDefinitionTable) do
     for ClassIndex := 0 to ClassRangeRecordCount - 1 do
      with ClassRangeRecord[ClassIndex] do
       for GlyphIndex := StartGlyph to EndGlyph - 1 do
        with ListView.Items.Add do
         begin
          Caption := IntToStr(GlyphIndex + 1);
          SubItems.Add(IntToStr(GlyphClass));
          case GlyphClass of
           1 : SubItems.Add('Base glyph');
           2 : SubItems.Add('Ligature glyph');
           3 : SubItems.Add('Mark glyph');
           4 : SubItems.Add('Component glyph');
          end;
         end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeMarkGlyphSetTable(
  MarkGlyphSetTable: TOpenTypeMarkGlyphSetTable);
var
  CoverageIndex : Integer;
begin
 with MarkGlyphSetTable do
  begin
   InitializeDefaultListView;

   // begin update (lock)
   ListView.Items.BeginUpdate;

   // add coverage offset
   for CoverageIndex := 0 to CoverageCount - 1 do
    with ListView.Items.Add do
     begin
      Caption := 'Coverage Offset - #' + IntToStr(CoverageIndex);
      SubItems.Add(IntToStr(Coverage[CoverageIndex]));
     end;

   // end update (lock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayCustomOpenTypeFeatureTable(
  FeatureTable: TCustomOpenTypeFeatureTable);
begin
 with FeatureTable do
  begin
   InitializeDefaultListView;

   // add Feature Parameters
   ListViewData(['Feature Parameters', IntToStr(FeatureParams)]);

   // add Number of Lookups
   ListViewData(['Number of Lookups', IntToStr(LookupListCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayCustomOpenTypeLanguageSystemTable(
  LanguageSystemTable: TCustomOpenTypeLanguageSystemTable);
begin
 with LanguageSystemTable do
  begin
   InitializeDefaultListView;

   // add lookup order
   ListViewData(['Lookup Order', IntToStr(LookupOrder)]);

   // eventually add Required Feature Index
   if RequiredFeatureIndex <> $FFFF then
    with ListView.Items.Add do
     begin
      Caption := 'Required Feature Index';
      SubItems.Add(IntToStr(RequiredFeatureIndex));
     end;

   // add number of features
   ListViewData(['Number of Features', IntToStr(FeatureIndexCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayCustomOpenTypeScriptTable(
  ScriptTable: TCustomOpenTypeScriptTable);
begin
 with ScriptTable do
  begin
   InitializeDefaultListView;

   // add Number of Language Systems
   ListViewData(['Number of (non default) Language Systems', IntToStr(LanguageSystemTableCount)]);

   ListView.BringToFront;
  end;
end;
{$ENDIF}

procedure TFmTTF.DisplayDigitalSignatureBlock(
  DigitalSignatureBlock: TPascalTypeDigitalSignatureBlock);
begin
 with DigitalSignatureBlock do
  begin
   InitializeDefaultListView;

   // add Reserved 1
   ListViewData(['Reserved 1', IntToStr(Reserved1)]);

   // add Reserved 2
   ListViewData(['Reserved 2', IntToStr(Reserved2)]);

   // add Signature Length
   ListViewData(['Signature Length', IntToStr(SignatureLength) + ' byte']);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayDigitalSignatureTable(
  DigitalSignatureTable: TPascalTypeDigitalSignatureTable);
begin
 with DigitalSignatureTable do
  begin
   InitializeDefaultListView;

   // add Version
   ListViewData(['Version', IntToStr(Version)]);

   // eventually add flags
   if Flags <> [] then
    with ListView.Items.Add do
     begin
      Caption := 'Flags';
      SubItems.Add('cannot be resigned');
     end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayAppleFeatureTable(FeatureTable: TPascalTypeFeatureTable);
begin
 with FeatureTable do
  begin
   InitializeDefaultListView;

   // add Version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayExtendedGlyphMetamorphosisTable(
  ExtendedGlyphMetamorphosisTable: TPascalTypeExtendedGlyphMetamorphosisTable);
begin
 with ExtendedGlyphMetamorphosisTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   // add chain count
   ListViewData(['Subchains', IntToStr(ChainCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayEmbeddedBitmapDataTable(
  BitmapDataTable: TPascalTypeEmbeddedBitmapDataTable);
begin
 with BitmapDataTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayEmbeddedBitmapLocationTable(
  BitmapLocationTable: TPascalTypeEmbeddedBitmapLocationTable);
begin
 with BitmapLocationTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayEmbeddedBitmapScalingTable(
  BitmapScalingTable: TPascalTypeEmbeddedBitmapScalingTable);
begin
 with BitmapScalingTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayFontForgeTimeStampTable(
  FontForgeTimeStampTable: TPascalTypeFontForgeTimeStampTable);
begin
 with FontForgeTimeStampTable do
  begin
   InitializeDefaultListView;

   // show version
   ListViewData(['Version', IntToStr(Version)]);

   // show time stamp date
   ListViewData(['Time Stamp', DateTimeToStr(TimeStamp / 86400 + EncodeDate(1904, 1, 1))]);

   // show creation date
   ListViewData(['Font Created', DateTimeToStr(CreationDate / 86400 + EncodeDate(1904, 1, 1))]);

   // show modification date
   ListViewData(['Font Modified', DateTimeToStr(ModifiedDate / 86400 + EncodeDate(1904, 1, 1))]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayFontDescriptionTable(
  FontDescription: TPascalTypeFontDescriptionTable);
begin
 with FontDescription do
  begin
   InitializeDefaultListView;

   // show version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphPropertiesTable(GlyphProperties: TPascalTypeGlyphPropertiesTable);
begin
 with GlyphProperties do
  begin
   InitializeDefaultListView;

   // show version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayFontForgeExtensionTable(
  FontForgeExtensionTable: TPascalTypeFontForgeExtensionTable);
begin
 with FontForgeExtensionTable do
  begin
   InitializeDefaultListView;

   // show version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayFontInstructionTable(
  InstructionTable: TCustomTrueTypeFontInstructionTable);
var
  TempStream : TMemoryStream;
begin
 with InstructionTable do
  begin
   ListBox.Clear;
   TempStream := TMemoryStream.Create;
   try
    // write instructions to memory stream
    SaveToStream(TempStream);

    // set stream position to start
    TempStream.Seek(0, soFromBeginning);

    // translate byte code stream
    ByteCodeToStrings(TempStream, ListBox.Items);
   finally
    FreeAndNil(TempStream);
   end;

   ListBox.BringToFront;
  end;
end;

procedure TFmTTF.DisplayFontKerningSubTable(
  KerningSubtable: TPascalTypeKerningSubTable);
var
  GlyphIndex : Integer;
begin
 with KerningSubtable do
  begin
   // add columns
   ListViewColumns(['Left Glyph #', 'Right Glyph #', 'Value']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   if FormatTable is TPascalTypeKerningFormat0SubTable then
    with TPascalTypeKerningFormat0SubTable(FormatTable) do
     for GlyphIndex := 0 to PairCount - 1 do
      with ListView.Items.Add do
       begin
        Caption := IntToStr(Pair[GlyphIndex].Left);
        SubItems.Add(IntToStr(Pair[GlyphIndex].Right));
        SubItems.Add(IntToStr(Pair[GlyphIndex].Value));
       end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayFontKerningTable(
  KerningTable: TPascalTypeKerningTable);
begin
 with KerningTable do
  begin
   InitializeDefaultListView;

   // show version
   ListViewData(['Version', IntToStr(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGaspTable(
  GaspTable: TPascalTypeGridFittingAndScanConversionProcedureTable);
var
  RangeIndex : Integer;
  LastPPEM   : Integer;
begin
 with GaspTable do
  begin
   // add columns
   ListViewColumns(['Range (ppem)', 'Behaviour']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   LastPPEM := 0;

   for RangeIndex := 0 to RangeCount - 1 do
    with ListView.Items.Add do
     begin
      if RangeIndex = 0
       then Caption := 'up to ' + IntToStr(Range[RangeIndex].MaxPPEM) else
      if RangeIndex + 1 = RangeCount
       then Caption := IntToStr(LastPPEM + 1) + ' and above'
       else Caption := IntToStr(LastPPEM + 1) + ' - ' + IntToStr(Range[RangeIndex].MaxPPEM);

      LastPPEM := Range[RangeIndex].MaxPPEM;

      case Range[RangeIndex].GaspFlag of
       0 : SubItems.Add('0: -');
       1 : SubItems.Add('1: hinted');
       2 : SubItems.Add('2: smoothed');
       3 : SubItems.Add('3: hinted + smoothed');
       else SubItems.Add('unknown: ' + IntToStr(Range[RangeIndex].GaspFlag));
      end;
     end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphData(GlyphData: TCustomTrueTypeFontGlyphData);
begin
 with GlyphData do
  begin
   InitializeDefaultListView;

   // show number of contours
   ListViewData(['Number Of Contours', IntToStr(NumberOfContours)]);

   // show minimum x for coordinate data
   ListViewData(['Minimum x for coordinate data', IntToStr(XMin)]);

   // show minimum y for coordinate data
   ListViewData(['Minimum y for coordinate data', IntToStr(YMin)]);

   // show maximum x for coordinate data
   ListViewData(['Maximum x for coordinate data', IntToStr(XMax)]);

   // show maximum y for coordinate data
   ListViewData(['Maximum y for coordinate data', IntToStr(YMax)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphDataTable(GlyphDataTable: TTrueTypeFontGlyphDataTable);
begin
 with GlyphDataTable do
  begin
   InitializeDefaultListView;

   // add number of glyphs
   ListViewData(['Number of Glyphs', IntToStr(GlyphDataCount)]);

   ListView.BringToFront;
  end;
end;

{$IFDEF ShowOpenType}
procedure TFmTTF.DisplayGlyphDefinitionTable(
  GlyphDefinitionTable: TOpenTypeGlyphDefinitionTable);
begin
 with GlyphDefinitionTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;
{$ENDIF}

procedure TFmTTF.DisplayGlyphInstructionTable(
  GlyphInstructionTable: TTrueTypeFontGlyphInstructionTable);
var
  TempStream : TMemoryStream;
begin
 with GlyphInstructionTable do
  begin
   ListBox.Clear;
   TempStream := TMemoryStream.Create;
   try
    // write instructions to memory stream
    SaveToStream(TempStream);

    // set stream position to beyond the length mark
    TempStream.Seek(2, soFromBeginning);

    // translate byte code stream
    ByteCodeToStrings(TempStream, ListBox.Items);
   finally
    FreeAndNil(TempStream);
   end;

   ListBox.BringToFront;
  end;
end;

procedure TFmTTF.DisplayHeaderTable(HeaderTable: TPascalTypeHeaderTable);
begin
 with FrFontHeader, HeaderTable do
  begin
   EdFontRevision.Text := VersionToString(FontRevision);
   EdUnitsPerEm.Text := IntToStr(UnitsPerEm);
   EdLowestRecPPEM.Text := IntToStr(LowestRecPPEM);

   CbFontDirection.ItemIndex := Integer(FontDirectionHint) + 2;

   CbBold.Checked := msBold in MacStyle;
   CbItalic.Checked := msItalic in MacStyle;
   CbUnderline.Checked := msUnderline in MacStyle;
   CbShadow.Checked := msShadow in MacStyle;
   CbCondensed.Checked := msCondensed in MacStyle;
   CbExtended.Checked := msExtended in MacStyle;

   CbBaselineAtZero.Checked := htfZeroSpecBaseline in Flags;
   CbAdvancedWidthInstructions.Checked := htfAdvanceWidth in Flags;
   CbFontConverted.Checked := htfFontConverted in Flags;
   CbLosslessFontData.Checked := htfLossless in Flags;
   CbForceppEm.Checked := htfIntegerScaling in Flags;
   CbLeftSidebearing.Checked := htfXPosLSB in Flags;
   CbPointSizeInstructions.Checked := htfScaledSizeDiffers in Flags;
   CbVerticalFont.Checked := htfVertical in Flags;
   CbLinguisticRendering.Checked := htfLinguistic in Flags;

   CbCreated.DateTime := CreatedDate / 86400 + EncodeDate(1904, 1, 1);
   CbModified.DateTime := ModifiedDate / 86400 + EncodeDate(1904, 1, 1);

   BringToFront;
  end;
end;

procedure TFmTTF.DisplayHorizontalHeader(HorizontalHeaderTable: TPascalTypeHorizontalHeaderTable);
begin
 with HorizontalHeaderTable do
  begin
   InitializeDefaultListView;

   // add typographic ascent
   ListViewData(['Typographic Ascent', IntToStr(Ascent)]);

   // add typographic descent
   ListViewData(['Typographic Descent', IntToStr(Descent)]);

   // add line gap
   ListViewData(['Line Gap', IntToStr(LineGap)]);

   // add maximum advance width
   ListViewData(['Maximum Advance Width', IntToStr(AdvanceWidthMax)]);

   // add minimum left sidebearing
   ListViewData(['Minimum Left Sidebearing', IntToStr(MinLeftSideBearing)]);

   // add Minimum Right Sidebearing
   ListViewData(['Minimum Right Sidebearing', IntToStr(MinRightSideBearing)]);

   // add Maximum Extend (horizontal)
   ListViewData(['Maximum Extend (Horizontal)', IntToStr(XMaxExtent)]);

   // add Caret Slope Rise
   ListViewData(['Caret Slope Rise', IntToStr(CaretSlopeRise)]);

   // add Caret Slope Run
   ListViewData(['Caret Slope Run', IntToStr(CaretSlopeRun)]);

   // add Caret Offset
   ListViewData(['Caret Offset', IntToStr(CaretOffset)]);

   // add Metric Data Format
   ListViewData(['Metric Data Format', IntToStr(MetricDataFormat)]);

   // add Num Of Long Hor Metrics
   ListViewData(['NumOfLongHorMetrics', IntToStr(NumOfLongHorMetrics)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayHorizontalMetrics(HorizontalMetricsTable: TPascalTypeHorizontalMetricsTable);
var
  HorizontalMetricIndex : Integer;  
begin
 with HorizontalMetricsTable do
  begin
   // add columns
   ListViewColumns(['Glyph #', 'Advanced Width', 'Left Side Bearing']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   for HorizontalMetricIndex := 0 to HorizontalMetricCount - 1 do
    with ListView.Items.Add do
     begin
      Caption := IntToStr(HorizontalMetricIndex);
      SubItems.Add(IntToStr(HorizontalMetric[HorizontalMetricIndex].AdvanceWidth));
      SubItems.Add(IntToStr(HorizontalMetric[HorizontalMetricIndex].Bearing));
     end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayHorizontalDeviceMetricsTable(
  HorDevMetricsTable: TPascalTypeHorizontalDeviceMetricsTable);
begin
 with HorDevMetricsTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', IntToStr(Version)]);

   // add number of device record count
   ListViewData(['Number of Device Records', IntToStr(DeviceRecordCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayHorizontalDeviceMetricsSubTable(
  HorDevMetricsTable: TPascalTypeHorizontalDeviceMetricsSubTable);
var
  WidthIndex : Integer;
begin
 with HorDevMetricsTable do
  begin
   InitializeDefaultListView;

   // add ppem
   ListViewData(['Pixels per Em', IntToStr(ppem)]);

   // add maximum width
   ListViewData(['Maximum Width', IntToStr(MaxWidth)]);

   // list widths
   for WidthIndex := 0 to WidthCount - 1
    do ListViewData(['Width #' + IntToStr(WidthIndex), IntToStr(Width[WidthIndex])]);

   ListView.BringToFront;
  end;
end;

{$IFDEF ShowOpenType}
procedure TFmTTF.DisplayJustificationTable(
  JustificationTable: TOpenTypeJustificationTable);
begin
 with JustificationTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   // add script count
   ListViewData(['Number of Scripts', IntToStr(ScriptCount)]);

   ListView.BringToFront;
  end;
end;
{$ENDIF}

procedure TFmTTF.DisplayLinearThresholdTable(
  LinearThresholdTable: TPascalTypeLinearThresholdTable);
var
  VerticalPenIndex : Integer;
begin
 with LinearThresholdTable do
  begin
   // add columns
   ListViewColumns(['Glyph #', 'Value']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   // add thresholds
   for VerticalPenIndex := 0 to VerticalPelCount - 1 do
    with ListView.Items.Add do
     begin
      Caption := IntToStr(VerticalPenIndex + 1);
      SubItems.Add(IntToStr(VerticalPel[VerticalPenIndex]));
     end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   // bring listview to front
   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayLocationTable(LocationTable: TTrueTypeFontLocationTable);
var
  LocationIndex : Integer;
begin
 with LocationTable do
  begin
   // add columns
   ListViewColumns(['Glyph #', 'Offset']);

   // add locations
   for LocationIndex := 0 to LocationCount - 1 do
    with ListView.Items.Add do
     begin
      Caption := IntToStr(LocationIndex);
      SubItems.Add(IntToHex(Location[LocationIndex], 8));
     end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayMaximumProfileTable(
  MaximumProfileTable: TPascalTypeMaximumProfileTable);
begin
 with MaximumProfileTable do
  begin
   InitializeDefaultListView;

   // add Number of Glyphs
   ListViewData(['Number of Glyphs', IntToStr(NumGlyphs)]);

   // add Maximum Points (non-composite)
   ListViewData(['Maximum Points (non-composite)', IntToStr(MaxPoints)]);

   // add Maximum Contours (non-composite)
   ListViewData(['Maximum Contours (non-composite)', IntToStr(MaxContours)]);

   // add Maximum Points (composite)
   ListViewData(['Maximum Points (composite)', IntToStr(MaxCompositePoints)]);

   // add Maximum Contours
   ListViewData(['Maximum Contours (composite)', IntToStr(MaxCompositeContours)]);

   // add Maximum Zones
   ListViewData(['Maximum Zones', IntToStr(MaxZones)]);

   // add Maximum Twilight Points (in Z0)
   ListViewData(['Maximum Twilight Points', IntToStr(MaxTwilightPoints)]);

   // add Maximum Storage Area Locations
   ListViewData(['Maximum Storage Area Locations', IntToStr(MaxStorage)]);

   // add Maximum Function Definitions (FDEF)
   ListViewData(['Maximum Function Definitions (FDEF)', IntToStr(MaxFunctionDefs)]);

   // add Maximum Instruction Definitions (IDEF)
   ListViewData(['Maximum Instruction Definitions (IDEF)', IntToStr(MaxInstructionDefs)]);

   // add Maximum Stack Elements
   ListViewData(['Maximum Stack Elements', IntToStr(MaxStackElements)]);

   // add Maximum Size of Glyph Instruction
   ListViewData(['Maximum Size of Glyph Instruction', IntToStr(MaxSizeOfInstruction)]);

   // add Maximum Number of Components
   ListViewData(['Maximum Number of Components', IntToStr(MaxComponentElements)]);

   // add Maximum Component Depth
   ListViewData(['Maximum Component Depth', IntToStr(MaxComponentDepth)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayNameTable(NameTable: TPascalTypeNameTable);
var
  str      : string;
  StrIndex : Integer;
begin
 with NameTable do
  begin
   InitializeDefaultListView;

   // add version number
   ListViewData(['Format', IntToStr(Format)]);

   for StrIndex := 0 to NameSubTableCount - 1 do
    with ListView.Items.Add do
     begin
      case NameSubTable[StrIndex].PlatformID of
       piApple: str := 'Apple';
       piUnicode: str := 'Unicode';
       piMicrosoft: str := 'Microsoft';
      end;

      case NameSubTable[StrIndex].NameID of
       niCopyrightNotice    : str := str + ' - Copyright Notice';
       niFamily             : str := str + ' - Family';
       niSubfamily          : str := str + ' - Subfamily';
       niUniqueIdentifier   : str := str + ' - Unique Identifier';
       niFullName           : str := str + ' - Full Name';
       niVersion            : str := str + ' - Version';
       niPostscriptName     : str := str + ' - Postscript Name';
       niTrademark          : str := str + ' - Trademark';
       niVendorName         : str := str + ' - Vendor Name';
       niDesignerName       : str := str + ' - Designer Name';
       niDescription        : str := str + ' - Description';
       niVendorURL          : str := str + ' - Vendor URL';
       niDesignerURL        : str := str + ' - Designer URL';
       niLicenseDescription : str := str + ' - License Description';
       niLicenseInformation : str := str + ' - License Information';
       niReserved           : str := str + ' - Reserved';
       niPreferredFamily    : str := str + ' - Preferred Family';
       niPreferredSubfamily : str := str + ' - Preferred Subfamily';
       niCompatibleFull     : str := str + ' - Compatible Full';
       niSampleText         : str := str + ' - Sample Text';
       niFutureExpansion    : str := str + ' - Future Expansion';
       niFontSpecific       : str := str + ' - Font Specific';
       else str := str + ' - String #' + IntToStr(StrIndex + 1);
      end;

      Caption := str;
      SubItems.Add(NameSubTable[StrIndex].Name);
     end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayNameAppleTable(NameTable: TPascalTypeNameTable);
var
  StrIndex : Integer;
begin
 with NameTable do
  begin
   InitializeDefaultListView;

   for StrIndex := 0 to NameSubTableCount - 1 do
    begin
     case NameSubTable[StrIndex].PlatformID of
      piUnicode: Continue;
      piMicrosoft: Continue;
     end;

     with ListView.Items.Add do
      begin
       case NameSubTable[StrIndex].NameID of
        niCopyrightNotice    : Caption := 'Copyright Notice';
        niFamily             : Caption := 'Family';
        niSubfamily          : Caption := 'Subfamily';
        niUniqueIdentifier   : Caption := 'Unique Identifier';
        niFullName           : Caption := 'Full Name';
        niVersion            : Caption := 'Version';
        niPostscriptName     : Caption := 'Postscript Name';
        niTrademark          : Caption := 'Trademark';
        niVendorName         : Caption := 'Vendor Name';
        niDesignerName       : Caption := 'Designer Name';
        niDescription        : Caption := 'Description';
        niVendorURL          : Caption := 'Vendor URL';
        niDesignerURL        : Caption := 'Designer URL';
        niLicenseDescription : Caption := 'License Description';
        niLicenseInformation : Caption := 'License Information';
        niReserved           : Caption := 'Reserved';
        niPreferredFamily    : Caption := 'Preferred Family';
        niPreferredSubfamily : Caption := 'Preferred Subfamily';
        niCompatibleFull     : Caption := 'Compatible Full';
        niSampleText         : Caption := 'Sample Text';
        niFutureExpansion    : Caption := 'Future Expansion';
        niFontSpecific       : Caption := 'Font Specific';
        else Caption := 'String #' + IntToStr(StrIndex + 1);
       end;

       SubItems.Add(NameSubTable[StrIndex].Name);
      end;
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayNameUnicodeTable(NameTable: TPascalTypeNameTable);
var
  StrIndex : Integer;
begin
 with NameTable do
  begin
   InitializeDefaultListView;

   for StrIndex := 0 to NameSubTableCount - 1 do
    begin
     case NameSubTable[StrIndex].PlatformID of
       piApple: Continue;
       piMicrosoft: Continue;
      end;

     with ListView.Items.Add do
      begin
       case NameSubTable[StrIndex].NameID of
        niCopyrightNotice    : Caption := 'Copyright Notice';
        niFamily             : Caption := 'Family';
        niSubfamily          : Caption := 'Subfamily';
        niUniqueIdentifier   : Caption := 'Unique Identifier';
        niFullName           : Caption := 'Full Name';
        niVersion            : Caption := 'Version';
        niPostscriptName     : Caption := 'Postscript Name';
        niTrademark          : Caption := 'Trademark';
        niVendorName         : Caption := 'Vendor Name';
        niDesignerName       : Caption := 'Designer Name';
        niDescription        : Caption := 'Description';
        niVendorURL          : Caption := 'Vendor URL';
        niDesignerURL        : Caption := 'Designer URL';
        niLicenseDescription : Caption := 'License Description';
        niLicenseInformation : Caption := 'License Information';
        niReserved           : Caption := 'Reserved';
        niPreferredFamily    : Caption := 'Preferred Family';
        niPreferredSubfamily : Caption := 'Preferred Subfamily';
        niCompatibleFull     : Caption := 'Compatible Full';
        niSampleText         : Caption := 'Sample Text';
        niFutureExpansion    : Caption := 'Future Expansion';
        niFontSpecific       : Caption := 'Font Specific';
        else Caption := 'String #' + IntToStr(StrIndex + 1);
       end;

       SubItems.Add(NameSubTable[StrIndex].Name);
      end;
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayNameMicrosoftTable(NameTable: TPascalTypeNameTable);
var
  StrIndex : Integer;
begin
 with NameTable do
  begin
   InitializeDefaultListView;

   for StrIndex := 0 to NameSubTableCount - 1 do
    begin
     case NameSubTable[StrIndex].PlatformID of
      piUnicode: Continue;
      piApple: Continue;
     end;

     with ListView.Items.Add do
      begin
       case NameSubTable[StrIndex].NameID of
        niCopyrightNotice    : Caption := 'Copyright Notice';
        niFamily             : Caption := 'Family';
        niSubfamily          : Caption := 'Subfamily';
        niUniqueIdentifier   : Caption := 'Unique Identifier';
        niFullName           : Caption := 'Full Name';
        niVersion            : Caption := 'Version';
        niPostscriptName     : Caption := 'Postscript Name';
        niTrademark          : Caption := 'Trademark';
        niVendorName         : Caption := 'Vendor Name';
        niDesignerName       : Caption := 'Designer Name';
        niDescription        : Caption := 'Description';
        niVendorURL          : Caption := 'Vendor URL';
        niDesignerURL        : Caption := 'Designer URL';
        niLicenseDescription : Caption := 'License Description';
        niLicenseInformation : Caption := 'License Information';
        niReserved           : Caption := 'Reserved';
        niPreferredFamily    : Caption := 'Preferred Family';
        niPreferredSubfamily : Caption := 'Preferred Subfamily';
        niCompatibleFull     : Caption := 'Compatible Full';
        niSampleText         : Caption := 'Sample Text';
        niFutureExpansion    : Caption := 'Future Expansion';
        niFontSpecific       : Caption := 'Font Specific';
        else Caption := 'String #' + IntToStr(StrIndex + 1);
       end;

       SubItems.Add(NameSubTable[StrIndex].Name);
      end;
    end;

   ListView.BringToFront;
  end;
end;

{$IFDEF ShowOpenType}
procedure TFmTTF.DisplayOpenTypeCommonTable(
  OpenTypeCommonTable: TCustomOpenTypeCommonTable);
begin
 with OpenTypeCommonTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeFeatureListTable(FeatureListTable: TOpenTypeFeatureListTable);
begin
 with FeatureListTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Number of Features', IntToStr(FeatureCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeLookUpListTable(LookUpListTable: TOpenTypeLookupListTable);
begin
 with LookUpListTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Number of Lookups', IntToStr(LookupTableCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeLookupTable(LookupTable: TOpenTypeLookupTable);
begin
 with LookupTable do
  begin
   InitializeDefaultListView;

   // add lookup type
   ListViewData(['Lookup Type', IntToStr(LookupType)]);

   // add lookup flag
   ListViewData(['Lookup Flag', IntToStr(LookupFlag)]);

   // add mark filtering set
   ListViewData(['Mark Filtering Set', IntToStr(MarkFilteringSet)]);

   // add number of lookup sub tables
   ListViewData(['Number of Lookups', IntToStr(SubtableCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeScriptListTable(ScriptListTable: TOpenTypeScriptListTable);
begin
 with ScriptListTable do
  begin
   InitializeDefaultListView;

   // add number of language systems
   ListViewData(['Number of Language Systems', IntToStr(LanguageSystemCount)]);

   ListView.BringToFront;
  end;
end;
{$ENDIF}

procedure TFmTTF.DisplayOS2Table(OS2Table: TPascalTypeOS2Table);
begin
 with OS2Table do
  begin
   InitializeDefaultListView;

   // add version number
   ListViewData(['Version', IntToStr(OS2Table.Version)]);

   // add average weighted advanced width of lower case letters and space
   ListViewData(['Averge weighted escapement', IntToStr(AverageCharacterWidth)]);

   // add visual weight (degree of blackness or thickness) of stroke in glyphs
   with ListView.Items.Add do
    begin
     Caption := 'Weight';
     case OS2Table.Weight of
      100 : SubItems.Add('100 (Thin)');
      200 : SubItems.Add('200 (ExtraLight)');
      300 : SubItems.Add('300 (Light)');
      400 : SubItems.Add('400 (Normal)');
      500 : SubItems.Add('500 (Medium)');
      600 : SubItems.Add('600 (SemiBold)');
      700 : SubItems.Add('700 (Bold)');
      800 : SubItems.Add('800 (ExtraBold)');
      900 : SubItems.Add('900 (Black)');
      else SubItems.Add(IntToStr(Weight));
     end;
    end;

   // add relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in the font
   with ListView.Items.Add do
    begin
     Caption := 'Width';
     case OS2Table.WidthType of
      1 : SubItems.Add('50% (Ultra-condensed)');
      2 : SubItems.Add('62.5% (Extra-condensed)');
      3 : SubItems.Add('75% (Condensed)');
      4 : SubItems.Add('87.5% (Semi-condensed)');
      5 : SubItems.Add('100% (Medium (normal))');
      6 : SubItems.Add('112.5% (Semi-expanded)');
      7 : SubItems.Add('125% (Expanded)');
      8 : SubItems.Add('150% (Extra-expanded)');
      9 : SubItems.Add('200% (Ultra-expanded)');
      else SubItems.Add('Unknown type: ' + IntToStr(OS2Table.WidthType));
     end;
    end;

   // add characteristics and properties of this font (set undefined bits to zero)
   ListViewData(['Font Embedding Rights', FontEmbeddingRightsToString(FontEmbeddingRights)]);

   // add recommended horizontal size in pixels for subscripts
   ListViewData(['Subscript Horizontal Font Size', IntToStr(SubscriptSizeX)]);

   // add recommended vertical size in pixels for subscripts
   ListViewData(['Subscript Vertical Size', IntToStr(SubscriptSizeY)]);

   // add recommended horizontal offset for subscripts
   ListViewData(['SubScript Horizontal Offset', IntToStr(SubscriptOffsetX)]);

   // add recommended vertical offset form the baseline for subscripts
   ListViewData(['Subscript Vertical Offset', IntToStr(SubscriptOffsetY)]);

   // add recommended horizontal size in pixels for superscripts
   ListViewData(['Superscript Horizontal Size', IntToStr(SuperscriptSizeX)]);

   // add recommended vertical size in pixels for superscripts
   ListViewData(['Superscript Vertical Size', IntToStr(SuperscriptSizeY)]);

   // add recommended horizontal offset for superscripts
   ListViewData(['Superscript Horizontal Offset', IntToStr(SuperscriptOffsetX)]);

   // add recommended vertical offset from the baseline for superscripts
   ListViewData(['Superscript Vertical Offset', IntToStr(SuperscriptOffsetY)]);

   // add width of the strikeout stroke
   ListViewData(['Strikeout Size', IntToStr(StrikeoutSize)]);

   // add position of the strikeout stroke relative to the baseline
   ListViewData(['Strikeout Position', IntToStr(StrikeoutPosition)]);

   // add classification of font-family design
   ListViewData(['Font Family Class and Subclass', FontFamilyTypeToString(FontFamilyType)]);

   // add four character identifier for the font vendor
   ListViewData(['Vendor Identification', string(OS2Table.FontVendorID)]);

   // add 2-byte bit field containing information concerning the nature of the font patterns
   ListViewData(['Selection Flags', FontSelectionFlagsToString(FontSelectionFlags)]);

   // add the minimum Unicode index in this font.
   ListViewData(['Minimum Unicode Index', 'U+' + IntToHex(UnicodeFirstCharacterIndex, 4)]);

   // add the maximum Unicode index in this font.
   ListViewData(['Maximum Unicode Index', 'U+' + IntToHex(UnicodeLastCharacterIndex, 4)]);

   // add typographic ascender
   ListViewData(['Typographic Ascender', IntToStr(TypographicAscent)]);

   // add typographic descender
   ListViewData(['Typographic Descender', IntToStr(TypographicDescent)]);

   // add typographic line gap
   ListViewData(['Typographic Line Gap', IntToStr(TypographicLineGap)]);

   // add ascender metric for Windows
   ListViewData(['Ascender for Windows', IntToStr(WindowsAscent)]);

   // add descender metric for Windows
   ListViewData(['Descender for Windows', IntToStr(WindowsDescent)]);

   if Assigned(AddendumTable) then
    begin
     // add X-Height
     ListViewData(['X-Height', IntToStr(AddendumTable.XHeight)]);

     // add CapHeight
     ListViewData(['Capital Height', IntToStr(AddendumTable.CapHeight)]);

     // add default character
     ListViewData(['Default Character', '#' + IntToStr(AddendumTable.DefaultChar)]);

     // add break character
     ListViewData(['Break Character', '#' + IntToStr(AddendumTable.BreakChar)]);

     // add maximum context length
     ListViewData(['Maximum Context Length', IntToStr(AddendumTable.MaxContext)]);
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOS2PanoseTable(OS2Panose: TCustomPascalTypePanoseTable);
begin
 // add columns
 ListViewColumns(['Name', 'Value', 'Description']);
 ListView.Columns[0].Width := 128;
 ListView.Columns[1].Width := 48;

 // add PANOSE classification number
 if OS2Panose is TPascalTypeLatinTextPanoseTable then
  with TPascalTypeLatinTextPanoseTable(OS2Panose) do
   begin
    // Family Kind
    ListViewData(['Family Kind', '2', 'Latin Text']);

    // Serif Style
    ListViewData(['Serif Style', IntToStr(SerifStyle),
      LatinTextSerifStyleToString(SerifStyle)]);

    // Weight
    ListViewData(['Weight', IntToStr(Weight),
      LatinTextWeightToString(Weight)]);

    // Proportion
    ListViewData(['Proportion', IntToStr(Proportion),
      LatinTextProportionToString(Proportion)]);

    // Contrast
    ListViewData(['Contrast', IntToStr(Contrast),
      LatinTextContrastToString(Contrast)]);

    // Stroke Variation
    ListViewData(['Stroke Variation', IntToStr(StrokeVariation),
      LatinTextStrokeVariationToString(StrokeVariation)]);

    // Arm Style
    ListViewData(['Arm Style', IntToStr(ArmStyle),
      LatinTextArmStyleToString(ArmStyle)]);

    // Letterform
    ListViewData(['Letterform', IntToStr(Letterform),
      LatinTextLetterformToString(Letterform)]);

    // Midline
    ListViewData(['Midline', IntToStr(Midline),
      LatinTextMidlineToString(Midline)]);

    // X-height
    ListViewData(['X-Height', IntToStr(XHeight),
      LatinTextXHeightToString(XHeight)]);
   end else
 if OS2Panose is TPascalTypeLatinHandwrittenPanoseTable then
  with TPascalTypeLatinHandwrittenPanoseTable(OS2Panose) do
   begin
    // Family Kind
    ListViewData(['Family Kind', '3', 'Latin Hand Written']);

    // Tool Kind
    ListViewData(['Tool Kind', IntToStr(ToolKind),
      LatinHandWrittenToolKindToString(ToolKind)]);

    // Weight
    ListViewData(['Weight', IntToStr(Weight),
      LatinHandWrittenWeightToString(Weight)]);

    // Spacing
    ListViewData(['Spacing', IntToStr(Spacing),
      LatinHandWrittenSpacingToString(Spacing)]);

    // Aspect Ratio
    ListViewData(['Aspect Ratio', IntToStr(AspectRatio),
      LatinHandWrittenAspectRatioToString(AspectRatio)]);

    // Contrast
    ListViewData(['Contrast', IntToStr(Contrast),
      LatinHandWrittenContrastToString(Contrast)]);

    // Topology
    ListViewData(['Topology', IntToStr(Topology),
      LatinHandWrittenTopologyToString(Topology)]);

    // Form
    ListViewData(['Form', IntToStr(Form),
      LatinHandWrittenFormToString(Form)]);

    // Finials
    ListViewData(['Finials', IntToStr(Finials),
      LatinHandWrittenFinialsToString(Finials)]);

    // XAscent
    ListViewData(['X-Ascent', IntToStr(XAscent),
      LatinHandWrittenXAscentToString(XAscent)]);
   end else
 if OS2Panose is TPascalTypeLatinDecorativePanoseTable then
  with TPascalTypeLatinDecorativePanoseTable(OS2Panose) do
   begin
    // Family Kind
    ListViewData(['Family Kind', '4' , 'Latin Decorative']);

    // Font Class
    ListViewData(['Font Class', IntToStr(FontClass),
      LatinDecorativeFontClassToString(FontClass)]);

    // Weight
    ListViewData(['Weight', IntToStr(Weight),
      LatinDecorativeWeightToString(Weight)]);

    // Aspect
    ListViewData(['Aspect', IntToStr(Aspect),
      LatinDecorativeAspectToString(Aspect)]);

    // Contrast
    ListViewData(['Contrast', IntToStr(Contrast),
      LatinDecorativeContrastToString(Contrast)]);

    // Serif Variant
    ListViewData(['Serif Variant', IntToStr(SerifVariant),
      LatinDecorativeSerifVariantToString(SerifVariant)]);

    // Treatment
    ListViewData(['Treatment', IntToStr(Treatment),
      LatinDecorativeTreatmentToString(Treatment)]);

    // Lining
    ListViewData(['Lining', IntToStr(Lining),
      LatinDecorativeLiningToString(Lining)]);

    // Topology
    ListViewData(['Topology', IntToStr(Topology),
      LatinDecorativeTopologyToString(Topology)]);

    // Range of Characters
    ListViewData(['Range of Characters', IntToStr(RangeOfCharacters),
      LatinDecorativeRangeOfCharactersToString(RangeOfCharacters)]);
   end else
 if OS2Panose is TPascalTypeLatinSymbolPanoseTable then
  with TPascalTypeLatinSymbolPanoseTable(OS2Panose) do
   begin
    // Family Kind
    ListViewData(['Family Kind', '5', 'Latin Symbol']);

    // Font Class
    ListViewData(['Kind', IntToStr(Kind),
      LatinSymboleKindToString(Kind)]);

    // Weight
    ListViewData(['Weight', IntToStr(Weight),
      LatinSymboleWeightToString(Weight)]);

    // Spacing
    ListViewData(['Spacing', IntToStr(Spacing),
      LatinSymboleSpacingToString(Spacing)]);

    // Aspect Ratio & Contrast
    ListViewData(['Aspect Ratio & Contrast', IntToStr(AspectRatioContrast),
      LatinSymboleAspectRatioContrastToString(AspectRatioContrast)]);

    // Aspect Ratio of Character 94
    ListViewData(['Aspect Ratio of Character', IntToStr(AspectRatioCharacter94),
      LatinSymboleAspectRatioCharacter94ToString(AspectRatioCharacter94)]);

    // Aspect Ratio of Character 119
    ListViewData(['Aspect Ratio of Character', IntToStr(AspectRatioCharacter119),
      LatinSymboleAspectRatioCharacter119ToString(AspectRatioCharacter119)]);

    // Aspect Ratio of Character 157
    ListViewData(['Aspect Ratio of Character', IntToStr(AspectRatioCharacter157),
      LatinSymboleAspectRatioCharacter157ToString(AspectRatioCharacter157)]);

    // Aspect Ratio of Character 163
    ListViewData(['Aspect Ratio of Character', IntToStr(AspectRatioCharacter163),
      LatinSymboleAspectRatioCharacter163ToString(AspectRatioCharacter163)]);

    // Aspect Ratio of Character 211
    ListViewData(['Aspect Ratio of Character', IntToStr(AspectRatioCharacter211),
      LatinSymboleAspectRatioCharacter211ToString(AspectRatioCharacter211)]);
   end else
 if OS2Panose is TPascalTypeDefaultPanoseTable then
  with TPascalTypeDefaultPanoseTable(OS2Panose) do
   begin
    // Family Type
    ListViewData(['Family Kind', IntToStr(FamilyType), 'Unknown']);

    // Byte 1
    ListViewData(['Byte 1', IntToStr(Data[0])]);

    // Byte 2
    ListViewData(['Byte 2', IntToStr(Data[1])]);

    // Byte 3
    ListViewData(['Byte 3', IntToStr(Data[2])]);

    // Byte 4
    ListViewData(['Byte 4', IntToStr(Data[3])]);

    // Byte 5
    ListViewData(['Byte 5', IntToStr(Data[4])]);

    // Byte 6
    ListViewData(['Byte 6', IntToStr(Data[5])]);

    // Byte 7
    ListViewData(['Byte 7', IntToStr(Data[6])]);

    // Byte 8
    ListViewData(['Byte 8', IntToStr(Data[7])]);

    // Byte 9
    ListViewData(['Byte 9', IntToStr(Data[8])]);
   end;


 ListView.BringToFront;
end;

procedure TFmTTF.DisplayOS2UnicodeRangeTable(
  OS2UnicodeRange: TPascalTypeUnicodeRangeTable);
begin
 with OS2UnicodeRange do
  begin
   // add columns
   ListViewColumns(['Name', 'Range']);

   // Basic Latin
   if SupportsBasicLatin then ListViewData(['Basic Latin', '$0000-$007F']);

   // Latin-1 Supplement
   if SupportsLatin1Supplement then ListViewData(['Latin-1 Supplement', '$0080-$00FF']);

   // Latin Extended-A
   if SupportsLatinExtendedA then ListViewData(['Latin Extended-A', '$0100-$017F']);

   // Latin Extended-B
   if SupportsLatinExtendedB then ListViewData(['Latin Extended-B', '$0180-$024F']);

   // IPA Extensions
   if SupportsIPAExtensions then ListViewData(['IPA Extensions', '$0250-$02AF']);

   // Phonetic Extensions
   if SupportsPhoneticExtensions then ListViewData(['Phonetic Extensions', '$1D00-$1D7F']);

   // Phonetic Extensions Supplement
   if SupportsPhoneticExtensionsSupplement then ListViewData(['Phonetic Extensions Supplement', '$1D80-$1DBF']);

   // Spacing Modifier Letters
   if SupportsSpacingModifierLetters then ListViewData(['Spacing Modifier Letters', '$02B0-$02FF']);

   // Modifier Tone Letters
   if SupportsModifierToneLetters then ListViewData(['Modifier Tone Letters', '$A700-$A71F']);

   // Combining Diacritical Marks
   if SupportsCombiningDiacriticalMarks then ListViewData(['Combining Diacritical Marks', '$0300-$036F']);

   // Combining Diacritical Marks Supplement
   if SupportsCombiningDiacriticalMarksSupplement then ListViewData(['Combining Diacritical Marks Supplement', '$1DC0-$1DFF']);

   // Greek and Coptic
   if SupportsGreekAndCoptic then ListViewData(['Greek and Coptic', '$0370-$03FF']);

   // Coptic
   if SupportsCoptic then ListViewData(['Coptic', '$2C80-$2CFF']);

   // Cyrillic
   if SupportsCyrillic then ListViewData(['Cyrillic', '$0400-$04FF']);

   // Cyrillic Supplement
   if SupportsCyrillicSupplement then ListViewData(['Cyrillic Supplement', '$0500-$052F']);

   // Cyrillic Extended-A
   if SupportsCyrillicExtendedA then ListViewData(['Cyrillic Extended-A', '$2DE0-$2DFF']);

   // Cyrillic Extended-B
   if SupportsCyrillicExtendedB then ListViewData(['Cyrillic Extended-B', '$A640-$A69F']);

   // Armenian
   if SupportsArmenian then ListViewData(['Armenian', '$0530-$058F']);

   // Hebrew
   if SupportsHebrew then ListViewData(['Hebrew', '$0590-$05FF']);

   // Vai
   if SupportsVai then ListViewData(['Vai', '$A500-$A63F']);

   // Arabic
   if SupportsArabic then ListViewData(['Arabic', '$0600-$06FF']);

   // Arabic Supplement
   if SupportsArabicSupplement then ListViewData(['Arabic Supplement', '$0750-$077F']);

   // NKo
   if SupportsNKo then ListViewData(['NKo', '$07C0-$07FF']);

   // Devanagari
   if SupportsDevanagari then ListViewData(['Devanagari', '$0900-$097F']);

   // Bengali
   if SupportsBengali then ListViewData(['Bengali', '$0980-$09FF']);

   // Gurmukhi
   if SupportsGurmukhi then ListViewData(['Gurmukhi', '$0A00-$0A7F']);

   // Gujarati
   if SupportsGujarati then ListViewData(['Gujarati', '$0A80-$0AFF']);

   // Oriya
   if SupportsOriya then ListViewData(['Oriya', '$0B00-$0B7F']);

   // Tamil
   if SupportsTamil then ListViewData(['Tamil', '$0B80-$0BFF']);

   // Telugu
   if SupportsTelugu then ListViewData(['Telugu', '$0C00-$0C7F']);

   // Kannada
   if SupportsKannada then ListViewData(['Kannada', '$0C80-$0CFF']);

   // Malayalam
   if SupportsMalayalam then ListViewData(['Malayalam', '$0D00-$0D7F']);

   // Thai
   if SupportsThai then ListViewData(['Thai', '$0E00-$0E7F']);

   // Lao
   if SupportsLao then ListViewData(['Lao', '$0E80-$0EFF']);

   // Georgian
   if SupportsGeorgian then ListViewData(['Georgian', '$10A0-$10FF']);

   // Georgian Supplement
   if SupportsGeorgianSupplement then ListViewData(['Georgian Supplement', '$2D00-$2D2F']);

   // Balinese
   if SupportsBalinese then ListViewData(['Balinese', '$1B00-$1B7F']);

   // Hangul Jamo
   if SupportsHangulJamo then ListViewData(['Hangul Jamo', '$1100-$11FF']);

   // Latin Extended Additional
   if SupportsLatinExtendedAdditional then ListViewData(['Latin Extended Additional', '$1E00-$1EFF']);

   // Latin Extended-C
   if SupportsLatinExtendedC then ListViewData(['Latin Extended-C', '$2C60-$2C7F']);

   // Latin Extended-D
   if SupportsLatinExtendedD then ListViewData(['Latin Extended-D', '$A720-$A7FF']);

   // Greek Extended
   if SupportsGreekExtended then ListViewData(['Greek Extended', '$1F00-$1FFF']);

   // General Punctuation
   if SupportsGeneralPunctuation then ListViewData(['General Punctuation', '$2000-$206F']);

   // Supplemental Punctuation
   if SupportsSupplementalPunctuation then ListViewData(['Supplemental Punctuation', '$2E00-$2E7F']);

   // Superscripts And Subscripts
   if SupportsSuperscriptsAndSubscripts then ListViewData(['Superscripts And Subscripts', '$2070-$209F']);

   // Currency Symbols
   if SupportsCurrencySymbols then ListViewData(['Currency Symbols', '$20A0-$20CF']);

   // Combining Diacritical Marks For Symbols
   if SupportsCombiningDiacriticalMarksForSymbols then ListViewData(['Combining Diacritical Marks For Symbols', '$20D0-$20FF']);

   // Letterlike Symbols
   if SupportsLetterlikeSymbols then ListViewData(['Letterlike Symbols', '$2100-$214F']);

   // Number Forms
   if SupportsNumberForms then ListViewData(['Number Forms', '$2150-$218F']);

   // Arrows
   if SupportsArrows then ListViewData(['Arrows', '$2190-$21FF']);

   // Supplemental Arrows-A
   if SupportsSupplementalArrowsA then ListViewData(['Supplemental Arrows-A', '$27F0-$27FF']);

   // Supplemental Arrows-B
   if SupportsSupplementalArrowsB then ListViewData(['Supplemental Arrows-B', '$2900-$297F']);

   // Miscellaneous Symbols and Arrows
   if SupportsMiscellaneousSymbolsAndArrows then ListViewData(['Miscellaneous Symbols and Arrows', '$2B00-$2BFF']);

   // Mathematical Operators
   if SupportsMathematicalOperators then ListViewData(['Mathematical Operators', '$2200-$22FF']);

   // Supplemental Mathematical Operators
   if SupportsSupplementalMathematicalOperators then ListViewData(['Supplemental Mathematical Operators', '$2A00-$2AFF']);

   // Miscellaneous Mathematical Symbols-A
   if SupportsMiscellaneousMathematicalSymbolsA then ListViewData(['Miscellaneous Mathematical Symbols-A', '$27C0-$27EF']);

   // Miscellaneous Mathematical Symbols-B
   if SupportsMiscellaneousMathematicalSymbolsB then ListViewData(['Miscellaneous Mathematical Symbols-B', '$2980-$29FF']);

   // Miscellaneous Technical
   if SupportsMiscellaneousTechnical then ListViewData(['Miscellaneous Technical', '$2300-$23FF']);

   // Control Pictures
   if SupportsControlPictures then ListViewData(['Control Pictures', '$2400-$243F']);

   // Optical Character Recognition
   if SupportsOpticalCharacterRecognition then ListViewData(['Optical Character Recognition', '$2440-$245F']);

   // Enclosed Alphanumerics
   if SupportsEnclosedAlphanumerics then ListViewData(['Enclosed Alphanumerics', '$2460-$24FF']);

   // Box Drawing
   if SupportsBoxDrawing then ListViewData(['Box Drawing', '$2500-$257F']);

   // Block Elements
   if SupportsBlockElements then ListViewData(['Block Elements', '$2580-$259F']);

   // Geometric Shapes
   if SupportsGeometricShapes then ListViewData(['Geometric Shapes', '$25A0-$25FF']);

   // Miscellaneous Symbols
   if SupportsMiscellaneousSymbols then ListViewData(['Miscellaneous Symbols', '$2600-$26FF']);

   // Dingbats
   if SupportsDingbats then ListViewData(['Dingbats', '$2700-$27BF']);

   // CJK Symbols And Punctuation
   if SupportsCJKSymbolsAndPunctuation then ListViewData(['CJK Symbols And Punctuation', '$3000-$303F']);

   // Hiragana
   if SupportsHiragana then ListViewData(['Hiragana', '$3040-$309F']);

   // Katakana
   if SupportsKatakana then ListViewData(['Katakana', '$30A0-$30FF']);

   // Katakana Phonetic Extensions
   if SupportsKatakanaPhoneticExtensions then ListViewData(['Katakana Phonetic Extensions', '$31F0-$31FF']);

   // Bopomofo
   if SupportsBopomofo then ListViewData(['Bopomofo', '$3100-$312F']);

   // Bopomofo Extended
   if SupportsBopomofoExtended then ListViewData(['Bopomofo Extended', '$31A0-$31BF']);

   // Hangul Compatibility Jamo
   if SupportsHangulCompatibilityJamo then ListViewData(['Hangul Compatibility Jamo', '$3130-$318F']);

   // Phags-pa
   if SupportsPhagsPa then ListViewData(['Phags-pa', '$A840-$A87F']);

   // Enclosed CJK Letters And Months
   if SupportsEnclosedCJKLettersAndMonths then ListViewData(['Enclosed CJK Letters And Months', '$3200-$32FF']);

   // CJK Compatibility
   if SupportsCJKCompatibility then ListViewData(['CJK Compatibility', '$3300-$33FF']);

   // Hangul Syllables
   if SupportsHangulSyllables then ListViewData(['Hangul Syllables', '$AC00-$D7AF']);

   // Non-Plane 0 *
   if SupportsNonPlane0 then ListViewData(['Non-Plane 0 *', '$D800-$DFFF']);

   // Phoenician
   if SupportsPhoenician then ListViewData(['Phoenician', '$10900-$1091F']);

   // CJK Unified Ideographs
   if SupportsCJKUnifiedIdeographs then ListViewData(['CJK Unified Ideographs', '$4E00-$9FFF']);

   // CJK Radicals Supplement
   if SupportsCJKRadicalsSupplement then ListViewData(['CJK Radicals Supplement', '$2E80-$2EFF']);

   // Kangxi Radicals
   if SupportsKangxiRadicals then ListViewData(['Kangxi Radicals', '$2F00-$2FDF']);

   // Ideographic Description Characters
   if SupportsIdeographicDescriptionCharacters then ListViewData(['Ideographic Description Characters', '$2FF0-$2FFF']);

   // CJK Unified Ideographs Extension A
   if SupportsCJKUnifiedIdeographsExtensionA then ListViewData(['CJK Unified Ideographs Extension A', '$3400-$4DBF']);

   // CJK Unified Ideographs Extension B
   if SupportsCJKUnifiedIdeographsExtensionB then ListViewData(['CJK Unified Ideographs Extension B', '$20000-$2A6DF']);

   // Kanbun
   if SupportsKanbun then ListViewData(['Kanbun', '$3190-$319F']);

   // Private Use Area (plane 0)
   if SupportsPrivateUseAreaPlane0 then ListViewData(['Private Use Area (plane 0)', '$E000-$F8FF']);

   // CJK Strokes
   if SupportsCJKStrokes then ListViewData(['CJK Strokes', '$31C0-$31EF']);

   // CJK Compatibility Ideographs
   if SupportsCJKCompatibilityIdeographs then ListViewData(['CJK Compatibility Ideographs', '$F900-$FAFF']);

   // CJK Compatibility Ideographs Supplement
   if SupportsCJKCompatibilityIdeographsSupplement then ListViewData(['CJK Compatibility Ideographs Supplement', '$2F800-$2Fa1F']);

   // Alphabetic Presentation Forms
   if SupportsAlphabeticPresentationForms then ListViewData(['Alphabetic Presentation Forms', '$FB00-$FB4F']);

   // Arabic Presentation Forms-A
   if SupportsArabicPresentationFormsA then ListViewData(['Arabic Presentation Forms-A', '$FB50-$FDFF']);

   // Combining Half Marks
   if SupportsCombiningHalfMarks then ListViewData(['Combining Half Marks', '$FE20-$FE2F']);

   // Vertical Forms
   if SupportsVerticalForms then ListViewData(['Vertical Forms', '$FE10-$FE1F']);

   // CJK Compatibility Forms
   if SupportsCJKCompatibilityForms then ListViewData(['CJK Compatibility Forms', '$FE30-$FE4F']);

   // Small Form Variants
   if SupportsSmallFormVariants then ListViewData(['Small Form Variants', '$FE50-$FE6F']);

   // Arabic Presentation Forms-B
   if SupportsArabicPresentationFormsB then ListViewData(['Arabic Presentation Forms-B', '$FE70-$FEFF']);

   // Halfwidth And Fullwidth Forms
   if SupportsHalfwidthAndFullwidthForms then ListViewData(['Halfwidth And Fullwidth Forms', '$FF00-$FFEF']);

   // Specials
   if SupportsSpecials then ListViewData(['Specials', '$FFF0-$FFFF']);

   // Tibetan
   if SupportsTibetan then ListViewData(['Tibetan', '$0F00-$0FFF']);

   // Syriac
   if SupportsSyriac then ListViewData(['Syriac', '$0700-$074F']);

   // Thaana
   if SupportsThaana then ListViewData(['Thaana', '$0780-$07BF']);

   // Sinhala
   if SupportsSinhala then ListViewData(['Sinhala', '$0D80-$0DFF']);

   // Myanmar
   if SupportsMyanmar then ListViewData(['Myanmar', '$1000-$109F']);

   // Ethiopic
   if SupportsEthiopic then ListViewData(['Ethiopic', '$1200-$137F']);

   // Ethiopic Supplement
   if SupportsEthiopicSupplement then ListViewData(['Ethiopic Supplement', '$1380-$139F']);

   // Ethiopic Extended
   if SupportsEthiopicExtended then ListViewData(['Ethiopic Extended', '$2D80-$2DDF']);

   // Cherokee
   if SupportsCherokee then ListViewData(['Cherokee', '$13A0-$13FF']);

   // Unified Canadian Aboriginal Syllabics
   if SupportsUnifiedCanadianAboriginalSyllabics then ListViewData(['Unified Canadian Aboriginal Syllabics', '$1400-$167F']);

   // Ogham
   if SupportsOgham then ListViewData(['Ogham', '$1680-$169F']);

   // Runic
   if SupportsRunic then ListViewData(['Runic', '$16A0-$16FF']);

   // Khmer
   if SupportsKhmer then ListViewData(['Khmer', '$1780-$17FF']);

   // Khmer Symbols
   if SupportsKhmerSymbols then ListViewData(['Khmer Symbols', '$19E0-$19FF']);

   // Mongolian
   if SupportsMongolian then ListViewData(['Mongolian', '$1800-$18AF']);

   // Braille Patterns
   if SupportsBraillePatterns then ListViewData(['Braille Patterns', '$2800-$28FF']);

   // Yi Syllables
   if SupportsYiSyllables then ListViewData(['Yi Syllables', '$A000-$A48F']);

   // Yi Radicals
   if SupportsYiRadicals then ListViewData(['Yi Radicals', '$A490-$A4CF']);

   // Tagalog
   if SupportsTagalog then ListViewData(['Tagalog', '$1700-$171F']);

   // Hanunoo
   if SupportsHanunoo then ListViewData(['Hanunoo', '$1720-$173F']);

   // Buhid
   if SupportsBuhid then ListViewData(['Buhid', '$1740-$175F']);

   // Tagbanwa
   if SupportsTagbanwa then ListViewData(['Tagbanwa', '$1760-$177F']);

   // Old Italic
   if SupportsOldItalic then ListViewData(['Old Italic', '$10300-$1032F']);

   // Gothic
   if SupportsGothic then ListViewData(['Gothic', '$10330-$1034F']);

   // Deseret
   if SupportsDeseret then ListViewData(['Deseret', '$10400-$1044F']);

   // Byzantine Musical Symbols
   if SupportsByzantineMusicalSymbols then ListViewData(['Byzantine Musical Symbols', '$1D000-$1D0FF']);

   // Musical Symbols
   if SupportsMusicalSymbols then ListViewData(['Musical Symbols', '$1D100-$1D1FF']);

   // Ancient Greek Musical Notation
   if SupportsAncientGreekMusicalNotation then ListViewData(['Ancient Greek Musical Notation', '$1D200-$1D24F']);

   // Mathematical Alphanumeric Symbols
   if SupportsMathematicalAlphanumericSymbols then ListViewData(['Mathematical Alphanumeric Symbols', '$1D400-$1D7FF']);

   // Private Use (plane 15)
   if SupportsPrivateUsePlane15 then ListViewData(['Private Use (plane 15)', '$FF000-$FFFFD']);

   // Private Use (plane 16)
   if SupportsPrivateUsePlane16 then ListViewData(['Private Use (plane 16)', '$100000-$10FFFD']);

   // Variation Selectors
   if SupportsVariationSelectors then ListViewData(['Variation Selectors', '$FE00-$FE0F']);

   // Variation Selectors Supplement
   if SupportsVariationSelectorsSupplement then ListViewData(['Variation Selectors Supplement', '$E0100-$E01EF']);

   // Tags
   if SupportsTags then ListViewData(['Tags', '$E0000-$E007F']);

   // Limbu
   if SupportsLimbu then ListViewData(['Limbu', '$1900-$194F']);

   // Tai Le
   if SupportsTaiLe then ListViewData(['Tai Le', '$1950-$197F']);

   // New Tai Lue
   if SupportsNewTaiLue then ListViewData(['New Tai Lue', '$1980-$19DF']);

   // Buginese
   if SupportsBuginese then ListViewData(['Buginese', '$1A00-$1A1F']);

   // Glagolitic
   if SupportsGlagolitic then ListViewData(['Glagolitic', '$2C00-$2C5F']);

   // Tifinagh
   if SupportsTifinagh then ListViewData(['Tifinagh', '$2D30-$2D7F']);

   // Yijing Hexagram Symbols
   if SupportsYijingHexagramSymbols then ListViewData(['Yijing Hexagram Symbols', '$4DC0-$4DFF']);

   // Syloti Nagri
   if SupportsSylotiNagri then ListViewData(['Syloti Nagri', '$A800-$A82F']);

   // Linear B Syllabary
   if SupportsLinearBSyllabary then ListViewData(['Linear B Syllabary', '$10000-$1007F']);

   // Linear B Ideograms
   if SupportsLinearBIdeograms then ListViewData(['Linear B Ideograms', '$10080-$100FF']);

   // Aegean Numbers
   if SupportsAegeanNumbers then ListViewData(['Aegean Numbers', '$10100-$1013F']);

   // Ancient Greek Numbers
   if SupportsAncientGreekNumbers then ListViewData(['Ancient Greek Numbers', '$10140-$1018F']);

   // Ugaritic
   if SupportsUgaritic then ListViewData(['Ugaritic', '$10380-$1039F']);

   // Old Persian
   if SupportsOldPersian then ListViewData(['Old Persian', '$103A0-$103DF']);

   // Shavian
   if SupportsShavian then ListViewData(['Shavian', '$10450-$1047F']);

   // Osmanya
   if SupportsOsmanya then ListViewData(['Osmanya', '$10480-$104AF']);

   // Cypriot Syllabary
   if SupportsCypriotSyllabary then ListViewData(['Cypriot Syllabary', '$10800-$1083F']);

   // Kharoshthi
   if SupportsKharoshthi then ListViewData(['Kharoshthi', '$10A00-$10A5F']);

   // Tai Xuan Jing Symbols
   if SupportsTaiXuanJingSymbols then ListViewData(['Tai Xuan Jing Symbols', '$1D300-$1D35F']);

   // Cuneiform
   if SupportsCuneiform then ListViewData(['Cuneiform', '$12000-$123FF']);

   // Cuneiform Numbers and Punctuation
   if SupportsCuneiformNumbersAndPunctuation then ListViewData(['Cuneiform Numbers and Punctuation', '$12400-$1247F']);

   // Counting Rod Numerals
   if SupportsCountingRodNumerals then ListViewData(['Counting Rod Numerals', '$1D360-$1D37F']);

   // Sundanese
   if SupportsSundanese then ListViewData(['Sundanese', '$1B80-$1BBF']);

   // Lepcha
   if SupportsLepcha then ListViewData(['Lepcha', '$1C00-$1C4F']);

   // Ol Chiki
   if SupportsOlChiki then ListViewData(['Ol Chiki', '$1C50-$1C7F']);

   // Saurashtra
   if SupportsSaurashtra then ListViewData(['Saurashtra', '$A880-$A8DF']);

   // Kayah Li
   if SupportsKayahLi then ListViewData(['Kayah Li', '$A900-$A92F']);

   // Rejang
   if SupportsRejang then ListViewData(['Rejang', '$A930-$A95F']);

   // Cham
   if SupportsCham then ListViewData(['Cham', '$AA00-$AA5F']);

   // Ancient Symbols
   if SupportsAncientSymbols then ListViewData(['Ancient Symbols', '$10190-$101CF']);

   // Phaistos Disc
   if SupportsPhaistosDisc then ListViewData(['Phaistos Disc', '$101D0-$101FF']);

   // Carian
   if SupportsCarian then ListViewData(['Carian', '$102A0-$102DF']);

   // Lycian
   if SupportsLycian then ListViewData(['Lycian', '$10280-$1029F']);

   // Lydian
   if SupportsLydian then ListViewData(['Lydian', '$10920-$1093F']);

   // Domino Tiles
   if SupportsDominoTiles then ListViewData(['Domino Tiles', '$1F030-$1F09F']);

   // Mahjong Tiles
   if SupportsMahjongTiles then ListViewData(['Mahjong Tiles', '$1F000-$1F02F']);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOS2CodePageRangeTable(
  OS2CodePageRange: TPascalTypeOS2CodePageRangeTable);
begin
 with OS2CodePageRange do
  begin
   // add columns
   ListViewColumns(['Name', 'Code Page']);

   // SupportsLatin1
   if SupportsLatin1 then ListViewData(['Latin 1', '1252']);

   // SupportsLatin2EasternEurope
   if SupportsLatin2EasternEurope then ListViewData(['Latin 2: Eastern Europe', '1250']);

   // SupportsCyrillic
   if SupportsCyrillic then ListViewData(['Cyrillic', '1251']);

   // SupportsGreek
   if SupportsGreek then ListViewData(['Greek', '1253']);

   // SupportsTurkish
   if SupportsTurkish then ListViewData(['Turkish', '1254']);

   // SupportsHebrew
   if SupportsHebrew then ListViewData(['Hebrew', '1255']);

   // SupportsArabic
   if SupportsArabic then ListViewData(['Arabic', '1256']);

   // SupportsWindowsBaltic
   if SupportsWindowsBaltic then ListViewData(['Windows Baltic', '1257']);

   // SupportsVietnamese
   if SupportsVietnamese then ListViewData(['Vietnamese', '1258']);

   // SupportsThai
   if SupportsThai then ListViewData(['Thai', '874']);

   // SupportsJISJapan
   if SupportsJISJapan then ListViewData(['JIS/Japan', '932']);

   // SupportsChineseSimplified
   if SupportsChineseSimplified then ListViewData(['Chinese: Simplified chars--PRC and Singapore', '936']);

   // SupportsKoreanWansung
   if SupportsKoreanWansung then ListViewData(['Korean Wansung', '949']);

   // SupportsChineseTraditional
   if SupportsChineseTraditional then ListViewData(['Chinese: Traditional chars--Taiwan and Hong Kong', '950']);

   // SupportsKoreanJohab
   if SupportsKoreanJohab then ListViewData(['Korean Johab', '1361']);

   // SupportsMacintoshCharacterSet
   if SupportsMacintoshCharacterSet then ListViewData(['Character Set Macintosh (US Roman)', '-']);

   // SupportsOEMCharacter
   if SupportsOEMCharacter then ListViewData(['Character Set OEM', '-']);

   // SupportsSymbolCharacterSet
   if SupportsSymbolCharacterSet then ListViewData(['Character Set Symbol', '-']);

   // SupportsIBMGreek
   if SupportsIBMGreek then ListViewData(['IBM Greek', '869']);

   // SupportsMSDOSRussian
   if SupportsMSDOSRussian then ListViewData(['MS-DOS Russian', '866']);

   // SupportsMSDOSNordic
   if SupportsMSDOSNordic then ListViewData(['MS-DOS Nordic', '865']);

   // SupportsAlternativeArabic
   if SupportsAlternativeArabic then ListViewData(['Arabic', '864']);

   // SupportsMSDOSCanadianFrench
   if SupportsMSDOSCanadianFrench then ListViewData(['MS-DOS Canadian French', '863']);

   // SupportsAlternativeHebrew
   if SupportsAlternativeHebrew then ListViewData(['Hebrew', '862']);

   // SupportsMSDOSIcelandic
   if SupportsMSDOSIcelandic then ListViewData(['MS-DOS Icelandic', '861']);

   // SupportsMSDOSPortuguese
   if SupportsMSDOSPortuguese then ListViewData(['MS-DOS Portuguese', '860']);

   // SupportsIBMTurkish
   if SupportsIBMTurkish then ListViewData(['IBM Turkish', '857']);

   // SupportsIBMCyrillic
   if SupportsIBMCyrillic then ListViewData(['IBM Cyrillic; primarily Russian', '855']);

   // SupportsLatin2
   if SupportsLatin2 then ListViewData(['Latin 2', '852']);

   // SupportsMSDOSBaltic
   if SupportsMSDOSBaltic then ListViewData(['MS-DOS Baltic', '775']);

   // SupportsGreekFormer437G
   if SupportsGreekFormer437G then ListViewData(['Greek; former 437 G', '737']);

   // SupportsArabicASMO708
   if SupportsArabicASMO708 then ListViewData(['Arabic; ASMO 708', '708']);

   // SupportsWELatin1
   if SupportsWELatin1 then ListViewData(['WE/Latin 1', '850']);

   // SupportsUS
   if SupportsUS then ListViewData(['US', '437']);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphDataPoints(SimpleGlyphData: TTrueTypeFontSimpleGlyphData);
var
  ContourIndex : Integer;
  PointIndex   : Integer;
  PointCnt     : Integer;
begin
 with SimpleGlyphData do
  begin
   // add columns
   ListViewColumns(['Point #', 'Position', 'Type']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   PointCnt := 0;
   for ContourIndex := 0 to ContourCount - 1 do
    for PointIndex := 0 to Contour[ContourIndex].PointCount - 1 do
     with Contour[ContourIndex].Point[PointIndex], ListView.Items.Add do
      begin
       Caption := IntToStr(PointCnt + 1) + ' (' + IntToStr(ContourIndex + 1) + '.' + IntToStr(PointIndex + 1) + ')';
       SubItems.Add(IntToStr(XPos) + ', ' + IntToStr(YPos));
       if (Flags and 1) <> 0
        then SubItems.Add('On')
        else SubItems.Add('Off');
       Inc(PointCnt);
      end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphDataContour(Contour: TPascalTypeTrueTypeContour);
var
  PointIndex : Integer;
begin
 with Contour do
  begin
   // add columns
   ListViewColumns(['Point #', 'Position', 'Type']);

   // begin update
   ListView.Items.BeginUpdate;

   for PointIndex := 0 to PointCount - 1 do
    with Point[PointIndex], ListView.Items.Add do
     begin
      Caption := IntToStr(PointIndex + 1);
      SubItems.Add(IntToStr(XPos) + ', ' + IntToStr(YPos));
      if (Flags and 1) <> 0
       then SubItems.Add('On')
       else SubItems.Add('Off');
     end;

   // end update
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphDataSimpleOutline(
  SimpleGlyphData: TTrueTypeFontSimpleGlyphData);
var
  ContourIndex  : Integer;
  PointIndex    : Integer;
  Center        : TPoint;
  CurrentPoint  : TPoint;
  MidPoint      : TPoint;
  ControlPoint  : TPoint;
  WasOnCurve    : Boolean;
  IsOnCurve     : Boolean;
begin
 with FCurrentGlyph.Canvas, SimpleGlyphData do
  begin
   Brush.Color := clWhite;
   FillRect(ClipRect);

   Center := Point(FCurrentGlyph.Width div 2, FCurrentGlyph.Height div 2);

   // use dashed style
   Pen.Style := psDash;
   Pen.Color := clSilver;

   // draw vertical origin
   MoveTo(Center.X, 0);
   LineTo(Center.X, FCurrentGlyph.Height);

   // draw baseline
   MoveTo(0, Center.Y);
   LineTo(FCurrentGlyph.Width, Center.Y);

   if GlyphIndex >= 0 then
    with FFontEngine.Storage.HorizontalMetrics do
     begin
      // use dotted style
      Pen.Style := psDot;

      // draw left side bearing
      Pen.Color := clBlue;
      MoveTo(Center.X + Round(HorizontalMetric[GlyphIndex].Bearing * FScaler), 0);
      LineTo(Center.X + Round(HorizontalMetric[GlyphIndex].Bearing * FScaler), FCurrentGlyph.Height);

      // draw advance width
      Pen.Color := clLime;
      MoveTo(Center.X + Round(HorizontalMetric[GlyphIndex].AdvanceWidth * FScaler), 0);
      LineTo(Center.X + Round(HorizontalMetric[GlyphIndex].AdvanceWidth * FScaler), FCurrentGlyph.Height);
     end;

   // set pen to solid black
   Pen.Color := clBlack;
   Pen.Style := psSolid;

   for ContourIndex := 0 to ContourCount - 1 do
    with Contour[ContourIndex] do
     begin
      WasOnCurve := (Point[0].Flags and 1) <> 0;

      // store last point
      if WasOnCurve then
       begin
        CurrentPoint.X := Center.X + Round(Point[0].XPos * FScaler);
        CurrentPoint.Y := Center.Y - Round(Point[0].YPos * FScaler);
       end
      else
       begin
        IsOnCurve := (Point[PointCount - 1].Flags and 1) <> 0;
        // check if last point is on curve
        if IsOnCurve then
         begin
          CurrentPoint.X := Center.X + Round(Point[PointCount - 1].XPos * FScaler);
          CurrentPoint.Y := Center.Y - Round(Point[PointCount - 1].YPos * FScaler);
         end
        else
         begin
          // in case it is not start at a temporary point in between both
          CurrentPoint.X := Center.X + Round((Point[0].XPos + Point[PointCount - 1].XPos) * 0.5 * FScaler);
          CurrentPoint.Y := Center.Y - Round((Point[0].YPos + Point[PointCount - 1].YPos) * 0.5 * FScaler);
         end;
       end;

      // move to last point
      MoveTo(CurrentPoint.X, CurrentPoint.Y);

      PointIndex := 1;

      while PointIndex <= PointCount do
       begin
        // set current point
        CurrentPoint.X := Center.X + Round(Point[PointIndex].XPos * FScaler);
        CurrentPoint.Y := Center.Y - Round(Point[PointIndex].YPos * FScaler);

        IsOnCurve := (Point[PointIndex].Flags and 1) <> 0;

        if IsOnCurve then
         if WasOnCurve
          then LineTo(CurrentPoint.X, CurrentPoint.Y)
          else PolyBezierTo([ControlPoint, CurrentPoint, CurrentPoint])
        else
         if WasOnCurve
          then ControlPoint := CurrentPoint
          else
           begin
            MidPoint.X := (CurrentPoint.X + ControlPoint.X) div 2;
            MidPoint.Y := (CurrentPoint.Y + ControlPoint.Y) div 2;
            PolyBezierTo([ControlPoint, MidPoint, MidPoint]);
            ControlPoint := CurrentPoint;
           end;

        Inc(PointIndex);
        WasOnCurve := IsOnCurve;
       end;
     end;

   Brush.Color := clGray;
   for ContourIndex := 0 to ContourCount - 1 do
    with Contour[ContourIndex] do
     begin
      if (Point[0].Flags and 1) <> 0
       then Brush.Color := clSilver
       else Brush.Color := clGray;
      FillRect(Rect(Center.X + Round(Point[0].XPos * FScaler) - 2,
        Center.Y - Round(Point[0].YPos * FScaler) - 2,
        Center.X + Round(Point[0].XPos * FScaler) + 2,
        Center.Y - Round(Point[0].YPos * FScaler) + 2));
      for PointIndex := 1 to PointCount - 1 do
       begin
        if (Point[PointIndex].Flags and 1) <> 0
         then Brush.Color := clGray
         else Brush.Color := clSilver;

        FillRect(Rect(Center.X + Round(Point[PointIndex].XPos * FScaler) - 2,
          Center.Y - Round(Point[PointIndex].YPos * FScaler) - 2,
          Center.X + Round(Point[PointIndex].XPos * FScaler) + 2,
          Center.Y - Round(Point[PointIndex].YPos * FScaler) + 2));
       end;
     end;

   PaintBox.Invalidate;
   PnPaintBox.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphDataCompositeOutline(
  CompositeGlyphData: TTrueTypeFontCompositeGlyphData);
var
  CompositeIndex : Integer;
  Center         : TPoint;
begin
 with FCurrentGlyph.Canvas, CompositeGlyphData do
  begin
   Brush.Color := clWhite;
   FillRect(ClipRect);

   Center := Point(FCurrentGlyph.Width div 2, FCurrentGlyph.Height div 2);

   for CompositeIndex := 0 to GlyphCount - 1 do
    with TPascalTypeCompositeGlyph(Glyph[CompositeIndex]) do
     begin
      TextOut(Center.X, Center.Y + 8 * CompositeIndex, IntToStr(GlyphIndex));
      //FFontEngine.Storage.
     end;

   PaintBox.Invalidate;
   PnPaintBox.BringToFront;
  end;
end;

procedure TFmTTF.DisplayPCL5Table(PCL5Table: TPascalTypePCL5Table);
var
  str : string;
begin
 with PCL5Table do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   // add font number
   with ListView.Items.Add do
    begin
     Caption := 'Font Number';
     str := Char(FontNumber.Vendor and $7F);
     if (FontNumber.Vendor and $80) > 0
      then str := str + ' (converted)';

     SubItems.Add(str);
    end;

   // add pitch
   ListViewData(['Pitch', IntToStr(Pitch)]);

   // add x-height
   ListViewData(['X-Height', IntToStr(XHeight)]);

   // add style
   ListViewData(['Style', IntToStr(Style)]);

   // add type family
   with ListView.Items.Add do
    begin
     Caption := 'Type Family';
     case TypeFamily and $F of
       1 : str := 'Agfa Corporation - ';
       2 : str := 'Bitstream Inc. - ';
       3 : str := 'Linotype Company - ';
       4 : str := 'Monotype Typography Ltd. - ';
       5 : str := 'Adobe Systems - ';
       6 : str := 'font repackagers - ';
       7 : str := 'vendors of unique typefaces - ';
      else str := '';
     end;
     SubItems.Add(str + IntToStr(TypeFamily and $FFF));
    end;

   // add cap height
   ListViewData(['Caption Height', IntToStr(CapHeight)]);

   // add symbol set
   ListViewData(['Symbol Set', IntToStr(SymbolSet)]);

   // add typeface
   ListViewData(['Typeface', Typeface]);

   // add character complement
   ListViewData(['Character Complement', CharacterComplement]);

   // add filename
   ListViewData(['FileName', FileName]);

   // add stroke weight
   ListViewData(['Stroke Weight', string(StrokeWeight)]);

   // add width type
   ListViewData(['Width Type', string(WidthType)]);

   // add serif style
   ListViewData(['Serif Style', IntToStr(SerifStyle)]);

   // add padding
   ListViewData(['Padding', IntToStr(Padding)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayPostscriptTable(
  PostscriptTable: TPascalTypePostscriptTable);
begin
 with PostscriptTable do
  begin
   InitializeDefaultListView;

   // add Version
   ListViewData(['Version', VersionToString(Version)]);

   // add Italic Angle
   ListViewData(['Italic Angle', FloatToStrF(ItalicAngle.Value + ItalicAngle.Fract / (1 shl 16), ffGeneral, 4, 4)]);

   // add Underline Position
   ListViewData(['Underline Position', IntToStr(UnderlinePosition)]);

   // add Underline Thickness
   ListViewData(['Underline Thickness', IntToStr(UnderlineThickness)]);

   // add IsFixedPitch
   ListViewData(['Is Fixed Pitch', IntToStr(IsFixedPitch)]);

   // add MinMemType42
   ListViewData(['Minimum Memory Usage (TrueType)', IntToStr(MinMemType42)]);

   // add MaxMemType42
   ListViewData(['Maximum Memory Usage (TrueType)', IntToStr(MaxMemType42)]);

   // add MinMemType1
   ListViewData(['Minimum Memory Usage (Type 1)', IntToStr(MinMemType1)]);

   // add MaxMemType1
   ListViewData(['Maximum Memory Usage (Type 1)', IntToStr(MaxMemType1)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayPostscriptV2Table(
  PostscriptTable: TPascalTypePostscriptVersion2Table);
var
  GlyphIndex : Integer;
begin
 with PostscriptTable do
  begin
   // add columns
   ListViewColumns(['Glyph #', 'Name']);

   // set width of glyph number comumn
   ListView.Columns[0].Width := 96;

   // begin update (lock)
   ListView.Items.BeginUpdate;

   // add glyph index
   for GlyphIndex := 0 to GlyphIndexCount - 1 do
    with ListView.Items.Add do
     begin
      Caption := IntToStr(GlyphIndex);
      SubItems.Add(GlyphIndexToString(GlyphIndex));
     end;

   // end update (unlock)
   ListView.Items.EndUpdate;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayVerticalDeviceMetricsTable(
  VerticalDeviceMetricsTable: TPascalTypeVerticalDeviceMetricsTable);
begin
 with VerticalDeviceMetricsTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', IntToStr(Version)]);

   // add number of ratios
   ListViewData(['Number of Ratios', IntToStr(RatioCount)]);

   // add number of groups
   ListViewData(['Number of Groups', IntToStr(GroupCount)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayVerticalHeader(
  VerticalHeaderTable: TPascalTypeVerticalHeaderTable);
begin
 with VerticalHeaderTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', VersionToString(Version)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.TreeViewMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  MouseOverNode : TTreeNode;
  ParentNode    : TTreeNode;
begin
 MouseOverNode := TreeView.GetNodeAt(X, Y);

 // status bar
 if Assigned(MouseOverNode) and Assigned(MouseOverNode.Data) then
  begin
   ParentNode := MouseOverNode;

   while not (TObject(ParentNode.Data) is TCustomPascalTypeNamedTable) do
    begin
     ParentNode := ParentNode.Parent;
     if not Assigned(ParentNode.Data)
      then Exit;
    end;

   if TObject(ParentNode.Data) is TCustomPascalTypeNamedTable then
    with TCustomPascalTypeNamedTable(ParentNode.Data) do
     begin
      StatusBar.SimpleText := 'Table ID: ' + TableType;
     end;
  end;
end;

procedure TFmTTF.MIOpenFromInstalledClick(Sender: TObject);
var
  SR : TSearchRec;
begin
 if FontDialog.Execute then
  begin
   SetCurrentDir(GetFontDirectory);

   with TPascalTypeStorageScan.Create do
   try
    // scan installed fonts
    if FindFirst('*.ttf', faAnyFile, SR) = 0 then
     try
      repeat
       try
        LoadFromFile(SR.Name);
        if (FontName = FontDialog.Font.Name) and
         ((Graphics.fsItalic in FontDialog.Font.Style) =
          (fsItalic in FontStyle)) and
         ((Graphics.fsBold in FontDialog.Font.Style) =
          (fsBold in FontStyle)) and
         ((Graphics.fsUnderline in FontDialog.Font.Style) =
          (fsUnderline in FontStyle))
         then
         begin
          Self.LoadFromFile(SR.Name);
          Exit;
         end;
       except
        on e: EPascalTypeError do Continue;
       end;
      until FindNext(SR) <> 0;
     finally
      FindClose(SR);
     end;
    // search font...
   finally
    Free;
   end;
  end;
end;

procedure TFmTTF.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
 Node.Expanded := True;

 if Assigned(Node.Data) then
  begin
   // Font Header Table
   if TObject(Node.Data) is TPascalTypeHeaderTable
    then DisplayHeaderTable(TPascalTypeHeaderTable(Node.Data)) else

   // Horizontal Header Table
   if TObject(Node.Data) is TPascalTypeHorizontalHeaderTable
    then DisplayHorizontalHeader(TPascalTypeHorizontalHeaderTable(Node.Data)) else

   // Horizontal Metrics Table
   if TObject(Node.Data) is TPascalTypeHorizontalMetricsTable
    then DisplayHorizontalMetrics(TPascalTypeHorizontalMetricsTable(Node.Data)) else

   // Horizontal Device Metrics
   if TObject(Node.Data) is TPascalTypeHorizontalDeviceMetricsTable
    then DisplayHorizontalDeviceMetricsTable(TPascalTypeHorizontalDeviceMetricsTable(Node.Data)) else

   // Horizontal Device Metrics Record
   if TObject(Node.Data) is TPascalTypeHorizontalDeviceMetricsSubTable
    then DisplayHorizontalDeviceMetricsSubTable(TPascalTypeHorizontalDeviceMetricsSubTable(Node.Data)) else

   // 0S/2 Table
   if TObject(Node.Data) is TPascalTypeOS2Table
    then DisplayOS2Table(TPascalTypeOS2Table(Node.Data)) else

   // 0S/2 Panose Table
   if TObject(Node.Data) is TCustomPascalTypePanoseTable
    then DisplayOS2PanoseTable(TCustomPascalTypePanoseTable(Node.Data)) else

   // 0S/2 Unicode Range Table
   if TObject(Node.Data) is TPascalTypeUnicodeRangeTable
    then DisplayOS2UnicodeRangeTable(TPascalTypeUnicodeRangeTable(Node.Data)) else

   // 0S/2 Unicode Range Table
   if TObject(Node.Data) is TPascalTypeOS2CodePageRangeTable
    then DisplayOS2CodePageRangeTable(TPascalTypeOS2CodePageRangeTable(Node.Data)) else

   // Character Map Table
   if TObject(Node.Data) is TPascalTypeCharacterMapTable
    then DisplayCharacterMapTable(TPascalTypeCharacterMapTable(Node.Data)) else

   // Character Map SubTable
   if TObject(Node.Data) is TCustomPascalTypeCharacterMapDirectory
    then DisplayCharacterMapSubTable(TCustomPascalTypeCharacterMapDirectory(Node.Data)) else

   // Maximum Profile Table
   if TObject(Node.Data) is TPascalTypeMaximumProfileTable
    then DisplayMaximumProfileTable(TPascalTypeMaximumProfileTable(Node.Data)) else

   // Control Value Table
   if TObject(Node.Data) is TTrueTypeFontControlValueTable
    then DisplayControlValueTable(TTrueTypeFontControlValueTable(Node.Data)) else

   // Bitmap Location Table
   if TObject(Node.Data) is TPascalTypeBitmapLocationTable
    then DisplayBitmapLocationTable(TPascalTypeBitmapLocationTable(Node.Data)) else

   // Embedded Bitmap Data Table
   if TObject(Node.Data) is TPascalTypeEmbeddedBitmapDataTable
    then DisplayEmbeddedBitmapDataTable(TPascalTypeEmbeddedBitmapDataTable(Node.Data)) else

   // Embedded Bitmap Location Table
   if TObject(Node.Data) is TPascalTypeEmbeddedBitmapLocationTable
    then DisplayEmbeddedBitmapLocationTable(TPascalTypeEmbeddedBitmapLocationTable(Node.Data)) else

   // Embedded Bitmap Scaling Table
   if TObject(Node.Data) is TPascalTypeEmbeddedBitmapScalingTable
    then DisplayEmbeddedBitmapScalingTable(TPascalTypeEmbeddedBitmapScalingTable(Node.Data)) else

   // Extended Glyph Metamorphosis
   if TObject(Node.Data) is TPascalTypeExtendedGlyphMetamorphosisTable
    then DisplayExtendedGlyphMetamorphosisTable(TPascalTypeExtendedGlyphMetamorphosisTable(Node.Data)) else

   // Bitmap Size Table
   if TObject(Node.Data) is TPascalTypeBitmapSizeTable
    then DisplayBitmapSizeTable(TPascalTypeBitmapSizeTable(Node.Data)) else

   // Font Instruction Table
   if TObject(Node.Data) is TCustomTrueTypeFontInstructionTable
    then DisplayFontInstructionTable(TCustomTrueTypeFontInstructionTable(Node.Data)) else

   // Postscript Table
   if TObject(Node.Data) is TPascalTypePostscriptTable
    then DisplayPostscriptTable(TPascalTypePostscriptTable(Node.Data)) else

   // Name Table
   if TObject(Node.Data) is TPascalTypeNameTable then
    begin
     if Node.Text = 'Unicode'
      then DisplayNameUnicodeTable(TPascalTypeNameTable(Node.Data)) else
     if Node.Text = 'Apple'
      then DisplayNameAppleTable(TPascalTypeNameTable(Node.Data)) else
     if Node.Text = 'Microsoft'
      then DisplayNameMicrosoftTable(TPascalTypeNameTable(Node.Data))
      else DisplayNameTable(TPascalTypeNameTable(Node.Data))
    end else

   // Postscript Glyph Name Table
   if TObject(Node.Data) is TPascalTypePostscriptVersion2Table
    then DisplayPostscriptV2Table(TPascalTypePostscriptVersion2Table(Node.Data)) else

   // Grid Fitting and Scan Conversion Procedure Table
   if TObject(Node.Data) is TPascalTypeGridFittingAndScanConversionProcedureTable
    then DisplayGaspTable(TPascalTypeGridFittingAndScanConversionProcedureTable(Node.Data)) else

   // Glyph Instruction Table
   if TObject(Node.Data) is TTrueTypeFontGlyphInstructionTable
    then DisplayGlyphInstructionTable(TTrueTypeFontGlyphInstructionTable(Node.Data)) else

   {$IFDEF ShowOpenType}
   // Glyph Definition Table
   if TObject(Node.Data) is TOpenTypeGlyphDefinitionTable
    then DisplayGlyphDefinitionTable(TOpenTypeGlyphDefinitionTable(Node.Data)) else

   // Justification Table
   if TObject(Node.Data) is TOpenTypeJustificationTable
    then DisplayJustificationTable(TOpenTypeJustificationTable(Node.Data)) else

   // Open Type Common Table
   if TObject(Node.Data) is TCustomOpenTypeCommonTable
    then DisplayOpenTypeCommonTable(TCustomOpenTypeCommonTable(Node.Data)) else

   // Open Type Script List Table
   if TObject(Node.Data) is TOpenTypeScriptListTable
    then DisplayOpenTypeScriptListTable(TOpenTypeScriptListTable(Node.Data)) else

   // Open Type Feature List Table
   if TObject(Node.Data) is TOpenTypeFeatureListTable
    then DisplayOpenTypeFeatureListTable(TOpenTypeFeatureListTable(Node.Data)) else

   // Open Type Lookup List Table
   if TObject(Node.Data) is TOpenTypeLookupListTable
    then DisplayOpenTypeLookUpListTable(TOpenTypeLookupListTable(Node.Data)) else

   // Open Type Language System Table
   if TObject(Node.Data) is TCustomOpenTypeLanguageSystemTable
    then DisplayCustomOpenTypeLanguageSystemTable(TCustomOpenTypeLanguageSystemTable(Node.Data)) else

   // Open Type Script Table
   if TObject(Node.Data) is TCustomOpenTypeScriptTable
    then DisplayCustomOpenTypeScriptTable(TCustomOpenTypeScriptTable(Node.Data)) else

   // Open Type Feature Table
   if TObject(Node.Data) is TCustomOpenTypeFeatureTable
    then DisplayCustomOpenTypeFeatureTable(TCustomOpenTypeFeatureTable(Node.Data)) else

   // Open Type Lookup Table
   if TObject(Node.Data) is TOpenTypeLookupTable
    then DisplayOpenTypeLookupTable(TOpenTypeLookupTable(Node.Data)) else

   // Open Type Lookup Table
   if TObject(Node.Data) is TCustomOpenTypeClassDefinitionTable
    then DisplayCustomOpenTypeClassDefinitionTable(TCustomOpenTypeClassDefinitionTable(Node.Data)) else

   // Open Type Mark Glyph Set Table
   if TObject(Node.Data) is TOpenTypeMarkGlyphSetTable
    then DisplayOpenTypeMarkGlyphSetTable(TOpenTypeMarkGlyphSetTable(Node.Data)) else
   {$ENDIF}

   // Digital Signature Table
   if TObject(Node.Data) is TPascalTypeDigitalSignatureTable
    then DisplayDigitalSignatureTable(TPascalTypeDigitalSignatureTable(Node.Data)) else

   // Digital Signature Block
   if TObject(Node.Data) is TPascalTypeDigitalSignatureBlock
    then DisplayDigitalSignatureBlock(TPascalTypeDigitalSignatureBlock(Node.Data)) else

   // Apple Features
   if TObject(Node.Data) is TPascalTypeFeatureTable
    then DisplayAppleFeatureTable(TPascalTypeFeatureTable(Node.Data)) else

   // Font Forge Time Stamp Table
   if TObject(Node.Data) is TPascalTypeFontForgeTimeStampTable
    then DisplayFontForgeTimeStampTable(TPascalTypeFontForgeTimeStampTable(Node.Data)) else

   // Font Forge Extension Table
   if TObject(Node.Data) is TPascalTypeFontForgeExtensionTable
    then DisplayFontForgeExtensionTable(TPascalTypeFontForgeExtensionTable(Node.Data)) else

   // Font Description Table
   if TObject(Node.Data) is TPascalTypeFontDescriptionTable
    then DisplayFontDescriptionTable(TPascalTypeFontDescriptionTable(Node.Data)) else

   // Gylph Property Table
   if TObject(Node.Data) is TPascalTypeGlyphPropertiesTable
    then DisplayGlyphPropertiesTable(TPascalTypeGlyphPropertiesTable(Node.Data)) else

   // Kerning Table
   if TObject(Node.Data) is TPascalTypeKerningTable
    then DisplayFontKerningTable(TPascalTypeKerningTable(Node.Data)) else

   // Kerning Subtable
   if TObject(Node.Data) is TPascalTypeKerningSubTable
    then DisplayFontKerningSubTable(TPascalTypeKerningSubTable(Node.Data)) else

   // Location Table
   if TObject(Node.Data) is TTrueTypeFontLocationTable
    then DisplayLocationTable(TTrueTypeFontLocationTable(Node.Data)) else

   // Glyph Data Table
   if TObject(Node.Data) is TTrueTypeFontGlyphDataTable
    then DisplayGlyphDataTable(TTrueTypeFontGlyphDataTable(Node.Data)) else

   // Glyph Data
   if TObject(Node.Data) is TCustomTrueTypeFontGlyphData then
    if (TObject(Node.Data) is TTrueTypeFontSimpleGlyphData) then
     begin
      if (Node.Text = 'Points')
       then DisplayGlyphDataPoints(TTrueTypeFontSimpleGlyphData(Node.Data)) else
      if (Node.Text = 'Outline')
       then DisplayGlyphDataSimpleOutline(TTrueTypeFontSimpleGlyphData(Node.Data))
       else DisplayGlyphData(TCustomTrueTypeFontGlyphData(Node.Data))
     end else
    if (TObject(Node.Data) is TTrueTypeFontCompositeGlyphData) then
     begin
      if (Node.Text = 'Outline')
       then DisplayGlyphDataCompositeOutline(TTrueTypeFontCompositeGlyphData(Node.Data))
       else DisplayGlyphData(TCustomTrueTypeFontGlyphData(Node.Data))
     end
    else DisplayGlyphData(TCustomTrueTypeFontGlyphData(Node.Data)) else

   // Glyph Data Contour
   if TObject(Node.Data) is TPascalTypeTrueTypeContour
    then DisplayGlyphDataContour(TPascalTypeTrueTypeContour(Node.Data)) else

   // Linear Threshold Table
   if TObject(Node.Data) is TPascalTypeLinearThresholdTable
    then DisplayLinearThresholdTable(TPascalTypeLinearThresholdTable(Node.Data)) else

   // PCL 5 Table
   if TObject(Node.Data) is TPascalTypePCL5Table
    then DisplayPCL5Table(TPascalTypePCL5Table(Node.Data)) else

   // Vertical Metrics Header Table
   if TObject(Node.Data) is TPascalTypeVerticalHeaderTable
    then DisplayVerticalHeader(TPascalTypeVerticalHeaderTable(Node.Data)) else

   // Vertical Device Metrics Header Table
   if TObject(Node.Data) is TPascalTypeVerticalDeviceMetricsTable
    then DisplayVerticalDeviceMetricsTable(TPascalTypeVerticalDeviceMetricsTable(Node.Data)) else

   // other non-required tables
   if TObject(Node.Data) is TCustomPascalTypeNamedTable then
    with TCustomPascalTypeNamedTable(Node.Data) do
     begin
      InitializeDefaultListView;

      ListViewData(['Table Type', string(TableType)]);

      ListView.BringToFront;
     end;
  end;
end;

procedure TFmTTF.LoadFromFile(Filename: TFileName);
var
  Start, Stop, Freq : Int64;
  MemoryFileStream  : TMemoryStream;
begin
 if FileExists(FileName) then
  begin
   // initialize listview
   InitializeDefaultListView;

   // create temporary memory strem
   MemoryFileStream := TMemoryStream.Create;
   try
    // query start
    QueryPerformanceCounter(Start);

    // load data from file
    MemoryFileStream.LoadFromFile(Filename);

    // query stop
    QueryPerformanceCounter(Stop);

    // query performance frequency
    QueryPerformanceFrequency(Freq);

    // add loading time
    ListViewData(['loading time', FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms']);

    // query start
    QueryPerformanceCounter(Start);

    // load font file
    FFontEngine.Storage.LoadFromStream(MemoryFileStream);

    // query stop
    QueryPerformanceCounter(Stop);

    // query performance frequency
    QueryPerformanceFrequency(Freq);

    // add loading time
    ListViewData(['interpreting time', FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms']);

   finally
    FreeAndNil(MemoryFileStream);
   end;

   // clear existing items on treeview
   TreeView.Items.Clear;

   // add root item on treeview
   TreeView.Items.AddChild(nil, ExtractFileName(FileName));

   // query start
   QueryPerformanceCounter(Start);

   FontChanged;

   // query stop
   QueryPerformanceCounter(Stop);

   // add building tree time
   ListViewData(['building tree time', FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms']);

   ListView.BringToFront;

   Caption := 'PascalType Font Explorer [' + ExtractFileName(Filename) + ']';
  end
 else raise Exception.Create('File does not exists');
end;

procedure TFmTTF.LoadFromStream(Stream: TStream);
var
  Start, Stop, Freq : Int64;
begin
 // reset stream position
 Stream.Position := 0;

 // query start
 QueryPerformanceCounter(Start);

 // load font file
 FFontEngine.Storage.LoadFromStream(Stream);

 // query stop
 QueryPerformanceCounter(Stop);

 // query performance frequency
 QueryPerformanceFrequency(Freq);

 // initialize listview
 InitializeDefaultListView;

 // add loading time
 ListViewData(['loading time', FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms']);

 // clear existing items on treeview
 TreeView.Items.Clear;

 // add root item on treeview
 TreeView.Items.AddChild(nil, '(internal font)');

 // query start
 QueryPerformanceCounter(Start);

 FontChanged;

 // query stop
 QueryPerformanceCounter(Stop);

 // add building tree time
 ListViewData(['building tree time', FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms']);

 ListView.BringToFront;

 // change caption
 Caption := 'PascalType Font Explorer';
end;

procedure TFmTTF.FontChanged;
var
  OptTableIndex     : Integer;
  SubtableIndex     : Integer;
  SubSubIndex       : Integer;
  str               : string;
  Node, SubNode     : TTreeNode;
  SubSubNode        : TTreeNode;
begin
 with FFontEngine.Storage, TreeView do
  begin
   // set width and height of current glyph bitmap
   FScaler := Fppem / HeaderTable.UnitsPerEm;
   FCurrentGlyph.Width := Fppem * (1 shl 16) div (HeaderTable.UnitsPerEm);
   FCurrentGlyph.Height := Fppem * (1 shl 16) div (HeaderTable.UnitsPerEm);

   // begin update
   Items.BeginUpdate;

   // add font header table
   Items.AddChildObject(Items[0], 'head', HeaderTable);

   // add maximum profile table
   Items.AddChildObject(Items[0], 'maxp', MaximumProfile);

   // add horizontal header
   Items.AddChildObject(Items[0], 'hhea', HorizontalHeader);

   // add horizontal metrics
   Items.AddChildObject(Items[0], 'hmtx', HorizontalMetrics);

   // add character mapping
   Node := Items.AddChildObject(Items[0], 'cmap', CharacterMap);
   with CharacterMap do
    for SubtableIndex := 0 to CharacterMapSubtableCount - 1 do
     begin
      case CharacterMapSubtable[SubtableIndex].PlatformID of
       piUnicode   : Items.AddChildObjectFirst(Node, 'Unicode', CharacterMapSubtable[SubtableIndex]);
       piApple     : Items.AddChildObjectFirst(Node, 'Apple', CharacterMapSubtable[SubtableIndex]);
       piMicrosoft :
        begin
         str := 'Microsoft';
         case TPascalTypeCharacterMapMicrosoftDirectory(CharacterMapSubtable[SubtableIndex]).PlatformSpecificID of
          meSymbol      : str := str + ', Symbol';
          meUnicodeBMP  : str := str + ', Unicode';
          meShiftJIS    : str := str + ', ShiftJIS';
          mePRC         : str := str + ', PRC';
          meBig5        : str := str + ', Big5';
          meWansung     : str := str + ', Wansung';
          meJohab       : str := str + ', Johab';
          meUnicodeUCS4 : str := str + ', UnicodeUCS4';
         end;
         Items.AddChildObjectFirst(Node, str, CharacterMapSubtable[SubtableIndex]);
        end
       else Items.AddChildObjectFirst(Node, 'Unknown', CharacterMapSubtable[SubtableIndex]);
      end;
     end;

   // add name table
   Node := Items.AddChildObject(Items[0], 'name', NameTable);
   with NameTable do
    begin
     // check for Unicode
     for SubtableIndex := 0 to NameSubTableCount - 1 do
      if NameSubTable[SubtableIndex].PlatformID = piUnicode then
       begin
        Items.AddChildObject(Node, 'Unicode', NameTable);
        Break;
       end;
     // check for Apple
     for SubtableIndex := 0 to NameSubTableCount - 1 do
      if NameSubTable[SubtableIndex].PlatformID = piApple then
       begin
        Items.AddChildObject(Node, 'Apple', NameTable);
        Break;
       end;
     // check for Microsoft
     for SubtableIndex := 0 to NameSubTableCount - 1 do
      if NameSubTable[SubtableIndex].PlatformID = piMicrosoft then
       begin
        Items.AddChildObject(Node, 'Microsoft', NameTable);
        Break;
       end;
    end;

   // add postscript table
   Node := Items.AddChildObject(Items[0], 'post', PostScriptTable);
   if Assigned(PostScriptTable.PostscriptV2Table)
    then Items.AddChildObjectFirst(Node, 'Glyph Names', PostScriptTable.PostscriptV2Table);

   // add OS/2 table
   if Assigned(OS2Table) then
    with TPascalTypeOS2Table(OS2Table) do
     begin
      Node := Items.AddChildObject(Items[0], TableType, OS2Table);
      Items.AddChildObject(Node, 'Panpose', Panose);
      Items.AddChildObject(Node, 'Unicode Range', UnicodeRange);
      if Assigned(CodePageRange)
       then Items.AddChildObject(Node, 'Code Rage Range', CodePageRange);
     end;

   // add additional tables
   for OptTableIndex := 0 to OptionalTableCount - 1 do
    with OptionalTable[OptTableIndex] do
     begin
      Node := Items.AddChildObject(Items[0], TableType, OptionalTable[OptTableIndex]);

      // digital signature
      if OptionalTable[OptTableIndex] is TPascalTypeDigitalSignatureTable then
       with TPascalTypeDigitalSignatureTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to SignatureCount - 1
         do Items.AddChildObject(Node, 'Signature #' + IntToStr(SubtableIndex + 1), SignatureBlock[SubtableIndex]) else

      // kerning table
      if OptionalTable[OptTableIndex] is TPascalTypeKerningTable then
       with TPascalTypeKerningTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to KerningSubtableCount - 1 do
         begin
          str := 'Subtable #' + IntToStr(SubtableIndex + 1);
          if KerningSubtable[SubtableIndex].IsHorizontal
           then str := str + ' (horizontal'
           else str := str + ' (vertical';

          if KerningSubtable[SubtableIndex].IsMinimum
           then str := str + ', minimum)'
           else str := str + ', kerning)';

          Items.AddChildObject(Node, str, KerningSubtable[SubtableIndex]);
         end else

      // horizontal device metrics
      if OptionalTable[OptTableIndex] is TPascalTypeHorizontalDeviceMetricsTable then
       with TPascalTypeHorizontalDeviceMetricsTable(OptionalTable[OptTableIndex]) do
        begin
         for SubtableIndex := 0 to DeviceRecordCount - 1
          do Items.AddChildObject(Node, 'Device Record #' + IntToStr(SubtableIndex), DeviceRecord[SubtableIndex]);
        end else

      {$IFDEF ShowOpenType}
      // open type common table
      if OptionalTable[OptTableIndex] is TOpenTypeGlyphDefinitionTable then
       with TOpenTypeGlyphDefinitionTable(OptionalTable[OptTableIndex]) do
        begin
         Items.AddChildObject(Node, 'Class Definition', GlyphClassDefinition);
         Items.AddChildObject(Node, 'Mark Attachment Class Definition', MarkAttachmentClassDefinition);
//           Items.AddChildObject(Node, 'Mark Set', MarkGlyphSet);
        end else

      // embedded bitmap location table
      if OptionalTable[OptTableIndex] is TPascalTypeEmbeddedBitmapLocationTable then
       with TPascalTypeEmbeddedBitmapLocationTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to BitmapSizeTableCount - 1
         do Items.AddChildObject(Node, 'Table #' + IntToStr(SubtableIndex + 1), BitmapSizeTable[SubtableIndex]);

      // bitmap location table
      if OptionalTable[OptTableIndex] is TPascalTypeBitmapLocationTable then
       with TPascalTypeBitmapLocationTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to BitmapSizeTableCount - 1
         do Items.AddChildObject(Node, 'Table #' + IntToStr(SubtableIndex + 1), BitmapSizeTable[SubtableIndex]);

      // open type common table
      if OptionalTable[OptTableIndex] is TCustomOpenTypeCommonTable then
       with TCustomOpenTypeCommonTable(OptionalTable[OptTableIndex]) do
        begin

         // script subtable
         SubNode := Items.AddChildObject(Node, 'Scripts', ScriptListTable);
         with ScriptListTable do
          for SubtableIndex := 0 to LanguageSystemCount - 1 do
           begin
            str := LanguageSystem[SubtableIndex].DisplayName;
            SubSubNode := Items.AddChildObject(SubNode, str, LanguageSystem[SubtableIndex]);

            // add default language system
            if Assigned(LanguageSystem[SubtableIndex].DefaultLangSys)
             then Items.AddChildObject(SubSubNode, '(default)', LanguageSystem[SubtableIndex].DefaultLangSys);

            for SubSubIndex := 0 to LanguageSystem[SubtableIndex].LanguageSystemTableCount - 1 do
             begin
              str := LanguageSystem[SubtableIndex].LanguageSystemTable[SubSubIndex].DisplayName;
              Items.AddChildObject(SubSubNode, str, LanguageSystem[SubtableIndex].LanguageSystemTable[SubSubIndex]);
             end;

           end;

         // features subtable
         SubNode := Items.AddChildObject(Node, 'Features', FeatureListTable);
         with FeatureListTable do
          for SubtableIndex := 0 to FeatureCount - 1 do
           begin
            str := 'Feature #' + IntToStr(SubtableIndex + 1);

            if Assigned(Feature[SubtableIndex])
             then str := str + ' (' + Feature[SubtableIndex].DisplayName + ')';

            SubSubNode := Items.AddChildObject(SubNode, str, Feature[SubtableIndex]);

            for SubSubIndex := 0 to Feature[SubtableIndex].LookupListCount - 1 do
             begin
              str := 'Loopup #'  + IntToStr(Feature[SubtableIndex].LookupList[SubSubIndex] + 1);
              Items.AddChildObject(SubSubNode, str, LookUpListTable.LookUpTable[Feature[SubtableIndex].LookupList[SubSubIndex]]);
             end;
           end;

         // lookups subtable
         SubNode := Items.AddChildObject(Node, 'Lookups', LookUpListTable);
         with LookUpListTable do
          for SubtableIndex := 0 to LookupTableCount - 1 do
           begin
            str := 'Loopup #' + IntToStr(SubtableIndex + 1);
            str := str + ' (Type ' + IntToStr(LookUpTable[SubtableIndex].LookupType) + ')';
            SubSubNode := Items.AddChildObject(SubNode, str, LookUpTable[SubtableIndex]);

            for SubSubIndex := 0 to LookUpTable[SubtableIndex].SubtableCount - 1 do
             begin
              str := 'Table #'  + IntToStr(SubSubIndex + 1);
              if LookUpTable[SubtableIndex].Subtable[SubSubIndex] is TCustomOpenTypeCoverageTable then
               case TCustomOpenTypeCoverageTable(LookUpTable[SubtableIndex].Subtable[SubSubIndex]).Format of
                cfList : str := str + ' (List)';
                cfRange : str := str + ' (Range)';
               end;

              Items.AddChildObject(SubSubNode, str, LookUpTable[SubtableIndex].Subtable[SubSubIndex]);
             end;
           end;
        end else
      {$ENDIF}

      // glyph data table
      if OptionalTable[OptTableIndex] is TTrueTypeFontGlyphDataTable then
       with TTrueTypeFontGlyphDataTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to GlyphDataCount - 1 do
         begin
          with PostScriptTable.PostscriptV2Table
           do SubNode := Items.AddChildObject(Node, 'Glyph #' +
                IntToStr(SubtableIndex + 1) + ' (' +
                GlyphIndexToString(SubtableIndex) + ')',
                GlyphData[SubtableIndex]);
          if Assigned(GlyphData[SubtableIndex]) then
           begin
            Items.AddChildObject(SubNode, 'Outline', GlyphData[SubtableIndex]);
            if GlyphData[SubtableIndex] is TTrueTypeFontSimpleGlyphData then
             begin
              {$IFDEF ShowContours}
              SubSubNode := Items.AddChildObject(SubNode, 'Points', GlyphData[SubtableIndex]);
              with TTrueTypeFontSimpleGlyphData(GlyphData[SubtableIndex]) do
               for SubSubIndex := 0 to ContourCount - 1
                do Items.AddChildObject(SubSubNode, 'Contour #' + IntToStr(SubSubIndex + 1), Contour[SubSubIndex]);
              {$ELSE}
              Items.AddChildObject(SubNode, 'Points', GlyphData[SubtableIndex]);
              {$ENDIF}
             end;
            Items.AddChildObject(SubNode, 'Instructions', GlyphData[SubtableIndex].Instructions)
           end;
         end;
     end;

   // end update
   Items.EndUpdate;

   // expand tree
   Items[0].Expanded := True;
  end;
end;

end.
