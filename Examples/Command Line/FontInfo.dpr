program FontInfo;

{$APPTYPE CONSOLE}

uses
  PT_Types, PT_Tables, PT_TablesOptional, PT_Interpreter,
  SysUtils, Math;

resourcestring
  RCStrUnknownFileFormat = 'Unknown file format!';

procedure LoadFontFile(FileName: TFilename);
var
  StrIndex : Integer;
  Str      : string;

begin
 if not FileExists(FileName) then
  begin
   Writeln('File ''' + ParamStr(0) + ''' does not exists');
   Exit;
  end;

 with TPascalTypeScanner.Create do
  try
   try
    LoadFromFile(FileName);
   except
    on E: EPascalTypeError do Writeln('Error reading file: ' + E.Message);
   end;

   with HeaderTable do
    begin
     Writeln('Version: ' + FloatToStrF(Version.Value + Version.Fract / (1 shl 16), ffGeneral, 4, 4));
     Writeln('Font Revision: ' + FloatToStrF(FontRevision.Value + FontRevision.Fract / (1 shl 16), ffGeneral, 4, 4));
     Writeln('Units / Em: ' + IntToStr(UnitsPerEm));
     Writeln('Smallest Readable Size in Pixels: ' + IntToStr(LowestRecPPEM));
     Writeln('Creation Date: ' + DateTimeToStr(CreatedDate / 86400 + EncodeDate(1904, 1, 1)));
     Writeln('Modification Date: ' + DateTimeToStr(ModifiedDate / 86400 + EncodeDate(1904, 1, 1)));
    end;

   with NameTable do
    begin
     for StrIndex := 0 to NameSubtableCount - 1 do
      begin
       case NameSubtable[StrIndex].PlatformID of
        piUnicode: Continue;
        piApple: Continue;
       end;

       Assert(NameSubtable[StrIndex] is TTrueTypeFontNamePlatformMicrosoft);
       with TTrueTypeFontNamePlatformMicrosoft(NameSubtable[StrIndex]) do
        if (LanguageID <> SysLocale.DefaultLCID) and
           (LanguageID <> 1033)
         then Continue;

       case NameSubtable[StrIndex].NameID of
        niCopyrightNotice    : Str := 'Copyright Notice';
        niFamily             : Str := 'Family';
        niSubfamily          : Str := 'Subfamily';
        niUniqueIdentifier   : Str := 'Unique Identifier';
        niFullName           : Str := 'Full Name';
        niVersion            : Str := 'Version';
        niPostscriptName     : Str := 'Postscript Name';
        niTrademark          : Str := 'Trademark';
        niVendorName         : Str := 'Vendor Name';
        niDesignerName       : Str := 'Designer Name';
        niDescription        : Str := 'Description';
        niVendorURL          : Str := 'Vendor URL';
        niDesignerURL        : Str := 'Designer URL';
        niLicenseDescription : Str := 'License Description';
        niLicenseInformation : Str := 'License Information';
        niReserved           : Str := 'Reserved';
        niPreferredFamily    : Str := 'Preferred Family';
        niPreferredSubfamily : Str := 'Preferred Subfamily';
        niCompatibleFull     : Str := 'Compatible Full';
        niSampleText         : Str := 'Sample Text';
        niFutureExpansion    : Str := 'Future Expansion';
        niFontSpecific       : Str := 'Font Specific';
       end;

       Writeln(Str + ': ' + NameSubtable[StrIndex].Name);
      end;
    end;
  finally
   Free;
  end;
end;


var
  SR : TSearchRec;
begin
 // show application information
 Writeln('PascalType Font Info');
 Writeln('--------------------');
 Writeln('');

 if ParamStr(1) = '' then
  begin
   Writeln('Usage: ' + ExtractFileName(ParamStr(0)) + ' TrueTypeFontFile' );
   Exit;
  end;

 if Pos('*', ParamStr(1)) > 0 then
  if FindFirst(ParamStr(1), faAnyFile, SR) = 0 then
   try
    repeat
     LoadFontFile(SR.Name);
    until FindNext(SR) <> 0;
   finally
    FindClose(SR);
   end else
 else LoadFontFile(ParamStr(1));
end.
