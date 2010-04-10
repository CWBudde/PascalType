{ Diese Datei wurde automatisch von Lazarus erzeugt. Sie darf nicht bearbeitet 
  werden!
  Dieser Quelltext dient nur dem Übersetzen und Installieren des Packages.
 }

unit PascalType_Lazarus; 

interface

uses
    PT_Component, PT_Interpreter, PT_ResourceStrings, PT_Tables, 
  PT_TablesOpenType, PT_TablesOpenTypeFeatures, PT_TablesOpenTypeLanguages, 
  PT_TablesOpenTypeScripts, PT_TablesOptional, PT_Types, LazarusPackageIntf;

implementation

procedure Register; 
begin
end; 

initialization
  RegisterPackage('PascalType_Lazarus', @Register); 
end.
