{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit PascalType_Lazarus; 

interface

uses
    PT_ByteCodeInterpreter, PT_CharacterMap, PT_Component, 
    PT_PanoseClassifications, PT_ResourceStrings, PT_TableDirectory, 
    PT_Tables, PT_TablesApple, PT_TablesBitmap, PT_TablesFontForge, 
    PT_TablesOpenType, PT_TablesOpenTypeFeatures, PT_TablesOpenTypeLanguages, 
    PT_TablesOpenTypeScripts, PT_TablesOptional, PT_TablesPostscript, 
    PT_TablesShared, PT_TablesTrueType, PT_Types, PT_UnicodeNames, 
    LazarusPackageIntf;

implementation

procedure Register; 
begin
  RegisterUnit('PT_Component', @PT_Component.Register); 
end; 

initialization
  RegisterPackage('PascalType_Lazarus', @Register); 
end.
