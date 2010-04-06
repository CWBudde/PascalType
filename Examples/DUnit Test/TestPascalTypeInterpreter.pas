unit TestPascalTypeInterpreter;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Version: MPL 1.1 or LGPL 2.1 with linking exception                       //
//                                                                            //
//  The contents of this file are subject to the Mozilla Public License       //
//  Version 1.1 (the "License"); you may not use this file except in          //
//  compliance with the License. You may obtain a copy of the License at      //
//  http://www.mozilla.org/MPL/                                               //
//                                                                            //
//  Software distributed under the License is distributed on an "AS IS"       //
//  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the   //
//  License for the specific language governing rights and limitations under  //
//  the License.                                                              //
//                                                                            //
//  Alternatively, the contents of this file may be used under the terms of   //
//  the Free Pascal modified version of the GNU Lesser General Public         //
//  License Version 2.1 (the "FPC modified LGPL License"), in which case the  //
//  provisions of this license are applicable instead of those above.         //
//  Please see the file LICENSE.txt for additional information concerning     //
//  this license.                                                             //
//                                                                            //
//  The code is part of the PascalType Project                                //
//                                                                            //
//  The initial developer of this code is Christian-W. Budde                  //
//                                                                            //
//  Portions created by Christian-W. Budde are Copyright (C) 2010             //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

uses
  Windows, TestFramework, Classes, Contnrs, SysUtils, PT_Types, PT_Tables,
  PT_TablesOptional, PT_TablesOpenType, PT_Interpreter;

type
  // Test methods for class TTrueTypeFontInterpreter
  TTestPascalTypeScanner = class(TTestCase)
  strict private
    FPascalTypeScanner : TPascalTypeScanner;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestScanLocalFonts;
    procedure TestScanWindowsFonts;
  end;

  // Test methods for class TTrueTypeFontInterpreter
  TTestPascalTypeInterpreter = class(TTestCase)
  strict private
    FPascalTypeInterpreter : TPascalTypeInterpreter;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestInterpreteLocalFonts;
    procedure TestInterpreteWindowsFonts;
    procedure TestWriteFont;
  end;

implementation

uses
  ShlObj, ActiveX, Dialogs;

procedure StrResetLength(var S: AnsiString);
begin
 SetLength(S, StrLen(PChar(S)));
end;

function PidlToPath(IdList: PItemIdList): string;
begin
 SetLength(Result, MAX_PATH);
 if SHGetPathFromIdList(IdList, PChar(Result))
  then StrResetLength(Result)
  else Result := '';
end;

function PidlFree(var IdList: PItemIdList): Boolean;
var
  Malloc: IMalloc;
begin
 Result := False;
 if IdList = nil
  then Result := True
  else
   begin
    if Succeeded(SHGetMalloc(Malloc)) and (Malloc.DidAlloc(IdList) > 0) then
     begin
      Malloc.Free(IdList);
      IdList := nil;
      Result := True;
     end;
   end;
end;

function GetFontDirectory: string;
var
  lFolderPidl: PItemIdList;
begin
  if Succeeded(SHGetSpecialFolderLocation(0, CSIDL_FONTS, lFolderPidl)) then
  begin
    Result := PidlToPath(lFolderPidl);
    PidlFree(lFolderPidl);
  end
  else
    Result := '';
end;

////////////////////////////////////////////////////////////////////////////////

{ TTestPascalTypeScanner }

procedure TTestPascalTypeScanner.SetUp;
begin
 inherited;
 FPascalTypeScanner := TPascalTypeScanner.Create;
end;

procedure TTestPascalTypeScanner.TearDown;
begin
 FreeAndNil(FPascalTypeScanner);
 inherited;
end;

procedure TTestPascalTypeScanner.TestScanLocalFonts;
var
  SR      : TSearchRec;
  Succeed : Boolean;
begin
 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeScanner.LoadFromFile(SR.Name)
    except
     on e: EPascalTypeError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
     else Succeed := False;
    end;
    Check(Succeed, 'Error scanning file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   FindClose(SR);
  end;
end;

procedure TTestPascalTypeScanner.TestScanWindowsFonts;
var
  SR          : TSearchRec;
  Succeed     : Boolean;
begin
 SetCurrentDir(GetFontDirectory);

 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeScanner.LoadFromFile(SR.Name);
    except
     on e: EPascalTypeError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
     else Succeed := False;
    end;
    Check(Succeed, 'Error scanning file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   FindClose(SR);
  end;
end;



{ TTestPascalTypeInterpreter }

procedure TTestPascalTypeInterpreter.SetUp;
begin
 inherited;
 FPascalTypeInterpreter := TPascalTypeInterpreter.Create;
end;

procedure TTestPascalTypeInterpreter.TearDown;
begin
 FreeAndNil(FPascalTypeInterpreter);
 inherited;
end;

procedure TTestPascalTypeInterpreter.TestInterpreteLocalFonts;
var
  SR          : TSearchRec;
  Succeed     : Boolean;
begin
 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeInterpreter.LoadFromFile(SR.Name)
    except
     on e: EPascalTypeError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
     else Succeed := False;
    end;
    Check(Succeed, 'Error loading file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   FindClose(SR);
  end;
end;

procedure TTestPascalTypeInterpreter.TestInterpreteWindowsFonts;
var
  SR          : TSearchRec;
  Succeed     : Boolean;
begin
 SetCurrentDir(GetFontDirectory);

 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeInterpreter.LoadFromFile(SR.Name)
    except
     on e: EPascalTypeError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
     else Succeed := False;
    end;
    Check(Succeed, 'Error loading file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   FindClose(SR);
  end;
end;

procedure TTestPascalTypeInterpreter.TestWriteFont;
var
  ResourceStream : TResourceStream;
  TempStream     : TMemoryStream;
begin
 ResourceStream := TResourceStream.Create(HInstance, 'Default', 'TTFFONT');
 try
  FPascalTypeInterpreter.LoadFromStream(ResourceStream);
  TempStream := TMemoryStream.Create;
  try
   FPascalTypeInterpreter.SaveToStream(TempStream);
  finally
   FreeAndNil(TempStream);
  end;
 finally
  FreeAndNil(ResourceStream);
 end;
end;

initialization
  // Register all test cases
  RegisterTest(TTestPascalTypeScanner.Suite);
  RegisterTest(TTestPascalTypeInterpreter.Suite);

end.
