program FontExplorer;

uses
  FastMM4,
  FastMove,
  RTLVCLOptimize,
  PT_ByteCodeInterpreter in '..\..\Source\PT_ByteCodeInterpreter.pas',
  PT_Interpreter in '..\..\Source\PT_Interpreter.pas',
  PT_ResourceStrings in '..\..\Source\PT_ResourceStrings.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas',
  PT_TablesBitmap in '..\..\Source\PT_TablesBitmap.pas',
  PT_TablesOpenType in '..\..\Source\PT_TablesOpenType.pas',
  PT_TablesOpenTypeFeatures in '..\..\Source\PT_TablesOpenTypeFeatures.pas',
  PT_TablesOpenTypeLanguages in '..\..\Source\PT_TablesOpenTypeLanguages.pas',
  PT_TablesOpenTypeScripts in '..\..\Source\PT_TablesOpenTypeScripts.pas',
  PT_TablesOptional in '..\..\Source\PT_TablesOptional.pas',
  PT_TablesPostscript in '..\..\Source\PT_TablesPostscript.pas',
  PT_TablesTrueType in '..\..\Source\PT_TablesTrueType.pas',
  PT_Types in '..\..\Source\PT_Types.pas',
  PT_UnicodeNames in '..\..\Source\PT_UnicodeNames.pas',
  Forms,
  FontExplorerMain in 'FontExplorerMain.pas' {FmTTF},
  FE_FontHeader in 'FE_FontHeader.pas' {FrameFontHeader: TFrame},
  PT_Rasterizer in '..\..\Source\PT_Rasterizer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmTTF, FmTTF);
  Application.Run;
end.
