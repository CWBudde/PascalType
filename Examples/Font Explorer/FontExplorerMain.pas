unit FontExplorerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, StdCtrls, ExtCtrls, ToolWin, ActnList, StdActns, AppEvnts,
  ImgList, PT_Types, PT_Tables, PT_TablesOptional, PT_TablesOpenType,
  PT_Interpreter, PT_ByteCodeInterpreter, PT_UnicodeNames;

{.$DEFINE ShowContours}

type
  TFmTTF = class(TForm)
    AcEditCopy: TEditCopy;
    AcEditCut: TEditCut;
    AcEditPaste: TEditPaste;
    AcEditUndo: TEditUndo;
    AcFileOpen: TFileOpen;
    ActionList: TActionList;
    CoolBar: TCoolBar;
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
    MIPaste: TMenuItem;
    MIStatusBar: TMenuItem;
    MIToolbar: TMenuItem;
    MIUndo: TMenuItem;
    MIView: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PnMain: TPanel;
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
    PnPaintBox: TPanel;
    PaintBox: TPaintBox;
    LbFontSize: TLabel;
    CbFontSize: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcFileOpenAccept(Sender: TObject);
    procedure MIExitClick(Sender: TObject);
    procedure MIStatusBarClick(Sender: TObject);
    procedure MIToolbarClick(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxPaint(Sender: TObject);
    procedure CbFontSizeChange(Sender: TObject);
  private
    FInterpreter  : TPascalTypeInterpreter;
    FCurrentGlyph : TBitmap;
    FFontSize     : Integer;
    Fppem         : Integer;
    FScaler       : Single;
    procedure SetFontSize(const Value: Integer);
    procedure InitializeDefaultListView;
    procedure FontChanged;
  protected
    procedure ListViewColumns(Columns: Array of string);

    procedure DisplayCharacterMapSubTable(CharacterMapSubTable: TCustomCharacterMapDirectoryEntry);
    procedure DisplayCharacterMapTable(CharacterMapTable: TPascalTypeCharacterMapTable);
    procedure DisplayControlValueTable(ControlValueTable: TTrueTypeFontControlValueTable);
    procedure DisplayDigitalSignatureBlock(DigitalSignatureBlock: TTrueTypeFontDigitalSignatureBlock);
    procedure DisplayDigitalSignatureTable(DigitalSignatureTable: TTrueTypeFontDigitalSignatureTable);
    procedure DisplayFontInstructionTable(InstructionTable: TCustomTrueTypeFontInstructionTable);
    procedure DisplayFontKerningSubTable(KerningSubtable: TTrueTypeFontKerningSubTable);
    procedure DisplayFontKerningTable(KerningTable: TTrueTypeFontKerningTable);
    procedure DisplayGaspTable(GaspTable: TTrueTypeFontGridFittingAndScanConversionProcedureTable);
    procedure DisplayGlyphData(GlyphData: TCustomTrueTypeFontGlyphData);
    procedure DisplayGlyphDataTable(GlyphDataTable: TTrueTypeFontGlyphDataTable);
    procedure DisplayGlyphDefinitionTable(GlyphDefinitionTable: TOpenTypeGlyphDefinitionTable);
    procedure DisplayGlyphInstructionTable(GlyphInstructionTable: TTrueTypeFontGlyphInstructionTable);
    procedure DisplayHeaderTable(HeaderTable: TPascalTypeHeaderTable);
    procedure DisplayHorizontalHeader(HorizontalHeaderTable: TPascalTypeHorizontalHeaderTable);
    procedure DisplayHorizontalMetrics(HorizontalMetricsTable: TPascalTypeHorizontalMetricsTable);
    procedure DisplayJustificationTable(JustificationTable: TOpenTypeJustificationTable);
    procedure DisplayLinearThresholdTable(LinearThresholdTable: TTrueTypeFontLinearThresholdTable);
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
    procedure DisplayOS2Table(OS2Table: TTrueTypeFontOS2Table);
    procedure DisplayPCL5Table(PCL5Table: TTrueTypeFontPCL5Table);
    procedure DisplayPostscriptTable(PostscriptTable: TPascalTypePostscriptTable);
    procedure DisplayPostscriptV2Table(PostscriptTable: TTrueTypeFontPostscriptVersion2Table);
    procedure DisplayVerticalHeader(VerticalHeaderTable: TTrueTypeFontVerticalHeaderTable);

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
  Math;

procedure TFmTTF.FormCreate(Sender: TObject);
var
  PWindowsDir: array [0..MAX_PATH] of Char;
begin
 Application.OnHint := ShowHint;

 GetWindowsDirectory(PWindowsDir, MAX_PATH);
 AcFileOpen.Dialog.InitialDir := StrPas(PWindowsDir) + '\Fonts';

 FInterpreter := TPascalTypeInterpreter.Create;

 FCurrentGlyph := TBitmap.Create;
 FCurrentGlyph.PixelFormat := pf8bit;
 FFontSize := 96;
 FontSizeChanged;
end;

procedure TFmTTF.FontSizeChanged;
begin
 Fppem := FFontSize * PixelsPerInch div 72;
 FScaler := Fppem / FInterpreter.HeaderTable.UnitsPerEm;
end;

procedure TFmTTF.FormDestroy(Sender: TObject);
begin
 // free pascal type interpreter
 FreeAndNil(FInterpreter);

 // free current glyph display bitmap
 FreeAndNil(FCurrentGlyph);
end;

procedure TFmTTF.FormShow(Sender: TObject);
begin
 LoadFromFile('C:\Temp\Arial.ttf');
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

   // add Version
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(IntToStr(Version));
    end;

   // subtable count
   with ListView.Items.Add do
    begin
     Caption := 'Subtable Count';
     SubItems.Add(IntToStr(CharacterMapSubtableCount));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Feature Parameters';
     SubItems.Add(IntToStr(FeatureParams));
    end;

   // add Number of Lookups
   with ListView.Items.Add do
    begin
     Caption := 'Number of Lookups';
     SubItems.Add(IntToStr(LookupListCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayCustomOpenTypeLanguageSystemTable(
  LanguageSystemTable: TCustomOpenTypeLanguageSystemTable);
begin
 with LanguageSystemTable do
  begin
   InitializeDefaultListView;

   // add Lookup Order
   with ListView.Items.Add do
    begin
     Caption := 'Lookup Order';
     SubItems.Add(IntToStr(LookupOrder));
    end;

   // eventually add Required Feature Index
   if RequiredFeatureIndex <> $FFFF then
    with ListView.Items.Add do
     begin
      Caption := 'Required Feature Index';
      SubItems.Add(IntToStr(RequiredFeatureIndex));
     end;

   // add Number of Features
   with ListView.Items.Add do
    begin
     Caption := 'Number of Features';
     SubItems.Add(IntToStr(FeatureIndexCount));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Number of (non default) Language Systems';
     SubItems.Add(IntToStr(LanguageSystemTableCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayDigitalSignatureBlock(
  DigitalSignatureBlock: TTrueTypeFontDigitalSignatureBlock);
begin
 with DigitalSignatureBlock do
  begin
   InitializeDefaultListView;

   // add Reserved 1
   with ListView.Items.Add do
    begin
     Caption := 'Reserved 1';
     SubItems.Add(IntToStr(Reserved1));
    end;

   // add Reserved 2
   with ListView.Items.Add do
    begin
     Caption := 'Reserved 2';
     SubItems.Add(IntToStr(Reserved2));
    end;

   // add Signature Length
   with ListView.Items.Add do
    begin
     Caption := 'Signature Length';
     SubItems.Add(IntToStr(SignatureLength) + ' byte');
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayDigitalSignatureTable(
  DigitalSignatureTable: TTrueTypeFontDigitalSignatureTable);
begin
 with DigitalSignatureTable do
  begin
   InitializeDefaultListView;

   // add Version
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(IntToStr(Version));
    end;

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
  KerningSubtable: TTrueTypeFontKerningSubTable);
var
  GlyphIndex : Integer;
begin
 with KerningSubtable do
  begin
   // add columns
   ListViewColumns(['Left Glyph #', 'Right Glyph #', 'Value']);

   // begin update (lock)
   ListView.Items.BeginUpdate;

   if FormatTable is TTrueTypeFontKerningFormat0SubTable then
    with TTrueTypeFontKerningFormat0SubTable(FormatTable) do
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
  KerningTable: TTrueTypeFontKerningTable);
begin
 with KerningTable do
  begin
   InitializeDefaultListView;

   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(IntToStr(Version));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGaspTable(
  GaspTable: TTrueTypeFontGridFittingAndScanConversionProcedureTable);
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

   with ListView.Items.Add do
    begin
     Caption := 'Number Of Contours';
     SubItems.Add(IntToStr(NumberOfContours));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Minimum x for coordinate data';
     SubItems.Add(IntToStr(XMin));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Minimum y for coordinate data';
     SubItems.Add(IntToStr(YMin));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Maximum x for coordinate data';
     SubItems.Add(IntToStr(XMax));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Maximum y for coordinate data';
     SubItems.Add(IntToStr(YMax));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayGlyphDataTable(GlyphDataTable: TTrueTypeFontGlyphDataTable);
begin
 with GlyphDataTable do
  begin
   InitializeDefaultListView;

   // add number of glyphs
   with ListView.Items.Add do
    begin
     Caption := 'Number of Glyphs';
     SubItems.Add(IntToStr(GlyphDataCount));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

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
 with HeaderTable do
  begin
   InitializeDefaultListView;

   // add version
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

   // add font revision
   with ListView.Items.Add do
    begin
     Caption := 'Font Revision';
     SubItems.Add(FloatToStrF(FontRevision.Value + FontRevision.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

(*
   with ListView.Items.Add do
    begin
     Caption := 'Checksum Adjustment';
     SubItems.Add(IntToStr(CheckSumAdjustment));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Flags';
     SubItems.Add(IntToStr(Flags));
    end;
*)

   with ListView.Items.Add do
    begin
     Caption := 'Units per em';
     SubItems.Add(IntToStr(UnitsPerEm));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Created';
     SubItems.Add(DateTimeToStr(CreatedDate / 86400 + EncodeDate(1904, 1, 1)));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'Modified';
     SubItems.Add(DateTimeToStr(ModifiedDate / 86400 + EncodeDate(1904, 1, 1)));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'XMin';
     SubItems.Add(IntToStr(XMin));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'YMin';
     SubItems.Add(IntToStr(YMin));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'XMax';
     SubItems.Add(IntToStr(XMax));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'YMax';
     SubItems.Add(IntToStr(YMax));
    end;

   with ListView.Items.Add do
    begin
     Caption := 'MacStyle';

     SubItems.Add(MacStylesToString(MacStyle));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayHorizontalHeader(HorizontalHeaderTable: TPascalTypeHorizontalHeaderTable);
begin
 with HorizontalHeaderTable do
  begin
   InitializeDefaultListView;

   // add typographic ascent
   with ListView.Items.Add do
    begin
     Caption := 'Typographic Ascent';
     SubItems.Add(IntToStr(Ascent));
    end;

   // add typographic descent
   with ListView.Items.Add do
    begin
     Caption := 'Typographic Descent';
     SubItems.Add(IntToStr(Descent));
    end;

   // add line gap
   with ListView.Items.Add do
    begin
     Caption := 'Line Gap';
     SubItems.Add(IntToStr(LineGap));
    end;

   // add Maximum Advance Width
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Advance Width';
     SubItems.Add(IntToStr(AdvanceWidthMax));
    end;

   // add Minimum Left Sidebearing
   with ListView.Items.Add do
    begin
     Caption := 'Minimum Left Sidebearing';
     SubItems.Add(IntToStr(MinLeftSideBearing));
    end;

   // add Minimum Right Sidebearing
   with ListView.Items.Add do
    begin
     Caption := 'Minimum Right Sidebearing';
     SubItems.Add(IntToStr(MinRightSideBearing));
    end;

   // add Maximum Extend (horizontal)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Extend (Horizontal)';
     SubItems.Add(IntToStr(XMaxExtent));
    end;

   // add Caret Slope Rise
   with ListView.Items.Add do
    begin
     Caption := 'Caret Slope Rise';
     SubItems.Add(IntToStr(CaretSlopeRise));
    end;

   // add Caret Slope Run
   with ListView.Items.Add do
    begin
     Caption := 'Caret Slope Run';
     SubItems.Add(IntToStr(CaretSlopeRun));
    end;

   // add Caret Offset
   with ListView.Items.Add do
    begin
     Caption := 'Caret Offset';
     SubItems.Add(IntToStr(CaretOffset));
    end;

   // add Metric Data Format
   with ListView.Items.Add do
    begin
     Caption := 'Metric Data Format';
     SubItems.Add(IntToStr(MetricDataFormat));
    end;

   // add Num Of Long Hor Metrics
   with ListView.Items.Add do
    begin
     Caption := 'NumOfLongHorMetrics';
     SubItems.Add(IntToStr(NumOfLongHorMetrics));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

   // add script count
   with ListView.Items.Add do
    begin
     Caption := 'Number of Scripts';
     SubItems.Add(IntToStr(ScriptCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayLinearThresholdTable(
  LinearThresholdTable: TTrueTypeFontLinearThresholdTable);
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
   with ListView.Items.Add do
    begin
     Caption := 'Number of Glyphs';
     SubItems.Add(IntToStr(NumGlyphs));
    end;

   // add Maximum Points (non-composite)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Points (non-composite)';
     SubItems.Add(IntToStr(MaxPoints));
    end;

   // add Maximum Contours (non-composite)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Contours (non-composite)';
     SubItems.Add(IntToStr(MaxContours));
    end;

   // add Maximum Points (composite)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Points (composite)';
     SubItems.Add(IntToStr(MaxCompositePoints));
    end;

   // add Maximum Contours
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Contours (composite)';
     SubItems.Add(IntToStr(MaxCompositeContours));
    end;

   // add Maximum Zones
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Zones';
     SubItems.Add(IntToStr(MaxZones));
    end;

   // add Maximum Twilight Points (in Z0)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Twilight Points';
     SubItems.Add(IntToStr(MaxTwilightPoints));
    end;

   // add Maximum Storage Area Locations
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Storage Area Locations';
     SubItems.Add(IntToStr(MaxStorage));
    end;

   // add Maximum Function Definitions (FDEF)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Function Definitions (FDEF)';
     SubItems.Add(IntToStr(MaxFunctionDefs));
    end;

   // add Maximum Instruction Definitions (IDEF)
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Instruction Definitions (IDEF)';
     SubItems.Add(IntToStr(MaxInstructionDefs));
    end;

   // add Maximum Stack Elements
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Stack Elements';
     SubItems.Add(IntToStr(MaxStackElements));
    end;

   // add Maximum Size of Glyph Instruction
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Size of Glyph Instruction';
     SubItems.Add(IntToStr(MaxSizeOfInstruction));
    end;

   // add Maximum Number of Components
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Number of Components';
     SubItems.Add(IntToStr(MaxComponentElements));
    end;

   // add Maximum Component Depth
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Component Depth';
     SubItems.Add(IntToStr(MaxComponentDepth));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Format';
     SubItems.Add(IntToStr(Format));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeFeatureListTable(FeatureListTable: TOpenTypeFeatureListTable);
begin
 with FeatureListTable do
  begin
   InitializeDefaultListView;

   // add version
   with ListView.Items.Add do
    begin
     Caption := 'Number of Features';
     SubItems.Add(IntToStr(FeatureCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeLookUpListTable(LookUpListTable: TOpenTypeLookupListTable);
begin
 with LookUpListTable do
  begin
   InitializeDefaultListView;

   // add version
   with ListView.Items.Add do
    begin
     Caption := 'Number of Lookups';
     SubItems.Add(IntToStr(LookupTableCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeLookupTable(LookupTable: TOpenTypeLookupTable);
begin
 with LookupTable do
  begin
   InitializeDefaultListView;

   // add lookup type
   with ListView.Items.Add do
    begin
     Caption := 'Lookup Type';
     SubItems.Add(IntToStr(LookupType));
    end;

   // add lookup flag
   with ListView.Items.Add do
    begin
     Caption := 'Lookup Flag';
     SubItems.Add(IntToStr(LookupFlag));
    end;

   // add mark filtering set
   with ListView.Items.Add do
    begin
     Caption := 'Mark Filtering Set';
     SubItems.Add(IntToStr(MarkFilteringSet));
    end;

   // add number of lookup sub tables
   with ListView.Items.Add do
    begin
     Caption := 'Number of Lookups';
     SubItems.Add(IntToStr(SubtableCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOpenTypeScriptListTable(ScriptListTable: TOpenTypeScriptListTable);
begin
 with ScriptListTable do
  begin
   InitializeDefaultListView;

   // add number of language systems
   with ListView.Items.Add do
    begin
     Caption := 'Number of Language Systems';
     SubItems.Add(IntToStr(LanguageSystemCount));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayOS2Table(OS2Table: TTrueTypeFontOS2Table);
begin
 with OS2Table do
  begin
   InitializeDefaultListView;

   // add version number
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(IntToStr(OS2Table.Version shr 8));
    end;

   // add average weighted advanced width of lower case letters and space
   with ListView.Items.Add do
    begin
     Caption := 'Averge weighted escapement';
     SubItems.Add(IntToStr(XAvgCharWidth));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Type Flags';
     SubItems.Add(IntToStr(FsType));
    end;

   // add recommended horizontal size in pixels for subscripts
   with ListView.Items.Add do
    begin
     Caption := 'Subscript X Size';
     SubItems.Add(IntToStr(YSubscriptXSize));
    end;

   // add recommended vertical size in pixels for subscripts
   with ListView.Items.Add do
    begin
     Caption := 'Subscript Y Size';
     SubItems.Add(IntToStr(YSubscriptYSize));
    end;

   // add recommended horizontal offset for subscripts
   with ListView.Items.Add do
    begin
     Caption := 'SubScript X Offset';
     SubItems.Add(IntToStr(YSubScriptXOffset));
    end;

   // add recommended vertical offset form the baseline for subscripts
   with ListView.Items.Add do
    begin
     Caption := 'Subscript Y Offset';
     SubItems.Add(IntToStr(YSubscriptYOffset));
    end;

   // add recommended horizontal size in pixels for superscripts
   with ListView.Items.Add do
    begin
     Caption := 'Superscript X Size';
     SubItems.Add(IntToStr(YSuperscriptXSize));
    end;

   // add recommended vertical size in pixels for superscripts
   with ListView.Items.Add do
    begin
     Caption := 'Superscript Y Size';
     SubItems.Add(IntToStr(YSuperscriptYSize));
    end;

   // add recommended horizontal offset for superscripts
   with ListView.Items.Add do
    begin
     Caption := 'Superscript X Offset';
     SubItems.Add(IntToStr(YSuperscriptXOffset));
    end;

   // add recommended vertical offset from the baseline for superscripts
   with ListView.Items.Add do
    begin
     Caption := 'Superscript Y Offset';
     SubItems.Add(IntToStr(YSuperscriptYOffset));
    end;

   // add width of the strikeout stroke
   with ListView.Items.Add do
    begin
     Caption := 'Strikeout Size';
     SubItems.Add(IntToStr(YStrikeoutSize));
    end;

   // add position of the strikeout stroke relative to the baseline
   with ListView.Items.Add do
    begin
     Caption := 'Strikeout Position';
     SubItems.Add(IntToStr(YStrikeoutPosition));
    end;

   // add classification of font-family design.
   with ListView.Items.Add do
    begin
     Caption := 'Font Family Class and Subclass';
     SubItems.Add(IntToStr(SFamilyClass));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Vendor Identification';
     SubItems.Add(OS2Table.AchVendID);
    end;

   // add 2-byte bit field containing information concerning the nature of the font patterns
   with ListView.Items.Add do
    begin
     Caption := 'Selection Flags';
     SubItems.Add(IntToStr(FsSelection));
    end;

   // add the minimum Unicode index in this font.
   with ListView.Items.Add do
    begin
     Caption := 'Minimum Unicode Index';
     SubItems.Add('U+' + IntToHex(UsFirstCharIndex, 4));
    end;

   // add the maximum Unicode index in this font.
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Unicode Index';
     SubItems.Add('U+' + IntToHex(UsLastCharIndex, 4));
    end;

   // add STypoAscender
   with ListView.Items.Add do
    begin
     Caption := 'Typographic Ascender';
     SubItems.Add(IntToStr(STypoAscender));
    end;

   // add STypoDescender
   with ListView.Items.Add do
    begin
     Caption := 'Typographic Descender';
     SubItems.Add(IntToStr(STypoDescender));
    end;

   // add STypoLineGap
   with ListView.Items.Add do
    begin
     Caption := 'Typographic Line Gap';
     SubItems.Add(IntToStr(STypoLineGap));
    end;

   // add UsWinAscent
   with ListView.Items.Add do
    begin
     Caption := 'Ascender for Windows';
     SubItems.Add(IntToStr(UsWinAscent));
    end;

   // add UsWinDescent
   with ListView.Items.Add do
    begin
     Caption := 'Descender for Windows';
     SubItems.Add(IntToStr(OS2Table.UsWinDescent));
    end;

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
    with FInterpreter.HorizontalMetrics do
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
      //FInterpreter.
     end;

   PaintBox.Invalidate;
   PnPaintBox.BringToFront;
  end;
end;

procedure TFmTTF.DisplayPCL5Table(PCL5Table: TTrueTypeFontPCL5Table);
var
  str : string;
begin
 with PCL5Table do
  begin
   InitializeDefaultListView;

   // add version
   with ListView.Items.Add do
    begin
     Caption := 'Version';
     SubItems.Add(FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Pitch';
     SubItems.Add(IntToStr(Pitch));
    end;

   // add x-height
   with ListView.Items.Add do
    begin
     Caption := 'X-Height';
     SubItems.Add(IntToStr(XHeight));
    end;

   // add style
   with ListView.Items.Add do
    begin
     Caption := 'Style';
     SubItems.Add(IntToStr(Style));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Caption Height';
     SubItems.Add(IntToStr(CapHeight));
    end;

   // add symbol set
   with ListView.Items.Add do
    begin
     Caption := 'Symbol Set';
     SubItems.Add(IntToStr(SymbolSet));
    end;

   // add typeface
   with ListView.Items.Add do
    begin
     Caption := 'Typeface';
     SubItems.Add(Typeface);
    end;

   // add character complement
   with ListView.Items.Add do
    begin
     Caption := 'Character Complement';
     SubItems.Add(CharacterComplement);
    end;

   // add filename
   with ListView.Items.Add do
    begin
     Caption := 'FileName';
     SubItems.Add(FileName);
    end;

   // add stroke weight
   with ListView.Items.Add do
    begin
     Caption := 'Stroke Weight';
     SubItems.Add(StrokeWeight);
    end;

   // add width type
   with ListView.Items.Add do
    begin
     Caption := 'Width Type';
     SubItems.Add(WidthType);
    end;

   // add serif style
   with ListView.Items.Add do
    begin
     Caption := 'Serif Style';
     SubItems.Add(IntToStr(SerifStyle));
    end;

   // add padding
   with ListView.Items.Add do
    begin
     Caption := 'Padding';
     SubItems.Add(IntToStr(Padding));
    end;

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
   with ListView.Items.Add do
    begin
     Caption := 'Format Type';
     SubItems.Add(FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

   // add Italic Angle
   with ListView.Items.Add do
    begin
     Caption := 'Italic Angle';
     SubItems.Add(FloatToStrF(ItalicAngle.Value + ItalicAngle.Fract / (1 shl 16), ffGeneral, 4, 4));
    end;

   // add Underline Position
   with ListView.Items.Add do
    begin
     Caption := 'Underline Position';
     SubItems.Add(IntToStr(UnderlinePosition));
    end;

   // add Underline Thickness
   with ListView.Items.Add do
    begin
     Caption := 'Underline Thickness';
     SubItems.Add(IntToStr(UnderlineThickness));
    end;

   // add IsFixedPitch
   with ListView.Items.Add do
    begin
     Caption := 'Is Fixed Pitch';
     SubItems.Add(IntToStr(IsFixedPitch));
    end;

   // add MinMemType42
   with ListView.Items.Add do
    begin
     Caption := 'Minimum Memory Usage (TrueType)';
     SubItems.Add(IntToStr(MinMemType42));
    end;

   // add MaxMemType42
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Memory Usage (TrueType)';
     SubItems.Add(IntToStr(MaxMemType42));
    end;

   // add MinMemType1
   with ListView.Items.Add do
    begin
     Caption := 'Minimum Memory Usage (Type 1)';
     SubItems.Add(IntToStr(MinMemType1));
    end;

   // add MaxMemType1
   with ListView.Items.Add do
    begin
     Caption := 'Maximum Memory Usage (Type 1)';
     SubItems.Add(IntToStr(MaxMemType1));
    end;

   ListView.BringToFront;
  end;
end;

procedure TFmTTF.DisplayPostscriptV2Table(
  PostscriptTable: TTrueTypeFontPostscriptVersion2Table);
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
  VerticalHeaderTable: TTrueTypeFontVerticalHeaderTable);
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
   if TObject(Node.Data) is TTrueTypeFontOS2Table
    then DisplayOS2Table(TTrueTypeFontOS2Table(Node.Data)) else

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

   // Control Value Table
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
   if TObject(Node.Data) is TTrueTypeFontPostscriptVersion2Table
    then DisplayPostscriptV2Table(TTrueTypeFontPostscriptVersion2Table(Node.Data)) else

   // Grid Fitting and Scan Conversion Procedure Table
   if TObject(Node.Data) is TTrueTypeFontGridFittingAndScanConversionProcedureTable
    then DisplayGaspTable(TTrueTypeFontGridFittingAndScanConversionProcedureTable(Node.Data)) else

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
   if TObject(Node.Data) is TTrueTypeFontDigitalSignatureTable
    then DisplayDigitalSignatureTable(TTrueTypeFontDigitalSignatureTable(Node.Data)) else

     // Digital Signature Block
   if TObject(Node.Data) is TTrueTypeFontDigitalSignatureBlock
    then DisplayDigitalSignatureBlock(TTrueTypeFontDigitalSignatureBlock(Node.Data)) else

   // Kerning Table
   if TObject(Node.Data) is TTrueTypeFontKerningTable
    then DisplayFontKerningTable(TTrueTypeFontKerningTable(Node.Data)) else

   // Kerning Subtable
   if TObject(Node.Data) is TTrueTypeFontKerningSubTable
    then DisplayFontKerningSubTable(TTrueTypeFontKerningSubTable(Node.Data)) else

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
   if TObject(Node.Data) is TTrueTypeFontLinearThresholdTable
    then DisplayLinearThresholdTable(TTrueTypeFontLinearThresholdTable(Node.Data)) else

   // PCL 5 Table
   if TObject(Node.Data) is TTrueTypeFontPCL5Table
    then DisplayPCL5Table(TTrueTypeFontPCL5Table(Node.Data)) else

   // Vertical Metrics Header Table
   if TObject(Node.Data) is TTrueTypeFontVerticalHeaderTable
    then DisplayVerticalHeader(TTrueTypeFontVerticalHeaderTable(Node.Data)) else

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
   FInterpreter.LoadFromFile(FileName);

   // query stop
   QueryPerformanceCounter(Stop);

   // query performance frequency
   QueryPerformanceFrequency(Freq);

   // initialize listview
   InitializeDefaultListView;

   // add loading time
   with ListView.Items.Add do
    begin
     Caption := 'loading time';
     SubItems.Add(FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms');
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
   with ListView.Items.Add do
    begin
     Caption := 'building tree time';
     SubItems.Add(FloatToStrF((Stop - Start) * 1000 / Freq, ffGeneral, 4, 4) + ' ms');
    end;

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
 with FInterpreter, TreeView do
  begin
   // set width and height of current glyph bitmap
   FScaler := Fppem / HeaderTable.UnitsPerEm;
   FCurrentGlyph.Width := Fppem * (1 shl 16) div (HeaderTable.UnitsPerEm);
   FCurrentGlyph.Height := Fppem * (1 shl 16) div (HeaderTable.UnitsPerEm);

   // begin update
   Items.BeginUpdate;

   // add font header table
   Items.AddChildObject(Items[0], 'head', HeaderTable);

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

   // add horizontal header
   Items.AddChildObject(Items[0], 'hhea', HorizontalHeader);

   // add horizontal metrics
   Items.AddChildObject(Items[0], 'hmtx', HorizontalMetrics);

   // add postscript table
   Node := Items.AddChildObject(Items[0], 'post', PostScriptTable);
   if Assigned(PostScriptTable.PostscriptV2Table)
    then Items.AddChildObjectFirst(Node, 'Glyph Names', PostScriptTable.PostscriptV2Table);

   // add maximum profile table
   Items.AddChildObject(Items[0], 'maxp', MaximumProfile);

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

   // add additional tables
   for OptTableIndex := 0 to OptionalTableCount - 1 do
    with OptionalTable[OptTableIndex] do
     begin
      Node := Items.AddChildObject(Items[0], GetTableType, OptionalTable[OptTableIndex]);

      // digital signature
      if OptionalTable[OptTableIndex] is TTrueTypeFontDigitalSignatureTable then
       with TTrueTypeFontDigitalSignatureTable(OptionalTable[OptTableIndex]) do
        for SubtableIndex := 0 to SignatureCount - 1
         do Items.AddChildObject(Node, 'Signature #' + IntToStr(SubtableIndex + 1), SignatureBlock[SubtableIndex]) else

      // kerning table
      if OptionalTable[OptTableIndex] is TTrueTypeFontKerningTable then
       with TTrueTypeFontKerningTable(OptionalTable[OptTableIndex]) do
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
