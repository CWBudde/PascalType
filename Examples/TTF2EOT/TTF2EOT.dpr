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
  {$IFDEF Win32} Windows, {$ENDIF} Classes, SysUtils, Math,
  PT_Classes in '..\..\Source\PT_Classes.pas',
  PT_Math in '..\..\Source\PT_Math.pas',
  PT_Storage in '..\..\Source\PT_Storage.pas',
  PT_StorageEOT in '..\..\Source\PT_StorageEOT.pas',
  PT_StorageSFNT in '..\..\Source\PT_StorageSFNT.pas',
  PT_Tables in '..\..\Source\PT_Tables.pas',
  PT_TablesOptional in '..\..\Source\PT_TablesOptional.pas',
  PT_Types in '..\..\Source\PT_Types.pas';

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
  StringSize : Word;
begin
 with TPascalTypeStorage.Create do
  try
   MS := TMemoryStream.Create;
   try
    // load file to memory stream
    MS.LoadFromFile(TtfFileName);

    // reset stream position
    MS.Seek(0, soFromBeginning);

    try
     // load font from memory stream
     LoadFromStream(MS);
    except
     on E: EPascalTypeError do Writeln('Error reading file: ' + E.Message);
    end;

    with EOTHeader do
     begin
      // get strings
      FamilyName := FontFamilyName;
      SubFamName := 'Regular'; //FontSubFamilyName;
      VersionStr := FontVersion; // VersionToString(HeaderTable.FontRevision);
      FullName   := FontName;

      FontDataSize := MS.Size;
      EotSize := SizeOf(EOTHeader) + FontDataSize + (Length(FamilyName) + 
        Length(SubFamName) + Length(VersionStr) + Length(FullName)) * 2 + $12;
      Version := $00020001;
      Charset := 1;
      MagicNumber := $504c;
      Reserved[0] := 0;
      Reserved[1] := 0;
      Reserved[2] := 0;
      Reserved[3] := 0;
      Padding1 := 0;
      Flags := 0;
      Italic := Byte(fsfItalic in OS2Table.FontSelectionFlags);
      Weight := OS2Table.Weight;
      FontPanose[0] := Panose.FamilyType;
      for i := 1 to Length(FontPanose) - 1
       do FontPanose[i] := Panose.Data[i - 1];
      SelectionType := 0;

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
    FS := TFileStream.Create(EotFileName, fmCreate);
    try
     // write EOT header
     FS.Write(EOTHeader, SizeOf(EOTHeader));
     
     // write family name
     StringSize := Length(FamilyName) * SizeOf(FamilyName[1]);
     FS.Write(StringSize, SizeOf(Word));
     FS.Write(FamilyName[1], StringSize);
     StringSize := 0;
     FS.Write(StringSize, SizeOf(Word));

     // write subfamily name
     StringSize := Length(SubFamName) * SizeOf(SubFamName[1]);
     FS.Write(StringSize, SizeOf(Word));
     FS.Write(SubFamName[1], StringSize);
     StringSize := 0;
     FS.Write(StringSize, SizeOf(Word));

     // write vendor string
     StringSize := Length(VersionStr) * SizeOf(VersionStr[1]);
     FS.Write(StringSize, SizeOf(Word));
     FS.Write(VersionStr[1], StringSize);
     StringSize := 0;
     FS.Write(StringSize, SizeOf(Word));

     // write full name
     StringSize := Length(FullName) * SizeOf(FullName[1]);
     FS.Write(StringSize, SizeOf(Word));
     FS.Write(FullName[1], StringSize);
     StringSize := 0;
     FS.Write(StringSize, SizeOf(Word));
     FS.Write(StringSize, SizeOf(Word));

     // reset memory stream position
     MS.Seek(0, soFromBeginning);

     // copy data from file stream
     FS.CopyFrom(MS, MS.Size);
    finally
     FreeAndNil(FS);
    end;
   finally
    FreeAndNil(MS);
   end;
  finally
   Free;
  end;
end;

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

 if ParamStr(2) <> ''
  then ConvertFile(ParamStr(1), ParamStr(2))
  else ConvertFile(ParamStr(1), ChangeFileExt(ParamStr(1), '.eot'));
end.
