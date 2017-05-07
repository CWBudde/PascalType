{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
program TTF2EOT;

{$APPTYPE CONSOLE}

uses
  Classes, SysUtils, Math,
  PT_Types, PT_Classes, PT_Tables, PT_TablesOptional, PT_Storage,
  PT_StorageSFNT, PT_StorageEOT;

resourcestring
  RCStrUnknownFileFormat = 'Unknown file format!';

procedure ConvertFile(TtfFileName, EotFileName: TFilename);
var
  MS         : TMemoryStream;
  FS         : TFileStream;
  EOTHeader  : TEOTHeader;
  i          : Integer;
  FamilyName : WideString;
  SubFamName : WideString;
  VersionStr : WideString;
  FullName   : WideString;
begin
  with TPascalTypeStorage.Create do
  try
    MS := TMemoryStream.Create;
    try
      try
        // load file to memory stream
        MS.LoadFromFile(TtfFileName);

        // reset stream position
        MS.Seek(0, soFromBeginning);

        // load font from memory stream
        LoadFromStream(MS);
      except
        on E: EPascalTypeError do Writeln('Error reading file: ' + E.Message);
      end;
    finally
      FreeAndNil(MS);
    end;

    with EOTHeader do
    begin
      FontDataSize := MS.Size;
      EotSize := SizeOf(EOTHeader) + FontDataSize;
      Version := $00020001;
      Charset := 0;
      MagicNumber := $504c;
      Reserved[0] := 0;
      Reserved[1] := 0;
      Reserved[2] := 0;
      Reserved[3] := 0;
      Padding1 := 0;
      Italic := Byte(fsfItalic in OS2Table.FontSelectionFlags);
      Weight := OS2Table.Weight;
      for i := 0 to Length(FontPANOSE) - 1 do
        FontPANOSE[i] := Panose.Data[i];
      fsType := 0;

      if Assigned(OS2Table) then
      begin
        if Assigned(OS2Table.UnicodeRange) then
        begin
          UnicodeRange[0] := OS2Table.UnicodeRange.AsCardinal[0];
          UnicodeRange[1] := OS2Table.UnicodeRange.AsCardinal[1];
          UnicodeRange[2] := OS2Table.UnicodeRange.AsCardinal[2];
          UnicodeRange[3] := OS2Table.UnicodeRange.AsCardinal[3];
        end;
        if Assigned(OS2Table.CodePageRange) then
        begin
          CodePageRange[0] := OS2Table.CodePageRange.AsCardinal[0];
          CodePageRange[1] := OS2Table.CodePageRange.AsCardinal[1];
        end;
      end;
      CheckSumAdjustment := HeaderTable.CheckSumAdjustment;
    end;

    // eventually backup and delete existing file
    if FileExists(EotFileName) then
    begin
      RenameFile(EotFileName, ChangeFileExt(EotFileName, '.bak'));
      DeleteFile(EotFileName);
    end;

    // create output file
    FS.Create(EotFileName, fmCreate);

    // write EOT header
    FS.Write(EOTHeader, SizeOf(EOTHeader));

    // reset memory stream position
    MS.Seek(0, soFromBeginning);

    // copy data from file stream
    FS.CopyFrom(MS, MS.Size);
  finally
    Free;
  end;
end;


var
  SR : TSearchRec;
begin
  // show application information
  Writeln('PascalType TTF to EOT converter');
  Writeln('-------------------------------');
  Writeln('');

  if (ParamStr(1) = '') or (not FileExists(ParamStr(1))) then
  begin
    Writeln('Usage: ' + ExtractFileName(ParamStr(0)) + ' TTF-File [EOT-File]' );
    Exit;
  end;

  if ParamStr(2) <> '' then
    ConvertFile(ParamStr(1), ParamStr(2))
  else
    ConvertFile(ParamStr(1), ChangeFileExt(ParamStr(1), '.eot'));
end.
