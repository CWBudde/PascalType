unit PT_TablesTrueType;

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
  // table 'cvt '

  TTrueTypeFontControlValueTable = class(TCustomPascalTypeNamedTable)
  private
    FControlValues : array of SmallInt;
    function GetControlValue(Index: Integer): SmallInt;
    function GetControlValueCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property ControlValue[Index: Integer]: SmallInt read GetControlValue;
    property ControlValueCount: Integer read GetControlValueCount;
  end;


  // TCustomTrueTypeFontInstructionTable

  TCustomTrueTypeFontInstructionTable = class(TCustomPascalTypeNamedTable)
  private
    FInstructions : array of Byte;
    function GetInstruction(Index: Integer): Byte;
    function GetInstructionCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Instruction[Index: Integer]: Byte read GetInstruction;
    property InstructionCount: Integer read GetInstructionCount;
  end;


  // table 'fpgm'

  TTrueTypeFontFontProgramTable = class(TCustomTrueTypeFontInstructionTable)
  public
    class function GetTableType: TTableType; override;
  end;


  // table 'glyf'

  // TCustomTrueTypeFontInstructionTable

  TTrueTypeFontGlyphInstructionTable = class(TCustomPascalTypeInterfaceTable)
  private
    FInstructions : array of Byte;
    function GetInstruction(Index: Integer): Byte;
    function GetInstructionCount: Integer;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Instruction[Index: Integer]: Byte read GetInstruction;
    property InstructionCount: Integer read GetInstructionCount;
  end;


  TCustomTrueTypeFontGlyphData = class(TCustomPascalTypeInterfaceTable)
  private
    procedure SetNumberOfContours(const Value: SmallInt);
    procedure SetXMax(const Value: SmallInt);
    procedure SetXMin(const Value: SmallInt);
    procedure SetYMax(const Value: SmallInt);
    procedure SetYMin(const Value: SmallInt);
    procedure SetGlyphIndex(const Value: Integer);
  protected
    FNumberOfContours : SmallInt; // If the number of contours is greater than or equal to zero, this is a single glyph; if negative, this is a composite glyph.
    FXMin             : SmallInt; // Minimum x for coordinate data.
    FYMin             : SmallInt; // Minimum y for coordinate data.
    FXMax             : SmallInt; // Maximum x for coordinate data.
    FYMax             : SmallInt; // Maximum y for coordinate data.
    FInstructions     : TTrueTypeFontGlyphInstructionTable;
    FGlyphIndex       : Integer;

    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

    procedure GlyphIndexChanged; virtual;
    procedure NumberOfContoursChanged; virtual;
    procedure XMaxChanged; virtual;
    procedure XMinChanged; virtual;
    procedure YMaxChanged; virtual;
    procedure YMinChanged; virtual;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter; GlyphIndex: Integer = -1); reintroduce; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property NumberOfContours: SmallInt read FNumberOfContours write SetNumberOfContours;
    property XMin: SmallInt read FXMin write SetXMin;
    property YMin: SmallInt read FYMin write SetYMin;
    property XMax: SmallInt read FXMax write SetXMax;
    property YMax: SmallInt read FYMax write SetYMax;

    property GlyphIndex: Integer read FGlyphIndex write SetGlyphIndex;

    property Instructions: TTrueTypeFontGlyphInstructionTable read FInstructions;
  end;

  TContourPointRecord = record
    XPos  : Integer;
    YPos  : Integer;
    Flags : Byte;
  end;

  TPascalTypeContour = class(TPersistent)
  private
    FPoints : array of TContourPointRecord;
    function GetPoint(Index: Integer): TContourPointRecord;
    function GetPointCount: Integer;
    procedure SetPoint(Index: Integer; const Value: TContourPointRecord);
    procedure SetPointCount(const Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure PointCountChanged; virtual;
  public
    property Point[Index : Integer]: TContourPointRecord read GetPoint write SetPoint;
    property PointCount: Integer read GetPointCount write SetPointCount;
  end;

  TTrueTypeFontSimpleGlyphData = class(TCustomTrueTypeFontGlyphData)
  private
    FContours : TObjectList;
    function GetContour(Index: Integer): TPascalTypeContour;
    function GetContourCount: Integer;
  protected
    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter; GlyphIndex: Integer = -1); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Contour[Index : Integer]: TPascalTypeContour read GetContour;
    property ContourCount: Integer read GetContourCount; 
  end;

  TPascalTypeCompositeGlyph = class(TCustomPascalTypeTable)
  private
    FFlags      : Word; // Component flag
    FGlyphIndex : Word; // Glyph index of component
    FArgument   : array [0..1] of Integer;
    {$IFDEF UseFloatingPoint}
    FScale      : array of Single;
    {$ELSE}
    {$ENDIF}
    procedure SetFlags(const Value: Word);
    procedure SetGlyphIndex(const Value: Word);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;

    procedure FlagsChanged; virtual;
    procedure GlyphIndexChanged; virtual;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Flags: Word read FFlags write SetFlags;
    property GlyphIndex: Word read FGlyphIndex write SetGlyphIndex;
    property ArgumentX: Integer read FArgument[0];
    property ArgumentY: Integer read FArgument[1];
  end;

  TTrueTypeFontCompositeGlyphData = class(TCustomTrueTypeFontGlyphData)
  private
    FGlyphs : TObjectList;
    function GetGlyphCount: Integer;
    function GetCompositeGlyph(Index: Integer): TPascalTypeCompositeGlyph;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;

  public
    constructor Create(Interpreter: IPascalTypeInterpreter; GlyphIndex: Integer = -1); override;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphCount: Integer read GetGlyphCount;
    property Glyph[Index: Integer]: TPascalTypeCompositeGlyph read GetCompositeGlyph;
  end;

  TTrueTypeFontGlyphDataTable = class(TCustomPascalTypeNamedTable)
  private
    FGlyphDataList : TObjectList;
    function GetGlyphDataCount: Integer;
    function GetGlyphData(Index: Integer): TCustomTrueTypeFontGlyphData; // List of TCustomTrueTypeFontGlyphData
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    constructor Create(Interpreter: IPascalTypeInterpreter); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property GlyphDataCount: Integer read GetGlyphDataCount;
    property GlyphData[Index: Integer]: TCustomTrueTypeFontGlyphData read GetGlyphData;
  end;


  // table 'loca'

  TTrueTypeFontLocationTable = class(TCustomPascalTypeNamedTable)
  private
    FLocations : array of Cardinal;
    function GetLocation(Index: Integer): Cardinal;
    function GetLocationCount: Cardinal;
  protected
    procedure AssignTo(Dest: TPersistent); override;

    procedure ResetToDefaults; override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property Location[Index: Integer]: Cardinal read GetLocation; default;
    property LocationCount: Cardinal read GetLocationCount;
  end;


  // table 'prep'

  TTrueTypeFontControlValueProgramTable = class(TCustomTrueTypeFontInstructionTable)
  public
    class function GetTableType: TTableType; override;
  end;

implementation

uses
  PT_ResourceStrings;


{ TTrueTypeFontControlValueTable }

constructor TTrueTypeFontControlValueTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TTrueTypeFontControlValueTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TTrueTypeFontControlValueTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontControlValueTable then
  with TTrueTypeFontControlValueTable(Dest) do
   begin
    FControlValues := Self.FControlValues;
   end
 else inherited;
end;

class function TTrueTypeFontControlValueTable.GetTableType: TTableType;
begin
 Result := 'cvt ';
end;

procedure TTrueTypeFontControlValueTable.ResetToDefaults;
begin
 SetLength(FControlValues, 0);
end;

function TTrueTypeFontControlValueTable.GetControlValue(
  Index: Integer): SmallInt;
begin
 if (Index < Length(FControlValues))
  then Result := Swap16(FControlValues[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontControlValueTable.GetControlValueCount: Integer;
begin
 Result := Length(FControlValues);
end;

procedure TTrueTypeFontControlValueTable.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   SetLength(FControlValues, Size div 2);

   // check for minimal table size
   if Position + Length(FControlValues) * SizeOf(Word) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read control values
   Read(FControlValues[0], Length(FControlValues) * SizeOf(Word));
  end;
end;

procedure TTrueTypeFontControlValueTable.SaveToStream(Stream: TStream);
begin
 // write control values
 Stream.Write(FControlValues[0], Length(FControlValues) * SizeOf(Word));
end;



{ TCustomTrueTypeFontInstructionTable }

constructor TCustomTrueTypeFontInstructionTable.Create;
begin
 // nothing in here yet
 inherited;
end;

destructor TCustomTrueTypeFontInstructionTable.Destroy;
begin
 // nothing in here yet
 inherited;
end;

procedure TCustomTrueTypeFontInstructionTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TCustomTrueTypeFontInstructionTable then
  with TCustomTrueTypeFontInstructionTable(Dest) do
   begin
    FInstructions := Self.FInstructions;
   end
 else inherited;
end;

procedure TCustomTrueTypeFontInstructionTable.ResetToDefaults;
begin
 SetLength(FInstructions, 0);
end;

function TCustomTrueTypeFontInstructionTable.GetInstruction(Index: Integer): Byte;
begin
 if (Index < Length(FInstructions))
  then Result := FInstructions[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TCustomTrueTypeFontInstructionTable.GetInstructionCount: Integer;
begin
 Result := Length(FInstructions);
end;

procedure TCustomTrueTypeFontInstructionTable.LoadFromStream(Stream: TStream);
begin
 with Stream do
  begin
   SetLength(FInstructions, Size);

   // check for minimal table size
   if Position + Length(FInstructions) > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read control values
   Read(FInstructions[0], Length(FInstructions) * SizeOf(Word));
  end;
end;

procedure TCustomTrueTypeFontInstructionTable.SaveToStream(Stream: TStream);
begin
 // write instructions
 Stream.Write(FInstructions[0], Length(FInstructions));
end;


{ TTrueTypeFontFontProgramTable }

class function TTrueTypeFontFontProgramTable.GetTableType: TTableType;
begin
 Result := 'fpgm';
end;


{ TTrueTypeFontGlyphInstructionTable }

procedure TTrueTypeFontGlyphInstructionTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TTrueTypeFontGlyphInstructionTable(Dest) do
   begin
    FInstructions := Self.FInstructions;
   end
 else inherited;
end;

function TTrueTypeFontGlyphInstructionTable.GetInstruction(Index: Integer): Byte;
begin
 if (Index < Length(FInstructions))
  then Result := FInstructions[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontGlyphInstructionTable.GetInstructionCount: Integer;
begin
 Result := Length(FInstructions);
end;

procedure TTrueTypeFontGlyphInstructionTable.ResetToDefaults;
begin
 SetLength(FInstructions, 0);
end;

procedure TTrueTypeFontGlyphInstructionTable.LoadFromStream(Stream: TStream);
var
  Value16    : Word;
  MaxProfile : TPascalTypeMaximumProfileTable;
begin
 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));
 Assert(Assigned(MaxProfile));

 with Stream do
  begin
   // read instruction size
   Value16 := ReadSwappedWord(Stream);

   // check if instructions shall be ignored
   if Value16 = $FFFF
    then Exit;

   // check if too many instuctions are present -> possible stream error
   if Value16 > MaxProfile.MaxSizeOfInstruction
    then raise EPascalTypeError.CreateFmt(RCStrTooManyInstructions, [Value16]);

   // set instruction length
   SetLength(FInstructions, Value16);

   // read instructions
   Read(FInstructions[0], Length(FInstructions));
  end;
end;

procedure TTrueTypeFontGlyphInstructionTable.SaveToStream(Stream: TStream);
var
  Value16 : Word;
begin
 with Stream do
  begin
   // write instruction size
   Value16 := Swap16(Length(FInstructions));
   Write(Value16, SizeOf(Word));

   // write instructions
   Write(FInstructions[0], Length(FInstructions));
  end;
end;


{ TCustomTrueTypeFontGlyphData }

constructor TCustomTrueTypeFontGlyphData.Create(Interpreter: IPascalTypeInterpreter; GlyphIndex: Integer = -1);
begin
 FGlyphIndex := GlyphIndex;
 FInstructions := TTrueTypeFontGlyphInstructionTable.Create(Interpreter);
 inherited Create(Interpreter);
end;

destructor TCustomTrueTypeFontGlyphData.Destroy;
begin
 FreeAndNil(FInstructions);
 inherited;
end;

procedure TCustomTrueTypeFontGlyphData.GlyphIndexChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.AssignTo(Dest: TPersistent);
begin
 if Dest is TCustomTrueTypeFontGlyphData then
  with TCustomTrueTypeFontGlyphData(Dest) do
   begin
    FNumberOfContours := Self.FNumberOfContours;
    FXMin             := Self.FXMin;
    FYMin             := Self.FYMin;
    FXMax             := Self.FXMax;
    FYMax             := Self.FYMax;
    FGlyphIndex       := Self.FGlyphIndex;
   end
 else inherited;
end;

procedure TCustomTrueTypeFontGlyphData.ResetToDefaults;
begin
 FNumberOfContours := 0;
 FXMin := 0;
 FYMin := 0;
 FXMax := 0;
 FYMax := 0;
 FGlyphIndex := -1;
end;

procedure TCustomTrueTypeFontGlyphData.LoadFromStream(Stream: TStream);
var
  MaxProfile : TPascalTypeMaximumProfileTable;
begin
 // get maximum profile
 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableClass(TPascalTypeMaximumProfileTable));

 with Stream do
  begin
   if Position + 2 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read number of contours
   FNumberOfContours := ReadSwappedSmallInt(Stream);

   // check if maximum number of contours are exceeded
   if (FNumberOfContours > 0) and (Word(FNumberOfContours) > MaxProfile.MaxContours)
    then raise EPascalTypeError.CreateFmt(RCStrTooManyContours, [FNumberOfContours, MaxProfile.MaxContours]);

   // check if glyph contains any information at all
   if FNumberOfContours = 0
    then Exit;

   if Position + 8 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   // read XMin
   FXMin := ReadSwappedSmallInt(Stream);

   // read YMin
   FYMin := ReadSwappedSmallInt(Stream);

   // read XMax
   FXMax := ReadSwappedSmallInt(Stream);

   // read YMax
   FYMax := ReadSwappedSmallInt(Stream);

//   Assert(FXMin <= FXMax);
//   Assert(FYMin <= FYMax);
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SaveToStream(Stream: TStream);
var
  Value16 : SmallInt;
begin
 with Stream do
  begin
   // write number of contours
   Value16 := Swap16(FNumberOfContours);
   Write(Value16, SizeOf(SmallInt));

   // write XMin
   Value16 := Swap16(FXMin);
   Write(Value16, SizeOf(SmallInt));

   // write YMin
   Value16 := Swap16(FYMin);
   Write(Value16, SizeOf(SmallInt));

   // write XMax
   Value16 := Swap16(FXMax);
   Write(Value16, SizeOf(SmallInt));

   // write YMax
   Value16 := Swap16(FYMax);
   Write(Value16, SizeOf(SmallInt));
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetGlyphIndex(const Value: Integer);
begin
 if FGlyphIndex <> Value then
  begin
   FGlyphIndex := Value;
   GlyphIndexChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetNumberOfContours(
  const Value: SmallInt);
begin
 if FNumberOfContours <> Value then
  begin
   FNumberOfContours := Value;
   NumberOfContoursChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetXMax(const Value: SmallInt);
begin
 if FXMax <> Value then
  begin
   FXMax := Value;
   XMaxChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetXMin(const Value: SmallInt);
begin
 if FXMin <> Value then
  begin
   FXMin := Value;
   XMinChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetYMax(const Value: SmallInt);
begin
 if FYMax <> Value then
  begin
   FYMax := Value;
   YMaxChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.SetYMin(const Value: SmallInt);
begin
 if FYMin <> Value then
  begin
   FYMin := Value;
   YMinChanged;
  end;
end;

procedure TCustomTrueTypeFontGlyphData.NumberOfContoursChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.XMaxChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.XMinChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.YMaxChanged;
begin
 Changed;
end;

procedure TCustomTrueTypeFontGlyphData.YMinChanged;
begin
 Changed;
end;


{ TPascalTypeContour }

procedure TPascalTypeContour.AssignTo(Dest: TPersistent);
begin
 if Dest is TPascalTypeContour then
  with TPascalTypeContour(Dest) do
   begin

   end
  else inherited;
end;

function TPascalTypeContour.GetPoint(Index: Integer): TContourPointRecord;
begin
 if (Index >= 0) and (Index < Length(FPoints))
  then Result := FPoints[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

procedure TPascalTypeContour.SetPoint(Index: Integer;
  const Value: TContourPointRecord);
begin
 if (Index >= 0) and (Index < Length(FPoints))
  then FPoints[Index] := Value
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeContour.GetPointCount: Integer;
begin
 Result := Length(FPoints)
end;

procedure TPascalTypeContour.SetPointCount(const Value: Integer);
begin
 if Value <> Length(FPoints) then
  begin
   SetLength(FPoints, Value);
   PointCountChanged;
  end;
end;

procedure TPascalTypeContour.PointCountChanged;
begin
 // yet todo
end;


{ TTrueTypeFontSimpleGlyphData }

constructor TTrueTypeFontSimpleGlyphData.Create(
  Interpreter: IPascalTypeInterpreter; GlyphIndex: Integer);
begin
 FContours := TObjectList.Create;
 inherited Create(Interpreter, GlyphIndex);
end;

destructor TTrueTypeFontSimpleGlyphData.Destroy;
begin
 FreeAndNil(FContours);
 inherited;
end;

procedure TTrueTypeFontSimpleGlyphData.ResetToDefaults;
begin
 FInstructions.ResetToDefaults;
(*
 SetLength(FEndPtsOfContours, 0);
 SetLength(FFlags, 0);
*)
end;

function TTrueTypeFontSimpleGlyphData.GetContour(
  Index: Integer): TPascalTypeContour;
begin
 if (Index >= 0) and (Index < FContours.Count)
  then Result := TPascalTypeContour(FContours[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontSimpleGlyphData.GetContourCount: Integer;
begin
 Result := FContours.Count;
end;

procedure TTrueTypeFontSimpleGlyphData.LoadFromStream(Stream: TStream);
var
  ContourIndex : Integer;
  PointIndex   : Integer;
  CntrPntIndex : Integer;
  PointCount   : Integer;
  LastPoint    : Integer;
  Contour      : TPascalTypeContour;
  MaxProfile   : TPascalTypeMaximumProfileTable;
  EndPtsOfCont : array of SmallInt;
  Flag         : Byte;
  FlagCount    : Byte;
  Value8       : Byte absolute FlagCount;
begin
 inherited;

 // get maximum profile
 MaxProfile := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableClass(TPascalTypeMaximumProfileTable));

 // check if glyph contains any information at all
 if FNumberOfContours = 0
  then Exit;

 with Stream do
  begin
   // set end points of contours array size
   SetLength(EndPtsOfCont, FNumberOfContours);

   // reset point count
   PointCount := -1;

   // read end points
   for ContourIndex := 0 to FNumberOfContours - 1 do
    begin
     // read number of contours
     PointCount := ReadSwappedWord(Stream);
     EndPtsOfCont[ContourIndex] := PointCount;
    end;

   // increase last end point to get the true point count 
   Inc(PointCount);

   // check if maximum points are exceeded
   if PointCount > MaxProfile.MaxPoints
    then raise EPascalTypeError.CreateFmt(RCStrTooManyPoints, [PointCount]);

   // read instructions
   FInstructions.LoadFromStream(Stream);

   // clear existing contours
   FContours.Clear;

   for ContourIndex := 0 to FNumberOfContours - 1 do
    begin
     // create new contour
     Contour := TPascalTypeContour.Create;

     // set contour point count
     if ContourIndex = 0
      then Contour.PointCount := EndPtsOfCont[ContourIndex] + 1
      else Contour.PointCount := (EndPtsOfCont[ContourIndex] - EndPtsOfCont[ContourIndex - 1]);

     // add contour to contour list
     FContours.Add(Contour);
    end;

   // reset point and contour index
   PointIndex := 0;
   ContourIndex := 0;
   CntrPntIndex := 0;

   // set first contour
   Contour := TPascalTypeContour(FContours[ContourIndex]);

   while PointIndex < PointCount do
    begin
     // eventually increase contour index
     if PointIndex > EndPtsOfCont[ContourIndex] then
      begin
       Inc(ContourIndex);
       CntrPntIndex := 0;

       // set next contour
       Contour := TPascalTypeContour(FContours[ContourIndex]);
      end;

     // read flag value
     Read(Flag, 1);

     {$IFDEF AmbigiousExceptions}
     if (Flag and (1 shl 6)) <> 0
      then raise EPascalTypeError.CreateFmt(RCStrGlyphDataFlagReservedError, [PointIndex, PointCount]);

     if (Flag and (1 shl 7)) <> 0
      then raise EPascalTypeError.CreateFmt(RCStrGlyphDataFlagReservedError, [PointIndex, PointCount]);
     {$ENDIF}

     // set flags
     Contour.FPoints[CntrPntIndex].Flags := Flag;

     // increase point index
     Inc(PointIndex);
     Inc(CntrPntIndex);

     // check for 'repeat' flag
     if (Flag and (1 shl 3)) <> 0 then
      begin
       // read repeat count
       Read(FlagCount, 1);

       if (PointIndex + FlagCount > PointCount)
        then raise EPascalTypeError.CreateFmt(RCStrGlyphDataFlagRepeatError, [PointIndex + FlagCount, PointCount]);

       while FlagCount > 0 do
        begin
         // eventually increase contour index
         if PointIndex > EndPtsOfCont[ContourIndex] then
          begin
           Inc(ContourIndex);
           CntrPntIndex := 0;

           // set next contour
           Contour := TPascalTypeContour(FContours[ContourIndex]);
          end;

         // set flags
         Contour.FPoints[CntrPntIndex].Flags := Flag;

         Inc(PointIndex);
         Inc(CntrPntIndex);
         Dec(FlagCount);
        end
      end
    end;

   // reset contour and point index
   ContourIndex := 0;
   CntrPntIndex := 0;

   // set first contour
   Contour := TPascalTypeContour(FContours[ContourIndex]);

   // reset last point
   LastPoint := 0;

   // read x-coordinates
   for PointIndex := 0 to PointCount - 1 do
    begin
     // eventually increase contour
     if PointIndex > EndPtsOfCont[ContourIndex] then
      begin
       Inc(ContourIndex);
       CntrPntIndex := 0;

       // set next contour
       Contour := TPascalTypeContour(FContours[ContourIndex])
      end;

     // check for short or long version
     with Contour, FPoints[CntrPntIndex] do
      begin
       if (Flags and (1 shl 1)) > 0 then
        begin
         Read(Value8, 1);

         // eventually change sign
         if (Flags and (1 shl 4)) > 0
          then XPos := LastPoint + Value8
          else XPos := LastPoint - Value8;
        end
       else
        begin
         // eventually use last point
         if (Flags and (1 shl 4)) > 0
          then XPos := LastPoint
          else XPos := LastPoint + ReadSwappedSmallInt(Stream);
        end;
       LastPoint := XPos;

       Inc(CntrPntIndex);
      end;
    end;


   // reset contour and point index
   ContourIndex := 0;
   CntrPntIndex := 0;

   // set first contour
   Contour := TPascalTypeContour(FContours[ContourIndex]);

   // reset last point
   LastPoint := 0;

   // read y-coordinates
   for PointIndex := 0 to PointCount - 1 do
    begin
     // eventually increase contour
     if PointIndex > EndPtsOfCont[ContourIndex] then
      begin
       Inc(ContourIndex);
       CntrPntIndex := 0;

       // set next contour
       Contour := TPascalTypeContour(FContours[ContourIndex])
      end;

     // check for short or long version
     with Contour, FPoints[CntrPntIndex] do
      begin
       if (Flags and (1 shl 2)) > 0 then
        begin
         Read(Value8, 1);

         // eventually change sign
         if (Flags and (1 shl 5)) > 0
          then YPos := LastPoint + Value8
          else YPos := LastPoint - Value8;
        end
       else
        begin
         // eventually use last point
         if (Flags and (1 shl 5)) > 0
          then YPos := LastPoint
          else YPos := LastPoint + ReadSwappedSmallInt(Stream);
        end;
       LastPoint := YPos;

       Inc(CntrPntIndex);
      end;

    end;
  end;
end;

procedure TTrueTypeFontSimpleGlyphData.SaveToStream(Stream: TStream);
begin

end;


{ TPascalTypeCompositeGlyph }

procedure TPascalTypeCompositeGlyph.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontCompositeGlyphData then
  with TTrueTypeFontCompositeGlyphData(Dest) do
   begin
    FFlags := Self.FFlags;
    FGlyphIndex := Self.FGlyphIndex;
    FArgument := Self.FArgument;
   end
 else inherited;
end;

procedure TPascalTypeCompositeGlyph.ResetToDefaults;
begin
 FFlags       := 0;
 FGlyphIndex  := 0;
 FArgument[0] := 0;
 FArgument[1] := 0;
end;

procedure TPascalTypeCompositeGlyph.LoadFromStream(Stream: TStream);
var
  Argument : array [0..1] of SmallInt;
const
  CFixedPoint2Dot14Scale : Single = 1 / 16384;  
begin
 inherited;

 with Stream do
  begin
   // read flags
   FFlags := ReadSwappedWord(Stream);

   {$IFDEF AmbigiousExceptions}
   // make sure the reserved flag is set to 0
   // if (FFlags and (1 shl 4)) <> 0
   //  then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
   {$ENDIF}

   // read glyph index
   FGlyphIndex := ReadSwappedWord(Stream);

   // read argument 1
   if (FFlags and 1) > 0 then
    begin
     Argument[0] := ReadSwappedSmallInt(Stream);
     Argument[1] := ReadSwappedSmallInt(Stream);
    end
   else
    begin
     Read(Argument[0], 1);
     Read(Argument[1], 1);
    end;

   if (FFlags and 8) <> 0 then
    begin
     // one dimensional scale
     SetLength(FScale, 1);

     // read scale
     FScale[0] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     {$IFDEF AmbigiousExceptions}
     // make sure the reserved flag is set to 0
     if (FFlags and (1 shl 6)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     if (FFlags and (1 shl 7)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     {$ENDIF}
    end else
   if (FFlags and (1 shl 6)) <> 0 then
    begin
     // one dimensional scale
     SetLength(FScale, 2);

     // read x-scale
     FScale[0] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     // read y-scale
     FScale[1] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     {$IFDEF AmbigiousExceptions}
     // make sure the reserved flag is set to 0
     if (FFlags and (1 shl 3)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     if (FFlags and (1 shl 7)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     {$ENDIF}
    end else
   if (FFlags and (1 shl 7)) <> 0 then
    begin
     // one dimensional scale
     SetLength(FScale, 4);

     // read x-scale
     FScale[0] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     // read scale01
     FScale[1] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     // read scale10
     FScale[2] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     // read y-scale
     FScale[3] := ReadSwappedSmallInt(Stream) * CFixedPoint2Dot14Scale;

     {$IFDEF AmbigiousExceptions}
     // make sure the reserved flag is set to 0
     if (FFlags and (1 shl 3)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     if (FFlags and (1 shl 6)) <> 0
      then raise EPascalTypeError.Create(RCStrCompositeGlyphFlagError);
     {$ENDIF}
    end;
  end;
end;

procedure TPascalTypeCompositeGlyph.SaveToStream(Stream: TStream);
begin

end;

procedure TPascalTypeCompositeGlyph.SetFlags(const Value: Word);
begin
 if FFlags <> Value then
  begin
   FFlags := Value;
   FlagsChanged;
  end;
end;

procedure TPascalTypeCompositeGlyph.SetGlyphIndex(const Value: Word);
begin
 if FGlyphIndex <> Value then
  begin
   FGlyphIndex := Value;
   GlyphIndexChanged;
  end;
end;

procedure TPascalTypeCompositeGlyph.FlagsChanged;
begin
 Changed;
end;

procedure TPascalTypeCompositeGlyph.GlyphIndexChanged;
begin
 Changed;
end;


{ TTrueTypeFontCompositeGlyphData }

constructor TTrueTypeFontCompositeGlyphData.Create(Interpreter: IPascalTypeInterpreter; GlyphIndex: Integer = -1);
begin
 FGlyphs := TObjectList.Create;
 inherited Create(Interpreter, GlyphIndex);
end;

destructor TTrueTypeFontCompositeGlyphData.Destroy;
begin
 FreeAndNil(FGlyphs);
 inherited;
end;

function TTrueTypeFontCompositeGlyphData.GetCompositeGlyph(
  Index: Integer): TPascalTypeCompositeGlyph;
begin
 if (Index >= 0) and (Index < FGlyphs.Count)
  then Result := TPascalTypeCompositeGlyph(FGlyphs[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontCompositeGlyphData.GetGlyphCount: Integer;
begin
 Result := FGlyphs.Count;
end;

procedure TTrueTypeFontCompositeGlyphData.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontCompositeGlyphData then
  with TTrueTypeFontCompositeGlyphData(Dest) do
   begin
    FGlyphs.Assign(Self.FGlyphs);
    Self.FGlyphs.OwnsObjects := False;
   end
 else inherited;
end;

procedure TTrueTypeFontCompositeGlyphData.ResetToDefaults;
begin
 FGlyphs.Clear;
end;

procedure TTrueTypeFontCompositeGlyphData.LoadFromStream(Stream: TStream);
var
  Glyph           : TPascalTypeCompositeGlyph;
  HasInstructions : Boolean;
begin
 inherited;

 // a default glyph does not contain instructions
 HasInstructions := False;

 // clear existing glyphs
 FGlyphs.Clear;

 with Stream do
  repeat
   Glyph := TPascalTypeCompositeGlyph.Create;

   Glyph.LoadFromStream(Stream);

   // add glyph to the glyph list
   FGlyphs.Add(Glyph);

   // check if glyph has instructions
   if (Glyph.Flags and (1 shl 8)) <> 0
    then HasInstructions := True;

  until (Glyph.Flags and (1 shl 5)) = 0;

 // eventually read instructions
 if HasInstructions
  then FInstructions.LoadFromStream(Stream);
end;

procedure TTrueTypeFontCompositeGlyphData.SaveToStream(Stream: TStream);
var
  GlyphIndex : Integer;
begin
 // save glyphs
 for GlyphIndex := 0 to FGlyphs.Count - 1 do
  with TPascalTypeCompositeGlyph(FGlyphs[GlyphIndex])
   do SaveToStream(Stream);

 // save instructions to stream
 FInstructions.SaveToStream(Stream);
end;


{ TTrueTypeFontGlyphDataTable }

constructor TTrueTypeFontGlyphDataTable.Create;
begin
 FGlyphDataList := TObjectList.Create;
 inherited;
end;

destructor TTrueTypeFontGlyphDataTable.Destroy;
begin
 FreeAndNil(FGlyphDataList);
 inherited;
end;

procedure TTrueTypeFontGlyphDataTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontGlyphDataTable then
  with TTrueTypeFontGlyphDataTable(Dest) do
   begin
    FGlyphDataList.Assign(Self.FGlyphDataList);
    Self.FGlyphDataList.OwnsObjects := False;
   end
 else inherited;
end;

function TTrueTypeFontGlyphDataTable.GetGlyphData(
  Index: Integer): TCustomTrueTypeFontGlyphData;
begin
 if (Index >= 0) and (Index < FGlyphDataList.Count)
  then Result := TCustomTrueTypeFontGlyphData(FGlyphDataList[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontGlyphDataTable.GetGlyphDataCount: Integer;
begin
 Result := FGlyphDataList.Count;
end;

class function TTrueTypeFontGlyphDataTable.GetTableType: TTableType;
begin
 Result := 'glyf';
end;

procedure TTrueTypeFontGlyphDataTable.ResetToDefaults;
begin
 FGlyphDataList.Clear;
end;

procedure TTrueTypeFontGlyphDataTable.LoadFromStream(Stream: TStream);
var
  StartPos  : Int64;
  GlyphData : TCustomTrueTypeFontGlyphData;
  Locations : TTrueTypeFontLocationTable;
  LocIndex  : Integer;
  Value16   : SmallInt;
begin
 // get location table
 Locations := TTrueTypeFontLocationTable(FInterpreter.GetTableByTableType('loca'));
 if not Assigned(Locations)
  then raise EPascalTypeError.Create(RCStrNoIndexToLocationTable);

 with Stream do
  begin
   // store initil position
   StartPos := Position;

   // check (minimum) table size
   if Position + 10 > Size
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   for LocIndex := 0 to Locations.LocationCount - 2 do
    begin
     Position := StartPos + Locations[LocIndex];

     Value16 := ReadSwappedSmallInt(Stream);

     if (Value16 < -1)
      then raise EPascalTypeError.CreateFmt(RCStrUnknownGlyphDataType, [Value16]);

     // set position before number of contours
     Seek(-2, soFromCurrent);

     // read number of contours and create glyph data object
      if Value16 > 0
       then GlyphData := TTrueTypeFontSimpleGlyphData.Create(FInterpreter, LocIndex)
       else GlyphData := TTrueTypeFontCompositeGlyphData.Create(FInterpreter, LocIndex);

     try
      GlyphData.LoadFromStream(Stream);
      FGlyphDataList.Add(GlyphData);
     except
      on e: EPascalTypeError do
       raise EPascalTypeError.CreateFmt('Error loading glyph #%d' + #10 + E.Message, [LocIndex]);
     end;
    end;

   {$IFDEF AmbigiousExceptions}
   with Locations do
    if Locations[LocationCount - 1] > Size
     then raise EPascalTypeError.Create(RCStrTableIncomplete);
   {$ENDIF}
  end;
end;

procedure TTrueTypeFontGlyphDataTable.SaveToStream(Stream: TStream);
var
  GlyphDataIndex : Integer;
begin
 for GlyphDataIndex := 0 to FGlyphDataList.Count - 1 do
  with TCustomTrueTypeFontGlyphData(FGlyphDataList[GlyphDataIndex])
   do SaveToStream(Stream);
end;


{ TTrueTypeFontLocationTable }

procedure TTrueTypeFontLocationTable.ResetToDefaults;
begin
 SetLength(FLocations, 0);
end;

procedure TTrueTypeFontLocationTable.AssignTo(Dest: TPersistent);
begin
 if Dest is TTrueTypeFontLocationTable then
  with TTrueTypeFontLocationTable(Dest) do
   begin
    FLocations := Self.FLocations;
   end
 else inherited;
end;

function TTrueTypeFontLocationTable.GetLocation(Index: Integer): Cardinal;
begin
 if (Index >= 0) and (Index < Length(FLocations))
  then Result := FLocations[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TTrueTypeFontLocationTable.GetLocationCount: Cardinal;
begin
 Result := Length(FLocations);
end;

class function TTrueTypeFontLocationTable.GetTableType: TTableType;
begin
 Result := 'loca';
end;

procedure TTrueTypeFontLocationTable.LoadFromStream(Stream: TStream);
var
  LocationIndex : Integer;
  HeaderTable   : TPascalTypeHeaderTable;
  MaxProfTable  : TPascalTypeMaximumProfileTable;
begin
 with Stream do
  begin
   // get header table
   HeaderTable := TPascalTypeHeaderTable(FInterpreter.GetTableByTableType('head'));
   Assert(Assigned(HeaderTable));

   // get maximum profile table
   MaxProfTable := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));
   Assert(Assigned(MaxProfTable));

   case HeaderTable.IndexToLocationFormat of
    ilShort :
      begin
       // check (minimum) table size
       if (MaxProfTable.NumGlyphs + 1) * SizeOf(Word) > Size
        then raise EPascalTypeError.Create(RCStrTableIncomplete);

       // set location array length
       SetLength(FLocations, MaxProfTable.NumGlyphs);

       // read location array data
       for LocationIndex := 0 to Length(FLocations) - 1
        do FLocations[LocationIndex] := 2 * ReadSwappedWord(Stream);
      end;
    ilLong :
      begin
       // check (minimum) table size
       if (MaxProfTable.NumGlyphs + 1) * SizeOf(Cardinal) > Size
        then raise EPascalTypeError.Create(RCStrTableIncomplete);

       // set location array length
       SetLength(FLocations, MaxProfTable.NumGlyphs + 1);

       // read location array data
       for LocationIndex := 0 to Length(FLocations) - 1
        do FLocations[LocationIndex] := ReadSwappedCardinal(Stream);
      end;
   end;

   {$IFDEF AmbigiousExceptions}
   // verify that the locations are stored in ascending order
   for LocationIndex := 1 to Length(FLocations) - 1 do
    if FLocations[LocationIndex - 1] > FLocations[LocationIndex]
     then raise EPascalTypeError.Create(RCStrLocationOffsetError);
   {$ENDIF}
  end;
end;

procedure TTrueTypeFontLocationTable.SaveToStream(Stream: TStream);
var
  LocationIndex : Integer;
  HeaderTable   : TPascalTypeHeaderTable;
  MaxProfTable  : TPascalTypeMaximumProfileTable;
begin
 with Stream do
  begin
   // get header table
   HeaderTable := TPascalTypeHeaderTable(FInterpreter.GetTableByTableType('head'));
   Assert(Assigned(HeaderTable));

   // get maximum profile table
   MaxProfTable := TPascalTypeMaximumProfileTable(FInterpreter.GetTableByTableType('maxp'));
   Assert(Assigned(MaxProfTable));

   // check whether the number of glyps matches the location array length
   if (MaxProfTable.NumGlyphs + 1) <> Length(FLocations)
    then raise EPascalTypeError.Create(RCStrTableIncomplete);

   case HeaderTable.IndexToLocationFormat of
    ilShort :
      begin
       // write location array data
       for LocationIndex := 0 to Length(FLocations) - 1
        do WriteSwappedWord(Stream, FLocations[LocationIndex] div 2);
      end;
    ilLong :
      begin
       // write location array data
       for LocationIndex := 0 to Length(FLocations) - 1
        do WriteSwappedCardinal(Stream, FLocations[LocationIndex]);
      end;
   end;

  end;
end;


{ TTrueTypeFontControlValueProgramTable }

class function TTrueTypeFontControlValueProgramTable.GetTableType: TTableType;
begin
 Result := 'prep';
end;

initialization
  RegisterPascalTypeTables([TTrueTypeFontControlValueTable,
    TTrueTypeFontFontProgramTable, TTrueTypeFontGlyphDataTable,
    TTrueTypeFontLocationTable, TTrueTypeFontControlValueProgramTable]);

end.
