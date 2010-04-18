program FontExplorer;

{$I PT_Compiler.inc}
{$R '..\..\Resource\Default.res' '..\..\Resource\Default.rc'}

// if the first 3 units are missing feel free to download the according library
// or simply remove them from the uses section without major problems

uses
  FastMM4,
  FastMove,
  RTLVCLOptimize,
  Forms,
  PT_ByteCodeInterpreter in '..\..\Source\PT_ByteCodeInterpreter.pas',
  PT_CharacterMap in '..\..\Source\PT_CharacterMap.pas',
  PT_Classes in '..\..\Source\PT_Classes.pas',
  PT_FontEngine in '..\..\Source\PT_FontEngine.pas',
  PT_PanoseClassifications in '..\..\Source\PT_PanoseClassifications.pas',
  PT_ResourceStrings in '..\..\Source\PT_ResourceStrings.pas',
  PT_Storage in '..\..\Source\PT_Storage.pas',
  PT_StorageEOT in '..\..\Source\PT_StorageEOT.pas',
  PT_StorageSFNT in '..\..\Source\PT_StorageSFNT.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas',
  PT_TablesApple in '..\..\Source\PT_TablesApple.pas',
  PT_TablesBitmap in '..\..\Source\PT_TablesBitmap.pas',
  PT_TablesFontForge in '..\..\Source\PT_TablesFontForge.pas',
  PT_TablesOptional in '..\..\Source\PT_TablesOptional.pas',
  PT_TablesPostscript in '..\..\Source\PT_TablesPostscript.pas',
  PT_TablesPostscriptOperands in '..\..\Source\PT_TablesPostscriptOperands.pas',
  PT_TablesPostscriptOperators in '..\..\Source\PT_TablesPostscriptOperators.pas',
  PT_TablesShared in '..\..\Source\PT_TablesShared.pas',
  PT_TablesTrueType in '..\..\Source\PT_TablesTrueType.pas',
  PT_Types in '..\..\Source\PT_Types.pas',
  PT_UnicodeNames in '..\..\Source\PT_UnicodeNames.pas',
  PT_Windows in '..\..\Source\PT_Windows.pas',
  FE_FontHeader in 'FE_FontHeader.pas' {FrameFontHeader: TFrame},
  FontExplorerMain in 'FontExplorerMain.pas' {FmTTF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmTTF, FmTTF);
  Application.Run;
end.
