unit RenderDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, PT_Types, PT_RasterizerGDI, PT_Interpreter, PT_Tables,
  RenderDemoFontNameScanner;

type
  TFontNameFile = packed record
    FullFontName : string;
    FileName     : TFileName;
  end;

  TFmRenderDemo = class(TForm)
    CbFont: TComboBox;
    CbFontSize: TComboBox;
    EdText: TEdit;
    LbFont: TLabel;
    LbFontSize: TLabel;
    LbText: TLabel;
    PnText: TPanel;
    PaintBox: TPaintBox;
    RbWindows: TRadioButton;
    LbRasterizer: TLabel;
    RbPascalType: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CbFontChange(Sender: TObject);
    procedure CbFontSizeChange(Sender: TObject);
    procedure EdTextChange(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
    procedure PnTextResize(Sender: TObject);
    procedure RbPascalTypeClick(Sender: TObject);
    procedure RbWindowsClick(Sender: TObject);
  private
    FRasterizer  : TPascalTypeRasterizerGDI;
    FFontScanner : TFontNameScanner;
    FFontArray   : array of TFontNameFile;
    FBitmap      : TBitmap;
    FText        : string;
    FFontSize    : Integer;
    FFontName    : string;
    procedure FontScannedHandler(Sender: TObject; FontFileName: TFilename;
      Font: TCustomPascalTypeInterpreter);
    procedure SetText(const Value: string);
    procedure SetFontSize(const Value: Integer);
    procedure SetFontName(const Value: string);
  protected
    procedure FontNameChanged; virtual;
    procedure FontSizeChanged; virtual;
    procedure RenderText; virtual;
    procedure TextChanged; virtual;
  public
    property Text: string read FText write SetText;
    property FontSize: Integer read FFontSize write SetFontSize;
    property FontName: string read FFontName write SetFontName;
  end;

var
  FmRenderDemo: TFmRenderDemo;

implementation

{$R *.dfm}

uses
  ShlObj, ActiveX, Inifiles, Math, Types;

procedure StrResetLength(var S: string);
begin
 SetLength(S, StrLen(PChar(S)));
end;

function PidlToPath(IdList: PItemIdList): string;
begin
 SetLength(Result, MAX_PATH);
 if SHGetPathFromIDList(IdList, PChar(Result))
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

////////////////////////////////////////////////////////////////////////////////

procedure TFmRenderDemo.FormCreate(Sender: TObject);
begin
 SetCurrentDir(GetFontDirectory);

 // create bitmap buffer
 FBitmap := TBitmap.Create;

 // create rasterizer
 FRasterizer := TPascalTypeRasterizerGDI.Create;

 // set initial properties
 FBitmap.Canvas.Font.Size := StrToInt(CbFontSize.Text);
 FRasterizer.FontSize := StrToInt(CbFontSize.Text);

 FFontScanner := TFontNameScanner.Create(True);
 with FFontScanner do
  begin
   OnFontScanned := FontScannedHandler;
   Resume;
  end;
end;

procedure TFmRenderDemo.FormDestroy(Sender: TObject);
begin
 // free rasterizer
 FreeAndNil(FRasterizer);

 with FFontScanner do
  begin
   Terminate;
   WaitFor;
  end;
 FreeAndNil(FFontScanner);
end;

procedure TFmRenderDemo.FormShow(Sender: TObject);
begin
 Text := EdText.Text;
end;

procedure TFmRenderDemo.PaintBoxPaint(Sender: TObject);
begin
 if Assigned(FBitmap)
  then PaintBox.Canvas.Draw(0, 0, FBitmap);
end;

procedure TFmRenderDemo.PnTextResize(Sender: TObject);
begin
 if Assigned(FBitmap) then
  with FBitmap do
   begin
    Width := PaintBox.Width;
    Height := PaintBox.Height;
   end;
end;

procedure TFmRenderDemo.TextChanged;
begin
 RenderText;
end;

procedure TFmRenderDemo.FontNameChanged;
var
  FontIndex : Integer;
begin
 FBitmap.Canvas.Font.Name := FFontName;
 for FontIndex := 0 to Length(FFontArray) - 1 do
  if FFontArray[FontIndex].FullFontName = FFontName then
   begin
    FRasterizer.LoadFromFile(FFontArray[FontIndex].FileName);
    Break;
   end;

 RenderText;
end;

procedure TFmRenderDemo.FontSizeChanged;
begin
 FBitmap.Canvas.Font.Size := FFontSize;
 FRasterizer.FontSize := FFontSize;
 RenderText;
end;

procedure TFmRenderDemo.RbPascalTypeClick(Sender: TObject);
begin
 RenderText;
end;

procedure TFmRenderDemo.RbWindowsClick(Sender: TObject);
begin
 RenderText;
end;

procedure TFmRenderDemo.RenderText;
begin
 with FBitmap, Canvas do
  begin
   // clear bitmap
   Brush.Color := clWhite;
   FillRect(ClipRect);

   if RbWindows.Checked then
    begin
     with Font do
      begin
       Color := clBlack;
       Name := CbFont.Text;
      end;

     TextOut(0, 0, FText);
    end;

   if RbPascalType.Checked
    then FRasterizer.RenderText(FText, Canvas, 0, 0);
  end;
 PaintBox.Invalidate;
end;

procedure TFmRenderDemo.SetFontName(const Value: string);
begin
 if FFontName <> Value then
  begin
   FFontName := Value;
   FontNameChanged;
  end;
end;

procedure TFmRenderDemo.SetFontSize(const Value: Integer);
begin
 if FFontSize <> Value then
  begin
   FFontSize := Value;
   FontSizeChanged;
  end;
end;

procedure TFmRenderDemo.SetText(const Value: string);
begin
 if FText <> Value then
  begin
   FText := Value;
   TextChanged;
  end;
end;

procedure TFmRenderDemo.CbFontChange(Sender: TObject);
begin
 if (CbFont.ItemIndex >= 0) and (CbFont.ItemIndex < Length(FFontArray)) then
  with FFontArray[CbFont.ItemIndex]
   do Self.FontName := FontName;
end;

procedure TFmRenderDemo.CbFontSizeChange(Sender: TObject);
begin
 FontSize := StrToInt(CbFontSize.Text);
end;

procedure TFmRenderDemo.EdTextChange(Sender: TObject);
begin
 Text := EdText.Text;
end;

procedure TFmRenderDemo.FontScannedHandler(Sender: TObject; FontFileName: TFilename;
  Font: TCustomPascalTypeInterpreter);
var
  CurrentFontName : string;
begin
 // add font name to font combo box
 CurrentFontName := Font.FontName;
 CbFont.Items.Add(CurrentFontName);
 if CurrentFontName = 'Arial' then
  begin
   CbFont.ItemIndex := CbFont.Items.Count - 1;
   FontName := CurrentFontName;
  end;

 SetLength(FFontArray, Length(FFontArray) + 1);
 with FFontArray[Length(FFontArray) - 1] do
  begin
   FullFontName := CurrentFontName;
   FileName := FontFileName;
  end;
end;

end.
