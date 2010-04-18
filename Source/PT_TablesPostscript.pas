unit PT_TablesPostscript;

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
  Classes, Contnrs, SysUtils, PT_Types, PT_Classes, PT_Tables;

type
  TCustomPascalTypePostscriptIndexTable = class(TCustomPascalTypeTable)
  protected
    procedure ReadData(Index: Integer; Stream: TStream); virtual; abstract;
    procedure WriteData(Index: Integer; Stream: TStream); virtual; abstract;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

  TPascalTypePostscriptNameIndexTable = class(TCustomPascalTypePostscriptIndexTable)
  private
    FFontNames : array of string;
    function GetFontName(Index: Integer): string;
    function GetFontNameCount: Integer;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;

    procedure ReadData(Index: Integer; Stream: TStream); override;
    procedure WriteData(Index: Integer; Stream: TStream); override;

    property FontName[Index: Integer]: string read GetFontName;
    property FontNameCount: Integer read GetFontNameCount;
  end;

  TPascalTypePostscriptStringIndexTable = class(TCustomPascalTypePostscriptIndexTable)
  private
    FStrings : array of string;
    function GetString(Index: Integer): string;
    function GetStringCount: Integer;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;

    procedure ReadData(Index: Integer; Stream: TStream); override;
    procedure WriteData(Index: Integer; Stream: TStream); override;

    property StringItem[Index: Integer]: string read GetString;
    property StringCount: Integer read GetStringCount;
  end;

  TCustomPascalTypePostscriptDictOperator = class(TPersistent)
  protected
    class function GetOperator: Byte; virtual; abstract;
    procedure AssignTo(Dest: TPersistent); override;
  public
    property DictOperator: Byte read GetOperator;
  end;
  TPascalTypePostscriptDictOperatorClass = class of TCustomPascalTypePostscriptDictOperator;

  TCustomPascalTypePostscriptDictOperand = class(TPersistent)
  protected
    function GetAsInteger: Integer; virtual; abstract;
    function GetAsString: string; virtual; abstract;
    function GetAsSingle: Single; virtual; abstract;
  public
    property AsInteger: Integer read GetAsInteger;
    property AsSingle: Single read GetAsSingle;
    property AsString: string read GetAsString;
  end;

  TPascalTypePostscriptDictPair = class(TCustomPascalTypeTable)
  private
    FOperands     : array of TCustomPascalTypePostscriptDictOperand;
    FDictOperator : TCustomPascalTypePostscriptDictOperator;
    function GetOperand(Index: Integer): TCustomPascalTypePostscriptDictOperand;
    function GetOperandCount: Integer;
    procedure ClearOperands;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure ResetToDefaults; override;
  public
    destructor Destroy; override;
    procedure AddOperand(Operand: TCustomPascalTypePostscriptDictOperand);

    property DictOperator: TCustomPascalTypePostscriptDictOperator read FDictOperator write FDictOperator;
    property OperandCount: Integer read GetOperandCount;
    property Operand[Index: Integer]: TCustomPascalTypePostscriptDictOperand read GetOperand;
  end;

  TPascalTypePostscriptDictDataTable = class(TCustomPascalTypeTable)
  private
    FData : array of TPascalTypePostscriptDictPair;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
    function GetStringIndex(const Index: Integer): Integer;
  public
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property VersionStringIndex: Integer index 0 read GetStringIndex;
    property NoticeStringIndex: Integer index 1 read GetStringIndex;
    property FullNameStringIndex: Integer index 2 read GetStringIndex;
    property FamilyNameStringIndex: Integer index 3 read GetStringIndex;
    property WeightStringIndex: Integer index 4 read GetStringIndex;

//    property CopyrightStringIndex: Integer read GetStringIndex;
  end;

  TPascalTypePostscriptTopDictIndexTable = class(TCustomPascalTypePostscriptIndexTable)
  private
    FDict : array of TPascalTypePostscriptDictDataTable;
    procedure ClearDict;
    function GetStringIndex(Index: Integer; DictIndex: Integer): Integer;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;

    procedure ReadData(Index: Integer; Stream: TStream); override;
    procedure WriteData(Index: Integer; Stream: TStream); override;
  public
    destructor Destroy; override;

    property VersionStringIndex[DictIndex: Integer]: Integer index 0 read GetStringIndex;
    property NoticeStringIndex[DictIndex: Integer]: Integer index 1 read GetStringIndex;
    property FullNameStringIndex[DictIndex: Integer]: Integer index 2 read GetStringIndex;
    property FamilyNameStringIndex[DictIndex: Integer]: Integer index 3 read GetStringIndex;
    property WeightStringIndex[DictIndex: Integer]: Integer index 4 read GetStringIndex;
  end;

  TPascalTypeCompactFontFormatTable = class(TCustomPascalTypeNamedTable)
  private
    FVersionMajor : Byte; // Format major version (starting at 1)
    FVersionMinor : Byte; // Format minor version (starting at 0)
    FOffSize      : Byte; // Absolute offset(0) size
    FNameTable    : TPascalTypePostscriptNameIndexTable;
    FTopDictTable : TPascalTypePostscriptTopDictIndexTable;
    FStringTable  : TPascalTypePostscriptStringIndexTable;
    FGlobalTable  : TPascalTypePostscriptStringIndexTable;
    procedure SetVersionMajor(const Value: Byte);
    procedure SetVersionMinor(const Value: Byte);
    function GetFontName: string;
    function GetFamilyNameString: string;
    function GetFullNameString: string;
    function GetNoticeString: string;
    function GetVersionString: string;
    function GetWeightStringIndex: string;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
    procedure VersionChanged; virtual;
  public
    constructor Create(Storage: IPascalTypeStorageTable); override;
    destructor Destroy; override;

    class function GetTableType: TTableType; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;

    property VersionMajor: Byte read FVersionMajor write SetVersionMajor;
    property VersionMinor: Byte read FVersionMinor write SetVersionMinor;
    property FontName: string read GetFontName;

    property VersionString: string read GetVersionString;
    property NoticeString: string read GetNoticeString;
    property FullNameString: string read GetFullNameString;
    property FamilyNameString: string read GetFamilyNameString;
    property WeightStringIndex: string read GetWeightStringIndex;
  end;

  TVertOriginYMetrics = packed record
    GlyphIndex  : Word;     // Glyph index.
    VertOriginY : SmallInt; // Y coordinate, in the font's design coordinate system, of the vertical origin of glyph with index glyphIndex.
  end;

  TPascalTypeVerticalOriginTable = class(TCustomPascalTypeNamedTable)
  private
    FMajorVersion       : Word;     // Major version (starting at 1). Set to 1.
    FMinorVersion       : Word;     // Minor version (starting at 0). Set to 0.
    FDefaultVertOriginY : SmallInt; // The y coordinate of a glyph's vertical origin, in the font's design coordinate system, to be used if no entry is present for the glyph in the vertOriginYMetrics array.
    FVertOriginYMetrics : array of TVertOriginYMetrics;
  protected
    procedure ResetToDefaults; override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    class function GetTableType: TTableType; override;

    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
  end;

// operators
procedure RegisterOperator(OperatorClass: TPascalTypePostscriptDictOperatorClass);
procedure RegisterOperators(OperatorClasses: array of TPascalTypePostscriptDictOperatorClass);
function FindOperatorByEncoding(Encoding: Byte): TPascalTypePostscriptDictOperatorClass;

implementation

uses
  PT_ResourceStrings, PT_TablesPostscriptOperators, PT_TablesPostscriptOperands;

var
  GOperatorClasses : array of TPascalTypePostscriptDictOperatorClass;

function GetStandardString(Index: Word): string;
begin
 case Index of
    0 : Result := '.notdef';
    1 : Result := 'space';
    2 : Result := 'exclam';
    3 : Result := 'quotedbl';
    4 : Result := 'numbersign';
    5 : Result := 'dollar';
    6 : Result := 'percent';
    7 : Result := 'ampersand';
    8 : Result := 'quoteright';
    9 : Result := 'parenleft';
   10 : Result := 'parenright';
   11 : Result := 'asterisk';
   12 : Result := 'plus';
   13 : Result := 'comma';
   14 : Result := 'hyphen';
   15 : Result := 'period';
   16 : Result := 'slash';
   17 : Result := 'zero';
   18 : Result := 'one';
   19 : Result := 'two';
   20 : Result := 'three';
   21 : Result := 'four';
   22 : Result := 'five';
   23 : Result := 'six';
   24 : Result := 'seven';
   25 : Result := 'eight';
   26 : Result := 'nine';
   27 : Result := 'colon';
   28 : Result := 'semicolon';
   29 : Result := 'less';
   30 : Result := 'equal';
   31 : Result := 'greater';
   32 : Result := 'question';
   33 : Result := 'at';
   34 : Result := 'A';
   35 : Result := 'B';
   36 : Result := 'C';
   37 : Result := 'D';
   38 : Result := 'E';
   39 : Result := 'F';
   40 : Result := 'G';
   41 : Result := 'H';
   42 : Result := 'I';
   43 : Result := 'J';
   44 : Result := 'K';
   45 : Result := 'L';
   46 : Result := 'M';
   47 : Result := 'N';
   48 : Result := 'O';
   49 : Result := 'P';
   50 : Result := 'Q';
   51 : Result := 'R';
   52 : Result := 'S';
   53 : Result := 'T';
   54 : Result := 'U';
   55 : Result := 'V';
   56 : Result := 'W';
   57 : Result := 'X';
   58 : Result := 'Y';
   59 : Result := 'Z';
   60 : Result := 'bracketleft';
   61 : Result := 'backslash';
   62 : Result := 'bracketright';
   63 : Result := 'asciicircum';
   64 : Result := 'underscore';
   65 : Result := 'quoteleft';
   66 : Result := 'a';
   67 : Result := 'b';
   68 : Result := 'c';
   69 : Result := 'd';
   70 : Result := 'e';
   71 : Result := 'f';
   72 : Result := 'g';
   73 : Result := 'h';
   74 : Result := 'i';
   75 : Result := 'j';
   76 : Result := 'k';
   77 : Result := 'l';
   78 : Result := 'm';
   79 : Result := 'n';
   80 : Result := 'o';
   81 : Result := 'p';
   82 : Result := 'q';
   83 : Result := 'r';
   84 : Result := 's';
   85 : Result := 't';
   86 : Result := 'u';
   87 : Result := 'v';
   88 : Result := 'w';
   89 : Result := 'x';
   90 : Result := 'y';
   91 : Result := 'z';
   92 : Result := 'braceleft';
   93 : Result := 'bar';
   94 : Result := 'braceright';
   95 : Result := 'asciitilde';
   96 : Result := 'exclamdown';
   97 : Result := 'cent';
   98 : Result := 'sterling';
   99 : Result := 'fraction';
  100 : Result := 'yen';
  101 : Result := 'florin';
  102 : Result := 'section';
  103 : Result := 'currency';
  104 : Result := 'quotesingle';
  105 : Result := 'quotedblleft';
  106 : Result := 'guillemotleft';
  107 : Result := 'guilsinglleft';
  108 : Result := 'guilsinglright';
  109 : Result := 'fi';
  110 : Result := 'fl';
  111 : Result := 'endash';
  112 : Result := 'dagger';
  113 : Result := 'daggerdbl';
  114 : Result := 'periodcentered';
  115 : Result := 'paragraph';
  116 : Result := 'bullet';
  117 : Result := 'quotesinglbase';
  118 : Result := 'quotedblbase';
  119 : Result := 'quotedblright';
  120 : Result := 'guillemotright';
  121 : Result := 'ellipsis';
  122 : Result := 'perthousand';
  123 : Result := 'questiondown';
  124 : Result := 'grave';
  125 : Result := 'acute';
  126 : Result := 'circumflex';
  127 : Result := 'tilde';
  128 : Result := 'macron';
  129 : Result := 'breve';
  130 : Result := 'dotaccent';
  131 : Result := 'dieresis';
  132 : Result := 'ring';
  133 : Result := 'cedilla';
  134 : Result := 'hungarumlaut';
  135 : Result := 'ogonek';
  136 : Result := 'caron';
  137 : Result := 'emdash';
  138 : Result := 'AE';
  139 : Result := 'ordfeminine';
  140 : Result := 'Lslash';
  141 : Result := 'Oslash';
  142 : Result := 'OE';
  143 : Result := 'ordmasculine';
  144 : Result := 'ae';
  145 : Result := 'dotlessi';
  146 : Result := 'lslash';
  147 : Result := 'oslash';
  148 : Result := 'oe';
  149 : Result := 'germandbls';
  150 : Result := 'onesuperior';
  151 : Result := 'logicalnot';
  152 : Result := 'mu';
  153 : Result := 'trademark';
  154 : Result := 'Eth';
  155 : Result := 'onehalf';
  156 : Result := 'plusminus';
  157 : Result := 'Thorn';
  158 : Result := 'onequarter';
  159 : Result := 'divide';
  160 : Result := 'brokenbar';
  161 : Result := 'degree';
  162 : Result := 'thorn';
  163 : Result := 'threequarters';
  164 : Result := 'twosuperior';
  165 : Result := 'registered';
  166 : Result := 'minus';
  167 : Result := 'eth';
  168 : Result := 'multiply';
  169 : Result := 'threesuperior';
  170 : Result := 'copyright';
  171 : Result := 'Aacute';
  172 : Result := 'Acircumflex';
  173 : Result := 'Adieresis';
  174 : Result := 'Agrave';
  175 : Result := 'Aring';
  176 : Result := 'Atilde';
  177 : Result := 'Ccedilla';
  178 : Result := 'Eacute';
  179 : Result := 'Ecircumflex';
  180 : Result := 'Edieresis';
  181 : Result := 'Egrave';
  182 : Result := 'Iacute';
  183 : Result := 'Icircumflex';
  184 : Result := 'Idieresis';
  185 : Result := 'Igrave';
  186 : Result := 'Ntilde';
  187 : Result := 'Oacute';
  188 : Result := 'Ocircumflex';
  189 : Result := 'Odieresis';
  190 : Result := 'Ograve';
  191 : Result := 'Otilde';
  192 : Result := 'Scaron';
  193 : Result := 'Uacute';
  194 : Result := 'Ucircumflex';
  195 : Result := 'Udieresis';
  196 : Result := 'Ugrave';
  197 : Result := 'Yacute';
  198 : Result := 'Ydieresis';
  199 : Result := 'Zcaron';
  200 : Result := 'aacute';
  201 : Result := 'acircumflex';
  202 : Result := 'adieresis';
  203 : Result := 'agrave';
  204 : Result := 'aring';
  205 : Result := 'atilde';
  206 : Result := 'ccedilla';
  207 : Result := 'eacute';
  208 : Result := 'ecircumflex';
  209 : Result := 'edieresis';
  210 : Result := 'egrave';
  211 : Result := 'iacute';
  212 : Result := 'icircumflex';
  213 : Result := 'idieresis';
  214 : Result := 'igrave';
  215 : Result := 'ntilde';
  216 : Result := 'oacute';
  217 : Result := 'ocircumflex';
  218 : Result := 'odieresis';
  219 : Result := 'ograve';
  220 : Result := 'otilde';
  221 : Result := 'scaron';
  222 : Result := 'uacute';
  223 : Result := 'ucircumflex';
  224 : Result := 'udieresis';
  225 : Result := 'ugrave';
  226 : Result := 'yacute';
  227 : Result := 'ydieresis';
  228 : Result := 'zcaron';
  229 : Result := 'exclamsmall';
  230 : Result := 'Hungarumlautsmall';
  231 : Result := 'dollaroldstyle';
  232 : Result := 'dollarsuperior';
  233 : Result := 'ampersandsmall';
  234 : Result := 'Acutesmall';
  235 : Result := 'parenleftsuperior';
  236 : Result := 'parenrightsuperior';
  237 : Result := 'twodotenleader';
  238 : Result := 'onedotenleader';
  239 : Result := 'zerooldstyle';
  240 : Result := 'oneoldstyle';
  241 : Result := 'twooldstyle';
  242 : Result := 'threeoldstyle';
  243 : Result := 'fouroldstyle';
  244 : Result := 'fiveoldstyle';
  245 : Result := 'sixoldstyle';
  246 : Result := 'sevenoldstyle';
  247 : Result := 'eightoldstyle';
  248 : Result := 'nineoldstyle';
  249 : Result := 'commasuperior';
  250 : Result := 'threequartersemdash';
  251 : Result := 'periodsuperior';
  252 : Result := 'questionsmall';
  253 : Result := 'asuperior';
  254 : Result := 'bsuperior';
  255 : Result := 'centsuperior';
  256 : Result := 'dsuperior';
  257 : Result := 'esuperior';
  258 : Result := 'isuperior';
  259 : Result := 'lsuperior';
  260 : Result := 'msuperior';
  261 : Result := 'nsuperior';
  262 : Result := 'osuperior';
  263 : Result := 'rsuperior';
  264 : Result := 'ssuperior';
  265 : Result := 'tsuperior';
  266 : Result := 'ff';
  267 : Result := 'ffi';
  268 : Result := 'ffl';
  269 : Result := 'parenleftinferior';
  270 : Result := 'parenrightinferior';
  271 : Result := 'Circumflexsmall';
  272 : Result := 'hyphensuperior';
  273 : Result := 'Gravesmall';
  274 : Result := 'Asmall';
  275 : Result := 'Bsmall';
  276 : Result := 'Csmall';
  277 : Result := 'Dsmall';
  278 : Result := 'Esmall';
  279 : Result := 'Fsmall';
  280 : Result := 'Gsmall';
  281 : Result := 'Hsmall';
  282 : Result := 'Ismall';
  283 : Result := 'Jsmall';
  284 : Result := 'Ksmall';
  285 : Result := 'Lsmall';
  286 : Result := 'Msmall';
  287 : Result := 'Nsmall';
  288 : Result := 'Osmall';
  289 : Result := 'Psmall';
  290 : Result := 'Qsmall';
  291 : Result := 'Rsmall';
  292 : Result := 'Ssmall';
  293 : Result := 'Tsmall';
  294 : Result := 'Usmall';
  295 : Result := 'Vsmall';
  296 : Result := 'Wsmall';
  297 : Result := 'Xsmall';
  298 : Result := 'Ysmall';
  299 : Result := 'Zsmall';
  300 : Result := 'colonmonetary';
  301 : Result := 'onefitted';
  302 : Result := 'rupiah';
  303 : Result := 'Tildesmall';
  304 : Result := 'exclamdownsmall';
  305 : Result := 'centoldstyle';
  306 : Result := 'Lslashsmall';
  307 : Result := 'Scaronsmall';
  308 : Result := 'Zcaronsmall';
  309 : Result := 'Dieresissmall';
  310 : Result := 'Brevesmall';
  311 : Result := 'Caronsmall';
  312 : Result := 'Dotaccentsmall';
  313 : Result := 'Macronsmall';
  314 : Result := 'figuredash';
  315 : Result := 'hypheninferior';
  316 : Result := 'Ogoneksmall';
  317 : Result := 'Ringsmall';
  318 : Result := 'Cedillasmall';
  319 : Result := 'questiondownsmall';
  320 : Result := 'oneeighth';
  321 : Result := 'threeeighths';
  322 : Result := 'fiveeighths';
  323 : Result := 'seveneighths';
  324 : Result := 'onethird';
  325 : Result := 'twothirds';
  326 : Result := 'zerosuperior';
  327 : Result := 'foursuperior';
  328 : Result := 'fivesuperior';
  329 : Result := 'sixsuperior';
  330 : Result := 'sevensuperior';
  331 : Result := 'eightsuperior';
  332 : Result := 'ninesuperior';
  333 : Result := 'zeroinferior';
  334 : Result := 'oneinferior';
  335 : Result := 'twoinferior';
  336 : Result := 'threeinferior';
  337 : Result := 'fourinferior';
  338 : Result := 'fiveinferior';
  339 : Result := 'sixinferior';
  340 : Result := 'seveninferior';
  341 : Result := 'eightinferior';
  342 : Result := 'nineinferior';
  343 : Result := 'centinferior';
  344 : Result := 'dollarinferior';
  345 : Result := 'periodinferior';
  346 : Result := 'commainferior';
  347 : Result := 'Agravesmall';
  348 : Result := 'Aacutesmall';
  349 : Result := 'Acircumflexsmall';
  350 : Result := 'Atildesmall';
  351 : Result := 'Adieresissmall';
  352 : Result := 'Aringsmall';
  353 : Result := 'AEsmall';
  354 : Result := 'Ccedillasmall';
  355 : Result := 'Egravesmall';
  356 : Result := 'Eacutesmall';
  357 : Result := 'Ecircumflexsmall';
  358 : Result := 'Edieresissmall';
  359 : Result := 'Igravesmall';
  360 : Result := 'Iacutesmall';
  361 : Result := 'Icircumflexsmall';
  362 : Result := 'Idieresissmall';
  363 : Result := 'Ethsmall';
  364 : Result := 'Ntildesmall';
  365 : Result := 'Ogravesmall';
  366 : Result := 'Oacutesmall';
  367 : Result := 'Ocircumflexsmall';
  368 : Result := 'Otildesmall';
  369 : Result := 'Odieresissmall';
  370 : Result := 'OEsmall';
  371 : Result := 'Oslashsmall';
  372 : Result := 'Ugravesmall';
  373 : Result := 'Uacutesmall';
  374 : Result := 'Ucircumflexsmall';
  375 : Result := 'Udieresissmall';
  376 : Result := 'Yacutesmall';
  377 : Result := 'Thornsmall';
  378 : Result := 'Ydieresissmall';
  379 : Result := '001.000';
  380 : Result := '001.001';
  381 : Result := '001.002';
  382 : Result := '001.003';
  383 : Result := 'Black';
  384 : Result := 'Bold';
  385 : Result := 'Book';
  386 : Result := 'Light';
  387 : Result := 'Medium';
  388 : Result := 'Regular';
  389 : Result := 'Roman';
  390 : Result := 'Semibold';
 end;
end;


{ TPascalTypePostscriptDictPair }

procedure TPascalTypePostscriptDictPair.AddOperand(
  Operand: TCustomPascalTypePostscriptDictOperand);
begin
 if Operand = nil
  then raise EPascalTypeError.Create(RCStrNoOperandSpecified);

 SetLength(FOperands, Length(FOperands) + 1);

 FOperands[Length(FOperands) - 1] := Operand;
end;

procedure TPascalTypePostscriptDictPair.AssignTo(Dest: TPersistent);
var
  OpIndex : Integer;
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptDictPair(Dest) do
   begin
    SetLength(FOperands, Length(Self.FOperands));
    for OpIndex := 0 to Length(FOperands) - 1 do
     begin
      FOperands[OpIndex] := TCustomPascalTypePostscriptDictOperand(Self.FOperands[OpIndex].ClassType.Create);
      FOperands[OpIndex].Assign(Self.FOperands[OpIndex]);
     end;

    FDictOperator := TCustomPascalTypePostscriptDictOperator(Self.FDictOperator.ClassType.Create);
    FDictOperator.Assign(Self.FDictOperator);
   end
 else inherited;
end;

procedure TPascalTypePostscriptDictPair.ResetToDefaults;
begin
 inherited;

 if Assigned(FDictOperator)
  then FreeAndNil(FDictOperator);

 ClearOperands;
 SetLength(FOperands, 0);
end;

procedure TPascalTypePostscriptDictPair.ClearOperands;
var
  OperandIndex : Integer;
begin
 for OperandIndex := 0 to Length(FOperands) - 1
  do FreeAndNil(FOperands);  
end;

destructor TPascalTypePostscriptDictPair.Destroy;
begin
 ClearOperands;
 inherited;
end;

function TPascalTypePostscriptDictPair.GetOperand(
  Index: Integer): TCustomPascalTypePostscriptDictOperand;
begin
 if (Index >= 0) and (Index < Length(FOperands))
  then Result := FOperands[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypePostscriptDictPair.GetOperandCount: Integer;
begin
 Result := Length(FOperands);
end;


{ TPascalTypePostscriptDictDataTable }

procedure TPascalTypePostscriptDictDataTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptDictDataTable(Dest) do
   begin
    FData := Self.FData;
   end
 else inherited;
end;

procedure TPascalTypePostscriptDictDataTable.ResetToDefaults;
begin
 inherited;
 SetLength(FData, 0);
end;

function TPascalTypePostscriptDictDataTable.GetStringIndex(
  const Index: Integer): Integer;
var
  DictIndex : Integer;
begin
 for DictIndex := 0 to Length(FData) - 1 do
  with FData[DictIndex] do
   if Assigned(DictOperator) then
    if DictOperator.GetOperator = Index then
     if OperandCount > 0 then
      begin
       Result := Operand[0].AsInteger;
       Exit;
      end;
 raise EPascalTypeError.Create('String index not found');
end;

procedure TPascalTypePostscriptDictDataTable.LoadFromStream(Stream: TStream);
var
  DictOp   : TCustomPascalTypePostscriptDictOperator;
  Operands : array of TCustomPascalTypePostscriptDictOperand;
  OpIndex  : Integer;
  Data     : array [0..3] of Byte;
  Value    : Integer;
  str      : string;
  Nibble   : Byte;
  Token    : Byte;
begin
 inherited;

 // initialize DictOp variable
 DictOp := nil;

 with Stream do
  while Position < Size do
   begin
    // read token
    Read(Token, 1);

    // eventually increase value list length
    if Token in [28..30, 32..254]
     then SetLength(Operands, Length(Operands) + 1);

    // eventually free operator
    if Assigned(DictOp)
     then FreeAndNil(DictOp);

    // read element data
    case Token of
            0 : begin
                 // Version
                 DictOp := TPascalTypePostscriptVersionOperator.Create;
                end;
            1 : begin
                 // Notice
                 DictOp := TPascalTypePostscriptNoticeOperator.Create;
                end;
            2 : begin
                 // FullName
                 DictOp := TPascalTypePostscriptFullNameOperator.Create;
                end;
            3 : begin
                 // FamilyName
                 DictOp := TPascalTypePostscriptFamilyNameOperator.Create;
                end;
            4 : begin
                 // Weight
                 DictOp := TPascalTypePostscriptWeightOperator.Create;
                end;
            5 : begin
                 // FontBBox
                 DictOp := TPascalTypePostscriptFontBBoxOperator.Create;
                end;
            6 : begin
                 // BlueValues
                 DictOp := TPascalTypePostscriptBlueValuesOperator.Create;
                end;
            7 : begin
                 // OtherBlues
                 DictOp := TPascalTypePostscriptOtherBluesOperator.Create;
                end;
            8 : begin
                 // FamilyBlues
                 DictOp := TPascalTypePostscriptFamilyBluesOperator.Create;
                end;
            9 : begin
                 // FamilyOtherBlues
                 DictOp := TPascalTypePostscriptFamilyOtherBluesOperator.Create;
                end;
           10 : begin
                // StdHW
                DictOp := TPascalTypePostscriptStdHWOperator.Create;
               end;
           11 : begin
                // StdVW
                DictOp := TPascalTypePostscriptStdVWOperator.Create;
               end;
           12 : begin
                 // escape
                 Read(Data[0], 1);
                 DictOp := TPascalTypePostscriptEscapeOperator.Create;
                 TPascalTypePostscriptEscapeOperator(DictOp).OpCode := Data[0];
                end;
           13 : begin
                // UniqueID
                DictOp := TPascalTypePostscriptUniqueIDOperator.Create;
               end;
           14 : begin
                // XUID
                DictOp := TPascalTypePostscriptXUIDOperator.Create;
               end;
           15 : begin
                // charset
                DictOp := TPascalTypePostscriptCharsetOperator.Create;
               end;
           16 : begin
                // Encoding
                DictOp := TPascalTypePostscriptEncodingOperator.Create;
               end;
           17 : begin
                // CharStrings
                DictOp := TPascalTypePostscriptCharStringOperator.Create;
               end;
           18 : begin
                // Private
                DictOp := TPascalTypePostscriptPrivateOperator.Create;
               end;
           19 : begin
                // Subrs
                DictOp := TPascalTypePostscriptSubrsOperator.Create;
               end;
           20 : begin
                // defaultWidthX
                DictOp := TPascalTypePostscriptDefaultWidthXOperator.Create;
               end;
           21 : begin
                // nominalWidthX
                DictOp := TPascalTypePostscriptNominalWidthXOperator.Create;
               end;
           28 : begin
                 Read(Data[0], 2);
                 Value := (Data[0] shl 8) or Data[1];

                 Operands[Length(Operands) - 1] := TPascalTypePostscriptOperandSmallInt.Create;
                 TPascalTypePostscriptOperandSmallInt(Operands[Length(Operands) - 1]).Value := Value;
                end;
           29 : begin
                 Read(Data[0], 4);
                 Value := (Data[0] shl 24) or (Data[1] shl 16) or
                   (Data[2] shl 8) or Data[3];

                 Operands[Length(Operands) - 1] := TPascalTypePostscriptOperandInteger.Create;
                 TPascalTypePostscriptOperandInteger(Operands[Length(Operands) - 1]).Value := Value;
                end;
           30 : begin
                 // BCD (real number)

                 // reset string
                 str := '';

                 repeat
                  // read two nibbles
                  Read(Data[0], 1);

                  // get first nibble
                  Nibble := Data[0] shr 4;

                  case Nibble of
                   0..9 : str := str + IntToStr(Nibble);
                     $A : str := str + '.';
                     $B : str := str + 'E';
                     $C : str := str + 'E-';
                     $E : str := str + '-';
                     $F : Break;
                   else raise EPascalTypeError.Create(RCStrCFFErrorWrongNibble);
                  end;

                  // get second nibble
                  Nibble := Data[0] and $F;

                  case Nibble of
                   0..9 : str := str + IntToStr(Nibble);
                     $A : str := str + '.';
                     $B : str := str + 'E';
                     $C : str := str + 'E-';
                     $E : str := str + '-';
                     $F : Break;
                   else raise EPascalTypeError.Create(RCStrCFFErrorWrongNibble);
                  end;

                 until (Nibble = $F);

                 Operands[Length(Operands) - 1] := TPascalTypePostscriptOperandBCD.Create;
                 TPascalTypePostscriptOperandBCD(Operands[Length(Operands) - 1]).Value := str;
                end;
      32..246 : begin
                 Value := Token - 139;

                 Operands[Length(Operands) - 1] := TPascalTypePostscriptOperandShortInt.Create;
                 TPascalTypePostscriptOperandShortInt(Operands[Length(Operands) - 1]).Value := Value;
                end;
     247..250 : begin
                 Read(Data[0], 1);
                 Value := (Token - 247) shl 8 + Data[0] + 108;

                 Operands[Length(Operands) - 1] := TPascalTypePostscriptOperandComposite.Create;
                 TPascalTypePostscriptOperandComposite(Operands[Length(Operands) - 1]).Value := Value;
                end;
     251..254 : begin
                 Read(Data[0], 1);
                 Value := -(Token - 251) shl 8 - Data[0] - 108;

                 Operands[Length(Operands) - 1] := TPascalTypePostscriptOperandComposite.Create;
                 TPascalTypePostscriptOperandComposite(Operands[Length(Operands) - 1]).Value := Value;
                end;
     else raise EPascalTypeError.Create(RCStrCFFErrorWrongToken);
    end;


    if Token in [0..21] then
     begin
      // add element
      SetLength(FData, Length(FData) + 1);

      // assign value
      FData[Length(FData) - 1] := TPascalTypePostscriptDictPair.Create;

      // assign dict operator
      FData[Length(FData) - 1].DictOperator := DictOp;

      // assign operands
      for OpIndex := 0 to Length(Operands) - 1
       do FData[Length(FData) - 1].AddOperand(Operands[OpIndex]);

      // reset operand list length to zero
      SetLength(Operands, 0);

      // clear operator pointer
      DictOp := nil;
     end;
   end;

 // eventually free operand items
 for OpIndex := 0 to Length(Operands) - 1 do
  if Assigned(Operands[OpIndex])
   then Operands[OpIndex].Free;

 // free dictionary operator
 if Assigned(DictOp)
  then DictOp := nil;
end;

procedure TPascalTypePostscriptDictDataTable.SaveToStream(Stream: TStream);
begin
 inherited;

 with Stream do
  begin

  end;

 raise EPascalTypeError.Create(RCStrNotImplemented); 
end;


{ TCustomPascalTypePostscriptIndexTable }

procedure TCustomPascalTypePostscriptIndexTable.LoadFromStream(Stream: TStream);
var
  Offsets  : array of Integer; // Offset array (from byte preceding object data)
  OffIndex : Integer;
  Offset   : array [0..3] of Byte;
  OffStart : Int64;
  MS       : TMemoryStream;
  Value16  : Word;
  OffSize  : Byte;
begin
 inherited;

 with Stream do
  begin
   // check (minimum) table size
   if Position + 2 > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   // read count
   Value16 := ReadSwappedWord(Stream);

   // check if index file is empty
   if Value16 = 0
    then Exit;

   // set length of offsets
   SetLength(Offsets, Value16 + 1);

   // read offset size
   Read(OffSize, 1);

   for OffIndex := 0 to Length(Offsets) - 1 do
    case OffSize of
     1 : Read(Offsets[OffIndex], 1);
     2 : begin
          Read(Offset[0], 2);
          Offsets[OffIndex] := (Offset[0] shl 8) + Offset[1];
         end;
     3 : begin
          Read(Offset[0], 3);
          Offsets[OffIndex] := (Offset[0] shl 16) + (Offset[1] shl 8) + Offset[2];
         end;
     4 : begin
          Read(Offset[0], 4);
          Offsets[OffIndex] := (Offset[0] shl 24) + (Offset[1] shl 16) + (Offset[2] shl 8) + Offset[3];
         end;
    end;

   OffStart := Position - 1;

   if Offsets[0] <> 1
    then raise Exception.CreateFmt(RCStrCFFIndexFirstOffsetError, [Offsets[0]]);

   // check (minimum) table size
   if Position + Offsets[Length(Offsets) - 1] > Size
    then raise EPascalTypeTableIncomplete.Create(RCStrTableIncomplete);

   MS := TMemoryStream.Create;
   try
    for OffIndex := 0 to Length(Offsets) - 2 do
     begin
      // clear memory stream
      MS.Clear;

      // locate data position in stream
      Stream.Position := OffStart + Offsets[OffIndex];

      // copy data to local stream
      MS.CopyFrom(Stream, Offsets[OffIndex + 1] - Offsets[OffIndex]);

      // reset stream position
      MS.Seek(0, soBeginning);

      // read data from memory stream
      ReadData(OffIndex, MS);
     end;
   finally
    FreeAndNil(MS);
   end;

  end;
end;

procedure TCustomPascalTypePostscriptIndexTable.SaveToStream(Stream: TStream);
begin
 inherited;
 raise EPascalTypeNotImplemented.Create(RCStrNotImplemented);
end;


{ TPascalTypePostscriptNameIndexTable }

procedure TPascalTypePostscriptNameIndexTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptNameIndexTable(Dest) do
   begin
    FFontNames := Self.FFontNames;
   end
  else inherited;
end;

procedure TPascalTypePostscriptNameIndexTable.ResetToDefaults;
begin
 inherited;
 SetLength(FFontNames, 0);
end;

function TPascalTypePostscriptNameIndexTable.GetFontName(
  Index: Integer): string;
begin
 if (Index >= 0) and (Index < Length(FFontNames))
  then Result := FFontNames[Index]
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

function TPascalTypePostscriptNameIndexTable.GetFontNameCount: Integer;
begin
 Result := Length(FFontNames);
end;

procedure TPascalTypePostscriptNameIndexTable.ReadData(Index: Integer;
  Stream: TStream);
begin
 // eventually extend font name array
 if Index >= Length(FFontNames)
  then SetLength(FFontNames, Index + 1);

 // set length of string
 SetLength(FFontNames[Index], Stream.Size);

 // read actual string
 Stream.Read(FFontNames[Index][1], Stream.Size);
end;

procedure TPascalTypePostscriptNameIndexTable.WriteData(Index: Integer;
  Stream: TStream);
begin
 // check if index exceeds the list
 if (Index < 0) or (Index >= Length(FFontNames))
  then raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);

 // read actual string
 Stream.Write(FFontNames[Index][1], Length(FFontNames[Index]));
end;


{ TPascalTypePostscriptStringIndexTable }

procedure TPascalTypePostscriptStringIndexTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptStringIndexTable(Dest) do
   begin
    FStrings := Self.FStrings;
   end
  else inherited;
end;

procedure TPascalTypePostscriptStringIndexTable.ResetToDefaults;
begin
 inherited;
 SetLength(FStrings, 0);
end;

function TPascalTypePostscriptStringIndexTable.GetString(
  Index: Integer): string;
begin
 if (Index >= 0) then
  if Index <= 391 then Result := GetStandardString(Index) else
  if Index - 391 < Length(FStrings)
   then Result := FStrings[Index - 391]
   else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index])
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);  
end;

function TPascalTypePostscriptStringIndexTable.GetStringCount: Integer;
begin
 Result := Length(FStrings);
end;

procedure TPascalTypePostscriptStringIndexTable.ReadData(Index: Integer;
  Stream: TStream);
begin
 // eventually extend font String array
 if Index >= Length(FStrings)
  then SetLength(FStrings, Index + 1);

 // set length of string
 SetLength(FStrings[Index], Stream.Size);

 // read actual string
 Stream.Read(FStrings[Index][1], Stream.Size);
end;

procedure TPascalTypePostscriptStringIndexTable.WriteData(Index: Integer;
  Stream: TStream);
begin
 // check if index exceeds the list
 if (Index < 0) or (Index >= Length(FStrings))
  then raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [Index]);

 // read actual string
 Stream.Write(FStrings[Index][1], Length(FStrings[Index]));
end;


{ TPascalTypePostscriptTopDictIndexTable }

destructor TPascalTypePostscriptTopDictIndexTable.Destroy;
begin
 ClearDict;
 inherited;
end;

function TPascalTypePostscriptTopDictIndexTable.GetStringIndex(
  Index: Integer; DictIndex: Integer): Integer;
begin
 if (DictIndex >= 0) and (DictIndex < Length(FDict))
  then Result := FDict[DictIndex].GetStringIndex(Index)
  else raise EPascalTypeError.CreateFmt(RCStrIndexOutOfBounds, [DictIndex]);
end;

procedure TPascalTypePostscriptTopDictIndexTable.AssignTo(Dest: TPersistent);
var
  DictIndex : Integer;
begin
 if Dest is Self.ClassType then
  with TPascalTypePostscriptTopDictIndexTable(Dest) do
   begin
    // clear existing dictionary entries
    ClearDict;

    // set length of new dictionary
    SetLength(FDict, Length(Self.FDict));

    // create and assign dictionary entries
    for DictIndex := 0 to Length(FDict) - 1 do
     begin
      FDict[DictIndex] := TPascalTypePostscriptDictDataTable.Create;
      FDict[DictIndex].Assign(Self.FDict[DictIndex]);
     end;
   end
 else inherited;
end;

procedure TPascalTypePostscriptTopDictIndexTable.ResetToDefaults;
begin
 inherited;
 ClearDict;
 SetLength(FDict, 0);
end;

procedure TPascalTypePostscriptTopDictIndexTable.ClearDict;
var
  DictIndex : Integer;
begin
 for DictIndex := 0 to Length(FDict) - 1
  do FreeAndNil(FDict[DictIndex]);
end;

procedure TPascalTypePostscriptTopDictIndexTable.ReadData(Index: Integer;
  Stream: TStream);
begin
 // eventually extend font name array or reset dict to default
 if Index >= Length(FDict) then
  begin
   SetLength(FDict, Index + 1);
   FDict[Length(FDict) - 1] := TPascalTypePostscriptDictDataTable.Create;
  end
 else FDict[Length(FDict) - 1].ResetToDefaults;

 // load dict from stream
 FDict[Length(FDict) - 1].LoadFromStream(Stream);
end;

procedure TPascalTypePostscriptTopDictIndexTable.WriteData(Index: Integer;
  Stream: TStream);
begin

end;


{ TPascalTypeCompactFontFormatTable }

constructor TPascalTypeCompactFontFormatTable.Create(
  Storage: IPascalTypeStorageTable);
begin
 FNameTable := TPascalTypePostscriptNameIndexTable.Create;
 FTopDictTable := TPascalTypePostscriptTopDictIndexTable.Create;
 FStringTable := TPascalTypePostscriptStringIndexTable.Create;
 FGlobalTable := TPascalTypePostscriptStringIndexTable.Create;
 inherited;
end;

destructor TPascalTypeCompactFontFormatTable.Destroy;
begin
 FreeAndNil(FNameTable);
 FreeAndNil(FTopDictTable);
 FreeAndNil(FStringTable);
 FreeAndNil(FGlobalTable);
 inherited;
end;

procedure TPascalTypeCompactFontFormatTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeCompactFontFormatTable(Dest) do
   begin
    FVersionMajor := Self.FVersionMajor;
    FVersionMinor := Self.FVersionMinor;
    FOffSize      := Self.FOffSize;
    FNameTable.Assign(Self.FNameTable);
    FTopDictTable.AssignTo(Self.FTopDictTable);
    FStringTable.AssignTo(Self.FStringTable);
    FGlobalTable.AssignTo(Self.FGlobalTable);
   end
  else inherited;
end;

function TPascalTypeCompactFontFormatTable.GetFontName: string;
begin
 if FNameTable.FontNameCount > 0
  then Result := FNameTable.FontName[0]
  else Result := '';
end;

class function TPascalTypeCompactFontFormatTable.GetTableType: TTableType;
begin
 Result := 'CFF ';
end;

function TPascalTypeCompactFontFormatTable.GetFamilyNameString: string;
var
  StringIndex : Integer;
begin
 Result := '';

 try
  StringIndex := FTopDictTable.FamilyNameStringIndex[0];
  Result := FStringTable.StringItem[StringIndex];
 except
  // do nothing;
 end;
end;

function TPascalTypeCompactFontFormatTable.GetFullNameString: string;
var
  StringIndex : Integer;
begin
 Result := '';

 try
  StringIndex := FTopDictTable.FullNameStringIndex[0];
  Result := FStringTable.StringItem[StringIndex];
 except
  // do nothing;
 end;
end;

function TPascalTypeCompactFontFormatTable.GetNoticeString: string;
var
  StringIndex : Integer;
begin
 Result := '';

 try
  StringIndex := FTopDictTable.NoticeStringIndex[0];
  Result := FStringTable.StringItem[StringIndex];
 except
  // do nothing;
 end;
end;

function TPascalTypeCompactFontFormatTable.GetVersionString: string;
var
  StringIndex : Integer;
begin
 Result := '';

 try
  StringIndex := FTopDictTable.VersionStringIndex[0];
  Result := FStringTable.StringItem[StringIndex];
 except
  // do nothing;
 end;
end;

function TPascalTypeCompactFontFormatTable.GetWeightStringIndex: string;
var
  StringIndex : Integer;
begin
 Result := '';

 try
  StringIndex := FTopDictTable.WeightStringIndex[0];
  Result := FStringTable.StringItem[StringIndex];
 except
  // do nothing;
 end;
end;

procedure TPascalTypeCompactFontFormatTable.ResetToDefaults;
begin
 inherited;
 FVersionMajor := 0;
 FVersionMinor := 0;
 FOffSize      := 0;
 FNameTable.ResetToDefaults;
 FTopDictTable.ResetToDefaults;
 FStringTable.ResetToDefaults;
 FGlobalTable.ResetToDefaults;
end;

procedure TPascalTypeCompactFontFormatTable.LoadFromStream(Stream: TStream);
var
  StartPos   : Int64;
  HeaderSize : Byte;
begin
 inherited;

 with Stream do
  begin
   // remember stream start position
   StartPos := Position;

   // read major version number
   Read(FVersionMajor, 1);

   // check major version
   if FVersionMajor > 1
    then raise EPascalTypeError.Create(RCStrUnknownVersion);

   // read minor version number
   Read(FVersionMinor, 1);

   // read header size
   Read(HeaderSize, 1);

   // read offset size
   Read(FOffSize, 1);

   // go to name table position
   Position := StartPos + HeaderSize;

   // read name table from stream
   FNameTable.LoadFromStream(Stream);

   // read top dict table from stream
   FTopDictTable.LoadFromStream(Stream);

   // read string table from stream
   FStringTable.LoadFromStream(Stream);

   // read global sub-string table from stream
   FGlobalTable.LoadFromStream(Stream);
  end;
end;

procedure TPascalTypeCompactFontFormatTable.SaveToStream(Stream: TStream);
var
  HeaderSize : Byte;
begin
 inherited;

 with Stream do
  begin
   // read major version number
   Write(FVersionMajor, 1);

   // read minor version number
   Write(FVersionMinor, 1);

   // read header size
   HeaderSize := 4;
   Write(HeaderSize, 1);

   // read offset size
   Write(FOffSize, 1);

   raise Exception.Create(RCStrNotImplemented);
  end;
end;

procedure TPascalTypeCompactFontFormatTable.SetVersionMajor(const Value: Byte);
begin
 if FVersionMajor <> Value then
  begin
   FVersionMajor := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeCompactFontFormatTable.SetVersionMinor(const Value: Byte);
begin
 if FVersionMinor <> Value then
  begin
   FVersionMinor := Value;
   VersionChanged;
  end;
end;

procedure TPascalTypeCompactFontFormatTable.VersionChanged;
begin
 Changed;
end;


{ TPascalTypeVerticalOriginTable }

procedure TPascalTypeVerticalOriginTable.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TPascalTypeVerticalOriginTable(Dest) do
   begin
    FMajorVersion       := Self.FMajorVersion;
    FMinorVersion       := Self.FMinorVersion;
    FDefaultVertOriginY := Self.FDefaultVertOriginY;
    FVertOriginYMetrics := Self.FVertOriginYMetrics;
   end
  else inherited;
end;

class function TPascalTypeVerticalOriginTable.GetTableType: TTableType;
begin
 Result := 'VORG';
end;

procedure TPascalTypeVerticalOriginTable.ResetToDefaults;
begin
 inherited;
 FMajorVersion       := 1;
 FMinorVersion       := 0;
 FDefaultVertOriginY := 0;
 SetLength(FVertOriginYMetrics, 0);
end;

procedure TPascalTypeVerticalOriginTable.LoadFromStream(Stream: TStream);
var
  Index: Integer;
begin
 inherited;

 with Stream do
  begin
   // read major version
   FMajorVersion := ReadSwappedWord(Stream);

   // read minor version
   FMinorVersion := ReadSwappedWord(Stream);

   // read default vertical origin
   FDefaultVertOriginY := ReadSwappedWord(Stream);

   // read vertical origin y-metrics
   SetLength(FVertOriginYMetrics, ReadSwappedWord(Stream));

   for Index := 0 to Length(FVertOriginYMetrics) - 1 do
    with FVertOriginYMetrics[Index] do
     begin
      // read glyph index
      GlyphIndex := ReadSwappedWord(Stream);

      // read vertical y origin
      VertOriginY := ReadSwappedWord(Stream);
     end;
  end;
end;

procedure TPascalTypeVerticalOriginTable.SaveToStream(Stream: TStream);
var
  Index : Integer;
begin
 inherited;

 with Stream do
  begin
   // write major version
   WriteSwappedWord(Stream, FMajorVersion);

   // write minor version
   WriteSwappedWord(Stream, FMinorVersion);

   // write default vertical origin
   WriteSwappedWord(Stream, FDefaultVertOriginY);

   // write vertical origin y-metrics
   WriteSwappedWord(Stream, Length(FVertOriginYMetrics));

   for Index := 0 to Length(FVertOriginYMetrics) - 1 do
    with FVertOriginYMetrics[Index] do
     begin
      // write glyph index
      WriteSwappedWord(Stream, GlyphIndex);

      // write vertical y origin
      WriteSwappedWord(Stream, VertOriginY);
     end;
  end;
end;


////////////////////////////////////////////////////////////////////////////////

function IsOperatorClassRegistered(OperatorClass: TPascalTypePostscriptDictOperatorClass): Boolean;
var
  OperatorClassIndex : Integer;
begin
 Result := False;
 for OperatorClassIndex := 0 to Length(GOperatorClasses) - 1 do
  if GOperatorClasses[OperatorClassIndex] = OperatorClass then
   begin
    Result := True;
    Exit;
   end;
end;

procedure RegisterOperator(OperatorClass: TPascalTypePostscriptDictOperatorClass);
begin
 Assert(IsOperatorClassRegistered(OperatorClass) = False);
 SetLength(GOperatorClasses, Length(GOperatorClasses) + 1);
 GOperatorClasses[Length(GOperatorClasses) - 1] := OperatorClass;
end;

procedure RegisterOperators(OperatorClasses: array of TPascalTypePostscriptDictOperatorClass);
var
  OperatorClassIndex : Integer;
begin
 for OperatorClassIndex := 0 to Length(OperatorClasses) - 1
  do RegisterOperator(OperatorClasses[OperatorClassIndex]);
end;

function FindOperatorByEncoding(Encoding: Byte): TPascalTypePostscriptDictOperatorClass;
var
  OperatorClassIndex : Integer;
begin
 Result := nil;
 for OperatorClassIndex := 0 to Length(GOperatorClasses) - 1 do
  if GOperatorClasses[OperatorClassIndex].GetOperator = Encoding then
   begin
    Result := GOperatorClasses[OperatorClassIndex];
    Exit;
   end;
// raise EPascalTypeError.Create('Unknown Table Class: ' + TableType);
end;

{ TCustomPascalTypePostscriptDictOperator }

procedure TCustomPascalTypePostscriptDictOperator.AssignTo(Dest: TPersistent);
begin
 if Dest is Self.ClassType then
  with TCustomPascalTypePostscriptDictOperator(Dest) do
   if GetOperator = Self.GetOperator
    then
    else inherited
  else inherited;
end;

initialization
  RegisterPascalTypeTables([TPascalTypeCompactFontFormatTable,
    TPascalTypeVerticalOriginTable]);

end.
