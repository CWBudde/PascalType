unit PT_RasterizerGDI;

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
  Windows, Classes, Contnrs, Sysutils, Graphics, PT_Types, PT_Interpreter,
  PT_Rasterizer, PT_Tables, PT_TablesTrueType;

type
  TPascalTypeRasterizerGDI = class(TCustomPascalTypeRasterizer)
  protected
    procedure RasterizeGlyph(GlyphIndex: Integer; Canvas: TCanvas; X, Y : Integer);
    procedure RasterizeSimpleGlyph(Glyph: TTrueTypeFontSimpleGlyphData; Canvas: TCanvas; X, Y : Integer);
  public
    procedure RenderText(Text: string; Canvas: TCanvas); overload; virtual;
    procedure RenderText(Text: string; Canvas: TCanvas; X, Y: Integer); overload; virtual;

    // GDI like functions
    function GetGlyphOutline(Character: Cardinal; Format: TGetGlyphOutlineUnion;
      out GlyphMetrics: TGlyphMetrics; BufferSize: Cardinal; Buffer: Pointer;
      const TransformationMatrix: TTransformationMatrix): Cardinal;

    function GetTextMetricsA(var TextMetric: TTextMetricA): Boolean;
    function GetTextMetricsW(var TextMetric: TTextMetricW): Boolean;
    function GetOutlineTextMetricsA(Buffersize: Cardinal; OutlineTextMetric: Pointer): Cardinal;
    function GetOutlineTextMetricsW(Buffersize: Cardinal; OutlineTextMetric: Pointer): Cardinal;
    function GetTextExtentPoint32A(Text: string; var Size: TSize): Boolean;
    function GetTextExtentPoint32W(Text: WideString; var Size: TSize): Boolean;
  end;

implementation

uses
  Math;

{ TPascalTypeRasterizerGDI }

function TPascalTypeRasterizerGDI.GetTextMetricsA(
  var TextMetric: TTextMetricA): Boolean;
begin
 Result := False;

 if Assigned(Interpreter.OS2Table) then
  with Interpreter, OS2Table, TextMetric do
   begin
    // find right ascent/descent pair and calculate leading
    if fsfUseTypoMetrics in FontSelectionFlags then
     begin
      tmAscent := FixedScaleY(TypographicAscent);
      tmDescent := FixedScaleY(TypographicDescent);
      tmInternalLeading := FixedScaleY(TypographicAscent + TypographicDescent - HeaderTable.UnitsPerEm);
      tmExternalLeading := Max(0, FixedScaleY(HorizontalHeader.LineGap -
        ((TypographicAscent + TypographicDescent) -
         (HorizontalHeader.Ascent - HorizontalHeader.Descent))));
     end
    else
     begin
      if (WindowsAscent + WindowsDescent) = 0 then
       begin
        tmAscent := FixedScaleY(HorizontalHeader.Ascent);
        tmDescent := FixedScaleY(-HorizontalHeader.Descent);
        tmInternalLeading := FixedScaleY(HorizontalHeader.Ascent + HorizontalHeader.Descent - HeaderTable.UnitsPerEm);
        tmExternalLeading := Max(0, FixedScaleY(HorizontalHeader.LineGap -
          ((HorizontalHeader.Ascent + HorizontalHeader.Descent) -
           (HorizontalHeader.Ascent - HorizontalHeader.Descent))));
       end
      else
       begin
        tmAscent := FixedScaleY(WindowsAscent);
        tmDescent := FixedScaleY(WindowsDescent);
        tmInternalLeading := FixedScaleY(WindowsAscent + WindowsDescent - HeaderTable.UnitsPerEm);
        tmExternalLeading := Max(0, FixedScaleY(HorizontalHeader.LineGap -
          ((WindowsAscent + WindowsDescent) -
           (HorizontalHeader.Ascent - HorizontalHeader.Descent))));
       end;
     end;

    tmHeight := tmAscent + tmDescent;

    tmAveCharWidth := FixedScaleX(AverageCharacterWidth);
    if tmAveCharWidth = 0 then tmAveCharWidth := 1;

    tmMaxCharWidth := FixedScaleX(HorizontalHeader.AdvanceWidthMax);
    tmWeight := Weight;
    tmOverhang := 0;
    tmDigitizedAspectX := PixelPerInchX;
    tmDigitizedAspectY := PixelPerInchY;

    if WideChar(UnicodeFirstCharacterIndex) < #$FF
     then tmFirstChar := Char(UnicodeFirstCharacterIndex)
     else tmFirstChar := #$FF;

    if WideChar(UnicodeLastCharacterIndex) < #$FF
     then tmLastChar := Char(UnicodeLastCharacterIndex)
     else tmLastChar := #$FF;

    tmItalic := Integer(fsfItalic in FontSelectionFlags);
    tmUnderlined := Integer(fsfUnderscore in FontSelectionFlags);
    tmStruckOut := Integer(fsfStrikeout in FontSelectionFlags);

    case FontFamilyClassID of
     9, 12      : tmPitchAndFamily := FF_DECORATIVE;
     10         : tmPitchAndFamily := FF_SCRIPT;
     8          : tmPitchAndFamily := FF_SWISS;
     3, 7       : tmPitchAndFamily := FF_MODERN; // monospaced!
     1, 2, 4, 5 : tmPitchAndFamily := FF_ROMAN;
     else tmPitchAndFamily := 0;
    end;

    if (Interpreter.PostScriptTable.IsFixedPitch = 0)
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_FIXED_PITCH;
    if Interpreter.ContainsTable('glyf')
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_VECTOR + TMPF_TRUETYPE;
    if Interpreter.ContainsTable('CFF ')
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_VECTOR;
    if Interpreter.ContainsTable('HDMX')
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_DEVICE;

(*
    if Assigned(AddendumTable) then
     begin
      tmBreakChar := Char(AddendumTable.BreakChar);
      tmDefaultChar := Char(Integer(tmBreakChar) - 1); // WideChar(AddendumTable.DefaultChar);
     end
    else
     begin
      if tmFirstChar <= #1
       then tmBreakChar := WChar(Integer(tmFirstChar) + 2) else
      if tmFirstChar > #$FF
       then tmBreakChar := #$20
       else tmBreakChar := tmFirstChar;
      tmDefaultChar := WChar(Integer(tmBreakChar) - 1);
     end;
*)

    if Assigned(CodePageRange) then
     begin
      if CodePageRange.SupportsLatin1
       then tmCharSet := 0;
     end;
   end;

 Result := True;
end;

function TPascalTypeRasterizerGDI.GetTextMetricsW(
  var TextMetric: TTextMetricW): Boolean;
var
  Ascent, Descent : Integer;
begin
 Result := False;

 if Assigned(Interpreter.OS2Table) then
  with Interpreter, OS2Table, TextMetric do
   begin
    // find right ascent/descent pair and calculate leading
    if fsfUseTypoMetrics in FontSelectionFlags then
     begin
      tmAscent := FixedScaleY(TypographicAscent);
      tmDescent := FixedScaleY(TypographicDescent);
      tmInternalLeading := FixedScaleY(TypographicAscent + TypographicDescent - HeaderTable.UnitsPerEm);
      tmExternalLeading := Max(0, FixedScaleY(HorizontalHeader.LineGap -
        ((TypographicAscent + TypographicDescent) -
         (HorizontalHeader.Ascent - HorizontalHeader.Descent))));
     end
    else
     begin
      if (WindowsAscent + WindowsDescent) = 0 then
       begin
        tmAscent := FixedScaleY(HorizontalHeader.Ascent);
        tmDescent := FixedScaleY(-HorizontalHeader.Descent);
        tmInternalLeading := FixedScaleY(HorizontalHeader.Ascent + HorizontalHeader.Descent - HeaderTable.UnitsPerEm);
        tmExternalLeading := Max(0, FixedScaleY(HorizontalHeader.LineGap -
          ((HorizontalHeader.Ascent + HorizontalHeader.Descent) -
           (HorizontalHeader.Ascent - HorizontalHeader.Descent))));
       end
      else
       begin
        tmAscent := FixedScaleY(WindowsAscent);
        tmDescent := FixedScaleY(WindowsDescent);
        tmInternalLeading := FixedScaleY(WindowsAscent + WindowsDescent - HeaderTable.UnitsPerEm);
        tmExternalLeading := Max(0, FixedScaleY(HorizontalHeader.LineGap -
          ((WindowsAscent + WindowsDescent) -
           (HorizontalHeader.Ascent - HorizontalHeader.Descent))));
       end;
     end;

    tmHeight := tmAscent + tmDescent;

    tmAveCharWidth := FixedScaleX(AverageCharacterWidth);
    if tmAveCharWidth = 0 then tmAveCharWidth := 1;

    tmMaxCharWidth := FixedScaleX(HorizontalHeader.AdvanceWidthMax);
    tmWeight := Weight;
    tmOverhang := 0;
    tmDigitizedAspectX := PixelPerInchX;
    tmDigitizedAspectY := PixelPerInchY;

    tmFirstChar := WideChar(UnicodeFirstCharacterIndex);
    tmLastChar := WideChar(UnicodeLastCharacterIndex);

    tmItalic := Integer(fsfItalic in FontSelectionFlags);
    tmUnderlined := Integer(fsfUnderscore in FontSelectionFlags);
    tmStruckOut := Integer(fsfStrikeout in FontSelectionFlags);

    case FontFamilyClassID of
     9, 12      : tmPitchAndFamily := FF_DECORATIVE;
     10         : tmPitchAndFamily := FF_SCRIPT;
     8          : tmPitchAndFamily := FF_SWISS;
     3, 7       : tmPitchAndFamily := FF_MODERN;
     1, 2, 4, 5 : tmPitchAndFamily := FF_ROMAN;
     else tmPitchAndFamily := 0;
    end;
    if (Interpreter.PostScriptTable.IsFixedPitch = 0)
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_FIXED_PITCH;
    if Interpreter.ContainsTable('glyf')
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_VECTOR + TMPF_TRUETYPE;
    if Interpreter.ContainsTable('CFF ')
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_VECTOR;
    if Interpreter.ContainsTable('HDMX')
     then tmPitchAndFamily := tmPitchAndFamily + TMPF_DEVICE;

    if Assigned(AddendumTable) then
     begin
      tmBreakChar := WideChar(AddendumTable.BreakChar);
      tmDefaultChar := WChar(Integer(tmBreakChar) - 1); // WideChar(AddendumTable.DefaultChar);
     end
    else
     begin
      if tmFirstChar <= #1
       then tmBreakChar := WChar(Integer(tmFirstChar) + 2) else
      if tmFirstChar > #$FF
       then tmBreakChar := #$20
       else tmBreakChar := tmFirstChar;
      tmDefaultChar := WChar(Integer(tmBreakChar) - 1);
     end;

    if Assigned(CodePageRange) then
     begin
      if CodePageRange.SupportsLatin1
       then tmCharSet := 0;
     end;
   end;

 Result := True;
end;

////////////////////////////////////////////////////////////////////////////////

function TPascalTypeRasterizerGDI.GetOutlineTextMetricsA(
  Buffersize: Cardinal; OutlineTextMetric: Pointer): Cardinal;
var
  Panose : TCustomPascalTypePanoseTable;
begin
 if OutlineTextMetric = nil then
  begin
   Result := SizeOf(TOutlineTextmetricA);
   Exit;
  end;

 if not Assigned(Interpreter.OS2Table) or
    (Buffersize < SizeOf(TOutlineTextmetricA)) then
  begin
   Result := 0;
   if Buffersize < SizeOf(TOutlineTextmetricA)
    then FillChar(OutlineTextMetric^, Buffersize, 0)
    else FillChar(OutlineTextMetric^, SizeOf(TOutlineTextmetricW), 0);
   Exit;
  end;

 with Interpreter, OS2Table, POutlineTextmetricA(OutlineTextMetric)^ do
  begin
   otmSize := SizeOf(TOutlineTextmetricA);

   // get text metrics
   GetTextMetricsA(otmTextMetrics);

   // set padding filler to zero
   otmFiller := 0;

   // set font selection
   otmfsSelection := FontSelection;

   // set font embedding rights
   otmfsType := FontEmbeddingFlags;

   // set caret slope rise/run
   otmsCharSlopeRise := HorizontalHeader.CaretSlopeRise;
   otmsCharSlopeRun := HorizontalHeader.CaretSlopeRun;

   // set italic angle (fixed point with MS compatibility fix)
   with PostScriptTable.ItalicAngle
    do otmItalicAngle := Round(10 * (Value + Fract / (1 shl 16)));

   otmEMSquare := HeaderTable.UnitsPerEm;
   otmAscent := FixedScaleY(OS2Table.TypographicAscent);
   otmDescent := FixedScaleY(OS2Table.TypographicDescent);
   otmLineGap := FixedScaleY(OS2Table.TypographicLineGap);
   if Assigned(AddendumTable) then
    begin
     otmsXHeight := FixedScaleY(AddendumTable.XHeight);
     otmsCapEmHeight := FixedScaleY(AddendumTable.CapHeight);
    end
   else
    begin
     otmsXHeight := 0;
     otmsCapEmHeight := 0;
    end;

   otmrcFontBox.Left := FixedScaleX(HeaderTable.XMin);
   otmrcFontBox.Top := FixedScaleY(HeaderTable.YMax);
   otmrcFontBox.Right := FixedScaleX(HeaderTable.XMax);
   otmrcFontBox.Bottom := FixedScaleY(HeaderTable.YMin);
   otmMacAscent := FixedScaleY(HorizontalHeader.Ascent);
   otmMacDescent := FixedScaleY(HorizontalHeader.Descent);
   otmMacLineGap := FixedScaleY(HorizontalHeader.LineGap);
   otmusMinimumPPEM := HeaderTable.LowestRecPPEM;
   otmptSubscriptSize.X := FixedScaleX(SubScriptSizeX);
   otmptSubscriptSize.Y := FixedScaleY(SubScriptSizeY);
   otmptSubscriptOffset.X := FixedScaleX(SubScriptOffsetX);
   otmptSubscriptOffset.Y := FixedScaleY(SubScriptOffsetY);
   otmptSuperscriptSize.X := FixedScaleX(SuperScriptSizeX);
   otmptSuperscriptSize.Y := FixedScaleY(SuperScriptSizeY);
   otmptSuperscriptOffset.X := FixedScaleX(SuperScriptOffsetX);
   otmptSuperscriptOffset.Y := FixedScaleY(SuperScriptOffsetY);
   otmsStrikeoutSize := FixedScaleY(StrikeoutSize);
   otmsStrikeoutPosition := FixedScaleY(StrikeoutPosition);
   otmsUnderscoreSize := FixedScaleY(PostScriptTable.UnderlineThickness);
   otmsUnderscorePosition := FixedScaleY(PostScriptTable.UnderlinePosition);

   // copy panose data
   Panose := Interpreter.Panose;
   if Assigned(Panose) then
    with otmPanoseNumber, Panose do
     begin
      bFamilyType      := FamilyType;
      bSerifStyle      := Data[0];
      bWeight          := Data[1];
      bProportion      := Data[2];
      bContrast        := Data[3];
      bStrokeVariation := Data[4];
      bArmStyle        := Data[5];
      bLetterform      := Data[6];
      bMidline         := Data[7];
      bXHeight         := Data[8];
     end
    else Exit;

   // do not fill strings yet
   otmpFamilyName := 0;
   otmpFaceName := 0;
   otmpStyleName := 0;
   otmpFullName := 0;

   Result := 0;
  end;
end;

function TPascalTypeRasterizerGDI.GetOutlineTextMetricsW(
  Buffersize: Cardinal; OutlineTextMetric: Pointer): Cardinal;
var
  Panose : TCustomPascalTypePanoseTable;
begin
 // check if OutlineTextMetric buffer is passed, if not return the necessary size
 if OutlineTextMetric = nil then
  begin
   Result := SizeOf(TOutlineTextmetricW);
   Exit;
  end;

 // check if OS/2 table exists (as it is not necessary in the true type spec
 if not Assigned(Interpreter.OS2Table) or
    (Buffersize < SizeOf(TOutlineTextmetricW)) then
  begin
   Result := 0;
   if Buffersize < SizeOf(TOutlineTextmetricW)
    then FillChar(OutlineTextMetric^, Buffersize, 0)
    else FillChar(OutlineTextMetric^, SizeOf(TOutlineTextmetricW), 0);
   Exit;
  end;

 with Interpreter, OS2Table, POutlineTextmetricW(OutlineTextMetric)^ do
  begin
   otmSize := SizeOf(TOutlineTextmetricW);

   // get text metrics
   GetTextMetricsW(otmTextMetrics);

   // set padding filler to zero
   otmFiller := 0;

   // set font selection
   otmfsSelection := FontSelection;

   // set font embedding rights
   otmfsType := FontEmbeddingFlags;

   // set caret slope rise/run
   otmsCharSlopeRise := HorizontalHeader.CaretSlopeRise;
   otmsCharSlopeRun := HorizontalHeader.CaretSlopeRun;

   // set italic angle (fixed point with MS compatibility fix)
   with PostScriptTable.ItalicAngle
    do otmItalicAngle := Round(10 * (Value + Fract / (1 shl 16)));

   otmEMSquare := HeaderTable.UnitsPerEm;
   otmAscent := FixedScaleY(OS2Table.TypographicAscent);
   otmDescent := FixedScaleY(OS2Table.TypographicDescent);
   otmLineGap := FixedScaleY(OS2Table.TypographicLineGap);
   if Assigned(AddendumTable) then
    begin
     otmsXHeight := FixedScaleY(AddendumTable.XHeight);
     otmsCapEmHeight := FixedScaleY(AddendumTable.CapHeight);
    end
   else
    begin
     otmsXHeight := 0;
     otmsCapEmHeight := 0;
    end;

   otmrcFontBox.Left := FixedScaleX(HeaderTable.XMin);
   otmrcFontBox.Top := FixedScaleY(HeaderTable.YMax);
   otmrcFontBox.Right := FixedScaleX(HeaderTable.XMax);
   otmrcFontBox.Bottom := FixedScaleY(HeaderTable.YMin);
   otmMacAscent := FixedScaleY(HorizontalHeader.Ascent);
   otmMacDescent := FixedScaleY(HorizontalHeader.Descent);
   otmMacLineGap := FixedScaleY(HorizontalHeader.LineGap);
   otmusMinimumPPEM := HeaderTable.LowestRecPPEM;
   otmptSubscriptSize.X := FixedScaleX(SubScriptSizeX);
   otmptSubscriptSize.Y := FixedScaleY(SubScriptSizeY);
   otmptSubscriptOffset.X := FixedScaleX(SubScriptOffsetX);
   otmptSubscriptOffset.Y := FixedScaleY(SubScriptOffsetY);
   otmptSuperscriptSize.X := FixedScaleX(SuperScriptSizeX);
   otmptSuperscriptSize.Y := FixedScaleY(SuperScriptSizeY);
   otmptSuperscriptOffset.X := FixedScaleX(SuperScriptOffsetX);
   otmptSuperscriptOffset.Y := FixedScaleY(SuperScriptOffsetY);
   otmsStrikeoutSize := FixedScaleY(StrikeoutSize);
   otmsStrikeoutPosition := FixedScaleY(StrikeoutPosition);
   otmsUnderscoreSize := FixedScaleY(PostScriptTable.UnderlineThickness);
   otmsUnderscorePosition := FixedScaleY(PostScriptTable.UnderlinePosition);

   // copy panose data
   Panose := Interpreter.Panose;
   if Assigned(Panose) then
    with otmPanoseNumber, Panose do
     begin
      bFamilyType      := FamilyType;
      bSerifStyle      := Data[0];
      bWeight          := Data[1];
      bProportion      := Data[2];
      bContrast        := Data[3];
      bStrokeVariation := Data[4];
      bArmStyle        := Data[5];
      bLetterform      := Data[6];
      bMidline         := Data[7];
      bXHeight         := Data[8];
     end
    else Exit;

   // do not fill strings yet
   otmpFamilyName := 0;
   otmpFaceName := 0;
   otmpStyleName := 0;
   otmpFullName := 0;

   Result := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

function TPascalTypeRasterizerGDI.GetTextExtentPoint32A(Text: string;
  var Size: TSize): Boolean;
var
  GlyphIndex: Integer;
begin
// GlyphIndex := GetGlyphByCharacter(Character);
 Result := False;
end;

function TPascalTypeRasterizerGDI.GetTextExtentPoint32W(Text: WideString;
  var Size: TSize): Boolean;
var
  CharIndex  : Integer;
  Advance    : Single;
  GlyphIndex : Integer;
begin
 CharIndex := 0;
 Result := False;
 Advance := 0;
 while CharIndex < Length(Text) do
  begin
   GlyphIndex := GetGlyphByCharacter(Text[CharIndex]);
   Advance := Advance + GetAdvanceWidth(GlyphIndex);
   Inc(CharIndex);
  end;

 Size.cy := Abs(FontHeight);
 Size.cx := Round(Advance);
 Result := True;
end;

////////////////////////////////////////////////////////////////////////////////

function TPascalTypeRasterizerGDI.GetGlyphOutline(Character: Cardinal;
  Format: TGetGlyphOutlineUnion; out GlyphMetrics: TGlyphMetrics;
  BufferSize: Cardinal; Buffer: Pointer;
  const TransformationMatrix: TTransformationMatrix): Cardinal;
var
  GlyphIndex: Integer;
begin
 // get glyph index
 if (ggoGlyphIndex in Format.Flags)
  then GlyphIndex := Character
  else GlyphIndex := GetGlyphByCharacter(Character);

(*
 if Buffer = nil then
  case Format.Format of


  end;
*)
end;

////////////////////////////////////////////////////////////////////////////////

procedure TPascalTypeRasterizerGDI.RasterizeGlyph(GlyphIndex: Integer;
  Canvas: TCanvas; X, Y : Integer);
begin
 with Canvas, Interpreter do
  begin
   if GlyphData[GlyphIndex] is TTrueTypeFontSimpleGlyphData
    then RasterizeSimpleGlyph(TTrueTypeFontSimpleGlyphData(GlyphData[GlyphIndex]), Canvas, X, Y);
  end;
end;

procedure TPascalTypeRasterizerGDI.RasterizeSimpleGlyph(Glyph: TTrueTypeFontSimpleGlyphData;
  Canvas: TCanvas; X, Y : Integer);
var
  ContourIndex  : Integer;
  PointIndex    : Integer;
  CurrentPoint  : TPoint;
  MidPoint      : TPoint;
  ControlPoint  : TPoint;
  WasOnCurve    : Boolean;
  IsOnCurve     : Boolean;
begin
 with Canvas, Glyph do
  begin
   // set pen to solid black
   Pen.Color := clBlack;
   Pen.Style := psSolid;

   Y := Y + Abs(FontHeight);

   for ContourIndex := 0 to ContourCount - 1 do
    with Contour[ContourIndex] do
     begin
      WasOnCurve := (Point[0].Flags and 1) <> 0;

      // store last point
      if WasOnCurve then
       begin
        CurrentPoint.X := X + Round(Point[0].XPos * ScalerX);
        CurrentPoint.Y := Y - Round(Point[0].YPos * ScalerY);
       end
      else
       begin
        IsOnCurve := (Point[PointCount - 1].Flags and 1) <> 0;
        // check if last point is on curve
        if IsOnCurve then
         begin
          CurrentPoint.X := X + Round(Point[PointCount - 1].XPos * ScalerX);
          CurrentPoint.Y := Y - Round(Point[PointCount - 1].YPos * ScalerY);
         end
        else
         begin
          // in case it is not start at a temporary point in between both
          CurrentPoint.X := X + Round((Point[0].XPos + Point[PointCount - 1].XPos) * 0.5 * ScalerX);
          CurrentPoint.Y := Y - Round((Point[0].YPos + Point[PointCount - 1].YPos) * 0.5 * ScalerY);
         end;
       end;

      // move to last point
      MoveTo(CurrentPoint.X, CurrentPoint.Y);

      PointIndex := 1;

      while PointIndex <= PointCount do
       begin
        // set current point
        CurrentPoint.X := X + Round(Point[PointIndex].XPos * ScalerX);
        CurrentPoint.Y := Y - Round(Point[PointIndex].YPos * ScalerY);

        IsOnCurve := (Point[PointIndex].Flags and 1) <> 0;

        if IsOnCurve then
         if WasOnCurve
          then LineTo(CurrentPoint.X, CurrentPoint.Y)
          else PolyBezierTo([ControlPoint, CurrentPoint, CurrentPoint])
        else
         if WasOnCurve
          then ControlPoint := CurrentPoint
          else
           begin
            MidPoint.X := (CurrentPoint.X + ControlPoint.X) div 2;
            MidPoint.Y := (CurrentPoint.Y + ControlPoint.Y) div 2;
            PolyBezierTo([ControlPoint, MidPoint, MidPoint]);
            ControlPoint := CurrentPoint;
           end;

        Inc(PointIndex);
        WasOnCurve := IsOnCurve;
       end;
     end;
  end;
end;

procedure TPascalTypeRasterizerGDI.RenderText(Text: string; Canvas: TCanvas);
begin
 RenderText(Text, Canvas, 0, 0);
end;

procedure TPascalTypeRasterizerGDI.RenderText(Text: string; Canvas: TCanvas; X,
  Y: Integer);                      
var
  CharIndex  : Integer;
  GlyphIndex : Integer;
begin
  for CharIndex := 1 to Length(Text) do
   begin
    if Text[CharIndex] <= #31 then
     case Text[CharIndex] of
      #10: ;// handle CR
      #13: ;// handle LF
     end
    else
     begin
      // get glyph index
      GlyphIndex := GetGlyphByCharacter(Text[CharIndex]);

      // rasterize character
      RasterizeGlyph(GlyphIndex, Canvas, X, Y);

      // advance cursor
      X := X + Round(GetAdvanceWidth(GlyphIndex));
    end;
  end;
end;

end.
