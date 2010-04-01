program FontExplorer;

{$R '..\..\Resource\Default.res' '..\..\Resource\Default.rc'}

// if the first 3 units are missing feel free to download the according library
// or simply remove them from the uses section without major problems

uses
  FastMM4,
  FastMove,
  RTLVCLOptimize,
  Forms,
  PT_ByteCodeInterpreter in '..\..\Source\PT_ByteCodeInterpreter.pas',
  PT_Interpreter in '..\..\Source\PT_Interpreter.pas',
  PT_Rasterizer in '..\..\Source\PT_Rasterizer.pas',
  PT_ResourceStrings in '..\..\Source\PT_ResourceStrings.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas',
  PT_TablesApple in '..\..\Source\PT_TablesApple.pas',
  PT_TablesBitmap in '..\..\Source\PT_TablesBitmap.pas',
  PT_TablesFontForge in '..\..\Source\PT_TablesFontForge.pas',
  PT_TablesOpenType in '..\..\Source\PT_TablesOpenType.pas',
  PT_TablesOpenTypeFeatures in '..\..\Source\PT_TablesOpenTypeFeatures.pas',
  PT_TablesOpenTypeLanguages in '..\..\Source\PT_TablesOpenTypeLanguages.pas',
  PT_TablesOpenTypeScripts in '..\..\Source\PT_TablesOpenTypeScripts.pas',
  PT_TablesOptional in '..\..\Source\PT_TablesOptional.pas',
  PT_TablesPostscript in '..\..\Source\PT_TablesPostscript.pas',
  PT_TablesShared in '..\..\Source\PT_TablesShared.pas',
  PT_TablesTrueType in '..\..\Source\PT_TablesTrueType.pas',
  PT_Types in '..\..\Source\PT_Types.pas',
  PT_UnicodeNames in '..\..\Source\PT_UnicodeNames.pas',
  FontExplorerMain in 'FontExplorerMain.pas' {FmTTF},
  FE_FontHeader in 'FE_FontHeader.pas' {FrameFontHeader: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmTTF, FmTTF);
  Application.Run;
end.
