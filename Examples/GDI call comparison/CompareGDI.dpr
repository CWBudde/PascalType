program CompareGDI;

uses
  Forms,
  MainForm in 'MainForm.pas' {FmComparison},
  PT_Interpreter in '..\..\Source\PT_Interpreter.pas',
  PT_Rasterizer in '..\..\Source\PT_Rasterizer.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas',
  PT_CharacterMap in '..\..\Source\PT_CharacterMap.pas',
  PT_RasterizerGDI in '..\..\Source\PT_RasterizerGDI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmComparison, FmComparison);
  Application.Run;
end.
