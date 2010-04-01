unit PT_TablesApple;

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
  Classes, Contnrs, PT_Types, PT_Tables, PT_TablesShared;

type
  TCustomPascalTypeNamedVersionTable = class(TCustomPascalTypeNamedTable)
  private
    FVersion : TFixedPoint;
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


  // table 'acnt'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6acnt.html
  TPascalTypeAccentAttachmentTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FFirstAccentGlyphIndex : Word; // The first accented glyph index.
    FLastAccentGlyphIndex  : Word; // The last accented glyph index.
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'avar'

  TAxisVariationCorrespondence = packed record
    fromCoord : TShortFrac; // Value in normalized user space.
    toCoord   : TShortFrac; // Value in normalized axis space.
  end;

  TPascalTypeAxisVariationSegmentTable = class(TCustomPascalTypeTable)
  private
    FCorrespondenceArray : array of TAxisVariationCorrespondence;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6avar.html
  TPascalTypeAxisVariationTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FSegments : TObjectList;
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


  // table 'bsln'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6bsln.html
  TPascalTypeBaselineTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FFormat          : Word; // Format of the baseline table. Only one baseline format may be selected for the font.
    FDefaultBaseline : Word; // Default baseline value for all glyphs. This value can be from 0 through 31.
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'bdat'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6bdat.html
  TPascalTypeBitmapDataTable = class(TCustomPascalTypeNamedVersionTable)
  private
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'bhed'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6bhed.html
  TPascalTypeBitmapHeaderTable = class(TPascalTypeHeaderTable)
  public
    class function GetTableType: TTableType; override;
  end;


  // table 'bloc'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6bloc.html
  TPascalTypeBitmapLocationTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FBitmapSizeList : TObjectList;
    function GetBitmapSizeTable(Index: Integer): TPascalTypeBitmapSizeTable;
    function GetBitmapSizeTableCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property BitmapSizeTableCount: Integer read GetBitmapSizeTableCount;
    property BitmapSizeTable[Index: Integer]: TPascalTypeBitmapSizeTable read GetBitmapSizeTable;
  end;


  // table 'fdsc'

  TCustomPascalTypeTaggedValueTable = class(TCustomPascalTypeTable)
  protected
    FValue : TFixedPoint;
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
    procedure ValueChanged; virtual;

    class function GetTableType: TTableType; virtual; abstract;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;
  TPascalTypeTaggedValueTableClass = class of TCustomPascalTypeTaggedValueTable;

  TPascalTypeWeightValueTable = class(TCustomPascalTypeTaggedValueTable)
  private
    procedure SetValue(const Value: TFixedPoint);
  protected
    class function GetTableType: TTableType; override;
  public
    property Weight: TFixedPoint read FValue write SetValue;
  end;

  TPascalTypeWidthValueTable = class(TCustomPascalTypeTaggedValueTable)
  private
    procedure SetValue(const Value: TFixedPoint);
  protected
    class function GetTableType: TTableType; override;
  public
    property Width: TFixedPoint read FValue write SetValue;
  end;

  TPascalTypeSlantValueTable = class(TCustomPascalTypeTaggedValueTable)
  private
    procedure SetValue(const Value: TFixedPoint);
  protected
    class function GetTableType: TTableType; override;
  public
    property Slant: TFixedPoint read FValue write SetValue;
  end;

  TPascalTypeOpticalSizeValueTable = class(TCustomPascalTypeTaggedValueTable)
  private
    procedure SetValue(const Value: TFixedPoint);
  protected
    class function GetTableType: TTableType; override;
  public
    property OpticalSize: TFixedPoint read FValue write SetValue;
  end;

  TPascalTypeNonAlphabeticValueTable = class(TCustomPascalTypeTaggedValueTable)
  private
    function GetCode: TNonAlphabeticCode;
    procedure SetCode(const Value: TNonAlphabeticCode);
  protected
    class function GetTableType: TTableType; override;
  public
    property Code: TNonAlphabeticCode read GetCode write SetCode;
  end;


  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6fdsc.html
  TPascalTypeFontDescriptionTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FDescritors : TObjectList;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'feat'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6feat.html
  TPascalTypeFeatureTable = class(TCustomPascalTypeNamedVersionTable)
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'fvar'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6fvar.html
  TPascalTypeFontVariationTable = class(TCustomPascalTypeNamedVersionTable)
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'hsty'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6hsty.html
  TPascalTypeHorizontalStyleTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FExtraPlain     : SmallInt; // Extra space required when the font is not styled. Should be 0.
    FExtraBold      : SmallInt; // Extra space required when the font is boldfaced.
    FExtraItalic    : SmallInt; // Extra space required when the font is italicized.
    FExtraUnderline : SmallInt; // Extra space required when the font is underlined.
    FExtraOutline   : SmallInt; // Extra space required when the font is outlined.
    FExtraShadow    : SmallInt; // Extra space required when the font is shadowed.
    FExtraCondensed : SmallInt; // Extra space required when the font is condensed.
    FExtraExtended  : SmallInt; // Extra space required when the font is extended.
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'mort'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6mort.html
  TPascalTypeGlyphMetamorphosisTable = class(TCustomPascalTypeNamedVersionTable)
  private
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'morx'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6morx.html
  TPascalTypeExtendedGlyphMetamorphosisTable = class(TCustomPascalTypeNamedVersionTable)
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'opbd'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6opbd.html
  TPascalTypeOpticalBoundsTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FFormat  : Word;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'prop'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6prop.html
  TPascalTypeGlyphPropertiesTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FFormat  : Word; // Format of the tracking table (set to 0).
    FDefault : Word; // properties 	Default properties applied to a glyph if that glyph is not present in the lookup table.
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'trak'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6trak.html
  TPascalTypeTrackingTable = class(TCustomPascalTypeNamedVersionTable)
  private
    FFormat      : Word; // Format of the tracking table (set to 0).
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


  // table 'Zapf'

  // not entirely implemented, for more details see
  // http://developer.apple.com/fonts/TTRefMan/RM06/Chap6Zapf.html
  TPascalTypeZapfTable = class(TCustomPascalTypeNamedVersionTable)
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;


procedure RegisterDescriptionTag(TableClass: TPascalTypeTaggedValueTableClass);
procedure RegisterDescriptionTags(TableClasses: array of TPascalTypeTaggedValueTableClass);
function FindDescriptionTagByType(TableType: TTableType): TPascalTypeTaggedValueTableClass;

implementation

uses
  SysUtils, PT_ResourceStrings;

var
  GDescriptionTagClasses : array of TPascalTypeTaggedValueTableClass;

{ TCustomPascalTypeNamedVersionTable }

procedure TCustomPascalTypeNamedVersionTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomPascalTypeNamedVersionTable(Dest) do
   begin
    FVersion := Self.FVersion;
   end
 else inherited;
end;

procedure TCustomPascalTypeNamedVersionTable.ResetToDefaults;
begin
 inherited;
 FVersion.Value := 1;
 FVersion.Fract := 0;
end;

procedure TCustomPascalTypeNamedVersionTable.LoadFromStream(Stream: TStream);
var
  Value32  : Cardinal;
begin
 inherited;

 with Stream do
  begin
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read version
   Read(Value32, SizeOf(TFixedPoint));
   FVersion := TFixedPoint(Swap32(Value32));

   if Version.Value < 1
    then raise EPascalTypeError.Create(RCStrUnsupportedVersion);
  end;
end;

procedure TCustomPascalTypeNamedVersionTable.SaveToStream(Stream: TStream);
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

procedure TCustomPascalTypeNamedVersionTable.SetVersion(
  const Value: TFixedPoint);
begin
 if (FVersion.Value <> Value.Value) or
    (FVersion.Fract <> Value.Fract) then
  begin
   FVersion := Value;
   VersionChanged;
  end;
end;

procedure TCustomPascalTypeNamedVersionTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeAccentAttachmentTable }

procedure TPascalTypeAccentAttachmentTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeAccentAttachmentTable(Dest) do
   begin
    FFirstAccentGlyphIndex := Self.FFirstAccentGlyphIndex;
    FLastAccentGlyphIndex  := Self.FLastAccentGlyphIndex;
   end;
end;

class function TPascalTypeAccentAttachmentTable.GetTableType: TTableType;
begin
 Result := 'acnt';
end;

procedure TPascalTypeAccentAttachmentTable.ResetToDefaults;
begin
 inherited;
 FFirstAccentGlyphIndex := 0;
 FLastAccentGlyphIndex  := 0;
end;

procedure TPascalTypeAccentAttachmentTable.LoadFromStream(Stream: TStream);
var
  Value32    : Cardinal;
  DescOffset : Cardinal;
  ExtOffset  : Cardinal;
  SecOffset  : Cardinal;
  Value16    : Word;
begin
 inherited;

 with Stream do
  begin
   // read first glyph
   Read(Value16, SizeOf(Word));
   FFirstAccentGlyphIndex := Swap16(Value16);

   // read last glyph
   Read(Value16, SizeOf(Word));
   FLastAccentGlyphIndex := Swap16(Value16);

   {$IFDEF AmbigiousExceptions}
   if FLastAccentGlyphIndex < FFirstAccentGlyphIndex
    then raise EPascalTypeError.Create('Last glyph index is smaller than first!');
   {$ENDIF}

   // read description offset
   Read(Value32, SizeOf(Cardinal));
   DescOffset := Swap32(Value32);

   // read extension offset
   Read(Value32, SizeOf(Cardinal));
   ExtOffset := Swap32(Value32);

   // read secondary offset
   Read(Value32, SizeOf(Cardinal));
   SecOffset := Swap32(Value32);
  end;
end;

procedure TPascalTypeAccentAttachmentTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // write first glyph
   Value16 := Swap16(FFirstAccentGlyphIndex);
   Write(Value16, SizeOf(Word));

   // write last glyph
   Value16 := Swap16(FLastAccentGlyphIndex);
   Write(Value16, SizeOf(Word));
  end;
end;


{ TPascalTypeAxisVariationSegmentTable }

procedure TPascalTypeAxisVariationSegmentTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeAxisVariationSegmentTable(Dest) do
   begin
    FCorrespondenceArray := Self.FCorrespondenceArray;
   end;
end;

procedure TPascalTypeAxisVariationSegmentTable.ResetToDefaults;
begin
 inherited;
 SetLength(FCorrespondenceArray, 0);
end;

procedure TPascalTypeAxisVariationSegmentTable.LoadFromStream(Stream: TStream);
var
  PairIndex : Integer;
  Value16   : Word;
begin
 inherited;

 with Stream do
  begin
   // read pair count
   Read(Value16, SizeOf(Word));
   SetLength(FCorrespondenceArray, Swap16(Value16));

   for PairIndex := 0 to Length(FCorrespondenceArray) - 1 do
    with FCorrespondenceArray[PairIndex] do
     begin
      // read 'from' coordinate
      Read(Value16, SizeOf(Word));
      fromCoord := Swap16(Value16);

      // read 'to' coordinate
      Read(Value16, SizeOf(Word));
      toCoord := Swap16(Value16);
     end;
  end;
end;

procedure TPascalTypeAxisVariationSegmentTable.SaveToStream(Stream: TStream);
var
  PairIndex : Integer;
  Value16   : Word;
begin
 inherited;

 with Stream do
  begin
   // write pair count
   Value16 := Swap16(Length(FCorrespondenceArray));
   Write(Value16, SizeOf(Word));

   for PairIndex := 0 to Length(FCorrespondenceArray) - 1 do
    with FCorrespondenceArray[PairIndex] do
     begin
      // write 'from' coordinate
      Value16 := Swap16(fromCoord);
      Write(Value16, SizeOf(Word));

      // write 'to' coordinate
      Value16 := Swap16(toCoord);
      Write(Value16, SizeOf(Word));
     end;
  end;
end;


{ TPascalTypeAxisVariationTable }

constructor TPascalTypeAxisVariationTable.Create(Interpreter: IPascalTypeInterpreter);
begin
 inherited Create(Interpreter);
 FSegments := TObjectList.Create;
end;

destructor TPascalTypeAxisVariationTable.Destroy;
begin
 FreeAndNil(FSegments);
 inherited;
end;

procedure TPascalTypeAxisVariationTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeAxisVariationTable(Dest) do
   begin
    FSegments.Assign(Self.FSegments);
   end;
end;

class function TPascalTypeAxisVariationTable.GetTableType: TTableType;
begin
 Result := 'avar';
end;

procedure TPascalTypeAxisVariationTable.ResetToDefaults;
begin
 inherited;
 FSegments.Clear;
end;

procedure TPascalTypeAxisVariationTable.LoadFromStream(Stream: TStream);
var
  Value32   : Cardinal;
  AxisCount : Cardinal;
  AxisIndex : Cardinal;
  Segment   : TPascalTypeAxisVariationSegmentTable;
begin
 inherited;

 with Stream do
  begin
   // read axis count
   Read(Value32, SizeOf(Cardinal));
   AxisCount := Swap32(Value32);

   for AxisIndex := 0 to AxisCount - 1 do
    begin
     // create segment object
     Segment := TPascalTypeAxisVariationSegmentTable.Create;

     // load segment from stream
     Segment.LoadFromStream(Stream);

     // add segment to segment list
     FSegments.Add(Segment);
    end;
  end;
end;

procedure TPascalTypeAxisVariationTable.SaveToStream(Stream: TStream);
var
  Value32   : Cardinal;
  AxisIndex : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // write axis count
   Value32 := Swap32(FSegments.Count);
   Write(Value32, SizeOf(Cardinal));

   for AxisIndex := 0 to FSegments.Count - 1 do
    with TPascalTypeAxisVariationSegmentTable(FSegments[AxisIndex]) do
     begin
      // save segment to stream
      SaveToStream(Stream);
    end;
  end;
end;


{ TPascalTypeBaselineTable }

procedure TPascalTypeBaselineTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeBaselineTable(Dest) do
   begin

   end;
end;

class function TPascalTypeBaselineTable.GetTableType: TTableType;
begin
 Result := 'bsln';
end;

procedure TPascalTypeBaselineTable.ResetToDefaults;
begin
 inherited;
 FFormat          := 0;
 FDefaultBaseline := 0;
end;

procedure TPascalTypeBaselineTable.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // check if table is complete
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read format
   Read(Value16, SizeOf(Word));
   FFormat := Swap16(Value16);

   // read default baseline
   Read(Value16, SizeOf(Word));
   FDefaultBaseline := Swap16(Value16);
  end;
end;

procedure TPascalTypeBaselineTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // write format
   Value16 := Swap16(FFormat);
   Write(Value16, SizeOf(Word));

   // write default baseline
   Value16 := Swap16(FDefaultBaseline);
   Write(Value16, SizeOf(Word));
  end;
end;


{ TPascalTypeBitmapHeaderTable }

class function TPascalTypeBitmapHeaderTable.GetTableType: TTableType;
begin
 Result := 'bhed';
end;


{ TPascalTypeBitmapLocationTable }

constructor TPascalTypeBitmapLocationTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
 FBitmapSizeList := TObjectList.Create;
 inherited;
end;

destructor TPascalTypeBitmapLocationTable.Destroy;
begin
 FreeAndNil(FBitmapSizeList);
 inherited;
end;

procedure TPascalTypeBitmapLocationTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeBitmapLocationTable(Dest) do
   begin

   end;
end;

function TPascalTypeBitmapLocationTable.GetBitmapSizeTable(
  Index: Integer): TPascalTypeBitmapSizeTable;
begin
 if (Index >= 0) and (Index < FBitmapSizeList.Count)
  then Result := TPascalTypeBitmapSizeTable(FBitmapSizeList[Index])
  else raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeBitmapLocationTable.GetBitmapSizeTableCount: Integer;
begin
 Result := FBitmapSizeList.Count;
end;

class function TPascalTypeBitmapLocationTable.GetTableType: TTableType;
begin
 Result := 'bloc';
end;

procedure TPascalTypeBitmapLocationTable.ResetToDefaults;
begin
 inherited;
 FBitmapSizeList.Clear;
end;

procedure TPascalTypeBitmapLocationTable.LoadFromStream(Stream: TStream);
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

procedure TPascalTypeBitmapLocationTable.SaveToStream(Stream: TStream);
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


{ TPascalTypeBitmapDataTable }

procedure TPascalTypeBitmapDataTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeBitmapDataTable(Dest) do
   begin

   end;
end;

class function TPascalTypeBitmapDataTable.GetTableType: TTableType;
begin
 Result := 'bdat';
end;

procedure TPascalTypeBitmapDataTable.ResetToDefaults;
begin
 inherited;
end;

procedure TPascalTypeBitmapDataTable.LoadFromStream(Stream: TStream);
begin
 inherited;
end;

procedure TPascalTypeBitmapDataTable.SaveToStream(Stream: TStream);
begin
 inherited;
end;


{ TCustomPascalTypeTaggedValueTable }

procedure TCustomPascalTypeTaggedValueTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TCustomPascalTypeTaggedValueTable(Dest) do
   begin
    FValue := Self.FValue;
   end;
end;

procedure TCustomPascalTypeTaggedValueTable.ResetToDefaults;
begin
 inherited;
 FValue.Value := 0;
 FValue.Fract := 0;
end;

procedure TCustomPascalTypeTaggedValueTable.LoadFromStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // check if table is complete
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read value
   Read(Value32, SizeOf(Cardinal));
   FValue := TFixedPoint(Swap32(Value32));
  end;
end;

procedure TCustomPascalTypeTaggedValueTable.SaveToStream(Stream: TStream);
var
  Value32 : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // write value
   Value32 := Swap32(Cardinal(FValue));
   Write(Value32, SizeOf(Cardinal));
  end;
end;

procedure TCustomPascalTypeTaggedValueTable.ValueChanged;
begin
 Changed;
end;


{ TPascalTypeWeightValueTable }

class function TPascalTypeWeightValueTable.GetTableType: TTableType;
begin
 Result := 'wght';
end;

procedure TPascalTypeWeightValueTable.SetValue(const Value: TFixedPoint);
begin
 if (FValue.Fract <> Value.Fract) or
    (FValue.Value <> Value.Value) then
  begin
   FValue := Value;
   ValueChanged;
  end;
end;


{ TPascalTypeWidthValueTable }

class function TPascalTypeWidthValueTable.GetTableType: TTableType;
begin
 Result := 'wdth';
end;

procedure TPascalTypeWidthValueTable.SetValue(const Value: TFixedPoint);
begin
 if (FValue.Fract <> Value.Fract) or
    (FValue.Value <> Value.Value) then
  begin
   FValue := Value;
   ValueChanged;
  end;
end;


{ TPascalTypeSlantValueTable }

class function TPascalTypeSlantValueTable.GetTableType: TTableType;
begin
 Result := 'slnt';
end;

procedure TPascalTypeSlantValueTable.SetValue(const Value: TFixedPoint);
begin
 if (FValue.Fract <> Value.Fract) or
    (FValue.Value <> Value.Value) then
  begin
   FValue := Value;
   ValueChanged;
  end;
end;


{ TPascalTypeOpticalSizeValueTable }

class function TPascalTypeOpticalSizeValueTable.GetTableType: TTableType;
begin
 Result := 'opsz';
end;

procedure TPascalTypeOpticalSizeValueTable.SetValue(const Value: TFixedPoint);
begin
 if (FValue.Fract <> Value.Fract) or
    (FValue.Value <> Value.Value) then
  begin
   FValue := Value;
   ValueChanged;
  end;
end;


{ TPascalTypeNonAlphabeticValueTable }

class function TPascalTypeNonAlphabeticValueTable.GetTableType: TTableType;
begin
 Result := 'nalt';
end;

function TPascalTypeNonAlphabeticValueTable.GetCode: TNonAlphabeticCode;
begin
 Result := FixedPointToNonAlphabeticCode(FValue);
end;

procedure TPascalTypeNonAlphabeticValueTable.SetCode(
  const Value: TNonAlphabeticCode);
begin
 if (FixedPointToNonAlphabeticCode(FValue) <> Value) then
  begin
   FValue := NonAlphabeticCodeToFixedPoint(Value);
   ValueChanged;
  end;
end;


{ TPascalTypeFontDescriptionTable }

constructor TPascalTypeFontDescriptionTable.Create(
  Interpreter: IPascalTypeInterpreter);
begin
 inherited;
 FDescritors := TObjectList.Create;
end;

destructor TPascalTypeFontDescriptionTable.Destroy;
begin
 FreeAndNil(FDescritors);
 inherited;
end;

procedure TPascalTypeFontDescriptionTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeFontDescriptionTable(Dest) do
   begin
    FDescritors.Assign(Self.FDescritors);
   end;
end;

class function TPascalTypeFontDescriptionTable.GetTableType: TTableType;
begin
 Result := 'fdsc';
end;

procedure TPascalTypeFontDescriptionTable.ResetToDefaults;
begin
 inherited;
 FDescritors.Clear;
end;

procedure TPascalTypeFontDescriptionTable.LoadFromStream(Stream: TStream);
var
  Value32   : Cardinal;
  DescCount : Cardinal;
  DescIndex : Cardinal;
  TagClass  : TPascalTypeTaggedValueTableClass;
  Descritor : TCustomPascalTypeTaggedValueTable;
begin
 inherited;

 with Stream do
  begin
   // check if table is complete
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read description count
   Read(Value32, SizeOf(Cardinal));
   DescCount := Swap32(Value32);

   for DescIndex := 0 to DescCount - 1 do
    begin
     // read tag
     Read(Value32, SizeOf(Cardinal));

     // find description class by tag
     TagClass := FindDescriptionTagByType(TTableType(Value32));

     // read tag
     if Assigned(TagClass) then
      begin
       // create descriptor
       Descritor := TagClass.Create;

       // read descriptor from stream
       Descritor.LoadFromStream(Stream);

       // add descriptor to descriptor list
       FDescritors.Add(Descritor);
      end
     else Seek(4, soFromCurrent);
    end;
  end;
end;

procedure TPascalTypeFontDescriptionTable.SaveToStream(Stream: TStream);
var
  Value32   : Cardinal;
  DescIndex : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // write description count
   Value32 := Swap32(FDescritors.Count);
   Write(Value32, SizeOf(Cardinal));

   for DescIndex := 0 to FDescritors.Count - 1 do
    with TCustomPascalTypeTaggedValueTable(FDescritors[DescIndex]) do
     begin
      // write tag
      Value32 := Cardinal(TableType);
      Read(Value32, SizeOf(Cardinal));

      // write descriptor to stream
      SaveToStream(Stream);
     end; 
  end;
end;


{ TPascalTypeFeatureTable }

procedure TPascalTypeFeatureTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeFeatureTable(Dest) do
   begin

   end;
end;

class function TPascalTypeFeatureTable.GetTableType: TTableType;
begin
 Result := 'feat';
end;

procedure TPascalTypeFeatureTable.ResetToDefaults;
begin
 inherited;

end;

procedure TPascalTypeFeatureTable.LoadFromStream(Stream: TStream);
var
  Value32   : Cardinal;
  Value16   : Cardinal;
begin
 inherited;

 with Stream do
  begin
   // check if table is complete
   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read feature name count
   Read(Value16, SizeOf(Cardinal));
   Swap32(Value16);

   {$IFDEF AmbigiousExceptions}
   Read(Value16, SizeOf(Cardinal));
   if Value16 <> 0
    then raise EPascalTypeError.CreateFmt(RCStrReservedValueError, [Swap16(Value16)]);

   Read(Value32, SizeOf(Cardinal));
   if Value16 <> 0
    then raise EPascalTypeError.CreateFmt(RCStrReservedValueError, [Swap32(Value32)]);
   {$ELSE}
   Seek(6, soFromCurrent);
   {$ENDIF}
  end;
end;

procedure TPascalTypeFeatureTable.SaveToStream(Stream: TStream);
begin
 inherited;

end;


{ TPascalTypeFontVariationTable }

procedure TPascalTypeFontVariationTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeFontVariationTable(Dest) do
   begin

   end;
end;

class function TPascalTypeFontVariationTable.GetTableType: TTableType;
begin
 Result := 'fvar';
end;

procedure TPascalTypeFontVariationTable.ResetToDefaults;
begin
 inherited;

end;

procedure TPascalTypeFontVariationTable.LoadFromStream(Stream: TStream);
(*
var
  OffsetToData   : Word; // Offset in bytes from the beginning of the table to the beginning of the first axis data.
  CountSizePairs : Word; // Axis + instance = 2.
  AxisCount      : Word; // The number of style axes in this font.
  AxisSize       : Word; // The number of bytes in each gxFontVariationAxis record. Set to 20 bytes.
  InstanceCount  : Word; // The number of named instances for the font found in the sfntInstance array.
  InstanceSize   : Word; // The number of bytes in each gxFontInstance array. InstanceSize = axisCount * sizeof(gxShortFrac).
  Axis           : array of sfntVariationAxis; // The font variation axis array.
  Instance       : array of sfntInstance; // The instance array.
 *)
begin
 inherited;

end;

procedure TPascalTypeFontVariationTable.SaveToStream(Stream: TStream);
begin
 inherited;

end;


{ TPascalTypeGlyphPropertiesTable }

procedure TPascalTypeGlyphPropertiesTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeGlyphPropertiesTable(Dest) do
   begin
    FFormat  := Self.FFormat;
    FDefault := Self.FDefault;
   end;
end;

class function TPascalTypeGlyphPropertiesTable.GetTableType: TTableType;
begin
 Result := 'prop';
end;

procedure TPascalTypeGlyphPropertiesTable.ResetToDefaults;
begin
 inherited;
 FFormat  := 0;
 FDefault := 0;
end;

procedure TPascalTypeGlyphPropertiesTable.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // check if table is complete
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read format
   Read(Value16, SizeOf(Word));
   FFormat := Swap16(Value16);

   // read default
   Read(Value16, SizeOf(Word));
   FDefault := Swap16(Value16);
  end;
end;

procedure TPascalTypeGlyphPropertiesTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // write format
   Value16 := Swap16(FFormat);
   Write(Value16, SizeOf(Word));

   // write default
   Value16 := Swap16(FDefault);
   Write(Value16, SizeOf(Word));
  end;
end;


{ TPascalTypeHorizontalStyleTable }

procedure TPascalTypeHorizontalStyleTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeHorizontalStyleTable(Dest) do
   begin
    FExtraPlain     := Self.FExtraPlain;
    FExtraBold      := Self.FExtraBold;
    FExtraItalic    := Self.FExtraItalic;
    FExtraUnderline := Self.FExtraUnderline;
    FExtraOutline   := Self.FExtraOutline;
    FExtraShadow    := Self.FExtraShadow;
    FExtraCondensed := Self.FExtraCondensed;
    FExtraExtended  := Self.FExtraExtended;
   end;
end;

class function TPascalTypeHorizontalStyleTable.GetTableType: TTableType;
begin
 Result := 'hsty';
end;

procedure TPascalTypeHorizontalStyleTable.ResetToDefaults;
begin
 inherited;
 FExtraPlain     := 0;
 FExtraBold      := 0;
 FExtraItalic    := 0;
 FExtraUnderline := 0;
 FExtraOutline   := 0;
 FExtraShadow    := 0;
 FExtraCondensed := 0;
 FExtraExtended  := 0;
end;

procedure TPascalTypeHorizontalStyleTable.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   // check if table is complete
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read extra plain
   Read(Value16, SizeOf(Word));
   FExtraPlain := Swap16(Value16);

   // read extra bold
   Read(Value16, SizeOf(Word));
   FExtraBold := Swap16(Value16);

   // read extra italic
   Read(Value16, SizeOf(Word));
   FExtraItalic := Swap16(Value16);

   // read extra underline
   Read(Value16, SizeOf(Word));
   FExtraUnderline := Swap16(Value16);

   // read extra outline
   Read(Value16, SizeOf(Word));
   FExtraOutline := Swap16(Value16);

   // read extra shadow
   Read(Value16, SizeOf(Word));
   FExtraShadow := Swap16(Value16);

   // read extra condensed
   Read(Value16, SizeOf(Word));
   FExtraCondensed := Swap16(Value16);

   // read extra extended
   Read(Value16, SizeOf(Word));
   FExtraExtended := Swap16(Value16);
  end;
end;

procedure TPascalTypeHorizontalStyleTable.SaveToStream(Stream: TStream);
begin
 inherited;

end;


{ TPascalTypeGlyphMetamorphosisTable }

procedure TPascalTypeGlyphMetamorphosisTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeGlyphMetamorphosisTable(Dest) do
   begin

   end;
end;

class function TPascalTypeGlyphMetamorphosisTable.GetTableType: TTableType;
begin
 Result := 'mort';
end;

procedure TPascalTypeGlyphMetamorphosisTable.ResetToDefaults;
begin
 inherited;
 FVersion.Value := 1;
 FVersion.Fract := 0;
end;

procedure TPascalTypeGlyphMetamorphosisTable.LoadFromStream(Stream: TStream);
var
  Value32  : Cardinal;
  NumChain : Cardinal;
begin
 inherited;

 with Stream do
  begin
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read number of chains
   Read(Value32, SizeOf(Cardinal));
   NumChain := Swap32(Value32);

   {$IFDEF AmbigiousExceptions}
   if NumChain <= 0
    then raise EPascalTypeError.Create(RCStrTooFewMetamorphosisChains);
   {$ENDIF}
  end;
end;

procedure TPascalTypeGlyphMetamorphosisTable.SaveToStream(Stream: TStream);
begin
 inherited;
end;


{ TPascalTypeExtendedGlyphMetamorphosisTable }

procedure TPascalTypeExtendedGlyphMetamorphosisTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeExtendedGlyphMetamorphosisTable(Dest) do
   begin

   end;
end;

class function TPascalTypeExtendedGlyphMetamorphosisTable.GetTableType: TTableType;
begin
 Result := 'morx';
end;

procedure TPascalTypeExtendedGlyphMetamorphosisTable.ResetToDefaults;
begin
 inherited;
end;

procedure TPascalTypeExtendedGlyphMetamorphosisTable.LoadFromStream(Stream: TStream);
var
  Value32  : Cardinal;
  NumChain : Cardinal;
begin
 inherited;

 with Stream do
  begin
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read number of chains
   Read(Value32, SizeOf(Cardinal));
   NumChain := Swap32(Value32);

   {$IFDEF AmbigiousExceptions}
   if NumChain <= 0
    then raise EPascalTypeError.Create(RCStrTooFewMetamorphosisChains);
   {$ENDIF}
  end;
end;

procedure TPascalTypeExtendedGlyphMetamorphosisTable.SaveToStream(Stream: TStream);
begin
 inherited;
end;


{ TPascalTypeOpticalBoundsTable }

procedure TPascalTypeOpticalBoundsTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeOpticalBoundsTable(Dest) do
   begin

   end;
end;

class function TPascalTypeOpticalBoundsTable.GetTableType: TTableType;
begin
 Result := 'opbd';
end;

procedure TPascalTypeOpticalBoundsTable.ResetToDefaults;
begin
 inherited;
end;

procedure TPascalTypeOpticalBoundsTable.LoadFromStream(Stream: TStream);
var
  Value16 : Word;
begin
 inherited;

 with Stream do
  begin
   if Position + 4 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read format
   Read(Value16, SizeOf(Word));
   FFormat := Swap16(Value16);

   if not (FFormat in [0..1])
    then raise EPascalTypeError.Create(RCStrWrongFormat);
  end;
end;

procedure TPascalTypeOpticalBoundsTable.SaveToStream(Stream: TStream);
begin
 inherited;
end;


{ TPascalTypeTrackingTable }

procedure TPascalTypeTrackingTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeTrackingTable(Dest) do
   begin
    FFormat := Self.FFormat;
   end;
end;

class function TPascalTypeTrackingTable.GetTableType: TTableType;
begin
 Result := 'trak';
end;

procedure TPascalTypeTrackingTable.ResetToDefaults;
begin
 inherited;
 FFormat := 0;
end;

procedure TPascalTypeTrackingTable.LoadFromStream(Stream: TStream);
var
  HorizOffset : Word; // Offset from start of tracking table to TrackData for horizontal text (or 0 if none).
  VertOffset  : Word; // Offset from start of tracking table to TrackData for vertical text (or 0 if none).
begin
 inherited;

end;

procedure TPascalTypeTrackingTable.SaveToStream(Stream: TStream);
begin
 inherited;

end;


{ TPascalTypeZapfTable }

procedure TPascalTypeZapfTable.AssignTo(Dest: TPersistent);
begin
 inherited;

 if Dest is Self.ClassType then
  with TPascalTypeZapfTable(Dest) do
   begin

   end;
end;

class function TPascalTypeZapfTable.GetTableType: TTableType;
begin
 Result := 'Zapf';
end;

procedure TPascalTypeZapfTable.ResetToDefaults;
begin
 inherited;

end;

procedure TPascalTypeZapfTable.LoadFromStream(Stream: TStream);
begin
 inherited;

end;

procedure TPascalTypeZapfTable.SaveToStream(Stream: TStream);
begin
 inherited;

end;


////////////////////////////////////////////////////////////////////////////////

function IsTagRegistered(TableClass: TPascalTypeTaggedValueTableClass): Boolean;
var
  TableClassIndex : Integer;
begin
 Result := False;
 for TableClassIndex := 0 to Length(GDescriptionTagClasses) - 1 do
  if GDescriptionTagClasses[TableClassIndex] = TableClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterDescriptionTag(TableClass: TPascalTypeTaggedValueTableClass);
begin
 Assert(IsTagRegistered(TableClass) = False);
 SetLength(GDescriptionTagClasses, Length(GDescriptionTagClasses) + 1);
 GDescriptionTagClasses[Length(GDescriptionTagClasses) - 1] := TableClass;
end;

procedure RegisterDescriptionTags(TableClasses: array of TPascalTypeTaggedValueTableClass);
var
  TableClassIndex : Integer;
begin
 for TableClassIndex := 0 to Length(TableClasses) - 1
  do RegisterDescriptionTag(TableClasses[TableClassIndex]);
end;

function FindDescriptionTagByType(TableType: TTableType): TPascalTypeTaggedValueTableClass;
var
  TableClassIndex : Integer;
begin
 Result := nil;
 for TableClassIndex := 0 to Length(GDescriptionTagClasses) - 1 do
  if GDescriptionTagClasses[TableClassIndex].GetTableType = TableType then
   begin
    Result := GDescriptionTagClasses[TableClassIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown Table Class: ' + TableType);
end;


initialization
  RegisterDescriptionTags([TPascalTypeWeightValueTable,
    TPascalTypeWidthValueTable, TPascalTypeSlantValueTable,
    TPascalTypeOpticalSizeValueTable, TPascalTypeNonAlphabeticValueTable]);

  RegisterPascalTypeTables([TPascalTypeAccentAttachmentTable,
    TPascalTypeAxisVariationTable, TPascalTypeBaselineTable,
    TPascalTypeBitmapDataTable, TPascalTypeBitmapHeaderTable,
    TPascalTypeBitmapLocationTable, TPascalTypeFontDescriptionTable,
    TPascalTypeFeatureTable, TPascalTypeFontVariationTable,
    TPascalTypeHorizontalStyleTable, TPascalTypeGlyphMetamorphosisTable,
    TPascalTypeExtendedGlyphMetamorphosisTable,
    TPascalTypeOpticalBoundsTable, TPascalTypeGlyphPropertiesTable,
    TPascalTypeTrackingTable, TPascalTypeZapfTable]);

end.

