program CompareGDI;

uses
  Forms,
  MainForm in 'MainForm.pas' {FmComparison},
  PT_Interpreter in '..\..\Source\PT_Interpreter.pas',
  PT_Rasterizer in '..\..\Source\PT_Rasterizer.pas',
  PT_RasterizerGDI in '..\..\Source\PT_RasterizerGDI.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmComparison, FmComparison);
  Application.Run;
end.
