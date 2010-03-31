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
  TCustomPascalTypeRasterizer = class(TInterfacedPersistent, IStreamPersist)
  private
    FInterpreter  : TPascalTypeInterpreter;
    FFontHeight   : Integer;
    FPixelPerInch : Integer;
    FScaler       : Single;
    procedure SetFontSize(const Value: Integer);
    procedure SetPixelPerInch(const Value: Integer);
    procedure SetFontHeight(const Value: Integer);
    function GetFontSize: Integer;

    function GetGlyphByCharacter(Character: WideChar): Integer;
  protected
    procedure CalculateScaler;

    procedure FontHeightChanged; virtual;
    procedure PixelPerInchChanged; virtual;

    procedure RenderText(Text: string);
    procedure RenderCharacter(Character: AnsiChar);

    property Interpreter: TPascalTypeInterpreter read FInterpreter;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure LoadFromStream(Stream: TStream); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure LoadFromFile(FileName: TFileName);
    procedure SaveToFile(FileName: TFileName);

    property FontSize: Integer read GetFontSize write SetFontSize;
    property FontHeight: Integer read FFontHeight write SetFontHeight;
    property PixelPerInch: Integer read FPixelPerInch write SetPixelPerInch;
  end;

  TPascalTypeRasterizer = class(TCustomPascalTypeRasterizer)
  public
    property Interpreter;
  end;

implementation


{ TCustomPascalTypeRasterizer }

constructor TCustomPascalTypeRasterizer.Create;
begin
 inherited;
 FInterpreter := TPascalTypeInterpreter.Create;
end;

destructor TCustomPascalTypeRasterizer.Destroy;
begin
 FreeAndNil(FInterpreter);
 inherited;
end;

procedure TCustomPascalTypeRasterizer.LoadFromFile(FileName: TFileName);
begin
 FInterpreter.LoadFromFile(FileName);
end;

procedure TCustomPascalTypeRasterizer.LoadFromStream(Stream: TStream);
begin
 FInterpreter.LoadFromStream(Stream);
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
   RenderCharacter(Text[CharIndex]);
  end;
end;

procedure TCustomPascalTypeRasterizer.RenderCharacter(Character: AnsiChar);
begin
end;

procedure TCustomPascalTypeRasterizer.PixelPerInchChanged;
begin
 // nothing todo here yet (trigger recalculation of cache here soon!)
end;

procedure TCustomPascalTypeRasterizer.FontHeightChanged;
begin
 CalculateScaler;
end;

procedure TCustomPascalTypeRasterizer.CalculateScaler;
begin
 FScaler := FFontHeight / FInterpreter.HeaderTable.UnitsPerEm;
end;

function TCustomPascalTypeRasterizer.GetFontSize: Integer;
begin
 Result := -Int64(FFontHeight * 72) div FPixelPerInch;
end;

function TCustomPascalTypeRasterizer.GetGlyphByCharacter(
  Character: WideChar): Integer;
var
  CharMapIndex : Integer;
begin
 with FInterpreter.CharacterMap do
  for CharMapIndex := 0 to CharacterMapSubtableCount - 1 do
   {$IFDEF MSWINDOWS}
   if CharacterMapSubtable[CharMapIndex] is TMicrosoftCharacterMapDirectoryEntry then
    with TMicrosoftCharacterMapDirectoryEntry(CharacterMapSubtable[CharMapIndex]) do
     if PlatformSpecificID = meUnicodeBMP
      then Result := CharacterToGlyph(Integer(Character));
   {$ENDIF}
   {$IFDEF OSX}
   if CharacterMapSubtable[CharMapIndex] is TMacintoshCharacterMapDirectoryEntry then
    with TMacintoshCharacterMapDirectoryEntry(CharacterMapSubtable[CharMapIndex]) do
     if PlatformSpecificID = 1
      then Result := CharacterToGlyph(Integer(Character));
   {$ENDIF}
end;

procedure TCustomPascalTypeRasterizer.SetFontSize(const Value: Integer);
begin
 FontHeight := -Int64(Value * FPixelPerInch) div 72;
end;

procedure TCustomPascalTypeRasterizer.SetFontHeight(const Value: Integer);
begin
 if FFontHeight <> Value then
  begin
   FFontHeight := Value;
   FontHeightChanged;
  end;
end;

procedure TCustomPascalTypeRasterizer.SetPixelPerInch(const Value: Integer);
begin
 if FPixelPerInch <> Value then
  begin
   FPixelPerInch := Value;
   PixelPerInchChanged;
  end;
end;

end.
