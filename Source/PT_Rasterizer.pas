unit PT_Rasterizer;

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
  Classes, Contnrs, Sysutils, PT_Types, PT_Interpreter, PT_Tables;

type
  TPointSingle = packed record
    X, Y : Single; 
  end;

  TPascalTypeScaledContour = class(TPersistent)
  protected
    FPrimitives: TList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;


  TCustomPascalTypeScaledGlyph = class(TPersistent)
  protected
    FGlyphIndex      : Integer;
    FAdvanceWidth    : Single;
    FLeftSideBearing : Single;
  public
    constructor Create(GlyphIndex: Integer); virtual;

    property GlyphIndex: Integer read FGlyphIndex;
    property AdvanceWidth: Single read FAdvanceWidth;
    property LeftSideBearing: Single read FLeftSideBearing;
  end;

  TPascalTypeScaledTrueTypeGlyph = class(TCustomPascalTypeScaledGlyph)
  private
    FContours : TObjectList;
    function GetContour(Index: Integer): TPascalTypeScaledContour;
    function GetContourCount: Integer;
  public
    constructor Create(GlyphIndex: Integer); override;
    destructor Destroy; override;

    property Contour[Index : Integer]: TPascalTypeScaledContour read GetContour;
    property ContourCount: Integer read GetContourCount;
  end;

  TCustomPascalTypeRasterizer = class(TInterfacedPersistent, IStreamPersist)
  private
    FInterpreter   : TPascalTypeInterpreter;
    FFontHeight    : Integer;
    FPixelPerInchX : Integer;
    FPixelPerInchY : Integer;
    FScalerX       : Single;
    FScalerY       : Single;
    procedure SetFontSize(const Value: Integer);
    procedure SetPixelPerInchX(const Value: Integer);
    procedure SetPixelPerInchY(const Value: Integer);
    procedure SetFontHeight(const Value: Integer);
    function GetFontSize: Integer;
    procedure CalculateScaler;
  protected
    function GetGlyphByCharacter(Character: Word): Integer; overload;
    function GetGlyphByCharacter(Character: WideChar): Integer; overload;

    procedure CalculateScalerX;
    procedure CalculateScalerY;

    function FixedScaleX(Value: Integer): Integer;
    function FixedScaleY(Value: Integer): Integer;

    function GetAdvanceWidth(GlyphIndex: Integer): Single;

    procedure FontHeightChanged; virtual;
    procedure PixelPerInchXChanged; virtual;
    procedure PixelPerInchYChanged; virtual;

    procedure RenderText(Text: string);
    procedure RenderCharacter(Character: AnsiChar);
    property Interpreter: TPascalTypeInterpreter read FInterpreter;
    property ScalerX: Single read FScalerX;
    property ScalerY: Single read FScalerY;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure LoadFromFile(FileName: TFileName);
    procedure SaveToFile(FileName: TFileName);

    property FontSize: Integer read GetFontSize write SetFontSize stored False;
    property FontHeight: Integer read FFontHeight write SetFontHeight default -11;
    property PixelPerInchX: Integer read FPixelPerInchX write SetPixelPerInchX default 96;
    property PixelPerInchY: Integer read FPixelPerInchY write SetPixelPerInchY default 96;
  end;

  TPascalTypeRasterizer = class(TCustomPascalTypeRasterizer)
  public
    property Interpreter;
  end;

implementation

uses
  PT_ResourceStrings;


{ TPascalTypeScaledContour }

constructor TPascalTypeScaledContour.Create;
begin
 inherited;
 FPrimitives := TObjectList.Create;
end;

destructor TPascalTypeScaledContour.Destroy;
begin
 FreeAndNil(FPrimitives);
 inherited;
end;


{ TCustomPascalTypeScaledGlyph }

constructor TCustomPascalTypeScaledGlyph.Create(GlyphIndex: Integer);
begin
 inherited Create;

end;


{ TPascalTypeScaledTrueTypeGlyph }

constructor TPascalTypeScaledTrueTypeGlyph.Create(GlyphIndex: Integer);
begin
 inherited;
 FContours := TObjectList.Create;
end;

destructor TPascalTypeScaledTrueTypeGlyph.Destroy;
begin
 FreeAndNil(FContours);
 inherited;
end;

function TPascalTypeScaledTrueTypeGlyph.GetContour(
  Index: Integer): TPascalTypeScaledContour;
begin
 if (Index >= 0) and (Index < FContours.Count)
  then Result := TPascalTypeScaledContour(FContours[Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypeScaledTrueTypeGlyph.GetContourCount: Integer;
begin
 Result := FContours.Count;
end;


{ TCustomPascalTypeRasterizer }

constructor TCustomPascalTypeRasterizer.Create;
begin
 inherited;
 FInterpreter := TPascalTypeInterpreter.Create;

 // set default pixel per inch
 FPixelPerInchX := 96;
 FPixelPerInchY := 96;
 FFontHeight := -11;
end;

destructor TCustomPascalTypeRasterizer.Destroy;
begin
 FreeAndNil(FInterpreter);
 inherited;
end;

procedure TCustomPascalTypeRasterizer.LoadFromFile(FileName: TFileName);
begin
 FInterpreter.LoadFromFile(FileName);

 // calculate font depenent variables
 CalculateScaler;
end;

procedure TCustomPascalTypeRasterizer.LoadFromStream(Stream: TStream);
begin
 FInterpreter.LoadFromStream(Stream);

 // calculate font depenent variables
 CalculateScaler;
end;

procedure TCustomPascalTypeRasterizer.SaveToFile(FileName: TFileName);
begin
 FInterpreter.SaveToFile(FileName);
end;

procedure TCustomPascalTypeRasterizer.SaveToStream(Stream: TStream);
begin
 FInterpreter.SaveToStream(Stream);
end;

procedure TCustomPascalTypeRasterizer.RenderText(Text: string);
var
  CharIndex : Integer;
begin
 for CharIndex := 1 to Length(Text) do
  begin
//   RenderCharacter(Text[CharIndex]);
  end;
end;

procedure TCustomPascalTypeRasterizer.RenderCharacter(Character: AnsiChar);
begin
end;

procedure TCustomPascalTypeRasterizer.PixelPerInchXChanged;
begin
 // nothing todo here yet (trigger recalculation of cache here soon!)
end;

procedure TCustomPascalTypeRasterizer.PixelPerInchYChanged;
begin
 // nothing todo here yet (trigger recalculation of cache here soon!)
end;

function TCustomPascalTypeRasterizer.FixedScaleX(Value: Integer): Integer;
begin
 Result := Round(Value * ScalerX);
end;

function TCustomPascalTypeRasterizer.FixedScaleY(Value: Integer): Integer;
begin
 Result := Round(Value * ScalerY);
end;

procedure TCustomPascalTypeRasterizer.FontHeightChanged;
begin
 CalculateScaler;
end;

procedure TCustomPascalTypeRasterizer.CalculateScaler;
begin
 CalculateScalerX;
 CalculateScalerY;
end;

procedure TCustomPascalTypeRasterizer.CalculateScalerX;
begin
 FScalerX := Abs(FFontHeight / FInterpreter.HeaderTable.UnitsPerEm);
end;

procedure TCustomPascalTypeRasterizer.CalculateScalerY;
begin
 FScalerY := Abs(FFontHeight / FInterpreter.HeaderTable.UnitsPerEm);
end;

function TCustomPascalTypeRasterizer.GetAdvanceWidth(
  GlyphIndex: Integer): Single;
begin
 Result := FixedScaleX(Interpreter.GetAdvanceWidth(GlyphIndex));
end;

function TCustomPascalTypeRasterizer.GetFontSize: Integer;
begin
 Result := -Int64(FFontHeight * 72) div FPixelPerInchY;
end;

function TCustomPascalTypeRasterizer.GetGlyphByCharacter(
  Character: Word): Integer;
var
  CharMapIndex : Integer;
begin
 // direct translate character to glyph (will most probably fail!!!
 Result := Integer(Character);

 with FInterpreter.CharacterMap do
  for CharMapIndex := 0 to CharacterMapSubtableCount - 1 do
   {$IFDEF MSWINDOWS}
   if CharacterMapSubtable[CharMapIndex] is TPascalTypeCharacterMapMicrosoftDirectory then
    with TPascalTypeCharacterMapMicrosoftDirectory(CharacterMapSubtable[CharMapIndex]) do
     if PlatformSpecificID = meUnicodeBMP
      then Result := CharacterToGlyph(Integer(Character));
   {$ENDIF}
   {$IFDEF OSX}
   if CharacterMapSubtable[CharMapIndex] is TPascalTypeCharacterMapMacintoshDirectory then
    with TPascalTypeCharacterMapMacintoshDirectory(CharacterMapSubtable[CharMapIndex]) do
     if PlatformSpecificID = 1
      then Result := CharacterToGlyph(Integer(Character));
   {$ENDIF}
end;

function TCustomPascalTypeRasterizer.GetGlyphByCharacter(
  Character: WideChar): Integer;
begin
 Result := GetGlyphByCharacter(Word(Character));
end;

procedure TCustomPascalTypeRasterizer.SetFontSize(const Value: Integer);
begin
 FontHeight := -Int64(Value * FPixelPerInchY) div 72;
end;

procedure TCustomPascalTypeRasterizer.SetFontHeight(const Value: Integer);
begin
 if FFontHeight <> Value then
  begin
   FFontHeight := Value;
   FontHeightChanged;
  end;
end;

procedure TCustomPascalTypeRasterizer.SetPixelPerInchX(const Value: Integer);
begin
 if FPixelPerInchX <> Value then
  begin
   FPixelPerInchX := Value;
   PixelPerInchXChanged;
  end;
end;

procedure TCustomPascalTypeRasterizer.SetPixelPerInchY(const Value: Integer);
begin
 if FPixelPerInchY <> Value then
  begin
   FPixelPerInchY := Value;
   PixelPerInchYChanged;
  end;
end;

end.
