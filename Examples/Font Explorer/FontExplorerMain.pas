unit FontExplorerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, StdCtrls, ExtCtrls, ToolWin, ActnList, StdActns, AppEvnts,
  ImgList, PT_Types, PT_Tables, PT_TablesTrueType, PT_TablesOptional,
  PT_TablesBitmap, PT_TablesOpenType, PT_Interpreter, PT_ByteCodeInterpreter,
  PT_UnicodeNames, PT_Rasterizer, FE_FontHeader;

{.$DEFINE ShowContours}

type
  TFmTTF = class(TForm)
    AcEditCopy: TEditCopy;
    AcEditCut: TEditCut;
    AcEditPaste: TEditPaste;
    AcEditUndo: TEditUndo;
    AcFileOpen: TFileOpen;
    ActionList: TActionList;
    CbFontSize: TComboBox;
    CoolBar: TCoolBar;
    FontDialog: TFontDialog;
    LbFontSize: TLabel;
    ListBox: TListBox;
    ListView: TListView;
    MainMenu: TMainMenu;
    MIAbout: TMenuItem;
    MiCopy: TMenuItem;
    MICut: TMenuItem;
    MIEdit: TMenuItem;
    MIExit: TMenuItem;
    MIFile: TMenuItem;
    MIHelp: TMenuItem;
    MIOpen: TMenuItem;
    MIOpenFromInstalled: TMenuItem;
    MIPaste: TMenuItem;
    MIStatusBar: TMenuItem;
    MIToolbar: TMenuItem;
    MIUndo: TMenuItem;
    MIView: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
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
    FrFontHeader: TFrameFontHeader;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcFileOpenAccept(Sender: TObject);
    procedure CbFontSizeChange(Sender: TObject);
    procedure MIExitClick(Sender: TObject);
    procedure MIOpenFromInstalledClick(Sender: TObject);
    procedure MIStatusBarClick(Sender: TObject);
    procedure MIToolbarClick(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    FRasterizer   : TPascalTypeRasterizer;
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

    procedure DisplayBitmapSizeTable(BitmapSizeTable: TPascalTypeBitmapSizeTable);
    procedure DisplayCharacterMapSubTable(CharacterMapSubTable: TCustomCharacterMapDirectoryEntry);
    procedure DisplayCharacterMapTable(CharacterMapTable: TPascalTypeCharacterMapTable);
    procedure DisplayControlValueTable(ControlValueTable: TTrueTypeFontControlValueTable);
    procedure DisplayDigitalSignatureBlock(DigitalSignatureBlock: TPascalTypeDigitalSignatureBlock);
    procedure DisplayDigitalSignatureTable(DigitalSignatureTable: TPascalTypeDigitalSignatureTable);
    procedure DisplayEmbeddedBitmapDataTable(BitmapDataTable: TPascalTypeEmbeddedBitmapDataTable);
    procedure DisplayEmbeddedBitmapLocationTable(BitmapLocationTable: TPascalTypeEmbeddedBitmapLocationTable);
    procedure DisplayEmbeddedBitmapScalingTable(BitmapScalingTable: TPascalTypeEmbeddedBitmapScalingTable);
    procedure DisplayFontInstructionTable(InstructionTable: TCustomTrueTypeFontInstructionTable);
    procedure DisplayFontKerningSubTable(KerningSubtable: TPascalTypeKerningSubTable);
    procedure DisplayFontKerningTable(KerningTable: TPascalTypeKerningTable);
    procedure DisplayGaspTable(GaspTable: TPascalTypeGridFittingAndScanConversionProcedureTable);
    procedure DisplayGlyphData(GlyphData: TCustomTrueTypeFontGlyphData);
    procedure DisplayGlyphDataTable(GlyphDataTable: TTrueTypeFontGlyphDataTable);
    procedure DisplayGlyphDefinitionTable(GlyphDefinitionTable: TOpenTypeGlyphDefinitionTable);
    procedure DisplayGlyphInstructionTable(GlyphInstructionTable: TTrueTypeFontGlyphInstructionTable);
    procedure DisplayHeaderTable(HeaderTable: TPascalTypeHeaderTable);
    procedure DisplayHorizontalHeader(HorizontalHeaderTable: TPascalTypeHorizontalHeaderTable);
    procedure DisplayHorizontalMetrics(HorizontalMetricsTable: TPascalTypeHorizontalMetricsTable);
    procedure DisplayJustificationTable(JustificationTable: TOpenTypeJustificationTable);
    procedure DisplayLinearThresholdTable(LinearThresholdTable: TPascalTypeLinearThresholdTable);
    procedure DisplayLocationTable(LocationTable: TTrueTypeFontLocationTable);
    procedure DisplayMaximumProfileTable(MaximumProfileTable: TPascalTypeMaximumProfileTable);
    procedure DisplayNameTable(NameTable: TPascalTypeNameTable);
    procedure DisplayNameUnicodeTable(NameTable: TPascalTypeNameTable);
    procedure DisplayNameAppleTable(NameTable: TPascalTypeNameTable);
    procedure DisplayNameMicrosoftTable(NameTable: TPascalTypeNameTable);
    procedure DisplayOpenTypeCommonTable(OpenTypeCommonTable: TCustomOpenTypeCommonTable);
    procedure DisplayOpenTypeScriptListTable(ScriptListTable: TOpenTypeScriptListTable);
    procedure DisplayOpenTypeFeatureListTable(FeatureListTable: TOpenTypeFeatureListTable);
    procedure DisplayOpenTypeLookUpListTable(LookUpListTable: TOpenTypeLookupListTable);
    procedure DisplayOS2Table(OS2Table: TPascalTypeOS2Table);
    procedure DisplayPCL5Table(PCL5Table: TPascalTypePCL5Table);
    procedure DisplayPostscriptTable(PostscriptTable: TPascalTypePostscriptTable);
    procedure DisplayPostscriptV2Table(PostscriptTable: TPascalTypePostscriptVersion2Table);
    procedure DisplayVerticalHeader(VerticalHeaderTable: TPascalTypeVerticalHeaderTable);

    procedure DisplayCustomOpenTypeScriptTable(ScriptTable: TCustomOpenTypeScriptTable);
    procedure DisplayCustomOpenTypeLanguageSystemTable(LanguageSystemTable: TCustomOpenTypeLanguageSystemTable);
    procedure DisplayCustomOpenTypeFeatureTable(FeatureTable: TCustomOpenTypeFeatureTable);
    procedure DisplayCustomOpenTypeClassDefinitionTable(ClasDefinitionTable: TCustomOpenTypeClassDefinitionTable);
    procedure DisplayOpenTypeMarkGlyphSetTable(MarkGlyphSetTable: TOpenTypeMarkGlyphSetTable);
    procedure DisplayOpenTypeLookupTable(LookupTable: TOpenTypeLookupTable);

    procedure DisplayGlyphDataPoints(SimpleGlyphData: TTrueTypeFontSimpleGlyphData);
    procedure DisplayGlyphDataSimpleOutline(SimpleGlyphData: TTrueTypeFontSimpleGlyphData);
    procedure DisplayGlyphDataCompositeOutline(CompositeGlyphData: TTrueTypeFontCompositeGlyphData);
    procedure DisplayGlyphDataContour(Contour: TPascalTypeContour);

    procedure FontSizeChanged;
  public
    procedure LoadFromFile(Filename: TFileName);

    property FontSize: Integer read FFontSize write SetFontSize;
  end;

var
  FmTTF: TFmTTF;

implementation

{$R *.dfm}

uses
  ShlObj, ActiveX, Math;

procedure StrResetLength(var S: AnsiString);
begin
 SetLength(S, StrLen(PChar(S)));
end;

function PidlToPath(IdList: PItemIdList): string;
begin
 SetLength(Result, MAX_PATH);
 if SHGetPathFromIdList(IdList, PChar(Result))
  then StrResetLength(Result)
  else Result := '';
end;

function PidlFree(var IdList: PItemIdList): Boolean;
var
  Malloc: IMalloc;
begin
 Result := False;
 if IdList = nil
  then Result := True
  else
   begin
    if Succeeded(SHGetMalloc(Malloc)) and (Malloc.DidAlloc(IdList) > 0) then
     begin
      Malloc.Free(IdList);
      IdList := nil;
      Result := True;
     end;
   end;
end;

function GetFontDirectory: string;
var
  lFolderPidl: PItemIdList;
begin
  if Succeeded(SHGetSpecialFolderLocation(0, CSIDL_FONTS, lFolderPidl)) then
  begin
    Result := PidlToPath(lFolderPidl);
    PidlFree(lFolderPidl);
  end
  else
    Result := '';
end;

procedure TFmTTF.FormCreate(Sender: TObject);
var
  PWindowsDir: array [0..MAX_PATH] of Char;
begin
 Application.OnHint := ShowHint;

 GetWindowsDirectory(PWindowsDir, MAX_PATH);
 AcFileOpen.Dialog.InitialDir := GetFontDirectory;

 FRasterizer := TPascalTypeRasterizer.Create;

 FCurrentGlyph := TBitmap.Create;
 FCurrentGlyph.PixelFormat := pf8bit;
 FFontSize := 96;
 FontSizeChanged;
end;

procedure TFmTTF.FontSizeChanged;
begin
 Fppem := FFontSize * PixelsPerInch div 72;
 FScaler := Fppem / FRasterizer.Interpreter.HeaderTable.UnitsPerEm;
end;

procedure TFmTTF.FormDestroy(Sender: TObject);
begin
 // free pascal type interpreter
 FreeAndNil(FRasterizer);

 // free current glyph display bitmap
 FreeAndNil(FCurrentGlyph);
end;

procedure TFmTTF.FormShow(Sender: TObject);
begin
 LoadFromFile(GetFontDirectory + '\cour.ttf');
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

procedure TFmTTF.PaintBoxPaint(Sender: TObject);
begin
 PaintBox.Canvas.Draw((Width - FCurrentGlyph.Width) div 2,
   (Height - FCurrentGlyph.Height) div 2, FCurrentGlyph);
end;

procedure TFmTTF.CbFontSizeChange(Sender: TObject);
begin
 FontSize := StrToInt(CbFontSize.Text);
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
  CharacterMapSubTable: TCustomCharacterMapDirectoryEntry);
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

   if CharacterMap is TTrueTypeFontFormat0CharacterMap then
    for CharIndex := Low(Byte) to High(Byte) do
     with ListView.Items.Add do
      begin
       Caption := IntToStr(CharIndex);
       SubItems.Add(IntToStr(CharacterMap.CharacterToGlyph(CharIndex)));
      end else
   if CharacterMap is TTrueTypeFontFormat4CharacterMap then
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

procedure TFmTTF.DisplayEmbeddedBitmapDataTable(
  BitmapDataTable: TPascalTypeEmbeddedBitmapDataTable);
begin
 with BitmapDataTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayEmbeddedBitmapLocationTable(
  BitmapLocationTable: TPascalTypeEmbeddedBitmapLocationTable);
begin
 with BitmapLocationTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayEmbeddedBitmapScalingTable(
  BitmapScalingTable: TPascalTypeEmbeddedBitmapScalingTable);
begin
 with BitmapScalingTable do
  begin
   InitializeDefaultListView;

   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

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

   // show Minimum x for coordinate data
   ListViewData(['Minimum x for coordinate data', IntToStr(XMin)]);

   ListViewData(['Minimum y for coordinate data', IntToStr(YMin)]);

   ListViewData(['Maximum x for coordinate data', IntToStr(XMax)]);

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

procedure TFmTTF.DisplayGlyphDefinitionTable(
  GlyphDefinitionTable: TOpenTypeGlyphDefinitionTable);
begin
 with GlyphDefinitionTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

   ListView.BringToFront;
  end;
end;

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
   EdFontRevision.Text := FloatToStrF(FontRevision.Value + FontRevision.Fract / (1 shl 16), ffGeneral, 4, 4);
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

procedure TFmTTF.DisplayJustificationTable(
  JustificationTable: TOpenTypeJustificationTable);
begin
 with JustificationTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

   // add script count
   ListViewData(['Number of Scripts', IntToStr(ScriptCount)]);

   ListView.BringToFront;
  end;
end;

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

   for StrIndex := 0 to NameRecordCount - 1 do
    with ListView.Items.Add do
     begin
      case NameRecord[StrIndex].PlatformID of
       piApple: str := 'Apple';
       piUnicode: str := 'Unicode';
       piMicrosoft: str := 'Microsoft';
      end;

      case NameRecord[StrIndex].NameID of
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
      SubItems.Add(NameRecord[StrIndex].Name);
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

   for StrIndex := 0 to NameRecordCount - 1 do
    begin
     case NameRecord[StrIndex].PlatformID of
      piUnicode: Continue;
      piMicrosoft: Continue;
     end;

     with ListView.Items.Add do
      begin
       case NameRecord[StrIndex].NameID of
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

       SubItems.Add(NameRecord[StrIndex].Name);
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

   for StrIndex := 0 to NameRecordCount - 1 do
    begin
     case NameRecord[StrIndex].PlatformID of
       piApple: Continue;
       piMicrosoft: Continue;
      end;

     with ListView.Items.Add do
      begin
       case NameRecord[StrIndex].NameID of
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

       SubItems.Add(NameRecord[StrIndex].Name);
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

   for StrIndex := 0 to NameRecordCount - 1 do
    begin
     case NameRecord[StrIndex].PlatformID of
      piUnicode: Continue;
      piApple: Continue;
     end;

     with ListView.Items.Add do
      begin
       case NameRecord[StrIndex].NameID of
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

       SubItems.Add(NameRecord[StrIndex].Name);
      end;
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeCommonTable(
  OpenTypeCommonTable: TCustomOpenTypeCommonTable);
begin
 with OpenTypeCommonTable do
  begin
   InitializeDefaultListView;

   // add version
   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

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

procedure TFmTTF.DisplayOS2Table(OS2Table: TPascalTypeOS2Table);
begin
 with OS2Table do
  begin
   InitializeDefaultListView;

   // add version number
   ListViewData(['Version', IntToStr(OS2Table.Version shr 8)]);

   // add average weighted advanced width of lower case letters and space
   ListViewData(['Averge weighted escapement', IntToStr(XAvgCharWidth)]);

   // add visual weight (degree of blackness or thickness) of stroke in glyphs
   with ListView.Items.Add do
    begin
     Caption := 'Weight Class';
     case Swap(Word(OS2Table.UsWeightClass)) of
      100 : SubItems.Add('Thin');
      200 : SubItems.Add('ExtraLight');
      300 : SubItems.Add('Light');
      400 : SubItems.Add('Normal');
      500 : SubItems.Add('Medium');
      600 : SubItems.Add('SemiBold');
      700 : SubItems.Add('Bold');
      800 : SubItems.Add('ExtraBold');
      900 : SubItems.Add('Black');
     end;
    end;

   // add relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in the font
   with ListView.Items.Add do
    begin
     Caption := 'Width Class';
     case Swap(Word(OS2Table.UsWidthClass)) of
      1 : SubItems.Add('Ultra-condensed');
      2 : SubItems.Add('Extra-condensed');
      3 : SubItems.Add('Condensed');
      4 : SubItems.Add('Semi-condensed');
      5 : SubItems.Add('Medium (normal)');
      6 : SubItems.Add('Semi-expanded');
      7 : SubItems.Add('Expanded');
      8 : SubItems.Add('Extra-expanded');
      9 : SubItems.Add('Ultra-expanded');
      else SubItems.Add('Unknown: ' + IntToStr(Swap(Word(OS2Table.UsWidthClass))));
     end;
    end;

   // add characteristics and properties of this font (set undefined bits to zero)
   ListViewData(['Type Flags', IntToStr(FsType)]);

   // add recommended horizontal size in pixels for subscripts
   ListViewData(['Subscript X Size', IntToStr(YSubscriptXSize)]);

   // add recommended vertical size in pixels for subscripts
   ListViewData(['Subscript Y Size', IntToStr(YSubscriptYSize)]);

   // add recommended horizontal offset for subscripts
   ListViewData(['SubScript X Offset', IntToStr(YSubScriptXOffset)]);

   // add recommended vertical offset form the baseline for subscripts
   ListViewData(['Subscript Y Offset', IntToStr(YSubscriptYOffset)]);

   // add recommended horizontal size in pixels for superscripts
   ListViewData(['Superscript X Size', IntToStr(YSuperscriptXSize)]);

   // add recommended vertical size in pixels for superscripts
   ListViewData(['Superscript Y Size', IntToStr(YSuperscriptYSize)]);

   // add recommended horizontal offset for superscripts
   ListViewData(['Superscript X Offset', IntToStr(YSuperscriptXOffset)]);

   // add recommended vertical offset from the baseline for superscripts
   ListViewData(['Superscript Y Offset', IntToStr(YSuperscriptYOffset)]);

   // add width of the strikeout stroke
   ListViewData(['Strikeout Size', IntToStr(YStrikeoutSize)]);

   // add position of the strikeout stroke relative to the baseline
   ListViewData(['Strikeout Position', IntToStr(YStrikeoutPosition)]);

   // add classification of font-family design.
   ListViewData(['Font Family Class and Subclass', IntToStr(SFamilyClass)]);

(*
   // add 10 byte series of number used to describe the visual characteristics of a given typeface
   with ListView.Items.Add do
    begin
     Caption := 'Panose';
     SubItems.Add(IntToStr(OS2Table.Panose));
    end;

   // add Field is split into two bit fields of 96 and 36 bits each. The low 96 bits are used to specify the Unicode blocks encompassed by the font file. The high 32 bits are used to specify the character or script sets covered by the font file. Bit assignments are pending. Set to 01
   with ListView.Items.Add do
    begin
     Caption := 'UlUnicodeRange';
     SubItems.Add(IntToStr(OS2Table.UlUnicodeRange));
    end;
*)

   // add four character identifier for the font vendor
   ListViewData(['Vendor Identification', OS2Table.AchVendID]);

   // add 2-byte bit field containing information concerning the nature of the font patterns
   ListViewData(['Selection Flags', IntToStr(FsSelection)]);

   // add the minimum Unicode index in this font.
   ListViewData(['Minimum Unicode Index', 'U+' + IntToHex(UsFirstCharIndex, 4)]);

   // add the maximum Unicode index in this font.
   ListViewData(['Maximum Unicode Index', 'U+' + IntToHex(UsLastCharIndex, 4)]);

   // add STypoAscender
   ListViewData(['Typographic Ascender', IntToStr(STypoAscender)]);

   // add STypoDescender
   ListViewData(['Typographic Descender', IntToStr(STypoDescender)]);

   // add STypoLineGap
   ListViewData(['Typographic Line Gap', IntToStr(STypoLineGap)]);

   // add UsWinAscent
   ListViewData(['Ascender for Windows', IntToStr(UsWinAscent)]);

   // add UsWinDescent
   ListViewData(['Descender for Windows', IntToStr(OS2Table.UsWinDescent)]);

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

procedure TFmTTF.DisplayGlyphDataContour(Contour: TPascalTypeContour);
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
  ContourIndex : Integer;
  PointIndex   : Integer;
  Center       : TPoint;
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
    with FRasterizer.Interpreter.HorizontalMetrics do
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
      MoveTo(Center.X + Round(Point[0].XPos * FScaler),
        Center.Y - Round(Point[0].YPos * FScaler));
      for PointIndex := 1 to PointCount - 1 do
       begin
        LineTo(Center.X + Round(Point[PointIndex].XPos * FScaler),
          Center.Y - Round(Point[PointIndex].YPos * FScaler));
       end;
      LineTo(Center.X + Round(Point[0].XPos * FScaler),
        Center.Y - Round(Point[0].YPos * FScaler));
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
         then Brush.Color := clSilver
         else Brush.Color := clGray;

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
      //FRasterizer.Interpreter.
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
   ListViewData(['Version', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

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
   ListViewData(['Stroke Weight', StrokeWeight]);

   // add width type
   ListViewData(['Width Type', WidthType]);

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

   // add  Format Type
   ListViewData(['Format Type', FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4)]);

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

procedure TFmTTF.DisplayVerticalHeader(
  VerticalHeaderTable: TPascalTypeVerticalHeaderTable);
begin
 with VerticalHeaderTable do
  begin
   InitializeDefaultListView;

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
      StatusBar.SimpleText := 'Table ID: ' + GetTableType;
     end;
  end;
end;

procedure TFmTTF.MIExitClick(Sender: TObject);
begin
 Close;
end;

procedure TFmTTF.MIOpenFromInstalledClick(Sender: TObject);
var
  SR : TSearchRec;
begin
 if FontDialog.Execute then
  begin
   SetCurrentDir(GetFontDirectory);

   with TPascalTypeScanner.Create do
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

   // 0S/2 Table
   if TObject(Node.Data) is TPascalTypeOS2Table
    then DisplayOS2Table(TPascalTypeOS2Table(Node.Data)) else

   // Character Map Table
   if TObject(Node.Data) is TPascalTypeCharacterMapTable
    then DisplayCharacterMapTable(TPascalTypeCharacterMapTable(Node.Data)) else

   // Character Map SubTable
   if TObject(Node.Data) is TCustomCharacterMapDirectoryEntry
    then DisplayCharacterMapSubTable(TCustomCharacterMapDirectoryEntry(Node.Data)) else

   // Maximum Profile Table
   if TObject(Node.Data) is TPascalTypeMaximumProfileTable
    then DisplayMaximumProfileTable(TPascalTypeMaximumProfileTable(Node.Data)) else

   // Control Value Table
   if TObject(Node.Data) is TTrueTypeFontControlValueTable
    then DisplayControlValueTable(TTrueTypeFontControlValueTable(Node.Data)) else

   // Embedded Bitmap Data Table
   if TObject(Node.Data) is TPascalTypeEmbeddedBitmapDataTable
    then DisplayEmbeddedBitmapDataTable(TPascalTypeEmbeddedBitmapDataTable(Node.Data)) else

   // Embedded Bitmap Location Table
   if TObject(Node.Data) is TPascalTypeEmbeddedBitmapLocationTable
    then DisplayEmbeddedBitmapLocationTable(TPascalTypeEmbeddedBitmapLocationTable(Node.Data)) else

   // Embedded Bitmap Scaling Table
   if TObject(Node.Data) is TPascalTypeEmbeddedBitmapScalingTable
    then DisplayEmbeddedBitmapScalingTable(TPascalTypeEmbeddedBitmapScalingTable(Node.Data)) else

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

   // Glyph Definition Table
   if TObject(Node.Data) is TOpenTypeGlyphDefinitionTable
    then DisplayGlyphDefinitionTable(TOpenTypeGlyphDefinitionTable(Node.Data)) else

   // Glyph Instruction Table
   if TObject(Node.Data) is TTrueTypeFontGlyphInstructionTable
    then DisplayGlyphInstructionTable(TTrueTypeFontGlyphInstructionTable(Node.Data)) else

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

   // Digital Signature Table
   if TObject(Node.Data) is TPascalTypeDigitalSignatureTable
    then DisplayDigitalSignatureTable(TPascalTypeDigitalSignatureTable(Node.Data)) else

     // Digital Signature Block
   if TObject(Node.Data) is TPascalTypeDigitalSignatureBlock
    then DisplayDigitalSignatureBlock(TPascalTypeDigitalSignatureBlock(Node.Data)) else

   // Kerning Table
   if TObject(Node.Data) is TPascalTypeKerningTable
    then DisplayFontKerningTable(TPascalTypeKerningTable(Node.Data)) else

   // Kerning Subtable
   if TObject(Node.Data) is TPascalTypeKerningSubTable
    then DisplayFontKerningSubTable(TPascalTypeKerningSubTable(Node.Data)) else

   // Location Table
   if TObject(Node.Data) is TTrueTypeFontLocationTable
    then DisplayLocationTable(TTrueTypeFontLocationTable(Node.Data)) else

   // Justification Table
   if TObject(Node.Data) is TOpenTypeJustificationTable
    then DisplayJustificationTable(TOpenTypeJustificationTable(Node.Data)) else

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
   if TObject(Node.Data) is TPascalTypeContour
    then DisplayGlyphDataContour(TPascalTypeContour(Node.Data)) else

   // Linear Threshold Table
   if TObject(Node.Data) is TPascalTypeLinearThresholdTable
    then DisplayLinearThresholdTable(TPascalTypeLinearThresholdTable(Node.Data)) else

   // PCL 5 Table
   if TObject(Node.Data) is TPascalTypePCL5Table
    then DisplayPCL5Table(TPascalTypePCL5Table(Node.Data)) else

   // Vertical Metrics Header Table
   if TObject(Node.Data) is TPascalTypeVerticalHeaderTable
    then DisplayVerticalHeader(TPascalTypeVerticalHeaderTable(Node.Data)) else

   // other non-required tables
   if TObject(Node.Data) is TCustomPascalTypeNamedTable then
    with TCustomPascalTypeNamedTable(Node.Data) do
     begin
      ListView.Clear;

      with ListView.Items.Add do
       begin
        Caption := GetTableType;
       end;
     end;
  end;
end;

procedure TFmTTF.LoadFromFile(Filename: TFileName);
var
  Start, Stop, Freq : Int64;
begin
 if FileExists(FileName) then
  begin
   // query start
   QueryPerformanceCounter(Start);

   // load font file
   FRasterizer.Interpreter.LoadFromFile(FileName);

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

procedure TFmTTF.FontChanged;
var
  OptTableIndex     : Integer;
  SubtableIndex     : Integer;
  Node, SubNode     : TTreeNode;
  SubSubNode        : TTreeNode;
  SubSubIndex       : Integer;
  str               : string;
begin
 with FRasterizer.Interpreter, TreeView do
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
   for SubtableIndex := 0 to CharacterMap.CharacterMapSubtableCount - 1 do
    begin
     case CharacterMap.CharacterMapSubtable[SubtableIndex].PlatformID of
      piUnicode   : Items.AddChildObjectFirst(Node, 'Unicode', CharacterMap.CharacterMapSubtable[SubtableIndex]);
      piApple     : Items.AddChildObjectFirst(Node, 'Apple', CharacterMap.CharacterMapSubtable[SubtableIndex]);
      piMicrosoft : Items.AddChildObjectFirst(Node, 'Microsoft', CharacterMap.CharacterMapSubtable[SubtableIndex]);
      else Items.AddChildObjectFirst(Node, 'Unknown', CharacterMap.CharacterMapSubtable[SubtableIndex]);
     end;
    end;

   // add name table
   Node := Items.AddChildObject(Items[0], 'name', NameTable);

   // check for Unicode
   for SubtableIndex := 0 to NameTable.NameRecordCount- 1 do
    if NameTable.NameRecord[SubtableIndex].PlatformID = piUnicode then
     begin
      Items.AddChildObject(Node, 'Unicode', NameTable);
      Break;
     end;

   // check for Apple
   for SubtableIndex := 0 to NameTable.NameRecordCount- 1 do
    if NameTable.NameRecord[SubtableIndex].PlatformID = piApple then
     begin
      Items.AddChildObject(Node, 'Apple', NameTable);
      Break;
     end;

   // check for Microsoft
   for SubtableIndex := 0 to NameTable.NameRecordCount- 1 do
    if NameTable.NameRecord[SubtableIndex].PlatformID = piMicrosoft then
     begin
      Items.AddChildObject(Node, 'Microsoft', NameTable);
      Break;
     end;

   // add postscript table
   Node := Items.AddChildObject(Items[0], 'post', PostScriptTable);
   if Assigned(PostScriptTable.PostscriptV2Table)
    then Items.AddChildObjectFirst(Node, 'Glyph Names', PostScriptTable.PostscriptV2Table);

   // add additional tables
   for OptTableIndex := 0 to OptionalTableCount - 1 do
    with OptionalTable[OptTableIndex] do
     begin
      Node := Items.AddChildObject(Items[0], GetTableType, OptionalTable[OptTableIndex]);

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

      // open type common table
      if OptionalTable[OptTableIndex] is TOpenTypeGlyphDefinitionTable then
       with TOpenTypeGlyphDefinitionTable(OptionalTable[OptTableIndex]) do
        begin
         Items.AddChildObject(Node, 'Class Definition', GlyphClassDefinition);
         Items.AddChildObject(Node, 'Mark Attachment Class Definition', MarkAttachmentClassDefinition);
//           Items.AddChildObject(Node, 'Mark Set', MarkGlyphSet);
        end else

      // bitmap location table
      if OptionalTable[OptTableIndex] is TPascalTypeEmbeddedBitmapLocationTable then
       with TPascalTypeEmbeddedBitmapLocationTable(OptionalTable[OptTableIndex]) do
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

      // glyph data table
      if OptionalTable[OptTableIndex] is TTrueTypeFontGlyphDataTable then
       with TTrueTypeFontGlyphDataTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to GlyphDataCount - 1 do
         begin
          SubNode := Items.AddChildObject(Node, 'Glyph #' + IntToStr(SubtableIndex + 1), GlyphData[SubtableIndex]);
          if Assigned(GlyphData[SubtableIndex]) then
           begin
            Items.AddChildObject(SubNode, 'Outline', GlyphData[SubtableIndex]);
            if GlyphData[SubtableIndex] is TTrueTypeFontSimpleGlyphData then
             begin
              SubSubNode := Items.AddChildObject(SubNode, 'Points', GlyphData[SubtableIndex]);
              {$IFDEF ShowContours}
              with TTrueTypeFontSimpleGlyphData(GlyphData[SubtableIndex]) do
               for SubSubIndex := 0 to ContourCount - 1
                do Items.AddChildObject(SubSubNode, 'Contour #' + IntToStr(SubSubIndex + 1), Contour[SubSubIndex]);
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
