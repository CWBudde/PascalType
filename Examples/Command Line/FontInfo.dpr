program FontInfo;

{$APPTYPE CONSOLE}

uses
  {$IFDEF CPU32} FastMove, {$ENDIF}
  FastMM4, SysUtils, Math,
  PT_Types, PT_Tables, PT_TablesOptional, PT_Storage, PT_StorageSFNT;

resourcestring
  RCStrUnknownFileFormat = 'Unknown file format!';
  RCStrVersion = 'Version';
  RCStrFontRevision = 'Font Revision';
  RCStrUnitsEm = 'Units / Em';
  RCStrSmallestReadableSi = 'Smallest Readable Size in Pixels';
  RCStrCreationDate = 'Creation Date';
  RCStrModificationDate = 'Modification Date';
  RCStrErrorReadingFile = 'Error reading file %s';
  RCStrFileDoesNotExists = 'File %s does not exists';

procedure LoadFontFile(FileName: TFilename);
var
  StrIndex: Integer;

const
  CNameIDs : array [TNameID] of string = ('Copyright Notice', 'Family',
    'Subfamily', 'Unique Identifier', 'Full Name', 'Version', 'Postscript Name',
    'Trademark', 'Vendor Name', 'Designer Name', 'Description', 'Vendor URL',
    'Designer URL', 'License Description', 'License Information', 'Reserved',
    'Preferred Family', 'Preferred Subfamily', 'Compatible Full', 'Sample Text',
    'Future Expansion', 'Font Specific');

begin
  if not FileExists(FileName) then
  begin
    Writeln(Format(RCStrFileDoesNotExists, [FileName]));
    Exit;
  end;

  with TPascalTypeStorageScan.Create do
    try
      try
        LoadFromFile(FileName);

        Writeln(FileName);
        Exit;

      except
        on E: EPascalTypeError do
        begin
          Writeln(Format(RCStrErrorReadingFile, [FileName]) + ': ' + E.Message);
          Halt(1);
        end;
      end;

      with HeaderTable do
      begin
        Writeln(RCStrVersion + ': ' + FloatToStrF(Version.Value + Version.Fract /
          (1 shl 16), ffGeneral, 4, 4));
        Writeln(RCStrFontRevision + ': ' + FloatToStrF(FontRevision.Value +
          FontRevision.Fract / (1 shl 16), ffGeneral, 4, 4));
        Writeln(RCStrUnitsEm + ': ' + IntToStr(UnitsPerEm));
        Writeln(RCStrSmallestReadableSi + ': ' + IntToStr(LowestRecPPEM));
        Writeln(RCStrCreationDate + ': ' + DateTimeToStr(CreatedDate / 86400 +
          EncodeDate(1904, 1, 1)));
        Writeln(RCStrModificationDate + ': ' + DateTimeToStr(ModifiedDate / 86400 +
          EncodeDate(1904, 1, 1)));
      end;

      with NameTable do
      begin
        for StrIndex := 0 to NameSubtableCount - 1 do
        begin
          case NameSubtable[StrIndex].PlatformID of
            piUnicode:
              Continue;
            piApple:
              Continue;
          end;

          Assert(NameSubtable[StrIndex] is TTrueTypeFontNamePlatformMicrosoft);
          with TTrueTypeFontNamePlatformMicrosoft(NameSubtable[StrIndex]) do
            if (LanguageID <> SysLocale.DefaultLCID) and (LanguageID <> 1033)
            then
              Continue;

          Writeln(CNameIDs[NameSubtable[StrIndex].NameID] + ': ' +
            NameSubtable[StrIndex].Name);
        end;
      end;
    finally
      Free;
    end;
end;

var
  SR: TSearchRec;

begin
  // show application information
  Writeln('PascalType Font Info');
  Writeln('--------------------');
  Writeln('');

  if ParamStr(1) = '' then
  begin
    Writeln('Usage: ' + ExtractFileName(ParamStr(0)) + ' TrueTypeFontFile');
    Exit;
  end;

  repeat
    if Pos('*', ParamStr(1)) > 0 then
      if FindFirst(ParamStr(1), faAnyFile, SR) = 0 then
        try
          repeat
            LoadFontFile(ExtractFilePath(ParamStr(1)) + SR.Name);
          until FindNext(SR) <> 0;
        finally
          FindClose(SR);
        end
      else
    else
      LoadFontFile(ParamStr(1));
  until Random(200) = 1;
end.
