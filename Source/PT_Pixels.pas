unit PT_Pixels;

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
//  Portions created by Christian-W. Budde are Copyright (C) 2010-2011        //
//  by Christian-W. Budde. All Rights Reserved.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

interface

{$I PT_Compiler.inc}

uses
  {$IFDEF FPC} LCLIntf, LCLType, LResources, LMessages, FPImage, IntfGraphics,
  {$ELSE} Windows, Messages, {$ENDIF}
  Graphics, Classes, PT_Types, PT_Bindings, PT_MemoryUtils;

const
  COne255th : Double = 1 / 255;

type
  {$A1}

  { 32 bit ARGB color definitions }

  TColor32ARGB = packed record
  case Integer of
   0: (ARGB: Cardinal);
   1: (B, G, R, A: Byte);
  end;
  PColor32ARGB = ^TColor32ARGB;

  TColor32ARGBArray = array [0..0] of TColor32ARGB;
  PColor32ARGBArray = ^TColor32ARGBArray;


  { 32 bit Pixel (ARGB color) }

  TPixel32 = packed record
  case Integer of
   0: (ARGB: Cardinal);
   1: (B, G, R, A: Byte);
   2: (Bytes: array [0..3] of Byte);
  end;
  PPixel32 = ^TPixel32;

  TPixel32Array = array [0..0] of TPixel32;
  PPixel32Array = ^TPixel32Array;

const
  // Some predefined color constants
  pxBlack32     : TPixel32 = (ARGB : $FF000000);
  pxDarkGray32  : TPixel32 = (ARGB : $FF3F3F3F);
  pxGray32      : TPixel32 = (ARGB : $FF7F7F7F);
  pxLightGray32 : TPixel32 = (ARGB : $FFBFBFBF);
  pxWhite32     : TPixel32 = (ARGB : $FFFFFFFF);
  pxMaroon32    : TPixel32 = (ARGB : $FF7F0000);
  pxGreen32     : TPixel32 = (ARGB : $FF007F00);
  pxOlive32     : TPixel32 = (ARGB : $FF7F7F00);
  pxNavy32      : TPixel32 = (ARGB : $FF00007F);
  pxPurple32    : TPixel32 = (ARGB : $FF7F007F);
  pxTeal32      : TPixel32 = (ARGB : $FF007F7F);
  pxRed32       : TPixel32 = (ARGB : $FFFF0000);
  pxLime32      : TPixel32 = (ARGB : $FF00FF00);
  pxYellow32    : TPixel32 = (ARGB : $FFFFFF00);
  pxBlue32      : TPixel32 = (ARGB : $FF0000FF);
  pxFuchsia32   : TPixel32 = (ARGB : $FFFF00FF);
  pxAqua32      : TPixel32 = (ARGB : $FF00FFFF);

  pxSemiWhite32 : TPixel32 = (ARGB : $7FFFFFFF);
  pxSemiBlack32 : TPixel32 = (ARGB : $7F000000);
  pxSemiRed32   : TPixel32 = (ARGB : $7FFF0000);
  pxSemiGreen32 : TPixel32 = (ARGB : $7F00FF00);
  pxSemiBlue32  : TPixel32 = (ARGB : $7F0000FF);

function ConvertColor(Color: TColor): TPixel32; overload;
function ConvertColor(Color: TColor; Alpha: Byte): TPixel32; overload;
function ConvertColor(Color: TPixel32): TColor; overload;

{ Function Prototypes }

type
  TBlendMergePixel        = function(Foreground, Background: TPixel32): TPixel32;
  TBlendMergePixelInplace = procedure(Foreground: TPixel32; var Background: TPixel32);
  TBlendMergePixelLine    = procedure(Foreground: TPixel32; Destination: PPixel32; Count: Cardinal);
  TBlendMergeLine         = procedure(Source, Destination: PPixel32; Count: Cardinal);
  TCombinePixel           = function(Foreground, Background: TPixel32; Weight: Cardinal): TPixel32;
  TCombinePixelInplace    = procedure(Foreground: TPixel32; var Background: TPixel32; Weight: Integer);
  TCombinePixelLine       = procedure(Foreground: TPixel32; Destination: PPixel32; Count: Integer; Weight: Cardinal);
  TCombineLine            = procedure(Source, Destination: PPixel32; Count: Integer; Weight: Cardinal);


{ Function Pointers }

var
  BlendPixel          : TBlendMergePixel;
  BlendPixelInplace   : TBlendMergePixelInplace;
  BlendPixelLine      : TBlendMergePixelLine;
  BlendLine           : TBlendMergeLine;
  CombinePixel        : TCombinePixel;
  CombinePixelInplace : TCombinePixelInplace;
  CombinePixelLine    : TCombinePixelLine;
  CombineLine         : TCombineLine;
  EMMS                : procedure;
  MergePixel          : TBlendMergePixel;
  MergePixelInplace   : TBlendMergePixelInplace;
  MergePixelLine      : TBlendMergePixelLine;
  MergeLine           : TBlendMergeLine;


{ Binding Function Pointers }

var
  BindingBlendPixel          : TFunctionBinding;
  BindingBlendPixelInplace   : TFunctionBinding;
  BindingBlendPixelLine      : TFunctionBinding;
  BindingBlendLine           : TFunctionBinding;
  BindingCombinePixel        : TFunctionBinding;
  BindingCombinePixelInplace : TFunctionBinding;
  BindingCombinePixelLine    : TFunctionBinding;
  BindingCombineLine         : TFunctionBinding;
  BindingEMMS                : TFunctionBinding;
  BindingMergePixel          : TFunctionBinding;
  BindingMergePixelInplace   : TFunctionBinding;
  BindingMergePixelLine      : TFunctionBinding;
  BindingMergeLine           : TFunctionBinding;


{ Binding List }

var
  BindingBlend : TFunctionBindingList;

implementation

{$IFNDEF PUREPASCAL}
var
  BiasPointer: Pointer;
  AlphaPointer: Pointer;
  {$IFDEF AlternativeSSE2}
  ScaleBiasPointer: Pointer;
  {$ENDIF}
{$ENDIF}

const
  CBias = $00800080; // with this value the error is distributed equally

function ConvertColor(Color: TColor): TPixel32;
{$IFDEF WIN_COLOR_FIX}
var
  I: Longword;
{$ENDIF}
begin
  if Color < 0 then Color := GetSysColor(Color and $000000FF);

{$IFDEF WIN_COLOR_FIX}
  Result := $FF000000;
  I := (Color and $00FF0000) shr 16;
  if I <> 0 then Result := Result or TPixel32(Integer(I) - 1);
  I := Color and $0000FF00;
  if I <> 0 then Result := Result or TPixel32(Integer(I) - $00000100);
  I := Color and $000000FF;
  if I <> 0 then Result := Result or TPixel32(Integer(I) - 1) shl 16;
{$ELSE}
  asm
   MOV    EAX, Color
   BSWAP  EAX
   MOV    AL,  $FF
   ROR    EAX, 8
   MOV    Result, EAX
  end;
{$ENDIF}
end;

function ConvertColor(Color: TColor; Alpha: Byte): TPixel32;
begin
 Result := ConvertColor(Color);
 Result.A := Alpha;
end;

function ConvertColor(Color: TPixel32): TColor;
{$IFNDEF TARGET_x86}
begin
 Result := ((Color.ARGB and $00FF0000) shr 16) or
            (Color.ARGB and $0000FF00) or
           ((Color.ARGB and $000000FF) shl 16);
{$ELSE}
asm
 ROL    EAX, 8
 XOR    AL, AL
 BSWAP  EAX
{$ENDIF}
end;

function BlendPixelNative(Foreground, Background: TPixel32): TPixel32;
{$IFDEF PUREPASCAL}
var
  Alpha : Byte;
begin
 if Foreground.A =   0 then Result := Background else
 if Foreground.A = $FF then Result := Foreground else
  begin
   Alpha := (ForeGround.ARGB shr 24);
   ForeGround.ARGB := ((((Alpha * (ForeGround.ARGB and $00FF00FF)) + CBias)
     and $FF00FF00) shr 8) or ((Alpha * ((ForeGround.ARGB and $FF00FF00)
     shr 8) + CBias) and $FF00FF00);

   Alpha := Alpha xor $FF;

   Background.ARGB := ((((Alpha * (Background.ARGB and $00FF00FF)) + CBias)
     and $FF00FF00) shr 8) or ((Alpha * ((Background.ARGB and $FF00FF00)
     shr 8) + CBias) and $FF00FF00);

   Result.ARGB := (Background.ARGB + Foreground.ARGB) or $FF000000;
  end;
{$ELSE}
asm
  CMP     EAX, $FF000000
  JNC     @Done

  TEST    EAX, $FF000000
  JZ      @CopyPixel

  MOV     ECX, EAX
  SHR     ECX, 24

  PUSH    EBX

  MOV     EBX, EAX
  AND     EAX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EAX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EAX, CBias
  AND     EAX, $FF00FF00
  SHR     EAX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EAX, EBX

  XOR     ECX, $000000FF
  MOV     EBX, EDX
  AND     EDX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EDX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EDX, CBias
  AND     EDX, $FF00FF00
  SHR     EDX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EBX, EDX

  ADD     EAX, EBX
  OR      EAX, $FF000000

  POP     EBX
  RET

@CopyPixel:
  MOV     EAX, EDX
  OR      EAX, $FF000000

@Done:
  RET
{$ENDIF}
end;

procedure BlendPixelInplaceNative(Foreground: TPixel32; var Background: TPixel32);
{$IFDEF PUREPASCAL}
var
  Alpha : Byte;
begin
 if Foreground.A = 0 then Exit;

 if Foreground.A = $FF then
  begin
   Background := Foreground;
   Exit;
  end;

 Alpha := (ForeGround.ARGB shr 24);
 ForeGround.ARGB := ((((Alpha * (ForeGround.ARGB and $00FF00FF)) + CBias)
   and $FF00FF00) shr 8) or ((Alpha * ((ForeGround.ARGB and $FF00FF00)
   shr 8) + CBias) and $FF00FF00);

 Alpha := Alpha xor $FF;

 Background.ARGB := ((((Alpha * (Background.ARGB and $00FF00FF)) + CBias)
   and $FF00FF00) shr 8) or ((Alpha * ((Background.ARGB and $FF00FF00)
   shr 8) + CBias) and $FF00FF00);

 Background.ARGB := (Background.ARGB + Foreground.ARGB) or $FF000000;
{$ELSE}
asm
  TEST    EAX, $FF000000
  JZ      @Done

  MOV     ECX, EAX
  SHR     ECX, 24

  CMP     ECX, $FF
  JZ      @CopyPixel

  PUSH    EBX
  PUSH    ESI

  MOV     EBX, EAX
  AND     EAX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EAX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EAX, CBias
  AND     EAX, $FF00FF00
  SHR     EAX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EAX, EBX

  {$IFDEF CPUx86_64}
  MOV     ESI, [RDX]
  {$ELSE}
  MOV     ESI, [EDX]
  {$ENDIF}
  XOR     ECX, $000000FF
  MOV     EBX, ESI
  AND     ESI, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    ESI, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     ESI, CBias
  AND     ESI, $FF00FF00
  SHR     ESI, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EBX, ESI

  ADD     EAX, EBX
  OR      EAX, $FF000000
  {$IFDEF CPUx86_64}
  MOV     [RDX], EAX
  {$ELSE}
  MOV     [EDX], EAX
  {$ENDIF}

  POP     ESI
  POP     EBX
  RET

@CopyPixel:
  OR      EAX, $FF000000
  {$IFDEF CPUx86_64}
  MOV     [RDX], EAX
  {$ELSE}
  MOV     [EDX], EAX
  {$ENDIF}

@Done:
  RET
{$ENDIF}
end;

procedure BlendPixelLineNative(Foreground: TPixel32; Destination: PPixel32; Count: Integer);
{$IFDEF PUREPASCAL}
begin
 while Count > 0 do
  begin
   BlendPixelInplace(Foreground, Destination^);
   Inc(Destination);
   Dec(Count);
  end;
{$ELSE}
asm
  TEST    ECX, ECX
  JZ      @Done

  TEST    EAX, $FF000000
  JZ      @Done

  PUSH    EBX
  PUSH    ESI
  PUSH    EDI

  MOV     EDI, EDX

  MOV     ESI, EAX
  SHR     ESI, 24

  CMP     ESI, $FF
  JZ      @CopyPixel

  MOV     EBX, EAX
  AND     EAX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EAX, ESI
  SHR     EBX, 8
  IMUL    EBX, ESI
  ADD     EAX, CBias
  AND     EAX, $FF00FF00
  SHR     EAX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EAX, EBX
  XOR     ESI, $000000FF

@LoopStart:

  {$IFDEF CPUx86_64}
  MOV     EDX, [RDI]
  {$ELSE}
  MOV     EDX, [EDI]
  {$ENDIF}
  MOV     EBX, EDX
  AND     EDX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EDX, ESI
  SHR     EBX, 8
  IMUL    EBX, ESI
  ADD     EDX, CBias
  AND     EDX, $FF00FF00
  SHR     EDX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EBX, EDX

  ADD     EBX, EAX

  OR      EBX, $FF000000
  {$IFDEF CPUx86_64}
  MOV     [RDI], EBX
  {$ELSE}
  MOV     [EDI], EBX
  {$ENDIF}

@NextPixel:
  ADD     EDI, 4

  DEC     ECX
  JNZ     @LoopStart

  POP     EDI
  POP     ESI
  POP     EBX

@Done:
  RET

@CopyPixel:
  {$IFDEF CPUx86_64}
  MOV     [RDI], EAX
  {$ELSE}
  MOV     [EDI], EAX
  {$ENDIF}
  ADD     EDI, 4

  DEC     ECX
  JNZ     @CopyPixel

  POP     EDI
  POP     ESI
  POP     EBX
{$ENDIF}
end;

procedure BlendLineNative(Source, Destination: PPixel32; Count: Integer);
{$IFDEF PUREPASCAL}
begin
 while Count > 0 do
  begin
   BlendPixelInplace(Source^, Destination^);
   Inc(Source);
   Inc(Destination);
   Dec(Count);
  end;
{$ELSE}
asm
  TEST    ECX, ECX
  JZ      @Done

  PUSH    EBX
  PUSH    ESI
  PUSH    EDI

  MOV     ESI, EAX
  MOV     EDI, EDX

@LoopStart:
  {$IFDEF CPUx86_64}
  MOV     EAX, [RSI]
  {$ELSE}
  MOV     EAX, [ESI]
  {$ENDIF}
  TEST    EAX, $FF000000
  JZ      @NextPixel

  PUSH    ECX

  MOV     ECX, EAX
  SHR     ECX, 24

  CMP     ECX, $FF
  JZ      @CopyPixel

  MOV     EBX, EAX
  AND     EAX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EAX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EAX, CBias
  AND     EAX, $FF00FF00
  SHR     EAX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EAX, EBX

  {$IFDEF CPUx86_64}
  MOV     EDX, [RDI]
  {$ELSE}
  MOV     EDX, [EDI]
  {$ENDIF}
  XOR     ECX, $000000FF
  MOV     EBX, EDX
  AND     EDX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EDX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EDX, CBias
  AND     EDX, $FF00FF00
  SHR     EDX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EBX, EDX

  ADD     EAX, EBX
@CopyPixel:
  OR      EAX, $FF000000
  {$IFDEF CPUx86_64}
  MOV     [RDI], EAX
  {$ELSE}
  MOV     [EDI], EAX
  {$ENDIF}
  POP     ECX

@NextPixel:
  ADD     ESI, 4
  ADD     EDI, 4

  DEC     ECX
  JNZ     @LoopStart

  POP     EDI
  POP     ESI
  POP     EBX

@Done:
  RET
{$ENDIF}
end;

function CombinePixelNative(ForeGround, Background: TPixel32; Weight: Cardinal): TPixel32;
{$IFDEF PUREPASCAL}
begin
 if Weight = 0 then Result := Background else
 if Weight >= $FF then Result := ForeGround else
  begin
   ForeGround.ARGB := (((Weight * ((ForeGround.ARGB and $FF00FF00) shr 8)) +
     CBias) and $FF00FF00) + ((((Weight * (ForeGround.ARGB and $00FF00FF)) +
     CBias) and $FF00FF00) shr 8);

   Weight := Weight xor $000000FF;
   Background.ARGB := (((Weight * ((Background.ARGB and $FF00FF00) shr 8)) +
     CBias) and $FF00FF00) + ((((Weight * (Background.ARGB and $00FF00FF)) +
     CBias) and $FF00FF00) shr 8);

   Result.ARGB := Background.ARGB + Foreground.ARGB;
  end;
{$ELSE}
asm
  {$IFDEF CPUx86_64}
  JRCXZ   @Copy
  {$ELSE}
  JCXZ    @Copy
  {$ENDIF}

  CMP     ECX, $FF
  JE      @Done

  PUSH    EBX

  MOV     EBX, EAX
  AND     EAX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EAX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EAX, CBias
  AND     EAX, $FF00FF00
  SHR     EAX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EAX, EBX

  XOR     ECX, $000000FF
  MOV     EBX, EDX
  AND     EDX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EDX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EDX, CBias
  AND     EDX, $FF00FF00
  SHR     EDX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EBX, EDX

  ADD     EAX, EBX

  POP     EBX
  RET

@Copy:
  MOV     EAX, EDX
@Done:
  RET
{$ENDIF}
end;

procedure CombinePixelInplaceNative(ForeGround: TPixel32; var Background: TPixel32; Weight: Cardinal);
{$IFDEF PUREPASCAL}
begin
 if Weight = 0 then Exit else
 if Weight >= $FF then Background := ForeGround else
  begin
   ForeGround.ARGB := (((Weight * ((ForeGround.ARGB and $FF00FF00) shr 8)) +
     CBias) and $FF00FF00) + ((((Weight * (ForeGround.ARGB and $00FF00FF)) +
     CBias) and $FF00FF00) shr 8);

   Weight := Weight xor $000000FF;
   Background.ARGB := (((Weight * ((Background.ARGB and $FF00FF00) shr 8)) +
     CBias) and $FF00FF00) + ((((Weight * (Background.ARGB and $00FF00FF)) +
     CBias) and $FF00FF00) shr 8);

   Background.ARGB := Background.ARGB + Foreground.ARGB;
  end;
{$ELSE}
asm
  {$IFDEF CPUx86_64}
  JRCXZ   @Done
  {$ELSE}
  JCXZ    @Done
  {$ENDIF}

  CMP     ECX, $FF
  JZ      @Copy

  PUSH    EBX
  PUSH    ESI

  MOV     EBX, EAX
  AND     EAX, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    EAX, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     EAX, CBias
  AND     EAX, $FF00FF00
  SHR     EAX, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EAX, EBX

  MOV     ESI, [EDX]
  XOR     ECX, $000000FF
  MOV     EBX, ESI
  AND     ESI, $00FF00FF
  AND     EBX, $FF00FF00
  IMUL    ESI, ECX
  SHR     EBX, 8
  IMUL    EBX, ECX
  ADD     ESI, CBias
  AND     ESI, $FF00FF00
  SHR     ESI, 8
  ADD     EBX, CBias
  AND     EBX, $FF00FF00
  OR      EBX, ESI

  ADD     EAX, EBX

  MOV     [EDX], EAX

  POP     ESI
  POP     EBX
@Done:
  RET

@Copy:
  MOV     [EDX], EAX
  RET
{$ENDIF}
end;

procedure CombinePixelLineNative(Foreground: TPixel32; Destination: PPixel32;
  Count: Integer; Weight: Cardinal);
begin
 while Count > 0 do
  begin
   CombinePixelInplace(Foreground, Destination^, Weight);
   Inc(Destination);
   Dec(Count);
  end;
end;

procedure CombineLineNative(Source, Destination: PPixel32; Count: Integer;
  Weight: Cardinal);
{$IFDEF PUREPASCAL}
begin
 while Count > 0 do
  begin
   CombinePixelInplace(Source^, Destination^, Weight);
   Inc(Source);
   Inc(Destination);
   Dec(Count);
  end;
{$ELSE}
asm
  TEST      ECX, ECX
  JZ        @Done

  PUSH      EBX
  MOV       EBX, Weight

  TEST      EBX, EBX
  JZ        @LoopEnd        // weight is zero

  CMP       EBX, $FF
  JZ        @DoneMove       // weight = 255  =>  copy src to dst

  PUSH      EDI
  PUSH      ESI

@LoopStart:
  PUSH      EAX
  MOV       EDI, [EAX]
  AND       EAX, $00FF00FF
  AND       EDI, $FF00FF00
  IMUL      EAX, EBX
  SHR       EDI, 8
  IMUL      EDI, EBX
  ADD       EAX, CBias
  AND       EAX, $FF00FF00
  SHR       EAX, 8
  ADD       EDI, CBias
  AND       EDI, $FF00FF00
  OR        EAX, EDI

  MOV       ESI, [EDX]
  XOR       EBX, $000000FF
  MOV       EDI, ESI
  AND       ESI, $00FF00FF
  AND       EDI, $FF00FF00
  IMUL      ESI, EBX
  SHR       EDI, 8
  IMUL      EDI, EBX
  ADD       ESI, CBias
  AND       ESI, $FF00FF00
  SHR       ESI, 8
  ADD       EDI, CBias
  AND       EDI, $FF00FF00
  OR        EDI, ESI

  ADD       EAX, EDI

  MOV       [EDX], EAX

  POP       EAX
  ADD       EAX, 4
  ADD       EDX, 4

  DEC       ECX
  JNZ       @LoopStart

@LoopEnd:
  POP       ESI
  POP       EDI

  POP       EBX
  POP       EBP
@Done:
  RET       $0004

@DoneMove:
  SHL       ECX, 2
  CALL      Move
  POP       EBX
{$ENDIF}
end;

function MergePixelNative(Foreground, Background: TPixel32): TPixel32;
var
  Temp  : Integer;
  Scale : Integer;
begin
 if Foreground.A = $FF then Result := Foreground else
 if Foreground.A = $0  then Result := Background else
 if Background.A = $0  then Result := Foreground else
 if Background.A = $FF
  then Result := BlendPixel(Foreground, Background)
  else
   begin
    Temp := Sqr($FF) - (Foreground.A xor $FF) * (Background.A xor $FF);
    Result.A := (Temp + $80) shr 8;
    Scale := (Sqr($FF) * Foreground.A) div Temp;
    Result.R := Background.R + (Scale * ($FF + Foreground.R - Background.R) + $7F) shr 8 + 1 - Scale;
    Result.G := Background.G + (Scale * ($FF + Foreground.G - Background.G) + $7F) shr 8 + 1 - Scale;
    Result.B := Background.B + (Scale * ($FF + Foreground.B - Background.B) + $7F) shr 8 + 1 - Scale;
   end;
end;

procedure MergePixelInplaceNative(Foreground: TPixel32; var Background: TPixel32);
begin
 Background := MergePixelNative(Foreground, Background);
end;

procedure MergeLineNative(Source, Destination: PPixel32; Count: Cardinal);
begin
 while Count > 0 do
  begin
   Destination^ := MergePixel(Source^, Destination^);
   Inc(Source);
   Inc(Destination);
   Dec(Count);
  end;
end;

procedure EMMSNative;
begin
 // dummy
end;



{ MMX Functions }

{$IFNDEF PUREPASCAL}

procedure EMMSMMX;
asm
  EMMS
end;

function BlendPixelMMX(Foreground, Background: TPixel32): TPixel32;
asm
  MOVD      MM0, EAX
  PXOR      MM3, MM3
  MOVD      MM2, EDX
  PUNPCKLBW MM0, MM3
  MOV       ECX, BiasPointer
  PUNPCKLBW MM2, MM3
  MOVQ      MM1, MM0
  PUNPCKHWD MM1, MM1
  PSUBW     MM0, MM2
  PUNPCKHDQ MM1, MM1
  PSLLW     MM2, 8
  PMULLW    MM0, MM1
  PADDW     MM2, [ECX]
  PADDW     MM2, MM0
  PSRLW     MM2, 8
  PACKUSWB  MM2, MM3
  MOVD      EAX, MM2
end;

procedure BlendPixelInplaceMMX(Foreground: TPixel32; var Background: TPixel32);
asm
  TEST      EAX, $FF000000
  JZ        @Done
  CMP       EAX, $FF000000
  JNC       @Copy

  PXOR      MM3, MM3
  MOVD      MM0, EAX
  MOVD      MM2, [EDX]
  PUNPCKLBW MM0, MM3
  MOV       ECX, BiasPointer
  PUNPCKLBW MM2, MM3
  MOVQ      MM1, MM0
  PUNPCKHWD MM1, MM1
  PSUBW     MM0, MM2
  PUNPCKHDQ MM1, MM1
  PSLLW     MM2, 8
  PMULLW    MM0, MM1
  PADDW     MM2, [ECX]
  PADDW     MM2, MM0
  PSRLW     MM2, 8
  PACKUSWB  MM2, MM3
  MOVD      [EDX], MM2

@Done:
  RET

@Copy:
  MOV       [EDX], EAX
end;

procedure BlendLineMMX(Source, Destination: PPixel32; Count: Integer);
asm
  TEST      ECX, ECX
  JZ        @Done

  PUSH      ESI
  PUSH      EDI

  MOV       ESI, EAX
  MOV       EDI, EDX

@LoopStart:
  MOV       EAX, [ESI]
  TEST      EAX, $FF000000
  JZ        @NextPixel
  CMP       EAX, $FF000000
  JNC       @CopyPixel

  MOVD      MM0, EAX
  PXOR      MM3, MM3
  MOVD      MM2, [EDI]
  PUNPCKLBW MM0, MM3
  MOV       EAX, BiasPointer
  PUNPCKLBW MM2, MM3
  MOVQ      MM1, MM0
  PUNPCKHWD MM1, MM1
  PSUBW     MM0, MM2
  PUNPCKHDQ MM1, MM1
  PSLLW     MM2, 8
  PMULLW    MM0, MM1
  PADDW     MM2, [EAX]
  PADDW     MM2, MM0
  PSRLW     MM2, 8
  PACKUSWB  MM2, MM3
  MOVD      EAX, MM2

@CopyPixel:
  MOV       [EDI], EAX

@NextPixel:
  ADD       ESI, 4
  ADD       EDI, 4

  DEC       ECX
  JNZ       @LoopStart

  POP       EDI
  POP       ESI

@Done:
  RET
end;

function CombinePixelMMX(ForeGround, Background: TPixel32; Weight: TPixel32): TPixel32;
asm
  MOVD      MM1, EAX
  PXOR      MM0, MM0
  SHL       ECX, 4

  MOVD      MM2, EDX
  PUNPCKLBW MM1, MM0
  PUNPCKLBW MM2, MM0

  ADD       ECX, AlphaPointer

  PSUBW     MM1, MM2
  PMULLW    MM1, [ECX]
  PSLLW     MM2, 8

  MOV       ECX, BiasPointer

  PADDW     MM2, [ECX]
  PADDW     MM1, MM2
  PSRLW     MM1, 8
  PACKUSWB  MM1, MM0
  MOVD      EAX, MM1
end;

procedure CombinePixelInplaceMMX(F: TPixel32; var B: TPixel32; W: TPixel32);
asm
  {$IFDEF CPUx86_64}
  JRCXZ     @Done
  {$ELSE}
  JCXZ      @Done
  {$ENDIF}

  CMP       ECX, $FF
  JZ        @Copy

  MOVD      MM1, EAX
  PXOR      MM0, MM0

  SHL       ECX, 4

  MOVD      MM2, [EDX]
  PUNPCKLBW MM1, MM0
  PUNPCKLBW MM2, MM0

  ADD       ECX, AlphaPointer

  PSUBW     MM1, MM2
  PMULLW    MM1, [ECX]
  PSLLW     MM2, 8

  MOV       ECX, BiasPointer

  PADDW     MM2, [ECX]
  PADDW     MM1, MM2
  PSRLW     MM1, 8
  PACKUSWB  MM1, MM0
  MOVD      [EDX], MM1

@Done:
  RET

@Copy:
  MOV       [EDX], EAX
end;

procedure CombineLineMMX(Source, Destination: PPixel32; Count: Integer;
  Weight: Cardinal);
asm
  TEST      ECX, ECX
  JZ        @Done

  PUSH      EBX
  MOV       EBX, Weight

  TEST      EBX, EBX
  JZ        @LoopEnd        // weight is zero

  CMP       EBX, $FF
  JZ        @DoneMove       // weight = 255  =>  copy src to dst

  SHL       EBX, 4
  ADD       EBX, AlphaPointer
  MOVQ      MM3, [EBX]
  MOV       EBX, BiasPointer
  MOVQ      MM4, [EBX]

@LoopStart:
  MOVD      MM1, [EAX]
  PXOR      MM0, MM0
  MOVD      MM2, [EDX]
  PUNPCKLBW MM1, MM0
  PUNPCKLBW MM2, MM0

  PSUBW     MM1, MM2
  PMULLW    MM1, MM3
  PSLLW     MM2, 8

  PADDW     MM2, MM4
  PADDW     MM1, MM2
  PSRLW     MM1, 8
  PACKUSWB  MM1, MM0
  MOVD      [EDX], MM1

  ADD       EAX, 4
  ADD       EDX, 4

  DEC       ECX
  JNZ       @LoopStart
@LoopEnd:
  POP       EBX
  POP       EBP
@Done:
  RET       $0004

@DoneMove:
  SHL       ECX, 2
  CALL      Move
  POP       EBX
end;


{ SSE2 }

{$IFNDEF CPUx86_64}
function BlendPixelSSE2(Foreground, Background: TPixel32): TPixel32;
asm
{$IFDEF AlternativeSSE2}
  MOVD      XMM0, EAX         // XMM0 contains foreground
  PXOR      XMM3, XMM3        // XMM3 is zero
  PUNPCKLBW XMM0, XMM3        // stretch foreground
  MOVD      XMM1, EDX         // XMM1 contains background
  PUNPCKLWD XMM0, XMM3        // stretch foreground (even further)
  MOV       ECX,  ScaleBiasPointer
  PSHUFD    XMM2, XMM0, $FF   // XMM2 contains foreground alpha
  PUNPCKLBW XMM1, XMM3        // stretch background
  PMULLD    XMM2, [ECX]       // scale alpha
  PUNPCKLWD XMM1, XMM3        // stretch background (even further)
  PSUBD     XMM0, XMM1        // XMM0 = XMM0 - XMM1 (= foreground - background)
  PMULLD    XMM0, XMM2        // XMM0 = XMM0 * XMM2 (= alpha - (  "  )        )
  PSLLD     XMM1, 24          // shift left XMM1 (background)
  PADDD     XMM0, [ECX + $10] // add bias
  PADDD     XMM0, XMM1        // add background to weighted difference
  PSRLD     XMM0, 24          // shift right XMM0
  PACKUSWB  XMM0, XMM3        // pack data
  PACKUSWB  XMM0, XMM3        // pack data
  MOVD      EAX, XMM0         // return result

{$ELSE}

  MOVD      XMM0, EAX
  PXOR      XMM3, XMM3
  MOVD      XMM2, EDX
  PUNPCKLBW XMM0, XMM3
  MOV       ECX,  BiasPointer
  PUNPCKLBW XMM2, XMM3
  MOVQ      XMM1, XMM0
  PUNPCKLBW XMM1, XMM3
  PUNPCKHWD XMM1, XMM1
  PSUBW     XMM0, XMM2
  PUNPCKHDQ XMM1, XMM1
  PSLLW     XMM2, 8
  PMULLW    XMM0, XMM1
  PADDW     XMM2, [ECX]
  PADDW     XMM2, XMM0
  PSRLW     XMM2, 8
  PACKUSWB  XMM2, XMM3
  MOVD      EAX, XMM2
{$ENDIF}
end;

procedure BlendPixelInplaceSSE2(Foreground: TPixel32; var Background: TPixel32);
asm
  TEST      EAX, $FF000000
  JZ        @Done
  CMP       EAX, $FF000000
  JNC       @Copy

{$IFDEF AlternativeSSE2}
  MOVD      XMM0, EAX         // XMM0 contains foreground
  PXOR      XMM3, XMM3        // XMM3 is zero
  PUNPCKLBW XMM0, XMM3        // stretch foreground
  MOVD      XMM1, [EDX]       // XMM1 contains background
  PUNPCKLWD XMM0, XMM3        // stretch foreground (even further)
  MOV       ECX,  ScaleBiasPointer
  PSHUFD    XMM2, XMM0, $FF   // XMM2 contains foreground alpha
  PUNPCKLBW XMM1, XMM3        // stretch background
  PMULLD    XMM2, [ECX]       // scale alpha
  PUNPCKLWD XMM1, XMM3        // stretch background (even further)
  PSUBD     XMM0, XMM1        // XMM0 = XMM0 - XMM1 (= foreground - background)
  PMULLD    XMM0, XMM2        // XMM0 = XMM0 * XMM2 (= alpha - (  "  )        )
  PSLLD     XMM1, 24          // shift left XMM1 (background)
  PADDD     XMM0, [ECX + $10] // add bias
  PADDD     XMM0, XMM1        // add background to weighted difference
  PSRLD     XMM0, 24          // shift right XMM0
  PACKUSWB  XMM0, XMM3        // pack data
  PACKUSWB  XMM0, XMM3        // pack data
  MOVD      [EDX], XMM0       // return result

{$ELSE}

  PXOR      XMM3, XMM3
  MOVD      XMM0, EAX
  MOVD      XMM2, [EDX]
  PUNPCKLBW XMM0, XMM3
  MOV       ECX,  BiasPointer
  PUNPCKLBW XMM2, XMM3
  MOVQ      XMM1, XMM0
  PUNPCKLBW XMM1, XMM3
  PUNPCKHWD XMM1, XMM1
  PSUBW     XMM0, XMM2
  PUNPCKHDQ XMM1, XMM1
  PSLLW     XMM2, 8
  PMULLW    XMM0, XMM1
  PADDW     XMM2, [ECX]
  PADDW     XMM2, XMM0
  PSRLW     XMM2, 8
  PACKUSWB  XMM2, XMM3
  MOVD      [EDX], XMM2
{$ENDIF}

@Done:
  RET

@Copy:
  MOV       [EDX], EAX
end;

procedure BlendPixelLineSSE2(Foreground: TPixel32; Destination: PPixel32; Count: Integer);
asm
  TEST      ECX, ECX
  JZ        @Done

  TEST      EAX, $FF000000
  JZ        @Done

  PUSH      EBX

  MOV       EBX, EAX
  SHR       EBX, 24

  CMP       EBX, $FF
  JZ        @CopyPixel

{$IFDEF AlternativeSSE2}
  MOVD      XMM4, EAX         // XMM4 contains foreground
  PXOR      XMM3, XMM3        // XMM3 is zero
  PUNPCKLBW XMM4, XMM3        // stretch foreground
  PUNPCKLWD XMM4, XMM3        // stretch foreground (even further)
  MOV       EBX,  ScaleBiasPointer
  PSHUFD    XMM5, XMM4, $FF   // XMM2 contains foreground alpha
  PMULLD    XMM5, [EBX]       // scale alpha

@LoopStart:
  MOVD      XMM1, [EDX]       // XMM1 contains background
  PUNPCKLBW XMM1, XMM3        // stretch background
  PUNPCKLWD XMM1, XMM3        // stretch background (even further)
  MOVDQA    XMM0, XMM4        // XMM0 = stretched foreground
  PSUBD     XMM0, XMM1        // XMM0 = XMM0 - XMM1 (= foreground - background)
  PMULLD    XMM0, XMM5        // XMM0 = XMM0 * XMM2 (= alpha - (  "  )        )
  PSLLD     XMM1, 24          // shift left XMM1 (background)
  PADDD     XMM0, [EBX + $10] // add bias
  PADDD     XMM0, XMM1        // add background to weighted difference
  PSRLD     XMM0, 24          // shift right XMM0
  PACKUSWB  XMM0, XMM3        // pack data
  PACKUSWB  XMM0, XMM3        // pack data
  MOVD      [EDX], XMM0       // return result

{$ELSE}

  MOVD      XMM4, EAX
  PXOR      XMM3, XMM3
  PUNPCKLBW XMM4, XMM3
  MOV       EBX,  BiasPointer

@LoopStart:

  MOVD      XMM2, [EDX]
  PUNPCKLBW XMM2, XMM3
  MOVQ      XMM1, XMM4
  PUNPCKLBW XMM1, XMM3
  PUNPCKHWD XMM1, XMM1
  MOVQ      XMM0, XMM4
  PSUBW     XMM0, XMM2
  PUNPCKHDQ XMM1, XMM1
  PSLLW     XMM2, 8
  PMULLW    XMM0, XMM1
  PADDW     XMM2, [EBX]
  PADDW     XMM2, XMM0
  PSRLW     XMM2, 8
  PACKUSWB  XMM2, XMM3
  MOVD      [EDX], XMM2

{$ENDIF}

@NextPixel:
  ADD     EDX, 4

  DEC     ECX
  JNZ     @LoopStart

  POP     EBX

@Done:
  RET

@CopyPixel:
  {$IFDEF CPUx86_64}
  MOV     [RDX], EAX
  {$ELSE}
  MOV     [EDX], EAX
  {$ENDIF}
  ADD     EDX, 4

  DEC     ECX
  JNZ     @CopyPixel

  POP     EBX
end;

procedure BlendLineSSE2(Source, Destination: PPixel32; Count: Integer);
asm
  TEST      ECX, ECX
  JZ        @Done

  PUSH      ESI
  PUSH      EDI

  MOV       ESI, EAX
  MOV       EDI, EDX

@LoopStart:
  MOV       EAX, [ESI]
  TEST      EAX, $FF000000
  JZ        @NextPixel
  CMP       EAX, $FF000000
  JNC       @CopyPixel

  MOVD      XMM0, EAX
  PXOR      XMM3, XMM3
  MOVD      XMM2, [EDI]
  PUNPCKLBW XMM0, XMM3
  MOV       EAX,  BiasPointer
  PUNPCKLBW XMM2, XMM3
  MOVQ      XMM1, XMM0
  PUNPCKLBW XMM1, XMM3
  PUNPCKHWD XMM1, XMM1
  PSUBW     XMM0, XMM2
  PUNPCKHDQ XMM1, XMM1
  PSLLW     XMM2, 8
  PMULLW    XMM0, XMM1
  PADDW     XMM2, [EAX]
  PADDW     XMM2, XMM0
  PSRLW     XMM2, 8
  PACKUSWB  XMM2, XMM3
  MOVD      EAX,  XMM2

@CopyPixel:
  MOV       [EDI], EAX

@NextPixel:
  ADD       ESI, 4
  ADD       EDI, 4

  DEC       ECX
  JNZ       @LoopStart

  POP       EDI
  POP       ESI

@Done:
  RET
end;
{$ENDIF}

function CombinePixelSSE2(ForeGround, Background: TPixel32; Weight: TPixel32): TPixel32;
asm
  MOVD      XMM1, EAX
  PXOR      XMM0, XMM0
  SHL       ECX, 4

  MOVD      XMM2, EDX
  PUNPCKLBW XMM1, XMM0
  PUNPCKLBW XMM2, XMM0

  ADD       ECX, AlphaPointer

  PSUBW     XMM1, XMM2
  PMULLW    XMM1, [ECX]
  PSLLW     XMM2, 8

  MOV       ECX, BiasPointer

  PADDW     XMM2, [ECX]
  PADDW     XMM1, XMM2
  PSRLW     XMM1, 8
  PACKUSWB  XMM1, XMM0
  MOVD      EAX, XMM1
end;

procedure CombinePixelInplaceSSE2(F: TPixel32; var B: TPixel32; W: TPixel32);
asm
  {$IFDEF CPUx86_64}
  JRCXZ   @Done
  {$ELSE}
  JCXZ    @Done
  {$ENDIF}

  CMP       ECX, $FF
  JZ        @Copy

  MOVD      XMM1, EAX
  PXOR      XMM0, XMM0

  SHL       ECX, 4

  MOVD      XMM2, [EDX]
  PUNPCKLBW XMM1, XMM0
  PUNPCKLBW XMM2, XMM0

  ADD       ECX, AlphaPointer

  PSUBW     XMM1, XMM2
  PMULLW    XMM1, [ECX]
  PSLLW     XMM2, 8

  MOV       ECX, BiasPointer

  PADDW     XMM2, [ECX]
  PADDW     XMM1, XMM2
  PSRLW     XMM1, 8
  PACKUSWB  XMM1, XMM0
  MOVD      [EDX], XMM1

@Done:
  RET

@Copy:
  MOV       [EDX], EAX
end;

{$IFNDEF CPUx86_64}
procedure CombineLineSSE2(Source, Destination: PPixel32; Count: Integer;
  Weight: Cardinal);
asm
  TEST      ECX, ECX
  JZ        @Done

  PUSH      EBX
  MOV       EBX, Weight

  TEST      EBX, EBX
  JZ        @LoopEnd

  CMP       EBX, $FF
  JZ        @DoneMove

  SHL       EBX, 4
  ADD       EBX, AlphaPointer
  MOVQ      XMM3, [EBX]
  MOV       EBX, BiasPointer
  MOVQ      XMM4, [EBX]

@LoopStart:
  MOVD      XMM1, [EAX]
  PXOR      XMM0, XMM0
  MOVD      XMM2, [EDX]
  PUNPCKLBW XMM1, XMM0
  PUNPCKLBW XMM2, XMM0

  PSUBW     XMM1, XMM2
  PMULLW    XMM1, XMM3
  PSLLW     XMM2, 8

  PADDW     XMM2, XMM4
  PADDW     XMM1, XMM2
  PSRLW     XMM1, 8
  PACKUSWB  XMM1, XMM0
  MOVD      [EDX], XMM1

  ADD       EAX, 4
  ADD       EDX, 4

  DEC       ECX
  JNZ       @LoopStart
@LoopEnd:
  POP       EBX
  POP       EBP
@Done:
  RET       $0004

@DoneMove:
  SHL       ECX, 2
  CALL      Move
  POP       EBX
end;

function MergePixelSSE2(Foreground, Background: TPixel32): TPixel32;
asm
  TEST      EAX, $FF000000  // foreground completely transparent =>
  JZ        @CopyPixel      // result = background
  CMP       EAX, $FF000000  // foreground completely opaque =>
  JNC       @Done           // result = foreground
  TEST      EDX, $FF000000  // background completely transparent =>
  JZ        @Done           // result = foreground

  PXOR      XMM7, XMM7      // XMM7  <-  00 00 00 00 00 00 00 00
  MOVD      XMM0, EAX       // XMM0  <-  00 00 00 00 Fa Fr Fg Fb
  SHR       EAX, 24         //  EAX  <-  00 00 00 Fa
  ROR       EDX, 24
  MOVZX     ECX, DL         //  ECX  <-  00 00 00 Ba
  PUNPCKLBW XMM0, XMM7      // XMM0  <-  00 Fa 00 Fr 00 Fg 00 Fb
  SUB       EAX, $FF        //  EAX  <-  (Fa - 1)
  XOR       ECX, $FF        //  ECX  <-  (1 - Ba)
  IMUL      ECX, EAX        //  ECX  <-  (Fa - 1) * (1 - Ba)  =  Ra - 1
  IMUL      ECX, $8081      //  ECX  <-  Xa 00 00 00
  ADD       ECX, $8081*$FF*$FF
  SHR       ECX, 15         //  ECX  <-  Ra
  MOV       DL, CH          //  EDX  <-  Br Bg Bb Ra
  ROR       EDX, 8          //  EDX  <-  Ra Br Bg Bb
  MOVD      XMM1, EDX       // XMM1  <-  Ra Br Bg Bb
  PUNPCKLBW XMM1, XMM7      // XMM1  <-  00 Ra 00 Br 00 Bg 00 Bb
  SHL       EAX, 20         //  EAX  <-  Fa 00 00
  PSUBW     XMM0, XMM1      // XMM0  <-  ** Da ** Dr ** Dg ** Db
  ADD       EAX, $0FF01000
  PSLLW     XMM0, 4
  XOR       EDX, EDX        //  EDX  <-  00
  DIV       EAX, ECX        //  EAX  <-  Fa / Ra  =  Wa
  MOVD      XMM4, EAX       // XMM3  <-  Wa
  PSHUFLW   XMM4, XMM4, $C0 // XMM3  <-  00 00 ** Wa ** Wa ** Wa
  PMULHW    XMM0, XMM4      // XMM0  <-  00 00 ** Pr ** Pg ** Pb
  PADDW     XMM0, XMM1      // XMM0  <-  00 Ra 00 Rr 00 Rg 00 Rb
  PACKUSWB  XMM0, XMM7      // XMM0  <-  Ra Rr Rg Rb
  MOVD      EAX, XMM0

  RET

@CopyPixel:
  MOV       EAX, EDX

@Done:
end;
{$ENDIF}


{$ENDIF}


{ Global Functions }

procedure CreateTables;
{$IFNDEF PUREPASCAL}
var
  I : Integer;
  L : Longword;
  P : ^Longword;
{$ENDIF}
begin
 {$IFNDEF PUREPASCAL}
 GetAlignedMemory(AlphaPointer, 256 * 8 * SizeOf(Cardinal));

 P := AlphaPointer;
 for I := 0 to 255 do
  begin
   L := I + I shl 16;
   P^ := L;
   Inc(P);
   P^ := L;
   Inc(P);
   P^ := L;
   Inc(P);
   P^ := L;
   Inc(P);
  end;
 BiasPointer := Pointer(Integer(AlphaPointer) + $FF * 4 * SizeOf(Cardinal));
 Assert(PCardinal(BiasPointer)^ = $00FF00FF);

 {$IFDEF AlternativeSSE2}
 GetAlignedMemory(ScaleBiasPointer, 8 * SizeOf(Cardinal));
 P := ScaleBiasPointer;
 for I := 0 to 3 do
  begin
   P^ := $10101;
   Inc(P);
  end;
 for I := 0 to 3 do
  begin
   P^ := $800000;
   Inc(P);
  end;
 {$ENDIF}
 {$ENDIF}
end;

procedure FreeTables;
begin
 {$IFNDEF PUREPASCAL}
 BiasPointer := nil;
 FreeAlignedMemory(AlphaPointer);
 {$IFDEF AlternativeSSE2}
 FreeAlignedMemory(ScaleBiasPointer);
 {$ENDIF}
 {$ENDIF}
end;

procedure BindFunctions;
begin
 // create function binding list for 32-bit float conversions
 BindingBlend := TFunctionBindingList.Create;

 // create function binding for EMMS procedure
 BindingEMMS := TFunctionBinding.Create(@@EMMS, @EMMSNative);
 BindingBlend.AddBinding(BindingEMMS);
 with BindingEMMS do
  begin
   Add(@EMMSNative);
   {$IFNDEF PUREPASCAL}
   Add(@EMMSMMX, [pfMMX]);
   Add(@EMMSNative, [pfSSE2]);
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for blend register
 BindingBlendPixel := TFunctionBinding.Create(
   @@BlendPixel, @BlendPixelNative);
 BindingBlend.AddBinding(BindingBlendPixel);
 with BindingBlendPixel do
  begin
   Add(@BlendPixelNative);
   {$IFNDEF PUREPASCAL}
   Add(@BlendPixelMMX, [pfMMX]);
   {$IFNDEF CPUx86_64}
   Add(@BlendPixelSSE2, [pfSSE2]);
   {$ENDIF}
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for blend memory
 BindingBlendPixelInplace := TFunctionBinding.Create(
   @@BlendPixelInplace, @BlendPixelInplaceNative);
 BindingBlend.AddBinding(BindingBlendPixelInplace);
 with BindingBlendPixelInplace do
  begin
   Add(@BlendPixelInplaceNative);
   {$IFNDEF PUREPASCAL}
   Add(@BlendPixelInplaceMMX, [pfMMX]);
   {$IFNDEF CPUx86_64}
   Add(@BlendPixelInplaceSSE2, [pfSSE2]);
   {$ENDIF}
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for blend line
 BindingBlendPixelLine := TFunctionBinding.Create(
   @@BlendPixelLine, @BlendPixelLineNative);
 BindingBlend.AddBinding(BindingBlendPixelLine);
 with BindingBlendPixelLine do
  begin
   Add(@BlendPixelLineNative);
   {$IFNDEF PUREPASCAL}
   Add(@BlendPixelLineSSE2, [pfSSE2]);
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for blend line
 BindingBlendLine := TFunctionBinding.Create(
   @@BlendLine, @BlendLineNative);
 BindingBlend.AddBinding(BindingBlendLine);
 with BindingBlendLine do
  begin
   Add(@BlendLineNative);
   {$IFNDEF PUREPASCAL}
   Add(@BlendLineMMX, [pfMMX]);
   {$IFNDEF CPUx86_64}
   Add(@BlendLineSSE2, [pfSSE2]);
   {$ENDIF}
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for combine register
 BindingCombinePixel := TFunctionBinding.Create(
   @@CombinePixel, @CombinePixelNative);
 BindingBlend.AddBinding(BindingCombinePixel);
 with BindingCombinePixel do
  begin
   Add(@CombinePixelNative);
   {$IFNDEF PUREPASCAL}
   Add(@CombinePixelMMX, [pfMMX]);
   Add(@CombinePixelSSE2, [pfSSE2]);
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for combine memory
 BindingCombinePixelInplace := TFunctionBinding.Create(
   @@CombinePixelInplace, @CombinePixelInplaceNative);
 BindingBlend.AddBinding(BindingCombinePixelInplace);
 with BindingCombinePixelInplace do
  begin
   Add(@CombinePixelInplaceNative);
   {$IFNDEF PUREPASCAL}
   Add(@CombinePixelInplaceMMX, [pfMMX]);
   Add(@CombinePixelInplaceSSE2, [pfSSE2]);
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for combine memory
 BindingCombinePixelLine := TFunctionBinding.Create(
   @@CombinePixelLine, @CombinePixelLineNative);
 BindingBlend.AddBinding(BindingCombinePixelLine);
 with BindingCombinePixelLine do
  begin
   Add(@CombinePixelLineNative);
   RebindProcessorSpecific;
  end;

 // create function binding for combine line
 BindingCombineLine := TFunctionBinding.Create(
   @@CombineLine, @CombineLineNative);
 BindingBlend.AddBinding(BindingCombineLine);
 with BindingCombineLine do
  begin
   Add(@CombineLineNative);
   {$IFNDEF PUREPASCAL}
   Add(@CombineLineMMX, [pfMMX]);
   {$IFNDEF CPUx86_64}
   Add(@CombineLineSSE2, [pfSSE2]);
   {$ENDIF}
   {$ENDIF}
   RebindProcessorSpecific;
  end;

 // create function binding for combine register
 BindingMergePixel := TFunctionBinding.Create(
   @@MergePixel, @MergePixelNative);
 BindingBlend.AddBinding(BindingMergePixel);
 with BindingMergePixel do
  begin
   Add(@MergePixelNative);
   RebindProcessorSpecific;
  end;

 // create function binding for Merge memory
 BindingMergePixelInplace := TFunctionBinding.Create(
   @@MergePixelInplace, @MergePixelInplaceNative);
 BindingBlend.AddBinding(BindingMergePixelInplace);
 with BindingMergePixelInplace do
  begin
   Add(@MergePixelInplaceNative);
   RebindProcessorSpecific;
  end;

 // create function binding for Merge line
 BindingMergeLine := TFunctionBinding.Create(
   @@MergeLine, @MergeLineNative);
 BindingBlend.AddBinding(BindingMergeLine);
 with BindingMergeLine do
  begin
   Add(@MergeLineNative);
   RebindProcessorSpecific;
  end;

 // processor specific rebind
 BindingBlend.RebindProcessorSpecific;
end;

procedure UnbindFunctions;
begin
 BindingBlend.Free;
 BindingBlend := nil;
end;

initialization
  CreateTables;
  BindFunctions;

finalization
  FreeTables;
  UnbindFunctions;

end.

