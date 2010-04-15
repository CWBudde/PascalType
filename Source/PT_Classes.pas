unit PT_Classes;

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

{$I PT_Compiler.inc}

uses
  Classes, Contnrs, SysUtils, PT_Types;

type
  TCustomPascalTypeNamedTable = class;
  TCustomPascalTypeNamedTableClass = class of TCustomPascalTypeNamedTable;

  IPascalTypeStorage = interface(IUnknown)
  ['{A990D67B-BC60-4DA4-9D90-3C1D30AEC003}']
    function GetTableByTableType(TableType: TTableType): TCustomPascalTypeNamedTable;
    function GetTableByTableClass(TableClass: TCustomPascalTypeNamedTableClass): TCustomPascalTypeNamedTable;
  end;

  TCustomPascalTypeTable = class(TInterfacedPersistent, IStreamPersist)
  protected
    procedure Changed; virtual;

    procedure ResetToDefaults; virtual; abstract;
  public
    constructor Create; virtual;

    procedure LoadFromStream(Stream: TStream); virtual; abstract;
    procedure SaveToStream(Stream: TStream); virtual; abstract;
  end;

  TCustomPascalTypeInterfaceTable = class(TCustomPascalTypeTable)
  protected
    FStorage : IPascalTypeStorage;
  public
    constructor Create(Storage: IPascalTypeStorage); reintroduce; virtual;
  end;

  TCustomPascalTypeNamedTable = class(TCustomPascalTypeInterfaceTable)
  protected
    function GetInternalTableType: TTableType; virtual;
  public
    class function GetTableType: TTableType; virtual; abstract;
    property TableType: TTableType read GetInternalTableType;
  end;

// big-endian stream I/O
function ReadSwappedWord(Stream: TStream): Word; {$IFDEF UseInline} inline; {$ENDIF}
function ReadSwappedSmallInt(Stream: TStream): SmallInt; {$IFDEF UseInline} inline; {$ENDIF}
function ReadSwappedCardinal(Stream: TStream): Cardinal; {$IFDEF UseInline} inline; {$ENDIF}
function ReadSwappedInt64(Stream: TStream): Int64; {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedWord(Stream: TStream; Value : Word); {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedSmallInt(Stream: TStream; Value : SmallInt); {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedCardinal(Stream: TStream; Value: Cardinal); {$IFDEF UseInline} inline; {$ENDIF}
procedure WriteSwappedInt64(Stream: TStream; Value: Int64); {$IFDEF UseInline} inline; {$ENDIF}

implementation

uses
  PT_Math, PT_ResourceStrings;

function ReadSwappedWord(Stream: TStream): Word;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Word)) <> SizeOf(Word)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Word));
 {$ENDIF}
 Result := Swap16(Result);
end;

function ReadSwappedSmallInt(Stream: TStream): SmallInt;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(SmallInt)) <> SizeOf(SmallInt)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(SmallInt));
 {$ENDIF}
 Result := Swap16(Result);
end;

function ReadSwappedCardinal(Stream: TStream): Cardinal;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Cardinal)) <> SizeOf(Cardinal)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Cardinal));
 {$ENDIF}
 Result := Swap32(Result);
end;

function ReadSwappedInt64(Stream: TStream): Int64;
begin
 {$IFDEF ValidateEveryReadOperation}
 if Stream.Read(Result, SizeOf(Int64)) <> SizeOf(Int64)
  then raise EPascalTypeStremReadError.Create(RCStrStreamReadError);
 {$ELSE}
 Stream.Read(Result, SizeOf(Int64));
 {$ENDIF}
 Result := Swap64(Result);
end;

procedure WriteSwappedWord(Stream: TStream; Value: Word);
begin
 Value := Swap16(Value);
 Stream.Write(Value, SizeOf(Word));
end;

procedure WriteSwappedSmallInt(Stream: TStream; Value: SmallInt);
begin
 Value := Swap16(Value);
 Stream.Write(Value, SizeOf(SmallInt));
end;

procedure WriteSwappedCardinal(Stream: TStream; Value: Cardinal);
begin
 Value := Swap32(Value);
 Stream.Write(Value, SizeOf(Cardinal));
end;

procedure WriteSwappedInt64(Stream: TStream; Value: Int64);
begin
 Value := Swap64(Value);
 Stream.Write(Value, SizeOf(Int64));
end;


{ TCustomPascalTypeTable }

constructor TCustomPascalTypeTable.Create;
begin
 ResetToDefaults;
 inherited Create;
end;

procedure TCustomPascalTypeTable.Changed;
begin
 // nothing in here yet!
end;


{ TCustomPascalTypeInterfaceTable }

constructor TCustomPascalTypeInterfaceTable.Create(
  Storage: IPascalTypeStorage);
begin
 FStorage := Storage;
 inherited Create;
end;


{ TCustomPascalTypeNamedTable }

function TCustomPascalTypeNamedTable.GetInternalTableType: TTableType;
begin
 Result := GetTableType;
end;


end.
