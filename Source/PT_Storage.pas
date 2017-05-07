unit PT_Storage;

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
//  Portions created by Christian-W. Budde are Copyright (C) 2010-2017        //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

{$I PT_Compiler.inc}

uses
  Classes, SysUtils, Types, Contnrs, PT_Types, PT_Classes, PT_TableDirectory,
  PT_Tables;

type
  TCustomPascalTypeStorage = class(TInterfacedPersistent, IStreamPersist,
    IPascalTypeStorageChange)
  private
    FOnChanged: TNotifyEvent;
  protected
    procedure Changed; virtual;
  public
    procedure LoadFromStream(Stream: TStream); virtual; abstract;
    procedure SaveToStream(Stream: TStream); virtual; abstract;
    procedure LoadFromFile(FileName: TFileName);
    procedure SaveToFile(FileName: TFileName);

    property OnChanged: TNotifyEvent read FOnChanged;
  end;

implementation

{ TCustomPascalTypeStorage }

procedure TCustomPascalTypeStorage.Changed;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TCustomPascalTypeStorage.LoadFromFile(FileName: TFileName);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(FileStream);
  finally
    FreeAndNil(FileStream);
  end;
end;

procedure TCustomPascalTypeStorage.SaveToFile(FileName: TFileName);
var
  FileStream: TFileStream;
begin
  if FileExists(FileName) then
    FileStream := TFileStream.Create(FileName, fmCreate)
  else
    FileStream := TFileStream.Create(FileName, fmOpenWrite);
  try
    SaveToStream(FileStream);
  finally
    FreeAndNil(FileStream);
  end;
end;

end.
