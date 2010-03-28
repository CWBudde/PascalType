unit PT_TablesBitmap;

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
  Classes, Contnrs, SysUtils, PT_Types, PT_Tables;

type
  TCustomPascalTypeEmbeddedBitmapTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion : TFixedPoint; // Initially defined as 0x00020000
    procedure SetVersion(const Value: TFixedPoint);
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure VersionChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Version: TFixedPoint read FVersion write SetVersion;
  end;


  // table 'EBDT'

  TPascalTypeEmbeddedBitmapDataTable = class(TCustomPascalTypeEmbeddedBitmapTable)
  private
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  // table 'EBLC'

  TPascalTypeBitmapLineMetrics = class(TCustomPascalTypeTable)
  private
    FAscender              : Shortint;
    FDescender             : Shortint;
    FWidthMax              : Byte;
    FCaretSlopeNumerator   : Shortint;
    FCaretSlopeDenominator : Shortint;
    FCaretOffset           : Shortint;
    FMinOriginSB           : Shortint;
    FMinAdvanceSB          : Shortint;
    FMaxBeforeBL           : Shortint;
    FMinAfterBL            : Shortint;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TPascalTypeBitmapSizeTable = class(TCustomPascalTypeTable)
  private
    FIndexSubTableArrayOffset : Cardinal;     // offset to index subtable from beginning of EBLC.
    FIndexTablesSize          : Cardinal;     // number of bytes in corresponding index subtables and array
    FNumberOfIndexSubTables   : Cardinal;     // an index subtable for each range or format change
    FColorRef                 : Cardinal;     // not used; set to 0.
    FStartGlyphIndex          : Word;         // lowest glyph index for this size
    FEndGlyphIndex            : Word;         // highest glyph index for this size
    FPpemX                    : Byte;         // horizontal pixels per Em
    FPpemY                    : Byte;         // vertical pixels per Em
    FBitDepth                 : Byte;         // the Microsoft rasterizer v.1.7 or greater supports the following bitDepth values, as described below: 1, 2, 4, and 8.
    FFlags                    : AnsiChar;     // vertical or horizontal (see bitmapFlags)

    FHorizontalMetrics        : TPascalTypeBitmapLineMetrics;
    FVerticalMetrics          : TPascalTypeBitmapLineMetrics;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  TPascalTypeEmbeddedBitmapLocationTable = class(TCustomPascalTypeEmbeddedBitmapTable)
  private
    FBitmapSizeList : TObjectList;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  // table 'EBSC'

  TPascalTypeEmbeddedBitmapScalingTable = class(TCustomPascalTypeEmbeddedBitmapTable)
  private
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

implementation

uses
  PT_ResourceStrings;


{ TCustomPascalTypeEmbeddedBitmapTable }

procedure TCustomPascalTypeEmbeddedBitmapTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomPascalTypeEmbeddedBitmapTable(Dest) do
   begin
    FVersion := Self.FVersion;
   end else inherited;
end;

procedure TCustomPascalTypeEmbeddedBitmapTable.ResetToDefaults;
begin
 inherited;
 FVersion.Value := 2;
 FVersion.Fract := 0;
end;

procedure TCustomPascalTypeEmbeddedBitmapTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // read version
   Read(Value32, SizeOf(Cardinal));
   FVersion := TFixedPoint(Swap32(Value32));

   if FVersion.Value < 2
    then raise EPascalTypeError.Create(RCStrUnknownVersion);
  end;
end;

procedure TCustomPascalTypeEmbeddedBitmapTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // write version
   Value32 := Swap32(Cardinal(FVersion));
   Write(Value32, SizeOf(Cardinal));
  end;
end;

procedure TCustomPascalTypeEmbeddedBitmapTable.SetVersion(
  const Value: TFixedPoint);
begin
 if (FVersion.Value <> Value.Value) or
    (FVersion.Fract <> Value.Fract) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TCustomPascalTypeEmbeddedBitmapTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeEmbeddedBitmapDataTable }

constructor TPascalTypeEmbeddedBitmapDataTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
  inherited;

end;

destructor TPascalTypeEmbeddedBitmapDataTable.Destroy;
begin

  inherited;
end;

procedure TPascalTypeEmbeddedBitmapDataTable.AssignTo(Dest: TPersistent);
begin
 inherited;
end;

class function TPascalTypeEmbeddedBitmapDataTable.GetTableType: TTableType;
begin
 Result := 'EBDT';
end;

procedure TPascalTypeEmbeddedBitmapDataTable.ResetToDefaults;
begin
 inherited;
end;

procedure TPascalTypeEmbeddedBitmapDataTable.LoadFromStream(Stream: TStream);
//var Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
  end;
end;

procedure TPascalTypeEmbeddedBitmapDataTable.SaveToStream(Stream: TStream);
//var Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
  end;
end;


{ TPascalTypeBitmapLineMetrics }

procedure TPascalTypeBitmapLineMetrics.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TPascalTypeBitmapLineMetrics(Dest) do
   begin
    FAscender              := Self.FAscender;
    FDescender             := Self.FDescender;
    FWidthMax              := Self.FWidthMax;
    FCaretSlopeNumerator   := Self.FCaretSlopeNumerator;
    FCaretSlopeDenominator := Self.FCaretSlopeDenominator;
    FCaretOffset           := Self.FCaretOffset;
    FMinOriginSB           := Self.FMinOriginSB;
    FMinAdvanceSB          := Self.FMinAdvanceSB;
    FMaxBeforeBL           := Self.FMaxBeforeBL;
    FMinAfterBL            := Self.FMinAfterBL;
   end;
end;

procedure TPascalTypeBitmapLineMetrics.ResetToDefaults;
begin
 inherited;
 FAscender              := 0;
 FDescender             := 0;
 FWidthMax              := 0;
 FCaretSlopeNumerator   := 0;
 FCaretSlopeDenominator := 0;
 FCaretOffset           := 0;
 FMinOriginSB           := 0;
 FMinAdvanceSB          := 0;
 FMaxBeforeBL           := 0;
 FMinAfterBL            := 0;
end;

procedure TPascalTypeBitmapLineMetrics.LoadFromStream(Stream: TStream);
var
  Value8  : Byte;
begin
 inherited;

 with Stream do
  begin
   // read horizontal metrics ascender
   Read(FAscender, 1);

   // read horizontal metrics descender
   Read(FDescender, 1);

   // read horizontal metrics maximum width
   Read(FWidthMax, 1);

   // read horizontal metrics caret slope numerator
   Read(FCaretSlopeNumerator, 1);

   // read horizontal metrics caret slope denominator
   Read(FCaretSlopeDenominator, 1);

   // read horizontal metrics caret offset
   Read(FCaretOffset, 1);

   // read horizontal metrics MinOriginSB
   Read(FMinOriginSB, 1);

   // read horizontal metrics MinAdvanceSB
   Read(FMinAdvanceSB, 1);

   // read horizontal metrics MaxBeforeBL
   Read(FMaxBeforeBL, 1);

   // read horizontal metrics MaxBeforeBL
   Read(FMinAfterBL, 1);

   {$IFDEF AmbigiousExceptions}
   // read horizontal metrics padding
   Read(Value8, 1);
   if Value8 <> 0
    then raise EPascalTypeError.Create(RCStrPaddingByteError);

   Read(Value8, 1);
   if Value8 <> 0
    then raise EPascalTypeError.Create(RCStrPaddingByteError);
   {$ELSE}
   Seek(2, soCurrent);
   {$ENDIF}
  end;
end;

procedure TPascalTypeBitmapLineMetrics.SaveToStream(Stream: TStream);
begin
 inherited;

 with Stream do
  begin
   // write horizontal metrics ascender
   Write(FAscender, 1);

   // write horizontal metrics descender
   Write(FDescender, 1);

   // write horizontal metrics maximum width
   Write(FWidthMax, 1);

   // write horizontal metrics caret slope numerator
   Write(FCaretSlopeNumerator, 1);

   // write horizontal metrics caret slope denominator
   Write(FCaretSlopeDenominator, 1);

   // write horizontal metrics caret offset
   Write(FCaretOffset, 1);

   // write horizontal metrics MinOriginSB
   Write(FMinOriginSB, 1);

   // write horizontal metrics MinAdvanceSB
   Write(FMinAdvanceSB, 1);

   // write horizontal metrics MaxBeforeBL
   Write(FMaxBeforeBL, 1);

   // write horizontal metrics MaxBeforeBL
   Write(FMinAfterBL, 1);
  end;
end;


{ TPascalTypeBitmapSizeTable }

constructor TPascalTypeBitmapSizeTable.Create;
begin
 inherited;
 FHorizontalMetrics := TPascalTypeBitmapLineMetrics.Create;
 FVerticalMetrics := TPascalTypeBitmapLineMetrics.Create;
end;

destructor TPascalTypeBitmapSizeTable.Destroy;
begin
 FreeAndNil(FHorizontalMetrics);
 FreeAndNil(FVerticalMetrics);
 inherited;
end;

procedure TPascalTypeBitmapSizeTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TPascalTypeBitmapSizeTable(Dest) do
   begin
    FIndexSubTableArrayOffset := Self.FIndexSubTableArrayOffset;
    FIndexTablesSize          := Self.FIndexTablesSize;
    FNumberOfIndexSubTables   := Self.FNumberOfIndexSubTables;
    FColorRef                 := Self.FColorRef;
    FStartGlyphIndex          := Self.FStartGlyphIndex;
    FEndGlyphIndex            := Self.FEndGlyphIndex;
    FPpemX                    := Self.FPpemX;
    FPpemY                    := Self.FPpemY;
    FBitDepth                 := Self.FBitDepth;
    FFlags                    := Self.FFlags;

    FHorizontalMetrics.Assign(Self.FHorizontalMetrics);
    FVerticalMetrics.Assign(Self.FVerticalMetrics);
   end;
end;

procedure TPascalTypeBitmapSizeTable.ResetToDefaults;
begin
 inherited;

 FIndexSubTableArrayOffset := 0;
 FIndexTablesSize          := 0;
 FNumberOfIndexSubTables   := 0;
 FColorRef                 := 0;
 FStartGlyphIndex          := 0;
 FEndGlyphIndex            := 0;
 FPpemX                    := 0;
 FPpemY                    := 0;
 FBitDepth                 := 0;
 FFlags                    := #0;

 FHorizontalMetrics.ResetToDefaults;
 FVerticalMetrics.ResetToDefaults;
end;

procedure TPascalTypeBitmapSizeTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
  Value8  : array [0..1] of Byte absolute Value16;
begin
 inherited;

 with Stream do
  begin
   // read index subtable array offset
   Read(Value32, SizeOf(Cardinal));
   FIndexSubTableArrayOffset := Swap32(Value32);

   // read index tables size
   Read(Value32, SizeOf(Cardinal));
   FIndexTablesSize := Swap32(Value32);

   // read number of index subtables
   Read(Value32, SizeOf(Cardinal));
   FNumberOfIndexSubTables := Swap32(Value32);

   // read color reference
   Read(Value32, SizeOf(Cardinal));
   FColorRef := Swap32(Value32);

   // load horizontal metrics from stream
   FHorizontalMetrics.LoadFromStream(Stream);

   // load vertical metrics from stream
   FVerticalMetrics.LoadFromStream(Stream);

   // read start glyph index
   Read(Value16, SizeOf(Word));
   FStartGlyphIndex := Swap16(Value16);

   // read end glyph index
   Read(Value16, SizeOf(Word));
   FEndGlyphIndex := Swap16(Value16);

   // read horizontal pixels per Em
   Read(FPpemX, 1);

   // read vertical pixels per Em
   Read(FPpemY, 1);

   // read bit depth
   Read(FBitDepth, 1);

   // read flags
   Read(FFlags, 1);
  end;
end;

procedure TPascalTypeBitmapSizeTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
  Value16 : Word;
  Value8  : array [0..1] of Byte absolute Value16;
begin
 inherited;

 with Stream do
  begin
   // write index subtable array offset
   Value32 := Swap32(FIndexSubTableArrayOffset);
   Write(Value32, SizeOf(Cardinal));

   // write index tables size
   Value32 := Swap32(FIndexTablesSize);
   Write(Value32, SizeOf(Cardinal));

   // write number of index subtables
   Value32 := Swap32(FNumberOfIndexSubTables);
   Write(Value32, SizeOf(Cardinal));

   // write color reference
   Value32 := Swap32(FColorRef);
   Write(Value32, SizeOf(Cardinal));

   // save horizontal metrics to stream
   FHorizontalMetrics.SaveToStream(Stream);

   // save vertical metrics to stream
   FVerticalMetrics.SaveToStream(Stream);

   // write start glyph index
   Value16 := Swap16(FStartGlyphIndex);
   Write(Value16, SizeOf(Word));

   // write end glyph index
   Value16 := Swap16(FEndGlyphIndex);
   Write(Value16, SizeOf(Word));

   // write horizontal pixels per Em
   Write(FPpemX, 1);

   // write vertical pixels per Em
   Write(FPpemY, 1);

   // write bit depth
   Write(FBitDepth, 1);

   // write flags
   Write(FFlags, 1);
  end;
end;


{ TPascalTypeEmbeddedBitmapLocationTable }

constructor TPascalTypeEmbeddedBitmapLocationTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
 FBitmapSizeList := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeEmbeddedBitmapLocationTable.Destroy;
begin
 FreeAndNil(FBitmapSizeList);
 inherited;
end;

procedure TPascalTypeEmbeddedBitmapLocationTable.AssignTo(Dest: TPersistent);
begin
 inherited;
 if Dest is Self.ClassType then
  with TPascalTypeEmbeddedBitmapLocationTable(Dest) do
   begin
    FBitmapSizeList.Assign(FBitmapSizeList);
   end;
end;

class function TPascalTypeEmbeddedBitmapLocationTable.GetTableType: TTableType;
begin
 Result := 'EBLC';
end;

procedure TPascalTypeEmbeddedBitmapLocationTable.ResetToDefaults;
begin
 inherited;
 FBitmapSizeList.Clear;
end;

procedure TPascalTypeEmbeddedBitmapLocationTable.LoadFromStream(Stream: TStream);
var
  Value32         : Cardinal;
  BitmapSizeCount : Cardinal;
  BitmapSizeIndex : Integer;
  BitmapSizeTable : TPascalTypeBitmapSizeTable;
begin
 inherited;

 with Stream do
  begin
   // read number of BitmapSize tables
   Read(Value32, SizeOf(Cardinal));
   BitmapSizeCount := Swap32(Value32);

   // read bitmap size tables
   for BitmapSizeIndex := 0 to BitmapSizeCount - 1 do
    begin
     // create bitmap size table
     BitmapSizeTable := TPascalTypeBitmapSizeTable.Create;

     // load bitmap size table
     BitmapSizeTable.LoadFromStream(Stream);

     // add bitmap size table
     FBitmapSizeList.Add(BitmapSizeTable);
    end;
  end;
end;

procedure TPascalTypeEmbeddedBitmapLocationTable.SaveToStream(Stream: TStream);
var
  Value32         : Cardinal;
  BitmapSizeIndex : Integer;
begin
 inherited;

 with Stream do
  begin
   // write number of BitmapSize tables
   Value32 := Swap32(FBitmapSizeList.Count);
   Write(Value32, SizeOf(Cardinal));

   // write bitmap size tables
   for BitmapSizeIndex := 0 to FBitmapSizeList.Count - 1 do
    begin
     // save bitmap size table to stream
     TPascalTypeBitmapSizeTable(FBitmapSizeList).SaveToStream(Stream);
    end;
  end;
end;


{ TPascalTypeEmbeddedBitmapScalingTable }

constructor TPascalTypeEmbeddedBitmapScalingTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
  inherited;

end;

destructor TPascalTypeEmbeddedBitmapScalingTable.Destroy;
begin

  inherited;
end;

procedure TPascalTypeEmbeddedBitmapScalingTable.AssignTo(Dest: TPersistent);
begin
 inherited;
end;

class function TPascalTypeEmbeddedBitmapScalingTable.GetTableType: TTableType;
begin
 Result := 'EBLC';
end;

procedure TPascalTypeEmbeddedBitmapScalingTable.ResetToDefaults;
begin
 inherited;
end;

procedure TPascalTypeEmbeddedBitmapScalingTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
  end;
end;

procedure TPascalTypeEmbeddedBitmapScalingTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
  end;
end;


initialization
  RegisterPascalTypeTables([TPascalTypeEmbeddedBitmapDataTable,
    TPascalTypeEmbeddedBitmapLocationTable,
    TPascalTypeEmbeddedBitmapScalingTable]);

end.
