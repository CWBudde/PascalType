unit PT_StorageEOT;

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
  Classes, SysUtils, Types, Contnrs, PT_Types, PT_TableDirectory, PT_Tables,
  PT_Storage, PT_StorageSFNT;

type
  TEOTHeader = packed record
    EotSize            : Cardinal;
    FontDataSize       : Cardinal;
    Version            : Cardinal;
    Flags              : Cardinal;
    FontPanose         : array [0..9] of Byte;
    Charset            : Byte;
    Italic             : Byte;
    Weight             : Cardinal;
    SelectionType      : Word;
    MagicNumber        : Word;
    UnicodeRange       : array [0..3] of Cardinal;
    CodePageRange      : array [0..1] of Cardinal;
    CheckSumAdjustment : Cardinal;
    Reserved           : array [0..3] of Cardinal;
    Padding1           : Word;
  end;

  TPascalTypeEmbeddedOpenType = class(TCustomPascalTypeStorage)
  private
    FEotSize           : Cardinal;
    FFontDataSize      : Cardinal;
    FVersion           : Cardinal;
    FFlags             : Cardinal;
    FFontPanose        : array [0..9] of Byte;
    FCharset           : Byte;
    FItalic            : Byte;
    FWeight            : Cardinal;
    FSelectionType     : Word;
    FMagicNumber       : Word;
    FUnicodeRange      : array [0..3] of Cardinal;
    FCodePageRange     : array [0..1] of Cardinal;
    FCheckSumAdjustment: Cardinal;
    FReserved          : array [0..3] of Cardinal;
    FPadding1          : Word;
    FStorageSFNT       : TPascalTypeStorage;
    procedure SetCharset(const Value: Byte);
    procedure SetCheckSumAdjustment(const Value: Cardinal);
    procedure SetEotSize(const Value: Cardinal);
    procedure SetFlags(const Value: Cardinal);
    procedure SetFontDataSize(const Value: Cardinal);
    procedure SetSelectionType(const Value: Word);
    procedure SetItalic(const Value: Byte);
    procedure SetMagicNumber(const Value: Word);
    procedure SetVersion(const Value: Cardinal);
    procedure SetWeight(const Value: Cardinal);
    procedure SetStorageSFNT(const Value: TPascalTypeStorage);
  protected
    procedure CharsetChanged; virtual;
    procedure CheckSumAdjustmentChanged; virtual;
    procedure EotSizeChanged; virtual;
    procedure FlagsChanged; virtual;
    procedure FontDataSizeChanged; virtual;
    procedure SelectionTypeChanged; virtual;
    procedure ItalicChanged; virtual;
    procedure MagicNumberChanged; virtual;
    procedure VersionChanged; virtual;
    procedure WeightChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property EotSize: Cardinal read FEotSize write SetEotSize;
    property FontDataSize: Cardinal read FFontDataSize write SetFontDataSize;
    property Version: Cardinal read FVersion write SetVersion;
    property Flags: Cardinal read FFlags write SetFlags;
    // property FontPanose: array [0..9] of Byte read FFontPanose write SetFontPanose;
    property Charset: Byte read FCharset write SetCharset;
    property Italic: Byte read FItalic write SetItalic;
    property Weight: Cardinal read FWeight write SetWeight;
    property SelectionType: Word read FSelectionType write SetSelectionType;
    property MagicNumber: Word read FMagicNumber write SetMagicNumber;
    // property UnicodeRange: array [0..3] of Cardinal read FUnicodeRange write SetUnicodeRange;
    // property CodePageRange: array [0..1] of Cardinal read FCodePageRange write SetCodePageRange;
    property CheckSumAdjustment: Cardinal read FCheckSumAdjustment
      write SetCheckSumAdjustment;

    property StorageSFNT: TPascalTypeStorage read FStorageSFNT
      write SetStorageSFNT;
  end;

implementation

{ TPascalTypeEmbeddedOpenType }

procedure TPascalTypeEmbeddedOpenType.LoadFromStream(Stream: TStream);
begin
  inherited;

  with Stream do
  begin
    Read(FEotSize, SizeOf(Cardinal));
    Read(FFontDataSize, SizeOf(Cardinal));
    Read(FVersion, SizeOf(Cardinal));
    Read(FFlags, SizeOf(Cardinal));
    Read(FFontPanose, 10);
    Read(FCharset, SizeOf(Byte));
    Read(FItalic, SizeOf(Byte));
    Read(FWeight, SizeOf(Cardinal));
    Read(FSelectionType, SizeOf(Word));
    Read(FMagicNumber, SizeOf(Word));
    Read(FUnicodeRange, 4 * SizeOf(Cardinal));
    Read(FCodePageRange, 2 * SizeOf(Cardinal));
    Read(FCheckSumAdjustment, SizeOf(Cardinal));
    Read(FReserved, 4 * SizeOf(Cardinal));
    Read(FPadding1, SizeOf(Word));
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SaveToStream(Stream: TStream);
begin
  inherited;

  with Stream do
  begin
    Write(FEotSize, SizeOf(Cardinal));
    Write(FFontDataSize, SizeOf(Cardinal));
    Write(FVersion, SizeOf(Cardinal));
    Write(FFlags, SizeOf(Cardinal));
    Write(FFontPanose, 10);
    Write(FCharset, SizeOf(Byte));
    Write(FItalic, SizeOf(Byte));
    Write(FWeight, SizeOf(Cardinal));
    Write(FSelectionType, SizeOf(Word));
    Write(FMagicNumber, SizeOf(Word));
    Write(FUnicodeRange, 4 * SizeOf(Cardinal));
    Write(FCodePageRange, 2 * SizeOf(Cardinal));
    Write(FCheckSumAdjustment, SizeOf(Cardinal));
    Write(FReserved, 4 * SizeOf(Cardinal));
    Write(FPadding1, SizeOf(Word));
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetCharset(const Value: Byte);
begin
  if FCharset <> Value then
  begin
    FCharset := Value;
    CharsetChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetCheckSumAdjustment
  (const Value: Cardinal);
begin
  if FCheckSumAdjustment <> Value then
  begin
    FCheckSumAdjustment := Value;
    CheckSumAdjustmentChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetEotSize(const Value: Cardinal);
begin
  if FEotSize <> Value then
  begin
    FEotSize := Value;
    EotSizeChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetFlags(const Value: Cardinal);
begin
  if FFlags <> Value then
  begin
    FFlags := Value;
    FlagsChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetFontDataSize(const Value: Cardinal);
begin
  if FFontDataSize <> Value then
  begin
    FFontDataSize := Value;
    FontDataSizeChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetSelectionType(const Value: Word);
begin
  if FSelectionType <> Value then
  begin
    FSelectionType := Value;
    SelectionTypeChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetItalic(const Value: Byte);
begin
  if FItalic <> Value then
  begin
    FItalic := Value;
    ItalicChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetMagicNumber(const Value: Word);
begin
  if FMagicNumber <> Value then
  begin
    FMagicNumber := Value;
    MagicNumberChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetStorageSFNT
  (const Value: TPascalTypeStorage);
begin
  FStorageSFNT.Assign(Value);
end;

procedure TPascalTypeEmbeddedOpenType.SetVersion(const Value: Cardinal);
begin
  if FVersion <> Value then
  begin
    FVersion := Value;
    VersionChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.SetWeight(const Value: Cardinal);
begin
  if FWeight <> Value then
  begin
    FWeight := Value;
    WeightChanged;
  end;
end;

procedure TPascalTypeEmbeddedOpenType.CharsetChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.CheckSumAdjustmentChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.EotSizeChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.FlagsChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.FontDataSizeChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.SelectionTypeChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.ItalicChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.MagicNumberChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.VersionChanged;
begin
  Changed;
end;

procedure TPascalTypeEmbeddedOpenType.WeightChanged;
begin
  Changed;
end;

end.
