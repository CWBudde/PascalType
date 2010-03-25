program FontInfo;

{$APPTYPE CONSOLE}

uses
  PT_Types, PT_Tables, PT_TablesOptional, PT_TablesOpenType, PT_Interpreter,
  PT_ByteCodeInterpreter, SysUtils, Math;

resourcestring
  RCStrUnknownFileFormat = 'Unknown file format!';

procedure LoadFontFile(FileName: TFilename);
begin
 if not FileExists(FileName) then
  begin
   Writeln('File ''' + ParamStr(0) + ''' does not exists');
   Exit;
  end;

 with TPascalTypeInterpreter.Create do
  try
   try
    LoadFromFile(FileName);
   except
    on E: EPascalTypeError do Writeln('Error reading file: ' + E.Message);
   end;

   with HeaderTable.Version
    do Writeln('Version: ' + FloatToStrF(Value + Fract / (1 shl 16), ffGeneral, 4, 4));
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
