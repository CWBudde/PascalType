unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PT_Types, PT_Storage, PT_FontEngineGDI, ExtCtrls, Menus;

type
  TFmComparison = class(TForm)
    LbGDI: TLabel;
    LbPascalType: TLabel;
    MemoGDI: TMemo;
    MemoPT: TMemo;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    MiSaveGDILog: TMenuItem;
    MiSavePascalTypeLog: TMenuItem;
    N1: TMenuItem;
    MiExit: TMenuItem;
    MiCompare: TMenuItem;
    MiGetTextMetrics: TMenuItem;
    MiGetOutlineTextMetrics: TMenuItem;
    MiGetTextExtentPoint32: TMenuItem;
    MiGetGlyphOutline: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MiExitClick(Sender: TObject);
    procedure MiSaveGDILogClick(Sender: TObject);
    procedure MiSavePascalTypeLogClick(Sender: TObject);
    procedure MiGetTextMetricsClick(Sender: TObject);
    procedure MiGetOutlineTextMetricsClick(Sender: TObject);
    procedure MiGetTextExtentPoint32Click(Sender: TObject);
    procedure MiGetGlyphOutlineClick(Sender: TObject);
  private
    FFontEngine      : TPascalTypeFontEngineGDI;
    FCurrentFontSize : Integer;
    procedure TextMetricToMemo(TextMetric: TTextMetricW; Memo: TMemo);
    procedure OutlineTextMetricToMemo(TextMetric: TOutlineTextmetricW; Memo: TMemo);
    procedure GlyphMetricToMemo(GlyphMetrics: TGlyphMetrics; Memo: TMemo);
    procedure GlyphOutlineToMemo(Buffer: Pointer; Size: Integer; Memo: TMemo);
  protected
    procedure CompareGetGlyphOutline;
    procedure CompareGetOutlineTextMetrics;
    procedure CompareGetTextMetrics;
    procedure CompareGetTextExtentPoint32;
  public
  end;

var
  FmComparison: TFmComparison;

implementation

uses
  PT_Windows, PT_FontEngine;

{$R *.dfm}

const
  CIdentity: TTransformationMatrix = (
    xx: (fract: 0; Value: 1);
    xy: (fract: 0; Value: 0);
    yx: (fract: 0; Value: 0);
    yy: (fract: 0; Value: 1);
  );

  CFlipVertical: TTransformationMatrix = (
    xx: (fract: 0; Value: 1);
    xy: (fract: 0; Value: 0);
    yx: (fract: 0; Value: 0);
    yy: (fract: 0; Value: -1);
  );

  CIdentity2: TMat2 = (
    eM11: (fract: 0; Value: 1);
    eM12: (fract: 0; Value: 0);
    eM21: (fract: 0; Value: 0);
    eM22: (fract: 0; Value: 1);
  );

  CFlipVertical2: TMat2 = (
    eM11: (fract: 0; Value: 1);
    eM12: (fract: 0; Value: 0);
    eM21: (fract: 0; Value: 0);
    eM22: (fract: 0; Value: -1);
  );


procedure TFmComparison.FormCreate(Sender: TObject);
begin
 // locate font directory
 SetCurrentDir(GetFontDirectory);

 // create FontEngine
 FFontEngine := TPascalTypeFontEngineGDI.Create;

 // load font: Arial
 FFontEngine.LoadFromFile('arialbi.ttf');

 FCurrentFontSize := 8;
 CompareGetTextMetrics;
end;

procedure TFmComparison.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FFontEngine);
end;

procedure TFmComparison.CompareGetTextMetrics;
var
  TextMetricGDI : TTextMetricW;
  TextMetricPT  : TTextMetricW;
  Font          : TFont;
  DC            : HDC;
begin
 // GDI
 Font := TFont.Create;
 with Font do
  try
   Name := 'Arial';
   Style := [];
   Size := FCurrentFontSize;

   DC := Self.Canvas.Handle;
   SelectObject(DC, Font.Handle);
   GetTextMetricsW(DC, TextMetricGDI);
  finally
   FreeAndNil(Font);
  end;
 TextMetricToMemo(TextMetricGDI, MemoGDI);

 FFontEngine.FontSize := FCurrentFontSize;
 FFontEngine.GetTextMetricsW(TextMetricPT);
 TextMetricToMemo(TextMetricPT, MemoPT);
end;

procedure TFmComparison.MiExitClick(Sender: TObject);
begin
 Close;
end;

procedure TFmComparison.MiGetGlyphOutlineClick(Sender: TObject);
begin
 CompareGetGlyphOutline;
end;

procedure TFmComparison.MiGetOutlineTextMetricsClick(Sender: TObject);
begin
 CompareGetOutlineTextMetrics;
end;

procedure TFmComparison.MiGetTextExtentPoint32Click(Sender: TObject);
begin
 CompareGetTextExtentPoint32;
end;

procedure TFmComparison.MiGetTextMetricsClick(Sender: TObject);
begin
 CompareGetTextMetrics;
 FCurrentFontSize := FCurrentFontSize + 2;
end;

procedure TFmComparison.MiSaveGDILogClick(Sender: TObject);
begin
 with TSaveDialog.Create(Self) do
  try
   Filter := 'Log File (*.log)|*.log';
   DefaultExt := '.log';
   FileName := 'GDI.log';

   if Execute
    then MemoGDI.Lines.SaveToFile(FileName);
  finally
   Free;
  end;
end;

procedure TFmComparison.MiSavePascalTypeLogClick(Sender: TObject);
begin
 with TSaveDialog.Create(Self) do
  try
   Filter := 'Log File (*.log)|*.log';
   DefaultExt := '.log';
   FileName := 'PascalType.log';

   if Execute
    then MemoPT.Lines.SaveToFile(FileName);
  finally
   Free;
  end;
end;

procedure TFmComparison.TextMetricToMemo(TextMetric: TTextMetricW; Memo: TMemo);
var
  str : string;
begin
 Memo.Clear;

 with TextMetric do
  begin
   Memo.Lines.Add('Text Height: ' + IntToStr(tmHeight));
   Memo.Lines.Add('Ascent: ' + IntToStr(tmAscent));
   Memo.Lines.Add('Descent: ' + IntToStr(tmDescent));
   Memo.Lines.Add('Internal Leading: ' + IntToStr(tmInternalLeading));
   Memo.Lines.Add('External Leading: ' + IntToStr(tmExternalLeading));
   Memo.Lines.Add('Average Character Width: ' + IntToStr(tmAveCharWidth));
   Memo.Lines.Add('Maximum Character Width: ' + IntToStr(tmMaxCharWidth));
   Memo.Lines.Add('Weight: ' + IntToStr(tmWeight));
   Memo.Lines.Add('Overhang: ' + IntToStr(tmOverhang));
   Memo.Lines.Add('Digitized Horizontal Aspect: ' + IntToStr(tmDigitizedAspectX));
   Memo.Lines.Add('Digitized Vertical Aspect: ' + IntToStr(tmDigitizedAspectY));
   Memo.Lines.Add('First Character: U+' + IntToHex(Integer(tmFirstChar), 4));
   Memo.Lines.Add('Last Character: U+' + IntToHex(Integer(tmLastChar), 4));
   Memo.Lines.Add('Default Character: U+' + IntToHex(Integer(tmDefaultChar), 4));
   Memo.Lines.Add('Break Character: U+' + IntToHex(Integer(tmBreakChar), 4));
   Memo.Lines.Add('Italic: ' + IntToStr(tmItalic));
   Memo.Lines.Add('Underlined: ' + IntToStr(tmUnderlined));
   Memo.Lines.Add('StruckOut: ' + IntToStr(tmStruckOut));

   if (TMPF_FIXED_PITCH and tmPitchAndFamily) <> 0 then str := 'Fixed Pitch, ' else str := '';
   if (TMPF_VECTOR and tmPitchAndFamily) <> 0 then str := str + 'Vector Font, ';
   if (TMPF_TRUETYPE and tmPitchAndFamily) <> 0 then str := str + 'TrueType Font, ';
   if (TMPF_DEVICE and tmPitchAndFamily) <> 0 then str := str + 'Device Font, ';

   case tmPitchAndFamily and $F0 of
    FF_DECORATIVE : str := str + 'Decorative';
    FF_DONTCARE : str := str + 'Don''t care';
    FF_MODERN : str := str + 'Modern';
    FF_ROMAN : str := str + 'Roman';
    FF_SCRIPT : str := str + 'Script';
    FF_SWISS : str := str + 'Swiss';
    else if Length(str) > 0 then SetLength(str, Length(str) - 2);
   end;

   Memo.Lines.Add('Pitch and Family: ' + IntToStr(tmPitchAndFamily) + ' (' + str + ')');

   case tmCharSet of
    ANSI_CHARSET        : str := 'ANSI character set';
    BALTIC_CHARSET      : str := 'Baltic character set';
    CHINESEBIG5_CHARSET : str := 'Chinese big5 character set';
    DEFAULT_CHARSET     : str := 'Default character set';
    EASTEUROPE_CHARSET  : str := 'East Europe character set';
    GB2312_CHARSET      : str := 'GB 2312 character set';
    GREEK_CHARSET       : str := 'Greek character set';
//    HANGUL_CHARSET      : str := 'Hangul character set';
    MAC_CHARSET         : str := 'Mac character set';
    OEM_CHARSET         : str := 'Oem character set';
    RUSSIAN_CHARSET     : str := 'Russian character set';
    SHIFTJIS_CHARSET    : str := 'Shiftjis character set';
    SYMBOL_CHARSET      : str := 'Symbol character set';
    TURKISH_CHARSET     : str := 'Turkish character set';
    VIETNAMESE_CHARSET  : str := 'Vietnamese character set';
    JOHAB_CHARSET       : str := 'Johab character set';
    ARABIC_CHARSET      : str := 'Arabic character set';
    HEBREW_CHARSET      : str := 'Hebrew character set';
    THAI_CHARSET        : str := 'Thai character set';
    else str := 'unknown';
   end;
   Memo.Lines.Add('Character Set: ' + IntToStr(tmCharSet) + ' (' + str + ')');
  end;
end;

procedure TFmComparison.CompareGetOutlineTextMetrics;
var
  BufferGDI     : Pointer;
  TextMetricGDI : POutlineTextmetricW absolute BufferGDI;
  BufferPT      : Pointer;
  TextMetricPT  : POutlineTextmetricW absolute BufferPT;
  Font          : TFont;
  DC            : HDC;
  BufferSize    : Cardinal;
begin
 // GDI
 Font := TFont.Create;
 with Font do
  try
   Name := 'Arial';
   Style := [Graphics.fsBold..Graphics.fsItalic];
   Size := FCurrentFontSize;

   DC := Self.Canvas.Handle;
   SelectObject(DC, Font.Handle);

   // determine buffer size
   BufferSize := GetOutlineTextMetricsW(DC, 0, nil);
   GetMem(BufferGDI, BufferSize);
   FillChar(BufferGDI^, BufferSize, 0);
   try
    GetOutlineTextMetricsW(DC, Buffersize, TextMetricGDI);
    with TextMetricGDI^ do
     begin
      if Integer(otmpFamilyName) <> 0 then otmpFamilyName := PAnsiChar(Integer(TextMetricGDI) + Integer(otmpFamilyName));
      if Integer(otmpFaceName) <> 0 then otmpFaceName := PAnsiChar(Integer(TextMetricGDI) + Integer(otmpFaceName));
      if Integer(otmpStyleName) <> 0 then otmpStyleName := PAnsiChar(Integer(TextMetricGDI) + Integer(otmpStyleName));
      if Integer(otmpFullName) <> 0 then otmpFullName := PAnsiChar(Integer(TextMetricGDI) + Integer(otmpFullName));
     end;
    OutlineTextMetricToMemo(TextMetricGDI^, MemoGDI);
   finally
    Dispose(BufferGDI);
   end;
  finally
   FreeAndNil(Font);
  end;

 FFontEngine.FontSize := FCurrentFontSize;
 BufferSize := FFontEngine.GetOutlineTextMetricsW(0, nil);
 GetMem(BufferPT, BufferSize);
 FillChar(BufferPT^, BufferSize, 0);
 try
  FFontEngine.GetOutlineTextMetricsW(Buffersize, TextMetricPT);
  with TextMetricPT^ do
   begin
    if Integer(otmpFamilyName) <> 0 then otmpFamilyName := ConvertLocalPointerToGlobalPointer(otmpFamilyName, TextMetricPT);
    if Integer(otmpFaceName) <> 0 then otmpFaceName := ConvertLocalPointerToGlobalPointer(otmpFaceName, TextMetricPT);
    if Integer(otmpStyleName) <> 0 then otmpStyleName := ConvertLocalPointerToGlobalPointer(otmpStyleName, TextMetricPT);
    if Integer(otmpFullName) <> 0 then otmpFullName := ConvertLocalPointerToGlobalPointer(otmpFullName, TextMetricPT);
   end;
  OutlineTextMetricToMemo(TextMetricPT^, MemoPT);
 finally
  Dispose(BufferPT);
 end;
end;

procedure TFmComparison.OutlineTextMetricToMemo(TextMetric: TOutlineTextmetricW; Memo: TMemo);
begin
 TextMetricToMemo(TextMetric.otmTextMetrics, Memo);

 with TextMetric do
  begin
   Memo.Lines.Add('Size: ' + IntToStr(otmSize));
   Memo.Lines.Add('Filler: ' + IntToStr(otmFiller));
   Memo.Lines.Add('Selection: ' + IntToStr(otmfsSelection));
   Memo.Lines.Add('Type: ' + IntToStr(otmfsType));
   Memo.Lines.Add('Caret Slope Rise: ' + IntToStr(otmsCharSlopeRise));
   Memo.Lines.Add('Caret Slope Run: ' + IntToStr(otmsCharSlopeRun));
   Memo.Lines.Add('Italic Angle: ' + IntToStr(otmItalicAngle));
   Memo.Lines.Add('EM Square: ' + IntToStr(otmEMSquare));
   Memo.Lines.Add('Ascent: ' + IntToStr(otmAscent));
   Memo.Lines.Add('Descent: ' + IntToStr(otmDescent));
   Memo.Lines.Add('Linegap: ' + IntToStr(otmLineGap));
   Memo.Lines.Add('Capital Em Height: ' + IntToStr(otmsCapEmHeight));
   Memo.Lines.Add('''X''-Height: ' + IntToStr(otmsXHeight));
   Memo.Lines.Add('Font Box Left: ' + IntToStr(otmrcFontBox.Left));
   Memo.Lines.Add('Font Box Top: ' + IntToStr(otmrcFontBox.Top));
   Memo.Lines.Add('Font Box Right: ' + IntToStr(otmrcFontBox.Right));
   Memo.Lines.Add('Font Box Bottom: ' + IntToStr(otmrcFontBox.Bottom));
   Memo.Lines.Add('Ascent (Mac): ' + IntToStr(otmMacAscent));
   Memo.Lines.Add('Descent (Mac): ' + IntToStr(otmMacDescent));
   Memo.Lines.Add('Line Gap (Mac): ' + IntToStr(otmMacLineGap));
   Memo.Lines.Add('Minimum PPEM: ' + IntToStr(otmusMinimumPPEM));
   Memo.Lines.Add('Subscript Size X: ' + IntToStr(otmptSubscriptSize.X));
   Memo.Lines.Add('Subscript Size Y: ' + IntToStr(otmptSubscriptSize.Y));
   Memo.Lines.Add('Subscript Offset X: ' + IntToStr(otmptSubscriptOffset.X));
   Memo.Lines.Add('Subscript Offset Y: ' + IntToStr(otmptSubscriptOffset.Y));
   Memo.Lines.Add('Superscript Size X: ' + IntToStr(otmptSuperscriptSize.X));
   Memo.Lines.Add('Superscript Size Y: ' + IntToStr(otmptSuperscriptSize.Y));
   Memo.Lines.Add('Superscript Offset X: ' + IntToStr(otmptSuperscriptOffset.X));
   Memo.Lines.Add('Superscript Offset Y: ' + IntToStr(otmptSuperscriptOffset.Y));
   Memo.Lines.Add('Strikeout Size : ' + IntToStr(otmsStrikeoutSize));
   Memo.Lines.Add('Strikeout Position: ' + IntToStr(otmsStrikeoutPosition));
   Memo.Lines.Add('Underscore Size: ' + IntToStr(otmsUnderscoreSize));
   Memo.Lines.Add('Underscore Position: ' + IntToStr(otmsUnderscorePosition));

   Memo.Lines.Add('Family Name: ' + PWideChar(otmpFamilyName));
   Memo.Lines.Add('Face Name: ' + PWideChar(otmpFaceName));
   Memo.Lines.Add('Style Name: ' + PWideChar(otmpStyleName));
   Memo.Lines.Add('Full Name: ' + PWideChar(otmpFullName));
  end;
end;

procedure TFmComparison.CompareGetTextExtentPoint32;
var
  TextSizeGDI : TSize;
  TextSizePT  : TSize;
  Font        : TFont;
  DC          : HDC;
  Str         : widestring;

  procedure TestGDI;
  begin
   DC := Self.Canvas.Handle;
   SelectObject(DC, Font.Handle);
   if GetTextExtentPoint32W(DC, PWideChar(@Str[1]), Length(Str), TextSizeGDI) then
    begin
     MemoGDI.Lines.Add('"' + Str + '" Size X: ' + IntToStr(TextSizeGDI.cx));
     MemoGDI.Lines.Add('"' + Str + '" Size Y: ' + IntToStr(TextSizeGDI.cy));
    end;
  end;

  procedure TestPT;
  begin
   if FFontEngine.GetTextExtentPoint32W(Str, TextSizePT) then
    begin
     MemoPT.Lines.Add('"' + Str + '" Size X: ' + IntToStr(TextSizePT.cx));
     MemoPT.Lines.Add('"' + Str + '" Size Y: ' + IntToStr(TextSizePT.cy));
    end;
  end;

begin
 // GDI
 MemoGDI.Clear;
 Font := TFont.Create;
 with Font do
  try
   Name := 'Arial';
   Style := [];
   Size := FCurrentFontSize;

   Str := ''; TestGDI;
   Str := '_'; TestGDI;
   Str := '.'; TestGDI;
   Str := 'x'; TestGDI;
   Str := 'X'; TestGDI;
   Str := 'g�'; TestGDI;
   Str := 'g�j�'; TestGDI;
   Str := 'T.'; TestGDI;
   Str := 'H.'; TestGDI;
   Str := 'T."F.'; TestGDI;
  finally
   FreeAndNil(Font);
  end;

 // PascalType
 MemoPT.Clear;
 FFontEngine.FontSize := FCurrentFontSize;
 Str := ''; TestPT;
 Str := '_'; TestPT;
 Str := '.'; TestPT;
 Str := 'x'; TestPT;
 Str := 'X'; TestPT;
 Str := 'g�'; TestPT;
 Str := 'g�j�'; TestPT;
 Str := 'T.'; TestPT;
 Str := 'H.'; TestPT;
 Str := 'T."F.'; TestPT;
end;

procedure TFmComparison.CompareGetGlyphOutline;
var
  BufferGDI       : PTTPolygonHeader;
  BufferPT        : PTTPolygonHeader;
  Character       : WCHAR;
  GlyphMetricsGDI : TGlyphMetrics;
  GlyphMetricsPT  : TGlyphMetrics;
  Font            : TFont;
  DC              : HDC;
  BufferSize      : Cardinal;
  Format          : TGetGlyphOutlineUnion;
begin
 Character := 'A';

 // GDI
 Font := TFont.Create;
 with Font do
  try
   Name := 'Arial';
   Style := [Graphics.fsBold..Graphics.fsItalic];
   Size := FCurrentFontSize;

   DC := Self.Canvas.Handle;
   SelectObject(DC, Font.Handle);

   // determine buffer size
   BufferSize := GetGlyphOutlineW(DC, Ord(Character), GGO_NATIVE, GlyphMetricsGDI, 0,
     nil, CFlipVertical2);
   GetMem(BufferGDI, BufferSize);
   FillChar(BufferGDI^, BufferSize, 0);
   try
    if GetGlyphOutlineW(DC, Ord(Character), GGO_NATIVE, GlyphMetricsGDI,
      BufferSize, BufferGDI, CFlipVertical2) <> 0 then
     begin
      GlyphMetricToMemo(GlyphMetricsGDI, MemoGDI);
      GlyphOutlineToMemo(BufferGDI, BufferSize, MemoGDI);
     end;
   finally
    Dispose(BufferGDI);
   end;
  finally
   FreeAndNil(Font);
  end;

 FFontEngine.FontSize := FCurrentFontSize;

 // set format
 Format.Format := ggoMetrics;
 Format.Flags := [];

 // determine buffer size
 BufferSize := FFontEngine.GetGlyphOutlineW(Ord(Character), Format, GlyphMetricsPT, 0,
   nil, CFlipVertical);
 GetMem(BufferPT, BufferSize);
 FillChar(BufferPT^, BufferSize, 0);
 try
  FFontEngine.GetGlyphOutlineW(Ord(Character), Format, GlyphMetricsPT, 0, nil,
    CFlipVertical);

  GlyphMetricToMemo(GlyphMetricsPT, MemoPT)
 finally
  Dispose(BufferPT);
 end;
end;

procedure TFmComparison.GlyphMetricToMemo(GlyphMetrics: TGlyphMetrics; Memo: TMemo);
begin
 Memo.Clear;

 with GlyphMetrics do
  begin
   Memo.Lines.Add('Black Box X: ' + IntToStr(gmBlackBoxX));
   Memo.Lines.Add('Black Box Y: ' + IntToStr(gmBlackBoxY));
   Memo.Lines.Add('Glyph Origin X: ' + IntToStr(gmptGlyphOrigin.X));
   Memo.Lines.Add('Glyph Origin Y: ' + IntToStr(gmptGlyphOrigin.Y));
   Memo.Lines.Add('Cell Inc X: ' + IntToStr(gmCellIncX));
   Memo.Lines.Add('Cell Inc Y: ' + IntToStr(gmCellIncY));
  end;
end;

procedure TFmComparison.GlyphOutlineToMemo(Buffer: Pointer; Size: Integer; Memo: TMemo);
var
  J, K, S : Integer;
  PBuffer : PTTPolygonHeader absolute Buffer;
  PPCurve : PTTPolyCurve;
  str     : string;
begin
 K := 0;

 if PBuffer.dwType <> TT_POLYGON_TYPE then
  begin
   Memo.Lines.Add('Wrong format!');
   Exit;
  end;

 with PBuffer.pfxStart do
  begin
   str := 'Start Point: ';
   str := str + 'X = ' + FloatToStr(x.value + x.fract / (1 shl 16)) + '; ';
   str := str + 'Y = ' + FloatToStr(y.value + y.fract / (1 shl 16));
   Memo.Lines.Add(str);
  end;

 while Size > 0 do
  begin
   S := PBuffer.cb - SizeOf(TTTPolygonHeader);
   Integer(PPCurve) := Integer(Buffer) + SizeOf(TTTPolygonHeader);

   if S <= 0 then Exit;

   Memo.Lines.Add('New Contour');

   while S > 0 do
    begin
     case PPCurve.wType of
      TT_PRIM_LINE:
       begin
        for J := 0 to PPCurve.cpfx - 1 do
         with PPCurve.apfx[J] do
          begin
           str := 'Line Point: ';
           str := str + 'X = ' + FloatToStr(x.value + x.fract / (1 shl 16)) + '; ';
           str := str + 'Y = ' + FloatToStr(y.value + y.fract / (1 shl 16));
           Memo.Lines.Add(str);
          end;
       end;
      TT_PRIM_QSPLINE:
       begin
        for J := 0 to PPCurve.cpfx - 1 do
         with PPCurve.apfx[J] do
          begin
           str := 'Spline Point: ';
           str := str + 'X = ' + FloatToStr(x.value + x.fract / (1 shl 16)) + '; ';
           str := str + 'Y = ' + FloatToStr(y.value + y.fract / (1 shl 16));
           Memo.Lines.Add(str);
          end;
       end;
     end;

     K := (PPCurve.cpfx - 1) * SizeOf(TPointFX) + SizeOf(TTPolyCurve);
     Dec(S, K);
     Inc(Integer(PPCurve), K);
    end;

   Dec(Integer(PPCurve), K);
   Dec(Size, PBuffer.cb);
   Inc(Integer(PBuffer), PBuffer.cb);
  end;
end;

end.
