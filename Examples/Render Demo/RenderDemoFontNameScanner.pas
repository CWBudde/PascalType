unit RenderDemoFontNameScanner;

interface

uses
  Windows, Classes, SysUtils, PT_Types, PT_Storage, PT_Tables;

type
  TFontScannedEvent = procedure(Sender: TObject; FileName: TFilename;
    Font: TCustomPascalTypeStorage) of object;

  TFontNameStorageScan = class(TThread)
  private
    FOnFontName  : TFontScannedEvent;
    FCurrentFile : TFileName;
    FStorageScan : TPascalTypeStorageScan;
    procedure FontScanned;
  protected
    procedure Execute; override;
  published
    property OnFontScanned: TFontScannedEvent read FOnFontName write FOnFontName;
  end;

implementation

{ TFontNameStorageScan }

procedure TFontNameStorageScan.Execute;
var
  SR : TSearchRec;
begin
 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    FStorageScan := TPascalTypeStorageScan.Create;
    with FStorageScan do
     try
      // store current file
      FCurrentFile := SR.Name;

      if FCurrentFile = 'tahoma.ttf'
       then Continue;

      // load font from file
      LoadFromFile(FCurrentFile);

      Synchronize(FontScanned);
     except
      on e: EPascalTypeError do Continue;
      else Continue;
     end;
   until (FindNext(SR) <> 0) or Terminated;
  finally
   FindClose(SR);
  end;
end;

procedure TFontNameStorageScan.FontScanned;
begin
 if Assigned(FOnFontName)
  then FOnFontName(Self, FCurrentFile, FStorageScan);
end;

end.
