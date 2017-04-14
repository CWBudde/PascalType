unit PT_Bitmap;

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
  {$IFDEF FPC} LCLIntf, LCLType, {$IFDEF MSWINDOWS} Windows, {$ENDIF}
  {$IFDEF DARWIN} MacOSAll, CarbonCanvas, CarbonPrivate, {$ENDIF}
  {$IFDEF GTK} {$IFDEF LCLGtk2}gdk2, gtk2, gdk2pixbuf, glib2, {$ELSE} gdk, gtk,
  gdkpixbuf, glib, gtkdef, {$ENDIF} {$ENDIF} {$ELSE} Windows, Messages, {$ENDIF}
  Graphics, Classes, Controls, SysUtils, PT_Types, PT_Classes, PT_Pixels;

type
  TPtCustomMap = class(TInterfacedPersistent, IStreamPersist)
  private
    function GetClientRect: TRect;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
  protected
    FDataSize: Integer;
    FWidth: Integer;
    FHeight: Integer;
    FOnChange: TNotifyEvent;
    FOnResize: TNotifyEvent;

    function Empty: Boolean; virtual;
    procedure Changed; virtual;
    procedure Resized; virtual;
    procedure SizeChangedAtOnce; virtual;

    procedure ReadData(Stream: TStream); virtual; abstract;
    procedure WriteData(Stream: TStream); virtual; abstract;

    procedure HeightChanged(UpdateBitmap: Boolean = True); virtual; abstract;
    procedure WidthChanged(UpdateBitmap: Boolean = True); virtual; abstract;
  public
    constructor Create; virtual;

    procedure Clear; virtual; abstract;
    procedure PaintTo(Canvas: TCanvas); overload; virtual;
    procedure PaintTo(Canvas: TCanvas; X, Y: Integer); overload;
      virtual; abstract;
    procedure PaintTo(Canvas: TCanvas; Rect: TRect; X: Integer = 0;
      Y: Integer = 0); overload; virtual; abstract;

    procedure LoadFromFile(const Filename: TFileName); virtual;
    procedure SaveToFile(const Filename: TFileName); virtual;
    procedure LoadFromStream(Stream: TStream); virtual; abstract;
    procedure SaveToStream(Stream: TStream); virtual; abstract;

    procedure SetSize(Width, Height: Integer); virtual;
    procedure Resize(Width, Height: Integer); virtual; abstract;
    procedure Turn(CounterClockwise: Boolean = False); virtual; abstract;

    property ClientRect: TRect read GetClientRect;
    property Height: Integer read FHeight write SetHeight;
    property Width: Integer read FWidth write SetWidth;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;

  IPixel32Access = interface(IInterface)
    ['{5CF0D35F-E4E6-46E2-A313-ACD9906544B0}']
    function GetDataPointer: PPixel32Array;
    function GetPixel(X, Y: Integer): TPixel32;
    function GetPixelPointer(X, Y: Integer): PPixel32;
    function GetScanLine(Y: Integer): PPixel32Array;
    procedure SetPixel(X, Y: Integer; const Value: TPixel32);

    property DataPointer: PPixel32Array read GetDataPointer;
    property Pixel[X, Y: Integer]: TPixel32 read GetPixel write SetPixel;
    property PixelPointer[X, Y: Integer]: PPixel32 read GetPixelPointer;
    property ScanLine[Y: Integer]: PPixel32Array read GetScanLine;
  end;

  TPtCustomBitmap = class(TPtCustomMap, IPixel32Access)
  private
    function GetDataPointer: PPixel32Array;
    function GetPixel(X, Y: Integer): TPixel32;
    function GetPixelPointer(X, Y: Integer): PPixel32;
    function GetScanLine(Y: Integer): PPixel32Array;
    procedure SetPixel(X, Y: Integer; const Value: TPixel32);
  protected
    FDataPointer: PPixel32Array;
    FBitmapInfo: TBitmapInfo;
    procedure HeightChanged(UpdateBitmap: Boolean = True); override;
    procedure WidthChanged(UpdateBitmap: Boolean = True); override;

    procedure AssignTo(Dest: TPersistent); override;
    function Equal(PixelMap: TPtCustomBitmap): Boolean;

    procedure ReadData(Stream: TStream); override;
    procedure WriteData(Stream: TStream); override;
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create; override;

    procedure Clear; overload; override;
    procedure Clear(Color: TColor); reintroduce; overload; virtual;
    procedure Clear(Color: TPixel32); reintroduce; overload; virtual;

    procedure MakeOpaque; virtual;
    procedure ResetAlpha(Value: Byte = 0); virtual;

    procedure Draw(Bitmap: TBitmap); overload; virtual;
    procedure Draw(Bitmap: TBitmap; X, Y: Integer); overload; virtual; abstract;
    procedure Draw(PixelMap: TPtCustomBitmap; Alpha: Byte = $FF);
      overload; virtual;
    procedure Draw(PixelMap: TPtCustomBitmap; X, Y: Integer); overload; virtual;
    procedure Draw(PixelMap: TPtCustomBitmap; X, Y: Integer; Alpha: Byte);
      overload; virtual;
    procedure DrawTransparent(PixelMap: TPtCustomBitmap); overload; virtual;
    procedure DrawTransparent(PixelMap: TPtCustomBitmap; X, Y: Integer);
      overload; virtual;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    // simple painting functions
    procedure FillRect(Rect: TRect; Color: TPixel32); overload;
    procedure FillRect(Left, Top, Right, Bottom: Integer;
      Color: TPixel32); overload;
    procedure FrameRect(Rect: TRect; Color: TPixel32);
    procedure Line(FromX, FromY, ToX, ToY: Integer; Color: TPixel32);
    procedure HorizontalLine(FromX, ToX, Y: Integer; Color: TPixel32);
    procedure VerticalLine(X, FromY, ToY: Integer; Color: TPixel32);
    procedure Assign(Source: TPersistent); override;
    function Equals(Obj: TObject): Boolean; {$IFDEF DELPHI14_UP} override;
    {$ENDIF}
    property DataPointer: PPixel32Array read GetDataPointer;
    property Pixel[X, Y: Integer]: TPixel32 read GetPixel write SetPixel;
    property PixelPointer[X, Y: Integer]: PPixel32 read GetPixelPointer;
    property ScanLine[Y: Integer]: PPixel32Array read GetScanLine;
  end;

  TPtPixelMapMemory = class(TPtCustomBitmap)
  protected
    procedure AllocateDataPointer; virtual;
    procedure HeightChanged(UpdateBitmap: Boolean = True); override;
    procedure WidthChanged(UpdateBitmap: Boolean = True); override;
    procedure SizeChangedAtOnce; override;
  public
    destructor Destroy; override;

    procedure PaintTo(Canvas: TCanvas; X, Y: Integer); override;
    procedure PaintTo(Canvas: TCanvas; Rect: TRect; X: Integer = 0;
      Y: Integer = 0); override;
    procedure Draw(Bitmap: TBitmap; X, Y: Integer); override;

    procedure Resize(Width: Integer; Height: Integer); override;
    procedure Turn(CounterClockwise: Boolean = False); override;
  published
    property Width;
    property Height;
    property OnChange;
    property OnResize;
  end;

implementation

uses
  Math, PT_MemoryUtils;

resourcestring
  RCStrNoDibHandle = 'Can''t allocate the DIB handle';
  RCStrNoCompatibleDC = 'Can''t create compatible DC';
  RCStrNoSelectedDC = 'Can''t select an object into DC';
  RCStrHeightMayNotBeNegative = 'Height may not be negative!';
  RCStrWidthMayNotBeNegative = 'Width may not be negative!';
  RCStrInvalidBitmapHeader = 'Invalid bitmap header found!';
{$IFDEF Darwin}
  RCStrCouldntCreateGenericProfile = 'Couldn''t create the generic profile';
  RCStrCouldntCreateGenericColorSpace =
    'Couldn''t create the generic RGB color space';
{$ENDIF}


{ TPtCustomMap }

constructor TPtCustomMap.Create;
begin
  inherited;
  FDataSize := 0;
  FWidth := 0;
  FHeight := 0;
  FOnChange := nil;
  FOnResize := nil;
end;

procedure TPtCustomMap.SaveToFile(const Filename: TFileName);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(Filename, fmCreate);
  try
    SaveToStream(Stream);
  finally
    FreeAndNil(Stream);
  end;
end;

procedure TPtCustomMap.SetHeight(const Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create(RCStrHeightMayNotBeNegative);

  if FHeight <> Value then
  begin
    FHeight := Value;
    HeightChanged;
  end;
end;

procedure TPtCustomMap.SetSize(Width, Height: Integer);
begin
  if Width < 0 then
    raise Exception.Create(RCStrWidthMayNotBeNegative);
  if Height < 0 then
    raise Exception.Create(RCStrHeightMayNotBeNegative);

  if (FWidth <> Width) or (FHeight <> Height) then
  begin
    FWidth := Width;
    FHeight := Height;
    SizeChangedAtOnce;
  end;
end;

procedure TPtCustomMap.SetWidth(const Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create(RCStrWidthMayNotBeNegative);

  if FWidth <> Value then
  begin
    FWidth := Value;
    WidthChanged;
  end;
end;

procedure TPtCustomMap.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TPtCustomMap.Resized;
begin
  if Assigned(FOnResize) then
    FOnResize(Self);
  Changed;
end;

procedure TPtCustomMap.SizeChangedAtOnce;
begin
  HeightChanged(False);
  WidthChanged(False);
  Resized;
end;

function TPtCustomMap.Empty: Boolean;
begin
  Result := FDataSize = 0;
end;

function TPtCustomMap.GetClientRect: TRect;
begin
  Result := Rect(0, 0, Width, Height);
end;

procedure TPtCustomMap.LoadFromFile(const Filename: TFileName);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    FreeAndNil(Stream);
  end;
end;

procedure TPtCustomMap.PaintTo(Canvas: TCanvas);
begin
  PaintTo(Canvas, 0, 0);
end;


{ TPtCustomBitmap }

constructor TPtCustomBitmap.Create;
begin
  inherited;
  FDataPointer := nil;
  FDataSize := 0;

  // initialize header
  FillChar(FBitmapInfo.bmiHeader, SizeOf(TBitmapInfoHeader), 0);
  with FBitmapInfo.bmiHeader do
  begin
    biSize := SizeOf(TBitmapInfoHeader);
    biBitCount := 32;
    biPlanes := 1;
    biCompression := BI_RGB;
  end;
end;

procedure TPtCustomBitmap.Draw(PixelMap: TPtCustomBitmap; X, Y: Integer);
var
  ClipRect: TRect;
  Index   : Integer;
begin
  with ClipRect do
  begin
    Left := X;
    if Left < 0 then
      Left := 0;
    Top := Y;
    if Top < 0 then
      Top := 0;
    Right := X + PixelMap.Width;
    if Right > Self.Width then
      Right := Self.Width;
    Bottom := Y + PixelMap.Height;
    if Bottom > Self.Height then
      Bottom := Self.Height;

    // blend scanlines
    for Index := Top to Bottom - 1 do
      BlendLine(PixelMap.PixelPointer[Left - X, Index - Y],
        PixelPointer[Left, Index], Right - Left);
    EMMS;
  end;
end;

procedure TPtCustomBitmap.Draw(PixelMap: TPtCustomBitmap; X, Y: Integer;
  Alpha: Byte);
var
  ClipRect: TRect;
  Index   : Integer;
begin
  with ClipRect do
  begin
    Left := X;
    if Left < 0 then
      Left := 0;
    Top := Y;
    if Top < 0 then
      Top := 0;
    Right := X + PixelMap.Width;
    if Right > Self.Width then
      Right := Self.Width;
    Bottom := Y + PixelMap.Height;
    if Bottom > Self.Height then
      Bottom := Self.Height;

    // combine scanlines
    for Index := Top to Bottom - 1 do
      CombineLine(PixelMap.PixelPointer[Left - X, Index - Y],
        PixelPointer[Left, Index], Right - Left, Alpha);
    EMMS;
  end;
end;

procedure TPtCustomBitmap.DrawTransparent(PixelMap: TPtCustomBitmap);
begin
  DrawTransparent(PixelMap, 0, 0);
end;

procedure TPtCustomBitmap.DrawTransparent(PixelMap: TPtCustomBitmap;
  X, Y: Integer);
var
  ClipRect: TRect;
  Index   : Integer;
begin
  with ClipRect do
  begin
    Left := X;
    if Left < 0 then
      Left := 0;
    Top := Y;
    if Top < 0 then
      Top := 0;
    Right := X + PixelMap.Width;
    if Right > Self.Width then
      Right := Self.Width;
    Bottom := Y + PixelMap.Height;
    if Bottom > Self.Height then
      Bottom := Self.Height;

    // blend scanlines
    for Index := Top to Bottom - 1 do
      BlendLine(PixelMap.PixelPointer[Left - X, Index - Y],
        PixelPointer[Left, Index], Right - Left);
  end;
end;

procedure TPtCustomBitmap.Draw(PixelMap: TPtCustomBitmap; Alpha: Byte = $FF);
begin
  Draw(PixelMap, 0, 0, Alpha);
end;

procedure TPtCustomBitmap.Assign(Source: TPersistent);
var
  TempBitmap: TBitmap;
begin
  if Source is TPtCustomBitmap then
    with TPtCustomBitmap(Source) do
    begin
      Self.SetSize(Width, Height);
      Self.FBitmapInfo := FBitmapInfo;

      Assert(Self.FDataSize = FDataSize);
      System.Move(FDataPointer^, Self.FDataPointer^, FDataSize);

      Self.FOnChange := FOnChange;
      Self.FOnResize := FOnResize;
    end
  else if Source is TBitmap then
    with TBitmap(Source) do
    begin
      Self.SetSize(Width, Height);
      Draw(TBitmap(Source));
      if Assigned(FOnChange) then
        FOnChange(Self);
    end
  else if Source is TGraphic then
    with TGraphic(Source) do
    begin
      Self.SetSize(Width, Height);
      TempBitmap := TBitmap.Create;
      try
        TempBitmap.Assign(Source);
        Draw(TempBitmap);
        if Assigned(FOnChange) then
          FOnChange(Self);
      finally
        if Assigned(TempBitmap) then
          FreeAndNil(TempBitmap);
      end;
    end
  else
    inherited;
end;

procedure TPtCustomBitmap.AssignTo(Dest: TPersistent);
begin
  if Dest is TPtCustomBitmap then
    with TPtCustomBitmap(Dest) do
    begin
      SetSize(Self.Width, Self.Height);
      FBitmapInfo := Self.FBitmapInfo;

      Assert(FDataSize = Self.FDataSize);
      System.Move(Self.FDataPointer^, FDataPointer^, FDataSize);

      FOnChange := Self.FOnChange;
      FOnResize := Self.FOnResize;
    end
  else
    inherited;
end;

procedure TPtCustomBitmap.Draw(Bitmap: TBitmap);
begin
  Draw(Bitmap, 0, 0);
end;

procedure TPtCustomBitmap.Clear;
begin
  FillChar(FDataPointer^, FDataSize, 0);
end;

procedure TPtCustomBitmap.Clear(Color: TPixel32);
var
  Index: Integer;
begin
  for Index := 0 to FWidth * FHeight - 1 do
    FDataPointer^[Index] := Color;
end;

procedure TPtCustomBitmap.Clear(Color: TColor);
begin
  Clear(ConvertColor(Color));
end;

function TPtCustomBitmap.GetDataPointer: PPixel32Array;
begin
  Result := FDataPointer;
end;

function TPtCustomBitmap.GetPixel(X, Y: Integer): TPixel32;
begin
  Result := FDataPointer^[Y * Width + X];
end;

function TPtCustomBitmap.GetPixelPointer(X, Y: Integer): PPixel32;
begin
  Result := @FDataPointer^[Y * Width + X];
end;

function TPtCustomBitmap.GetScanLine(Y: Integer): PPixel32Array;
begin
  Result := @FDataPointer^[Y * Width];
end;

procedure TPtCustomBitmap.SetPixel(X, Y: Integer; const Value: TPixel32);
begin
  BlendPixelInplace(Value, FDataPointer[Y * Width + X]);
end;

procedure TPtCustomBitmap.HeightChanged(UpdateBitmap: Boolean = True);
begin
  FBitmapInfo.bmiHeader.biHeight := -FHeight;
  if UpdateBitmap then
    Resized;
end;

procedure TPtCustomBitmap.WidthChanged(UpdateBitmap: Boolean = True);
begin
  FBitmapInfo.bmiHeader.biWidth := FWidth;
  if UpdateBitmap then
    Resized;
end;

procedure TPtCustomBitmap.LoadFromStream(Stream: TStream);
var
  BitmapFileHeader: TBitmapFileHeader;
  BitmapInfo      : TBitmapInfo;
  Bitmap          : TBitmap;
begin
  with Stream do
  begin
    if Size < SizeOf(TBitmapFileHeader) then
      raise Exception.Create(RCStrInvalidBitmapHeader);

    Read(BitmapFileHeader, SizeOf(TBitmapFileHeader));

    if BitmapFileHeader.bfType <> $4D42 then
      raise Exception.Create(RCStrInvalidBitmapHeader);

    Read(BitmapInfo, SizeOf(TBitmapInfo));

    if BitmapInfo.bmiHeader.biBitCount = 32 then
    begin

    end
    else
    begin
      Stream.Seek(-(SizeOf(TBitmapFileHeader) + SizeOf(TBitmapInfo)),
        soFromCurrent);
      Bitmap := TBitmap.Create;
      try
        Bitmap.LoadFromStream(Stream);
        Self.Assign(Bitmap);
      finally
        FreeAndNil(Bitmap);
      end;
    end;
  end;
end;

procedure TPtCustomBitmap.MakeOpaque;
begin
  ResetAlpha($FF);
end;

procedure TPtCustomBitmap.SaveToStream(Stream: TStream);
var
  BitmapFileHeader: TBitmapFileHeader;
begin
  with Stream do
  begin
    // initialize bitmap file header
    FillChar(BitmapFileHeader, SizeOf(BitmapFileHeader), 0);
    with BitmapFileHeader do
    begin
      bfType := $4D42;
      bfSize := SizeOf(TBitmapInfo) + Width * Height * SizeOf(Cardinal);
      bfOffBits := SizeOf(BitmapFileHeader) + SizeOf(TBitmapInfo);
    end;

    // write bitmap file header to stream
    Write(BitmapFileHeader, SizeOf(TBitmapFileHeader));

    // write bitmap file header to stream
    Write(FBitmapInfo, SizeOf(TBitmapInfo));

    Write(FDataPointer^, Width * Height * SizeOf(Cardinal));
  end;
end;

function TPtCustomBitmap.Equal(PixelMap: TPtCustomBitmap): Boolean;
begin
  Result := (PixelMap.Width = FWidth) and (PixelMap.Height = FHeight);

  if Result then
    Result := CompareMem(FDataPointer, PixelMap.FDataPointer, FDataSize);
end;

function TPtCustomBitmap.Equals(Obj: TObject): Boolean;
begin
{$IFDEF DELPHI14_UP}
  Result := inherited Equals(Obj);
{$ELSE}
  Result := False;
{$ENDIF}
  if Obj is TPtCustomBitmap then
    Result := Equal(TPtCustomBitmap(Obj));
end;

procedure TPtCustomBitmap.ReadData(Stream: TStream);
var
  TempWidth, TempHeight: Integer;
begin
  with Stream do
    try
      ReadBuffer(TempWidth, 4);
      ReadBuffer(TempHeight, 4);
      SetSize(TempWidth, TempHeight);
      Assert(FDataSize = FWidth * FHeight * SizeOf(TPixel32));
      ReadBuffer(FDataPointer^, FDataSize);
    finally
      Changed;
    end;
end;

procedure TPtCustomBitmap.WriteData(Stream: TStream);
begin
  with Stream do
  begin
    WriteBuffer(FWidth, 4);
    WriteBuffer(FHeight, 4);
    Assert(FDataSize = FWidth * FHeight * SizeOf(TPixel32));
    WriteBuffer(FDataPointer^, FDataSize);
  end;
end;

procedure TPtCustomBitmap.DefineProperties(Filer: TFiler);
var
  HasData: Boolean;
begin
  HasData := (FDataSize > 0);
  if HasData and (Filer.Ancestor <> nil) then
    HasData := not((Filer.Ancestor is TPtCustomBitmap) and
      Equal(TPtCustomBitmap(Filer.Ancestor)));

  Filer.DefineBinaryProperty('Data', ReadData, WriteData, HasData);
end;

procedure TPtCustomBitmap.FillRect(Rect: TRect; Color: TPixel32);
var
  X, Y: Integer;
begin
  if Color.A = $FF then
    for Y := Rect.Top to Rect.Bottom - 1 do
      for X := Rect.Left to Rect.Right - 1 do
        FDataPointer[Y * Width + X] := Color
  else
    try
      for Y := Rect.Top to Rect.Bottom - 1 do
        BlendPixelLine(Color, @FDataPointer[Y * Width + Rect.Left],
          Rect.Right - Rect.Left);
    finally
      EMMS;
    end;
end;

procedure TPtCustomBitmap.FillRect(Left, Top, Right, Bottom: Integer;
  Color: TPixel32);
var
  X, Y: Integer;
begin
  if Color.A = $FF then
    for Y := Top to Bottom - 1 do
      for X := Left to Right - 1 do
        FDataPointer[Y * Width + X] := Color
  else
    try
      for Y := Top to Bottom - 1 do
        BlendPixelLine(Color, @FDataPointer[Y * Width + Left], Right - Left);
    finally
      EMMS;
    end;
end;

procedure TPtCustomBitmap.FrameRect(Rect: TRect; Color: TPixel32);
begin
  // top & bottom
  HorizontalLine(Rect.Left, Rect.Right, Rect.Top, Color);
  HorizontalLine(Rect.Left, Rect.Right, Rect.Bottom - 1, Color);

  // left & right
  VerticalLine(Rect.Left, Rect.Top + 1, Rect.Bottom - 1, Color);
  VerticalLine(Rect.Right - 1, Rect.Top + 1, Rect.Bottom - 1, Color);
end;

procedure TPtCustomBitmap.VerticalLine(X, FromY, ToY: Integer; Color: TPixel32);
var
  Y: Integer;
begin
  try
    if ToY < FromY then
      for Y := ToY to FromY - 1 do
        BlendPixelInplace(Color, FDataPointer[Y * Width + X])
    else
      for Y := FromY to ToY - 1 do
        BlendPixelInplace(Color, FDataPointer[Y * Width + X]);
  finally
    EMMS;
  end;
end;

procedure TPtCustomBitmap.HorizontalLine(FromX, ToX, Y: Integer;
  Color: TPixel32);
var
  X: Integer;
begin
  try
    if ToX < FromX then
      for X := ToX to FromX - 1 do
        BlendPixelInplace(Color, FDataPointer[Y * Width + X])
    else
      for X := FromX to ToX - 1 do
        BlendPixelInplace(Color, FDataPointer[Y * Width + X])
  finally
    EMMS;
  end;
end;

procedure TPtCustomBitmap.Line(FromX, FromY, ToX, ToY: Integer;
  Color: TPixel32);
var
  X, Y, t    : Integer;
  dx, dy     : Integer;
  incx, incy : Integer;
  pdx, pdy   : Integer;
  ddx, ddy   : Integer;
  es, el, err: Integer;
begin
  if FromY = ToY then
    HorizontalLine(FromX, ToX, FromY, Color)
  else if FromX = ToX then
    VerticalLine(FromX, FromY, ToY, Color)
  else
    try
      dx := ToX - FromX;
      dy := ToY - FromY;

      incx := Sign(dx);
      incy := Sign(dy);
      if (dx < 0) then
        dx := -dx;
      if (dy < 0) then
        dy := -dy;

      if (dx > dy) then
      begin
        pdx := incx;
        pdy := 0;
        ddx := incx;
        ddy := incy;
        es := dy;
        el := dx;
      end
      else
      begin
        pdx := 0;
        pdy := incy;
        ddx := incx;
        ddy := incy;
        es := dx;
        el := dy;
      end;

      X := FromX;
      Y := FromY;
      err := el shr 1;
      BlendPixelInplace(Color, FDataPointer[Y * Width + X]);

      for t := 1 to el - 1 do
      begin
        err := err - es;
        if (err < 0) then
        begin
          err := err + el;
          X := X + ddx;
          Y := Y + ddy;
        end
        else
        begin
          X := X + pdx;
          Y := Y + pdy;
        end;
        BlendPixelInplace(Color, FDataPointer[Y * Width + X]);
      end;
    finally
      EMMS;
    end;
end;

procedure TPtCustomBitmap.ResetAlpha(Value: Byte = 0);
var
  Index: Integer;
begin
  for Index := 0 to FWidth * FHeight - 1 do
    FDataPointer^[Index].A := Value;
end;


{ TPtPixelMapMemory }

destructor TPtPixelMapMemory.Destroy;
begin
  FreeAlignedMemory(FDataPointer);
  inherited;
end;

procedure TPtPixelMapMemory.Draw(Bitmap: TBitmap; X, Y: Integer);
var
  IndexX: Integer;
  IndexY: Integer;
  // Data24 : PRGB24Array;
begin
  (*
    if (Bitmap.Height <> 0) and (FDataPointer <> nil) then
    begin
    {$IFNDEF FPC}
    case Bitmap.PixelFormat of
    pf32bit :
    for IndexY := 0 to Bitmap.Height - 1 do
    begin
    Move(Bitmap.ScanLine[IndexY]^, FDataPointer^[X + (Y + IndexY) * Width],
    Bitmap.Width * SizeOf(TPixel32));
    end;

    pf24bit :
    for IndexY := 0 to Bitmap.Height - 1 do
    begin
    Data24 := Bitmap.ScanLine[IndexY];

    for IndexX := 0 to Bitmap.Width - 1 do
    begin
    FDataPointer^[X + IndexX + (Y + IndexY) * Width].R := Data24^[IndexX].R;
    FDataPointer^[X + IndexX + (Y + IndexY) * Width].G := Data24^[IndexX].G;
    FDataPointer^[X + IndexX + (Y + IndexY) * Width].B := Data24^[IndexX].B;
    FDataPointer^[X + IndexX + (Y + IndexY) * Width].A := $FF;
    end;
    end;
    else
    {$ELSE}
    begin
    {$ENDIF}
    if GetDIBits(Bitmap.Canvas.Handle, Bitmap.Handle, 0, Bitmap.Height,
    @FDataPointer^[X + Y * Width], FBitmapInfo, DIB_RGB_COLORS) = 0
    then raise Exception.Create('Error');
    end;
    end;
  *)
end;

{$IFDEF MSWINDOWS}

procedure TPtPixelMapMemory.PaintTo(Canvas: TCanvas; X, Y: Integer);
var
  Bitmap       : HBITMAP;
  DeviceContext: HDC;
  Buffer       : Pointer;
  OldObject    : HGDIOBJ;
begin
  if SetDIBitsToDevice(Canvas.Handle, X, Y, Width, Height, 0, 0, 0, Height,
    FDataPointer, FBitmapInfo, DIB_RGB_COLORS) = 0 then
  begin
    // create compatible device context
    DeviceContext := CreateCompatibleDC(Canvas.Handle);
    if DeviceContext <> 0 then
      try
        Bitmap := CreateDIBSection(DeviceContext, FBitmapInfo, DIB_RGB_COLORS,
          Buffer, 0, 0);

        if Bitmap <> 0 then
        begin
          OldObject := SelectObject(DeviceContext, Bitmap);
          try
            Move(FDataPointer^, Buffer^, Width * Height * SizeOf(Cardinal));
            BitBlt(Canvas.Handle, X, Y, Width, Height, DeviceContext, 0,
              0, SRCCOPY);
          finally
            if OldObject <> 0 then
              SelectObject(DeviceContext, OldObject);
            DeleteObject(Bitmap);
          end;
        end;
      finally
        DeleteDC(DeviceContext);
      end;
  end;
end;
{$ENDIF}

procedure TPtPixelMapMemory.PaintTo(Canvas: TCanvas; Rect: TRect;
  X: Integer = 0; Y: Integer = 0);
var
  Bitmap       : HBITMAP;
  DeviceContext: HDC;
  Buffer       : Pointer;
  OldObject    : HGDIOBJ;
  H, W         : Integer;
begin
{$IFDEF MSWINDOWS}
  W := Min(Width, Rect.Right - Rect.Left);
  H := Min(Height, Rect.Bottom - Rect.Top);
  if SetDIBitsToDevice(Canvas.Handle, X, Y, W, H, Rect.Left, Rect.Top, 0,
    Height, FDataPointer, FBitmapInfo, DIB_RGB_COLORS) = 0 then
  begin
    // create compatible device context
    DeviceContext := CreateCompatibleDC(Canvas.Handle);
    if DeviceContext <> 0 then
      try
        Bitmap := CreateDIBSection(DeviceContext, FBitmapInfo, DIB_RGB_COLORS,
          Buffer, 0, 0);

        if Bitmap <> 0 then
        begin
          OldObject := SelectObject(DeviceContext, Bitmap);
          try
            Move(FDataPointer^, Buffer^, Width * Height * SizeOf(Cardinal));
            BitBlt(Canvas.Handle, X, Y, W, H, DeviceContext, Rect.Left,
              Rect.Top, SRCCOPY);
          finally
            if OldObject <> 0 then
              SelectObject(DeviceContext, OldObject);
            DeleteObject(Bitmap);
          end;
        end;
      finally
        DeleteDC(DeviceContext);
      end;
  end;
{$ENDIF}
end;

procedure TPtPixelMapMemory.HeightChanged(UpdateBitmap: Boolean);
begin
  inherited;
  if UpdateBitmap then
    AllocateDataPointer;
end;

procedure TPtPixelMapMemory.WidthChanged(UpdateBitmap: Boolean);
begin
  inherited;
  if UpdateBitmap then
    AllocateDataPointer;
end;

procedure TPtPixelMapMemory.SizeChangedAtOnce;
begin
  inherited;
  AllocateDataPointer;
end;

procedure TPtPixelMapMemory.Resize(Width, Height: Integer);
var
  NewSize : Integer;
  NewData : PPixel32Array;
  TempData: PPixel32Array;
  Y, Wdth : Integer;
begin
  inherited;
  if (Width <> FWidth) or (Height <> FHeight) then
  begin
    NewSize := Width * Height * SizeOf(TPixel32);
    GetAlignedMemory(Pointer(NewData), NewSize);

    Wdth := Min(Width, FWidth);
    for Y := 0 to Min(Height, FHeight) - 1 do
      Move(FDataPointer^[Y * FWidth], NewData^[Y * Width],
        Wdth * SizeOf(TPixel32));

    // set new width (not thread safe!)
    FWidth := Width;
    FHeight := Height;
    FBitmapInfo.bmiHeader.biWidth := Width;
    FBitmapInfo.bmiHeader.biHeight := -Height;

    // exchange data pointer
    TempData := FDataPointer;
    FDataPointer := NewData;
    FDataSize := NewSize;

    // dispose old data pointer
    FreeAlignedMemory(TempData);
  end;
end;

procedure TPtPixelMapMemory.Turn(CounterClockwise: Boolean);
var
  TurnData: PPixel32Array;
  TempData: PPixel32Array;
  X, Y    : Integer;
begin
  inherited;
  GetAlignedMemory(Pointer(TurnData), FDataSize);

  // perform turn
  if CounterClockwise then
    for Y := 0 to FHeight - 1 do
      for X := 0 to FWidth - 1 do
        TurnData^[(FWidth - 1 - X) * FHeight + Y] :=
          FDataPointer^[Y * FWidth + X]
  else
    for Y := 0 to FHeight - 1 do
      for X := 0 to FWidth - 1 do
        TurnData^[X * FHeight + FHeight - 1 - Y] :=
          FDataPointer^[Y * FWidth + X];

  // exchange width and height
  with FBitmapInfo do
  begin
    bmiHeader.biWidth := FHeight;
    bmiHeader.biHeight := -FWidth;
    FWidth := bmiHeader.biWidth;
    FHeight := -bmiHeader.biHeight;
  end;

  // exchange data pointer
  TempData := FDataPointer;
  FDataPointer := TurnData;

  // dispose old data pointer
  FreeAlignedMemory(TempData);
end;

procedure TPtPixelMapMemory.AllocateDataPointer;
var
  NewDataSize: Integer;
begin
  NewDataSize := FWidth * FHeight * SizeOf(TPixel32);
  if FDataSize <> NewDataSize then
  begin
    FDataSize := NewDataSize;
    Assert(FDataSize >= 0);
    ReallocateAlignedMemory(Pointer(FDataPointer), FDataSize);
    Clear;
  end;
end;

end.
