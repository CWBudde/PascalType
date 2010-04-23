program CompareGDI;

uses
  Forms,
  MainForm in 'MainForm.pas' {FmComparison},
  PT_ByteCodeInterpreter in '..\..\Source\PT_ByteCodeInterpreter.pas',
  PT_CharacterMap in '..\..\Source\PT_CharacterMap.pas',
  PT_Classes in '..\..\Source\PT_Classes.pas',
  PT_FontEngine in '..\..\Source\PT_FontEngine.pas',
  PT_FontEngineGDI in '..\..\Source\PT_FontEngineGDI.pas',
  PT_Math in '..\..\Source\PT_Math.pas',
  PT_PanoseClassifications in '..\..\Source\PT_PanoseClassifications.pas',
  PT_ResourceStrings in '..\..\Source\PT_ResourceStrings.pas',
  PT_Storage in '..\..\Source\PT_Storage.pas',
  PT_StorageEOT in '..\..\Source\PT_StorageEOT.pas',
  PT_StorageSFNT in '..\..\Source\PT_StorageSFNT.pas',
  PT_TableDirectory in '..\..\Source\PT_TableDirectory.pas',
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
  PT_TablesPostscriptOperands in '..\..\Source\PT_TablesPostscriptOperands.pas',
  PT_TablesPostscriptOperators in '..\..\Source\PT_TablesPostscriptOperators.pas',
  PT_TablesShared in '..\..\Source\PT_TablesShared.pas',
  PT_TablesTrueType in '..\..\Source\PT_TablesTrueType.pas',
  PT_Types in '..\..\Source\PT_Types.pas',
  PT_Windows in '..\..\Source\PT_Windows.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmComparison, FmComparison);
  Application.Run;
end.
