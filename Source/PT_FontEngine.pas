unit PT_FontEngine;

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
  Classes, Contnrs, Sysutils, PT_Types, PT_Storage, PT_Tables,
  PT_CharacterMap;

type
  TFontPoint = packed record
    X, Y : TScaleType;
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
    FAdvanceWidth    : TScaleType;
    FLeftSideBearing : TScaleType;
  public
    constructor Create(GlyphIndex: Integer); virtual;

    property GlyphIndex: Integer read FGlyphIndex;
    property AdvanceWidth: TScaleType read FAdvanceWidth;
    property LeftSideBearing: TScaleType read FLeftSideBearing;
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

  TCustomPascalTypeFontEngine = class(TInterfacedPersistent, IStreamPersist)
  private
    FStorage   : TPascalTypeStorage;
    FFontHeight    : Integer;
    FPixelPerInchX : Integer;
    FPixelPerInchY : Integer;
    FScalerX       : TScaleType;
    FScalerY       : TScaleType;
    procedure SetFontSize(const Value: Integer);
    procedure SetPixelPerInchX(const Value: Integer);
    procedure SetPixelPerInchY(const Value: Integer);
    procedure SetFontHeight(const Value: Integer);
    function GetFontSize: Integer;
    procedure CalculateScaler;
  protected
    function GetGlyphByCharacter(Character: Word): Integer; overload;
    function GetGlyphByCharacter(Character: WideChar): Integer; overload;
    function GetGlyphByCharacter(Character: AnsiChar): Integer; overload;

    procedure CalculateScalerX;
    procedure CalculateScalerY;

    function RoundedScaleX(Value: Integer): Integer;
    function RoundedScaleY(Value: Integer): Integer;

    function GetAdvanceWidth(GlyphIndex: Integer): TScaleType;

    procedure FontHeightChanged; virtual;
    procedure PixelPerInchXChanged; virtual;
    procedure PixelPerInchYChanged; virtual;

    procedure RenderText(Text: string);
    procedure RenderCharacter(Character: AnsiChar);
    property Storage: TPascalTypeStorage read FStorage;
    property ScalerX: TScaleType read FScalerX;
    property ScalerY: TScaleType read FScalerY;
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

  TPascalTypeFontEngine = class(TCustomPascalTypeFontEngine)
  public
    property Storage;
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


{ TCustomPascalTypeFontEngine }

constructor TCustomPascalTypeFontEngine.Create;
begin
 inherited;
 FStorage := TPascalTypeStorage.Create;

 // set default pixel per inch
 FPixelPerInchX := 96;
 FPixelPerInchY := 96;
 FFontHeight := -11;
end;

destructor TCustomPascalTypeFontEngine.Destroy;
begin
 FreeAndNil(FStorage);
 inherited;
end;

procedure TCustomPascalTypeFontEngine.LoadFromFile(FileName: TFileName);
begin
 FStorage.LoadFromFile(FileName);

 // calculate font depenent variables
 CalculateScaler;
end;

procedure TCustomPascalTypeFontEngine.LoadFromStream(Stream: TStream);
begin
 FStorage.LoadFromStream(Stream);

 // calculate font depenent variables
 CalculateScaler;
end;

procedure TCustomPascalTypeFontEngine.SaveToFile(FileName: TFileName);
begin
 FStorage.SaveToFile(FileName);
end;

procedure TCustomPascalTypeFontEngine.SaveToStream(Stream: TStream);
begin
 FStorage.SaveToStream(Stream);
end;

procedure TCustomPascalTypeFontEngine.RenderText(Text: string);
var
  CharIndex : Integer;
begin
 for CharIndex := 1 to Length(Text) do
  begin
//   RenderCharacter(Text[CharIndex]);
  end;
end;

procedure TCustomPascalTypeFontEngine.RenderCharacter(Character: AnsiChar);
begin
end;

procedure TCustomPascalTypeFontEngine.PixelPerInchXChanged;
begin
 // nothing todo here yet (trigger recalculation of cache here soon!)
end;

procedure TCustomPascalTypeFontEngine.PixelPerInchYChanged;
begin
 // nothing todo here yet (trigger recalculation of cache here soon!)
end;

function TCustomPascalTypeFontEngine.RoundedScaleX(Value: Integer): Integer;
begin
 {$IFDEF UseFloatingPoint}
 Result := Round(Value * ScalerX);
 {$ELSE}
 Result := Int64(Value shl 6 * ScalerX) shr 6;
 {$ENDIF}
end;

function TCustomPascalTypeFontEngine.RoundedScaleY(Value: Integer): Integer;
begin
 {$IFDEF UseFloatingPoint}
 Result := Round(Value * ScalerY);
 {$ELSE}
 Result := Int64(Value shl 6 * ScalerY) shr 6;
 {$ENDIF}
end;

procedure TCustomPascalTypeFontEngine.FontHeightChanged;
begin
 CalculateScaler;
end;

procedure TCustomPascalTypeFontEngine.CalculateScaler;
begin
 CalculateScalerX;
 CalculateScalerY;
end;

procedure TCustomPascalTypeFontEngine.CalculateScalerX;
begin
 {$IFDEF UseFloatingPoint}
 FScalerX := Abs(FFontHeight / FStorage.HeaderTable.UnitsPerEm);
 {$ENDIF}
end;

procedure TCustomPascalTypeFontEngine.CalculateScalerY;
begin
 {$IFDEF UseFloatingPoint}
 FScalerY := Abs(FFontHeight / FStorage.HeaderTable.UnitsPerEm);
 {$ENDIF}
end;

function TCustomPascalTypeFontEngine.GetAdvanceWidth(
  GlyphIndex: Integer): TScaleType;
begin
 Result := RoundedScaleX(Storage.GetAdvanceWidth(GlyphIndex));
end;

function TCustomPascalTypeFontEngine.GetFontSize: Integer;
begin
 Result := -Int64(FFontHeight * 72) div FPixelPerInchY;
end;

function TCustomPascalTypeFontEngine.GetGlyphByCharacter(
  Character: Word): Integer;
var
  CharMapIndex : Integer;
begin
 // direct translate character to glyph (will most probably fail!!!
 Result := Integer(Character);

 with FStorage.CharacterMap do
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

function TCustomPascalTypeFontEngine.GetGlyphByCharacter(
  Character: WideChar): Integer;
begin
 Result := GetGlyphByCharacter(Word(Character));
end;

function TCustomPascalTypeFontEngine.GetGlyphByCharacter(
  Character: AnsiChar): Integer;
begin
 Result := GetGlyphByCharacter(Word(Character));
end;

procedure TCustomPascalTypeFontEngine.SetFontSize(const Value: Integer);
begin
 FontHeight := -Int64(Value * FPixelPerInchY) div 72;
end;

procedure TCustomPascalTypeFontEngine.SetFontHeight(const Value: Integer);
begin
 if FFontHeight <> Value then
  begin
   FFontHeight := Value;
   FontHeightChanged;
  end;
end;

procedure TCustomPascalTypeFontEngine.SetPixelPerInchX(const Value: Integer);
begin
 if FPixelPerInchX <> Value then
  begin
   FPixelPerInchX := Value;
   PixelPerInchXChanged;
  end;
end;

procedure TCustomPascalTypeFontEngine.SetPixelPerInchY(const Value: Integer);
begin
 if FPixelPerInchY <> Value then
  begin
   FPixelPerInchY := Value;
   PixelPerInchYChanged;
  end;
end;

end.
