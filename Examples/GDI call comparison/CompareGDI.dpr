program CompareGDI;

uses
  Forms,
  MainForm in 'MainForm.pas' {FmComparison},
  PT_Storage in '..\..\Source\PT_Storage.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas',
  PT_CharacterMap in '..\..\Source\PT_CharacterMap.pas',
  PT_FontEngine in '..\..\Source\PT_FontEngine.pas',
  PT_FontEngineGDI in '..\..\Source\PT_FontEngineGDI.pas',
  PT_Math in '..\..\Source\PT_Math.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmComparison, FmComparison);
  Application.Run;
end.
