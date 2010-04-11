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
  PT_TablesOptional, PT_TablesOpenType, PT_TablesApple, PT_Storage,
  PT_CharacterMap, PT_Windows;

type
  // Test methods for class TTrueTypeFontStorage
  TTestPascalTypeStorageScan = class(TTestCase)
  strict private
    FPascalTypeStorageScan : TPascalTypeStorageScan;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestScanLocalFonts;
    procedure TestScanWindowsFonts;
  end;

  // Test methods for class TTrueTypeFontStorage
  TTestPascalTypeStorage = class(TTestCase)
  strict private
    FPascalTypeStorage : TPascalTypeStorage;
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
  Dialogs;

{ TTestPascalTypeStorageScan }

procedure TTestPascalTypeStorageScan.SetUp;
begin
 inherited;
 FPascalTypeStorageScan := TPascalTypeStorageScan.Create;
end;

procedure TTestPascalTypeStorageScan.TearDown;
begin
 FreeAndNil(FPascalTypeStorageScan);
 inherited;
end;

procedure TTestPascalTypeStorageScan.TestScanLocalFonts;
var
  SR      : TSearchRec;
  Succeed : Boolean;
begin
 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeStorageScan.LoadFromFile(SR.Name)
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

procedure TTestPascalTypeStorageScan.TestScanWindowsFonts;
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
     FPascalTypeStorageScan.LoadFromFile(SR.Name);
    except
     on e: EPascalTypeError do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
//     on e: Exception do MessageDlg(SR.Name + ': ' + e.Message, mtError, [mbOK], 0);
     else Succeed := False;
    end;
    Check(Succeed, 'Error scanning file: ' + SR.Name);
   until FindNext(SR) <> 0;
  finally
   FindClose(SR);
  end;
end;



{ TTestPascalTypeStorage }

procedure TTestPascalTypeStorage.SetUp;
begin
 inherited;
 FPascalTypeStorage := TPascalTypeStorage.Create;
end;

procedure TTestPascalTypeStorage.TearDown;
begin
 FreeAndNil(FPascalTypeStorage);
 inherited;
end;

procedure TTestPascalTypeStorage.TestInterpreteLocalFonts;
var
  SR          : TSearchRec;
  Succeed     : Boolean;
begin
 if FindFirst('*.ttf', faAnyFile, SR) = 0 then
  try
   repeat
    Succeed := True;
    try
     FPascalTypeStorage.LoadFromFile(SR.Name)
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

procedure TTestPascalTypeStorage.TestInterpreteWindowsFonts;
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
     FPascalTypeStorage.LoadFromFile(SR.Name)
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

procedure TTestPascalTypeStorage.TestWriteFont;
var
  ResourceStream : TResourceStream;
  TempStream     : TMemoryStream;
begin
 ResourceStream := TResourceStream.Create(HInstance, 'Default', 'TTFFONT');
 try
  FPascalTypeStorage.LoadFromStream(ResourceStream);
  TempStream := TMemoryStream.Create;
  try
   FPascalTypeStorage.SaveToStream(TempStream);
  finally
   FreeAndNil(TempStream);
  end;
 finally
  FreeAndNil(ResourceStream);
 end;
end;

initialization
  // Register all test cases
  RegisterTest(TTestPascalTypeStorageScan.Suite);
  RegisterTest(TTestPascalTypeStorage.Suite);

end.
