unit TestPascalTypeInterpreter;
{

  Delphi DUnit Testfall
  ----------------------
  Diese Unit enthält ein Codegerüst einer Testfallklasse, das vom Testfall-Experten
  erzeugt wurde. Ändern Sie den erzeugten Code, damit die Methoden aus der 
  getesteten Unit korrekt eingerichtet und aufgerufen werden.

}

interface

uses
  Windows, TestFramework, Classes, Contnrs, SysUtils, PT_Types, PT_Tables,
  PT_TablesOptional, PT_TablesOpenType, PT_Interpreter;

type
  // Test methods for class TTrueTypeFontInterpreter
  TTestPascalTypeInterpreter = class(TTestCase)
  strict private
    FPascalTypeInterpreter : TPascalTypeInterpreter;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestScanLocalFonts;
    procedure TestScanWindowsFonts;
  end;

implementation

uses
  Dialogs;

procedure TTestPascalTypeInterpreter.SetUp;
begin
  FPascalTypeInterpreter := TPascalTypeInterpreter.Create;
end;

procedure TTestPascalTypeInterpreter.TearDown;
begin
 FreeAndNil(FPascalTypeInterpreter);
end;

procedure TTestPascalTypeInterpreter.TestScanLocalFonts;
var
  SR          : TSearchRec;
  Succeed     : Boolean;
  PWindowsDir : array [0..MAX_PATH] of Char;
begin
 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeInterpreter.LoadFromFile(SR.Name)
    except
     on e: EPascalTypeError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
     else Succeed := False;
    end;
    Check(Succeed, 'Error loading file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   // Must free up resources used by these successful finds
   FindClose(SR);
  end;
end;

procedure TTestPascalTypeInterpreter.TestScanWindowsFonts;
var
  SR          : TSearchRec;
  Succeed     : Boolean;
  PWindowsDir : array [0..MAX_PATH] of Char;
begin
 // locate to windows directory
 GetWindowsDirectory(PWindowsDir, MAX_PATH);
 SetCurrentDir(StrPas(PWindowsDir) + '\Fonts\');

 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeInterpreter.LoadFromFile(SR.Name)
    except
//     on e: EWavError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
//     else Succeed := False;
    end;
    Check(Succeed, 'Error loading file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   // Must free up resources used by these successful finds
   FindClose(SR);
  end;
end;

initialization
  // Alle Testfälle beim Test-Runner registrieren
  RegisterTest(TTestPascalTypeInterpreter.Suite);

end.
