unit PT_Component;

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

{$R Default.res}

uses

{$IFDEF LCL}
  LCLIntf, LCLType, LMessages,
{$ELSE}
  Windows,
{$ENDIF}
  Classes, SysUtils, Graphics, PT_Types, PT_Interpreter;

type
  TFontStyle = (ptBold, ptItalic);
  TFontStyles = set of TFontStyle;

  TCustomPascalType = class(TComponent)
  private
    FInterpreter   : TPascalTypeInterpreter;
    FUseKerning    : Boolean;

    FHeight        : Integer;
    FPixelsPerInch : Integer;
    FOnFontChanged : TNotifyEvent;
    FFontStyles    : TFontStyles;
    function GetName: WideString;
    function GetSize: Integer;
    procedure SetHeight(const Value: Integer);
    procedure SetPixelsPerInch(const Value: Integer);
    procedure SetSize(const Value: Integer);
  protected
    procedure HeightChanged; virtual;
    procedure LoadDefaultFont; virtual;
    procedure PixelsPerInchChanged; virtual;
    procedure UpdateFace; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetTextExtent(AText: string): TSize;
    function GetTextHeight(AText: string): Integer;
    function GetTextMetrics(var ATextMetrics: TTextMetric): Boolean;
    function GetTextWidth(AText: string): Integer;

    procedure LoadFromResource(ID: Integer); overload;
    procedure LoadFromResource(ID: Integer; ResType : string); overload;
    procedure LoadFromStream(Stream : TStream);
  published
    property Height: Integer read FHeight write SetHeight;
    property Name: WideString read GetName;
    property PixelsPerInch: Integer read FPixelsPerInch write SetPixelsPerInch;
    property Size: Integer read GetSize write SetSize stored False;
    property Style: TFontStyles read FFontStyles;
    property UseKerning: Boolean read FUseKerning write FUseKerning default True;

    property OnFontChanged : TNotifyEvent read FOnFontChanged write FOnFontChanged;
  end;

  TPascalType = class(TCustomPascalType);

procedure Register;

implementation

uses
  Types, PT_Tables;

resourcestring
  RCStrFontIDNotFound = 'Font ID not found';

var
  ScreenLogPixels : Integer;

{ TCustomPascalType }

constructor TCustomPascalType.Create(AOwner : TComponent);
begin
 inherited;
 FInterpreter := TPascalTypeInterpreter.Create;

 // load default font
 LoadDefaultFont;

 FUseKerning := True;
 FFontStyles := [];
 FPixelsPerInch := ScreenLogPixels;
 FHeight := -11;
end;

destructor TCustomPascalType.Destroy;
begin
 FreeAndNil(FInterpreter);
 inherited;
end;

procedure TCustomPascalType.LoadDefaultFont;
var
  ResourceStream : TResourceStream;
begin
 ResourceStream := TResourceStream.Create(HInstance, 'Default', 'TTFFONT');
 try
  FInterpreter.LoadFromStream(ResourceStream);
 finally
  FreeAndNil(ResourceStream);
 end;
end;


function TCustomPascalType.GetName: WideString;
var
  NameRecordIndex : Integer;
begin
 Result := '';

 with FInterpreter.NameTable do
  begin
   for NameRecordIndex := 0 to NameRecordCount - 1 do
    if NameRecord[NameRecordIndex].NameID = niFullName then
     begin
      Result := NameRecord[NameRecordIndex].Name;
      Exit;
     end else
    if NameRecord[NameRecordIndex].NameID = niFamily
     then Result := NameRecord[NameRecordIndex].Name;
  end;
end;

function TCustomPascalType.GetTextExtent(AText: string): TSize;
(*
var
  I: Integer;
  lChar: Integer;
  lCurrentIndex, lNextIndex: Cardinal;
  lDelta: TFT_Vector;
*)
begin
(*
  Result.cx := 0;
  Result.cy := 0;
  if Assigned(FCheckFace) then
  begin
    for I := 1 to Length(AText) do
    begin
      lChar := Ord(AText[I]);
      lCurrentIndex := FT_Get_Char_Index(FCheckFace, lChar);
      if FT_Load_Glyph(FCheckFace, lCurrentIndex, FT_LOAD_DEFAULT) = 0 then
      begin
        inc(Result.cx, FCheckFace.Glyph.advance.X);
        if (Length(AText) > 1) and (i < Length(AText)) and (FT_HAS_KERNING(FCheckFace)) and FUseKerning then
        begin
          lChar := Ord(AText[I + 1]);
          lNextIndex := FT_Get_Char_Index(FCheckFace, lChar);
          if FT_Get_Kerning(FCheckFace, lCurrentIndex, lNextIndex, Cardinal(FT_KERNING_DEFAULT), lDelta) = 0 then
            inc(Result.cx, lDelta.X);
        end;
      end;
    end;
    Result.cy := (FCheckFace.size.metrics.height);
  end;
  Result.cx := Result.cx div 64;
  Result.cy := Result.cy div 64;
*)
end;

function TCustomPascalType.GetTextHeight(AText: string): Integer;
begin
 with GetTextExtent(AText) do Result := cy;
end;

function TCustomPascalType.GetTextWidth(AText: string): Integer;
begin
 with GetTextExtent(AText) do Result := cx;
end;

(*
procedure TCustomPascalType.RenderText(X, Y: Integer; const Text: String; Bitmap32 : TBitmap32);
var
  I, J  : Integer;
  lLeft : Integer;
  lTop  : Integer;
begin
 with TBitmap32.Create do
  try
   lLeft := X;
   DrawMode := dmBlend;
   lTop := Y + Size * PixelsPerInch div 64;
   for I := 1 to Length(Text) do
   begin
{
     if FT_Load_Char(FCheckFace, Ord(Text[I]), FT_LOAD_RENDER) = 0 then
     with FCheckFace.glyph^ do
      begin
       SetSize(bitmap.Width, bitmap.Rows);
       Clear(0);
       for J := 0 to bitmap.Rows * bitmap.Width-1
         do PColor32Array(@(Bits^[0]))^[J] := SetAlpha(FColor32, ((FColor32 shr 24) * PByteArray(bitmap.Buffer)^[J]) div 255);
       DrawTo(Bitmap32, lLeft + bitmap_left, lTop - bitmap_top );
       lLeft := lLeft + advance.X div 64;
      end;
}
   end;
  finally
   Free;
  end;
end;
*)

function TCustomPascalType.GetTextMetrics(var ATextMetrics: TTextMetric): Boolean;
begin
 Result := False;
 if Assigned(FInterpreter) then
  begin
(*
   with ATextMetrics, FCheckFace^ do
    begin
     tmHeight := height div 64;
     tmAscent := ascender div 64;
     tmDescent := descender div 64;
     Result := True;
    end;
*)
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TCustomPascalType.LoadFromResource(ID: Integer; ResType: string);
var
  ResourceStream   : TResourceStream;
begin
 ResourceStream := TResourceStream.CreateFromID(hInstance, ID, PChar(ResType));
 try
  FInterpreter.LoadFromStream(ResourceStream);
 finally
  FreeAndNil(ResourceStream);
 end;
end;

procedure TCustomPascalType.LoadFromResource(ID: Integer);
begin
 LoadFromResource(ID, 'TTFFONT');
end;

procedure TCustomPascalType.LoadFromStream(Stream: TStream);
begin
 FInterpreter.LoadFromStream(Stream);
 UpdateFace;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TCustomPascalType.SetHeight(const Value: Integer);
begin
 if FHeight <> Value then
  begin
   FHeight := Value;
   HeightChanged;
  end;
end;

procedure TCustomPascalType.SetPixelsPerInch(const Value: Integer);
begin
 if FPixelsPerInch <> Value then
  begin
   FPixelsPerInch := Value;
   PixelsPerInchChanged;
  end;
end;

procedure TCustomPascalType.SetSize(const Value: Integer);
begin
 Height := -Value;
end;

function TCustomPascalType.GetSize: Integer;
begin
  Result := -MulDiv(FHeight, 72, FPixelsPerInch);
end;


////////////////////////////////////////////////////////////////////////////////

procedure TCustomPascalType.HeightChanged;
begin
 UpdateFace;
end;

procedure TCustomPascalType.PixelsPerInchChanged;
begin
 UpdateFace;
end;

procedure TCustomPascalType.UpdateFace;
begin
(*
  if Assigned(FCheckFace) then
  begin
    FT_Set_Char_Size(FCheckFace, 0, Size*64, PixelsPerInch, PixelsPerInch);
    if (FCheckFace.style_flags and 1)=1
      then FFontStyles := [fftBold]
      else FFontStyles := [];
    if (FCheckFace.style_flags and 1)=2
      then FFontStyles := FFontStyles + [fftItalic];
  end;
*)
  if Assigned(FOnFontChanged) then FOnFontChanged(Self);
end;

procedure InitScreenLogPixels;
var
  DC: HDC;
begin
  DC := GetDC(0);
  ScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
  ReleaseDC(0,DC);
end;

////////////////////////////////////////////////////////////////////////////////

procedure Register;
begin
 RegisterComponents('Pascal Type', [TPascalType]);
end;

////////////////////////////////////////////////////////////////////////////////

initialization
  InitScreenLogPixels;

end.
