unit PT_UnicodeNames;

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

function GetUnicodeName(Value: Word): string;

implementation

const
  CCapital: string = 'Capital';
  CSmall: string = 'Small';
  CWith: string = 'With';
  CLetter: string = 'Letter';
  CLigature: string = 'Ligature';
  CVowel: string = 'Vowel';
  CSign: string = 'Sign';
  CDigit: string = 'Digit';
  CNumber: string = 'Number';
  CCharacter: string = 'Character';
  CIdeograph: string = 'Ideograph';
  CIdeographic: string = 'Ideographic';
  CHangul: string = 'Hangul';
  CKatakana: string = 'Katakana';
  CLatin: string = 'Latin';
  CGrave: string = 'Grave';
  CTilde: string = 'Tilde';
  CAcute: string = 'Acute';
  CCedilla: string = 'Cedilla';
  CCircumflex: string = 'Circumflex';
  CDiaeresis: string = 'Diaeresis';
  CTurned: string = 'Turned';
  CForm: string = 'Form';
  CSquare: string = 'Square';
  CLight: string = 'Light';
  CHeavy: string = 'Heavy';
  CAnd: string = 'and';
  CHorn: string = 'Horn';
  CLeft: string = 'Left';
  CRight: string = 'Right';
  CUp: string = 'Up';
  CDown: string = 'Down';
  CUpper: string = 'Upper';
  CLower: string = 'Lower';
  CAlpha: string = 'Alpha';
  CBeta: string = 'Beta';
  CGamma: string = 'Gamma';
  CDelta: string = 'Delta';
  COmega: string = 'Omega';

function GetLatinUnicodeName(Value: Word): string;
begin
  case Value of
    $0041:
      Result := CCapital + #32 + CLetter + #32 + 'A';
    $0042:
      Result := CCapital + #32 + CLetter + #32 + 'B';
    $0043:
      Result := CCapital + #32 + CLetter + #32 + 'C';
    $0044:
      Result := CCapital + #32 + CLetter + #32 + 'D';
    $0045:
      Result := CCapital + #32 + CLetter + #32 + 'E';
    $0046:
      Result := CCapital + #32 + CLetter + #32 + 'F';
    $0047:
      Result := CCapital + #32 + CLetter + #32 + 'G';
    $0048:
      Result := CCapital + #32 + CLetter + #32 + 'H';
    $0049:
      Result := CCapital + #32 + CLetter + #32 + 'I';
    $004A:
      Result := CCapital + #32 + CLetter + #32 + 'J';
    $004B:
      Result := CCapital + #32 + CLetter + #32 + 'K';
    $004C:
      Result := CCapital + #32 + CLetter + #32 + 'L';
    $004D:
      Result := CCapital + #32 + CLetter + #32 + 'M';
    $004E:
      Result := CCapital + #32 + CLetter + #32 + 'N';
    $004F:
      Result := CCapital + #32 + CLetter + #32 + 'O';
    $0050:
      Result := CCapital + #32 + CLetter + #32 + 'P';
    $0051:
      Result := CCapital + #32 + CLetter + #32 + 'Q';
    $0052:
      Result := CCapital + #32 + CLetter + #32 + 'R';
    $0053:
      Result := CCapital + #32 + CLetter + #32 + 'S';
    $0054:
      Result := CCapital + #32 + CLetter + #32 + 'T';
    $0055:
      Result := CCapital + #32 + CLetter + #32 + 'U';
    $0056:
      Result := CCapital + #32 + CLetter + #32 + 'V';
    $0057:
      Result := CCapital + #32 + CLetter + #32 + 'W';
    $0058:
      Result := CCapital + #32 + CLetter + #32 + 'X';
    $0059:
      Result := CCapital + #32 + CLetter + #32 + 'Y';
    $005A:
      Result := CCapital + #32 + CLetter + #32 + 'Z';
    $0061:
      Result := CSmall + #32 + CLetter + #32 + 'A';
    $0062:
      Result := CSmall + #32 + CLetter + #32 + 'B';
    $0063:
      Result := CSmall + #32 + CLetter + #32 + 'C';
    $0064:
      Result := CSmall + #32 + CLetter + #32 + 'D';
    $0065:
      Result := CSmall + #32 + CLetter + #32 + 'E';
    $0066:
      Result := CSmall + #32 + CLetter + #32 + 'F';
    $0067:
      Result := CSmall + #32 + CLetter + #32 + 'G';
    $0068:
      Result := CSmall + #32 + CLetter + #32 + 'H';
    $0069:
      Result := CSmall + #32 + CLetter + #32 + 'I';
    $006A:
      Result := CSmall + #32 + CLetter + #32 + 'J';
    $006B:
      Result := CSmall + #32 + CLetter + #32 + 'K';
    $006C:
      Result := CSmall + #32 + CLetter + #32 + 'L';
    $006D:
      Result := CSmall + #32 + CLetter + #32 + 'M';
    $006E:
      Result := CSmall + #32 + CLetter + #32 + 'N';
    $006F:
      Result := CSmall + #32 + CLetter + #32 + 'O';
    $0070:
      Result := CSmall + #32 + CLetter + #32 + 'P';
    $0071:
      Result := CSmall + #32 + CLetter + #32 + 'Q';
    $0072:
      Result := CSmall + #32 + CLetter + #32 + 'R';
    $0073:
      Result := CSmall + #32 + CLetter + #32 + 'S';
    $0074:
      Result := CSmall + #32 + CLetter + #32 + 'T';
    $0075:
      Result := CSmall + #32 + CLetter + #32 + 'U';
    $0076:
      Result := CSmall + #32 + CLetter + #32 + 'V';
    $0077:
      Result := CSmall + #32 + CLetter + #32 + 'W';
    $0078:
      Result := CSmall + #32 + CLetter + #32 + 'X';
    $0079:
      Result := CSmall + #32 + CLetter + #32 + 'Y';
    $007A:
      Result := CSmall + #32 + CLetter + #32 + 'Z';
    $00C0:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith +
        #32 + CGrave;
    $00C1:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith +
        #32 + CAcute;
    $00C2:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex;
    $00C3:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith +
        #32 + CTilde;
    $00C4:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CDiaeresis;
    $00C5:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Ring Above';
    $00C6:
      Result := CCapital + #32 + CLetter + #32 + 'Ae';
    $00C7:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith + #32
        + CCedilla;
    $00C8:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith +
        #32 + CGrave;
    $00C9:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith +
        #32 + CAcute;
    $00CA:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex;
    $00CB:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CDiaeresis;
    $00CC:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith +
        #32 + CGrave;
    $00CD:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith +
        #32 + CAcute;
    $00CE:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CCircumflex;
    $00CF:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CDiaeresis;
    $00D0:
      Result := CCapital + #32 + CLetter + #32 + 'Eth';
    $00D1:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith +
        #32 + CTilde;
    $00D2:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith +
        #32 + CGrave;
    $00D3:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith +
        #32 + CAcute;
    $00D4:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex;
    $00D5:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith +
        #32 + CTilde;
    $00D6:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CDiaeresis;
    $00D8:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Stroke';
    $00D9:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith +
        #32 + CGrave;
    $00DA:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith +
        #32 + CAcute;
    $00DB:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CCircumflex;
    $00DC:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis;
    $00DD:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith +
        #32 + CAcute;
    $00DE:
      Result := CCapital + #32 + CLetter + #32 + 'Thorn';
    $00DF:
      Result := CSmall + #32 + CLetter + #32 + 'Sharp S';
    $00E0:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 + CGrave;
    $00E1:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 + CAcute;
    $00E2:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex;
    $00E3:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 + CTilde;
    $00E4:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CDiaeresis;
    $00E5:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Ring Above';
    $00E6:
      Result := CSmall + #32 + CLetter + #32 + 'Ae';
    $00E7:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32
        + CCedilla;
    $00E8:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 + CGrave;
    $00E9:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 + CAcute;
    $00EA:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex;
    $00EB:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CDiaeresis;
    $00EC:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 + CGrave;
    $00ED:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 + CAcute;
    $00EE:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CCircumflex;
    $00EF:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CDiaeresis;
    $00F0:
      Result := CSmall + #32 + CLetter + #32 + 'Eth';
    $00F1:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 + CTilde;
    $00F2:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CGrave;
    $00F3:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CAcute;
    $00F4:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex;
    $00F5:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CTilde;
    $00F6:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CDiaeresis;
    $00F8:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Stroke';
    $00F9:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CGrave;
    $00FA:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CAcute;
    $00FB:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CCircumflex;
    $00FC:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis;
    $00FD:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 + CAcute;
    $00FE:
      Result := CSmall + #32 + CLetter + #32 + 'Thorn';
    $00FF:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        CDiaeresis;
    $0100:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Macron';
    $0101:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Macron';
    $0102:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Breve';
    $0103:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Breve';
    $0104:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Ogonek';
    $0105:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Ogonek';
    $0106:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith +
        #32 + CAcute;
    $0107:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 + CAcute;
    $0108:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 +
        CCircumflex;
    $0109:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 +
        CCircumflex;
    $010A:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 +
        'Dot Above';
    $010B:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 +
        'Dot Above';
    $010C:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith + #32
        + 'Caron';
    $010D:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32
        + 'Caron';
    $010E:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + 'Caron';
    $010F:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + 'Caron';
    $0110:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + 'Stroke';
    $0111:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + 'Stroke';
    $0112:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Macron';
    $0113:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Macron';
    $0114:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Breve';
    $0115:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Breve';
    $0116:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Dot Above';
    $0117:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Dot Above';
    $0118:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Ogonek';
    $0119:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Ogonek';
    $011A:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Caron';
    $011B:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32
        + 'Caron';
    $011C:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32 +
        CCircumflex;
    $011D:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32 +
        CCircumflex;
    $011E:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Breve';
    $011F:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Breve';
    $0120:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32 +
        'Dot Above';
    $0121:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32 +
        'Dot Above';
    $0122:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + CCedilla;
    $0123:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + CCedilla;
    $0124:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        CCircumflex;
    $0125:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        CCircumflex;
    $0126:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32
        + 'Stroke';
    $0127:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32
        + 'Stroke';
    $0128:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith +
        #32 + CTilde;
    $0129:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 + CTilde;
    $012A:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Macron';
    $012B:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Macron';
    $012C:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Breve';
    $012D:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Breve';
    $012E:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Ogonek';
    $012F:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Ogonek';
    $0130:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Dot Above';
    $0131:
      Result := CSmall + #32 + CLetter + #32 + 'Dotless I';
    $0132:
      Result := CCapital + #32 + CLigature + #32 + 'IJ';
    $0133:
      Result := CSmall + #32 + CLigature + #32 + 'IJ';
    $0134:
      Result := CCapital + #32 + CLetter + #32 + 'J' + #32 + CWith + #32 +
        CCircumflex;
    $0135:
      Result := CSmall + #32 + CLetter + #32 + 'J' + #32 + CWith + #32 +
        CCircumflex;
    $0136:
      Result := CCapital + #32 + CLetter + #32 + 'K' + #32 + CWith + #32
        + CCedilla;
    $0137:
      Result := CSmall + #32 + CLetter + #32 + 'K' + #32 + CWith + #32
        + CCedilla;
    $0138:
      Result := CSmall + #32 + CLetter + #32 + 'Kra';
    $0139:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith +
        #32 + CAcute;
    $013A:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 + CAcute;
    $013B:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32
        + CCedilla;
    $013C:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32
        + CCedilla;
    $013D:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32
        + 'Caron';
    $013E:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32
        + 'Caron';
    $013F:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Middle Dot';
    $0140:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Middle Dot';
    $0141:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32
        + 'Stroke';
    $0142:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32
        + 'Stroke';
    $0143:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith +
        #32 + CAcute;
    $0144:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 + CAcute;
    $0145:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32
        + CCedilla;
    $0146:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32
        + CCedilla;
    $0147:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32
        + 'Caron';
    $0148:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32
        + 'Caron';
    $0149:
      Result := CSmall + #32 + CLetter + #32 + 'N Preceded By Apostrophe';
    $014A:
      Result := CCapital + #32 + CLetter + #32 + 'Eng';
    $014B:
      Result := CSmall + #32 + CLetter + #32 + 'Eng';
    $014C:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Macron';
    $014D:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Macron';
    $014E:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Breve';
    $014F:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Breve';
    $0150:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Double' + #32 + CAcute;
    $0151:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Double' + #32 + CAcute;
    $0152:
      Result := CCapital + #32 + CLigature + #32 + 'Oe';
    $0153:
      Result := CSmall + #32 + CLigature + #32 + 'Oe';
    $0154:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith +
        #32 + CAcute;
    $0155:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 + CAcute;
    $0156:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32
        + CCedilla;
    $0157:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32
        + CCedilla;
    $0158:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32
        + 'Caron';
    $0159:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32
        + 'Caron';
    $015A:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith +
        #32 + CAcute;
    $015B:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 + CAcute;
    $015C:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        CCircumflex;
    $015D:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        CCircumflex;
    $015E:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32
        + CCedilla;
    $015F:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32
        + CCedilla;
    $0160:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32
        + 'Caron';
    $0161:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32
        + 'Caron';
    $0162:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32
        + CCedilla;
    $0163:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32
        + CCedilla;
    $0164:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32
        + 'Caron';
    $0165:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32
        + 'Caron';
    $0166:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32
        + 'Stroke';
    $0167:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32
        + 'Stroke';
    $0168:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith +
        #32 + CTilde;
    $0169:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CTilde;
    $016A:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Macron';
    $016B:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Macron';
    $016C:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Breve';
    $016D:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Breve';
    $016E:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Ring Above';
    $016F:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Ring Above';
    $0170:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Double' + #32 + CAcute;
    $0171:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Double' + #32 + CAcute;
    $0172:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Ogonek';
    $0173:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Ogonek';
    $0174:
      Result := CCapital + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        CCircumflex;
    $0175:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        CCircumflex;
    $0176:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        CCircumflex;
    $0177:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        CCircumflex;
    $0178:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        CDiaeresis;
    $0179:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith +
        #32 + CAcute;
    $017A:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 + CAcute;
    $017B:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Dot Above';
    $017C:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Dot Above';
    $017D:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32
        + 'Caron';
    $017E:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32
        + 'Caron';
    $017F:
      Result := CSmall + #32 + CLetter + #32 + 'Long S';
    $0180:
      Result := CSmall + #32 + CLetter + #32 + 'B' + #32 + CWith + #32
        + 'Stroke';
    $0181:
      Result := CCapital + #32 + CLetter + #32 + 'B' + #32 + CWith +
        #32 + 'Hook';
    $0182:
      Result := CCapital + #32 + CLetter + #32 + 'B' + #32 + CWith + #32
        + 'Topbar';
    $0183:
      Result := CSmall + #32 + CLetter + #32 + 'B' + #32 + CWith + #32
        + 'Topbar';
    $0184:
      Result := CCapital + #32 + CLetter + #32 + 'Tone Six';
    $0185:
      Result := CSmall + #32 + CLetter + #32 + 'Tone Six';
    $0186:
      Result := CCapital + #32 + CLetter + #32 + 'Open O';
    $0187:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith +
        #32 + 'Hook';
    $0188:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 + 'Hook';
    $0189:
      Result := CCapital + #32 + CLetter + #32 + 'African D';
    $018A:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith +
        #32 + 'Hook';
    $018B:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + 'Topbar';
    $018C:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + 'Topbar';
    $018D:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + CDelta;
    $018E:
      Result := CCapital + #32 + CLetter + #32 + 'Reversed E';
    $018F:
      Result := CCapital + #32 + CLetter + #32 + 'Schwa';
    $0190:
      Result := CCapital + #32 + CLetter + #32 + 'Open E';
    $0191:
      Result := CCapital + #32 + CLetter + #32 + 'F' + #32 + CWith +
        #32 + 'Hook';
    $0192:
      Result := CSmall + #32 + CLetter + #32 + 'F' + #32 + CWith + #32 + 'Hook';
    $0193:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith +
        #32 + 'Hook';
    $0194:
      Result := CCapital + #32 + CLetter + #32 + CGamma;
    $0195:
      Result := CSmall + #32 + CLetter + #32 + 'Hv';
    $0196:
      Result := CCapital + #32 + CLetter + #32 + 'Iota';
    $0197:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Stroke';
    $0198:
      Result := CCapital + #32 + CLetter + #32 + 'K' + #32 + CWith +
        #32 + 'Hook';
    $0199:
      Result := CSmall + #32 + CLetter + #32 + 'K' + #32 + CWith + #32 + 'Hook';
    $019A:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 + 'Bar';
    $019B:
      Result := CSmall + #32 + CLetter + #32 + 'Lambda' + #32 + CWith + #32
        + 'Stroke';
    $019C:
      Result := CCapital + #32 + CLetter + #32 + CTurned + #32 + 'M';
    $019D:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        CLeft + #32 + 'Hook';
    $019E:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Long' + #32 + CRight + #32 + 'Leg';
    $019F:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Middle' + #32 + CTilde;
    $01A0:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith +
        #32 + CHorn;
    $01A1:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn;
    $01A2:
      Result := CCapital + #32 + CLetter + #32 + 'Oi';
    $01A3:
      Result := CSmall + #32 + CLetter + #32 + 'Oi';
    $01A4:
      Result := CCapital + #32 + CLetter + #32 + 'P' + #32 + CWith +
        #32 + 'Hook';
    $01A5:
      Result := CSmall + #32 + CLetter + #32 + 'P' + #32 + CWith + #32 + 'Hook';
    $01A6:
      Result := CLetter + #32 + 'Yr';
    $01A7:
      Result := CCapital + #32 + CLetter + #32 + 'Tone Two';
    $01A8:
      Result := CSmall + #32 + CLetter + #32 + 'Tone Two';
    $01A9:
      Result := CCapital + #32 + CLetter + #32 + 'Esh';
    $01AA:
      Result := CLetter + #32 + 'Reversed Esh Loop';
    $01AB:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Palatal Hook';
    $01AC:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith +
        #32 + 'Hook';
    $01AD:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 + 'Hook';
    $01AE:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Retroflex Hook';
    $01AF:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith +
        #32 + CHorn;
    $01B0:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn;
    $01B1:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon';
    $01B2:
      Result := CCapital + #32 + CLetter + #32 + 'V' + #32 + CWith +
        #32 + 'Hook';
    $01B3:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith +
        #32 + 'Hook';
    $01B4:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 + 'Hook';
    $01B5:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32
        + 'Stroke';
    $01B6:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32
        + 'Stroke';
    $01B7:
      Result := CCapital + #32 + CLetter + #32 + 'Ezh';
    $01B8:
      Result := CCapital + #32 + CLetter + #32 + 'Ezh Reversed';
    $01B9:
      Result := CSmall + #32 + CLetter + #32 + 'Ezh Reversed';
    $01BA:
      Result := CSmall + #32 + CLetter + #32 + 'Ezh' + #32 + CWith +
        #32 + 'Tail';
    $01BB:
      Result := CLetter + #32 + 'Two' + #32 + CWith + #32 + 'Stroke';
    $01BC:
      Result := CCapital + #32 + CLetter + #32 + 'Tone Five';
    $01BD:
      Result := CSmall + #32 + CLetter + #32 + 'Tone Five';
    $01BE:
      Result := CLetter + #32 + 'Inverted Glottal Stop' + #32 + CWith + #32
        + 'Stroke';
    $01BF:
      Result := CLetter + #32 + 'Wynn';
    $01C0:
      Result := CLetter + #32 + 'Dental Click';
    $01C1:
      Result := CLetter + #32 + 'Lateral Click';
    $01C2:
      Result := CLetter + #32 + 'Alveolar Click';
    $01C3:
      Result := CLetter + #32 + 'Retroflex Click';
    $01C4:
      Result := CCapital + #32 + CLetter + #32 + 'Dz' + #32 + CWith + #32
        + 'Caron';
    $01C5:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Small' + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 + 'Caron';
    $01C6:
      Result := CSmall + #32 + CLetter + #32 + 'Dz' + #32 + CWith + #32
        + 'Caron';
    $01C7:
      Result := CCapital + #32 + CLetter + #32 + 'Lj';
    $01C8:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Small' + #32 + CLetter + #32 + 'J';
    $01C9:
      Result := CSmall + #32 + CLetter + #32 + 'Lj';
    $01CA:
      Result := CCapital + #32 + CLetter + #32 + 'Nj';
    $01CB:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Small' + #32 + CLetter + #32 + 'J';
    $01CC:
      Result := CSmall + #32 + CLetter + #32 + 'Nj';
    $01CD:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Caron';
    $01CE:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Caron';
    $01CF:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Caron';
    $01D0:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Caron';
    $01D1:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Caron';
    $01D2:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Caron';
    $01D3:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Caron';
    $01D4:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Caron';
    $01D5:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + 'Macron';
    $01D6:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + 'Macron';
    $01D7:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + CAcute;
    $01D8:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + CAcute;
    $01D9:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + 'Caron';
    $01DA:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + 'Caron';
    $01DB:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + CGrave;
    $01DC:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + CGrave;
    $01DD:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'E';
    $01DE:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + 'Macron';
    $01DF:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + 'Macron';
    $01E0:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Dot Above and Macron';
    $01E1:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Dot Above and Macron';
    $01E2:
      Result := CCapital + #32 + CLetter + #32 + 'Ae' + #32 + CWith + #32
        + 'Macron';
    $01E3:
      Result := CSmall + #32 + CLetter + #32 + 'Ae' + #32 + CWith + #32
        + 'Macron';
    $01E4:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Stroke';
    $01E5:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Stroke';
    $01E6:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Caron';
    $01E7:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Caron';
    $01E8:
      Result := CCapital + #32 + CLetter + #32 + 'K' + #32 + CWith + #32
        + 'Caron';
    $01E9:
      Result := CSmall + #32 + CLetter + #32 + 'K' + #32 + CWith + #32
        + 'Caron';
    $01EA:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Ogonek';
    $01EB:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32
        + 'Ogonek';
    $01EC:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Ogonek and Macron';
    $01ED:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Ogonek and Macron';
    $01EE:
      Result := CCapital + #32 + CLetter + #32 + 'Ezh' + #32 + CWith + #32
        + 'Caron';
    $01EF:
      Result := CSmall + #32 + CLetter + #32 + 'Ezh' + #32 + CWith + #32
        + 'Caron';
    $01F0:
      Result := CSmall + #32 + CLetter + #32 + 'J' + #32 + CWith + #32
        + 'Caron';
    $01F1:
      Result := CCapital + #32 + CLetter + #32 + 'Dz';
    $01F2:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Small' + #32 + CLetter + #32 + 'Z';
    $01F3:
      Result := CSmall + #32 + CLetter + #32 + 'Dz';
    $01F4:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith +
        #32 + CAcute;
    $01F5:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32 + CAcute;
    $01FA:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Ring Above and' + #32 + CAcute;
    $01FB:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Ring Above and' + #32 + CAcute;
    $01FC:
      Result := CCapital + #32 + CLetter + #32 + 'Ae' + #32 + CWith +
        #32 + CAcute;
    $01FD:
      Result := CSmall + #32 + CLetter + #32 + 'Ae' + #32 + CWith + #32
        + CAcute;
    $01FE:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Stroke and' + #32 + CAcute;
    $01FF:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Stroke and' + #32 + CAcute;
    $0200:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0201:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0202:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Inverted Breve';
    $0203:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Inverted Breve';
    $0204:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0205:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0206:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Inverted Breve';
    $0207:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Inverted Breve';
    $0208:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0209:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $020A:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Inverted Breve';
    $020B:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Inverted Breve';
    $020C:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $020D:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $020E:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Inverted Breve';
    $020F:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Inverted Breve';
    $0210:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0211:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0212:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Inverted Breve';
    $0213:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Inverted Breve';
    $0214:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0215:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Double' + #32 + CGrave;
    $0216:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Inverted Breve';
    $0217:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Inverted Breve';
    $0250:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'A';
    $0251:
      Result := CSmall + #32 + CLetter + #32 + CAlpha;
    $0252:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + CAlpha;
    $0253:
      Result := CSmall + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 + 'Hook';
    $0254:
      Result := CSmall + #32 + CLetter + #32 + 'Open O';
    $0255:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 + 'Curl';
    $0256:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 + 'Tail';
    $0257:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 + 'Hook';
    $0258:
      Result := CSmall + #32 + CLetter + #32 + 'Reversed E';
    $0259:
      Result := CSmall + #32 + CLetter + #32 + 'Schwa';
    $025A:
      Result := CSmall + #32 + CLetter + #32 + 'Schwa' + #32 + CWith +
        #32 + 'Hook';
    $025B:
      Result := CSmall + #32 + CLetter + #32 + 'Open E';
    $025C:
      Result := CSmall + #32 + CLetter + #32 + 'Reversed Open E';
    $025D:
      Result := CSmall + #32 + CLetter + #32 + 'Reversed Open E' + #32 + CWith +
        #32 + 'Hook';
    $025E:
      Result := CSmall + #32 + CLetter + #32 + 'Closed Reversed Open E';
    $025F:
      Result := CSmall + #32 + CLetter + #32 + 'Dotless J' + #32 + CWith + #32
        + 'Stroke';
    $0260:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32 + 'Hook';
    $0261:
      Result := CSmall + #32 + CLetter + #32 + 'Script G';
    $0262:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'G';
    $0263:
      Result := CSmall + #32 + CLetter + #32 + CGamma;
    $0264:
      Result := CSmall + #32 + CLetter + #32 + 'Rams' + #32 + CHorn;
    $0265:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'H';
    $0266:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 + 'Hook';
    $0267:
      Result := CSmall + #32 + CLetter + #32 + 'Heng' + #32 + CWith +
        #32 + 'Hook';
    $0268:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Stroke';
    $0269:
      Result := CSmall + #32 + CLetter + #32 + 'Iota';
    $026A:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'I';
    $026B:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Middle' + #32 + CTilde;
    $026C:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 + 'Belt';
    $026D:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Retroflex Hook';
    $026E:
      Result := CSmall + #32 + CLetter + #32 + 'Lezh';
    $026F:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'M';
    $0270:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'M' + #32 + CWith
        + #32 + 'Long Leg';
    $0271:
      Result := CSmall + #32 + CLetter + #32 + 'M' + #32 + CWith + #32 + 'Hook';
    $0272:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        CLeft + #32 + 'Hook';
    $0273:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Retroflex Hook';
    $0274:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'N';
    $0275:
      Result := CSmall + #32 + CLetter + #32 + 'Barred O';
    $0276:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'Oe';
    $0277:
      Result := CSmall + #32 + CLetter + #32 + 'Closed' + #32 + COmega;
    $0278:
      Result := CSmall + #32 + CLetter + #32 + 'Phi';
    $0279:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'R';
    $027A:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'R' + #32 + CWith
        + #32 + 'Long Leg';
    $027B:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'R' + #32 + CWith
        + #32 + 'Hook';
    $027C:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Long Leg';
    $027D:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 + 'Tail';
    $027E:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Fishhook';
    $027F:
      Result := CSmall + #32 + CLetter + #32 + 'Reversed R' + #32 + CWith + #32
        + 'Fishhook';
    $0280:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'R';
    $0281:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'Inverted R';
    $0282:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 + 'Hook';
    $0283:
      Result := CSmall + #32 + CLetter + #32 + 'Esh';
    $0284:
      Result := CSmall + #32 + CLetter + #32 + 'Dotless J' + #32 + CWith + #32 +
        'Stroke and Hook';
    $0285:
      Result := CSmall + #32 + CLetter + #32 + 'Squat Reversed Esh';
    $0286:
      Result := CSmall + #32 + CLetter + #32 + 'Esh' + #32 + CWith +
        #32 + 'Curl';
    $0287:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'T';
    $0288:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Retroflex Hook';
    $0289:
      Result := CSmall + #32 + CLetter + #32 + 'U Bar';
    $028A:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon';
    $028B:
      Result := CSmall + #32 + CLetter + #32 + 'V' + #32 + CWith + #32 + 'Hook';
    $028C:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'V';
    $028D:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'W';
    $028E:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'Y';
    $028F:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'Y';
    $0290:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Retroflex Hook';
    $0291:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 + 'Curl';
    $0292:
      Result := CSmall + #32 + CLetter + #32 + 'Ezh';
    $0293:
      Result := CSmall + #32 + CLetter + #32 + 'Ezh' + #32 + CWith +
        #32 + 'Curl';
    $0294:
      Result := CLetter + #32 + 'Glottal Stop';
    $0295:
      Result := CLetter + #32 + 'Pharyngeal Voiced Fricative';
    $0296:
      Result := CLetter + #32 + 'Inverted Glottal Stop';
    $0297:
      Result := CLetter + #32 + 'Stretched C';
    $0298:
      Result := CLetter + #32 + 'Bilabial Click';
    $0299:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'B';
    $029A:
      Result := CSmall + #32 + CLetter + #32 + 'Closed Open E';
    $029B:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'G' + #32 +
        CWith + #32 + 'Hook';
    $029C:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'H';
    $029D:
      Result := CSmall + #32 + CLetter + #32 + 'J' + #32 + CWith + #32 +
        'Crossed-Tail';
    $029E:
      Result := CSmall + #32 + CLetter + #32 + CTurned + #32 + 'K';
    $029F:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'L';
    $02A0:
      Result := CSmall + #32 + CLetter + #32 + 'Q' + #32 + CWith + #32 + 'Hook';
    $02A1:
      Result := CLetter + #32 + 'Glottal Stop' + #32 + CWith + #32 + 'Stroke';
    $02A2:
      Result := CLetter + #32 + 'Reversed Glottal Stop' + #32 + CWith + #32
        + 'Stroke';
    $02A3:
      Result := CSmall + #32 + CLetter + #32 + 'Dz Digraph';
    $02A4:
      Result := CSmall + #32 + CLetter + #32 + 'Dezh Digraph';
    $02A5:
      Result := CSmall + #32 + CLetter + #32 + 'Dz Digraph' + #32 + CWith +
        #32 + 'Curl';
    $02A6:
      Result := CSmall + #32 + CLetter + #32 + 'Ts Digraph';
    $02A7:
      Result := CSmall + #32 + CLetter + #32 + 'Tesh Digraph';
    $02A8:
      Result := CSmall + #32 + CLetter + #32 + 'Tc Digraph' + #32 + CWith +
        #32 + 'Curl';
    $1E00:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Ring Below';
    $1E01:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Ring Below';
    $1E02:
      Result := CCapital + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 +
        'Dot Above';
    $1E03:
      Result := CSmall + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 +
        'Dot Above';
    $1E04:
      Result := CCapital + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 +
        'Dot Below';
    $1E05:
      Result := CSmall + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 +
        'Dot Below';
    $1E06:
      Result := CCapital + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 +
        'Line Below';
    $1E07:
      Result := CSmall + #32 + CLetter + #32 + 'B' + #32 + CWith + #32 +
        'Line Below';
    $1E08:
      Result := CCapital + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 +
        'Cedilla and' + #32 + CAcute;
    $1E09:
      Result := CSmall + #32 + CLetter + #32 + 'C' + #32 + CWith + #32 +
        'Cedilla and' + #32 + CAcute;
    $1E0A:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Dot Above';
    $1E0B:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Dot Above';
    $1E0C:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Dot Below';
    $1E0D:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Dot Below';
    $1E0E:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Line Below';
    $1E0F:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        'Line Below';
    $1E10:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + CCedilla;
    $1E11:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32
        + CCedilla;
    $1E12:
      Result := CCapital + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E13:
      Result := CSmall + #32 + CLetter + #32 + 'D' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E14:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Macron and' + #32 + CGrave;
    $1E15:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Macron and' + #32 + CGrave;
    $1E16:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Macron and' + #32 + CAcute;
    $1E17:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Macron and' + #32 + CAcute;
    $1E18:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E19:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E1A:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CTilde + #32 + 'Below';
    $1E1B:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 + CTilde
        + #32 + 'Below';
    $1E1C:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Cedilla and Breve';
    $1E1D:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Cedilla and Breve';
    $1E1E:
      Result := CCapital + #32 + CLetter + #32 + 'F' + #32 + CWith + #32 +
        'Dot Above';
    $1E1F:
      Result := CSmall + #32 + CLetter + #32 + 'F' + #32 + CWith + #32 +
        'Dot Above';
    $1E20:
      Result := CCapital + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Macron';
    $1E21:
      Result := CSmall + #32 + CLetter + #32 + 'G' + #32 + CWith + #32
        + 'Macron';
    $1E22:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Dot Above';
    $1E23:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Dot Above';
    $1E24:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Dot Below';
    $1E25:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Dot Below';
    $1E26:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        CDiaeresis;
    $1E27:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        CDiaeresis;
    $1E28:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32
        + CCedilla;
    $1E29:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32
        + CCedilla;
    $1E2A:
      Result := CCapital + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Breve Below';
    $1E2B:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Breve Below';
    $1E2C:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CTilde + #32 + 'Below';
    $1E2D:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 + CTilde
        + #32 + 'Below';
    $1E2E:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + CAcute;
    $1E2F:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        CDiaeresis + #32 + CAnd + #32 + CAcute;
    $1E30:
      Result := CCapital + #32 + CLetter + #32 + 'K' + #32 + CWith +
        #32 + CAcute;
    $1E31:
      Result := CSmall + #32 + CLetter + #32 + 'K' + #32 + CWith + #32 + CAcute;
    $1E32:
      Result := CCapital + #32 + CLetter + #32 + 'K' + #32 + CWith + #32 +
        'Dot Below';
    $1E33:
      Result := CSmall + #32 + CLetter + #32 + 'K' + #32 + CWith + #32 +
        'Dot Below';
    $1E34:
      Result := CCapital + #32 + CLetter + #32 + 'K' + #32 + CWith + #32 +
        'Line Below';
    $1E35:
      Result := CSmall + #32 + CLetter + #32 + 'K' + #32 + CWith + #32 +
        'Line Below';
    $1E36:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Dot Below';
    $1E37:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Dot Below';
    $1E38:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Dot Below and Macron';
    $1E39:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Dot Below and Macron';
    $1E3A:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Line Below';
    $1E3B:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        'Line Below';
    $1E3C:
      Result := CCapital + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E3D:
      Result := CSmall + #32 + CLetter + #32 + 'L' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E3E:
      Result := CCapital + #32 + CLetter + #32 + 'M' + #32 + CWith +
        #32 + CAcute;
    $1E3F:
      Result := CSmall + #32 + CLetter + #32 + 'M' + #32 + CWith + #32 + CAcute;
    $1E40:
      Result := CCapital + #32 + CLetter + #32 + 'M' + #32 + CWith + #32 +
        'Dot Above';
    $1E41:
      Result := CSmall + #32 + CLetter + #32 + 'M' + #32 + CWith + #32 +
        'Dot Above';
    $1E42:
      Result := CCapital + #32 + CLetter + #32 + 'M' + #32 + CWith + #32 +
        'Dot Below';
    $1E43:
      Result := CSmall + #32 + CLetter + #32 + 'M' + #32 + CWith + #32 +
        'Dot Below';
    $1E44:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Dot Above';
    $1E45:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Dot Above';
    $1E46:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Dot Below';
    $1E47:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Dot Below';
    $1E48:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Line Below';
    $1E49:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        'Line Below';
    $1E4A:
      Result := CCapital + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E4B:
      Result := CSmall + #32 + CLetter + #32 + 'N' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E4C:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CTilde + #32 + CAnd + #32 + CAcute;
    $1E4D:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CTilde
        + #32 + CAnd + #32 + CAcute;
    $1E4E:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CTilde + #32 + CAnd + #32 + 'Diaresis';
    $1E4F:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CTilde
        + #32 + CAnd + #32 + 'Diaresis';
    $1E50:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Macron and' + #32 + CGrave;
    $1E51:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Macron and' + #32 + CGrave;
    $1E52:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Macron and' + #32 + CAcute;
    $1E53:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Macron and' + #32 + CAcute;
    $1E54:
      Result := CCapital + #32 + CLetter + #32 + 'P' + #32 + CWith +
        #32 + CAcute;
    $1E55:
      Result := CSmall + #32 + CLetter + #32 + 'P' + #32 + CWith + #32 + CAcute;
    $1E56:
      Result := CCapital + #32 + CLetter + #32 + 'P' + #32 + CWith + #32 +
        'Dot Above';
    $1E57:
      Result := CSmall + #32 + CLetter + #32 + 'P' + #32 + CWith + #32 +
        'Dot Above';
    $1E58:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Dot Above';
    $1E59:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Dot Above';
    $1E5A:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Dot Below';
    $1E5B:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Dot Below';
    $1E5C:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Dot Below and Macron';
    $1E5D:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Dot Below and Macron';
    $1E5E:
      Result := CCapital + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Line Below';
    $1E5F:
      Result := CSmall + #32 + CLetter + #32 + 'R' + #32 + CWith + #32 +
        'Line Below';
    $1E60:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Dot Above';
    $1E61:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Dot Above';
    $1E62:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Dot Below';
    $1E63:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Dot Below';
    $1E64:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Acute and Dot Above';
    $1E65:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Acute and Dot Above';
    $1E66:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Caron and Dot Above';
    $1E67:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Caron and Dot Above';
    $1E68:
      Result := CCapital + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Dot Below and Dot Above';
    $1E69:
      Result := CSmall + #32 + CLetter + #32 + 'S' + #32 + CWith + #32 +
        'Dot Below and Dot Above';
    $1E6A:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Dot Above';
    $1E6B:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Dot Above';
    $1E6C:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Dot Below';
    $1E6D:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Dot Below';
    $1E6E:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Line Below';
    $1E6F:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Line Below';
    $1E70:
      Result := CCapital + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E71:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E72:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Diaresis Below';
    $1E73:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Diaresis Below';
    $1E74:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CTilde + #32 + 'Below';
    $1E75:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CTilde
        + #32 + 'Below';
    $1E76:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E77:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CCircumflex + #32 + 'Below';
    $1E78:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        CTilde + #32 + CAnd + #32 + CAcute;
    $1E79:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CTilde
        + #32 + CAnd + #32 + CAcute;
    $1E7A:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Macron and Diaresis';
    $1E7B:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Macron and Diaresis';
    $1E7C:
      Result := CCapital + #32 + CLetter + #32 + 'V' + #32 + CWith +
        #32 + CTilde;
    $1E7D:
      Result := CSmall + #32 + CLetter + #32 + 'V' + #32 + CWith + #32 + CTilde;
    $1E7E:
      Result := CCapital + #32 + CLetter + #32 + 'V' + #32 + CWith + #32 +
        'Dot Below';
    $1E7F:
      Result := CSmall + #32 + CLetter + #32 + 'V' + #32 + CWith + #32 +
        'Dot Below';
    $1E80:
      Result := CCapital + #32 + CLetter + #32 + 'W' + #32 + CWith +
        #32 + CGrave;
    $1E81:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 + CGrave;
    $1E82:
      Result := CCapital + #32 + CLetter + #32 + 'W' + #32 + CWith +
        #32 + CAcute;
    $1E83:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 + CAcute;
    $1E84:
      Result := CCapital + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Diaresis';
    $1E85:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Diaresis';
    $1E86:
      Result := CCapital + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Dot Above';
    $1E87:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Dot Above';
    $1E88:
      Result := CCapital + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Dot Below';
    $1E89:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Dot Below';
    $1E8A:
      Result := CCapital + #32 + CLetter + #32 + 'X' + #32 + CWith + #32 +
        'Dot Above';
    $1E8B:
      Result := CSmall + #32 + CLetter + #32 + 'X' + #32 + CWith + #32 +
        'Dot Above';
    $1E8C:
      Result := CCapital + #32 + CLetter + #32 + 'X' + #32 + CWith + #32 +
        'Diaresis';
    $1E8D:
      Result := CSmall + #32 + CLetter + #32 + 'X' + #32 + CWith + #32 +
        'Diaresis';
    $1E8E:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Dot Above';
    $1E8F:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Dot Above';
    $1E90:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        CCircumflex;
    $1E91:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        CCircumflex;
    $1E92:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Dot Below';
    $1E93:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Dot Below';
    $1E94:
      Result := CCapital + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Line Below';
    $1E95:
      Result := CSmall + #32 + CLetter + #32 + 'Z' + #32 + CWith + #32 +
        'Line Below';
    $1E96:
      Result := CSmall + #32 + CLetter + #32 + 'H' + #32 + CWith + #32 +
        'Line Below';
    $1E97:
      Result := CSmall + #32 + CLetter + #32 + 'T' + #32 + CWith + #32 +
        'Diaresis';
    $1E98:
      Result := CSmall + #32 + CLetter + #32 + 'W' + #32 + CWith + #32 +
        'Ring Above';
    $1E99:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Ring Above';
    $1E9A:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CRight + #32 + 'Half Ring';
    $1EA0:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Dot Below';
    $1EA1:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Dot Below';
    $1EA2:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Hook Above';
    $1EA3:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Hook Above';
    $1EA4:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CAcute;
    $1EA5:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CAcute;
    $1EA6:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CGrave;
    $1EA7:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CGrave;
    $1EA8:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Hook Above';
    $1EA9:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Hook Above';
    $1EAA:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CTilde;
    $1EAB:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CTilde;
    $1EAC:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Dot Below';
    $1EAD:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Dot Below';
    $1EAE:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and' + #32 + CAcute;
    $1EAF:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and' + #32 + CAcute;
    $1EB0:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and' + #32 + CGrave;
    $1EB1:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and' + #32 + CGrave;
    $1EB2:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and Hook Above';
    $1EB3:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and Hook Above';
    $1EB4:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and' + #32 + CTilde;
    $1EB5:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and' + #32 + CTilde;
    $1EB6:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and Dot Below';
    $1EB7:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Breve and Dot Below';
    $1EB8:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Dot Below';
    $1EB9:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Dot Below';
    $1EBA:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Hook Above';
    $1EBB:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        'Hook Above';
    $1EBC:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith +
        #32 + CTilde;
    $1EBD:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 + CTilde;
    $1EBE:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CAcute;
    $1EBF:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CAcute;
    $1EC0:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CGrave;
    $1EC1:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CGrave;
    $1EC2:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Hook Above';
    $1EC3:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Hook Above';
    $1EC4:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CTilde;
    $1EC5:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CTilde;
    $1EC6:
      Result := CCapital + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Dot Below';
    $1EC7:
      Result := CSmall + #32 + CLetter + #32 + 'E' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Dot Below';
    $1EC8:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Hook Above';
    $1EC9:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Hook Above';
    $1ECA:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Dot Below';
    $1ECB:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Dot Below';
    $1ECC:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Dot Below';
    $1ECD:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Dot Below';
    $1ECE:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Hook Above';
    $1ECF:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Hook Above';
    $1ED0:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CAcute;
    $1ED1:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CAcute;
    $1ED2:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CGrave;
    $1ED3:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CGrave;
    $1ED4:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Hook Above';
    $1ED5:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Hook Above';
    $1ED6:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CTilde;
    $1ED7:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + CTilde;
    $1ED8:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Dot Below';
    $1ED9:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        CCircumflex + #32 + CAnd + #32 + 'Dot Below';
    $1EDA:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + CAcute;
    $1EDB:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + CAcute;
    $1EDC:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + CGrave;
    $1EDD:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + CGrave;
    $1EDE:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + 'Hook Above';
    $1EDF:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + 'Hook Above';
    $1EE0:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + CTilde;
    $1EE1:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + CTilde;
    $1EE2:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + 'Dot Below';
    $1EE3:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + 'Dot Below';
    $1EE4:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Dot Below';
    $1EE5:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Dot Below';
    $1EE6:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Hook Above';
    $1EE7:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Hook Above';
    $1EE8:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + CAcute;
    $1EE9:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + CAcute;
    $1EEA:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + CGrave;
    $1EEB:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + CGrave;
    $1EEC:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + 'Hook Above';
    $1EED:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + 'Hook Above';
    $1EEE:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + CTilde;
    $1EEF:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + CTilde;
    $1EF0:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn
        + #32 + CAnd + #32 + 'Dot Below';
    $1EF1:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 + CHorn +
        #32 + CAnd + #32 + 'Dot Below';
    $1EF2:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith +
        #32 + CGrave;
    $1EF3:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 + CGrave;
    $1EF4:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Dot Below';
    $1EF5:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Dot Below';
    $1EF6:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Hook Above';
    $1EF7:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 +
        'Hook Above';
    $1EF8:
      Result := CCapital + #32 + CLetter + #32 + 'Y' + #32 + CWith +
        #32 + CTilde;
    $1EF9:
      Result := CSmall + #32 + CLetter + #32 + 'Y' + #32 + CWith + #32 + CTilde;
    $271D:
      Result := 'Cross';
    $FB00:
      Result := CSmall + #32 + CLigature + #32 + 'FF';
    $FB01:
      Result := CSmall + #32 + CLigature + #32 + 'FI';
    $FB02:
      Result := CSmall + #32 + CLigature + #32 + 'FL';
    $FB03:
      Result := CSmall + #32 + CLigature + #32 + 'FFI';
    $FB04:
      Result := CSmall + #32 + CLigature + #32 + 'FFL';
    $FB05:
      Result := CSmall + #32 + CLigature + #32 + 'LONG S T';
    $FB06:
      Result := CSmall + #32 + CLigature + #32 + 'ST';
  else
    Result := '';
  end;

  // add 'Latin' to string
  if Result <> '' then
    Result := 'Latin' + #32 + Result;
end;

function GetGreekUnicodeName(Value: Word): string;
begin
  case Value of
    $0374:
      Result := 'Numeral Sign';
    $0375:
      Result := CLower + #32 + 'Numeral Sign';
    $037A:
      Result := 'Ypogegrammeni';
    $037E:
      Result := 'Question Mark';
    $0384:
      Result := 'Tonos';
    $0385:
      Result := 'Dialytika Tonos';
    $0386:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Tonos';
    $0387:
      Result := 'Ano Teleia';
    $0388:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Tonos';
    $0389:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Tonos';
    $038A:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Tonos';
    $038C:
      Result := CCapital + #32 + CLetter + #32 + 'Omicron' + #32 + CWith + #32
        + 'Tonos';
    $038E:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Tonos';
    $038F:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Tonos';
    $0390:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dialytika And Tonos';
    $0391:
      Result := CCapital + #32 + CLetter + #32 + CAlpha;
    $0392:
      Result := CCapital + #32 + CLetter + #32 + CBeta;
    $0393:
      Result := CCapital + #32 + CLetter + #32 + CGamma;
    $0394:
      Result := CCapital + #32 + CLetter + #32 + CDelta;
    $0395:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon';
    $0396:
      Result := CCapital + #32 + CLetter + #32 + 'Zeta';
    $0397:
      Result := CCapital + #32 + CLetter + #32 + 'Eta';
    $0398:
      Result := CCapital + #32 + CLetter + #32 + 'Theta';
    $0399:
      Result := CCapital + #32 + CLetter + #32 + 'Iota';
    $039A:
      Result := CCapital + #32 + CLetter + #32 + 'Kappa';
    $039B:
      Result := CCapital + #32 + CLetter + #32 + 'Lamda';
    $039C:
      Result := CCapital + #32 + CLetter + #32 + 'Mu';
    $039D:
      Result := CCapital + #32 + CLetter + #32 + 'Nu';
    $039E:
      Result := CCapital + #32 + CLetter + #32 + 'Xi';
    $039F:
      Result := CCapital + #32 + CLetter + #32 + 'Omicron';
    $03A0:
      Result := CCapital + #32 + CLetter + #32 + 'Pi';
    $03A1:
      Result := CCapital + #32 + CLetter + #32 + 'Rho';
    $03A3:
      Result := CCapital + #32 + CLetter + #32 + 'Sigma';
    $03A4:
      Result := CCapital + #32 + CLetter + #32 + 'Tau';
    $03A5:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon';
    $03A6:
      Result := CCapital + #32 + CLetter + #32 + 'Phi';
    $03A7:
      Result := CCapital + #32 + CLetter + #32 + 'Chi';
    $03A8:
      Result := CCapital + #32 + CLetter + #32 + 'Psi';
    $03A9:
      Result := CCapital + #32 + CLetter + #32 + COmega;
    $03AA:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dialytika';
    $03AB:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dialytika';
    $03AC:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Tonos';
    $03AD:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Tonos';
    $03AE:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Tonos';
    $03AF:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Tonos';
    $03B0:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dialytika And Tonos';
    $03B1:
      Result := CSmall + #32 + CLetter + #32 + CAlpha;
    $03B2:
      Result := CSmall + #32 + CLetter + #32 + CBeta;
    $03B3:
      Result := CSmall + #32 + CLetter + #32 + CGamma;
    $03B4:
      Result := CSmall + #32 + CLetter + #32 + CDelta;
    $03B5:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon';
    $03B6:
      Result := CSmall + #32 + CLetter + #32 + 'Zeta';
    $03B7:
      Result := CSmall + #32 + CLetter + #32 + 'Eta';
    $03B8:
      Result := CSmall + #32 + CLetter + #32 + 'Theta';
    $03B9:
      Result := CSmall + #32 + CLetter + #32 + 'Iota';
    $03BA:
      Result := CSmall + #32 + CLetter + #32 + 'Kappa';
    $03BB:
      Result := CSmall + #32 + CLetter + #32 + 'Lamda';
    $03BC:
      Result := CSmall + #32 + CLetter + #32 + 'Mu';
    $03BD:
      Result := CSmall + #32 + CLetter + #32 + 'Nu';
    $03BE:
      Result := CSmall + #32 + CLetter + #32 + 'Xi';
    $03BF:
      Result := CSmall + #32 + CLetter + #32 + 'Omicron';
    $03C0:
      Result := CSmall + #32 + CLetter + #32 + 'Pi';
    $03C1:
      Result := CSmall + #32 + CLetter + #32 + 'Rho';
    $03C2:
      Result := CSmall + #32 + CLetter + #32 + 'Final Sigma';
    $03C3:
      Result := CSmall + #32 + CLetter + #32 + 'Sigma';
    $03C4:
      Result := CSmall + #32 + CLetter + #32 + 'Tau';
    $03C5:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon';
    $03C6:
      Result := CSmall + #32 + CLetter + #32 + 'Phi';
    $03C7:
      Result := CSmall + #32 + CLetter + #32 + 'Chi';
    $03C8:
      Result := CSmall + #32 + CLetter + #32 + 'Psi';
    $03C9:
      Result := CSmall + #32 + CLetter + #32 + COmega;
    $03CA:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dialytika';
    $03CB:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dialytika';
    $03CC:
      Result := CSmall + #32 + CLetter + #32 + 'Omicron' + #32 + CWith + #32
        + 'Tonos';
    $03CD:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Tonos';
    $03CE:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Tonos';
    $03D0:
      Result := CBeta + #32 + 'Symbol';
    $03D1:
      Result := 'Theta Symbol';
    $03D2:
      Result := 'Upsilon' + #32 + CWith + #32 + 'Hook Symbol';
    $03D3:
      Result := 'Upsilon' + #32 + CWith + #32 + 'Acute And Hook Symbol';
    $03D4:
      Result := 'Upsilon' + #32 + CWith + #32 + 'Diaresis And Hook Symbol';
    $03D5:
      Result := 'Phi Symbol';
    $03D6:
      Result := 'Pi Symbol';
    $03DA:
      Result := CLetter + #32 + 'Stigma';
    $03DC:
      Result := CLetter + #32 + 'Digamma';
    $03DE:
      Result := CLetter + #32 + 'Koppa';
    $03E0:
      Result := CLetter + #32 + 'Sampi';
    $03F0:
      Result := 'Kappa Symbol';
    $03F1:
      Result := 'Rho Symbol';
    $03F2:
      Result := 'Lunate Sigma Symbol';
    $03F3:
      Result := CLetter + #32 + 'Yot';
    $1F00:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Psili';
    $1F01:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Dasia';
    $1F02:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Varia';
    $1F03:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F04:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F05:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F06:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F07:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F08:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Psili';
    $1F09:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Dasia';
    $1F0A:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Varia';
    $1F0B:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F0C:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F0D:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F0E:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F0F:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F10:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Psili';
    $1F11:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Dasia';
    $1F12:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F13:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F14:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F15:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F18:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Psili';
    $1F19:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Dasia';
    $1F1A:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F1B:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F1C:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F1D:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F20:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Psili';
    $1F21:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Dasia';
    $1F22:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F23:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F24:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F25:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F26:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F27:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F28:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Psili';
    $1F29:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Dasia';
    $1F2A:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F2B:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F2C:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F2D:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F2E:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F2F:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F30:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Psili';
    $1F31:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Dasia';
    $1F32:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F33:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F34:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F35:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F36:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F37:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F38:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Psili';
    $1F39:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Dasia';
    $1F3A:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F3B:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F3C:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F3D:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F3E:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F3F:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F40:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Psili';
    $1F41:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Dasia';
    $1F42:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F43:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F44:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F45:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F48:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Psili';
    $1F49:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Dasia';
    $1F4A:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Psili and Varia';
    $1F4B:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Dasia and Varia';
    $1F4C:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Psili and Oxia';
    $1F4D:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Dasia and Oxia';
    $1F50:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Psili';
    $1F51:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Dasia';
    $1F52:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Psili and Varia';
    $1F53:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F54:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F55:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F56:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F57:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F59:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Dasia';
    $1F5B:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F5D:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F5F:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F60:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Psili';
    $1F61:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Dasia';
    $1F62:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Varia';
    $1F63:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F64:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F65:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F66:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F67:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F68:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Psili';
    $1F69:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Dasia';
    $1F6A:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Varia';
    $1F6B:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Varia';
    $1F6C:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Oxia';
    $1F6D:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Oxia';
    $1F6E:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Perispomeni';
    $1F6F:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Perispomeni';
    $1F70:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Varia';
    $1F71:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith +
        #32 + 'Oxia';
    $1F72:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Varia';
    $1F73:
      Result := CSmall + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith +
        #32 + 'Oxia';
    $1F74:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Varia';
    $1F75:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith +
        #32 + 'Oxia';
    $1F76:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Varia';
    $1F77:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith +
        #32 + 'Oxia';
    $1F78:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Varia';
    $1F79:
      Result := CSmall + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith +
        #32 + 'Oxia';
    $1F7A:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Varia';
    $1F7B:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith +
        #32 + 'Oxia';
    $1F7C:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Varia';
    $1F7D:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith +
        #32 + 'Oxia';
    $1F80:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Ypogegrammeni';
    $1F81:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Ypogegrammeni';
    $1F82:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Varia and Ypogegrammeni';
    $1F83:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Varia and Ypogegrammeni';
    $1F84:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Oxia and Ypogegrammeni';
    $1F85:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Oxia and Ypogegrammeni';
    $1F86:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Perispomeni and Ypogegrammeni';
    $1F87:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Perispomeni and Ypogegrammeni';
    $1F88:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Prosgegrammeni';
    $1F89:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Prosgegrammeni';
    $1F8A:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Varia and Prosgegrammeni';
    $1F8B:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Varia and Prosgegrammeni';
    $1F8C:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Oxia and Prosgegrammeni';
    $1F8D:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Oxia and Prosgegrammeni';
    $1F8E:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Psili and Perispomeni and Prosgegrammeni';
    $1F8F:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Dasia and Perispomeni and Prosgegrammeni';
    $1F90:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Ypogegrammeni';
    $1F91:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Ypogegrammeni';
    $1F92:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Varia and Ypogegrammeni';
    $1F93:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Varia and Ypogegrammeni';
    $1F94:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Oxia and Ypogegrammeni';
    $1F95:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Oxia and Ypogegrammeni';
    $1F96:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Perispomeni and Ypogegrammeni';
    $1F97:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Perispomeni and Ypogegrammeni';
    $1F98:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Prosgegrammeni';
    $1F99:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Prosgegrammeni';
    $1F9A:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Varia and Prosgegrammeni';
    $1F9B:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Varia and Prosgegrammeni';
    $1F9C:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Oxia and Prosgegrammeni';
    $1F9D:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Oxia and Prosgegrammeni';
    $1F9E:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Psili and Perispomeni and Prosgegrammeni';
    $1F9F:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Dasia and Perispomeni and Prosgegrammeni';
    $1FA0:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Ypogegrammeni';
    $1FA1:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Ypogegrammeni';
    $1FA2:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Varia and Ypogegrammeni';
    $1FA3:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Varia and Ypogegrammeni';
    $1FA4:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Oxia and Ypogegrammeni';
    $1FA5:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Oxia and Ypogegrammeni';
    $1FA6:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Perispomeni and Ypogegrammeni';
    $1FA7:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Perispomeni and Ypogegrammeni';
    $1FA8:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Prosgegrammeni';
    $1FA9:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Prosgegrammeni';
    $1FAA:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Varia and Prosgegrammeni';
    $1FAB:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Varia and Prosgegrammeni';
    $1FAC:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Oxia and Prosgegrammeni';
    $1FAD:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Oxia and Prosgegrammeni';
    $1FAE:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Psili and Perispomeni and Prosgegrammeni';
    $1FAF:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Dasia and Perispomeni and Prosgegrammeni';
    $1FB0:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Vrachy';
    $1FB1:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Macron';
    $1FB2:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Varia and Ypogegrammeni';
    $1FB3:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Ypogegrammeni';
    $1FB4:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Oxia and Ypogegrammeni';
    $1FB6:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Perispomeni';
    $1FB7:
      Result := CSmall + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Perispomeni and Ypogegrammeni';
    $1FB8:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Vrachy';
    $1FB9:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Macron';
    $1FBA:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32
        + 'Varia';
    $1FBB:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith +
        #32 + 'Oxia';
    $1FBC:
      Result := CCapital + #32 + CLetter + #32 + CAlpha + #32 + CWith + #32 +
        'Prosgegrammeni';
    $1FBD:
      Result := 'Koronis';
    $1FBE:
      Result := 'Prosgegrammeni';
    $1FBF:
      Result := 'Psili';
    $1FC0:
      Result := 'Perispomeni';
    $1FC1:
      Result := 'Dialytika And Perispomeni';
    $1FC2:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Varia and Ypogegrammeni';
    $1FC3:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Ypogegrammeni';
    $1FC4:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Oxia and Ypogegrammeni';
    $1FC6:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Perispomeni';
    $1FC7:
      Result := CSmall + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Perispomeni and Ypogegrammeni';
    $1FC8:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith + #32
        + 'Varia';
    $1FC9:
      Result := CCapital + #32 + CLetter + #32 + 'Epsilon' + #32 + CWith +
        #32 + 'Oxia';
    $1FCA:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32
        + 'Varia';
    $1FCB:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith +
        #32 + 'Oxia';
    $1FCC:
      Result := CCapital + #32 + CLetter + #32 + 'Eta' + #32 + CWith + #32 +
        'Prosgegrammeni';
    $1FCD:
      Result := 'Psili and Varia';
    $1FCE:
      Result := 'Psili and Oxia';
    $1FCF:
      Result := 'Psili and Perispomeni';
    $1FD0:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Vrachy';
    $1FD1:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Macron';
    $1FD2:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dialytika And Varia';
    $1FD3:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dialytika And Oxia';
    $1FD6:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Perispomeni';
    $1FD7:
      Result := CSmall + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32 +
        'Dialytika And Perispomeni';
    $1FD8:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Vrachy';
    $1FD9:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Macron';
    $1FDA:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith + #32
        + 'Varia';
    $1FDB:
      Result := CCapital + #32 + CLetter + #32 + 'Iota' + #32 + CWith +
        #32 + 'Oxia';
    $1FDD:
      Result := 'Dasia and Varia';
    $1FDE:
      Result := 'Dasia and Oxia';
    $1FDF:
      Result := 'Dasia and Perispomeni';
    $1FE0:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Vrachy';
    $1FE1:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Macron';
    $1FE2:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dialytika And Varia';
    $1FE3:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dialytika And Oxia';
    $1FE4:
      Result := CSmall + #32 + CLetter + #32 + 'Rho' + #32 + CWith + #32
        + 'Psili';
    $1FE5:
      Result := CSmall + #32 + CLetter + #32 + 'Rho' + #32 + CWith + #32
        + 'Dasia';
    $1FE6:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Perispomeni';
    $1FE7:
      Result := CSmall + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32 +
        'Dialytika And Perispomeni';
    $1FE8:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Vrachy';
    $1FE9:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Macron';
    $1FEA:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith + #32
        + 'Varia';
    $1FEB:
      Result := CCapital + #32 + CLetter + #32 + 'Upsilon' + #32 + CWith +
        #32 + 'Oxia';
    $1FEC:
      Result := CCapital + #32 + CLetter + #32 + 'RHO' + #32 + CWith + #32
        + 'Dasia';
    $1FED:
      Result := 'Dialytika And Varia';
    $1FEE:
      Result := 'Dialytika And Oxia';
    $1FEF:
      Result := 'Varia';
    $1FF2:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Varia and Ypogegrammeni';
    $1FF3:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Ypogegrammeni';
    $1FF4:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Oxia and Ypogegrammeni';
    $1FF6:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Perispomeni';
    $1FF7:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Perispomeni and Ypogegrammeni';
    $1FF8:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith + #32
        + 'Varia';
    $1FF9:
      Result := CCapital + #32 + CLetter + #32 + 'Omnicron' + #32 + CWith +
        #32 + 'Oxia';
    $1FFA:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Varia';
    $1FFB:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith +
        #32 + 'Oxia';
    $1FFC:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32 +
        'Prosgegrammeni';
    $1FFD:
      Result := 'Oxia';
    $1FFE:
      Result := 'Dasia';
  end;

  // add 'Greek' to string
  if Result <> '' then
    Result := 'Greek' + #32 + Result;
end;

function GetArmenianUnicodeName(Value: Word): string;
begin
  case Value of
    $0531:
      Result := CCapital + #32 + CLetter + #32 + 'Ayb';
    $0532:
      Result := CCapital + #32 + CLetter + #32 + 'Ben';
    $0533:
      Result := CCapital + #32 + CLetter + #32 + 'Gim';
    $0534:
      Result := CCapital + #32 + CLetter + #32 + 'Da';
    $0535:
      Result := CCapital + #32 + CLetter + #32 + 'Ech';
    $0536:
      Result := CCapital + #32 + CLetter + #32 + 'Za';
    $0537:
      Result := CCapital + #32 + CLetter + #32 + 'Eh';
    $0538:
      Result := CCapital + #32 + CLetter + #32 + 'Et';
    $0539:
      Result := CCapital + #32 + CLetter + #32 + 'To';
    $053A:
      Result := CCapital + #32 + CLetter + #32 + 'Zhe';
    $053B:
      Result := CCapital + #32 + CLetter + #32 + 'Ini';
    $053C:
      Result := CCapital + #32 + CLetter + #32 + 'Liwn';
    $053D:
      Result := CCapital + #32 + CLetter + #32 + 'Xeh';
    $053E:
      Result := CCapital + #32 + CLetter + #32 + 'Ca';
    $053F:
      Result := CCapital + #32 + CLetter + #32 + 'Ken';
    $0540:
      Result := CCapital + #32 + CLetter + #32 + 'Ho';
    $0541:
      Result := CCapital + #32 + CLetter + #32 + 'Ja';
    $0542:
      Result := CCapital + #32 + CLetter + #32 + 'Ghad';
    $0543:
      Result := CCapital + #32 + CLetter + #32 + 'Cheh';
    $0544:
      Result := CCapital + #32 + CLetter + #32 + 'Men';
    $0545:
      Result := CCapital + #32 + CLetter + #32 + 'Yi';
    $0546:
      Result := CCapital + #32 + CLetter + #32 + 'Now';
    $0547:
      Result := CCapital + #32 + CLetter + #32 + 'Sha';
    $0548:
      Result := CCapital + #32 + CLetter + #32 + 'Vo';
    $0549:
      Result := CCapital + #32 + CLetter + #32 + 'Cha';
    $054A:
      Result := CCapital + #32 + CLetter + #32 + 'Peh';
    $054B:
      Result := CCapital + #32 + CLetter + #32 + 'Jheh';
    $054C:
      Result := CCapital + #32 + CLetter + #32 + 'Ra';
    $054D:
      Result := CCapital + #32 + CLetter + #32 + 'Seh';
    $054E:
      Result := CCapital + #32 + CLetter + #32 + 'Vew';
    $054F:
      Result := CCapital + #32 + CLetter + #32 + 'Tiwn';
    $0550:
      Result := CCapital + #32 + CLetter + #32 + 'Reh';
    $0551:
      Result := CCapital + #32 + CLetter + #32 + 'Co';
    $0552:
      Result := CCapital + #32 + CLetter + #32 + 'Yiwn';
    $0553:
      Result := CCapital + #32 + CLetter + #32 + 'Piwr';
    $0554:
      Result := CCapital + #32 + CLetter + #32 + 'Keh';
    $0555:
      Result := CCapital + #32 + CLetter + #32 + 'Oh';
    $0556:
      Result := CCapital + #32 + CLetter + #32 + 'Feh';
    $0559:
      Result := 'Modifier' + #32 + CLetter + #32 + CLeft + #32 + 'Half Ring';
    $055A:
      Result := 'Apostrophe';
    $055B:
      Result := 'Emphasis Mark';
    $055C:
      Result := 'Exclamation Mark';
    $055D:
      Result := 'Comma';
    $055E:
      Result := 'Question Mark';
    $055F:
      Result := 'Abbreviation Mark';
    $0561:
      Result := CSmall + #32 + CLetter + #32 + 'Ayb';
    $0562:
      Result := CSmall + #32 + CLetter + #32 + 'Ben';
    $0563:
      Result := CSmall + #32 + CLetter + #32 + 'Gim';
    $0564:
      Result := CSmall + #32 + CLetter + #32 + 'Da';
    $0565:
      Result := CSmall + #32 + CLetter + #32 + 'Ech';
    $0566:
      Result := CSmall + #32 + CLetter + #32 + 'Za';
    $0567:
      Result := CSmall + #32 + CLetter + #32 + 'Eh';
    $0568:
      Result := CSmall + #32 + CLetter + #32 + 'Et';
    $0569:
      Result := CSmall + #32 + CLetter + #32 + 'To';
    $056A:
      Result := CSmall + #32 + CLetter + #32 + 'Zhe';
    $056B:
      Result := CSmall + #32 + CLetter + #32 + 'Ini';
    $056C:
      Result := CSmall + #32 + CLetter + #32 + 'Liwn';
    $056D:
      Result := CSmall + #32 + CLetter + #32 + 'Xeh';
    $056E:
      Result := CSmall + #32 + CLetter + #32 + 'Ca';
    $056F:
      Result := CSmall + #32 + CLetter + #32 + 'Ken';
    $0570:
      Result := CSmall + #32 + CLetter + #32 + 'Ho';
    $0571:
      Result := CSmall + #32 + CLetter + #32 + 'Ja';
    $0572:
      Result := CSmall + #32 + CLetter + #32 + 'Ghad';
    $0573:
      Result := CSmall + #32 + CLetter + #32 + 'Cheh';
    $0574:
      Result := CSmall + #32 + CLetter + #32 + 'Men';
    $0575:
      Result := CSmall + #32 + CLetter + #32 + 'Yi';
    $0576:
      Result := CSmall + #32 + CLetter + #32 + 'Now';
    $0577:
      Result := CSmall + #32 + CLetter + #32 + 'Sha';
    $0578:
      Result := CSmall + #32 + CLetter + #32 + 'Vo';
    $0579:
      Result := CSmall + #32 + CLetter + #32 + 'Cha';
    $057A:
      Result := CSmall + #32 + CLetter + #32 + 'Peh';
    $057B:
      Result := CSmall + #32 + CLetter + #32 + 'Jheh';
    $057C:
      Result := CSmall + #32 + CLetter + #32 + 'Ra';
    $057D:
      Result := CSmall + #32 + CLetter + #32 + 'Seh';
    $057E:
      Result := CSmall + #32 + CLetter + #32 + 'Vew';
    $057F:
      Result := CSmall + #32 + CLetter + #32 + 'Tiwn';
    $0580:
      Result := CSmall + #32 + CLetter + #32 + 'Reh';
    $0581:
      Result := CSmall + #32 + CLetter + #32 + 'Co';
    $0582:
      Result := CSmall + #32 + CLetter + #32 + 'Yiwn';
    $0583:
      Result := CSmall + #32 + CLetter + #32 + 'Piwr';
    $0584:
      Result := CSmall + #32 + CLetter + #32 + 'Keh';
    $0585:
      Result := CSmall + #32 + CLetter + #32 + 'Oh';
    $0586:
      Result := CSmall + #32 + CLetter + #32 + 'Feh';
    $0587:
      Result := CSmall + #32 + CLigature + #32 + 'Ech Yiwn';
    $0589:
      Result := 'Full Stop';
    $FB13:
      Result := CSmall + #32 + CLigature + #32 + 'Men Now';
    $FB14:
      Result := CSmall + #32 + CLigature + #32 + 'Men Ech';
    $FB15:
      Result := CSmall + #32 + CLigature + #32 + 'Men Ini';
    $FB16:
      Result := CSmall + #32 + CLigature + #32 + 'Vew Now';
    $FB17:
      Result := CSmall + #32 + CLigature + #32 + 'Men Xeh';
  end;

  // add 'Armenian' to string
  if Result <> '' then
    Result := 'Armenian' + #32 + Result;
end;

function GetCyrillicUnicodeName(Value: Word): string;
begin
  case Value of
    $0401:
      Result := CCapital + #32 + CLetter + #32 + 'Io';
    $0402:
      Result := CCapital + #32 + CLetter + #32 + 'Dje';
    $0403:
      Result := CCapital + #32 + CLetter + #32 + 'Gje';
    $0404:
      Result := CCapital + #32 + CLetter + #32 + 'Ukrainian Ie';
    $0405:
      Result := CCapital + #32 + CLetter + #32 + 'Dze';
    $0406:
      Result := CCapital + #32 + CLetter + #32 + 'Byelorussian-Ukrainian I';
    $0407:
      Result := CCapital + #32 + CLetter + #32 + 'Yi';
    $0408:
      Result := CCapital + #32 + CLetter + #32 + 'Je';
    $0409:
      Result := CCapital + #32 + CLetter + #32 + 'Lje';
    $040A:
      Result := CCapital + #32 + CLetter + #32 + 'Nje';
    $040B:
      Result := CCapital + #32 + CLetter + #32 + 'Tshe';
    $040C:
      Result := CCapital + #32 + CLetter + #32 + 'Kje';
    $040E:
      Result := CCapital + #32 + CLetter + #32 + 'Short U';
    $040F:
      Result := CCapital + #32 + CLetter + #32 + 'Dzhe';
    $0410:
      Result := CCapital + #32 + CLetter + #32 + 'A';
    $0411:
      Result := CCapital + #32 + CLetter + #32 + 'Be';
    $0412:
      Result := CCapital + #32 + CLetter + #32 + 'Ve';
    $0413:
      Result := CCapital + #32 + CLetter + #32 + 'Ghe';
    $0414:
      Result := CCapital + #32 + CLetter + #32 + 'De';
    $0415:
      Result := CCapital + #32 + CLetter + #32 + 'Ie';
    $0416:
      Result := CCapital + #32 + CLetter + #32 + 'Zhe';
    $0417:
      Result := CCapital + #32 + CLetter + #32 + 'Ze';
    $0418:
      Result := CCapital + #32 + CLetter + #32 + 'I';
    $0419:
      Result := CCapital + #32 + CLetter + #32 + 'Short I';
    $041A:
      Result := CCapital + #32 + CLetter + #32 + 'Ka';
    $041B:
      Result := CCapital + #32 + CLetter + #32 + 'El';
    $041C:
      Result := CCapital + #32 + CLetter + #32 + 'Em';
    $041D:
      Result := CCapital + #32 + CLetter + #32 + 'En';
    $041E:
      Result := CCapital + #32 + CLetter + #32 + 'O';
    $041F:
      Result := CCapital + #32 + CLetter + #32 + 'Pe';
    $0420:
      Result := CCapital + #32 + CLetter + #32 + 'Er';
    $0421:
      Result := CCapital + #32 + CLetter + #32 + 'Es';
    $0422:
      Result := CCapital + #32 + CLetter + #32 + 'Te';
    $0423:
      Result := CCapital + #32 + CLetter + #32 + 'U';
    $0424:
      Result := CCapital + #32 + CLetter + #32 + 'Ef';
    $0425:
      Result := CCapital + #32 + CLetter + #32 + 'Ha';
    $0426:
      Result := CCapital + #32 + CLetter + #32 + 'Tse';
    $0427:
      Result := CCapital + #32 + CLetter + #32 + 'Che';
    $0428:
      Result := CCapital + #32 + CLetter + #32 + 'Sha';
    $0429:
      Result := CCapital + #32 + CLetter + #32 + 'Shcha';
    $042A:
      Result := CCapital + #32 + CLetter + #32 + 'Hard Sign';
    $042B:
      Result := CCapital + #32 + CLetter + #32 + 'Yeru';
    $042C:
      Result := CCapital + #32 + CLetter + #32 + 'Soft Sign';
    $042D:
      Result := CCapital + #32 + CLetter + #32 + 'E';
    $042E:
      Result := CCapital + #32 + CLetter + #32 + 'Yu';
    $042F:
      Result := CCapital + #32 + CLetter + #32 + 'Ya';
    $0430:
      Result := CSmall + #32 + CLetter + #32 + 'A';
    $0431:
      Result := CSmall + #32 + CLetter + #32 + 'Be';
    $0432:
      Result := CSmall + #32 + CLetter + #32 + 'Ve';
    $0433:
      Result := CSmall + #32 + CLetter + #32 + 'Ghe';
    $0434:
      Result := CSmall + #32 + CLetter + #32 + 'De';
    $0435:
      Result := CSmall + #32 + CLetter + #32 + 'Ie';
    $0436:
      Result := CSmall + #32 + CLetter + #32 + 'Zhe';
    $0437:
      Result := CSmall + #32 + CLetter + #32 + 'Ze';
    $0438:
      Result := CSmall + #32 + CLetter + #32 + 'I';
    $0439:
      Result := CSmall + #32 + CLetter + #32 + 'Short I';
    $043A:
      Result := CSmall + #32 + CLetter + #32 + 'Ka';
    $043B:
      Result := CSmall + #32 + CLetter + #32 + 'El';
    $043C:
      Result := CSmall + #32 + CLetter + #32 + 'Em';
    $043D:
      Result := CSmall + #32 + CLetter + #32 + 'En';
    $043E:
      Result := CSmall + #32 + CLetter + #32 + 'O';
    $043F:
      Result := CSmall + #32 + CLetter + #32 + 'Pe';
    $0440:
      Result := CSmall + #32 + CLetter + #32 + 'Er';
    $0441:
      Result := CSmall + #32 + CLetter + #32 + 'Es';
    $0442:
      Result := CSmall + #32 + CLetter + #32 + 'Te';
    $0443:
      Result := CSmall + #32 + CLetter + #32 + 'U';
    $0444:
      Result := CSmall + #32 + CLetter + #32 + 'Ef';
    $0445:
      Result := CSmall + #32 + CLetter + #32 + 'Ha';
    $0446:
      Result := CSmall + #32 + CLetter + #32 + 'Tse';
    $0447:
      Result := CSmall + #32 + CLetter + #32 + 'Che';
    $0448:
      Result := CSmall + #32 + CLetter + #32 + 'Sha';
    $0449:
      Result := CSmall + #32 + CLetter + #32 + 'Shcha';
    $044A:
      Result := CSmall + #32 + CLetter + #32 + 'Hard Sign';
    $044B:
      Result := CSmall + #32 + CLetter + #32 + 'Yeru';
    $044C:
      Result := CSmall + #32 + CLetter + #32 + 'Soft Sign';
    $044D:
      Result := CSmall + #32 + CLetter + #32 + 'E';
    $044E:
      Result := CSmall + #32 + CLetter + #32 + 'Yu';
    $044F:
      Result := CSmall + #32 + CLetter + #32 + 'Ya';
    $0451:
      Result := CSmall + #32 + CLetter + #32 + 'Io';
    $0452:
      Result := CSmall + #32 + CLetter + #32 + 'Dje';
    $0453:
      Result := CSmall + #32 + CLetter + #32 + 'Gje';
    $0454:
      Result := CSmall + #32 + CLetter + #32 + 'Ukrainian Ie';
    $0455:
      Result := CSmall + #32 + CLetter + #32 + 'Dze';
    $0456:
      Result := CSmall + #32 + CLetter + #32 + 'Byelorussian-Ukrainian I';
    $0457:
      Result := CSmall + #32 + CLetter + #32 + 'Yi';
    $0458:
      Result := CSmall + #32 + CLetter + #32 + 'Je';
    $0459:
      Result := CSmall + #32 + CLetter + #32 + 'Lje';
    $045A:
      Result := CSmall + #32 + CLetter + #32 + 'Nje';
    $045B:
      Result := CSmall + #32 + CLetter + #32 + 'Tshe';
    $045C:
      Result := CSmall + #32 + CLetter + #32 + 'Kje';
    $045E:
      Result := CSmall + #32 + CLetter + #32 + 'Short U';
    $045F:
      Result := CSmall + #32 + CLetter + #32 + 'Dzhe';
    $0460:
      Result := CCapital + #32 + CLetter + #32 + COmega;
    $0461:
      Result := CSmall + #32 + CLetter + #32 + COmega;
    $0462:
      Result := CCapital + #32 + CLetter + #32 + 'Yat';
    $0463:
      Result := CSmall + #32 + CLetter + #32 + 'Yat';
    $0464:
      Result := CCapital + #32 + CLetter + #32 + 'Iotified E';
    $0465:
      Result := CSmall + #32 + CLetter + #32 + 'Iotified E';
    $0466:
      Result := CCapital + #32 + CLetter + #32 + 'Little Yus';
    $0467:
      Result := CSmall + #32 + CLetter + #32 + 'Little Yus';
    $0468:
      Result := CCapital + #32 + CLetter + #32 + 'Iotified Little Yus';
    $0469:
      Result := CSmall + #32 + CLetter + #32 + 'Iotified Little Yus';
    $046A:
      Result := CCapital + #32 + CLetter + #32 + 'Big Yus';
    $046B:
      Result := CSmall + #32 + CLetter + #32 + 'Big Yus';
    $046C:
      Result := CCapital + #32 + CLetter + #32 + 'Iotified Big Yus';
    $046D:
      Result := CSmall + #32 + CLetter + #32 + 'Iotified Big Yus';
    $046E:
      Result := CCapital + #32 + CLetter + #32 + 'Ksi';
    $046F:
      Result := CSmall + #32 + CLetter + #32 + 'Ksi';
    $0470:
      Result := CCapital + #32 + CLetter + #32 + 'Psi';
    $0471:
      Result := CSmall + #32 + CLetter + #32 + 'Psi';
    $0472:
      Result := CCapital + #32 + CLetter + #32 + 'Fita';
    $0473:
      Result := CSmall + #32 + CLetter + #32 + 'Fita';
    $0474:
      Result := CCapital + #32 + CLetter + #32 + 'Izhitsa';
    $0475:
      Result := CSmall + #32 + CLetter + #32 + 'Izhitsa';
    $0476:
      Result := CCapital + #32 + CLetter + #32 + 'Izhitsa' + #32 + CWith + #32 +
        'Double Grave Accent';
    $0477:
      Result := CSmall + #32 + CLetter + #32 + 'Izhitsa' + #32 + CWith + #32 +
        'Double Grave Accent';
    $0478:
      Result := CCapital + #32 + CLetter + #32 + 'Uk';
    $0479:
      Result := CSmall + #32 + CLetter + #32 + 'Uk';
    $047A:
      Result := CCapital + #32 + CLetter + #32 + 'Round' + #32 + COmega;
    $047B:
      Result := CSmall + #32 + CLetter + #32 + 'Round' + #32 + COmega;
    $047C:
      Result := CCapital + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Titlo';
    $047D:
      Result := CSmall + #32 + CLetter + #32 + COmega + #32 + CWith + #32
        + 'Titlo';
    $047E:
      Result := CCapital + #32 + CLetter + #32 + 'Ot';
    $047F:
      Result := CSmall + #32 + CLetter + #32 + 'Ot';
    $0480:
      Result := CCapital + #32 + CLetter + #32 + 'Koppa';
    $0481:
      Result := CSmall + #32 + CLetter + #32 + 'Koppa';
    $0482:
      Result := 'Thousands Sign';
    $0490:
      Result := CCapital + #32 + CLetter + #32 + 'Ghe' + #32 + CWith + #32
        + 'Upturn';
    $0491:
      Result := CSmall + #32 + CLetter + #32 + 'Ghe' + #32 + CWith + #32
        + 'Upturn';
    $0492:
      Result := CCapital + #32 + CLetter + #32 + 'Ghe' + #32 + CWith + #32
        + 'Stroke';
    $0493:
      Result := CSmall + #32 + CLetter + #32 + 'Ghe' + #32 + CWith + #32
        + 'Stroke';
    $0494:
      Result := CCapital + #32 + CLetter + #32 + 'Ghe' + #32 + CWith + #32 +
        'Middle Hook';
    $0495:
      Result := CSmall + #32 + CLetter + #32 + 'Ghe' + #32 + CWith + #32 +
        'Middle Hook';
    $0496:
      Result := CCapital + #32 + CLetter + #32 + 'Zhe' + #32 + CWith + #32 +
        'Descender';
    $0497:
      Result := CSmall + #32 + CLetter + #32 + 'Zhe' + #32 + CWith + #32 +
        'Descender';
    $0498:
      Result := CCapital + #32 + CLetter + #32 + 'Ze' + #32 + CWith + #32 +
        'Descender';
    $0499:
      Result := CSmall + #32 + CLetter + #32 + 'Ze' + #32 + CWith + #32 +
        'Descender';
    $049A:
      Result := CCapital + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32 +
        'Descender';
    $049B:
      Result := CSmall + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32 +
        'Descender';
    $049C:
      Result := CCapital + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32 +
        'Vertical Stroke';
    $049D:
      Result := CSmall + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32 +
        'Vertical Stroke';
    $049E:
      Result := CCapital + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32
        + 'Stroke';
    $049F:
      Result := CSmall + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32
        + 'Stroke';
    $04A0:
      Result := CCapital + #32 + CLetter + #32 + 'Bashkir Ka';
    $04A1:
      Result := CSmall + #32 + CLetter + #32 + 'Bashkir Ka';
    $04A2:
      Result := CCapital + #32 + CLetter + #32 + 'En' + #32 + CWith + #32 +
        'Descender';
    $04A3:
      Result := CSmall + #32 + CLetter + #32 + 'En' + #32 + CWith + #32 +
        'Descender';
    $04A4:
      Result := CCapital + #32 + CLigature + #32 + 'En Ghe';
    $04A5:
      Result := CSmall + #32 + CLigature + #32 + 'En Ghe';
    $04A6:
      Result := CCapital + #32 + CLetter + #32 + 'Pe' + #32 + CWith + #32 +
        'Middle Hook';
    $04A7:
      Result := CSmall + #32 + CLetter + #32 + 'Pe' + #32 + CWith + #32 +
        'Middle Hook';
    $04A8:
      Result := CCapital + #32 + CLetter + #32 + 'Abkhasian Ha';
    $04A9:
      Result := CSmall + #32 + CLetter + #32 + 'Abkhasian Ha';
    $04AA:
      Result := CCapital + #32 + CLetter + #32 + 'Es' + #32 + CWith + #32 +
        'Descender';
    $04AB:
      Result := CSmall + #32 + CLetter + #32 + 'Es' + #32 + CWith + #32 +
        'Descender';
    $04AC:
      Result := CCapital + #32 + CLetter + #32 + 'Te' + #32 + CWith + #32 +
        'Descender';
    $04AD:
      Result := CSmall + #32 + CLetter + #32 + 'Te' + #32 + CWith + #32 +
        'Descender';
    $04AE:
      Result := CCapital + #32 + CLetter + #32 + 'Straight U';
    $04AF:
      Result := CSmall + #32 + CLetter + #32 + 'Straight U';
    $04B0:
      Result := CCapital + #32 + CLetter + #32 + 'Straight U' + #32 + CWith +
        #32 + 'Stroke';
    $04B1:
      Result := CSmall + #32 + CLetter + #32 + 'Straight U' + #32 + CWith + #32
        + 'Stroke';
    $04B2:
      Result := CCapital + #32 + CLetter + #32 + 'Ha' + #32 + CWith + #32 +
        'Descender';
    $04B3:
      Result := CSmall + #32 + CLetter + #32 + 'Ha' + #32 + CWith + #32 +
        'Descender';
    $04B4:
      Result := CCapital + #32 + CLigature + #32 + 'Te Tse';
    $04B5:
      Result := CSmall + #32 + CLigature + #32 + 'Te Tse';
    $04B6:
      Result := CCapital + #32 + CLetter + #32 + 'Che' + #32 + CWith + #32 +
        'Descender';
    $04B7:
      Result := CSmall + #32 + CLetter + #32 + 'Che' + #32 + CWith + #32 +
        'Descender';
    $04B8:
      Result := CCapital + #32 + CLetter + #32 + 'Che' + #32 + CWith + #32 +
        'Vertical Stroke';
    $04B9:
      Result := CSmall + #32 + CLetter + #32 + 'Che' + #32 + CWith + #32 +
        'Vertical Stroke';
    $04BA:
      Result := CCapital + #32 + CLetter + #32 + 'Shha';
    $04BB:
      Result := CSmall + #32 + CLetter + #32 + 'Shha';
    $04BC:
      Result := CCapital + #32 + CLetter + #32 + 'Abkhasian Che';
    $04BD:
      Result := CSmall + #32 + CLetter + #32 + 'Abkhasian Che';
    $04BE:
      Result := CCapital + #32 + CLetter + #32 + 'Abkhasian Che' + #32 + CWith +
        #32 + 'Descender';
    $04BF:
      Result := CSmall + #32 + CLetter + #32 + 'Abkhasian Che' + #32 + CWith +
        #32 + 'Descender';
    $04C0:
      Result := CLetter + #32 + 'Palochka';
    $04C1:
      Result := CCapital + #32 + CLetter + #32 + 'Zhe' + #32 + CWith + #32
        + 'Breve';
    $04C2:
      Result := CSmall + #32 + CLetter + #32 + 'Zhe' + #32 + CWith + #32
        + 'Breve';
    $04C3:
      Result := CCapital + #32 + CLetter + #32 + 'Ka' + #32 + CWith +
        #32 + 'Hook';
    $04C4:
      Result := CSmall + #32 + CLetter + #32 + 'Ka' + #32 + CWith + #32
        + 'Hook';
    $04C7:
      Result := CCapital + #32 + CLetter + #32 + 'En' + #32 + CWith +
        #32 + 'Hook';
    $04C8:
      Result := CSmall + #32 + CLetter + #32 + 'En' + #32 + CWith + #32
        + 'Hook';
    $04CB:
      Result := CCapital + #32 + CLetter + #32 + 'Khakassian Che';
    $04CC:
      Result := CSmall + #32 + CLetter + #32 + 'Khakassian Che';
    $04D0:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Breve';
    $04D1:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32
        + 'Breve';
    $04D2:
      Result := CCapital + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Diaresis';
    $04D3:
      Result := CSmall + #32 + CLetter + #32 + 'A' + #32 + CWith + #32 +
        'Diaresis';
    $04D4:
      Result := CCapital + #32 + CLigature + #32 + 'A Ie';
    $04D5:
      Result := CSmall + #32 + CLigature + #32 + 'A Ie';
    $04D6:
      Result := CCapital + #32 + CLetter + #32 + 'Ie' + #32 + CWith + #32
        + 'Breve';
    $04D7:
      Result := CSmall + #32 + CLetter + #32 + 'Ie' + #32 + CWith + #32
        + 'Breve';
    $04D8:
      Result := CCapital + #32 + CLetter + #32 + 'Schwa';
    $04D9:
      Result := CSmall + #32 + CLetter + #32 + 'Schwa';
    $04DA:
      Result := CCapital + #32 + CLetter + #32 + 'Schwa' + #32 + CWith + #32 +
        'Diaresis';
    $04DB:
      Result := CSmall + #32 + CLetter + #32 + 'Schwa' + #32 + CWith + #32 +
        'Diaresis';
    $04DC:
      Result := CCapital + #32 + CLetter + #32 + 'Zhe' + #32 + CWith + #32 +
        'Diaresis';
    $04DD:
      Result := CSmall + #32 + CLetter + #32 + 'Zhe' + #32 + CWith + #32 +
        'Diaresis';
    $04DE:
      Result := CCapital + #32 + CLetter + #32 + 'Ze' + #32 + CWith + #32 +
        'Diaresis';
    $04DF:
      Result := CSmall + #32 + CLetter + #32 + 'Ze' + #32 + CWith + #32 +
        'Diaresis';
    $04E0:
      Result := CCapital + #32 + CLetter + #32 + 'Abkhasian Dze';
    $04E1:
      Result := CSmall + #32 + CLetter + #32 + 'Abkhasian Dze';
    $04E2:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Macron';
    $04E3:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32
        + 'Macron';
    $04E4:
      Result := CCapital + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Diaresis';
    $04E5:
      Result := CSmall + #32 + CLetter + #32 + 'I' + #32 + CWith + #32 +
        'Diaresis';
    $04E6:
      Result := CCapital + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Diaresis';
    $04E7:
      Result := CSmall + #32 + CLetter + #32 + 'O' + #32 + CWith + #32 +
        'Diaresis';
    $04E8:
      Result := CCapital + #32 + CLetter + #32 + 'Barred O';
    $04E9:
      Result := CSmall + #32 + CLetter + #32 + 'Barred O';
    $04EA:
      Result := CCapital + #32 + CLetter + #32 + 'Barred O' + #32 + CWith + #32
        + 'Diaresis';
    $04EB:
      Result := CSmall + #32 + CLetter + #32 + 'Barred O' + #32 + CWith + #32 +
        'Diaresis';
    $04EE:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Macron';
    $04EF:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32
        + 'Macron';
    $04F0:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Diaresis';
    $04F1:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Diaresis';
    $04F2:
      Result := CCapital + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Double' + #32 + CAcute;
    $04F3:
      Result := CSmall + #32 + CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Double' + #32 + CAcute;
    $04F4:
      Result := CCapital + #32 + CLetter + #32 + 'Che' + #32 + CWith + #32 +
        'Diaresis';
    $04F5:
      Result := CSmall + #32 + CLetter + #32 + 'Che' + #32 + CWith + #32 +
        'Diaresis';
    $04F8:
      Result := CCapital + #32 + CLetter + #32 + 'Yeru' + #32 + CWith + #32 +
        'Diaresis';
    $04F9:
      Result := CSmall + #32 + CLetter + #32 + 'Yeru' + #32 + CWith + #32 +
        'Diaresis';
  end;

  // add 'Cyrillic' to string
  if Result <> '' then
    Result := 'Cyrillic' + #32 + Result;
end;

function GetHebrewUnicodeName(Value: Word): string;
begin
  case Value of
    $05B0:
      Result := 'Point Sheva';
    $05B1:
      Result := 'Point Hataf Segol';
    $05B2:
      Result := 'Point Hataf Patah';
    $05B3:
      Result := 'Point Hataf Qamats';
    $05B4:
      Result := 'Point Hiriq';
    $05B5:
      Result := 'Point Tsere';
    $05B6:
      Result := 'Point Segol';
    $05B7:
      Result := 'Point Patah';
    $05B8:
      Result := 'Point Qamats';
    $05B9:
      Result := 'Point Holam';
    $05BB:
      Result := 'Point Qubuts';
    $05BC:
      Result := 'Point Dagesh Or Mapiq';
    $05BD:
      Result := 'Point Meteg';
    $05BE:
      Result := 'Punctuation Maqaf';
    $05BF:
      Result := 'Point Rafe';
    $05C0:
      Result := 'Punctuation Paseq';
    $05C1:
      Result := 'Point Shin Dot';
    $05C2:
      Result := 'Point Sin Dot';
    $05C3:
      Result := 'Punctuation Sof Pasuq';
    $05D0:
      Result := CLetter + #32 + 'Alef';
    $05D1:
      Result := CLetter + #32 + 'Bet';
    $05D2:
      Result := CLetter + #32 + 'Gimel';
    $05D3:
      Result := CLetter + #32 + 'Dalet';
    $05D4:
      Result := CLetter + #32 + 'He';
    $05D5:
      Result := CLetter + #32 + 'Vav';
    $05D6:
      Result := CLetter + #32 + 'Zayin';
    $05D7:
      Result := CLetter + #32 + 'Het';
    $05D8:
      Result := CLetter + #32 + 'Tet';
    $05D9:
      Result := CLetter + #32 + 'Yod';
    $05DA:
      Result := CLetter + #32 + 'Final Kaf';
    $05DB:
      Result := CLetter + #32 + 'Kaf';
    $05DC:
      Result := CLetter + #32 + 'Lamed';
    $05DD:
      Result := CLetter + #32 + 'Final Mem';
    $05DE:
      Result := CLetter + #32 + 'Mem';
    $05DF:
      Result := CLetter + #32 + 'Final Nun';
    $05E0:
      Result := CLetter + #32 + 'Nun';
    $05E1:
      Result := CLetter + #32 + 'Samekh';
    $05E2:
      Result := CLetter + #32 + 'Ayin';
    $05E3:
      Result := CLetter + #32 + 'Final Pe';
    $05E4:
      Result := CLetter + #32 + 'Pe';
    $05E5:
      Result := CLetter + #32 + 'Final Tsadi';
    $05E6:
      Result := CLetter + #32 + 'Tsadi';
    $05E7:
      Result := CLetter + #32 + 'Qof';
    $05E8:
      Result := CLetter + #32 + 'Resh';
    $05E9:
      Result := CLetter + #32 + 'Shin';
    $05EA:
      Result := CLetter + #32 + 'Tav';
    $05F0:
      Result := CLigature + #32 + 'Yiddish Double Vav';
    $05F1:
      Result := CLigature + #32 + 'Yiddish Vav Yod';
    $05F2:
      Result := CLigature + #32 + 'Yiddish Double Yod';
    $05F3:
      Result := 'Punctuation Geresh';
    $05F4:
      Result := 'Punctuation Gershayim';
    $FB1E:
      Result := 'Point Judeo-Spanish Varika';
    $FB1F:
      Result := CLigature + #32 + 'Yiddish Yod Yod Patah';
    $FB20:
      Result := CLetter + #32 + 'Alternative Ayin';
    $FB21:
      Result := CLetter + #32 + 'Wide Alef';
    $FB22:
      Result := CLetter + #32 + 'Wide Dalet';
    $FB23:
      Result := CLetter + #32 + 'Wide He';
    $FB24:
      Result := CLetter + #32 + 'Wide Kaf';
    $FB25:
      Result := CLetter + #32 + 'Wide Lamed';
    $FB26:
      Result := CLetter + #32 + 'Wide Final Mem';
    $FB27:
      Result := CLetter + #32 + 'Wide Resh';
    $FB28:
      Result := CLetter + #32 + 'Wide Tav';
    $FB29:
      Result := CLetter + #32 + 'Alternative Plus Sign';
    $FB2A:
      Result := CLetter + #32 + 'Shin' + #32 + CWith + #32 + 'Shin Dot';
    $FB2B:
      Result := CLetter + #32 + 'Shin' + #32 + CWith + #32 + 'Sin Dot';
    $FB2C:
      Result := CLetter + #32 + 'Shin' + #32 + CWith + #32 +
        'Dagesh And Shin Dot';
    $FB2D:
      Result := CLetter + #32 + 'Shin' + #32 + CWith + #32 +
        'Dagesh And Sin Dot';
    $FB2E:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Patah';
    $FB2F:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Qamats';
    $FB30:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Mapiq';
    $FB31:
      Result := CLetter + #32 + 'Bet' + #32 + CWith + #32 + 'Dagesh';
    $FB32:
      Result := CLetter + #32 + 'Gimel' + #32 + CWith + #32 + 'Dagesh';
    $FB33:
      Result := CLetter + #32 + 'Dalet' + #32 + CWith + #32 + 'Dagesh';
    $FB34:
      Result := CLetter + #32 + 'He' + #32 + CWith + #32 + 'Mapiq';
    $FB35:
      Result := CLetter + #32 + 'Vav' + #32 + CWith + #32 + 'Dagesh';
    $FB36:
      Result := CLetter + #32 + 'Zayin' + #32 + CWith + #32 + 'Dagesh';
    $FB38:
      Result := CLetter + #32 + 'Tet' + #32 + CWith + #32 + 'Dagesh';
    $FB39:
      Result := CLetter + #32 + 'Yod' + #32 + CWith + #32 + 'Dagesh';
    $FB3A:
      Result := CLetter + #32 + 'Final Kaf' + #32 + CWith + #32 + 'Dagesh';
    $FB3B:
      Result := CLetter + #32 + 'Kaf' + #32 + CWith + #32 + 'Dagesh';
    $FB3C:
      Result := CLetter + #32 + 'Lamed' + #32 + CWith + #32 + 'Dagesh';
    $FB3E:
      Result := CLetter + #32 + 'Mem' + #32 + CWith + #32 + 'Dagesh';
    $FB40:
      Result := CLetter + #32 + 'Nun' + #32 + CWith + #32 + 'Dagesh';
    $FB41:
      Result := CLetter + #32 + 'Samekh' + #32 + CWith + #32 + 'Dagesh';
    $FB43:
      Result := CLetter + #32 + 'Final Pe' + #32 + CWith + #32 + 'Dagesh';
    $FB44:
      Result := CLetter + #32 + 'Pe' + #32 + CWith + #32 + 'Dagesh';
    $FB46:
      Result := CLetter + #32 + 'Tsadi' + #32 + CWith + #32 + 'Dagesh';
    $FB47:
      Result := CLetter + #32 + 'Qof' + #32 + CWith + #32 + 'Dagesh';
    $FB48:
      Result := CLetter + #32 + 'Resh' + #32 + CWith + #32 + 'Dagesh';
    $FB49:
      Result := CLetter + #32 + 'Shin' + #32 + CWith + #32 + 'Dagesh';
    $FB4A:
      Result := CLetter + #32 + 'Tav' + #32 + CWith + #32 + 'Dagesh';
    $FB4B:
      Result := CLetter + #32 + 'Vav' + #32 + CWith + #32 + 'Holam';
    $FB4C:
      Result := CLetter + #32 + 'Bet' + #32 + CWith + #32 + 'Rafe';
    $FB4D:
      Result := CLetter + #32 + 'Kaf' + #32 + CWith + #32 + 'Rafe';
    $FB4E:
      Result := CLetter + #32 + 'Pe' + #32 + CWith + #32 + 'Rafe';
    $FB4F:
      Result := CLigature + #32 + 'Alef Lamed';
  end;

  // add 'Hebrew' to string
  if Result <> '' then
    Result := 'Hebrew' + #32 + Result;
end;

function GetArabicUnicodeName(Value: Word): string;
begin
  case Value of
    $060C:
      Result := 'Comma';
    $061B:
      Result := 'Semicolon';
    $061F:
      Result := 'Question Mark';
    $0621:
      Result := CLetter + #32 + 'Hamza';
    $0622:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Madda Above';
    $0623:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Hamza Above';
    $0624:
      Result := CLetter + #32 + 'Waw' + #32 + CWith + #32 + 'Hamza Above';
    $0625:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Hamza Below';
    $0626:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above';
    $0627:
      Result := CLetter + #32 + 'Alef';
    $0628:
      Result := CLetter + #32 + 'Beh';
    $0629:
      Result := CLetter + #32 + 'Teh Marbuta';
    $062A:
      Result := CLetter + #32 + 'Teh';
    $062B:
      Result := CLetter + #32 + 'Theh';
    $062C:
      Result := CLetter + #32 + 'Jeem';
    $062D:
      Result := CLetter + #32 + 'Hah';
    $062E:
      Result := CLetter + #32 + 'Khah';
    $062F:
      Result := CLetter + #32 + 'Dal';
    $0630:
      Result := CLetter + #32 + 'Thal';
    $0631:
      Result := CLetter + #32 + 'Reh';
    $0632:
      Result := CLetter + #32 + 'Zain';
    $0633:
      Result := CLetter + #32 + 'Seen';
    $0634:
      Result := CLetter + #32 + 'Sheen';
    $0635:
      Result := CLetter + #32 + 'Sad';
    $0636:
      Result := CLetter + #32 + 'Dad';
    $0637:
      Result := CLetter + #32 + 'Tah';
    $0638:
      Result := CLetter + #32 + 'Zah';
    $0639:
      Result := CLetter + #32 + 'Ain';
    $063A:
      Result := CLetter + #32 + 'Ghain';
    $0640:
      Result := 'Tatweel';
    $0641:
      Result := CLetter + #32 + 'Feh';
    $0642:
      Result := CLetter + #32 + 'Qaf';
    $0643:
      Result := CLetter + #32 + 'Kaf';
    $0644:
      Result := CLetter + #32 + 'Lam';
    $0645:
      Result := CLetter + #32 + 'Meem';
    $0646:
      Result := CLetter + #32 + 'Noon';
    $0647:
      Result := CLetter + #32 + 'Heh';
    $0648:
      Result := CLetter + #32 + 'Waw';
    $0649:
      Result := CLetter + #32 + 'Alef Maksura';
    $064A:
      Result := CLetter + #32 + 'Yeh';
    $064B:
      Result := 'Fathatan';
    $064C:
      Result := 'Dammatan';
    $064D:
      Result := 'Kasratan';
    $064E:
      Result := 'Fatha';
    $064F:
      Result := 'Damma';
    $0650:
      Result := 'Kasra';
    $0651:
      Result := 'Shadda';
    $0652:
      Result := 'Sukun';
    $066A:
      Result := 'Percent Sign';
    $066B:
      Result := 'Decimal Separator';
    $066C:
      Result := 'Thousands Separator';
    $066D:
      Result := 'Five Pointed Star';
    $0670:
      Result := CLetter + #32 + 'Superscript Alef';
    $0671:
      Result := CLetter + #32 + 'Alef Wasla';
    $0672:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Wavy Hamza Above';
    $0673:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 + 'Wavy Hamza Below';
    $0674:
      Result := CLetter + #32 + 'High Hamza';
    $0675:
      Result := CLetter + #32 + 'High Hamza Alef';
    $0676:
      Result := CLetter + #32 + 'High Hamza Waw';
    $0677:
      Result := CLetter + #32 + 'U' + #32 + CWith + #32 + 'Hamza Above';
    $0678:
      Result := CLetter + #32 + 'High Hamza Yeh';
    $0679:
      Result := CLetter + #32 + 'Tteh';
    $067A:
      Result := CLetter + #32 + 'Tteheh';
    $067B:
      Result := CLetter + #32 + 'Beeh';
    $067C:
      Result := CLetter + #32 + 'Teh' + #32 + CWith + #32 + 'Ring';
    $067D:
      Result := CLetter + #32 + 'Teh' + #32 + CWith + #32 +
        'Three Dots Above Downwards';
    $067E:
      Result := CLetter + #32 + 'Peh';
    $067F:
      Result := CLetter + #32 + 'Teheh';
    $0680:
      Result := CLetter + #32 + 'Beheh';
    $0681:
      Result := CLetter + #32 + 'Hah' + #32 + CWith + #32 + 'Hamza Above';
    $0682:
      Result := CLetter + #32 + 'Hah' + #32 + CWith + #32 +
        'Two Dots Vertical Above';
    $0683:
      Result := CLetter + #32 + 'Nyeh';
    $0684:
      Result := CLetter + #32 + 'Dyeh';
    $0685:
      Result := CLetter + #32 + 'Hah' + #32 + CWith + #32 + 'Three Dots Above';
    $0686:
      Result := CLetter + #32 + 'Tcheh';
    $0687:
      Result := CLetter + #32 + 'Tcheheh';
    $0688:
      Result := CLetter + #32 + 'Ddal';
    $0689:
      Result := CLetter + #32 + 'Dal' + #32 + CWith + #32 + 'Ring';
    $068A:
      Result := CLetter + #32 + 'Dal' + #32 + CWith + #32 + 'Dot Below';
    $068B:
      Result := CLetter + #32 + 'Dal' + #32 + CWith + #32 +
        'Dot Below And Small Tah';
    $068C:
      Result := CLetter + #32 + 'Dahal';
    $068D:
      Result := CLetter + #32 + 'Ddahal';
    $068E:
      Result := CLetter + #32 + 'Dul';
    $068F:
      Result := CLetter + #32 + 'Dal' + #32 + CWith + #32 +
        'Three Dots Above Downwards';
    $0690:
      Result := CLetter + #32 + 'Dal' + #32 + CWith + #32 + 'Four Dots Above';
    $0691:
      Result := CLetter + #32 + 'Rreh';
    $0692:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 + 'Small V';
    $0693:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 + 'Ring';
    $0694:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 + 'Dot Below';
    $0695:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 + 'Small V Below';
    $0696:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 +
        'Dot Below And Dot Above';
    $0697:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 + 'Two Dots Above';
    $0698:
      Result := CLetter + #32 + 'Jeh';
    $0699:
      Result := CLetter + #32 + 'Reh' + #32 + CWith + #32 + 'Four Dots Above';
    $069A:
      Result := CLetter + #32 + 'Seen' + #32 + CWith + #32 +
        'Dot Below And Dot Above';
    $069B:
      Result := CLetter + #32 + 'Seen' + #32 + CWith + #32 + 'Three Dots Below';
    $069C:
      Result := CLetter + #32 + 'Seen' + #32 + CWith + #32 +
        'Three Dots Below And Three Dots Above';
    $069D:
      Result := CLetter + #32 + 'Sad' + #32 + CWith + #32 + 'Two Dots Below';
    $069E:
      Result := CLetter + #32 + 'Sad' + #32 + CWith + #32 + 'Three Dots Above';
    $069F:
      Result := CLetter + #32 + 'Tah' + #32 + CWith + #32 + 'Three Dots Above';
    $06A0:
      Result := CLetter + #32 + 'Ain' + #32 + CWith + #32 + 'Three Dots Above';
    $06A1:
      Result := CLetter + #32 + 'Dotless Feh';
    $06A2:
      Result := CLetter + #32 + 'Feh' + #32 + CWith + #32 + 'Dot Moved Below';
    $06A3:
      Result := CLetter + #32 + 'Feh' + #32 + CWith + #32 + 'Dot Below';
    $06A4:
      Result := CLetter + #32 + 'Veh';
    $06A5:
      Result := CLetter + #32 + 'Feh' + #32 + CWith + #32 + 'Three Dots Below';
    $06A6:
      Result := CLetter + #32 + 'Peheh';
    $06A7:
      Result := CLetter + #32 + 'Qaf' + #32 + CWith + #32 + 'Dot Above';
    $06A8:
      Result := CLetter + #32 + 'Qaf' + #32 + CWith + #32 + 'Three Dots Above';
    $06A9:
      Result := CLetter + #32 + 'Keheh';
    $06AA:
      Result := CLetter + #32 + 'Swash Kaf';
    $06AB:
      Result := CLetter + #32 + 'Kaf' + #32 + CWith + #32 + 'Ring';
    $06AC:
      Result := CLetter + #32 + 'Kaf' + #32 + CWith + #32 + 'Dot Above';
    $06AD:
      Result := CLetter + #32 + 'Ng';
    $06AE:
      Result := CLetter + #32 + 'Kaf' + #32 + CWith + #32 + 'Three Dots Below';
    $06AF:
      Result := CLetter + #32 + 'Gaf';
    $06B0:
      Result := CLetter + #32 + 'Gaf' + #32 + CWith + #32 + 'Ring';
    $06B1:
      Result := CLetter + #32 + 'Ngoeh';
    $06B2:
      Result := CLetter + #32 + 'Gaf' + #32 + CWith + #32 + 'Two Dots Below';
    $06B3:
      Result := CLetter + #32 + 'Gueh';
    $06B4:
      Result := CLetter + #32 + 'Gaf' + #32 + CWith + #32 + 'Three Dots Above';
    $06B5:
      Result := CLetter + #32 + 'Lam' + #32 + CWith + #32 + 'Small V';
    $06B6:
      Result := CLetter + #32 + 'Lam' + #32 + CWith + #32 + 'Dot Above';
    $06B7:
      Result := CLetter + #32 + 'Lam' + #32 + CWith + #32 + 'Three Dots Above';
    $06BA:
      Result := CLetter + #32 + 'Noon Ghunna';
    $06BB:
      Result := CLetter + #32 + 'Rnoon';
    $06BC:
      Result := CLetter + #32 + 'Noon' + #32 + CWith + #32 + 'Ring';
    $06BD:
      Result := CLetter + #32 + 'Noon' + #32 + CWith + #32 + 'Three Dots Above';
    $06BE:
      Result := CLetter + #32 + 'Heh Doachashmee';
    $06C0:
      Result := CLetter + #32 + 'Heh' + #32 + CWith + #32 + 'Yeh Above';
    $06C1:
      Result := CLetter + #32 + 'Heh Goal';
    $06C2:
      Result := CLetter + #32 + 'Heh Goal' + #32 + CWith + #32 + 'Hamza Above';
    $06C3:
      Result := CLetter + #32 + 'Teh Marbuta Goal';
    $06C4:
      Result := CLetter + #32 + 'Waw' + #32 + CWith + #32 + 'Ring';
    $06C5:
      Result := CLetter + #32 + 'Kirghiz Oe';
    $06C6:
      Result := CLetter + #32 + 'Oe';
    $06C7:
      Result := CLetter + #32 + 'U';
    $06C8:
      Result := CLetter + #32 + 'Yu';
    $06C9:
      Result := CLetter + #32 + 'Kirghiz Yu';
    $06CA:
      Result := CLetter + #32 + 'Waw' + #32 + CWith + #32 + 'Two Dots Above';
    $06CB:
      Result := CLetter + #32 + 'Ve';
    $06CC:
      Result := CLetter + #32 + 'Farsi Yeh';
    $06CD:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 + 'Tail';
    $06CE:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 + 'Small V';
    $06D0:
      Result := CLetter + #32 + 'E';
    $06D1:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 + 'Three Dots Below';
    $06D2:
      Result := CLetter + #32 + 'Yeh Barree';
    $06D3:
      Result := CLetter + #32 + 'Yeh Barree' + #32 + CWith + #32 +
        'Hamza Above';
    $06D4:
      Result := 'Full Stop';
    $06D5:
      Result := CLetter + #32 + 'Ae';
    $06D6:
      Result := CSmall + #32 + 'High Ligature Sad' + #32 + CWith + #32 + 'Lam' +
        #32 + CWith + #32 + 'Alef Maksura';
    $06D7:
      Result := CSmall + #32 + 'High Ligature Qaf' + #32 + CWith + #32 + 'Lam' +
        #32 + CWith + #32 + 'Alef Maksura';
    $06D8:
      Result := CSmall + #32 + 'High Meem Initial' + #32 + CForm;
    $06D9:
      Result := CSmall + #32 + 'High Lam Alef';
    $06DA:
      Result := CSmall + #32 + 'High Jeem';
    $06DB:
      Result := CSmall + #32 + 'High Three Dots';
    $06DC:
      Result := CSmall + #32 + 'High Seen';
    $06DD:
      Result := 'End Of Ayah';
    $06DE:
      Result := 'Start Of Rub El Hizb';
    $06DF:
      Result := CSmall + #32 + 'High Rounded Zero';
    $06E0:
      Result := CSmall + #32 + 'High Upright Rectangular Zero';
    $06E1:
      Result := CSmall + #32 + 'High Dotless Head Of Khah';
    $06E2:
      Result := CSmall + #32 + 'High Meem Isolated' + #32 + CForm;
    $06E3:
      Result := CSmall + #32 + 'Low Seen';
    $06E4:
      Result := CSmall + #32 + 'High Madda';
    $06E5:
      Result := CSmall + #32 + 'Waw';
    $06E6:
      Result := CSmall + #32 + 'Yeh';
    $06E7:
      Result := CSmall + #32 + 'High Yeh';
    $06E8:
      Result := CSmall + #32 + 'High Noon';
    $06E9:
      Result := 'Place Of Sajdah';
    $06EA:
      Result := 'Empty Centre Low Stop';
    $06EB:
      Result := 'Empty Centre High Stop';
    $06EC:
      Result := 'Rounded High Stop' + #32 + CWith + #32 + 'Filled Centre';
    $06ED:
      Result := CSmall + #32 + 'Low Meem';
    $FB50:
      Result := CLetter + #32 + 'Alef Wasla Isolated' + #32 + CForm;
    $FB51:
      Result := CLetter + #32 + 'Alef Wasla Final' + #32 + CForm;
    $FB52:
      Result := CLetter + #32 + 'Beeh Isolated' + #32 + CForm;
    $FB53:
      Result := CLetter + #32 + 'Beeh Final' + #32 + CForm;
    $FB54:
      Result := CLetter + #32 + 'Beeh Initial' + #32 + CForm;
    $FB55:
      Result := CLetter + #32 + 'Beeh Medial' + #32 + CForm;
    $FB56:
      Result := CLetter + #32 + 'Peh Isolated' + #32 + CForm;
    $FB57:
      Result := CLetter + #32 + 'Peh Final' + #32 + CForm;
    $FB58:
      Result := CLetter + #32 + 'Peh Initial' + #32 + CForm;
    $FB59:
      Result := CLetter + #32 + 'Peh Medial' + #32 + CForm;
    $FB5A:
      Result := CLetter + #32 + 'Beheh Isolated' + #32 + CForm;
    $FB5B:
      Result := CLetter + #32 + 'Beheh Final' + #32 + CForm;
    $FB5C:
      Result := CLetter + #32 + 'Beheh Initial' + #32 + CForm;
    $FB5D:
      Result := CLetter + #32 + 'Beheh Medial' + #32 + CForm;
    $FB5E:
      Result := CLetter + #32 + 'Tteheh Isolated' + #32 + CForm;
    $FB5F:
      Result := CLetter + #32 + 'Tteheh Final' + #32 + CForm;
    $FB60:
      Result := CLetter + #32 + 'Tteheh Initial' + #32 + CForm;
    $FB61:
      Result := CLetter + #32 + 'Tteheh Medial' + #32 + CForm;
    $FB62:
      Result := CLetter + #32 + 'Teheh Isolated' + #32 + CForm;
    $FB63:
      Result := CLetter + #32 + 'Teheh Final' + #32 + CForm;
    $FB64:
      Result := CLetter + #32 + 'Teheh Initial' + #32 + CForm;
    $FB65:
      Result := CLetter + #32 + 'Teheh Medial' + #32 + CForm;
    $FB66:
      Result := CLetter + #32 + 'Tteh Isolated' + #32 + CForm;
    $FB67:
      Result := CLetter + #32 + 'Tteh Final' + #32 + CForm;
    $FB68:
      Result := CLetter + #32 + 'Tteh Initial' + #32 + CForm;
    $FB69:
      Result := CLetter + #32 + 'Tteh Medial' + #32 + CForm;
    $FB6A:
      Result := CLetter + #32 + 'Veh Isolated' + #32 + CForm;
    $FB6B:
      Result := CLetter + #32 + 'Veh Final' + #32 + CForm;
    $FB6C:
      Result := CLetter + #32 + 'Veh Initial' + #32 + CForm;
    $FB6D:
      Result := CLetter + #32 + 'Veh Medial' + #32 + CForm;
    $FB6E:
      Result := CLetter + #32 + 'Peheh Isolated' + #32 + CForm;
    $FB6F:
      Result := CLetter + #32 + 'Peheh Final' + #32 + CForm;
    $FB70:
      Result := CLetter + #32 + 'Peheh Initial' + #32 + CForm;
    $FB71:
      Result := CLetter + #32 + 'Peheh Medial' + #32 + CForm;
    $FB72:
      Result := CLetter + #32 + 'Dyeh Isolated' + #32 + CForm;
    $FB73:
      Result := CLetter + #32 + 'Dyeh Final' + #32 + CForm;
    $FB74:
      Result := CLetter + #32 + 'Dyeh Initial' + #32 + CForm;
    $FB75:
      Result := CLetter + #32 + 'Dyeh Medial' + #32 + CForm;
    $FB76:
      Result := CLetter + #32 + 'Nyeh Isolated' + #32 + CForm;
    $FB77:
      Result := CLetter + #32 + 'Nyeh Final' + #32 + CForm;
    $FB78:
      Result := CLetter + #32 + 'Nyeh Initial' + #32 + CForm;
    $FB79:
      Result := CLetter + #32 + 'Nyeh Medial' + #32 + CForm;
    $FB7A:
      Result := CLetter + #32 + 'Tcheh Isolated' + #32 + CForm;
    $FB7B:
      Result := CLetter + #32 + 'Tcheh Final' + #32 + CForm;
    $FB7C:
      Result := CLetter + #32 + 'Tcheh Initial' + #32 + CForm;
    $FB7D:
      Result := CLetter + #32 + 'Tcheh Medial' + #32 + CForm;
    $FB7E:
      Result := CLetter + #32 + 'Tcheheh Isolated' + #32 + CForm;
    $FB7F:
      Result := CLetter + #32 + 'Tcheheh Final' + #32 + CForm;
    $FB80:
      Result := CLetter + #32 + 'Tcheheh Initial' + #32 + CForm;
    $FB81:
      Result := CLetter + #32 + 'Tcheheh Medial' + #32 + CForm;
    $FB82:
      Result := CLetter + #32 + 'Ddahal Isolated' + #32 + CForm;
    $FB83:
      Result := CLetter + #32 + 'Ddahal Final' + #32 + CForm;
    $FB84:
      Result := CLetter + #32 + 'Dahal Isolated' + #32 + CForm;
    $FB85:
      Result := CLetter + #32 + 'Dahal Final' + #32 + CForm;
    $FB86:
      Result := CLetter + #32 + 'Dul Isolated' + #32 + CForm;
    $FB87:
      Result := CLetter + #32 + 'Dul Final' + #32 + CForm;
    $FB88:
      Result := CLetter + #32 + 'Ddal Isolated' + #32 + CForm;
    $FB89:
      Result := CLetter + #32 + 'Ddal Final' + #32 + CForm;
    $FB8A:
      Result := CLetter + #32 + 'Jeh Isolated' + #32 + CForm;
    $FB8B:
      Result := CLetter + #32 + 'Jeh Final' + #32 + CForm;
    $FB8C:
      Result := CLetter + #32 + 'Rreh Isolated' + #32 + CForm;
    $FB8D:
      Result := CLetter + #32 + 'Rreh Final' + #32 + CForm;
    $FB8E:
      Result := CLetter + #32 + 'Keheh Isolated' + #32 + CForm;
    $FB8F:
      Result := CLetter + #32 + 'Keheh Final' + #32 + CForm;
    $FB90:
      Result := CLetter + #32 + 'Keheh Initial' + #32 + CForm;
    $FB91:
      Result := CLetter + #32 + 'Keheh Medial' + #32 + CForm;
    $FB92:
      Result := CLetter + #32 + 'Gaf Isolated' + #32 + CForm;
    $FB93:
      Result := CLetter + #32 + 'Gaf Final' + #32 + CForm;
    $FB94:
      Result := CLetter + #32 + 'Gaf Initial' + #32 + CForm;
    $FB95:
      Result := CLetter + #32 + 'Gaf Medial' + #32 + CForm;
    $FB96:
      Result := CLetter + #32 + 'Gueh Isolated' + #32 + CForm;
    $FB97:
      Result := CLetter + #32 + 'Gueh Final' + #32 + CForm;
    $FB98:
      Result := CLetter + #32 + 'Gueh Initial' + #32 + CForm;
    $FB99:
      Result := CLetter + #32 + 'Gueh Medial' + #32 + CForm;
    $FB9A:
      Result := CLetter + #32 + 'Ngoeh Isolated' + #32 + CForm;
    $FB9B:
      Result := CLetter + #32 + 'Ngoeh Final' + #32 + CForm;
    $FB9C:
      Result := CLetter + #32 + 'Ngoeh Initial' + #32 + CForm;
    $FB9D:
      Result := CLetter + #32 + 'Ngoeh Medial' + #32 + CForm;
    $FB9E:
      Result := CLetter + #32 + 'Noon Ghunna Isolated' + #32 + CForm;
    $FB9F:
      Result := CLetter + #32 + 'Noon Ghunna Final' + #32 + CForm;
    $FBA0:
      Result := CLetter + #32 + 'Rnoon Isolated' + #32 + CForm;
    $FBA1:
      Result := CLetter + #32 + 'Rnoon Final' + #32 + CForm;
    $FBA2:
      Result := CLetter + #32 + 'Rnoon Initial' + #32 + CForm;
    $FBA3:
      Result := CLetter + #32 + 'Rnoon Medial' + #32 + CForm;
    $FBA4:
      Result := CLetter + #32 + 'Heh' + #32 + CWith + #32 +
        'Yeh Above Isolated' + #32 + CForm;
    $FBA5:
      Result := CLetter + #32 + 'Heh' + #32 + CWith + #32 +
        'Yeh Above Final' + #32 + CForm;
    $FBA6:
      Result := CLetter + #32 + 'Heh Goal Isolated' + #32 + CForm;
    $FBA7:
      Result := CLetter + #32 + 'Heh Goal Final' + #32 + CForm;
    $FBA8:
      Result := CLetter + #32 + 'Heh Goal Initial' + #32 + CForm;
    $FBA9:
      Result := CLetter + #32 + 'Heh Goal Medial' + #32 + CForm;
    $FBAA:
      Result := CLetter + #32 + 'Heh Doachashmee Isolated' + #32 + CForm;
    $FBAB:
      Result := CLetter + #32 + 'Heh Doachashmee Final' + #32 + CForm;
    $FBAC:
      Result := CLetter + #32 + 'Heh Doachashmee Initial' + #32 + CForm;
    $FBAD:
      Result := CLetter + #32 + 'Heh Doachashmee Medial' + #32 + CForm;
    $FBAE:
      Result := CLetter + #32 + 'Yeh Barree Isolated' + #32 + CForm;
    $FBAF:
      Result := CLetter + #32 + 'Yeh Barree Final' + #32 + CForm;
    $FBB0:
      Result := CLetter + #32 + 'Yeh Barree' + #32 + CWith + #32 +
        'Hamza Above Isolated' + #32 + CForm;
    $FBB1:
      Result := CLetter + #32 + 'Yeh Barree' + #32 + CWith + #32 +
        'Hamza Above Final' + #32 + CForm;
    $FBD3:
      Result := CLetter + #32 + 'Ng Isolated' + #32 + CForm;
    $FBD4:
      Result := CLetter + #32 + 'Ng Final' + #32 + CForm;
    $FBD5:
      Result := CLetter + #32 + 'Ng Initial' + #32 + CForm;
    $FBD6:
      Result := CLetter + #32 + 'Ng Medial' + #32 + CForm;
    $FBD7:
      Result := CLetter + #32 + 'U Isolated' + #32 + CForm;
    $FBD8:
      Result := CLetter + #32 + 'U Final' + #32 + CForm;
    $FBD9:
      Result := CLetter + #32 + 'Oe Isolated' + #32 + CForm;
    $FBDA:
      Result := CLetter + #32 + 'Oe Final' + #32 + CForm;
    $FBDB:
      Result := CLetter + #32 + 'Yu Isolated' + #32 + CForm;
    $FBDC:
      Result := CLetter + #32 + 'Yu Final' + #32 + CForm;
    $FBDD:
      Result := CLetter + #32 + 'U' + #32 + CWith + #32 +
        'Hamza Above Isolated' + #32 + CForm;
    $FBDE:
      Result := CLetter + #32 + 'Ve Isolated' + #32 + CForm;
    $FBDF:
      Result := CLetter + #32 + 'Ve Final' + #32 + CForm;
    $FBE0:
      Result := CLetter + #32 + 'Kirghiz Oe Isolated' + #32 + CForm;
    $FBE1:
      Result := CLetter + #32 + 'Kirghiz Oe Final' + #32 + CForm;
    $FBE2:
      Result := CLetter + #32 + 'Kirghiz Yu Isolated' + #32 + CForm;
    $FBE3:
      Result := CLetter + #32 + 'Kirghiz Yu Final' + #32 + CForm;
    $FBE4:
      Result := CLetter + #32 + 'E Isolated' + #32 + CForm;
    $FBE5:
      Result := CLetter + #32 + 'E Final' + #32 + CForm;
    $FBE6:
      Result := CLetter + #32 + 'E Initial' + #32 + CForm;
    $FBE7:
      Result := CLetter + #32 + 'E Medial' + #32 + CForm;
    $FBE8:
      Result := CLetter + #32 +
        'Uighur Kazakh Kirghiz Alef Maksura Initial' + #32 + CForm;
    $FBE9:
      Result := CLetter + #32 +
        'Uighur Kazakh Kirghiz Alef Maksura Medial' + #32 + CForm;
    $FBEA:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Alef Isolated' + #32 + CForm;
    $FBEB:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Alef Final' + #32 + CForm;
    $FBEC:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Ae Isolated' + #32 + CForm;
    $FBED:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Ae Final' + #32 + CForm;
    $FBEE:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Waw Isolated' + #32 + CForm;
    $FBEF:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Waw Final' + #32 + CForm;
    $FBF0:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'U Isolated' + #32 + CForm;
    $FBF1:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'U Final' + #32 + CForm;
    $FBF2:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Oe Isolated' + #32 + CForm;
    $FBF3:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Oe Final' + #32 + CForm;
    $FBF4:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Yu Isolated' + #32 + CForm;
    $FBF5:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Yu Final' + #32 + CForm;
    $FBF6:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'E Isolated' + #32 + CForm;
    $FBF7:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'E Final' + #32 + CForm;
    $FBF8:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'E Initial' + #32 + CForm;
    $FBF9:
      Result := CLigature + #32 + 'Uighur Kirghiz Yeh' + #32 + CWith + #32 +
        'Hamza Above' + #32 + CWith + #32 + 'Alef Maksura Isolated' + #32 + CForm;
    $FBFA:
      Result := CLigature + #32 + 'Uighur Kirghiz Yeh' + #32 + CWith + #32 +
        'Hamza Above' + #32 + CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FBFB:
      Result := CLigature + #32 + 'Uighur Kirghiz Yeh' + #32 + CWith + #32 +
        'Hamza Above' + #32 + CWith + #32 + 'Alef Maksura Initial' + #32 + CForm;
    $FBFC:
      Result := CLetter + #32 + 'Farsi Yeh Isolated' + #32 + CForm;
    $FBFD:
      Result := CLetter + #32 + 'Farsi Yeh Final' + #32 + CForm;
    $FBFE:
      Result := CLetter + #32 + 'Farsi Yeh Initial' + #32 + CForm;
    $FBFF:
      Result := CLetter + #32 + 'Farsi Yeh Medial' + #32 + CForm;
    $FC00:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Jeem Isolated' + #32 + CForm;
    $FC01:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Hah Isolated' + #32 + CForm;
    $FC02:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Meem Isolated' + #32 + CForm;
    $FC03:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Alef Maksura Isolated' + #32 + CForm;
    $FC04:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Yeh Isolated' + #32 + CForm;
    $FC05:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC06:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC07:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC08:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC09:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC0A:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC0B:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC0C:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC0D:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC0E:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC0F:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC10:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC11:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC12:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC13:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC14:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC15:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC16:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC17:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC18:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC19:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC1A:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC1B:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC1C:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC1D:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC1E:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC1F:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC20:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC21:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC22:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC23:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC24:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC25:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC26:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC27:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC28:
      Result := CLigature + #32 + 'Zah' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC29:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC2A:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC2B:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC2C:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC2D:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC2E:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC2F:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC30:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC31:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC32:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC33:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC34:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC35:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC36:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC37:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Alef Isolated' + #32 + CForm;
    $FC38:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC39:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC3A:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC3B:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Lam Isolated' + #32 + CForm;
    $FC3C:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC3D:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC3E:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC3F:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC40:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC41:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC42:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC43:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC44:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC45:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC46:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC47:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC48:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC49:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC4A:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC4B:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC4C:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC4D:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC4E:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC4F:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC50:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC51:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC52:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC53:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC54:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC55:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FC56:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FC57:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FC58:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FC59:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FC5A:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FC5B:
      Result := CLigature + #32 + 'Thal' + #32 + CWith + #32 +
        'Superscript Alef Isolated' + #32 + CForm;
    $FC5C:
      Result := CLigature + #32 + 'Reh' + #32 + CWith + #32 +
        'Superscript Alef Isolated' + #32 + CForm;
    $FC5D:
      Result := CLigature + #32 + 'Alef Maksura' + #32 + CWith + #32 +
        'Superscript Alef Isolated' + #32 + CForm;
    $FC5E:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Dammatan Isolated' + #32 + CForm;
    $FC5F:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Kasratan Isolated' + #32 + CForm;
    $FC60:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Fatha Isolated' + #32 + CForm;
    $FC61:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Damma Isolated' + #32 + CForm;
    $FC62:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Kasra Isolated' + #32 + CForm;
    $FC63:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Superscript Alef Isolated' + #32 + CForm;
    $FC64:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FC65:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Zain Final' + #32 + CForm;
    $FC66:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Meem Final' + #32 + CForm;
    $FC67:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Noon Final' + #32 + CForm;
    $FC68:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FC69:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC6A:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FC6B:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Zain Final' + #32 + CForm;
    $FC6C:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Meem Final' + #32 + CForm;
    $FC6D:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Noon Final' + #32 + CForm;
    $FC6E:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC6F:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC70:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FC71:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Zain Final' + #32 + CForm;
    $FC72:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Meem Final' + #32 + CForm;
    $FC73:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Noon Final' + #32 + CForm;
    $FC74:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC75:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC76:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FC77:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Zain Final' + #32 + CForm;
    $FC78:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Meem Final' + #32 + CForm;
    $FC79:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Noon Final' + #32 + CForm;
    $FC7A:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC7B:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC7C:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC7D:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC7E:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC7F:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC80:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Alef Final' + #32 + CForm;
    $FC81:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Lam Final' + #32 + CForm;
    $FC82:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Meem Final' + #32 + CForm;
    $FC83:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC84:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC85:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Meem Final' + #32 + CForm;
    $FC86:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC87:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC88:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Alef Final' + #32 + CForm;
    $FC89:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Meem Final' + #32 + CForm;
    $FC8A:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FC8B:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Zain Final' + #32 + CForm;
    $FC8C:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Meem Final' + #32 + CForm;
    $FC8D:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Noon Final' + #32 + CForm;
    $FC8E:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC8F:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC90:
      Result := CLigature + #32 + 'Alef Maksura' + #32 + CWith + #32 +
        'Superscript Alef Final' + #32 + CForm;
    $FC91:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FC92:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Zain Final' + #32 + CForm;
    $FC93:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Meem Final' + #32 + CForm;
    $FC94:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Noon Final' + #32 + CForm;
    $FC95:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FC96:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FC97:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FC98:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FC99:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Khah Initial' + #32 + CForm;
    $FC9A:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FC9B:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Heh Initial' + #32 + CForm;
    $FC9C:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FC9D:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FC9E:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FC9F:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCA0:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FCA1:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCA2:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCA3:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCA4:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCA5:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FCA6:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCA7:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCA8:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCA9:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCAA:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCAB:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCAC:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCAD:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCAE:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCAF:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCB0:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCB1:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCB2:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCB3:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCB4:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCB5:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCB6:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCB7:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCB8:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCB9:
      Result := CLigature + #32 + 'Zah' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCBA:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCBB:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCBC:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCBD:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCBE:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCBF:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCC0:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCC1:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCC2:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCC3:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCC4:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCC5:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCC6:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCC7:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Lam Initial' + #32 + CForm;
    $FCC8:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCC9:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCCA:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCCB:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCCC:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCCD:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FCCE:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCCF:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCD0:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCD1:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCD2:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCD3:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCD4:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCD5:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCD6:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FCD7:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCD8:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCD9:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 +
        'Superscript Alef Initial' + #32 + CForm;
    $FCDA:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FCDB:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FCDC:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FCDD:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FCDE:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FCDF:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Meem Medial' + #32 + CForm;
    $FCE0:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hamza Above' +
        #32 + CWith + #32 + 'Heh Medial' + #32 + CForm;
    $FCE1:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCE2:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Heh Medial' + #32 + CForm;
    $FCE3:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCE4:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Heh Medial' + #32 + CForm;
    $FCE5:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCE6:
      Result := CLigature + #32 + 'Theh' + #32 + CWith + #32 +
        'Heh Medial' + #32 + CForm;
    $FCE7:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCE8:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Heh Medial' + #32 + CForm;
    $FCE9:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCEA:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Heh Medial' + #32 + CForm;
    $FCEB:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Lam Medial' + #32 + CForm;
    $FCEC:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCED:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCEE:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCEF:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 +
        'Heh Medial' + #32 + CForm;
    $FCF0:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FCF1:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Heh Medial' + #32 + CForm;
    $FCF2:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Fatha Medial' + #32 + CForm;
    $FCF3:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Damma Medial' + #32 + CForm;
    $FCF4:
      Result := CLigature + #32 + 'Shadda' + #32 + CWith + #32 +
        'Kasra Medial' + #32 + CForm;
    $FCF5:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FCF6:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FCF7:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FCF8:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FCF9:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FCFA:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FCFB:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FCFC:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FCFD:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FCFE:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FCFF:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FD00:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FD01:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FD02:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FD03:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FD04:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FD05:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FD06:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FD07:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Alef Maksura Isolated' + #32 + CForm;
    $FD08:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Yeh Isolated' + #32 + CForm;
    $FD09:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Jeem Isolated' + #32 + CForm;
    $FD0A:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Hah Isolated' + #32 + CForm;
    $FD0B:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Khah Isolated' + #32 + CForm;
    $FD0C:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Meem Isolated' + #32 + CForm;
    $FD0D:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Reh Isolated' + #32 + CForm;
    $FD0E:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Reh Isolated' + #32 + CForm;
    $FD0F:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Reh Isolated' + #32 + CForm;
    $FD10:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Reh Isolated' + #32 + CForm;
    $FD11:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD12:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD13:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD14:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD15:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD16:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 +
        'Yeh Final' + #32 + CForm;
    $FD17:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD18:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD19:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD1A:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Yeh Final' + #32 + CForm;
    $FD1B:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD1C:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD1D:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD1E:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD1F:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD20:
      Result := CLigature + #32 + 'Khah' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD21:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD22:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD23:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 +
        'Alef Maksura Final' + #32 + CForm;
    $FD24:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD25:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Jeem Final' + #32 + CForm;
    $FD26:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Hah Final' + #32 + CForm;
    $FD27:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Khah Final' + #32 + CForm;
    $FD28:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Meem Final' + #32 + CForm;
    $FD29:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Reh Final' + #32 + CForm;
    $FD2A:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FD2B:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FD2C:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 + 'Reh Final' + #32 + CForm;
    $FD2D:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Jeem Initial' + #32 + CForm;
    $FD2E:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Hah Initial' + #32 + CForm;
    $FD2F:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Khah Initial' + #32 + CForm;
    $FD30:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FD31:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FD32:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Heh Initial' + #32 + CForm;
    $FD33:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Meem Initial' + #32 + CForm;
    $FD34:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Jeem Medial' + #32 + CForm;
    $FD35:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Hah Medial' + #32 + CForm;
    $FD36:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 +
        'Khah Medial' + #32 + CForm;
    $FD37:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Jeem Medial' + #32 + CForm;
    $FD38:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Hah Medial' + #32 + CForm;
    $FD39:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 +
        'Khah Medial' + #32 + CForm;
    $FD3A:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FD3B:
      Result := CLigature + #32 + 'Zah' + #32 + CWith + #32 +
        'Meem Medial' + #32 + CForm;
    $FD3C:
      Result := CLigature + #32 + 'Alef' + #32 + CWith + #32 +
        'Fathatan Final' + #32 + CForm;
    $FD3D:
      Result := CLigature + #32 + 'Alef' + #32 + CWith + #32 +
        'Fathatan Isolated' + #32 + CForm;
    $FD50:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD51:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Jeem Final' + #32 + CForm;
    $FD52:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD53:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD54:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD55:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD56:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD57:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Khah Initial' + #32 + CForm;
    $FD58:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FD59:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD5A:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD5B:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD5C:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD5D:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD5E:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD5F:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FD60:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD61:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD62:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD63:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD64:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FD65:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD66:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD67:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD68:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD69:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD6A:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Khah Final' + #32 + CForm;
    $FD6B:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Khah Initial' + #32 + CForm;
    $FD6C:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD6D:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD6E:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD6F:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD70:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD71:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FD72:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD73:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD74:
      Result := CLigature + #32 + 'Tah' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD75:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD76:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD77:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD78:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD79:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD7A:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD7B:
      Result := CLigature + #32 + 'Ghain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD7C:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD7D:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD7E:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FD7F:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD80:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD81:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD82:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD83:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD84:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Jeem Final' + #32 + CForm;
    $FD85:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD86:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD87:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FD88:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD89:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD8A:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD8B:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD8C:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FD8D:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD8E:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD8F:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD92:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Khah Initial' + #32 + CForm;
    $FD93:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Jeem Initial' + #32 + CForm;
    $FD94:
      Result := CLigature + #32 + 'Heh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD95:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD96:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD97:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD98:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD99:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD9A:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD9B:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FD9C:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FD9D:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FD9E:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FD9F:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDA0:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FDA1:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDA2:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FDA3:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDA4:
      Result := CLigature + #32 + 'Teh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FDA5:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDA6:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FDA7:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FDA8:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FDA9:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDAA:
      Result := CLigature + #32 + 'Sheen' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDAB:
      Result := CLigature + #32 + 'Dad' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDAC:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDAD:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDAE:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDAF:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB0:
      Result := CLigature + #32 + 'Yeh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB1:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB2:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB3:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB4:
      Result := CLigature + #32 + 'Qaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FDB5:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FDB6:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB7:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDB8:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Hah Initial' + #32 + CForm;
    $FDB9:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDBA:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FDBB:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FDBC:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Final' + #32 + CForm;
    $FDBD:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Hah Final' + #32 + CForm;
    $FDBE:
      Result := CLigature + #32 + 'Jeem' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDBF:
      Result := CLigature + #32 + 'Hah' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDC0:
      Result := CLigature + #32 + 'Meem' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDC1:
      Result := CLigature + #32 + 'Feh' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDC2:
      Result := CLigature + #32 + 'Beh' + #32 + CWith + #32 + 'Hah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDC3:
      Result := CLigature + #32 + 'Kaf' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FDC4:
      Result := CLigature + #32 + 'Ain' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FDC5:
      Result := CLigature + #32 + 'Sad' + #32 + CWith + #32 + 'Meem' + #32 +
        CWith + #32 + 'Meem Initial' + #32 + CForm;
    $FDC6:
      Result := CLigature + #32 + 'Seen' + #32 + CWith + #32 + 'Khah' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDC7:
      Result := CLigature + #32 + 'Noon' + #32 + CWith + #32 + 'Jeem' + #32 +
        CWith + #32 + 'Yeh Final' + #32 + CForm;
    $FDF0:
      Result := CLigature + #32 +
        'Salla Used As Koranic Stop Sign Isolated' + #32 + CForm;
    $FDF1:
      Result := CLigature + #32 +
        'Qala Used As Koranic Stop Sign Isolated' + #32 + CForm;
    $FDF2:
      Result := CLigature + #32 + 'Allah Isolated' + #32 + CForm;
    $FDF3:
      Result := CLigature + #32 + 'Akbar Isolated' + #32 + CForm;
    $FDF4:
      Result := CLigature + #32 + 'Mohammad Isolated' + #32 + CForm;
    $FDF5:
      Result := CLigature + #32 + 'Salam Isolated' + #32 + CForm;
    $FDF6:
      Result := CLigature + #32 + 'Rasoul Isolated' + #32 + CForm;
    $FDF7:
      Result := CLigature + #32 + 'Alayhe Isolated' + #32 + CForm;
    $FDF8:
      Result := CLigature + #32 + 'Wasallam Isolated' + #32 + CForm;
    $FDF9:
      Result := CLigature + #32 + 'Salla Isolated' + #32 + CForm;
    $FDFA:
      Result := CLigature + #32 + 'Sallallahou Alayhe Wasallam';
    $FDFB:
      Result := CLigature + #32 + 'Jallajalalouhou';
    $FE70:
      Result := 'FATHATAN ISOLATED' + #32 + CForm;
    $FE71:
      Result := 'Tatweel' + #32 + CWith + #32 + 'Fathatan Above';
    $FE72:
      Result := 'Dammatan Isolated' + #32 + CForm;
    $FE74:
      Result := 'Kasratan Isolated' + #32 + CForm;
    $FE76:
      Result := 'Fatha Isolated' + #32 + CForm;
    $FE77:
      Result := 'Fatha Medial' + #32 + CForm;
    $FE78:
      Result := 'Damma Isolated' + #32 + CForm;
    $FE79:
      Result := 'Damma Medial' + #32 + CForm;
    $FE7A:
      Result := 'Kasra Isolated' + #32 + CForm;
    $FE7B:
      Result := 'Kasra Medial' + #32 + CForm;
    $FE7C:
      Result := 'Shadda Isolated' + #32 + CForm;
    $FE7D:
      Result := 'Shadda Medial' + #32 + CForm;
    $FE7E:
      Result := 'Sukun Isolated' + #32 + CForm;
    $FE7F:
      Result := 'Sukun Medial' + #32 + CForm;
    $FE80:
      Result := CLetter + #32 + 'Hamza Isolated' + #32 + CForm;
    $FE81:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 +
        'Madda Above Isolated' + #32 + CForm;
    $FE82:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 +
        'Madda Above Final' + #32 + CForm;
    $FE83:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 +
        'Hamza Above Isolated' + #32 + CForm;
    $FE84:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 +
        'Hamza Above Final' + #32 + CForm;
    $FE85:
      Result := CLetter + #32 + 'Waw' + #32 + CWith + #32 +
        'Hamza Above Isolated' + #32 + CForm;
    $FE86:
      Result := CLetter + #32 + 'Waw' + #32 + CWith + #32 +
        'Hamza Above Final' + #32 + CForm;
    $FE87:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 +
        'Hamza Below Isolated' + #32 + CForm;
    $FE88:
      Result := CLetter + #32 + 'Alef' + #32 + CWith + #32 +
        'Hamza Below Final' + #32 + CForm;
    $FE89:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 +
        'Hamza Above Isolated' + #32 + CForm;
    $FE8A:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 +
        'Hamza Above Final' + #32 + CForm;
    $FE8B:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 +
        'Hamza Above Initial' + #32 + CForm;
    $FE8C:
      Result := CLetter + #32 + 'Yeh' + #32 + CWith + #32 +
        'Hamza Above Medial' + #32 + CForm;
    $FE8D:
      Result := CLetter + #32 + 'Alef Isolated' + #32 + CForm;
    $FE8E:
      Result := CLetter + #32 + 'Alef Final' + #32 + CForm;
    $FE8F:
      Result := CLetter + #32 + 'Beh Isolated' + #32 + CForm;
    $FE90:
      Result := CLetter + #32 + 'Beh Final' + #32 + CForm;
    $FE91:
      Result := CLetter + #32 + 'Beh Initial' + #32 + CForm;
    $FE92:
      Result := CLetter + #32 + 'Beh Medial' + #32 + CForm;
    $FE93:
      Result := CLetter + #32 + 'Teh Marbuta Isolated' + #32 + CForm;
    $FE94:
      Result := CLetter + #32 + 'Teh Marbuta Final' + #32 + CForm;
    $FE95:
      Result := CLetter + #32 + 'Teh Isolated' + #32 + CForm;
    $FE96:
      Result := CLetter + #32 + 'Teh Final' + #32 + CForm;
    $FE97:
      Result := CLetter + #32 + 'Teh Initial' + #32 + CForm;
    $FE98:
      Result := CLetter + #32 + 'Teh Medial' + #32 + CForm;
    $FE99:
      Result := CLetter + #32 + 'Theh Isolated' + #32 + CForm;
    $FE9A:
      Result := CLetter + #32 + 'Theh Final' + #32 + CForm;
    $FE9B:
      Result := CLetter + #32 + 'Theh Initial' + #32 + CForm;
    $FE9C:
      Result := CLetter + #32 + 'Theh Medial' + #32 + CForm;
    $FE9D:
      Result := CLetter + #32 + 'Jeem Isolated' + #32 + CForm;
    $FE9E:
      Result := CLetter + #32 + 'Jeem Final' + #32 + CForm;
    $FE9F:
      Result := CLetter + #32 + 'Jeem Initial' + #32 + CForm;
    $FEA0:
      Result := CLetter + #32 + 'Jeem Medial' + #32 + CForm;
    $FEA1:
      Result := CLetter + #32 + 'Hah Isolated' + #32 + CForm;
    $FEA2:
      Result := CLetter + #32 + 'Hah Final' + #32 + CForm;
    $FEA3:
      Result := CLetter + #32 + 'Hah Initial' + #32 + CForm;
    $FEA4:
      Result := CLetter + #32 + 'Hah Medial' + #32 + CForm;
    $FEA5:
      Result := CLetter + #32 + 'Khah Isolated' + #32 + CForm;
    $FEA6:
      Result := CLetter + #32 + 'Khah Final' + #32 + CForm;
    $FEA7:
      Result := CLetter + #32 + 'Khah Initial' + #32 + CForm;
    $FEA8:
      Result := CLetter + #32 + 'Khah Medial' + #32 + CForm;
    $FEA9:
      Result := CLetter + #32 + 'Dal Isolated' + #32 + CForm;
    $FEAA:
      Result := CLetter + #32 + 'Dal Final' + #32 + CForm;
    $FEAB:
      Result := CLetter + #32 + 'Thal Isolated' + #32 + CForm;
    $FEAC:
      Result := CLetter + #32 + 'Thal Final' + #32 + CForm;
    $FEAD:
      Result := CLetter + #32 + 'Reh Isolated' + #32 + CForm;
    $FEAE:
      Result := CLetter + #32 + 'Reh Final' + #32 + CForm;
    $FEAF:
      Result := CLetter + #32 + 'Zain Isolated' + #32 + CForm;
    $FEB0:
      Result := CLetter + #32 + 'Zain Final' + #32 + CForm;
    $FEB1:
      Result := CLetter + #32 + 'Seen Isolated' + #32 + CForm;
    $FEB2:
      Result := CLetter + #32 + 'Seen Final' + #32 + CForm;
    $FEB3:
      Result := CLetter + #32 + 'Seen Initial' + #32 + CForm;
    $FEB4:
      Result := CLetter + #32 + 'Seen Medial' + #32 + CForm;
    $FEB5:
      Result := CLetter + #32 + 'Sheen Isolated' + #32 + CForm;
    $FEB6:
      Result := CLetter + #32 + 'Sheen Final' + #32 + CForm;
    $FEB7:
      Result := CLetter + #32 + 'Sheen Initial' + #32 + CForm;
    $FEB8:
      Result := CLetter + #32 + 'Sheen Medial' + #32 + CForm;
    $FEB9:
      Result := CLetter + #32 + 'Sad Isolated' + #32 + CForm;
    $FEBA:
      Result := CLetter + #32 + 'Sad Final' + #32 + CForm;
    $FEBB:
      Result := CLetter + #32 + 'Sad Initial' + #32 + CForm;
    $FEBC:
      Result := CLetter + #32 + 'Sad Medial' + #32 + CForm;
    $FEBD:
      Result := CLetter + #32 + 'Dad Isolated' + #32 + CForm;
    $FEBE:
      Result := CLetter + #32 + 'Dad Final' + #32 + CForm;
    $FEBF:
      Result := CLetter + #32 + 'Dad Initial' + #32 + CForm;
    $FEC0:
      Result := CLetter + #32 + 'Dad Medial' + #32 + CForm;
    $FEC1:
      Result := CLetter + #32 + 'Tah Isolated' + #32 + CForm;
    $FEC2:
      Result := CLetter + #32 + 'Tah Final' + #32 + CForm;
    $FEC3:
      Result := CLetter + #32 + 'Tah Initial' + #32 + CForm;
    $FEC4:
      Result := CLetter + #32 + 'Tah Medial' + #32 + CForm;
    $FEC5:
      Result := CLetter + #32 + 'Zah Isolated' + #32 + CForm;
    $FEC6:
      Result := CLetter + #32 + 'Zah Final' + #32 + CForm;
    $FEC7:
      Result := CLetter + #32 + 'Zah Initial' + #32 + CForm;
    $FEC8:
      Result := CLetter + #32 + 'Zah Medial' + #32 + CForm;
    $FEC9:
      Result := CLetter + #32 + 'Ain Isolated' + #32 + CForm;
    $FECA:
      Result := CLetter + #32 + 'Ain Final' + #32 + CForm;
    $FECB:
      Result := CLetter + #32 + 'Ain Initial' + #32 + CForm;
    $FECC:
      Result := CLetter + #32 + 'Ain Medial' + #32 + CForm;
    $FECD:
      Result := CLetter + #32 + 'Ghain Isolated' + #32 + CForm;
    $FECE:
      Result := CLetter + #32 + 'Ghain Final' + #32 + CForm;
    $FECF:
      Result := CLetter + #32 + 'Ghain Initial' + #32 + CForm;
    $FED0:
      Result := CLetter + #32 + 'Ghain Medial' + #32 + CForm;
    $FED1:
      Result := CLetter + #32 + 'Feh Isolated' + #32 + CForm;
    $FED2:
      Result := CLetter + #32 + 'Feh Final' + #32 + CForm;
    $FED3:
      Result := CLetter + #32 + 'Feh Initial' + #32 + CForm;
    $FED4:
      Result := CLetter + #32 + 'Feh Medial' + #32 + CForm;
    $FED5:
      Result := CLetter + #32 + 'Qaf Isolated' + #32 + CForm;
    $FED6:
      Result := CLetter + #32 + 'Qaf Final' + #32 + CForm;
    $FED7:
      Result := CLetter + #32 + 'Qaf Initial' + #32 + CForm;
    $FED8:
      Result := CLetter + #32 + 'Qaf Medial' + #32 + CForm;
    $FED9:
      Result := CLetter + #32 + 'Kaf Isolated' + #32 + CForm;
    $FEDA:
      Result := CLetter + #32 + 'Kaf Final' + #32 + CForm;
    $FEDB:
      Result := CLetter + #32 + 'Kaf Initial' + #32 + CForm;
    $FEDC:
      Result := CLetter + #32 + 'Kaf Medial' + #32 + CForm;
    $FEDD:
      Result := CLetter + #32 + 'Lam Isolated' + #32 + CForm;
    $FEDE:
      Result := CLetter + #32 + 'Lam Final' + #32 + CForm;
    $FEDF:
      Result := CLetter + #32 + 'Lam Initial' + #32 + CForm;
    $FEE0:
      Result := CLetter + #32 + 'Lam Medial' + #32 + CForm;
    $FEE1:
      Result := CLetter + #32 + 'Meem Isolated' + #32 + CForm;
    $FEE2:
      Result := CLetter + #32 + 'Meem Final' + #32 + CForm;
    $FEE3:
      Result := CLetter + #32 + 'Meem Initial' + #32 + CForm;
    $FEE4:
      Result := CLetter + #32 + 'Meem Medial' + #32 + CForm;
    $FEE5:
      Result := CLetter + #32 + 'Noon Isolated' + #32 + CForm;
    $FEE6:
      Result := CLetter + #32 + 'Noon Final' + #32 + CForm;
    $FEE7:
      Result := CLetter + #32 + 'Noon Initial' + #32 + CForm;
    $FEE8:
      Result := CLetter + #32 + 'Noon Medial' + #32 + CForm;
    $FEE9:
      Result := CLetter + #32 + 'Heh Isolated' + #32 + CForm;
    $FEEA:
      Result := CLetter + #32 + 'Heh Final' + #32 + CForm;
    $FEEB:
      Result := CLetter + #32 + 'Heh Initial' + #32 + CForm;
    $FEEC:
      Result := CLetter + #32 + 'Heh Medial' + #32 + CForm;
    $FEED:
      Result := CLetter + #32 + 'Waw Isolated' + #32 + CForm;
    $FEEE:
      Result := CLetter + #32 + 'Waw Final' + #32 + CForm;
    $FEEF:
      Result := CLetter + #32 + 'Alef Maksura Isolated' + #32 + CForm;
    $FEF0:
      Result := CLetter + #32 + 'Alef Maksura Final' + #32 + CForm;
    $FEF1:
      Result := CLetter + #32 + 'Yeh Isolated' + #32 + CForm;
    $FEF2:
      Result := CLetter + #32 + 'Yeh Final' + #32 + CForm;
    $FEF3:
      Result := CLetter + #32 + 'Yeh Initial' + #32 + CForm;
    $FEF4:
      Result := CLetter + #32 + 'Yeh Medial' + #32 + CForm;
    $FEF5:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef' + #32 +
        CWith + #32 + 'Madda Above Isolated' + #32 + CForm;
    $FEF6:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef' + #32 +
        CWith + #32 + 'Madda Above Final' + #32 + CForm;
    $FEF7:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef' + #32 +
        CWith + #32 + 'Hamza Above Isolated' + #32 + CForm;
    $FEF8:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef' + #32 +
        CWith + #32 + 'Hamza Above Final' + #32 + CForm;
    $FEF9:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef' + #32 +
        CWith + #32 + 'Hamza Below Isolated' + #32 + CForm;
    $FEFA:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef' + #32 +
        CWith + #32 + 'Hamza Below Final' + #32 + CForm;
    $FEFB:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 +
        'Alef Isolated' + #32 + CForm;
    $FEFC:
      Result := CLigature + #32 + 'Lam' + #32 + CWith + #32 + 'Alef Final' + #32 + CForm;
  end;

  // add 'Arabic' to string
  if Result <> '' then
    Result := 'Arabic' + #32 + Result;
end;

function GetDevanagariUnicodeName(Value: Word): string;
begin
  case Value of
    $0901:
      Result := CSign + #32 + 'Candrabindu';
    $0902:
      Result := CSign + #32 + 'Anusvara';
    $0903:
      Result := CSign + #32 + 'Visarga';
    $0905:
      Result := CLetter + #32 + 'A';
    $0906:
      Result := CLetter + #32 + 'Aa';
    $0907:
      Result := CLetter + #32 + 'I';
    $0908:
      Result := CLetter + #32 + 'II';
    $0909:
      Result := CLetter + #32 + 'U';
    $090A:
      Result := CLetter + #32 + 'UU';
    $090B:
      Result := CLetter + #32 + 'Vocalic R';
    $090C:
      Result := CLetter + #32 + 'Vocalic L';
    $090D:
      Result := CLetter + #32 + 'Candra E';
    $090E:
      Result := CLetter + #32 + 'Short E';
    $090F:
      Result := CLetter + #32 + 'E';
    $0910:
      Result := CLetter + #32 + 'Ai';
    $0911:
      Result := CLetter + #32 + 'Candra O';
    $0912:
      Result := CLetter + #32 + 'Short O';
    $0913:
      Result := CLetter + #32 + 'O';
    $0914:
      Result := CLetter + #32 + 'Au';
    $0915:
      Result := CLetter + #32 + 'Ka';
    $0916:
      Result := CLetter + #32 + 'Kha';
    $0917:
      Result := CLetter + #32 + 'Ga';
    $0918:
      Result := CLetter + #32 + 'Gha';
    $0919:
      Result := CLetter + #32 + 'Nga';
    $091A:
      Result := CLetter + #32 + 'Ca';
    $091B:
      Result := CLetter + #32 + 'Cha';
    $091C:
      Result := CLetter + #32 + 'Ja';
    $091D:
      Result := CLetter + #32 + 'Jha';
    $091E:
      Result := CLetter + #32 + 'Nya';
    $091F:
      Result := CLetter + #32 + 'Tta';
    $0920:
      Result := CLetter + #32 + 'Ttha';
    $0921:
      Result := CLetter + #32 + 'Dda';
    $0922:
      Result := CLetter + #32 + 'Ddha';
    $0923:
      Result := CLetter + #32 + 'Nna';
    $0924:
      Result := CLetter + #32 + 'Ta';
    $0925:
      Result := CLetter + #32 + 'Tha';
    $0926:
      Result := CLetter + #32 + 'Da';
    $0927:
      Result := CLetter + #32 + 'Dha';
    $0928:
      Result := CLetter + #32 + 'Na';
    $0929:
      Result := CLetter + #32 + 'Nnna';
    $092A:
      Result := CLetter + #32 + 'Pa';
    $092B:
      Result := CLetter + #32 + 'Pha';
    $092C:
      Result := CLetter + #32 + 'Ba';
    $092D:
      Result := CLetter + #32 + 'Bha';
    $092E:
      Result := CLetter + #32 + 'Ma';
    $092F:
      Result := CLetter + #32 + 'Ya';
    $0930:
      Result := CLetter + #32 + 'Ra';
    $0931:
      Result := CLetter + #32 + 'Rra';
    $0932:
      Result := CLetter + #32 + 'La';
    $0933:
      Result := CLetter + #32 + 'Lla';
    $0934:
      Result := CLetter + #32 + 'Llla';
    $0935:
      Result := CLetter + #32 + 'Va';
    $0936:
      Result := CLetter + #32 + 'Sha';
    $0937:
      Result := CLetter + #32 + 'Ssa';
    $0938:
      Result := CLetter + #32 + 'Sa';
    $0939:
      Result := CLetter + #32 + 'Ha';
    $093C:
      Result := CSign + #32 + 'Nukta';
    $093D:
      Result := CSign + #32 + 'Avagraha';
    $093E:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $093F:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0940:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0941:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0942:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0943:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $0944:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Rr';
    $0945:
      Result := CVowel + #32 + CSign + #32 + 'Candra E';
    $0946:
      Result := CVowel + #32 + CSign + #32 + 'Short E';
    $0947:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0948:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0949:
      Result := CVowel + #32 + CSign + #32 + 'Candra O';
    $094A:
      Result := CVowel + #32 + CSign + #32 + 'Short O';
    $094B:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $094C:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $094D:
      Result := CSign + #32 + 'Virama';
    $0950:
      Result := 'Om';
    $0951:
      Result := 'Stress Sign Udatta';
    $0952:
      Result := 'Stress Sign Anudatta';
    $0953:
      Result := 'Grave Accent';
    $0954:
      Result := 'Acute Accent';
    $0958:
      Result := CLetter + #32 + 'Qa';
    $0959:
      Result := CLetter + #32 + 'Khha';
    $095A:
      Result := CLetter + #32 + 'Ghha';
    $095B:
      Result := CLetter + #32 + 'Za';
    $095C:
      Result := CLetter + #32 + 'Dddha';
    $095D:
      Result := CLetter + #32 + 'Rha';
    $095E:
      Result := CLetter + #32 + 'Fa';
    $095F:
      Result := CLetter + #32 + 'Yya';
    $0960:
      Result := CLetter + #32 + 'Vocalic Rr';
    $0961:
      Result := CLetter + #32 + 'Vocalic Ll';
    $0962:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic L';
    $0963:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Ll';
    $0964:
      Result := 'Danda';
    $0965:
      Result := 'Double Danda';
    $0966:
      Result := CDigit + #32 + 'Zero';
    $0967:
      Result := CDigit + #32 + 'One';
    $0968:
      Result := CDigit + #32 + 'Two';
    $0969:
      Result := CDigit + #32 + 'Three';
    $096A:
      Result := CDigit + #32 + 'Four';
    $096B:
      Result := CDigit + #32 + 'Five';
    $096C:
      Result := CDigit + #32 + 'Six';
    $096D:
      Result := CDigit + #32 + 'Seven';
    $096E:
      Result := CDigit + #32 + 'Eight';
    $096F:
      Result := CDigit + #32 + 'Nine';
    $0970:
      Result := 'Abbreviation Sign';
  end;

  // add 'Devanagari' to string
  if Result <> '' then
    Result := 'Devanagari' + #32 + Result;
end;

function GetHalfwidthUnicodeName(Value: Word): string;
begin
  case Value of
    $FF61:
      Result := CIdeographic + #32 + 'Full Stop';
    $FF62:
      Result := CLeft + #32 + 'Corner Bracket';
    $FF63:
      Result := CRight + #32 + 'Corner Bracket';
    $FF64:
      Result := CIdeographic + #32 + 'Comma';
    $FF65:
      Result := CKatakana + #32 + 'Middle Dot';
    $FF66:
      Result := CKatakana + #32 + CLetter + #32 + 'Wo';
    $FF67:
      Result := CKatakana + #32 + CLetter + #32 + 'Small A';
    $FF68:
      Result := CKatakana + #32 + CLetter + #32 + 'Small I';
    $FF69:
      Result := CKatakana + #32 + CLetter + #32 + 'Small U';
    $FF6A:
      Result := CKatakana + #32 + CLetter + #32 + 'Small E';
    $FF6B:
      Result := CKatakana + #32 + CLetter + #32 + 'Small O';
    $FF6C:
      Result := CKatakana + #32 + CLetter + #32 + 'Small Ya';
    $FF6D:
      Result := CKatakana + #32 + CLetter + #32 + 'Small Yu';
    $FF6E:
      Result := CKatakana + #32 + CLetter + #32 + 'Small Yo';
    $FF6F:
      Result := CKatakana + #32 + CLetter + #32 + 'Small Tu';
    $FF70:
      Result := CKatakana + '-Hiragana Prolonged Sound Mark';
    $FF71:
      Result := CKatakana + #32 + CLetter + #32 + 'A';
    $FF72:
      Result := CKatakana + #32 + CLetter + #32 + 'I';
    $FF73:
      Result := CKatakana + #32 + CLetter + #32 + 'U';
    $FF74:
      Result := CKatakana + #32 + CLetter + #32 + 'E';
    $FF75:
      Result := CKatakana + #32 + CLetter + #32 + 'O';
    $FF76:
      Result := CKatakana + #32 + CLetter + #32 + 'Ka';
    $FF77:
      Result := CKatakana + #32 + CLetter + #32 + 'Ki';
    $FF78:
      Result := CKatakana + #32 + CLetter + #32 + 'Ku';
    $FF79:
      Result := CKatakana + #32 + CLetter + #32 + 'Ke';
    $FF7A:
      Result := CKatakana + #32 + CLetter + #32 + 'Ko';
    $FF7B:
      Result := CKatakana + #32 + CLetter + #32 + 'Sa';
    $FF7C:
      Result := CKatakana + #32 + CLetter + #32 + 'Si';
    $FF7D:
      Result := CKatakana + #32 + CLetter + #32 + 'Su';
    $FF7E:
      Result := CKatakana + #32 + CLetter + #32 + 'Se';
    $FF7F:
      Result := CKatakana + #32 + CLetter + #32 + 'So';
    $FF80:
      Result := CKatakana + #32 + CLetter + #32 + 'Ta';
    $FF81:
      Result := CKatakana + #32 + CLetter + #32 + 'Ti';
    $FF82:
      Result := CKatakana + #32 + CLetter + #32 + 'Tu';
    $FF83:
      Result := CKatakana + #32 + CLetter + #32 + 'Te';
    $FF84:
      Result := CKatakana + #32 + CLetter + #32 + 'To';
    $FF85:
      Result := CKatakana + #32 + CLetter + #32 + 'Na';
    $FF86:
      Result := CKatakana + #32 + CLetter + #32 + 'Ni';
    $FF87:
      Result := CKatakana + #32 + CLetter + #32 + 'Nu';
    $FF88:
      Result := CKatakana + #32 + CLetter + #32 + 'Ne';
    $FF89:
      Result := CKatakana + #32 + CLetter + #32 + 'No';
    $FF8A:
      Result := CKatakana + #32 + CLetter + #32 + 'Ha';
    $FF8B:
      Result := CKatakana + #32 + CLetter + #32 + 'Hi';
    $FF8C:
      Result := CKatakana + #32 + CLetter + #32 + 'Hu';
    $FF8D:
      Result := CKatakana + #32 + CLetter + #32 + 'He';
    $FF8E:
      Result := CKatakana + #32 + CLetter + #32 + 'Ho';
    $FF8F:
      Result := CKatakana + #32 + CLetter + #32 + 'Ma';
    $FF90:
      Result := CKatakana + #32 + CLetter + #32 + 'Mi';
    $FF91:
      Result := CKatakana + #32 + CLetter + #32 + 'Mu';
    $FF92:
      Result := CKatakana + #32 + CLetter + #32 + 'Me';
    $FF93:
      Result := CKatakana + #32 + CLetter + #32 + 'Mo';
    $FF94:
      Result := CKatakana + #32 + CLetter + #32 + 'Ya';
    $FF95:
      Result := CKatakana + #32 + CLetter + #32 + 'Yu';
    $FF96:
      Result := CKatakana + #32 + CLetter + #32 + 'Yo';
    $FF97:
      Result := CKatakana + #32 + CLetter + #32 + 'Ra';
    $FF98:
      Result := CKatakana + #32 + CLetter + #32 + 'Ri';
    $FF99:
      Result := CKatakana + #32 + CLetter + #32 + 'Ru';
    $FF9A:
      Result := CKatakana + #32 + CLetter + #32 + 'Re';
    $FF9B:
      Result := CKatakana + #32 + CLetter + #32 + 'Ro';
    $FF9C:
      Result := CKatakana + #32 + CLetter + #32 + 'Wa';
    $FF9D:
      Result := CKatakana + #32 + CLetter + #32 + 'N';
    $FF9E:
      Result := CKatakana + #32 + 'Voiced Sound Mark';
    $FF9F:
      Result := CKatakana + #32 + 'Semi-Voiced Sound Mark';
    $FFA0:
      Result := CHangul + #32 + 'Filler';
    $FFA1:
      Result := CHangul + #32 + CLetter + #32 + 'Kiyeok';
    $FFA2:
      Result := CHangul + #32 + CLetter + #32 + 'Ssangkiyeok';
    $FFA3:
      Result := CHangul + #32 + CLetter + #32 + 'Kiyeok-Sios';
    $FFA4:
      Result := CHangul + #32 + CLetter + #32 + 'Nieun';
    $FFA5:
      Result := CHangul + #32 + CLetter + #32 + 'Nieun-Cieuc';
    $FFA6:
      Result := CHangul + #32 + CLetter + #32 + 'Nieun-Hieuh';
    $FFA7:
      Result := CHangul + #32 + CLetter + #32 + 'Tikeut';
    $FFA8:
      Result := CHangul + #32 + CLetter + #32 + 'Ssangtikeut';
    $FFA9:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul';
    $FFAA:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Kiyeok';
    $FFAB:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Mieum';
    $FFAC:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Pieup';
    $FFAD:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Sios';
    $FFAE:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Thieuth';
    $FFAF:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Phieuph';
    $FFB0:
      Result := CHangul + #32 + CLetter + #32 + 'Rieul-Hieuh';
    $FFB1:
      Result := CHangul + #32 + CLetter + #32 + 'Mieum';
    $FFB2:
      Result := CHangul + #32 + CLetter + #32 + 'Pieup';
    $FFB3:
      Result := CHangul + #32 + CLetter + #32 + 'Ssangpieup';
    $FFB4:
      Result := CHangul + #32 + CLetter + #32 + 'Pieup-Sios';
    $FFB5:
      Result := CHangul + #32 + CLetter + #32 + 'Sios';
    $FFB6:
      Result := CHangul + #32 + CLetter + #32 + 'Ssangsios';
    $FFB7:
      Result := CHangul + #32 + CLetter + #32 + 'Ieung';
    $FFB8:
      Result := CHangul + #32 + CLetter + #32 + 'Cieuc';
    $FFB9:
      Result := CHangul + #32 + CLetter + #32 + 'Ssangcieuc';
    $FFBA:
      Result := CHangul + #32 + CLetter + #32 + 'Chieuch';
    $FFBB:
      Result := CHangul + #32 + CLetter + #32 + 'Khieukh';
    $FFBC:
      Result := CHangul + #32 + CLetter + #32 + 'Thieuth';
    $FFBD:
      Result := CHangul + #32 + CLetter + #32 + 'Phieuph';
    $FFBE:
      Result := CHangul + #32 + CLetter + #32 + 'Hieuh';
    $FFC2:
      Result := CHangul + #32 + CLetter + #32 + 'A';
    $FFC3:
      Result := CHangul + #32 + CLetter + #32 + 'Ae';
    $FFC4:
      Result := CHangul + #32 + CLetter + #32 + 'Ya';
    $FFC5:
      Result := CHangul + #32 + CLetter + #32 + 'Yae';
    $FFC6:
      Result := CHangul + #32 + CLetter + #32 + 'Eo';
    $FFC7:
      Result := CHangul + #32 + CLetter + #32 + 'E';
    $FFCA:
      Result := CHangul + #32 + CLetter + #32 + 'Yeo';
    $FFCB:
      Result := CHangul + #32 + CLetter + #32 + 'Ye';
    $FFCC:
      Result := CHangul + #32 + CLetter + #32 + 'O';
    $FFCD:
      Result := CHangul + #32 + CLetter + #32 + 'Wa';
    $FFCE:
      Result := CHangul + #32 + CLetter + #32 + 'Wae';
    $FFCF:
      Result := CHangul + #32 + CLetter + #32 + 'Oe';
    $FFD2:
      Result := CHangul + #32 + CLetter + #32 + 'Yo';
    $FFD3:
      Result := CHangul + #32 + CLetter + #32 + 'U';
    $FFD4:
      Result := CHangul + #32 + CLetter + #32 + 'Weo';
    $FFD5:
      Result := CHangul + #32 + CLetter + #32 + 'We';
    $FFD6:
      Result := CHangul + #32 + CLetter + #32 + 'Wi';
    $FFD7:
      Result := CHangul + #32 + CLetter + #32 + 'Yu';
    $FFDA:
      Result := CHangul + #32 + CLetter + #32 + 'Eu';
    $FFDB:
      Result := CHangul + #32 + CLetter + #32 + 'Yi';
    $FFDC:
      Result := CHangul + #32 + CLetter + #32 + 'I';
    $FFE8:
      Result := 'Forms Light Vertical';
    $FFE9:
      Result := 'Leftwards Arrow';
    $FFEA:
      Result := 'Upwards Arrow';
    $FFEB:
      Result := 'Rightwards Arrow';
    $FFEC:
      Result := 'Downwards Arrow';
    $FFED:
      Result := 'Black' + #32 + CSquare;
    $FFEE:
      Result := 'White Circle';
  end;

  // add 'Halfwidth' to string
  if Result <> '' then
    Result := 'Halfwidth' + #32 + Result;
end;

function GetFullwidthUnicodeName(Value: Word): string;
begin
  case Value of
    $FF01:
      Result := 'Exclamation Mark';
    $FF02:
      Result := 'Quotation Mark';
    $FF03:
      Result := CNumber + #32 + 'Sign';
    $FF04:
      Result := 'Dollar Sign';
    $FF05:
      Result := 'Percent Sign';
    $FF06:
      Result := 'Ampersand';
    $FF07:
      Result := 'Apostrophe';
    $FF08:
      Result := CLeft + #32 + 'Parenthesis';
    $FF09:
      Result := CRight + #32 + 'Parenthesis';
    $FF0A:
      Result := 'Asterisk';
    $FF0B:
      Result := 'Plus Sign';
    $FF0C:
      Result := 'Comma';
    $FF0D:
      Result := 'Hyphen-Minus';
    $FF0E:
      Result := 'Full Stop';
    $FF0F:
      Result := 'Solidus';
    $FF10:
      Result := CDigit + #32 + 'Zero';
    $FF11:
      Result := CDigit + #32 + 'One';
    $FF12:
      Result := CDigit + #32 + 'Two';
    $FF13:
      Result := CDigit + #32 + 'Three';
    $FF14:
      Result := CDigit + #32 + 'Four';
    $FF15:
      Result := CDigit + #32 + 'Five';
    $FF16:
      Result := CDigit + #32 + 'Six';
    $FF17:
      Result := CDigit + #32 + 'Seven';
    $FF18:
      Result := CDigit + #32 + 'Eight';
    $FF19:
      Result := CDigit + #32 + 'Nine';
    $FF1A:
      Result := 'Colon';
    $FF1B:
      Result := 'Semicolon';
    $FF1C:
      Result := 'Less-Than Sign';
    $FF1D:
      Result := 'Equals Sign';
    $FF1E:
      Result := 'Greater-Than Sign';
    $FF1F:
      Result := 'Question Mark';
    $FF20:
      Result := 'Commercial At';
    $FF21:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'A';
    $FF22:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'B';
    $FF23:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'C';
    $FF24:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'D';
    $FF25:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'E';
    $FF26:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'F';
    $FF27:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'G';
    $FF28:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'H';
    $FF29:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'I';
    $FF2A:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'J';
    $FF2B:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'K';
    $FF2C:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'L';
    $FF2D:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'M';
    $FF2E:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'N';
    $FF2F:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'O';
    $FF30:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'P';
    $FF31:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'Q';
    $FF32:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'R';
    $FF33:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'S';
    $FF34:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'T';
    $FF35:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'U';
    $FF36:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'V';
    $FF37:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'W';
    $FF38:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'X';
    $FF39:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'Y';
    $FF3A:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'Z';
    $FF3B:
      Result := CLeft + #32 + CSquare + #32 + 'Bracket';
    $FF3C:
      Result := 'Reverse Solidus';
    $FF3D:
      Result := CRight + #32 + CSquare + #32 + 'Bracket';
    $FF3E:
      Result := CCircumflex + #32 + 'Accent';
    $FF3F:
      Result := 'Low Line';
    $FF40:
      Result := 'Grave Accent';
    $FF41:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'A';
    $FF42:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'B';
    $FF43:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'C';
    $FF44:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'D';
    $FF45:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'E';
    $FF46:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'F';
    $FF47:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'G';
    $FF48:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'H';
    $FF49:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'I';
    $FF4A:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'J';
    $FF4B:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'K';
    $FF4C:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'L';
    $FF4D:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'M';
    $FF4E:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'N';
    $FF4F:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'O';
    $FF50:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'P';
    $FF51:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Q';
    $FF52:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'R';
    $FF53:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'S';
    $FF54:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'T';
    $FF55:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'U';
    $FF56:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'V';
    $FF57:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'W';
    $FF58:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'X';
    $FF59:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Y';
    $FF5A:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Z';
    $FF5B:
      Result := CLeft + #32 + 'Curly Bracket';
    $FF5C:
      Result := 'Vertical Line';
    $FF5D:
      Result := CRight + #32 + 'Curly Bracket';
    $FF5E:
      Result := CTilde;
    $FFE0:
      Result := 'Cent Sign';
    $FFE1:
      Result := 'Pound Sign';
    $FFE2:
      Result := 'Not Sign';
    $FFE3:
      Result := 'Macron';
    $FFE4:
      Result := 'Broken Bar';
    $FFE5:
      Result := 'Yen Sign';
    $FFE6:
      Result := 'Won Sign';
  end;

  // add 'Fullwidth' to string
  if Result <> '' then
    Result := 'Fullwidth' + #32 + Result;
end;

function GetCombiningUnicodeName(Value: Word): string;
begin
  case Value of
    $0300:
      Result := 'Grave Accent';
    $0301:
      Result := 'Acute Accent';
    $0302:
      Result := CCircumflex + #32 + 'Accent';
    $0303:
      Result := CTilde;
    $0304:
      Result := 'Macron';
    $0305:
      Result := 'Overline';
    $0306:
      Result := 'Breve';
    $0307:
      Result := 'Dot Above';
    $0308:
      Result := 'Diaresis';
    $0309:
      Result := 'Hook Above';
    $030A:
      Result := 'Ring Above';
    $030B:
      Result := 'Double Acute Accent';
    $030C:
      Result := 'Caron';
    $030D:
      Result := 'Vertical Line Above';
    $030E:
      Result := 'Double Vertical Line Above';
    $030F:
      Result := 'Double Grave Accent';
    $0310:
      Result := 'Candrabindu';
    $0311:
      Result := 'Inverted Breve';
    $0312:
      Result := CTurned + #32 + 'Comma Above';
    $0313:
      Result := 'Comma Above';
    $0314:
      Result := 'Reversed Comma Above';
    $0315:
      Result := 'Comma Above' + #32 + CRight;
    $0316:
      Result := 'Grave Accent Below';
    $0317:
      Result := 'Acute Accent Below';
    $0318:
      Result := CLeft + #32 + 'Tack Below';
    $0319:
      Result := CRight + #32 + 'Tack Below';
    $031A:
      Result := CLeft + #32 + 'Angle Above';
    $031B:
      Result := CHorn;
    $031C:
      Result := CLeft + #32 + 'Half Ring Below';
    $031D:
      Result := CUp + #32 + 'Tack Below';
    $031E:
      Result := CDown + #32 + 'Tack Below';
    $031F:
      Result := 'Plus Sign Below';
    $0320:
      Result := 'Minus Sign Below';
    $0321:
      Result := 'Palatalized Hook Below';
    $0322:
      Result := 'Retroflex Hook Below';
    $0323:
      Result := 'Dot Below';
    $0324:
      Result := 'Diaresis Below';
    $0325:
      Result := 'Ring Below';
    $0326:
      Result := 'Comma Below';
    $0327:
      Result := CCedilla;
    $0328:
      Result := 'Ogonek';
    $0329:
      Result := 'Vertical Line Below';
    $032A:
      Result := 'Bridge Below';
    $032B:
      Result := 'Inverted Double Arch Below';
    $032C:
      Result := 'Caron Below';
    $032D:
      Result := CCircumflex + #32 + 'Accent Below';
    $032E:
      Result := 'Breve Below';
    $032F:
      Result := 'Inverted Breve Below';
    $0330:
      Result := CTilde + #32 + 'Below';
    $0331:
      Result := 'Macron Below';
    $0332:
      Result := 'Low Line';
    $0333:
      Result := 'Double Low Line';
    $0334:
      Result := CTilde + #32 + 'Overlay';
    $0335:
      Result := 'Short Stroke Overlay';
    $0336:
      Result := 'Long Stroke Overlay';
    $0337:
      Result := 'Short Solidus Overlay';
    $0338:
      Result := 'Long Solidus Overlay';
    $0339:
      Result := CRight + #32 + 'Half Ring Below';
    $033A:
      Result := 'Inverted Bridge Below';
    $033B:
      Result := CSquare + #32 + 'Below';
    $033C:
      Result := 'Seagull Below';
    $033D:
      Result := 'X Above';
    $033E:
      Result := 'Vertical' + #32 + CTilde;
    $033F:
      Result := 'Double Overline';
    $0340:
      Result := 'Grave Tone Mark';
    $0341:
      Result := 'Acute Tone Mark';
    $0342:
      Result := 'Greek Perispomeni';
    $0343:
      Result := 'Greek Koronis';
    $0344:
      Result := 'Greek Dialytika Tonos';
    $0345:
      Result := 'Greek Ypogegrammeni';
    $0360:
      Result := 'Double' + #32 + CTilde;
    $0361:
      Result := 'Double Inverted Breve';
    $0483:
      Result := 'Cyrillic Titlo';
    $0484:
      Result := 'Cyrillic Palatalization';
    $0485:
      Result := 'Cyrillic Dasia Pneumata';
    $0486:
      Result := 'Cyrillic Psili Pneumata';
    $20D0:
      Result := CLeft + #32 + 'Harpoon Above';
    $20D1:
      Result := CRight + #32 + 'Harpoon Above';
    $20D2:
      Result := 'Long Vertical Line Overlay';
    $20D3:
      Result := 'Short Vertical Line Overlay';
    $20D4:
      Result := 'Anticlockwise Arrow Above';
    $20D5:
      Result := 'Clockwise Arrow Above';
    $20D6:
      Result := CLeft + #32 + 'Arrow Above';
    $20D7:
      Result := CRight + #32 + 'Arrow Above';
    $20D8:
      Result := 'Ring Overlay';
    $20D9:
      Result := 'Clockwise Ring Overlay';
    $20DA:
      Result := 'Anticlockwise Ring Overlay';
    $20DB:
      Result := 'Three Dots Above';
    $20DC:
      Result := 'Four Dots Above';
    $20DD:
      Result := 'Enclosing Circle';
    $20DE:
      Result := 'Enclosing' + #32 + CSquare;
    $20DF:
      Result := 'Enclosing Diamond';
    $20E0:
      Result := 'Enclosing Circle Backslash';
    $20E1:
      Result := CLeft + #32 + CRight + #32 + 'Arrow Above';
    $3099:
      Result := 'Katakana-Hiragana Voiced Sound Mark';
    $309A:
      Result := 'Katakana-Hiragana Semi-Voiced Sound Mark';
    $FE20:
      Result := CLigature + #32 + CLeft + #32 + 'Half';
    $FE21:
      Result := CLigature + #32 + CRight + #32 + 'Half';
    $FE22:
      Result := 'Double Tilde' + #32 + CLeft + #32 + 'Half';
    $FE23:
      Result := 'Double Tilde' + #32 + CRight + #32 + 'Half';
  end;

  // add 'Combining' to string
  if Result <> '' then
    Result := 'Combining' + #32 + Result;
end;

function GetPresentationFormForVerticalUnicodeName(Value: Word): string;
begin
  case Value of
    $FE30:
      Result := 'Two Dot Leader';
    $FE31:
      Result := 'Em Dash';
    $FE32:
      Result := 'En Dash';
    $FE33:
      Result := 'Low Line';
    $FE34:
      Result := 'Wavy Low Line';
    $FE35:
      Result := CLeft + #32 + 'Parenthesis';
    $FE36:
      Result := CRight + #32 + 'Parenthesis';
    $FE37:
      Result := CLeft + #32 + 'Curly Bracket';
    $FE38:
      Result := CRight + #32 + 'Curly Bracket';
    $FE39:
      Result := CLeft + #32 + 'Tortoise Shell Bracket';
    $FE3A:
      Result := CRight + #32 + 'Tortoise Shell Bracket';
    $FE3B:
      Result := CLeft + #32 + 'Black Lenticular Bracket';
    $FE3C:
      Result := CRight + #32 + 'Black Lenticular Bracket';
    $FE3D:
      Result := CLeft + #32 + 'Double Angle Bracket';
    $FE3E:
      Result := CRight + #32 + 'Double Angle Bracket';
    $FE3F:
      Result := CLeft + #32 + 'Angle Bracket';
    $FE40:
      Result := CRight + #32 + 'Angle Bracket';
    $FE41:
      Result := CLeft + #32 + 'Corner Bracket';
    $FE42:
      Result := CRight + #32 + 'Corner Bracket';
    $FE43:
      Result := CLeft + #32 + 'White Corner Bracket';
    $FE44:
      Result := CRight + #32 + 'White Corner Bracket';
  end;

  // add 'Presentation Form For Vertical' to string
  if Result <> '' then
    Result := 'Presentation Form For Vertical' + #32 + Result;
end;

function GetBoxDrawingsUnicodeName(Value: Word): string;
begin
  case Value of
    $2500:
      Result := CLight + #32 + 'Horizontal';
    $2501:
      Result := CHeavy + #32 + 'Horizontal';
    $2502:
      Result := CLight + #32 + 'Vertical';
    $2503:
      Result := CHeavy + #32 + 'Vertical';
    $2504:
      Result := CLight + #32 + 'Triple Dash Horizontal';
    $2505:
      Result := CHeavy + #32 + 'Triple Dash Horizontal';
    $2506:
      Result := CLight + #32 + 'Triple Dash Vertical';
    $2507:
      Result := CHeavy + #32 + 'Triple Dash Vertical';
    $2508:
      Result := CLight + #32 + 'Quadruple Dash Horizontal';
    $2509:
      Result := CHeavy + #32 + 'Quadruple Dash Horizontal';
    $250A:
      Result := CLight + #32 + 'Quadruple Dash Vertical';
    $250B:
      Result := CHeavy + #32 + 'Quadruple Dash Vertical';
    $250C:
      Result := CLight + #32 + CDown + #32 + 'And' + #32 + CRight;
    $250D:
      Result := CDown + #32 + 'Light And' + #32 + CRight + #32 + 'Heavy';
    $250E:
      Result := CDown + #32 + 'Heavy And' + #32 + CRight + #32 + 'Light';
    $250F:
      Result := CHeavy + #32 + CDown + #32 + 'And' + #32 + CRight;
    $2510:
      Result := CLight + #32 + CDown + #32 + 'And' + #32 + CLeft;
    $2511:
      Result := CDown + #32 + 'Light And' + #32 + CLeft + #32 + 'Heavy';
    $2512:
      Result := CDown + #32 + 'Heavy And' + #32 + CLeft + #32 + 'Light';
    $2513:
      Result := CHeavy + #32 + CDown + #32 + 'And' + #32 + CLeft;
    $2514:
      Result := CLight + #32 + CUp + #32 + 'And' + #32 + CRight;
    $2515:
      Result := CUp + #32 + 'Light And' + #32 + CRight + #32 + 'Heavy';
    $2516:
      Result := CUp + #32 + 'Heavy And' + #32 + CRight + #32 + 'Light';
    $2517:
      Result := CHeavy + #32 + CUp + #32 + 'And' + #32 + CRight;
    $2518:
      Result := CLight + #32 + CUp + #32 + 'And' + #32 + CLeft;
    $2519:
      Result := CUp + #32 + 'Light And' + #32 + CLeft + #32 + 'Heavy';
    $251A:
      Result := CUp + #32 + 'Heavy And' + #32 + CLeft + #32 + 'Light';
    $251B:
      Result := CHeavy + #32 + CUp + #32 + 'And' + #32 + CLeft;
    $251C:
      Result := CLight + #32 + 'Vertical And' + #32 + CRight;
    $251D:
      Result := 'Vertical Light And' + #32 + CRight + #32 + 'Heavy';
    $251E:
      Result := CUp + #32 + 'Heavy And' + #32 + CRight + #32 + 'Down Light';
    $251F:
      Result := CDown + #32 + 'Heavy And' + #32 + CRight + #32 + 'Up Light';
    $2520:
      Result := 'Vertical Heavy And' + #32 + CRight + #32 + 'Light';
    $2521:
      Result := CDown + #32 + 'Light And' + #32 + CRight + #32 + 'Up Heavy';
    $2522:
      Result := CUp + #32 + 'Light And' + #32 + CRight + #32 + 'Down Heavy';
    $2523:
      Result := CHeavy + #32 + 'Vertical And' + #32 + CRight;
    $2524:
      Result := CLight + #32 + 'Vertical And' + #32 + CLeft;
    $2525:
      Result := 'Vertical Light And' + #32 + CLeft + #32 + 'Heavy';
    $2526:
      Result := CUp + #32 + 'Heavy And' + #32 + CLeft + #32 + 'Down Light';
    $2527:
      Result := CDown + #32 + 'Heavy And' + #32 + CLeft + #32 + 'Up Light';
    $2528:
      Result := 'Vertical Heavy And' + #32 + CLeft + #32 + 'Light';
    $2529:
      Result := CDown + #32 + 'Light And' + #32 + CLeft + #32 + 'Up Heavy';
    $252A:
      Result := CUp + #32 + 'Light And' + #32 + CLeft + #32 + 'Down Heavy';
    $252B:
      Result := CHeavy + #32 + 'Vertical And' + #32 + CLeft;
    $252C:
      Result := CLight + #32 + CDown + #32 + 'And Horizontal';
    $252D:
      Result := CLeft + #32 + CHeavy + #32 + 'And' + #32 + CRight + #32 + 'Down Light';
    $252E:
      Result := CRight + #32 + CHeavy + #32 + 'And' + #32 + CLeft + #32 + 'Down Light';
    $252F:
      Result := CDown + #32 + 'Light And Horizontal Heavy';
    $2530:
      Result := CDown + #32 + 'Heavy And Horizontal Light';
    $2531:
      Result := CRight + #32 + CLight + #32 + 'And' + #32 + CLeft + #32 + 'Down Heavy';
    $2532:
      Result := CLeft + #32 + CLight + #32 + 'And' + #32 + CRight + #32 + 'Down Heavy';
    $2533:
      Result := CHeavy + #32 + CDown + #32 + 'And Horizontal';
    $2534:
      Result := CLight + #32 + CUp + #32 + 'And Horizontal';
    $2535:
      Result := CLeft + #32 + CHeavy + #32 + 'And' + #32 + CRight + #32 + 'Up Light';
    $2536:
      Result := CRight + #32 + CHeavy + #32 + 'And' + #32 + CLeft + #32 + 'Up Light';
    $2537:
      Result := CUp + #32 + 'Light And Horizontal Heavy';
    $2538:
      Result := CUp + #32 + 'Heavy And Horizontal Light';
    $2539:
      Result := CRight + #32 + CLight + #32 + 'And' + #32 + CLeft + #32 + 'Up Heavy';
    $253A:
      Result := CLeft + #32 + CLight + #32 + 'And' + #32 + CRight + #32 + 'Up Heavy';
    $253B:
      Result := CHeavy + #32 + CUp + #32 + 'And Horizontal';
    $253C:
      Result := CLight + #32 + 'Vertical And Horizontal';
    $253D:
      Result := CLeft + #32 + CHeavy + #32 + 'And' + #32 + CRight + #32 + 'Vertical Light';
    $253E:
      Result := CRight + #32 + CHeavy + #32 + 'And' + #32 + CLeft + #32 + 'Vertical Light';
    $253F:
      Result := 'Vertical Light And Horizontal Heavy';
    $2540:
      Result := CUp + #32 + 'Heavy And Down Horizontal Light';
    $2541:
      Result := CDown + #32 + 'Heavy And Up Horizontal Light';
    $2542:
      Result := 'Vertical Heavy And Horizontal Light';
    $2543:
      Result := CLeft + #32 + CUp + #32 + 'Heavy And' + #32 + CRight + #32 + 'Down Light';
    $2544:
      Result := CRight + #32 + CUp + #32 + 'Heavy And' + #32 + CLeft + #32 + 'Down Light';
    $2545:
      Result := CLeft + #32 + CDown + #32 + 'Heavy And' + #32 + CRight + #32 + 'Up Light';
    $2546:
      Result := CRight + #32 + CDown + #32 + 'Heavy And' + #32 + CLeft + #32 + 'Up Light';
    $2547:
      Result := CDown + #32 + 'Light And Up Horizontal Heavy';
    $2548:
      Result := CUp + #32 + 'Light And Down Horizontal Heavy';
    $2549:
      Result := CRight + #32 + CLight + #32 + 'And' + #32 + CLeft + #32 + 'Vertical Heavy';
    $254A:
      Result := CLeft + #32 + CLight + #32 + 'And' + #32 + CRight + #32 + 'Vertical Heavy';
    $254B:
      Result := CHeavy + #32 + 'Vertical And Horizontal';
    $254C:
      Result := CLight + #32 + 'Double Dash Horizontal';
    $254D:
      Result := CHeavy + #32 + 'Double Dash Horizontal';
    $254E:
      Result := CLight + #32 + 'Double Dash Vertical';
    $254F:
      Result := CHeavy + #32 + 'Double Dash Vertical';
    $2550:
      Result := 'Double Horizontal';
    $2551:
      Result := 'Double Vertical';
    $2552:
      Result := CDown + #32 + 'Single And' + #32 + CRight + #32 + 'Double';
    $2553:
      Result := CDown + #32 + 'Double And' + #32 + CRight + #32 + 'Single';
    $2554:
      Result := 'Double Down And' + #32 + CRight;
    $2555:
      Result := CDown + #32 + 'Single And' + #32 + CLeft + #32 + 'Double';
    $2556:
      Result := CDown + #32 + 'Double And' + #32 + CLeft + #32 + 'Single';
    $2557:
      Result := 'Double Down And' + #32 + CLeft;
    $2558:
      Result := CUp + #32 + 'Single And' + #32 + CRight + #32 + 'Double';
    $2559:
      Result := CUp + #32 + 'Double And' + #32 + CRight + #32 + 'Single';
    $255A:
      Result := 'Double Up And' + #32 + CRight;
    $255B:
      Result := CUp + #32 + 'Single And' + #32 + CLeft + #32 + 'Double';
    $255C:
      Result := CUp + #32 + 'Double And' + #32 + CLeft + #32 + 'Single';
    $255D:
      Result := 'Double Up And' + #32 + CLeft;
    $255E:
      Result := 'Vertical Single And' + #32 + CRight + #32 + 'Double';
    $255F:
      Result := 'Vertical Double And' + #32 + CRight + #32 + 'Single';
    $2560:
      Result := 'Double Vertical And' + #32 + CRight;
    $2561:
      Result := 'Vertical Single And' + #32 + CLeft + #32 + 'Double';
    $2562:
      Result := 'Vertical Double And' + #32 + CLeft + #32 + 'Single';
    $2563:
      Result := 'Double Vertical And' + #32 + CLeft;
    $2564:
      Result := CDown + #32 + 'Single And Horizontal Double';
    $2565:
      Result := CDown + #32 + 'Double And Horizontal Single';
    $2566:
      Result := 'Double Down And Horizontal';
    $2567:
      Result := CUp + #32 + 'Single And Horizontal Double';
    $2568:
      Result := CUp + #32 + 'Double And Horizontal Single';
    $2569:
      Result := 'Double Up And Horizontal';
    $256A:
      Result := 'Vertical Single And Horizontal Double';
    $256B:
      Result := 'Vertical Double And Horizontal Single';
    $256C:
      Result := 'Double Vertical And Horizontal';
    $256D:
      Result := CLight + #32 + 'Arc Down And' + #32 + CRight;
    $256E:
      Result := CLight + #32 + 'Arc Down And' + #32 + CLeft;
    $256F:
      Result := CLight + #32 + 'Arc Up And' + #32 + CLeft;
    $2570:
      Result := CLight + #32 + 'Arc Up And' + #32 + CRight;
    $2571:
      Result := CLight + #32 + 'Diagonal' + #32 + CUpper + #32 + 'Right To' + #32 + CLower + #32 + CLeft;
    $2572:
      Result := CLight + #32 + 'Diagonal' + #32 + CUpper + #32 + 'Left To' + #32 + CLower + #32 + CRight;
    $2573:
      Result := CLight + #32 + 'Diagonal Cross';
    $2574:
      Result := CLight + #32 + CLeft;
    $2575:
      Result := CLight + #32 + CUp;
    $2576:
      Result := CLight + #32 + CRight;
    $2577:
      Result := CLight + #32 + CDown;
    $2578:
      Result := CHeavy + #32 + CLeft;
    $2579:
      Result := CHeavy + #32 + CUp;
    $257A:
      Result := CHeavy + #32 + CRight;
    $257B:
      Result := CHeavy + #32 + CDown;
    $257C:
      Result := CLight + #32 + 'Left And Heavy' + #32 + CRight;
    $257D:
      Result := CLight + #32 + CUp + #32 + 'And Heavy Down';
    $257E:
      Result := CHeavy + #32 + 'Left And Light' + #32 + CRight;
    $257F:
      Result := CHeavy + #32 + CUp + #32 + 'And Light Down';
  end;

  // add 'Box Drawings' to string
  if Result <> '' then
    Result := 'Box Drawings' + #32 + Result;
end;

function GetSquareUnicodeName(Value: Word): string;
begin
  case Value of
    $3300:
      Result := 'Apaato';
    $3301:
      Result := 'Aruhua';
    $3302:
      Result := 'Anpea';
    $3303:
      Result := 'Aaru';
    $3304:
      Result := 'Iningu';
    $3305:
      Result := 'Inti';
    $3306:
      Result := 'Uon';
    $3307:
      Result := 'Esukuudo';
    $3308:
      Result := 'Eekaa';
    $3309:
      Result := 'Onsu';
    $330A:
      Result := 'Oomu';
    $330B:
      Result := 'Kairi';
    $330C:
      Result := 'Karatto';
    $330D:
      Result := 'Karorii';
    $330E:
      Result := 'Garon';
    $330F:
      Result := 'Ganma';
    $3310:
      Result := 'Giga';
    $3311:
      Result := 'Ginii';
    $3312:
      Result := 'Kyurii';
    $3313:
      Result := 'Girudaa';
    $3314:
      Result := 'Kiro';
    $3315:
      Result := 'Kiroguramu';
    $3316:
      Result := 'Kiromeetoru';
    $3317:
      Result := 'Kirowatto';
    $3318:
      Result := 'Guramu';
    $3319:
      Result := 'Guramuton';
    $331A:
      Result := 'Kuruzeiro';
    $331B:
      Result := 'Kuroone';
    $331C:
      Result := 'Keesu';
    $331D:
      Result := 'Koruna';
    $331E:
      Result := 'Koopo';
    $331F:
      Result := 'Saikuru';
    $3320:
      Result := 'Santiimu';
    $3321:
      Result := 'Siringu';
    $3322:
      Result := 'Senti';
    $3323:
      Result := 'Sento';
    $3324:
      Result := 'Daasu';
    $3325:
      Result := 'Desi';
    $3326:
      Result := 'Doru';
    $3327:
      Result := 'Ton';
    $3328:
      Result := 'Nano';
    $3329:
      Result := 'Notto';
    $332A:
      Result := 'Haitu';
    $332B:
      Result := 'Paasento';
    $332C:
      Result := 'Paatu';
    $332D:
      Result := 'Baareru';
    $332E:
      Result := 'Piasutoru';
    $332F:
      Result := 'Pikuru';
    $3330:
      Result := 'Piko';
    $3331:
      Result := 'Biru';
    $3332:
      Result := 'Huaraddo';
    $3333:
      Result := 'Huiito';
    $3334:
      Result := 'Bussyeru';
    $3335:
      Result := 'Huran';
    $3336:
      Result := 'Hekutaaru';
    $3337:
      Result := 'Peso';
    $3338:
      Result := 'Penihi';
    $3339:
      Result := 'Herutu';
    $333A:
      Result := 'Pensu';
    $333B:
      Result := 'Peezi';
    $333C:
      Result := 'Beeta';
    $333D:
      Result := 'Pointo';
    $333E:
      Result := 'Boruto';
    $333F:
      Result := 'Hon';
    $3340:
      Result := 'Pondo';
    $3341:
      Result := 'Hooru';
    $3342:
      Result := 'Hoon';
    $3343:
      Result := 'Maikuro';
    $3344:
      Result := 'Mairu';
    $3345:
      Result := 'Mahha';
    $3346:
      Result := 'Maruku';
    $3347:
      Result := 'Mansyon';
    $3348:
      Result := 'Mikuron';
    $3349:
      Result := 'Miri';
    $334A:
      Result := 'Miribaaru';
    $334B:
      Result := 'Mega';
    $334C:
      Result := 'Megaton';
    $334D:
      Result := 'Meetoru';
    $334E:
      Result := 'Yaado';
    $334F:
      Result := 'Yaaru';
    $3350:
      Result := 'Yuan';
    $3351:
      Result := 'Rittoru';
    $3352:
      Result := 'Rira';
    $3353:
      Result := 'Rupii';
    $3354:
      Result := 'Ruuburu';
    $3355:
      Result := 'Remu';
    $3356:
      Result := 'Rentogen';
    $3357:
      Result := 'Watto';
    $3371:
      Result := 'Hpa';
    $3372:
      Result := 'Da';
    $3373:
      Result := 'Au';
    $3374:
      Result := 'Bar';
    $3375:
      Result := 'Ov';
    $3376:
      Result := 'Pc';
    $337B:
      Result := 'Era Name Heisei';
    $337C:
      Result := 'Era Name Syouwa';
    $337D:
      Result := 'Era Name Taisyou';
    $337E:
      Result := 'Era Name Meizi';
    $337F:
      Result := 'Corporation';
    $3380:
      Result := 'Pa Amps';
    $3381:
      Result := 'Na';
    $3382:
      Result := 'Mu A';
    $3383:
      Result := 'Ma';
    $3384:
      Result := 'Ka';
    $3385:
      Result := 'Kb';
    $3386:
      Result := 'Mb';
    $3387:
      Result := 'Gb';
    $3388:
      Result := 'Cal';
    $3389:
      Result := 'Kcal';
    $338A:
      Result := 'Pf';
    $338B:
      Result := 'Nf';
    $338C:
      Result := 'Mu F';
    $338D:
      Result := 'Mu G';
    $338E:
      Result := 'Mg';
    $338F:
      Result := 'Kg';
    $3390:
      Result := 'Hz';
    $3391:
      Result := 'Khz';
    $3392:
      Result := 'Mhz';
    $3393:
      Result := 'Ghz';
    $3394:
      Result := 'Thz';
    $3395:
      Result := 'Mu L';
    $3396:
      Result := 'Ml';
    $3397:
      Result := 'Dl';
    $3398:
      Result := 'Kl';
    $3399:
      Result := 'Fm';
    $339A:
      Result := 'Nm';
    $339B:
      Result := 'Mu M';
    $339C:
      Result := 'Mm';
    $339D:
      Result := 'Cm';
    $339E:
      Result := 'Km';
    $339F:
      Result := 'Mm Squared';
    $33A0:
      Result := 'Cm Squared';
    $33A1:
      Result := 'M Squared';
    $33A2:
      Result := 'Km Squared';
    $33A3:
      Result := 'Mm Cubed';
    $33A4:
      Result := 'Cm Cubed';
    $33A5:
      Result := 'M Cubed';
    $33A6:
      Result := 'Km Cubed';
    $33A7:
      Result := 'M Over S';
    $33A8:
      Result := 'M Over S Squared';
    $33A9:
      Result := 'Pa';
    $33AA:
      Result := 'Kpa';
    $33AB:
      Result := 'Mpa';
    $33AC:
      Result := 'Gpa';
    $33AD:
      Result := 'Rad';
    $33AE:
      Result := 'Rad Over S';
    $33AF:
      Result := 'Rad Over S Squared';
    $33B0:
      Result := 'Ps';
    $33B1:
      Result := 'Ns';
    $33B2:
      Result := 'Mu S';
    $33B3:
      Result := 'Ms';
    $33B4:
      Result := 'Pv';
    $33B5:
      Result := 'Nv';
    $33B6:
      Result := 'Mu V';
    $33B7:
      Result := 'Mv';
    $33B8:
      Result := 'Kv';
    $33B9:
      Result := 'Mv Mega';
    $33BA:
      Result := 'Pw';
    $33BB:
      Result := 'Nw';
    $33BC:
      Result := 'Mu W';
    $33BD:
      Result := 'Mw';
    $33BE:
      Result := 'Kw';
    $33BF:
      Result := 'Mw Mega';
    $33C0:
      Result := 'K Ohm';
    $33C1:
      Result := 'M Ohm';
    $33C2:
      Result := 'Am';
    $33C3:
      Result := 'Bq';
    $33C4:
      Result := 'Cc';
    $33C5:
      Result := 'Cd';
    $33C6:
      Result := 'C Over Kg';
    $33C7:
      Result := 'Co';
    $33C8:
      Result := 'Db';
    $33C9:
      Result := 'Gy';
    $33CA:
      Result := 'Ha';
    $33CB:
      Result := 'Hp';
    $33CC:
      Result := 'In';
    $33CD:
      Result := 'Kk';
    $33CE:
      Result := 'Km Capital';
    $33CF:
      Result := 'Kt';
    $33D0:
      Result := 'Lm';
    $33D1:
      Result := 'Ln';
    $33D2:
      Result := 'Log';
    $33D3:
      Result := 'Lx';
    $33D4:
      Result := 'Mb Small';
    $33D5:
      Result := 'Mil';
    $33D6:
      Result := 'Mol';
    $33D7:
      Result := 'Ph';
    $33D8:
      Result := 'Pm';
    $33D9:
      Result := 'Ppm';
    $33DA:
      Result := 'Pr';
    $33DB:
      Result := 'Sr';
    $33DC:
      Result := 'Sv';
    $33DD:
      Result := 'Wb';
  end;

  // add 'Square' to string
  if Result <> '' then
    Result := CSquare + #32 + Result;
end;

function GetCircledUnicodeName(Value: Word): string;
begin
  case Value of
    $2295:
      Result := 'Plus';
    $2296:
      Result := 'Minus';
    $2297:
      Result := 'Times';
    $2298:
      Result := 'Division Slash';
    $2299:
      Result := 'Dot Operator';
    $229A:
      Result := 'Ring Operator';
    $229B:
      Result := 'Asterisk Operator';
    $229C:
      Result := 'Equals';
    $229D:
      Result := 'Dash';
    $2460:
      Result := 'Digit One';
    $2461:
      Result := 'Digit Two';
    $2462:
      Result := 'Digit Three';
    $2463:
      Result := 'Digit Four';
    $2464:
      Result := 'Digit Five';
    $2465:
      Result := 'Digit Six';
    $2466:
      Result := 'Digit Seven';
    $2467:
      Result := 'Digit Eight';
    $2468:
      Result := 'Digit Nine';
    $2469:
      Result := CNumber + #32 + 'Ten';
    $246A:
      Result := CNumber + #32 + 'Eleven';
    $246B:
      Result := CNumber + #32 + 'Twelve';
    $246C:
      Result := CNumber + #32 + 'Thirteen';
    $246D:
      Result := CNumber + #32 + 'Fourteen';
    $246E:
      Result := CNumber + #32 + 'Fifteen';
    $246F:
      Result := CNumber + #32 + 'Sixteen';
    $2470:
      Result := CNumber + #32 + 'Seventeen';
    $2471:
      Result := CNumber + #32 + 'Eighteen';
    $2472:
      Result := CNumber + #32 + 'Nineteen';
    $2473:
      Result := CNumber + #32 + 'Twenty';
    $24B6:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'A';
    $24B7:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'B';
    $24B8:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'C';
    $24B9:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'D';
    $24BA:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'E';
    $24BB:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'F';
    $24BC:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'G';
    $24BD:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'H';
    $24BE:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'I';
    $24BF:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'J';
    $24C0:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'K';
    $24C1:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'L';
    $24C2:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'M';
    $24C3:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'N';
    $24C4:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'O';
    $24C5:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'P';
    $24C6:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'Q';
    $24C7:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'R';
    $24C8:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'S';
    $24C9:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'T';
    $24CA:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'U';
    $24CB:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'V';
    $24CC:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'W';
    $24CD:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'X';
    $24CE:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'Y';
    $24CF:
      Result := CLatin + #32 + CCapital + #32 + CLetter + #32 + 'Z';
    $24D0:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'A';
    $24D1:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'B';
    $24D2:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'C';
    $24D3:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'D';
    $24D4:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'E';
    $24D5:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'F';
    $24D6:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'G';
    $24D7:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'H';
    $24D8:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'I';
    $24D9:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'J';
    $24DA:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'K';
    $24DB:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'L';
    $24DC:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'M';
    $24DD:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'N';
    $24DE:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'O';
    $24DF:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'P';
    $24E0:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Q';
    $24E1:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'R';
    $24E2:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'S';
    $24E3:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'T';
    $24E4:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'U';
    $24E5:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'V';
    $24E6:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'W';
    $24E7:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'X';
    $24E8:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Y';
    $24E9:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Z';
    $24EA:
      Result := 'Digit Zero';
    $3260:
      Result := CHangul + #32 + 'Kiyeok';
    $3261:
      Result := CHangul + #32 + 'Nieun';
    $3262:
      Result := CHangul + #32 + 'Tikeut';
    $3263:
      Result := CHangul + #32 + 'Rieul';
    $3264:
      Result := CHangul + #32 + 'Mieum';
    $3265:
      Result := CHangul + #32 + 'Pieup';
    $3266:
      Result := CHangul + #32 + 'Sios';
    $3267:
      Result := CHangul + #32 + 'Ieung';
    $3268:
      Result := CHangul + #32 + 'Cieuc';
    $3269:
      Result := CHangul + #32 + 'Chieuch';
    $326A:
      Result := CHangul + #32 + 'Khieukh';
    $326B:
      Result := CHangul + #32 + 'Thieuth';
    $326C:
      Result := CHangul + #32 + 'Phieuph';
    $326D:
      Result := CHangul + #32 + 'Hieuh';
    $326E:
      Result := CHangul + #32 + 'Kiyeok A';
    $326F:
      Result := CHangul + #32 + 'Nieun A';
    $3270:
      Result := CHangul + #32 + 'Tikeut A';
    $3271:
      Result := CHangul + #32 + 'Rieul A';
    $3272:
      Result := CHangul + #32 + 'Mieum A';
    $3273:
      Result := CHangul + #32 + 'Pieup A';
    $3274:
      Result := CHangul + #32 + 'Sios A';
    $3275:
      Result := CHangul + #32 + 'Ieung A';
    $3276:
      Result := CHangul + #32 + 'Cieuc A';
    $3277:
      Result := CHangul + #32 + 'Chieuch A';
    $3278:
      Result := CHangul + #32 + 'Khieukh A';
    $3279:
      Result := CHangul + #32 + 'Thieuth A';
    $327A:
      Result := CHangul + #32 + 'Phieuph A';
    $327B:
      Result := CHangul + #32 + 'Hieuh A';
    $3280:
      Result := CIdeograph + #32 + 'One';
    $3281:
      Result := CIdeograph + #32 + 'Two';
    $3282:
      Result := CIdeograph + #32 + 'Three';
    $3283:
      Result := CIdeograph + #32 + 'Four';
    $3284:
      Result := CIdeograph + #32 + 'Five';
    $3285:
      Result := CIdeograph + #32 + 'Six';
    $3286:
      Result := CIdeograph + #32 + 'Seven';
    $3287:
      Result := CIdeograph + #32 + 'Eight';
    $3288:
      Result := CIdeograph + #32 + 'Nine';
    $3289:
      Result := CIdeograph + #32 + 'Ten';
    $328A:
      Result := CIdeograph + #32 + 'Moon';
    $328B:
      Result := CIdeograph + #32 + 'Fire';
    $328C:
      Result := CIdeograph + #32 + 'Water';
    $328D:
      Result := CIdeograph + #32 + 'Wood';
    $328E:
      Result := CIdeograph + #32 + 'Metal';
    $328F:
      Result := CIdeograph + #32 + 'Earth';
    $3290:
      Result := CIdeograph + #32 + 'Sun';
    $3291:
      Result := CIdeograph + #32 + 'Stock';
    $3292:
      Result := CIdeograph + #32 + 'Have';
    $3293:
      Result := CIdeograph + #32 + 'Society';
    $3294:
      Result := CIdeograph + #32 + 'Name';
    $3295:
      Result := CIdeograph + #32 + 'Special';
    $3296:
      Result := CIdeograph + #32 + 'Financial';
    $3297:
      Result := CIdeograph + #32 + 'Congratulation';
    $3298:
      Result := CIdeograph + #32 + 'Labor';
    $3299:
      Result := CIdeograph + #32 + 'Secret';
    $329A:
      Result := CIdeograph + #32 + 'Male';
    $329B:
      Result := CIdeograph + #32 + 'Female';
    $329C:
      Result := CIdeograph + #32 + 'Suitable';
    $329D:
      Result := CIdeograph + #32 + 'Excellent';
    $329E:
      Result := CIdeograph + #32 + 'Print';
    $329F:
      Result := CIdeograph + #32 + 'Attention';
    $32A0:
      Result := CIdeograph + #32 + 'Item';
    $32A1:
      Result := CIdeograph + #32 + 'Rest';
    $32A2:
      Result := CIdeograph + #32 + 'Copy';
    $32A3:
      Result := CIdeograph + #32 + 'Correct';
    $32A4:
      Result := CIdeograph + #32 + 'High';
    $32A5:
      Result := CIdeograph + #32 + 'Centre';
    $32A6:
      Result := CIdeograph + #32 + 'Low';
    $32A7:
      Result := CIdeograph + #32 + CLeft;
    $32A8:
      Result := CIdeograph + #32 + CRight;
    $32A9:
      Result := CIdeograph + #32 + 'Medicine';
    $32AA:
      Result := CIdeograph + #32 + 'Religion';
    $32AB:
      Result := CIdeograph + #32 + 'Study';
    $32AC:
      Result := CIdeograph + #32 + 'Supervise';
    $32AD:
      Result := CIdeograph + #32 + 'Enterprise';
    $32AE:
      Result := CIdeograph + #32 + 'Resource';
    $32AF:
      Result := CIdeograph + #32 + 'Alliance';
    $32B0:
      Result := CIdeograph + #32 + 'Night';
    $32D0:
      Result := 'Katakana A';
    $32D1:
      Result := 'Katakana I';
    $32D2:
      Result := 'Katakana U';
    $32D3:
      Result := 'Katakana E';
    $32D4:
      Result := 'Katakana O';
    $32D5:
      Result := 'Katakana Ka';
    $32D6:
      Result := 'Katakana Ki';
    $32D7:
      Result := 'Katakana Ku';
    $32D8:
      Result := 'Katakana Ke';
    $32D9:
      Result := 'Katakana Ko';
    $32DA:
      Result := 'Katakana Sa';
    $32DB:
      Result := 'Katakana Si';
    $32DC:
      Result := 'Katakana Su';
    $32DD:
      Result := 'Katakana Se';
    $32DE:
      Result := 'Katakana So';
    $32DF:
      Result := 'Katakana Ta';
    $32E0:
      Result := 'Katakana Ti';
    $32E1:
      Result := 'Katakana Tu';
    $32E2:
      Result := 'Katakana Te';
    $32E3:
      Result := 'Katakana To';
    $32E4:
      Result := 'Katakana Na';
    $32E5:
      Result := 'Katakana Ni';
    $32E6:
      Result := 'Katakana Nu';
    $32E7:
      Result := 'Katakana Ne';
    $32E8:
      Result := 'Katakana No';
    $32E9:
      Result := 'Katakana Ha';
    $32EA:
      Result := 'Katakana Hi';
    $32EB:
      Result := 'Katakana Hu';
    $32EC:
      Result := 'Katakana He';
    $32ED:
      Result := 'Katakana Ho';
    $32EE:
      Result := 'Katakana Ma';
    $32EF:
      Result := 'Katakana Mi';
    $32F0:
      Result := 'Katakana Mu';
    $32F1:
      Result := 'Katakana Me';
    $32F2:
      Result := 'Katakana Mo';
    $32F3:
      Result := 'Katakana Ya';
    $32F4:
      Result := 'Katakana Yu';
    $32F5:
      Result := 'Katakana Yo';
    $32F6:
      Result := 'Katakana Ra';
    $32F7:
      Result := 'Katakana Ri';
    $32F8:
      Result := 'Katakana Ru';
    $32F9:
      Result := 'Katakana Re';
    $32FA:
      Result := 'Katakana Ro';
    $32FB:
      Result := 'Katakana Wa';
    $32FC:
      Result := 'Katakana Wi';
    $32FD:
      Result := 'Katakana We';
    $32FE:
      Result := 'Katakana Wo';
  end;

  // add 'Circled' to string
  if Result <> '' then
    Result := 'Circled' + #32 + Result;
end;

function GetIdeographicTelegraphSymbolUnicodeName(Value: Word): string;
begin
  case Value of
    $32C0:
      Result := 'January';
    $32C1:
      Result := 'February';
    $32C2:
      Result := 'March';
    $32C3:
      Result := 'April';
    $32C4:
      Result := 'May';
    $32C5:
      Result := 'June';
    $32C6:
      Result := 'July';
    $32C7:
      Result := 'August';
    $32C8:
      Result := 'September';
    $32C9:
      Result := 'October';
    $32CA:
      Result := 'November';
    $32CB:
      Result := 'December';
    $3358:
      Result := 'Hour Zero';
    $3359:
      Result := 'Hour One';
    $335A:
      Result := 'Hour Two';
    $335B:
      Result := 'Hour Three';
    $335C:
      Result := 'Hour Four';
    $335D:
      Result := 'Hour Five';
    $335E:
      Result := 'Hour Six';
    $335F:
      Result := 'Hour Seven';
    $3360:
      Result := 'Hour Eight';
    $3361:
      Result := 'Hour Nine';
    $3362:
      Result := 'Hour Ten';
    $3363:
      Result := 'Hour Eleven';
    $3364:
      Result := 'Hour Twelve';
    $3365:
      Result := 'Hour Thirteen';
    $3366:
      Result := 'Hour Fourteen';
    $3367:
      Result := 'Hour Fifteen';
    $3368:
      Result := 'Hour Sixteen';
    $3369:
      Result := 'Hour Seventeen';
    $336A:
      Result := 'Hour Eighteen';
    $336B:
      Result := 'Hour Nineteen';
    $336C:
      Result := 'Hour Twenty';
    $336D:
      Result := 'Hour Twenty-One';
    $336E:
      Result := 'Hour Twenty-Two';
    $336F:
      Result := 'Hour Twenty-Three';
    $3370:
      Result := 'Hour Twenty-Four';
    $33E0:
      Result := 'Day One';
    $33E1:
      Result := 'Day Two';
    $33E2:
      Result := 'Day Three';
    $33E3:
      Result := 'Day Four';
    $33E4:
      Result := 'Day Five';
    $33E5:
      Result := 'Day Six';
    $33E6:
      Result := 'Day Seven';
    $33E7:
      Result := 'Day Eight';
    $33E8:
      Result := 'Day Nine';
    $33E9:
      Result := 'Day Ten';
    $33EA:
      Result := 'Day Eleven';
    $33EB:
      Result := 'Day Twelve';
    $33EC:
      Result := 'Day Thirteen';
    $33ED:
      Result := 'Day Fourteen';
    $33EE:
      Result := 'Day Fifteen';
    $33EF:
      Result := 'Day Sixteen';
    $33F0:
      Result := 'Day Seventeen';
    $33F1:
      Result := 'Day Eighteen';
    $33F2:
      Result := 'Day Nineteen';
    $33F3:
      Result := 'Day Twenty';
    $33F4:
      Result := 'Day Twenty-One';
    $33F5:
      Result := 'Day Twenty-Two';
    $33F6:
      Result := 'Day Twenty-Three';
    $33F7:
      Result := 'Day Twenty-Four';
    $33F8:
      Result := 'Day Twenty-Five';
    $33F9:
      Result := 'Day Twenty-Six';
    $33FA:
      Result := 'Day Twenty-Seven';
    $33FB:
      Result := 'Day Twenty-Eight';
    $33FC:
      Result := 'Day Twenty-Nine';
    $33FD:
      Result := 'Day Thirty';
    $33FE:
      Result := 'Day Thirty-One';
  end;

  // add CIdeographic + #32 + 'Telegraph Symbol' to string
  if Result <> '' then
    Result := CIdeographic + #32 + 'Telegraph Symbol For' + #32 + Result;
end;

function GetCjkCompatibilityIdeographUnicodeName(Value: Word): string;
begin
  case Value of
    $F900:
      Result := 'F900';
    $F901:
      Result := 'F901';
    $F902:
      Result := 'F902';
    $F903:
      Result := 'F903';
    $F904:
      Result := 'F904';
    $F905:
      Result := 'F905';
    $F906:
      Result := 'F906';
    $F907:
      Result := 'F907';
    $F908:
      Result := 'F908';
    $F909:
      Result := 'F909';
    $F90A:
      Result := 'F90A';
    $F90B:
      Result := 'F90B';
    $F90C:
      Result := 'F90C';
    $F90D:
      Result := 'F90D';
    $F90E:
      Result := 'F90E';
    $F90F:
      Result := 'F90F';
    $F910:
      Result := 'F910';
    $F911:
      Result := 'F911';
    $F912:
      Result := 'F912';
    $F913:
      Result := 'F913';
    $F914:
      Result := 'F914';
    $F915:
      Result := 'F915';
    $F916:
      Result := 'F916';
    $F917:
      Result := 'F917';
    $F918:
      Result := 'F918';
    $F919:
      Result := 'F919';
    $F91A:
      Result := 'F91A';
    $F91B:
      Result := 'F91B';
    $F91C:
      Result := 'F91C';
    $F91D:
      Result := 'F91D';
    $F91E:
      Result := 'F91E';
    $F91F:
      Result := 'F91F';
    $F920:
      Result := 'F920';
    $F921:
      Result := 'F921';
    $F922:
      Result := 'F922';
    $F923:
      Result := 'F923';
    $F924:
      Result := 'F924';
    $F925:
      Result := 'F925';
    $F926:
      Result := 'F926';
    $F927:
      Result := 'F927';
    $F928:
      Result := 'F928';
    $F929:
      Result := 'F929';
    $F92A:
      Result := 'F92A';
    $F92B:
      Result := 'F92B';
    $F92C:
      Result := 'F92C';
    $F92D:
      Result := 'F92D';
    $F92E:
      Result := 'F92E';
    $F92F:
      Result := 'F92F';
    $F930:
      Result := 'F930';
    $F931:
      Result := 'F931';
    $F932:
      Result := 'F932';
    $F933:
      Result := 'F933';
    $F934:
      Result := 'F934';
    $F935:
      Result := 'F935';
    $F936:
      Result := 'F936';
    $F937:
      Result := 'F937';
    $F938:
      Result := 'F938';
    $F939:
      Result := 'F939';
    $F93A:
      Result := 'F93A';
    $F93B:
      Result := 'F93B';
    $F93C:
      Result := 'F93C';
    $F93D:
      Result := 'F93D';
    $F93E:
      Result := 'F93E';
    $F93F:
      Result := 'F93F';
    $F940:
      Result := 'F940';
    $F941:
      Result := 'F941';
    $F942:
      Result := 'F942';
    $F943:
      Result := 'F943';
    $F944:
      Result := 'F944';
    $F945:
      Result := 'F945';
    $F946:
      Result := 'F946';
    $F947:
      Result := 'F947';
    $F948:
      Result := 'F948';
    $F949:
      Result := 'F949';
    $F94A:
      Result := 'F94A';
    $F94B:
      Result := 'F94B';
    $F94C:
      Result := 'F94C';
    $F94D:
      Result := 'F94D';
    $F94E:
      Result := 'F94E';
    $F94F:
      Result := 'F94F';
    $F950:
      Result := 'F950';
    $F951:
      Result := 'F951';
    $F952:
      Result := 'F952';
    $F953:
      Result := 'F953';
    $F954:
      Result := 'F954';
    $F955:
      Result := 'F955';
    $F956:
      Result := 'F956';
    $F957:
      Result := 'F957';
    $F958:
      Result := 'F958';
    $F959:
      Result := 'F959';
    $F95A:
      Result := 'F95A';
    $F95B:
      Result := 'F95B';
    $F95C:
      Result := 'F95C';
    $F95D:
      Result := 'F95D';
    $F95E:
      Result := 'F95E';
    $F95F:
      Result := 'F95F';
    $F960:
      Result := 'F960';
    $F961:
      Result := 'F961';
    $F962:
      Result := 'F962';
    $F963:
      Result := 'F963';
    $F964:
      Result := 'F964';
    $F965:
      Result := 'F965';
    $F966:
      Result := 'F966';
    $F967:
      Result := 'F967';
    $F968:
      Result := 'F968';
    $F969:
      Result := 'F969';
    $F96A:
      Result := 'F96A';
    $F96B:
      Result := 'F96B';
    $F96C:
      Result := 'F96C';
    $F96D:
      Result := 'F96D';
    $F96E:
      Result := 'F96E';
    $F96F:
      Result := 'F96F';
    $F970:
      Result := 'F970';
    $F971:
      Result := 'F971';
    $F972:
      Result := 'F972';
    $F973:
      Result := 'F973';
    $F974:
      Result := 'F974';
    $F975:
      Result := 'F975';
    $F976:
      Result := 'F976';
    $F977:
      Result := 'F977';
    $F978:
      Result := 'F978';
    $F979:
      Result := 'F979';
    $F97A:
      Result := 'F97A';
    $F97B:
      Result := 'F97B';
    $F97C:
      Result := 'F97C';
    $F97D:
      Result := 'F97D';
    $F97E:
      Result := 'F97E';
    $F97F:
      Result := 'F97F';
    $F980:
      Result := 'F980';
    $F981:
      Result := 'F981';
    $F982:
      Result := 'F982';
    $F983:
      Result := 'F983';
    $F984:
      Result := 'F984';
    $F985:
      Result := 'F985';
    $F986:
      Result := 'F986';
    $F987:
      Result := 'F987';
    $F988:
      Result := 'F988';
    $F989:
      Result := 'F989';
    $F98A:
      Result := 'F98A';
    $F98B:
      Result := 'F98B';
    $F98C:
      Result := 'F98C';
    $F98D:
      Result := 'F98D';
    $F98E:
      Result := 'F98E';
    $F98F:
      Result := 'F98F';
    $F990:
      Result := 'F990';
    $F991:
      Result := 'F991';
    $F992:
      Result := 'F992';
    $F993:
      Result := 'F993';
    $F994:
      Result := 'F994';
    $F995:
      Result := 'F995';
    $F996:
      Result := 'F996';
    $F997:
      Result := 'F997';
    $F998:
      Result := 'F998';
    $F999:
      Result := 'F999';
    $F99A:
      Result := 'F99A';
    $F99B:
      Result := 'F99B';
    $F99C:
      Result := 'F99C';
    $F99D:
      Result := 'F99D';
    $F99E:
      Result := 'F99E';
    $F99F:
      Result := 'F99F';
    $F9A0:
      Result := 'F9A0';
    $F9A1:
      Result := 'F9A1';
    $F9A2:
      Result := 'F9A2';
    $F9A3:
      Result := 'F9A3';
    $F9A4:
      Result := 'F9A4';
    $F9A5:
      Result := 'F9A5';
    $F9A6:
      Result := 'F9A6';
    $F9A7:
      Result := 'F9A7';
    $F9A8:
      Result := 'F9A8';
    $F9A9:
      Result := 'F9A9';
    $F9AA:
      Result := 'F9AA';
    $F9AB:
      Result := 'F9AB';
    $F9AC:
      Result := 'F9AC';
    $F9AD:
      Result := 'F9AD';
    $F9AE:
      Result := 'F9AE';
    $F9AF:
      Result := 'F9AF';
    $F9B0:
      Result := 'F9B0';
    $F9B1:
      Result := 'F9B1';
    $F9B2:
      Result := 'F9B2';
    $F9B3:
      Result := 'F9B3';
    $F9B4:
      Result := 'F9B4';
    $F9B5:
      Result := 'F9B5';
    $F9B6:
      Result := 'F9B6';
    $F9B7:
      Result := 'F9B7';
    $F9B8:
      Result := 'F9B8';
    $F9B9:
      Result := 'F9B9';
    $F9BA:
      Result := 'F9BA';
    $F9BB:
      Result := 'F9BB';
    $F9BC:
      Result := 'F9BC';
    $F9BD:
      Result := 'F9BD';
    $F9BE:
      Result := 'F9BE';
    $F9BF:
      Result := 'F9BF';
    $F9C0:
      Result := 'F9C0';
    $F9C1:
      Result := 'F9C1';
    $F9C2:
      Result := 'F9C2';
    $F9C3:
      Result := 'F9C3';
    $F9C4:
      Result := 'F9C4';
    $F9C5:
      Result := 'F9C5';
    $F9C6:
      Result := 'F9C6';
    $F9C7:
      Result := 'F9C7';
    $F9C8:
      Result := 'F9C8';
    $F9C9:
      Result := 'F9C9';
    $F9CA:
      Result := 'F9CA';
    $F9CB:
      Result := 'F9CB';
    $F9CC:
      Result := 'F9CC';
    $F9CD:
      Result := 'F9CD';
    $F9CE:
      Result := 'F9CE';
    $F9CF:
      Result := 'F9CF';
    $F9D0:
      Result := 'F9D0';
    $F9D1:
      Result := 'F9D1';
    $F9D2:
      Result := 'F9D2';
    $F9D3:
      Result := 'F9D3';
    $F9D4:
      Result := 'F9D4';
    $F9D5:
      Result := 'F9D5';
    $F9D6:
      Result := 'F9D6';
    $F9D7:
      Result := 'F9D7';
    $F9D8:
      Result := 'F9D8';
    $F9D9:
      Result := 'F9D9';
    $F9DA:
      Result := 'F9DA';
    $F9DB:
      Result := 'F9DB';
    $F9DC:
      Result := 'F9DC';
    $F9DD:
      Result := 'F9DD';
    $F9DE:
      Result := 'F9DE';
    $F9DF:
      Result := 'F9DF';
    $F9E0:
      Result := 'F9E0';
    $F9E1:
      Result := 'F9E1';
    $F9E2:
      Result := 'F9E2';
    $F9E3:
      Result := 'F9E3';
    $F9E4:
      Result := 'F9E4';
    $F9E5:
      Result := 'F9E5';
    $F9E6:
      Result := 'F9E6';
    $F9E7:
      Result := 'F9E7';
    $F9E8:
      Result := 'F9E8';
    $F9E9:
      Result := 'F9E9';
    $F9EA:
      Result := 'F9EA';
    $F9EB:
      Result := 'F9EB';
    $F9EC:
      Result := 'F9EC';
    $F9ED:
      Result := 'F9ED';
    $F9EE:
      Result := 'F9EE';
    $F9EF:
      Result := 'F9EF';
    $F9F0:
      Result := 'F9F0';
    $F9F1:
      Result := 'F9F1';
    $F9F2:
      Result := 'F9F2';
    $F9F3:
      Result := 'F9F3';
    $F9F4:
      Result := 'F9F4';
    $F9F5:
      Result := 'F9F5';
    $F9F6:
      Result := 'F9F6';
    $F9F7:
      Result := 'F9F7';
    $F9F8:
      Result := 'F9F8';
    $F9F9:
      Result := 'F9F9';
    $F9FA:
      Result := 'F9FA';
    $F9FB:
      Result := 'F9FB';
    $F9FC:
      Result := 'F9FC';
    $F9FD:
      Result := 'F9FD';
    $F9FE:
      Result := 'F9FE';
    $F9FF:
      Result := 'F9FF';
    $FA00:
      Result := 'FA00';
    $FA01:
      Result := 'FA01';
    $FA02:
      Result := 'FA02';
    $FA03:
      Result := 'FA03';
    $FA04:
      Result := 'FA04';
    $FA05:
      Result := 'FA05';
    $FA06:
      Result := 'FA06';
    $FA07:
      Result := 'FA07';
    $FA08:
      Result := 'FA08';
    $FA09:
      Result := 'FA09';
    $FA0A:
      Result := 'FA0A';
    $FA0B:
      Result := 'FA0B';
    $FA0C:
      Result := 'FA0C';
    $FA0D:
      Result := 'FA0D';
    $FA0E:
      Result := 'FA0E';
    $FA0F:
      Result := 'FA0F';
    $FA10:
      Result := 'FA10';
    $FA11:
      Result := 'FA11';
    $FA12:
      Result := 'FA12';
    $FA13:
      Result := 'FA13';
    $FA14:
      Result := 'FA14';
    $FA15:
      Result := 'FA15';
    $FA16:
      Result := 'FA16';
    $FA17:
      Result := 'FA17';
    $FA18:
      Result := 'FA18';
    $FA19:
      Result := 'FA19';
    $FA1A:
      Result := 'FA1A';
    $FA1B:
      Result := 'FA1B';
    $FA1C:
      Result := 'FA1C';
    $FA1D:
      Result := 'FA1D';
    $FA1E:
      Result := 'FA1E';
    $FA1F:
      Result := 'FA1F';
    $FA20:
      Result := 'FA20';
    $FA21:
      Result := 'FA21';
    $FA22:
      Result := 'FA22';
    $FA23:
      Result := 'FA23';
    $FA24:
      Result := 'FA24';
    $FA25:
      Result := 'FA25';
    $FA26:
      Result := 'FA26';
    $FA27:
      Result := 'FA27';
    $FA28:
      Result := 'FA28';
    $FA29:
      Result := 'FA29';
    $FA2A:
      Result := 'FA2A';
    $FA2B:
      Result := 'FA2B';
    $FA2C:
      Result := 'FA2C';
    $FA2D:
      Result := 'FA2D';
  end;

  // add 'CJK Compatibility Ideograph' to string
  if Result <> '' then
    Result := 'CJK Compatibility Ideograph' + '-' + Result;
end;

function GetModifierUnicodeName(Value: Word): string;
begin
  case Value of
    $02B0:
      Result := CLetter + #32 + CSmall + #32 + 'H';
    $02B1:
      Result := CLetter + #32 + CSmall + #32 + 'H' + #32 + CWith + #32 + 'Hook';
    $02B2:
      Result := CLetter + #32 + CSmall + #32 + 'J';
    $02B3:
      Result := CLetter + #32 + CSmall + #32 + 'R';
    $02B4:
      Result := CLetter + #32 + CSmall + #32 + CTurned + #32 + 'R';
    $02B5:
      Result := CLetter + #32 + CSmall + #32 + CTurned + #32 + 'R' + #32 + CWith
        + #32 + 'Hook';
    $02B6:
      Result := CLetter + #32 + CSmall + #32 + CCapital + #32 + 'INVERTED R';
    $02B7:
      Result := CLetter + #32 + CSmall + #32 + 'W';
    $02B8:
      Result := CLetter + #32 + CSmall + #32 + 'Y';
    $02B9:
      Result := CLetter + #32 + 'Prime';
    $02BA:
      Result := CLetter + #32 + 'Double Prime';
    $02BB:
      Result := CLetter + #32 + CTurned + #32 + 'Comma';
    $02BC:
      Result := CLetter + #32 + 'Apostrophe';
    $02BD:
      Result := CLetter + #32 + 'Reversed Comma';
    $02BE:
      Result := CLetter + #32 + CRight + #32 + 'Half Ring';
    $02BF:
      Result := CLetter + #32 + CLeft + #32 + 'Half Ring';
    $02C0:
      Result := CLetter + #32 + 'Glottal Stop';
    $02C1:
      Result := CLetter + #32 + 'Reversed Glottal Stop';
    $02C2:
      Result := CLetter + #32 + CLeft + #32 + 'Arrowhead';
    $02C3:
      Result := CLetter + #32 + CRight + #32 + 'Arrowhead';
    $02C4:
      Result := CLetter + #32 + CUp + #32 + 'Arrowhead';
    $02C5:
      Result := CLetter + #32 + CDown + #32 + 'Arrowhead';
    $02C6:
      Result := CLetter + #32 + CCircumflex + #32 + 'Accent';
    $02C8:
      Result := CLetter + #32 + 'Vertical Line';
    $02C9:
      Result := CLetter + #32 + 'Macron';
    $02CA:
      Result := CLetter + #32 + 'Acute Accent';
    $02CB:
      Result := CLetter + #32 + 'Grave Accent';
    $02CC:
      Result := CLetter + #32 + 'Low Vertical Line';
    $02CD:
      Result := CLetter + #32 + 'Low Macron';
    $02CE:
      Result := CLetter + #32 + 'Low Grave Accent';
    $02CF:
      Result := CLetter + #32 + 'Low Acute Accent';
    $02D0:
      Result := CLetter + #32 + 'Triangular Colon';
    $02D1:
      Result := CLetter + #32 + 'Half Triangular Colon';
    $02D2:
      Result := CLetter + #32 + 'Centred' + #32 + CRight + #32 + 'Half Ring';
    $02D3:
      Result := CLetter + #32 + 'Centred' + #32 + CLeft + #32 + 'Half Ring';
    $02D4:
      Result := CLetter + #32 + CUp + #32 + 'Tack';
    $02D5:
      Result := CLetter + #32 + CDown + #32 + 'Tack';
    $02D6:
      Result := CLetter + #32 + 'Plus Sign';
    $02D7:
      Result := CLetter + #32 + 'Minus Sign';
    $02DE:
      Result := CLetter + #32 + 'Rhotic Hook';
    $02E0:
      Result := CLetter + #32 + CSmall + #32 + CGamma;
    $02E1:
      Result := CLetter + #32 + CSmall + #32 + 'L';
    $02E2:
      Result := CLetter + #32 + CSmall + #32 + 'S';
    $02E3:
      Result := CLetter + #32 + CSmall + #32 + 'X';
    $02E4:
      Result := CLetter + #32 + CSmall + #32 + 'Reversed Glottal Stop';
    $02E5:
      Result := CLetter + #32 + 'Extra-High Tone Bar';
    $02E6:
      Result := CLetter + #32 + 'High Tone Bar';
    $02E7:
      Result := CLetter + #32 + 'Mid Tone Bar';
    $02E8:
      Result := CLetter + #32 + 'Low Tone Bar';
    $02E9:
      Result := CLetter + #32 + 'Extra-Low Tone Bar';
  end;

  // add 'Modifier' to string
  if Result <> '' then
    Result := 'Modifier' + #32 + Result;
end;

function GetCopticUnicodeName(Value: Word): string;
begin
  case Value of
    $03E2:
      Result := CCapital + #32 + CLetter + #32 + 'Shei';
    $03E3:
      Result := CSmall + #32 + CLetter + #32 + 'Shei';
    $03E4:
      Result := CCapital + #32 + CLetter + #32 + 'Fei';
    $03E5:
      Result := CSmall + #32 + CLetter + #32 + 'Fei';
    $03E6:
      Result := CCapital + #32 + CLetter + #32 + 'Khei';
    $03E7:
      Result := CSmall + #32 + CLetter + #32 + 'Khei';
    $03E8:
      Result := CCapital + #32 + CLetter + #32 + 'Hori';
    $03E9:
      Result := CSmall + #32 + CLetter + #32 + 'Hori';
    $03EA:
      Result := CCapital + #32 + CLetter + #32 + 'Gangia';
    $03EB:
      Result := CSmall + #32 + CLetter + #32 + 'Gangia';
    $03EC:
      Result := CCapital + #32 + CLetter + #32 + 'Shima';
    $03ED:
      Result := CSmall + #32 + CLetter + #32 + 'Shima';
    $03EE:
      Result := CCapital + #32 + CLetter + #32 + 'Dei';
    $03EF:
      Result := CSmall + #32 + CLetter + #32 + 'Dei';
  end;

  // add 'Coptic' to string
  if Result <> '' then
    Result := 'Coptic' + #32 + Result;
end;

function GetArabicIndicDigitUnicodeName(Value: Word): string;
begin
  case Value of
    $0660:
      Result := 'Zero';
    $0661:
      Result := 'One';
    $0662:
      Result := 'Two';
    $0663:
      Result := 'Three';
    $0664:
      Result := 'Four';
    $0665:
      Result := 'Five';
    $0666:
      Result := 'Six';
    $0667:
      Result := 'Seven';
    $0668:
      Result := 'Eight';
    $0669:
      Result := 'Nine';
  end;

  // add 'Arabic-Indic Digit' to string
  if Result <> '' then
    Result := 'Arabic-Indic Digit' + #32 + Result;
end;

function GetExtendedArabicIndicDigitUnicodeName(Value: Word): string;
begin
  case Value of
    $06F0:
      Result := 'Zero';
    $06F1:
      Result := 'One';
    $06F2:
      Result := 'Two';
    $06F3:
      Result := 'Three';
    $06F4:
      Result := 'Four';
    $06F5:
      Result := 'Five';
    $06F6:
      Result := 'Six';
    $06F7:
      Result := 'Seven';
    $06F8:
      Result := 'Eight';
    $06F9:
      Result := 'Nine';
  end;

  // add 'Extended Arabic-Indic Digit' to string
  if Result <> '' then
    Result := 'Extended Arabic-Indic Digit' + #32 + Result;
end;

function GetGurmukhiUnicodeName(Value: Word): string;
begin
  case Value of
    $0A02:
      Result := CSign + #32 + 'Bindi';
    $0A05:
      Result := CLetter + #32 + 'A';
    $0A06:
      Result := CLetter + #32 + 'Aa';
    $0A07:
      Result := CLetter + #32 + 'I';
    $0A08:
      Result := CLetter + #32 + 'Ii';
    $0A09:
      Result := CLetter + #32 + 'U';
    $0A0A:
      Result := CLetter + #32 + 'Uu';
    $0A0F:
      Result := CLetter + #32 + 'Ee';
    $0A10:
      Result := CLetter + #32 + 'Ai';
    $0A13:
      Result := CLetter + #32 + 'Oo';
    $0A14:
      Result := CLetter + #32 + 'Au';
    $0A15:
      Result := CLetter + #32 + 'Ka';
    $0A16:
      Result := CLetter + #32 + 'Kha';
    $0A17:
      Result := CLetter + #32 + 'Ga';
    $0A18:
      Result := CLetter + #32 + 'Gha';
    $0A19:
      Result := CLetter + #32 + 'Nga';
    $0A1A:
      Result := CLetter + #32 + 'Ca';
    $0A1B:
      Result := CLetter + #32 + 'Cha';
    $0A1C:
      Result := CLetter + #32 + 'Ja';
    $0A1D:
      Result := CLetter + #32 + 'Jha';
    $0A1E:
      Result := CLetter + #32 + 'Nya';
    $0A1F:
      Result := CLetter + #32 + 'Tta';
    $0A20:
      Result := CLetter + #32 + 'Ttha';
    $0A21:
      Result := CLetter + #32 + 'Dda';
    $0A22:
      Result := CLetter + #32 + 'Ddha';
    $0A23:
      Result := CLetter + #32 + 'Nna';
    $0A24:
      Result := CLetter + #32 + 'Ta';
    $0A25:
      Result := CLetter + #32 + 'Tha';
    $0A26:
      Result := CLetter + #32 + 'Da';
    $0A27:
      Result := CLetter + #32 + 'Dha';
    $0A28:
      Result := CLetter + #32 + 'Na';
    $0A2A:
      Result := CLetter + #32 + 'Pa';
    $0A2B:
      Result := CLetter + #32 + 'Pha';
    $0A2C:
      Result := CLetter + #32 + 'Ba';
    $0A2D:
      Result := CLetter + #32 + 'Bha';
    $0A2E:
      Result := CLetter + #32 + 'Ma';
    $0A2F:
      Result := CLetter + #32 + 'Ya';
    $0A30:
      Result := CLetter + #32 + 'Ra';
    $0A32:
      Result := CLetter + #32 + 'La';
    $0A33:
      Result := CLetter + #32 + 'Lla';
    $0A35:
      Result := CLetter + #32 + 'Va';
    $0A36:
      Result := CLetter + #32 + 'Sha';
    $0A38:
      Result := CLetter + #32 + 'Sa';
    $0A39:
      Result := CLetter + #32 + 'Ha';
    $0A3C:
      Result := CSign + #32 + 'Nukta';
    $0A3E:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0A3F:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0A40:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0A41:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0A42:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0A47:
      Result := CVowel + #32 + CSign + #32 + 'Ee';
    $0A48:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0A4B:
      Result := CVowel + #32 + CSign + #32 + 'Oo';
    $0A4C:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0A4D:
      Result := CSign + #32 + 'Virama';
    $0A59:
      Result := CLetter + #32 + 'Khha';
    $0A5A:
      Result := CLetter + #32 + 'Ghha';
    $0A5B:
      Result := CLetter + #32 + 'Za';
    $0A5C:
      Result := CLetter + #32 + 'Rra';
    $0A5E:
      Result := CLetter + #32 + 'Fa';
    $0A66:
      Result := CDigit + #32 + 'Zero';
    $0A67:
      Result := CDigit + #32 + 'One';
    $0A68:
      Result := CDigit + #32 + 'Two';
    $0A69:
      Result := CDigit + #32 + 'Three';
    $0A6A:
      Result := CDigit + #32 + 'Four';
    $0A6B:
      Result := CDigit + #32 + 'Five';
    $0A6C:
      Result := CDigit + #32 + 'Six';
    $0A6D:
      Result := CDigit + #32 + 'Seven';
    $0A6E:
      Result := CDigit + #32 + 'Eight';
    $0A6F:
      Result := CDigit + #32 + 'Nine';
    $0A70:
      Result := 'Tippi';
    $0A71:
      Result := 'Addak';
    $0A72:
      Result := 'Iri';
    $0A73:
      Result := 'Ura';
    $0A74:
      Result := 'Ek Onkar';
  end;

  // add 'Gurmukhi' to string
  if Result <> '' then
    Result := 'Gurmukhi' + #32 + Result;
end;

function GetOriyaUnicodeName(Value: Word): string;
begin
  case Value of
    $0B01:
      Result := CSign + #32 + 'Candrabindu';
    $0B02:
      Result := CSign + #32 + 'Anusvara';
    $0B03:
      Result := CSign + #32 + 'Visarga';
    $0B05:
      Result := CLetter + #32 + 'A';
    $0B06:
      Result := CLetter + #32 + 'Aa';
    $0B07:
      Result := CLetter + #32 + 'I';
    $0B08:
      Result := CLetter + #32 + 'Ii';
    $0B09:
      Result := CLetter + #32 + 'U';
    $0B0A:
      Result := CLetter + #32 + 'Uu';
    $0B0B:
      Result := CLetter + #32 + 'Vocalic R';
    $0B0C:
      Result := CLetter + #32 + 'Vocalic L';
    $0B0F:
      Result := CLetter + #32 + 'E';
    $0B10:
      Result := CLetter + #32 + 'Ai';
    $0B13:
      Result := CLetter + #32 + 'O';
    $0B14:
      Result := CLetter + #32 + 'Au';
    $0B15:
      Result := CLetter + #32 + 'Ka';
    $0B16:
      Result := CLetter + #32 + 'Kha';
    $0B17:
      Result := CLetter + #32 + 'Ga';
    $0B18:
      Result := CLetter + #32 + 'Gha';
    $0B19:
      Result := CLetter + #32 + 'Nga';
    $0B1A:
      Result := CLetter + #32 + 'Ca';
    $0B1B:
      Result := CLetter + #32 + 'Cha';
    $0B1C:
      Result := CLetter + #32 + 'Ja';
    $0B1D:
      Result := CLetter + #32 + 'Jha';
    $0B1E:
      Result := CLetter + #32 + 'Nya';
    $0B1F:
      Result := CLetter + #32 + 'Tta';
    $0B20:
      Result := CLetter + #32 + 'Ttha';
    $0B21:
      Result := CLetter + #32 + 'Dda';
    $0B22:
      Result := CLetter + #32 + 'Ddha';
    $0B23:
      Result := CLetter + #32 + 'Nna';
    $0B24:
      Result := CLetter + #32 + 'Ta';
    $0B25:
      Result := CLetter + #32 + 'Tha';
    $0B26:
      Result := CLetter + #32 + 'Da';
    $0B27:
      Result := CLetter + #32 + 'Dha';
    $0B28:
      Result := CLetter + #32 + 'Na';
    $0B2A:
      Result := CLetter + #32 + 'Pa';
    $0B2B:
      Result := CLetter + #32 + 'Pha';
    $0B2C:
      Result := CLetter + #32 + 'Ba';
    $0B2D:
      Result := CLetter + #32 + 'Bha';
    $0B2E:
      Result := CLetter + #32 + 'Ma';
    $0B2F:
      Result := CLetter + #32 + 'Ya';
    $0B30:
      Result := CLetter + #32 + 'Ra';
    $0B32:
      Result := CLetter + #32 + 'La';
    $0B33:
      Result := CLetter + #32 + 'Lla';
    $0B36:
      Result := CLetter + #32 + 'Sha';
    $0B37:
      Result := CLetter + #32 + 'Ssa';
    $0B38:
      Result := CLetter + #32 + 'Sa';
    $0B39:
      Result := CLetter + #32 + 'Ha';
    $0B3C:
      Result := CSign + #32 + 'Nukta';
    $0B3D:
      Result := CSign + #32 + 'Avagraha';
    $0B3E:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0B3F:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0B40:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0B41:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0B42:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0B43:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $0B47:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0B48:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0B4B:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $0B4C:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0B4D:
      Result := CSign + #32 + 'Virama';
    $0B56:
      Result := 'Ai Length Mark';
    $0B57:
      Result := 'Au Length Mark';
    $0B5C:
      Result := CLetter + #32 + 'Rra';
    $0B5D:
      Result := CLetter + #32 + 'Rha';
    $0B5F:
      Result := CLetter + #32 + 'Yya';
    $0B60:
      Result := CLetter + #32 + 'Vocalic Rr';
    $0B61:
      Result := CLetter + #32 + 'Vocalic Ll';
    $0B66:
      Result := CDigit + #32 + 'Zero';
    $0B67:
      Result := CDigit + #32 + 'One';
    $0B68:
      Result := CDigit + #32 + 'Two';
    $0B69:
      Result := CDigit + #32 + 'Three';
    $0B6A:
      Result := CDigit + #32 + 'Four';
    $0B6B:
      Result := CDigit + #32 + 'Five';
    $0B6C:
      Result := CDigit + #32 + 'Six';
    $0B6D:
      Result := CDigit + #32 + 'Seven';
    $0B6E:
      Result := CDigit + #32 + 'Eight';
    $0B6F:
      Result := CDigit + #32 + 'Nine';
    $0B70:
      Result := 'Isshar';
  end;

  // add 'Oriya' to string
  if Result <> '' then
    Result := 'Oriya' + #32 + Result;
end;

function GetTamilUnicodeName(Value: Word): string;
begin
  case Value of
    $0B82:
      Result := CSign + #32 + 'Anusvara';
    $0B83:
      Result := CSign + #32 + 'Visarga';
    $0B85:
      Result := CLetter + #32 + 'A';
    $0B86:
      Result := CLetter + #32 + 'Aa';
    $0B87:
      Result := CLetter + #32 + 'I';
    $0B88:
      Result := CLetter + #32 + 'Ii';
    $0B89:
      Result := CLetter + #32 + 'U';
    $0B8A:
      Result := CLetter + #32 + 'Uu';
    $0B8E:
      Result := CLetter + #32 + 'E';
    $0B8F:
      Result := CLetter + #32 + 'Ee';
    $0B90:
      Result := CLetter + #32 + 'Ai';
    $0B92:
      Result := CLetter + #32 + 'O';
    $0B93:
      Result := CLetter + #32 + 'Oo';
    $0B94:
      Result := CLetter + #32 + 'Au';
    $0B95:
      Result := CLetter + #32 + 'Ka';
    $0B99:
      Result := CLetter + #32 + 'Nga';
    $0B9A:
      Result := CLetter + #32 + 'Ca';
    $0B9C:
      Result := CLetter + #32 + 'Ja';
    $0B9E:
      Result := CLetter + #32 + 'Nya';
    $0B9F:
      Result := CLetter + #32 + 'Tta';
    $0BA3:
      Result := CLetter + #32 + 'Nna';
    $0BA4:
      Result := CLetter + #32 + 'Ta';
    $0BA8:
      Result := CLetter + #32 + 'Na';
    $0BA9:
      Result := CLetter + #32 + 'Nnna';
    $0BAA:
      Result := CLetter + #32 + 'Pa';
    $0BAE:
      Result := CLetter + #32 + 'Ma';
    $0BAF:
      Result := CLetter + #32 + 'Ya';
    $0BB0:
      Result := CLetter + #32 + 'Ra';
    $0BB1:
      Result := CLetter + #32 + 'Rra';
    $0BB2:
      Result := CLetter + #32 + 'La';
    $0BB3:
      Result := CLetter + #32 + 'Lla';
    $0BB4:
      Result := CLetter + #32 + 'Llla';
    $0BB5:
      Result := CLetter + #32 + 'Va';
    $0BB7:
      Result := CLetter + #32 + 'Ssa';
    $0BB8:
      Result := CLetter + #32 + 'Sa';
    $0BB9:
      Result := CLetter + #32 + 'Ha';
    $0BBE:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0BBF:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0BC0:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0BC1:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0BC2:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0BC6:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0BC7:
      Result := CVowel + #32 + CSign + #32 + 'Ee';
    $0BC8:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0BCA:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $0BCB:
      Result := CVowel + #32 + CSign + #32 + 'Oo';
    $0BCC:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0BCD:
      Result := CSign + #32 + 'Virama';
    $0BD7:
      Result := 'Au Length Mark';
    $0BE7:
      Result := CDigit + #32 + 'One';
    $0BE8:
      Result := CDigit + #32 + 'Two';
    $0BE9:
      Result := CDigit + #32 + 'Three';
    $0BEA:
      Result := CDigit + #32 + 'Four';
    $0BEB:
      Result := CDigit + #32 + 'Five';
    $0BEC:
      Result := CDigit + #32 + 'Six';
    $0BED:
      Result := CDigit + #32 + 'Seven';
    $0BEE:
      Result := CDigit + #32 + 'Eight';
    $0BEF:
      Result := CDigit + #32 + 'Nine';
    $0BF0:
      Result := CNumber + #32 + 'Ten';
    $0BF1:
      Result := CNumber + #32 + 'One Hundred';
    $0BF2:
      Result := CNumber + #32 + 'One Thousand';
  end;

  // add 'Tamil' to string
  if Result <> '' then
    Result := 'Tamil' + #32 + Result;
end;

function GetTeluguUnicodeName(Value: Word): string;
begin
  case Value of
    $0C01:
      Result := CSign + #32 + 'Candrabindu';
    $0C02:
      Result := CSign + #32 + 'Anusvara';
    $0C03:
      Result := CSign + #32 + 'Visarga';
    $0C05:
      Result := CLetter + #32 + 'A';
    $0C06:
      Result := CLetter + #32 + 'Aa';
    $0C07:
      Result := CLetter + #32 + 'I';
    $0C08:
      Result := CLetter + #32 + 'Ii';
    $0C09:
      Result := CLetter + #32 + 'U';
    $0C0A:
      Result := CLetter + #32 + 'Uu';
    $0C0B:
      Result := CLetter + #32 + 'Vocalic R';
    $0C0C:
      Result := CLetter + #32 + 'Vocalic L';
    $0C0E:
      Result := CLetter + #32 + 'E';
    $0C0F:
      Result := CLetter + #32 + 'Ee';
    $0C10:
      Result := CLetter + #32 + 'Ai';
    $0C12:
      Result := CLetter + #32 + 'O';
    $0C13:
      Result := CLetter + #32 + 'Oo';
    $0C14:
      Result := CLetter + #32 + 'Au';
    $0C15:
      Result := CLetter + #32 + 'Ka';
    $0C16:
      Result := CLetter + #32 + 'Kha';
    $0C17:
      Result := CLetter + #32 + 'Ga';
    $0C18:
      Result := CLetter + #32 + 'Gha';
    $0C19:
      Result := CLetter + #32 + 'Nga';
    $0C1A:
      Result := CLetter + #32 + 'Ca';
    $0C1B:
      Result := CLetter + #32 + 'Cha';
    $0C1C:
      Result := CLetter + #32 + 'Ja';
    $0C1D:
      Result := CLetter + #32 + 'Jha';
    $0C1E:
      Result := CLetter + #32 + 'Nya';
    $0C1F:
      Result := CLetter + #32 + 'Tta';
    $0C20:
      Result := CLetter + #32 + 'Ttha';
    $0C21:
      Result := CLetter + #32 + 'Dda';
    $0C22:
      Result := CLetter + #32 + 'Ddha';
    $0C23:
      Result := CLetter + #32 + 'Nna';
    $0C24:
      Result := CLetter + #32 + 'Ta';
    $0C25:
      Result := CLetter + #32 + 'Tha';
    $0C26:
      Result := CLetter + #32 + 'Da';
    $0C27:
      Result := CLetter + #32 + 'Dha';
    $0C28:
      Result := CLetter + #32 + 'Na';
    $0C2A:
      Result := CLetter + #32 + 'Pa';
    $0C2B:
      Result := CLetter + #32 + 'Pha';
    $0C2C:
      Result := CLetter + #32 + 'Ba';
    $0C2D:
      Result := CLetter + #32 + 'Bha';
    $0C2E:
      Result := CLetter + #32 + 'Ma';
    $0C2F:
      Result := CLetter + #32 + 'Ya';
    $0C30:
      Result := CLetter + #32 + 'Ra';
    $0C31:
      Result := CLetter + #32 + 'Rra';
    $0C32:
      Result := CLetter + #32 + 'La';
    $0C33:
      Result := CLetter + #32 + 'Lla';
    $0C35:
      Result := CLetter + #32 + 'Va';
    $0C36:
      Result := CLetter + #32 + 'Sha';
    $0C37:
      Result := CLetter + #32 + 'Ssa';
    $0C38:
      Result := CLetter + #32 + 'Sa';
    $0C39:
      Result := CLetter + #32 + 'Ha';
    $0C3E:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0C3F:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0C40:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0C41:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0C42:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0C43:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $0C44:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Rr';
    $0C46:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0C47:
      Result := CVowel + #32 + CSign + #32 + 'Ee';
    $0C48:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0C4A:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $0C4B:
      Result := CVowel + #32 + CSign + #32 + 'Oo';
    $0C4C:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0C4D:
      Result := CSign + #32 + 'Virama';
    $0C55:
      Result := 'Length Mark';
    $0C56:
      Result := 'Ai Length Mark';
    $0C60:
      Result := CLetter + #32 + 'Vocalic Rr';
    $0C61:
      Result := CLetter + #32 + 'Vocalic Ll';
    $0C66:
      Result := CDigit + #32 + 'Zero';
    $0C67:
      Result := CDigit + #32 + 'One';
    $0C68:
      Result := CDigit + #32 + 'Two';
    $0C69:
      Result := CDigit + #32 + 'Three';
    $0C6A:
      Result := CDigit + #32 + 'Four';
    $0C6B:
      Result := CDigit + #32 + 'Five';
    $0C6C:
      Result := CDigit + #32 + 'Six';
    $0C6D:
      Result := CDigit + #32 + 'Seven';
    $0C6E:
      Result := CDigit + #32 + 'Eight';
    $0C6F:
      Result := CDigit + #32 + 'Nine';
  end;

  // add 'Telugu' to string
  if Result <> '' then
    Result := 'Telugu' + #32 + Result;
end;

function GetKannadaUnicodeName(Value: Word): string;
begin
  case Value of
    $0C82:
      Result := CSign + #32 + 'Anusvara';
    $0C83:
      Result := CSign + #32 + 'Visarga';
    $0C85:
      Result := CLetter + #32 + 'A';
    $0C86:
      Result := CLetter + #32 + 'Aa';
    $0C87:
      Result := CLetter + #32 + 'I';
    $0C88:
      Result := CLetter + #32 + 'Ii';
    $0C89:
      Result := CLetter + #32 + 'U';
    $0C8A:
      Result := CLetter + #32 + 'Uu';
    $0C8B:
      Result := CLetter + #32 + 'Vocalic R';
    $0C8C:
      Result := CLetter + #32 + 'Vocalic L';
    $0C8E:
      Result := CLetter + #32 + 'E';
    $0C8F:
      Result := CLetter + #32 + 'Ee';
    $0C90:
      Result := CLetter + #32 + 'Ai';
    $0C92:
      Result := CLetter + #32 + 'O';
    $0C93:
      Result := CLetter + #32 + 'Oo';
    $0C94:
      Result := CLetter + #32 + 'Au';
    $0C95:
      Result := CLetter + #32 + 'Ka';
    $0C96:
      Result := CLetter + #32 + 'Kha';
    $0C97:
      Result := CLetter + #32 + 'Ga';
    $0C98:
      Result := CLetter + #32 + 'Gha';
    $0C99:
      Result := CLetter + #32 + 'Nga';
    $0C9A:
      Result := CLetter + #32 + 'Ca';
    $0C9B:
      Result := CLetter + #32 + 'Cha';
    $0C9C:
      Result := CLetter + #32 + 'Ja';
    $0C9D:
      Result := CLetter + #32 + 'Jha';
    $0C9E:
      Result := CLetter + #32 + 'Nya';
    $0C9F:
      Result := CLetter + #32 + 'Tta';
    $0CA0:
      Result := CLetter + #32 + 'Ttha';
    $0CA1:
      Result := CLetter + #32 + 'Dda';
    $0CA2:
      Result := CLetter + #32 + 'Ddha';
    $0CA3:
      Result := CLetter + #32 + 'Nna';
    $0CA4:
      Result := CLetter + #32 + 'Ta';
    $0CA5:
      Result := CLetter + #32 + 'Tha';
    $0CA6:
      Result := CLetter + #32 + 'Da';
    $0CA7:
      Result := CLetter + #32 + 'Dha';
    $0CA8:
      Result := CLetter + #32 + 'Na';
    $0CAA:
      Result := CLetter + #32 + 'Pa';
    $0CAB:
      Result := CLetter + #32 + 'Pha';
    $0CAC:
      Result := CLetter + #32 + 'Ba';
    $0CAD:
      Result := CLetter + #32 + 'Bha';
    $0CAE:
      Result := CLetter + #32 + 'Ma';
    $0CAF:
      Result := CLetter + #32 + 'Ya';
    $0CB0:
      Result := CLetter + #32 + 'Ra';
    $0CB1:
      Result := CLetter + #32 + 'Rra';
    $0CB2:
      Result := CLetter + #32 + 'La';
    $0CB3:
      Result := CLetter + #32 + 'Lla';
    $0CB5:
      Result := CLetter + #32 + 'Va';
    $0CB6:
      Result := CLetter + #32 + 'Sha';
    $0CB7:
      Result := CLetter + #32 + 'Ssa';
    $0CB8:
      Result := CLetter + #32 + 'Sa';
    $0CB9:
      Result := CLetter + #32 + 'Ha';
    $0CBE:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0CBF:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0CC0:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0CC1:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0CC2:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0CC3:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $0CC4:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Rr';
    $0CC6:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0CC7:
      Result := CVowel + #32 + CSign + #32 + 'Ee';
    $0CC8:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0CCA:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $0CCB:
      Result := CVowel + #32 + CSign + #32 + 'Oo';
    $0CCC:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0CCD:
      Result := CSign + #32 + 'Virama';
    $0CD5:
      Result := 'Length Mark';
    $0CD6:
      Result := 'Ai Length Mark';
    $0CDE:
      Result := CLetter + #32 + 'Fa';
    $0CE0:
      Result := CLetter + #32 + 'Vocalic Rr';
    $0CE1:
      Result := CLetter + #32 + 'Vocalic Ll';
    $0CE6:
      Result := CDigit + #32 + 'Zero';
    $0CE7:
      Result := CDigit + #32 + 'One';
    $0CE8:
      Result := CDigit + #32 + 'Two';
    $0CE9:
      Result := CDigit + #32 + 'Three';
    $0CEA:
      Result := CDigit + #32 + 'Four';
    $0CEB:
      Result := CDigit + #32 + 'Five';
    $0CEC:
      Result := CDigit + #32 + 'Six';
    $0CED:
      Result := CDigit + #32 + 'Seven';
    $0CEE:
      Result := CDigit + #32 + 'Eight';
    $0CEF:
      Result := CDigit + #32 + 'Nine';
  end;

  // add 'Kannada' to string
  if Result <> '' then
    Result := 'Kannada' + #32 + Result;
end;

function GetMalayalamUnicodeName(Value: Word): string;
begin
  case Value of
    $0D02:
      Result := CSign + #32 + 'Anusvara';
    $0D03:
      Result := CSign + #32 + 'Visarga';
    $0D05:
      Result := CLetter + #32 + 'A';
    $0D06:
      Result := CLetter + #32 + 'Aa';
    $0D07:
      Result := CLetter + #32 + 'I';
    $0D08:
      Result := CLetter + #32 + 'Ii';
    $0D09:
      Result := CLetter + #32 + 'U';
    $0D0A:
      Result := CLetter + #32 + 'Uu';
    $0D0B:
      Result := CLetter + #32 + 'Vocalic R';
    $0D0C:
      Result := CLetter + #32 + 'Vocalic L';
    $0D0E:
      Result := CLetter + #32 + 'E';
    $0D0F:
      Result := CLetter + #32 + 'Ee';
    $0D10:
      Result := CLetter + #32 + 'Ai';
    $0D12:
      Result := CLetter + #32 + 'O';
    $0D13:
      Result := CLetter + #32 + 'Oo';
    $0D14:
      Result := CLetter + #32 + 'Au';
    $0D15:
      Result := CLetter + #32 + 'Ka';
    $0D16:
      Result := CLetter + #32 + 'Kha';
    $0D17:
      Result := CLetter + #32 + 'Ga';
    $0D18:
      Result := CLetter + #32 + 'Gha';
    $0D19:
      Result := CLetter + #32 + 'Nga';
    $0D1A:
      Result := CLetter + #32 + 'Ca';
    $0D1B:
      Result := CLetter + #32 + 'Cha';
    $0D1C:
      Result := CLetter + #32 + 'Ja';
    $0D1D:
      Result := CLetter + #32 + 'Jha';
    $0D1E:
      Result := CLetter + #32 + 'Nya';
    $0D1F:
      Result := CLetter + #32 + 'Tta';
    $0D20:
      Result := CLetter + #32 + 'Ttha';
    $0D21:
      Result := CLetter + #32 + 'Dda';
    $0D22:
      Result := CLetter + #32 + 'Ddha';
    $0D23:
      Result := CLetter + #32 + 'Nna';
    $0D24:
      Result := CLetter + #32 + 'Ta';
    $0D25:
      Result := CLetter + #32 + 'Tha';
    $0D26:
      Result := CLetter + #32 + 'Da';
    $0D27:
      Result := CLetter + #32 + 'Dha';
    $0D28:
      Result := CLetter + #32 + 'Na';
    $0D2A:
      Result := CLetter + #32 + 'Pa';
    $0D2B:
      Result := CLetter + #32 + 'Pha';
    $0D2C:
      Result := CLetter + #32 + 'Ba';
    $0D2D:
      Result := CLetter + #32 + 'Bha';
    $0D2E:
      Result := CLetter + #32 + 'Ma';
    $0D2F:
      Result := CLetter + #32 + 'Ya';
    $0D30:
      Result := CLetter + #32 + 'Ra';
    $0D31:
      Result := CLetter + #32 + 'Rra';
    $0D32:
      Result := CLetter + #32 + 'La';
    $0D33:
      Result := CLetter + #32 + 'Lla';
    $0D34:
      Result := CLetter + #32 + 'Llla';
    $0D35:
      Result := CLetter + #32 + 'Va';
    $0D36:
      Result := CLetter + #32 + 'Sha';
    $0D37:
      Result := CLetter + #32 + 'Ssa';
    $0D38:
      Result := CLetter + #32 + 'Sa';
    $0D39:
      Result := CLetter + #32 + 'Ha';
    $0D3E:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0D3F:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0D40:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0D41:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0D42:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0D43:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $0D46:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0D47:
      Result := CVowel + #32 + CSign + #32 + 'Ee';
    $0D48:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0D4A:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $0D4B:
      Result := CVowel + #32 + CSign + #32 + 'Oo';
    $0D4C:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0D4D:
      Result := CSign + #32 + 'Virama';
    $0D57:
      Result := 'Au Length Mark';
    $0D60:
      Result := CLetter + #32 + 'Vocalic Rr';
    $0D61:
      Result := CLetter + #32 + 'Vocalic Ll';
    $0D66:
      Result := CDigit + #32 + 'Zero';
    $0D67:
      Result := CDigit + #32 + 'One';
    $0D68:
      Result := CDigit + #32 + 'Two';
    $0D69:
      Result := CDigit + #32 + 'Three';
    $0D6A:
      Result := CDigit + #32 + 'Four';
    $0D6B:
      Result := CDigit + #32 + 'Five';
    $0D6C:
      Result := CDigit + #32 + 'Six';
    $0D6D:
      Result := CDigit + #32 + 'Seven';
    $0D6E:
      Result := CDigit + #32 + 'Eight';
    $0D6F:
      Result := CDigit + #32 + 'Nine';
  end;

  // add 'Malayalam' to string
  if Result <> '' then
    Result := 'Malayalam' + #32 + Result;
end;

function GetThaiUnicodeName(Value: Word): string;
begin
  case Value of
    $0E01:
      Result := CCharacter + #32 + 'Ko Kai';
    $0E02:
      Result := CCharacter + #32 + 'Kho Khai';
    $0E03:
      Result := CCharacter + #32 + 'Kho Khuat';
    $0E04:
      Result := CCharacter + #32 + 'Kho Khwai';
    $0E05:
      Result := CCharacter + #32 + 'Kho Khon';
    $0E06:
      Result := CCharacter + #32 + 'Kho Rakhang';
    $0E07:
      Result := CCharacter + #32 + 'Ngo Ngu';
    $0E08:
      Result := CCharacter + #32 + 'Cho Chan';
    $0E09:
      Result := CCharacter + #32 + 'Cho Ching';
    $0E0A:
      Result := CCharacter + #32 + 'Cho Chang';
    $0E0B:
      Result := CCharacter + #32 + 'So So';
    $0E0C:
      Result := CCharacter + #32 + 'Cho Choe';
    $0E0D:
      Result := CCharacter + #32 + 'Yo Ying';
    $0E0E:
      Result := CCharacter + #32 + 'Do Chada';
    $0E0F:
      Result := CCharacter + #32 + 'To Patak';
    $0E10:
      Result := CCharacter + #32 + 'Tho Than';
    $0E11:
      Result := CCharacter + #32 + 'Tho Nangmontho';
    $0E12:
      Result := CCharacter + #32 + 'Tho Phuthao';
    $0E13:
      Result := CCharacter + #32 + 'No Nen';
    $0E14:
      Result := CCharacter + #32 + 'Do Dek';
    $0E15:
      Result := CCharacter + #32 + 'To Tao';
    $0E16:
      Result := CCharacter + #32 + 'Tho Thung';
    $0E17:
      Result := CCharacter + #32 + 'Tho Thahan';
    $0E18:
      Result := CCharacter + #32 + 'Tho Thong';
    $0E19:
      Result := CCharacter + #32 + 'No Nu';
    $0E1A:
      Result := CCharacter + #32 + 'Bo Baimai';
    $0E1B:
      Result := CCharacter + #32 + 'Po Pla';
    $0E1C:
      Result := CCharacter + #32 + 'Pho Phung';
    $0E1D:
      Result := CCharacter + #32 + 'Fo Fa';
    $0E1E:
      Result := CCharacter + #32 + 'Pho Phan';
    $0E1F:
      Result := CCharacter + #32 + 'Fo Fan';
    $0E20:
      Result := CCharacter + #32 + 'Pho Samphao';
    $0E21:
      Result := CCharacter + #32 + 'Mo Ma';
    $0E22:
      Result := CCharacter + #32 + 'Yo Yak';
    $0E23:
      Result := CCharacter + #32 + 'Ro Rua';
    $0E24:
      Result := CCharacter + #32 + 'Ru';
    $0E25:
      Result := CCharacter + #32 + 'Lo Ling';
    $0E26:
      Result := CCharacter + #32 + 'Lu';
    $0E27:
      Result := CCharacter + #32 + 'Wo Waen';
    $0E28:
      Result := CCharacter + #32 + 'So Sala';
    $0E29:
      Result := CCharacter + #32 + 'So Rusi';
    $0E2A:
      Result := CCharacter + #32 + 'So Sua';
    $0E2B:
      Result := CCharacter + #32 + 'Ho Hip';
    $0E2C:
      Result := CCharacter + #32 + 'Lo Chula';
    $0E2D:
      Result := CCharacter + #32 + 'O Ang';
    $0E2E:
      Result := CCharacter + #32 + 'Ho Nokhuk';
    $0E2F:
      Result := CCharacter + #32 + 'Paiyannoi';
    $0E30:
      Result := CCharacter + #32 + 'Sara A';
    $0E31:
      Result := CCharacter + #32 + 'Mai Han-Akat';
    $0E32:
      Result := CCharacter + #32 + 'Sara Aa';
    $0E33:
      Result := CCharacter + #32 + 'Sara Am';
    $0E34:
      Result := CCharacter + #32 + 'Sara I';
    $0E35:
      Result := CCharacter + #32 + 'Sara Ii';
    $0E36:
      Result := CCharacter + #32 + 'Sara Ue';
    $0E37:
      Result := CCharacter + #32 + 'Sara Uee';
    $0E38:
      Result := CCharacter + #32 + 'Sara U';
    $0E39:
      Result := CCharacter + #32 + 'Sara Uu';
    $0E3A:
      Result := CCharacter + #32 + 'Phinthu';
    $0E3F:
      Result := 'Currency Symbol Baht';
    $0E40:
      Result := CCharacter + #32 + 'Sara E';
    $0E41:
      Result := CCharacter + #32 + 'Sara Ae';
    $0E42:
      Result := CCharacter + #32 + 'Sara O';
    $0E43:
      Result := CCharacter + #32 + 'Sara Ai Maimuan';
    $0E44:
      Result := CCharacter + #32 + 'Sara Ai Maimalai';
    $0E45:
      Result := CCharacter + #32 + 'Lakkhangyao';
    $0E46:
      Result := CCharacter + #32 + 'Maiyamok';
    $0E47:
      Result := CCharacter + #32 + 'Maitaikhu';
    $0E48:
      Result := CCharacter + #32 + 'Mai Ek';
    $0E49:
      Result := CCharacter + #32 + 'Mai Tho';
    $0E4A:
      Result := CCharacter + #32 + 'Mai Tri';
    $0E4B:
      Result := CCharacter + #32 + 'Mai Chattawa';
    $0E4C:
      Result := CCharacter + #32 + 'Thanthakhat';
    $0E4D:
      Result := CCharacter + #32 + 'Nikhahit';
    $0E4E:
      Result := CCharacter + #32 + 'Yamakkan';
    $0E4F:
      Result := CCharacter + #32 + 'Fongman';
    $0E50:
      Result := CDigit + #32 + 'Zero';
    $0E51:
      Result := CDigit + #32 + 'One';
    $0E52:
      Result := CDigit + #32 + 'Two';
    $0E53:
      Result := CDigit + #32 + 'Three';
    $0E54:
      Result := CDigit + #32 + 'Four';
    $0E55:
      Result := CDigit + #32 + 'Five';
    $0E56:
      Result := CDigit + #32 + 'Six';
    $0E57:
      Result := CDigit + #32 + 'Seven';
    $0E58:
      Result := CDigit + #32 + 'Eight';
    $0E59:
      Result := CDigit + #32 + 'Nine';
    $0E5A:
      Result := CCharacter + #32 + 'Angkhankhu';
    $0E5B:
      Result := CCharacter + #32 + 'Khomut';
  end;

  // add 'Thai' to string
  if Result <> '' then
    Result := 'Thai' + #32 + Result;
end;

function GetLaoUnicodeName(Value: Word): string;
begin
  case Value of
    $0E81:
      Result := CLetter + #32 + 'Ko';
    $0E82:
      Result := CLetter + #32 + 'Kho Sung';
    $0E84:
      Result := CLetter + #32 + 'Kho Tam';
    $0E87:
      Result := CLetter + #32 + 'Ngo';
    $0E88:
      Result := CLetter + #32 + 'Co';
    $0E8A:
      Result := CLetter + #32 + 'So Tam';
    $0E8D:
      Result := CLetter + #32 + 'Nyo';
    $0E94:
      Result := CLetter + #32 + 'Do';
    $0E95:
      Result := CLetter + #32 + 'To';
    $0E96:
      Result := CLetter + #32 + 'Tho Sung';
    $0E97:
      Result := CLetter + #32 + 'Tho Tam';
    $0E99:
      Result := CLetter + #32 + 'No';
    $0E9A:
      Result := CLetter + #32 + 'Bo';
    $0E9B:
      Result := CLetter + #32 + 'Po';
    $0E9C:
      Result := CLetter + #32 + 'Pho Sung';
    $0E9D:
      Result := CLetter + #32 + 'Fo Tam';
    $0E9E:
      Result := CLetter + #32 + 'Pho Tam';
    $0E9F:
      Result := CLetter + #32 + 'Fo Sung';
    $0EA1:
      Result := CLetter + #32 + 'Mo';
    $0EA2:
      Result := CLetter + #32 + 'Yo';
    $0EA3:
      Result := CLetter + #32 + 'Lo Ling';
    $0EA5:
      Result := CLetter + #32 + 'Lo Loot';
    $0EA7:
      Result := CLetter + #32 + 'Wo';
    $0EAA:
      Result := CLetter + #32 + 'So Sung';
    $0EAB:
      Result := CLetter + #32 + 'Ho Sung';
    $0EAD:
      Result := CLetter + #32 + 'O';
    $0EAE:
      Result := CLetter + #32 + 'Ho Tam';
    $0EAF:
      Result := 'Ellipsis';
    $0EB0:
      Result := CVowel + #32 + 'Sign A';
    $0EB1:
      Result := CVowel + #32 + 'Sign Mai Kan';
    $0EB2:
      Result := CVowel + #32 + 'Sign Aa';
    $0EB3:
      Result := CVowel + #32 + 'Sign Am';
    $0EB4:
      Result := CVowel + #32 + 'Sign I';
    $0EB5:
      Result := CVowel + #32 + 'Sign Ii';
    $0EB6:
      Result := CVowel + #32 + 'Sign Y';
    $0EB7:
      Result := CVowel + #32 + 'Sign Yy';
    $0EB8:
      Result := CVowel + #32 + 'Sign U';
    $0EB9:
      Result := CVowel + #32 + 'Sign Uu';
    $0EBB:
      Result := CVowel + #32 + 'Sign Mai Kon';
    $0EBC:
      Result := 'Semivowel Sign Lo';
    $0EBD:
      Result := 'Semivowel Sign Nyo';
    $0EC0:
      Result := CVowel + #32 + 'Sign E';
    $0EC1:
      Result := CVowel + #32 + 'Sign Ei';
    $0EC2:
      Result := CVowel + #32 + 'Sign O';
    $0EC3:
      Result := CVowel + #32 + 'Sign Ay';
    $0EC4:
      Result := CVowel + #32 + 'Sign Ai';
    $0EC6:
      Result := 'Ko La';
    $0EC8:
      Result := 'Tone Mai Ek';
    $0EC9:
      Result := 'Tone Mai Tho';
    $0ECA:
      Result := 'Tone Mai Ti';
    $0ECB:
      Result := 'Tone Mai Catawa';
    $0ECC:
      Result := 'Cancellation Mark';
    $0ECD:
      Result := 'Niggahita';
    $0ED0:
      Result := CDigit + #32 + 'Zero';
    $0ED1:
      Result := CDigit + #32 + 'One';
    $0ED2:
      Result := CDigit + #32 + 'Two';
    $0ED3:
      Result := CDigit + #32 + 'Three';
    $0ED4:
      Result := CDigit + #32 + 'Four';
    $0ED5:
      Result := CDigit + #32 + 'Five';
    $0ED6:
      Result := CDigit + #32 + 'Six';
    $0ED7:
      Result := CDigit + #32 + 'Seven';
    $0ED8:
      Result := CDigit + #32 + 'Eight';
    $0ED9:
      Result := CDigit + #32 + 'Nine';
    $0EDC:
      Result := 'Ho No';
    $0EDD:
      Result := 'Ho Mo';
  end;

  // add 'Lao' to string
  if Result <> '' then
    Result := 'Lao' + #32 + Result;
end;

function GetGeorgianUnicodeName(Value: Word): string;
begin
  case Value of
    $10A0:
      Result := CCapital + #32 + CLetter + #32 + 'An';
    $10A1:
      Result := CCapital + #32 + CLetter + #32 + 'Ban';
    $10A2:
      Result := CCapital + #32 + CLetter + #32 + 'Gan';
    $10A3:
      Result := CCapital + #32 + CLetter + #32 + 'Don';
    $10A4:
      Result := CCapital + #32 + CLetter + #32 + 'En';
    $10A5:
      Result := CCapital + #32 + CLetter + #32 + 'Vin';
    $10A6:
      Result := CCapital + #32 + CLetter + #32 + 'Zen';
    $10A7:
      Result := CCapital + #32 + CLetter + #32 + 'Tan';
    $10A8:
      Result := CCapital + #32 + CLetter + #32 + 'In';
    $10A9:
      Result := CCapital + #32 + CLetter + #32 + 'Kan';
    $10AA:
      Result := CCapital + #32 + CLetter + #32 + 'Las';
    $10AB:
      Result := CCapital + #32 + CLetter + #32 + 'Man';
    $10AC:
      Result := CCapital + #32 + CLetter + #32 + 'Nar';
    $10AD:
      Result := CCapital + #32 + CLetter + #32 + 'On';
    $10AE:
      Result := CCapital + #32 + CLetter + #32 + 'Par';
    $10AF:
      Result := CCapital + #32 + CLetter + #32 + 'Zhar';
    $10B0:
      Result := CCapital + #32 + CLetter + #32 + 'Rae';
    $10B1:
      Result := CCapital + #32 + CLetter + #32 + 'San';
    $10B2:
      Result := CCapital + #32 + CLetter + #32 + 'Tar';
    $10B3:
      Result := CCapital + #32 + CLetter + #32 + 'Un';
    $10B4:
      Result := CCapital + #32 + CLetter + #32 + 'Phar';
    $10B5:
      Result := CCapital + #32 + CLetter + #32 + 'Khar';
    $10B6:
      Result := CCapital + #32 + CLetter + #32 + 'Ghan';
    $10B7:
      Result := CCapital + #32 + CLetter + #32 + 'Qar';
    $10B8:
      Result := CCapital + #32 + CLetter + #32 + 'Shin';
    $10B9:
      Result := CCapital + #32 + CLetter + #32 + 'Chin';
    $10BA:
      Result := CCapital + #32 + CLetter + #32 + 'Can';
    $10BB:
      Result := CCapital + #32 + CLetter + #32 + 'Jil';
    $10BC:
      Result := CCapital + #32 + CLetter + #32 + 'Cil';
    $10BD:
      Result := CCapital + #32 + CLetter + #32 + 'Char';
    $10BE:
      Result := CCapital + #32 + CLetter + #32 + 'Xan';
    $10BF:
      Result := CCapital + #32 + CLetter + #32 + 'Jhan';
    $10C0:
      Result := CCapital + #32 + CLetter + #32 + 'Hae';
    $10C1:
      Result := CCapital + #32 + CLetter + #32 + 'He';
    $10C2:
      Result := CCapital + #32 + CLetter + #32 + 'Hie';
    $10C3:
      Result := CCapital + #32 + CLetter + #32 + 'We';
    $10C4:
      Result := CCapital + #32 + CLetter + #32 + 'Har';
    $10C5:
      Result := CCapital + #32 + CLetter + #32 + 'Hoe';
    $10D0:
      Result := CLetter + #32 + 'An';
    $10D1:
      Result := CLetter + #32 + 'Ban';
    $10D2:
      Result := CLetter + #32 + 'Gan';
    $10D3:
      Result := CLetter + #32 + 'Don';
    $10D4:
      Result := CLetter + #32 + 'En';
    $10D5:
      Result := CLetter + #32 + 'Vin';
    $10D6:
      Result := CLetter + #32 + 'Zen';
    $10D7:
      Result := CLetter + #32 + 'Tan';
    $10D8:
      Result := CLetter + #32 + 'In';
    $10D9:
      Result := CLetter + #32 + 'Kan';
    $10DA:
      Result := CLetter + #32 + 'Las';
    $10DB:
      Result := CLetter + #32 + 'Man';
    $10DC:
      Result := CLetter + #32 + 'Nar';
    $10DD:
      Result := CLetter + #32 + 'On';
    $10DE:
      Result := CLetter + #32 + 'Par';
    $10DF:
      Result := CLetter + #32 + 'Zhar';
    $10E0:
      Result := CLetter + #32 + 'Rae';
    $10E1:
      Result := CLetter + #32 + 'San';
    $10E2:
      Result := CLetter + #32 + 'Tar';
    $10E3:
      Result := CLetter + #32 + 'Un';
    $10E4:
      Result := CLetter + #32 + 'Phar';
    $10E5:
      Result := CLetter + #32 + 'Khar';
    $10E6:
      Result := CLetter + #32 + 'Ghan';
    $10E7:
      Result := CLetter + #32 + 'Qar';
    $10E8:
      Result := CLetter + #32 + 'Shin';
    $10E9:
      Result := CLetter + #32 + 'Chin';
    $10EA:
      Result := CLetter + #32 + 'Can';
    $10EB:
      Result := CLetter + #32 + 'Jil';
    $10EC:
      Result := CLetter + #32 + 'Cil';
    $10ED:
      Result := CLetter + #32 + 'Char';
    $10EE:
      Result := CLetter + #32 + 'Xan';
    $10EF:
      Result := CLetter + #32 + 'Jhan';
    $10F0:
      Result := CLetter + #32 + 'Hae';
    $10F1:
      Result := CLetter + #32 + 'He';
    $10F2:
      Result := CLetter + #32 + 'Hie';
    $10F3:
      Result := CLetter + #32 + 'We';
    $10F4:
      Result := CLetter + #32 + 'Har';
    $10F5:
      Result := CLetter + #32 + 'Hoe';
    $10F6:
      Result := CLetter + #32 + 'Fi';
    $10FB:
      Result := 'Paragraph Separator';
  end;

  // add 'Georgian' to string
  if Result <> '' then
    Result := 'Georgian' + #32 + Result;
end;

function GetGujaratiUnicodeName(Value: Word): string;
begin
  case Value of
    $0A81:
      Result := CSign + #32 + 'Candrabindu';
    $0A82:
      Result := CSign + #32 + 'Anusvara';
    $0A83:
      Result := CSign + #32 + 'Visarga';
    $0A85:
      Result := CLetter + #32 + 'A';
    $0A86:
      Result := CLetter + #32 + 'Aa';
    $0A87:
      Result := CLetter + #32 + 'I';
    $0A88:
      Result := CLetter + #32 + 'Ii';
    $0A89:
      Result := CLetter + #32 + 'U';
    $0A8A:
      Result := CLetter + #32 + 'Uu';
    $0A8B:
      Result := CLetter + #32 + 'Vocalic R';
    $0A8D:
      Result := CVowel + #32 + 'Candra E';
    $0A8F:
      Result := CLetter + #32 + 'E';
    $0A90:
      Result := CLetter + #32 + 'Ai';
    $0A91:
      Result := CVowel + #32 + 'Candra O';
    $0A93:
      Result := CLetter + #32 + 'O';
    $0A94:
      Result := CLetter + #32 + 'Au';
    $0A95:
      Result := CLetter + #32 + 'Ka';
    $0A96:
      Result := CLetter + #32 + 'Kha';
    $0A97:
      Result := CLetter + #32 + 'Ga';
    $0A98:
      Result := CLetter + #32 + 'Gha';
    $0A99:
      Result := CLetter + #32 + 'Nga';
    $0A9A:
      Result := CLetter + #32 + 'Ca';
    $0A9B:
      Result := CLetter + #32 + 'Cha';
    $0A9C:
      Result := CLetter + #32 + 'Ja';
    $0A9D:
      Result := CLetter + #32 + 'Jha';
    $0A9E:
      Result := CLetter + #32 + 'Nya';
    $0A9F:
      Result := CLetter + #32 + 'Tta';
    $0AA0:
      Result := CLetter + #32 + 'Ttha';
    $0AA1:
      Result := CLetter + #32 + 'Dda';
    $0AA2:
      Result := CLetter + #32 + 'Ddha';
    $0AA3:
      Result := CLetter + #32 + 'Nna';
    $0AA4:
      Result := CLetter + #32 + 'Ta';
    $0AA5:
      Result := CLetter + #32 + 'Tha';
    $0AA6:
      Result := CLetter + #32 + 'Da';
    $0AA7:
      Result := CLetter + #32 + 'Dha';
    $0AA8:
      Result := CLetter + #32 + 'Na';
    $0AAA:
      Result := CLetter + #32 + 'Pa';
    $0AAB:
      Result := CLetter + #32 + 'Pha';
    $0AAC:
      Result := CLetter + #32 + 'Ba';
    $0AAD:
      Result := CLetter + #32 + 'Bha';
    $0AAE:
      Result := CLetter + #32 + 'Ma';
    $0AAF:
      Result := CLetter + #32 + 'Ya';
    $0AB0:
      Result := CLetter + #32 + 'Ra';
    $0AB2:
      Result := CLetter + #32 + 'La';
    $0AB3:
      Result := CLetter + #32 + 'Lla';
    $0AB5:
      Result := CLetter + #32 + 'Va';
    $0AB6:
      Result := CLetter + #32 + 'Sha';
    $0AB7:
      Result := CLetter + #32 + 'Ssa';
    $0AB8:
      Result := CLetter + #32 + 'Sa';
    $0AB9:
      Result := CLetter + #32 + 'Ha';
    $0ABC:
      Result := CSign + #32 + 'Nukta';
    $0ABD:
      Result := CSign + #32 + 'Avagraha';
    $0ABE:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $0ABF:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $0AC0:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $0AC1:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $0AC2:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $0AC3:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $0AC4:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Rr';
    $0AC5:
      Result := CVowel + #32 + CSign + #32 + 'Candra E';
    $0AC7:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $0AC8:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $0AC9:
      Result := CVowel + #32 + CSign + #32 + 'Candra O';
    $0ACB:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $0ACC:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $0ACD:
      Result := CSign + #32 + 'Virama';
    $0AD0:
      Result := 'Om';
    $0AE0:
      Result := CLetter + #32 + 'Vocalic Rr';
    $0AE6:
      Result := CDigit + #32 + 'Zero';
    $0AE7:
      Result := CDigit + #32 + 'One';
    $0AE8:
      Result := CDigit + #32 + 'Two';
    $0AE9:
      Result := CDigit + #32 + 'Three';
    $0AEA:
      Result := CDigit + #32 + 'Four';
    $0AEB:
      Result := CDigit + #32 + 'Five';
    $0AEC:
      Result := CDigit + #32 + 'Six';
    $0AED:
      Result := CDigit + #32 + 'Seven';
    $0AEE:
      Result := CDigit + #32 + 'Eight';
    $0AEF:
      Result := CDigit + #32 + 'Nine';
  end;

  // add 'Gujarati' to string
  if Result <> '' then
    Result := 'Gujarati' + #32 + Result;
end;

function GetBengaliUnicodeName(Value: Word): string;
begin
  case Value of
    $0981:
      Result := CSign + #32 + 'Candrabindu';
    $0982:
      Result := CSign + #32 + 'Anusvara';
    $0983:
      Result := CSign + #32 + 'Visarga';
    $0985:
      Result := CLetter + #32 + 'A';
    $0986:
      Result := CLetter + #32 + 'Aa';
    $0987:
      Result := CLetter + #32 + 'I';
    $0988:
      Result := CLetter + #32 + 'Ii';
    $0989:
      Result := CLetter + #32 + 'U';
    $098A:
      Result := CLetter + #32 + 'Uu';
    $098B:
      Result := CLetter + #32 + 'Vocalic R';
    $098C:
      Result := CLetter + #32 + 'Vocalic L';
    $098F:
      Result := CLetter + #32 + 'E';
    $0990:
      Result := CLetter + #32 + 'Ai';
    $0993:
      Result := CLetter + #32 + 'O';
    $0994:
      Result := CLetter + #32 + 'Au';
    $0995:
      Result := CLetter + #32 + 'Ka';
    $0996:
      Result := CLetter + #32 + 'Kha';
    $0997:
      Result := CLetter + #32 + 'Ga';
    $0998:
      Result := CLetter + #32 + 'Gha';
    $0999:
      Result := CLetter + #32 + 'Nga';
    $099A:
      Result := CLetter + #32 + 'Ca';
    $099B:
      Result := CLetter + #32 + 'Cha';
    $099C:
      Result := CLetter + #32 + 'Ja';
    $099D:
      Result := CLetter + #32 + 'Jha';
    $099E:
      Result := CLetter + #32 + 'Nya';
    $099F:
      Result := CLetter + #32 + 'Tta';
    $09A0:
      Result := CLetter + #32 + 'Ttha';
    $09A1:
      Result := CLetter + #32 + 'Dda';
    $09A2:
      Result := CLetter + #32 + 'Ddha';
    $09A3:
      Result := CLetter + #32 + 'Nna';
    $09A4:
      Result := CLetter + #32 + 'Ta';
    $09A5:
      Result := CLetter + #32 + 'Tha';
    $09A6:
      Result := CLetter + #32 + 'Da';
    $09A7:
      Result := CLetter + #32 + 'Dha';
    $09A8:
      Result := CLetter + #32 + 'Na';
    $09AA:
      Result := CLetter + #32 + 'Pa';
    $09AB:
      Result := CLetter + #32 + 'Pha';
    $09AC:
      Result := CLetter + #32 + 'Ba';
    $09AD:
      Result := CLetter + #32 + 'Bha';
    $09AE:
      Result := CLetter + #32 + 'Ma';
    $09AF:
      Result := CLetter + #32 + 'Ya';
    $09B0:
      Result := CLetter + #32 + 'Ra';
    $09B2:
      Result := CLetter + #32 + 'La';
    $09B6:
      Result := CLetter + #32 + 'Sha';
    $09B7:
      Result := CLetter + #32 + 'Ssa';
    $09B8:
      Result := CLetter + #32 + 'Sa';
    $09B9:
      Result := CLetter + #32 + 'Ha';
    $09BC:
      Result := CSign + #32 + 'Nukta';
    $09BE:
      Result := CVowel + #32 + CSign + #32 + 'Aa';
    $09BF:
      Result := CVowel + #32 + CSign + #32 + 'I';
    $09C0:
      Result := CVowel + #32 + CSign + #32 + 'Ii';
    $09C1:
      Result := CVowel + #32 + CSign + #32 + 'U';
    $09C2:
      Result := CVowel + #32 + CSign + #32 + 'Uu';
    $09C3:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic R';
    $09C4:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Rr';
    $09C7:
      Result := CVowel + #32 + CSign + #32 + 'E';
    $09C8:
      Result := CVowel + #32 + CSign + #32 + 'Ai';
    $09CB:
      Result := CVowel + #32 + CSign + #32 + 'O';
    $09CC:
      Result := CVowel + #32 + CSign + #32 + 'Au';
    $09CD:
      Result := CSign + #32 + 'Virama';
    $09D7:
      Result := 'Au Length Mark';
    $09DC:
      Result := CLetter + #32 + 'Rra';
    $09DD:
      Result := CLetter + #32 + 'Rha';
    $09DF:
      Result := CLetter + #32 + 'Yya';
    $09E0:
      Result := CLetter + #32 + 'Vocalic Rr';
    $09E1:
      Result := CLetter + #32 + 'Vocalic Ll';
    $09E2:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic L';
    $09E3:
      Result := CVowel + #32 + CSign + #32 + 'Vocalic Ll';
    $09E6:
      Result := CDigit + #32 + 'Zero';
    $09E7:
      Result := CDigit + #32 + 'One';
    $09E8:
      Result := CDigit + #32 + 'Two';
    $09E9:
      Result := CDigit + #32 + 'Three';
    $09EA:
      Result := CDigit + #32 + 'Four';
    $09EB:
      Result := CDigit + #32 + 'Five';
    $09EC:
      Result := CDigit + #32 + 'Six';
    $09ED:
      Result := CDigit + #32 + 'Seven';
    $09EE:
      Result := CDigit + #32 + 'Eight';
    $09EF:
      Result := CDigit + #32 + 'Nine';
    $09F0:
      Result := CLetter + #32 + 'Ra' + #32 + CWith + #32 + 'Middle Diagonal';
    $09F1:
      Result := CLetter + #32 + 'Ra' + #32 + CWith + #32 + CLower + #32 + 'Diagonal';
    $09F2:
      Result := 'Rupee Mark';
    $09F3:
      Result := 'Rupee Sign';
    $09F4:
      Result := 'Currency Numerator One';
    $09F5:
      Result := 'Currency Numerator Two';
    $09F6:
      Result := 'Currency Numerator Three';
    $09F7:
      Result := 'Currency Numerator Four';
    $09F8:
      Result := 'Currency Numerator One Less Than The Denominator';
    $09F9:
      Result := 'Currency Denominator Sixteen';
    $09FA:
      Result := 'Isshar';
  end;

  // add 'Bengali' to string
  if Result <> '' then
    Result := 'Bengali' + #32 + Result;
end;

function GetHiraganaUnicodeName(Value: Word): string;
begin
  case Value of
    $3041:
      Result := CLetter + #32 + CSmall + #32 + 'A';
    $3042:
      Result := CLetter + #32 + 'A';
    $3043:
      Result := CLetter + #32 + CSmall + #32 + 'I';
    $3044:
      Result := CLetter + #32 + 'I';
    $3045:
      Result := CLetter + #32 + CSmall + #32 + 'U';
    $3046:
      Result := CLetter + #32 + 'U';
    $3047:
      Result := CLetter + #32 + CSmall + #32 + 'E';
    $3048:
      Result := CLetter + #32 + 'E';
    $3049:
      Result := CLetter + #32 + CSmall + #32 + 'O';
    $304A:
      Result := CLetter + #32 + 'O';
    $304B:
      Result := CLetter + #32 + 'Ka';
    $304C:
      Result := CLetter + #32 + 'Ga';
    $304D:
      Result := CLetter + #32 + 'Ki';
    $304E:
      Result := CLetter + #32 + 'Gi';
    $304F:
      Result := CLetter + #32 + 'Ku';
    $3050:
      Result := CLetter + #32 + 'Gu';
    $3051:
      Result := CLetter + #32 + 'Ke';
    $3052:
      Result := CLetter + #32 + 'Ge';
    $3053:
      Result := CLetter + #32 + 'Ko';
    $3054:
      Result := CLetter + #32 + 'Go';
    $3055:
      Result := CLetter + #32 + 'Sa';
    $3056:
      Result := CLetter + #32 + 'Za';
    $3057:
      Result := CLetter + #32 + 'Si';
    $3058:
      Result := CLetter + #32 + 'Zi';
    $3059:
      Result := CLetter + #32 + 'Su';
    $305A:
      Result := CLetter + #32 + 'Zu';
    $305B:
      Result := CLetter + #32 + 'Se';
    $305C:
      Result := CLetter + #32 + 'Ze';
    $305D:
      Result := CLetter + #32 + 'So';
    $305E:
      Result := CLetter + #32 + 'Zo';
    $305F:
      Result := CLetter + #32 + 'Ta';
    $3060:
      Result := CLetter + #32 + 'Da';
    $3061:
      Result := CLetter + #32 + 'Ti';
    $3062:
      Result := CLetter + #32 + 'Di';
    $3063:
      Result := CLetter + #32 + CSmall + #32 + 'Tu';
    $3064:
      Result := CLetter + #32 + 'Tu';
    $3065:
      Result := CLetter + #32 + 'Du';
    $3066:
      Result := CLetter + #32 + 'Te';
    $3067:
      Result := CLetter + #32 + 'De';
    $3068:
      Result := CLetter + #32 + 'To';
    $3069:
      Result := CLetter + #32 + 'Do';
    $306A:
      Result := CLetter + #32 + 'Na';
    $306B:
      Result := CLetter + #32 + 'Ni';
    $306C:
      Result := CLetter + #32 + 'Nu';
    $306D:
      Result := CLetter + #32 + 'Ne';
    $306E:
      Result := CLetter + #32 + 'No';
    $306F:
      Result := CLetter + #32 + 'Ha';
    $3070:
      Result := CLetter + #32 + 'Ba';
    $3071:
      Result := CLetter + #32 + 'Pa';
    $3072:
      Result := CLetter + #32 + 'Hi';
    $3073:
      Result := CLetter + #32 + 'Bi';
    $3074:
      Result := CLetter + #32 + 'Pi';
    $3075:
      Result := CLetter + #32 + 'Hu';
    $3076:
      Result := CLetter + #32 + 'Bu';
    $3077:
      Result := CLetter + #32 + 'Pu';
    $3078:
      Result := CLetter + #32 + 'He';
    $3079:
      Result := CLetter + #32 + 'Be';
    $307A:
      Result := CLetter + #32 + 'Pe';
    $307B:
      Result := CLetter + #32 + 'Ho';
    $307C:
      Result := CLetter + #32 + 'Bo';
    $307D:
      Result := CLetter + #32 + 'Po';
    $307E:
      Result := CLetter + #32 + 'Ma';
    $307F:
      Result := CLetter + #32 + 'Mi';
    $3080:
      Result := CLetter + #32 + 'Mu';
    $3081:
      Result := CLetter + #32 + 'Me';
    $3082:
      Result := CLetter + #32 + 'Mo';
    $3083:
      Result := CLetter + #32 + CSmall + #32 + 'Ya';
    $3084:
      Result := CLetter + #32 + 'Ya';
    $3085:
      Result := CLetter + #32 + CSmall + #32 + 'Yu';
    $3086:
      Result := CLetter + #32 + 'Yu';
    $3087:
      Result := CLetter + #32 + CSmall + #32 + 'Yo';
    $3088:
      Result := CLetter + #32 + 'Yo';
    $3089:
      Result := CLetter + #32 + 'Ra';
    $308A:
      Result := CLetter + #32 + 'Ri';
    $308B:
      Result := CLetter + #32 + 'Ru';
    $308C:
      Result := CLetter + #32 + 'Re';
    $308D:
      Result := CLetter + #32 + 'Ro';
    $308E:
      Result := CLetter + #32 + CSmall + #32 + 'Wa';
    $308F:
      Result := CLetter + #32 + 'Wa';
    $3090:
      Result := CLetter + #32 + 'Wi';
    $3091:
      Result := CLetter + #32 + 'We';
    $3092:
      Result := CLetter + #32 + 'Wo';
    $3093:
      Result := CLetter + #32 + 'N';
    $3094:
      Result := CLetter + #32 + 'Vu';
  end;

  // add 'Hiragana' to string
  if Result <> '' then
    Result := 'Hiragana' + #32 + Result;
end;

function GetDingbatUnicodeName(Value: Word): string;
begin
  case Value of
    $2776:
      Result := 'Negative Circled Digit One';
    $2777:
      Result := 'Negative Circled Digit Two';
    $2778:
      Result := 'Negative Circled Digit Three';
    $2779:
      Result := 'Negative Circled Digit Four';
    $277A:
      Result := 'Negative Circled Digit Five';
    $277B:
      Result := 'Negative Circled Digit Six';
    $277C:
      Result := 'Negative Circled Digit Seven';
    $277D:
      Result := 'Negative Circled Digit Eight';
    $277E:
      Result := 'Negative Circled Digit Nine';
    $277F:
      Result := 'Negative Circled Number Ten';
    $2780:
      Result := 'Circled Sans-Serif Digit One';
    $2781:
      Result := 'Circled Sans-Serif Digit Two';
    $2782:
      Result := 'Circled Sans-Serif Digit Three';
    $2783:
      Result := 'Circled Sans-Serif Digit Four';
    $2784:
      Result := 'Circled Sans-Serif Digit Five';
    $2785:
      Result := 'Circled Sans-Serif Digit Six';
    $2786:
      Result := 'Circled Sans-Serif Digit Seven';
    $2787:
      Result := 'Circled Sans-Serif Digit Eight';
    $2788:
      Result := 'Circled Sans-Serif Digit Nine';
    $2789:
      Result := 'Circled Sans-Serif Number Ten';
    $278A:
      Result := 'Negative Circled Sans-Serif Digit One';
    $278B:
      Result := 'Negative Circled Sans-Serif Digit Two';
    $278C:
      Result := 'Negative Circled Sans-Serif Digit Three';
    $278D:
      Result := 'Negative Circled Sans-Serif Digit Four';
    $278E:
      Result := 'Negative Circled Sans-Serif Digit Five';
    $278F:
      Result := 'Negative Circled Sans-Serif Digit Six';
    $2790:
      Result := 'Negative Circled Sans-Serif Digit Seven';
    $2791:
      Result := 'Negative Circled Sans-Serif Digit Eight';
    $2792:
      Result := 'Negative Circled Sans-Serif Digit Nine';
    $2793:
      Result := 'Negative Circled Sans-Serif Number Ten';
  end;

  // add 'Dingbat' to string
  if Result <> '' then
    Result := 'Dingbat' + #32 + Result;
end;

function GetRomanNumberalUnicodeName(Value: Word): string;
begin
  case Value of
    $2160:
      Result := 'One';
    $2161:
      Result := 'Two';
    $2162:
      Result := 'Three';
    $2163:
      Result := 'Four';
    $2164:
      Result := 'Five';
    $2165:
      Result := 'Six';
    $2166:
      Result := 'Seven';
    $2167:
      Result := 'Eight';
    $2168:
      Result := 'Nine';
    $2169:
      Result := 'Ten';
    $216A:
      Result := 'Eleven';
    $216B:
      Result := 'Twelve';
    $216C:
      Result := 'Fifty';
    $216D:
      Result := 'One Hundred';
    $216E:
      Result := 'Five Hundred';
    $216F:
      Result := 'One Thousand';
  end;

  // add 'Roman Numeral' to string
  if Result <> '' then
    Result := 'Roman Numeral' + #32 + Result;
end;

function GetSymbolUnicodeName(Value: Word): string;
begin
  case Value of
    $2400:
      Result := 'Null';
    $2401:
      Result := 'Start Of Heading';
    $2402:
      Result := 'Start Of Text';
    $2403:
      Result := 'End Of Text';
    $2404:
      Result := 'End Of Transmission';
    $2405:
      Result := 'Enquiry';
    $2406:
      Result := 'Acknowledge';
    $2407:
      Result := 'Bell';
    $2408:
      Result := 'Backspace';
    $2409:
      Result := 'Horizontal Tabulation';
    $240A:
      Result := 'Line Feed';
    $240B:
      Result := 'Vertical Tabulation';
    $240C:
      Result := CForm + #32 + 'Feed';
    $240D:
      Result := 'Carriage Return';
    $240E:
      Result := 'Shift Out';
    $240F:
      Result := 'Shift In';
    $2410:
      Result := 'Data Link Escape';
    $2411:
      Result := 'Device Control One';
    $2412:
      Result := 'Device Control Two';
    $2413:
      Result := 'Device Control Three';
    $2414:
      Result := 'Device Control Four';
    $2415:
      Result := 'Negative Acknowledge';
    $2416:
      Result := 'Synchronous Idle';
    $2417:
      Result := 'End Of Transmission Block';
    $2418:
      Result := 'Cancel';
    $2419:
      Result := 'End Of Medium';
    $241A:
      Result := 'Substitute';
    $241B:
      Result := 'Escape';
    $241C:
      Result := 'File Separator';
    $241D:
      Result := 'Group Separator';
    $241E:
      Result := 'Record Separator';
    $241F:
      Result := 'Unit Separator';
    $2420:
      Result := 'Space';
    $2421:
      Result := 'Delete';
    $2424:
      Result := 'Newline';
  end;

  // add 'Symbol For' to string
  if Result <> '' then
    Result := 'Symbol For' + #32 + Result;
end;

function GetAplFunctionalSymbolUnicodeName(Value: Word): string;
begin
  case Value of
    $2336:
      Result := 'I-Beam';
    $2337:
      Result := 'Squish Quad';
    $2338:
      Result := 'Quad Equal';
    $2339:
      Result := 'Quad Divide';
    $233A:
      Result := 'Quad Diamond';
    $233B:
      Result := 'Quad Jot';
    $233C:
      Result := 'Quad Circle';
    $233D:
      Result := 'Circle Stile';
    $233E:
      Result := 'Circle Jot';
    $233F:
      Result := 'Slash Bar';
    $2340:
      Result := 'Backslash Bar';
    $2341:
      Result := 'Quad Slash';
    $2342:
      Result := 'Quad Backslash';
    $2343:
      Result := 'Quad Less-Than';
    $2344:
      Result := 'Quad Greater-Than';
    $2345:
      Result := 'Leftwards Vane';
    $2346:
      Result := 'Rightwards Vane';
    $2347:
      Result := 'Quad Leftwards Arrow';
    $2348:
      Result := 'Quad Rightwards Arrow';
    $2349:
      Result := 'Circle Backslash';
    $234A:
      Result := CDown + #32 + 'Tack Underbar';
    $234B:
      Result := CDelta + #32 + 'Stile';
    $234C:
      Result := 'Quad Down Caret';
    $234D:
      Result := 'Quad' + #32 + CDelta;
    $234E:
      Result := CDown + #32 + 'Tack Jot';
    $234F:
      Result := 'Upwards Vane';
    $2350:
      Result := 'Quad Upwards Arrow';
    $2351:
      Result := CUp + #32 + 'Tack Overbar';
    $2352:
      Result := 'Del Stile';
    $2353:
      Result := 'Quad Up Caret';
    $2354:
      Result := 'Quad Del';
    $2355:
      Result := CUp + #32 + 'Tack Jot';
    $2356:
      Result := 'Downwards Vane';
    $2357:
      Result := 'Quad Downwards Arrow';
    $2358:
      Result := 'Quote Underbar';
    $2359:
      Result := CDelta + #32 + 'Underbar';
    $235A:
      Result := 'Diamond Underbar';
    $235B:
      Result := 'Jot Underbar';
    $235C:
      Result := 'Circle Underbar';
    $235D:
      Result := CUp + #32 + 'Shoe Jot';
    $235E:
      Result := 'Quote Quad';
    $235F:
      Result := 'Circle Star';
    $2360:
      Result := 'Quad Colon';
    $2361:
      Result := CUp + #32 + 'Tack Diaresis';
    $2362:
      Result := 'Del Diaresis';
    $2363:
      Result := 'Star Diaresis';
    $2364:
      Result := 'Jot Diaresis';
    $2365:
      Result := 'Circle Diaresis';
    $2366:
      Result := CDown + #32 + 'Shoe Stile';
    $2367:
      Result := CLeft + #32 + 'Shoe Stile';
    $2368:
      Result := CTilde + #32 + 'Diaresis';
    $2369:
      Result := 'Greater-Than Diaresis';
    $236A:
      Result := 'Comma Bar';
    $236B:
      Result := 'Del' + #32 + CTilde;
    $236C:
      Result := 'Zilde';
    $236D:
      Result := 'Stile' + #32 + CTilde;
    $236E:
      Result := 'Semicolon Underbar';
    $236F:
      Result := 'Quad Not Equal';
    $2370:
      Result := 'Quad Question';
    $2371:
      Result := CDown + #32 + 'Caret' + #32 + CTilde;
    $2372:
      Result := CUp + #32 + 'Caret' + #32 + CTilde;
    $2373:
      Result := 'Iota';
    $2374:
      Result := 'Rho';
    $2375:
      Result := COmega;
    $2376:
      Result := CAlpha + #32 + 'Underbar';
    $2377:
      Result := 'Epsilon Underbar';
    $2378:
      Result := 'Iota Underbar';
    $2379:
      Result := COmega + #32 + 'Underbar';
    $237A:
      Result := CAlpha;
  end;

  // add 'Apl Functional Symbol' to string
  if Result <> '' then
    Result := 'Apl Functional Symbol' + #32 + Result;
end;

function GetIdeographicAnnotationUnicodeName(Value: Word): string;
begin
  case Value of
    $3190:
      Result := 'Linking Mark';
    $3191:
      Result := 'Reverse Mark';
    $3192:
      Result := 'One Mark';
    $3193:
      Result := 'Two Mark';
    $3194:
      Result := 'Three Mark';
    $3195:
      Result := 'Four Mark';
    $3196:
      Result := 'Top Mark';
    $3197:
      Result := 'Middle Mark';
    $3198:
      Result := 'Bottom Mark';
    $3199:
      Result := 'First Mark';
    $319A:
      Result := 'Second Mark';
    $319B:
      Result := 'Third Mark';
    $319C:
      Result := 'Fourth Mark';
    $319D:
      Result := 'Heaven Mark';
    $319E:
      Result := 'Earth Mark';
    $319F:
      Result := 'Man Mark';
  end;

  // add CIdeographic + #32 + 'Annotation' to string
  if Result <> '' then
    Result := CIdeographic + #32 + 'Annotation' + #32 + Result;
end;

function GetParenthesizedUnicodeName(Value: Word): string;
begin
  case Value of
    $2474:
      Result := CDigit + #32 + 'One';
    $2475:
      Result := CDigit + #32 + 'Two';
    $2476:
      Result := CDigit + #32 + 'Three';
    $2477:
      Result := CDigit + #32 + 'Four';
    $2478:
      Result := CDigit + #32 + 'Five';
    $2479:
      Result := CDigit + #32 + 'Six';
    $247A:
      Result := CDigit + #32 + 'Seven';
    $247B:
      Result := CDigit + #32 + 'Eight';
    $247C:
      Result := CDigit + #32 + 'Nine';
    $247D:
      Result := CNumber + #32 + 'Ten';
    $247E:
      Result := CNumber + #32 + 'Eleven';
    $247F:
      Result := CNumber + #32 + 'Twelve';
    $2480:
      Result := CNumber + #32 + 'Thirteen';
    $2481:
      Result := CNumber + #32 + 'Fourteen';
    $2482:
      Result := CNumber + #32 + 'Fifteen';
    $2483:
      Result := CNumber + #32 + 'Sixteen';
    $2484:
      Result := CNumber + #32 + 'Seventeen';
    $2485:
      Result := CNumber + #32 + 'Eighteen';
    $2486:
      Result := CNumber + #32 + 'Nineteen';
    $2487:
      Result := CNumber + #32 + 'Twenty';
    $249C:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'A';
    $249D:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'B';
    $249E:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'C';
    $249F:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'D';
    $24A0:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'E';
    $24A1:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'F';
    $24A2:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'G';
    $24A3:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'H';
    $24A4:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'I';
    $24A5:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'J';
    $24A6:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'K';
    $24A7:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'L';
    $24A8:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'M';
    $24A9:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'N';
    $24AA:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'O';
    $24AB:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'P';
    $24AC:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Q';
    $24AD:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'R';
    $24AE:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'S';
    $24AF:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'T';
    $24B0:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'U';
    $24B1:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'V';
    $24B2:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'W';
    $24B3:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'X';
    $24B4:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Y';
    $24B5:
      Result := CLatin + #32 + CSmall + #32 + CLetter + #32 + 'Z';
    $3200:
      Result := CHangul + #32 + 'Kiyeok';
    $3201:
      Result := CHangul + #32 + 'Nieun';
    $3202:
      Result := CHangul + #32 + 'Tikeut';
    $3203:
      Result := CHangul + #32 + 'Rieul';
    $3204:
      Result := CHangul + #32 + 'Mieum';
    $3205:
      Result := CHangul + #32 + 'Pieup';
    $3206:
      Result := CHangul + #32 + 'Sios';
    $3207:
      Result := CHangul + #32 + 'Ieung';
    $3208:
      Result := CHangul + #32 + 'Cieuc';
    $3209:
      Result := CHangul + #32 + 'Chieuch';
    $320A:
      Result := CHangul + #32 + 'Khieukh';
    $320B:
      Result := CHangul + #32 + 'Thieuth';
    $320C:
      Result := CHangul + #32 + 'Phieuph';
    $320D:
      Result := CHangul + #32 + 'Hieuh';
    $320E:
      Result := CHangul + #32 + 'Kiyeok A';
    $320F:
      Result := CHangul + #32 + 'Nieun A';
    $3210:
      Result := CHangul + #32 + 'Tikeut A';
    $3211:
      Result := CHangul + #32 + 'Rieul A';
    $3212:
      Result := CHangul + #32 + 'Mieum A';
    $3213:
      Result := CHangul + #32 + 'Pieup A';
    $3214:
      Result := CHangul + #32 + 'Sios A';
    $3215:
      Result := CHangul + #32 + 'Ieung A';
    $3216:
      Result := CHangul + #32 + 'Cieuc A';
    $3217:
      Result := CHangul + #32 + 'Chieuch A';
    $3218:
      Result := CHangul + #32 + 'Khieukh A';
    $3219:
      Result := CHangul + #32 + 'Thieuth A';
    $321A:
      Result := CHangul + #32 + 'Phieuph A';
    $321B:
      Result := CHangul + #32 + 'Hieuh A';
    $321C:
      Result := CHangul + #32 + 'Cieuc U';
    $3220:
      Result := CIdeograph + #32 + 'One';
    $3221:
      Result := CIdeograph + #32 + 'Two';
    $3222:
      Result := CIdeograph + #32 + 'Three';
    $3223:
      Result := CIdeograph + #32 + 'Four';
    $3224:
      Result := CIdeograph + #32 + 'Five';
    $3225:
      Result := CIdeograph + #32 + 'Six';
    $3226:
      Result := CIdeograph + #32 + 'Seven';
    $3227:
      Result := CIdeograph + #32 + 'Eight';
    $3228:
      Result := CIdeograph + #32 + 'Nine';
    $3229:
      Result := CIdeograph + #32 + 'Ten';
    $322A:
      Result := CIdeograph + #32 + 'Moon';
    $322B:
      Result := CIdeograph + #32 + 'Fire';
    $322C:
      Result := CIdeograph + #32 + 'Water';
    $322D:
      Result := CIdeograph + #32 + 'Wood';
    $322E:
      Result := CIdeograph + #32 + 'Metal';
    $322F:
      Result := CIdeograph + #32 + 'Earth';
    $3230:
      Result := CIdeograph + #32 + 'Sun';
    $3231:
      Result := CIdeograph + #32 + 'Stock';
    $3232:
      Result := CIdeograph + #32 + 'Have';
    $3233:
      Result := CIdeograph + #32 + 'Society';
    $3234:
      Result := CIdeograph + #32 + 'Name';
    $3235:
      Result := CIdeograph + #32 + 'Special';
    $3236:
      Result := CIdeograph + #32 + 'Financial';
    $3237:
      Result := CIdeograph + #32 + 'Congratulation';
    $3238:
      Result := CIdeograph + #32 + 'Labor';
    $3239:
      Result := CIdeograph + #32 + 'Represent';
    $323A:
      Result := CIdeograph + #32 + 'Call';
    $323B:
      Result := CIdeograph + #32 + 'Study';
    $323C:
      Result := CIdeograph + #32 + 'Supervise';
    $323D:
      Result := CIdeograph + #32 + 'Enterprise';
    $323E:
      Result := CIdeograph + #32 + 'Resource';
    $323F:
      Result := CIdeograph + #32 + 'Alliance';
    $3240:
      Result := CIdeograph + #32 + 'Festival';
    $3241:
      Result := CIdeograph + #32 + 'Rest';
    $3242:
      Result := CIdeograph + #32 + 'Self';
    $3243:
      Result := CIdeograph + #32 + 'Reach';
  end;

  // add 'Parenthesized' to string
  if Result <> '' then
    Result := 'Parenthesized' + #32 + Result;
end;

function GetKatakanaUnicodeName(Value: Word): string;
begin
  case Value of
    $30A1:
      Result := CLetter + #32 + CSmall + #32 + 'A';
    $30A2:
      Result := CLetter + #32 + 'A';
    $30A3:
      Result := CLetter + #32 + CSmall + #32 + 'I';
    $30A4:
      Result := CLetter + #32 + 'I';
    $30A5:
      Result := CLetter + #32 + CSmall + #32 + 'U';
    $30A6:
      Result := CLetter + #32 + 'U';
    $30A7:
      Result := CLetter + #32 + CSmall + #32 + 'E';
    $30A8:
      Result := CLetter + #32 + 'E';
    $30A9:
      Result := CLetter + #32 + CSmall + #32 + 'O';
    $30AA:
      Result := CLetter + #32 + 'O';
    $30AB:
      Result := CLetter + #32 + 'Ka';
    $30AC:
      Result := CLetter + #32 + 'Ga';
    $30AD:
      Result := CLetter + #32 + 'Ki';
    $30AE:
      Result := CLetter + #32 + 'Gi';
    $30AF:
      Result := CLetter + #32 + 'Ku';
    $30B0:
      Result := CLetter + #32 + 'Gu';
    $30B1:
      Result := CLetter + #32 + 'Ke';
    $30B2:
      Result := CLetter + #32 + 'Ge';
    $30B3:
      Result := CLetter + #32 + 'Ko';
    $30B4:
      Result := CLetter + #32 + 'Go';
    $30B5:
      Result := CLetter + #32 + 'Sa';
    $30B6:
      Result := CLetter + #32 + 'Za';
    $30B7:
      Result := CLetter + #32 + 'Si';
    $30B8:
      Result := CLetter + #32 + 'Zi';
    $30B9:
      Result := CLetter + #32 + 'Su';
    $30BA:
      Result := CLetter + #32 + 'Zu';
    $30BB:
      Result := CLetter + #32 + 'Se';
    $30BC:
      Result := CLetter + #32 + 'Ze';
    $30BD:
      Result := CLetter + #32 + 'So';
    $30BE:
      Result := CLetter + #32 + 'Zo';
    $30BF:
      Result := CLetter + #32 + 'Ta';
    $30C0:
      Result := CLetter + #32 + 'Da';
    $30C1:
      Result := CLetter + #32 + 'Ti';
    $30C2:
      Result := CLetter + #32 + 'Di';
    $30C3:
      Result := CLetter + #32 + CSmall + #32 + 'Tu';
    $30C4:
      Result := CLetter + #32 + 'Tu';
    $30C5:
      Result := CLetter + #32 + 'Du';
    $30C6:
      Result := CLetter + #32 + 'Te';
    $30C7:
      Result := CLetter + #32 + 'De';
    $30C8:
      Result := CLetter + #32 + 'To';
    $30C9:
      Result := CLetter + #32 + 'Do';
    $30CA:
      Result := CLetter + #32 + 'Na';
    $30CB:
      Result := CLetter + #32 + 'Ni';
    $30CC:
      Result := CLetter + #32 + 'Nu';
    $30CD:
      Result := CLetter + #32 + 'Ne';
    $30CE:
      Result := CLetter + #32 + 'No';
    $30CF:
      Result := CLetter + #32 + 'Ha';
    $30D0:
      Result := CLetter + #32 + 'Ba';
    $30D1:
      Result := CLetter + #32 + 'Pa';
    $30D2:
      Result := CLetter + #32 + 'Hi';
    $30D3:
      Result := CLetter + #32 + 'Bi';
    $30D4:
      Result := CLetter + #32 + 'Pi';
    $30D5:
      Result := CLetter + #32 + 'Hu';
    $30D6:
      Result := CLetter + #32 + 'Bu';
    $30D7:
      Result := CLetter + #32 + 'Pu';
    $30D8:
      Result := CLetter + #32 + 'He';
    $30D9:
      Result := CLetter + #32 + 'Be';
    $30DA:
      Result := CLetter + #32 + 'Pe';
    $30DB:
      Result := CLetter + #32 + 'Ho';
    $30DC:
      Result := CLetter + #32 + 'Bo';
    $30DD:
      Result := CLetter + #32 + 'Po';
    $30DE:
      Result := CLetter + #32 + 'Ma';
    $30DF:
      Result := CLetter + #32 + 'Mi';
    $30E0:
      Result := CLetter + #32 + 'Mu';
    $30E1:
      Result := CLetter + #32 + 'Me';
    $30E2:
      Result := CLetter + #32 + 'Mo';
    $30E3:
      Result := CLetter + #32 + CSmall + #32 + 'Ya';
    $30E4:
      Result := CLetter + #32 + 'Ya';
    $30E5:
      Result := CLetter + #32 + CSmall + #32 + 'Yu';
    $30E6:
      Result := CLetter + #32 + 'Yu';
    $30E7:
      Result := CLetter + #32 + CSmall + #32 + 'Yo';
    $30E8:
      Result := CLetter + #32 + 'Yo';
    $30E9:
      Result := CLetter + #32 + 'Ra';
    $30EA:
      Result := CLetter + #32 + 'Ri';
    $30EB:
      Result := CLetter + #32 + 'Ru';
    $30EC:
      Result := CLetter + #32 + 'Re';
    $30ED:
      Result := CLetter + #32 + 'Ro';
    $30EE:
      Result := CLetter + #32 + CSmall + #32 + 'Wa';
    $30EF:
      Result := CLetter + #32 + 'Wa';
    $30F0:
      Result := CLetter + #32 + 'Wi';
    $30F1:
      Result := CLetter + #32 + 'We';
    $30F2:
      Result := CLetter + #32 + 'Wo';
    $30F3:
      Result := CLetter + #32 + 'N';
    $30F4:
      Result := CLetter + #32 + 'Vu';
    $30F5:
      Result := CLetter + #32 + CSmall + #32 + 'Ka';
    $30F6:
      Result := CLetter + #32 + CSmall + #32 + 'Ke';
    $30F7:
      Result := CLetter + #32 + 'Va';
    $30F8:
      Result := CLetter + #32 + 'Vi';
    $30F9:
      Result := CLetter + #32 + 'Ve';
    $30FA:
      Result := CLetter + #32 + 'Vo';
    $30FB:
      Result := 'Middle Dot';
    $30FD:
      Result := 'Iteration Mark';
    $30FE:
      Result := 'Voiced Iteration Mark';
  end;

  // add 'Katakana' to string
  if Result <> '' then
    Result := 'Katakana' + #32 + Result;
end;

function GetBopomofoUnicodeName(Value: Word): string;
begin
  case Value of
    $3105:
      Result := CLetter + #32 + 'B';
    $3106:
      Result := CLetter + #32 + 'P';
    $3107:
      Result := CLetter + #32 + 'M';
    $3108:
      Result := CLetter + #32 + 'F';
    $3109:
      Result := CLetter + #32 + 'D';
    $310A:
      Result := CLetter + #32 + 'T';
    $310B:
      Result := CLetter + #32 + 'N';
    $310C:
      Result := CLetter + #32 + 'L';
    $310D:
      Result := CLetter + #32 + 'G';
    $310E:
      Result := CLetter + #32 + 'K';
    $310F:
      Result := CLetter + #32 + 'H';
    $3110:
      Result := CLetter + #32 + 'J';
    $3111:
      Result := CLetter + #32 + 'Q';
    $3112:
      Result := CLetter + #32 + 'X';
    $3113:
      Result := CLetter + #32 + 'Zh';
    $3114:
      Result := CLetter + #32 + 'Ch';
    $3115:
      Result := CLetter + #32 + 'Sh';
    $3116:
      Result := CLetter + #32 + 'R';
    $3117:
      Result := CLetter + #32 + 'Z';
    $3118:
      Result := CLetter + #32 + 'C';
    $3119:
      Result := CLetter + #32 + 'S';
    $311A:
      Result := CLetter + #32 + 'A';
    $311B:
      Result := CLetter + #32 + 'O';
    $311C:
      Result := CLetter + #32 + 'E';
    $311D:
      Result := CLetter + #32 + 'Eh';
    $311E:
      Result := CLetter + #32 + 'Ai';
    $311F:
      Result := CLetter + #32 + 'Ei';
    $3120:
      Result := CLetter + #32 + 'Au';
    $3121:
      Result := CLetter + #32 + 'Ou';
    $3122:
      Result := CLetter + #32 + 'An';
    $3123:
      Result := CLetter + #32 + 'En';
    $3124:
      Result := CLetter + #32 + 'Ang';
    $3125:
      Result := CLetter + #32 + 'Eng';
    $3126:
      Result := CLetter + #32 + 'Er';
    $3127:
      Result := CLetter + #32 + 'I';
    $3128:
      Result := CLetter + #32 + 'U';
    $3129:
      Result := CLetter + #32 + 'Iu';
    $312A:
      Result := CLetter + #32 + 'V';
    $312B:
      Result := CLetter + #32 + 'Ng';
    $312C:
      Result := CLetter + #32 + 'Gn';
  end;

  // add 'Bopomofo' to string
  if Result <> '' then
    Result := 'Bopomofo' + #32 + Result;
end;

function GetHangzhouUnicodeName(Value: Word): string;
begin
  case Value of
    $3021:
      Result := 'Numeral One';
    $3022:
      Result := 'Numeral Two';
    $3023:
      Result := 'Numeral Three';
    $3024:
      Result := 'Numeral Four';
    $3025:
      Result := 'Numeral Five';
    $3026:
      Result := 'Numeral Six';
    $3027:
      Result := 'Numeral Seven';
    $3028:
      Result := 'Numeral Eight';
    $3029:
      Result := 'Numeral Nine';
  end;

  // add 'Hangzhou' to string
  if Result <> '' then
    Result := 'Hangzhou' + #32 + Result;
end;

function GetHangulChoseongUnicodeName(Value: Word): string;
begin
  case Value of
    $1100:
      Result := 'Kiyeok';
    $1101:
      Result := 'Ssangkiyeok';
    $1102:
      Result := 'Nieun';
    $1103:
      Result := 'Tikeut';
    $1104:
      Result := 'Ssangtikeut';
    $1105:
      Result := 'Rieul';
    $1106:
      Result := 'Mieum';
    $1107:
      Result := 'Pieup';
    $1108:
      Result := 'Ssangpieup';
    $1109:
      Result := 'Sios';
    $110A:
      Result := 'Ssangsios';
    $110B:
      Result := 'Ieung';
    $110C:
      Result := 'Cieuc';
    $110D:
      Result := 'Ssangcieuc';
    $110E:
      Result := 'Chieuch';
    $110F:
      Result := 'Khieukh';
    $1110:
      Result := 'Thieuth';
    $1111:
      Result := 'Phieuph';
    $1112:
      Result := 'Hieuh';
    $1113:
      Result := 'Nieun-Kiyeok';
    $1114:
      Result := 'Ssangnieun';
    $1115:
      Result := 'Nieun-Tikeut';
    $1116:
      Result := 'Nieun-Pieup';
    $1117:
      Result := 'Tikeut-Kiyeok';
    $1118:
      Result := 'Rieul-Nieun';
    $1119:
      Result := 'Ssangrieul';
    $111A:
      Result := 'Rieul-Hieuh';
    $111B:
      Result := 'Kapyeounrieul';
    $111C:
      Result := 'Mieum-Pieup';
    $111D:
      Result := 'Kapyeounmieum';
    $111E:
      Result := 'Pieup-Kiyeok';
    $111F:
      Result := 'Pieup-Nieun';
    $1120:
      Result := 'Pieup-Tikeut';
    $1121:
      Result := 'Pieup-Sios';
    $1122:
      Result := 'Pieup-Sios-Kiyeok';
    $1123:
      Result := 'Pieup-Sios-Tikeut';
    $1124:
      Result := 'Pieup-Sios-Pieup';
    $1125:
      Result := 'Pieup-Ssangsios';
    $1126:
      Result := 'Pieup-Sios-Cieuc';
    $1127:
      Result := 'Pieup-Cieuc';
    $1128:
      Result := 'Pieup-Chieuch';
    $1129:
      Result := 'Pieup-Thieuth';
    $112A:
      Result := 'Pieup-Phieuph';
    $112B:
      Result := 'Kapyeounpieup';
    $112C:
      Result := 'Kapyeounssangpieup';
    $112D:
      Result := 'Sios-Kiyeok';
    $112E:
      Result := 'Sios-Nieun';
    $112F:
      Result := 'Sios-Tikeut';
    $1130:
      Result := 'Sios-Rieul';
    $1131:
      Result := 'Sios-Mieum';
    $1132:
      Result := 'Sios-Pieup';
    $1133:
      Result := 'Sios-Pieup-Kiyeok';
    $1134:
      Result := 'Sios-Ssangsios';
    $1135:
      Result := 'Sios-Ieung';
    $1136:
      Result := 'Sios-Cieuc';
    $1137:
      Result := 'Sios-Chieuch';
    $1138:
      Result := 'Sios-Khieukh';
    $1139:
      Result := 'Sios-Thieuth';
    $113A:
      Result := 'Sios-Phieuph';
    $113B:
      Result := 'Sios-Hieuh';
    $113C:
      Result := 'Chitueumsios';
    $113D:
      Result := 'Chitueumssangsios';
    $113E:
      Result := 'Ceongchieumsios';
    $113F:
      Result := 'Ceongchieumssangsios';
    $1140:
      Result := 'Pansios';
    $1141:
      Result := 'Ieung-Kiyeok';
    $1142:
      Result := 'Ieung-Tikeut';
    $1143:
      Result := 'Ieung-Mieum';
    $1144:
      Result := 'Ieung-Pieup';
    $1145:
      Result := 'Ieung-Sios';
    $1146:
      Result := 'Ieung-Pansios';
    $1147:
      Result := 'Ssangieung';
    $1148:
      Result := 'Ieung-Cieuc';
    $1149:
      Result := 'Ieung-Chieuch';
    $114A:
      Result := 'Ieung-Thieuth';
    $114B:
      Result := 'Ieung-Phieuph';
    $114C:
      Result := 'Yesieung';
    $114D:
      Result := 'Cieuc-Ieung';
    $114E:
      Result := 'Chitueumcieuc';
    $114F:
      Result := 'Chitueumssangcieuc';
    $1150:
      Result := 'Ceongchieumcieuc';
    $1151:
      Result := 'Ceongchieumssangcieuc';
    $1152:
      Result := 'Chieuch-Khieukh';
    $1153:
      Result := 'Chieuch-Hieuh';
    $1154:
      Result := 'Chitueumchieuch';
    $1155:
      Result := 'Ceongchieumchieuch';
    $1156:
      Result := 'Phieuph-Pieup';
    $1157:
      Result := 'Kapyeounphieuph';
    $1158:
      Result := 'Ssanghieuh';
    $1159:
      Result := 'Yeorinhieuh';
    $115F:
      Result := 'Filler';
  end;

  // add 'Choseong' to string
  if Result <> '' then
    Result := 'Choseong' + #32 + Result;
end;

function GetHangulUnicodeName(Value: Word): string;
const
  CJungseong: string = 'Jungseong';
  CJongseong: string = 'Jongseong';
begin
  case Value of
    $1100..$115F:
      Result := GetHangulChoseongUnicodeName(Value);
    $1160:
      Result := CJungseong + #32 + 'Filler';
    $1161:
      Result := CJungseong + #32 + 'A';
    $1162:
      Result := CJungseong + #32 + 'Ae';
    $1163:
      Result := CJungseong + #32 + 'Ya';
    $1164:
      Result := CJungseong + #32 + 'Yae';
    $1165:
      Result := CJungseong + #32 + 'Eo';
    $1166:
      Result := CJungseong + #32 + 'E';
    $1167:
      Result := CJungseong + #32 + 'Yeo';
    $1168:
      Result := CJungseong + #32 + 'Ye';
    $1169:
      Result := CJungseong + #32 + 'O';
    $116A:
      Result := CJungseong + #32 + 'Wa';
    $116B:
      Result := CJungseong + #32 + 'Wae';
    $116C:
      Result := CJungseong + #32 + 'Oe';
    $116D:
      Result := CJungseong + #32 + 'Yo';
    $116E:
      Result := CJungseong + #32 + 'U';
    $116F:
      Result := CJungseong + #32 + 'Weo';
    $1170:
      Result := CJungseong + #32 + 'We';
    $1171:
      Result := CJungseong + #32 + 'Wi';
    $1172:
      Result := CJungseong + #32 + 'Yu';
    $1173:
      Result := CJungseong + #32 + 'Eu';
    $1174:
      Result := CJungseong + #32 + 'Yi';
    $1175:
      Result := CJungseong + #32 + 'I';
    $1176:
      Result := CJungseong + #32 + 'A-O';
    $1177:
      Result := CJungseong + #32 + 'A-U';
    $1178:
      Result := CJungseong + #32 + 'Ya-O';
    $1179:
      Result := CJungseong + #32 + 'Ya-Yo';
    $117A:
      Result := CJungseong + #32 + 'Eo-O';
    $117B:
      Result := CJungseong + #32 + 'Eo-U';
    $117C:
      Result := CJungseong + #32 + 'Eo-Eu';
    $117D:
      Result := CJungseong + #32 + 'Yeo-O';
    $117E:
      Result := CJungseong + #32 + 'Yeo-U';
    $117F:
      Result := CJungseong + #32 + 'O-Eo';
    $1180:
      Result := CJungseong + #32 + 'O-E';
    $1181:
      Result := CJungseong + #32 + 'O-Ye';
    $1182:
      Result := CJungseong + #32 + 'O-O';
    $1183:
      Result := CJungseong + #32 + 'O-U';
    $1184:
      Result := CJungseong + #32 + 'Yo-Ya';
    $1185:
      Result := CJungseong + #32 + 'Yo-Yae';
    $1186:
      Result := CJungseong + #32 + 'Yo-Yeo';
    $1187:
      Result := CJungseong + #32 + 'Yo-O';
    $1188:
      Result := CJungseong + #32 + 'Yo-I';
    $1189:
      Result := CJungseong + #32 + 'U-A';
    $118A:
      Result := CJungseong + #32 + 'U-Ae';
    $118B:
      Result := CJungseong + #32 + 'U-Eo-Eu';
    $118C:
      Result := CJungseong + #32 + 'U-Ye';
    $118D:
      Result := CJungseong + #32 + 'U-U';
    $118E:
      Result := CJungseong + #32 + 'Yu-A';
    $118F:
      Result := CJungseong + #32 + 'Yu-Eo';
    $1190:
      Result := CJungseong + #32 + 'Yu-E';
    $1191:
      Result := CJungseong + #32 + 'Yu-Yeo';
    $1192:
      Result := CJungseong + #32 + 'Yu-Ye';
    $1193:
      Result := CJungseong + #32 + 'Yu-U';
    $1194:
      Result := CJungseong + #32 + 'Yu-I';
    $1195:
      Result := CJungseong + #32 + 'Eu-U';
    $1196:
      Result := CJungseong + #32 + 'Eu-Eu';
    $1197:
      Result := CJungseong + #32 + 'Yi-U';
    $1198:
      Result := CJungseong + #32 + 'I-A';
    $1199:
      Result := CJungseong + #32 + 'I-Ya';
    $119A:
      Result := CJungseong + #32 + 'I-O';
    $119B:
      Result := CJungseong + #32 + 'I-U';
    $119C:
      Result := CJungseong + #32 + 'I-Eu';
    $119D:
      Result := CJungseong + #32 + 'I-Araea';
    $119E:
      Result := CJungseong + #32 + 'Araea';
    $119F:
      Result := CJungseong + #32 + 'Araea-Eo';
    $11A0:
      Result := CJungseong + #32 + 'Araea-U';
    $11A1:
      Result := CJungseong + #32 + 'Araea-I';
    $11A2:
      Result := CJungseong + #32 + 'Ssangaraea';
    $11A8:
      Result := CJongseong + #32 + 'Kiyeok';
    $11A9:
      Result := CJongseong + #32 + 'Ssangkiyeok';
    $11AA:
      Result := CJongseong + #32 + 'Kiyeok-Sios';
    $11AB:
      Result := CJongseong + #32 + 'Nieun';
    $11AC:
      Result := CJongseong + #32 + 'Nieun-Cieuc';
    $11AD:
      Result := CJongseong + #32 + 'Nieun-Hieuh';
    $11AE:
      Result := CJongseong + #32 + 'Tikeut';
    $11AF:
      Result := CJongseong + #32 + 'Rieul';
    $11B0:
      Result := CJongseong + #32 + 'Rieul-Kiyeok';
    $11B1:
      Result := CJongseong + #32 + 'Rieul-Mieum';
    $11B2:
      Result := CJongseong + #32 + 'Rieul-Pieup';
    $11B3:
      Result := CJongseong + #32 + 'Rieul-Sios';
    $11B4:
      Result := CJongseong + #32 + 'Rieul-Thieuth';
    $11B5:
      Result := CJongseong + #32 + 'Rieul-Phieuph';
    $11B6:
      Result := CJongseong + #32 + 'Rieul-Hieuh';
    $11B7:
      Result := CJongseong + #32 + 'Mieum';
    $11B8:
      Result := CJongseong + #32 + 'Pieup';
    $11B9:
      Result := CJongseong + #32 + 'Pieup-Sios';
    $11BA:
      Result := CJongseong + #32 + 'Sios';
    $11BB:
      Result := CJongseong + #32 + 'Ssangsios';
    $11BC:
      Result := CJongseong + #32 + 'Ieung';
    $11BD:
      Result := CJongseong + #32 + 'Cieuc';
    $11BE:
      Result := CJongseong + #32 + 'Chieuch';
    $11BF:
      Result := CJongseong + #32 + 'Khieukh';
    $11C0:
      Result := CJongseong + #32 + 'Thieuth';
    $11C1:
      Result := CJongseong + #32 + 'Phieuph';
    $11C2:
      Result := CJongseong + #32 + 'Hieuh';
    $11C3:
      Result := CJongseong + #32 + 'Kiyeok-Rieul';
    $11C4:
      Result := CJongseong + #32 + 'Kiyeok-Sios-Kiyeok';
    $11C5:
      Result := CJongseong + #32 + 'Nieun-Kiyeok';
    $11C6:
      Result := CJongseong + #32 + 'Nieun-Tikeut';
    $11C7:
      Result := CJongseong + #32 + 'Nieun-Sios';
    $11C8:
      Result := CJongseong + #32 + 'Nieun-Pansios';
    $11C9:
      Result := CJongseong + #32 + 'Nieun-Thieuth';
    $11CA:
      Result := CJongseong + #32 + 'Tikeut-Kiyeok';
    $11CB:
      Result := CJongseong + #32 + 'Tikeut-Rieul';
    $11CC:
      Result := CJongseong + #32 + 'Rieul-Kiyeok-Sios';
    $11CD:
      Result := CJongseong + #32 + 'Rieul-Nieun';
    $11CE:
      Result := CJongseong + #32 + 'Rieul-Tikeut';
    $11CF:
      Result := CJongseong + #32 + 'Rieul-Tikeut-Hieuh';
    $11D0:
      Result := CJongseong + #32 + 'Ssangrieul';
    $11D1:
      Result := CJongseong + #32 + 'Rieul-Mieum-Kiyeok';
    $11D2:
      Result := CJongseong + #32 + 'Rieul-Mieum-Sios';
    $11D3:
      Result := CJongseong + #32 + 'Rieul-Pieup-Sios';
    $11D4:
      Result := CJongseong + #32 + 'Rieul-Pieup-Hieuh';
    $11D5:
      Result := CJongseong + #32 + 'Rieul-Kapyeounpieup';
    $11D6:
      Result := CJongseong + #32 + 'Rieul-Ssangsios';
    $11D7:
      Result := CJongseong + #32 + 'Rieul-Pansios';
    $11D8:
      Result := CJongseong + #32 + 'Rieul-Khieukh';
    $11D9:
      Result := CJongseong + #32 + 'Rieul-Yeorinhieuh';
    $11DA:
      Result := CJongseong + #32 + 'Mieum-Kiyeok';
    $11DB:
      Result := CJongseong + #32 + 'Mieum-Rieul';
    $11DC:
      Result := CJongseong + #32 + 'Mieum-Pieup';
    $11DD:
      Result := CJongseong + #32 + 'Mieum-Sios';
    $11DE:
      Result := CJongseong + #32 + 'Mieum-Ssangsios';
    $11DF:
      Result := CJongseong + #32 + 'Mieum-Pansios';
    $11E0:
      Result := CJongseong + #32 + 'Mieum-Chieuch';
    $11E1:
      Result := CJongseong + #32 + 'Mieum-Hieuh';
    $11E2:
      Result := CJongseong + #32 + 'Kapyeounmieum';
    $11E3:
      Result := CJongseong + #32 + 'Pieup-Rieul';
    $11E4:
      Result := CJongseong + #32 + 'Pieup-Phieuph';
    $11E5:
      Result := CJongseong + #32 + 'Pieup-Hieuh';
    $11E6:
      Result := CJongseong + #32 + 'Kapyeounpieup';
    $11E7:
      Result := CJongseong + #32 + 'Sios-Kiyeok';
    $11E8:
      Result := CJongseong + #32 + 'Sios-Tikeut';
    $11E9:
      Result := CJongseong + #32 + 'Sios-Rieul';
    $11EA:
      Result := CJongseong + #32 + 'Sios-Pieup';
    $11EB:
      Result := CJongseong + #32 + 'Pansios';
    $11EC:
      Result := CJongseong + #32 + 'Ieung-Kiyeok';
    $11ED:
      Result := CJongseong + #32 + 'Ieung-Ssangkiyeok';
    $11EE:
      Result := CJongseong + #32 + 'Ssangieung';
    $11EF:
      Result := CJongseong + #32 + 'Ieung-Khieukh';
    $11F0:
      Result := CJongseong + #32 + 'Yesieung';
    $11F1:
      Result := CJongseong + #32 + 'Yesieung-Sios';
    $11F2:
      Result := CJongseong + #32 + 'Yesieung-Pansios';
    $11F3:
      Result := CJongseong + #32 + 'Phieuph-Pieup';
    $11F4:
      Result := CJongseong + #32 + 'Kapyeounphieuph';
    $11F5:
      Result := CJongseong + #32 + 'Hieuh-Nieun';
    $11F6:
      Result := CJongseong + #32 + 'Hieuh-Rieul';
    $11F7:
      Result := CJongseong + #32 + 'Hieuh-Mieum';
    $11F8:
      Result := CJongseong + #32 + 'Hieuh-Pieup';
    $11F9:
      Result := CJongseong + #32 + 'Yeorinhieuh';
    $302E:
      Result := 'Single Dot Tone Mark';
    $302F:
      Result := 'Double Dot Tone Mark';
    $3131:
      Result := CLetter + #32 + 'Kiyeok';
    $3132:
      Result := CLetter + #32 + 'Ssangkiyeok';
    $3133:
      Result := CLetter + #32 + 'Kiyeok-Sios';
    $3134:
      Result := CLetter + #32 + 'Nieun';
    $3135:
      Result := CLetter + #32 + 'Nieun-Cieuc';
    $3136:
      Result := CLetter + #32 + 'Nieun-Hieuh';
    $3137:
      Result := CLetter + #32 + 'Tikeut';
    $3138:
      Result := CLetter + #32 + 'Ssangtikeut';
    $3139:
      Result := CLetter + #32 + 'Rieul';
    $313A:
      Result := CLetter + #32 + 'Rieul-Kiyeok';
    $313B:
      Result := CLetter + #32 + 'Rieul-Mieum';
    $313C:
      Result := CLetter + #32 + 'Rieul-Pieup';
    $313D:
      Result := CLetter + #32 + 'Rieul-Sios';
    $313E:
      Result := CLetter + #32 + 'Rieul-Thieuth';
    $313F:
      Result := CLetter + #32 + 'Rieul-Phieuph';
    $3140:
      Result := CLetter + #32 + 'Rieul-Hieuh';
    $3141:
      Result := CLetter + #32 + 'Mieum';
    $3142:
      Result := CLetter + #32 + 'Pieup';
    $3143:
      Result := CLetter + #32 + 'Ssangpieup';
    $3144:
      Result := CLetter + #32 + 'Pieup-Sios';
    $3145:
      Result := CLetter + #32 + 'Sios';
    $3146:
      Result := CLetter + #32 + 'Ssangsios';
    $3147:
      Result := CLetter + #32 + 'Ieung';
    $3148:
      Result := CLetter + #32 + 'Cieuc';
    $3149:
      Result := CLetter + #32 + 'Ssangcieuc';
    $314A:
      Result := CLetter + #32 + 'Chieuch';
    $314B:
      Result := CLetter + #32 + 'Khieukh';
    $314C:
      Result := CLetter + #32 + 'Thieuth';
    $314D:
      Result := CLetter + #32 + 'Phieuph';
    $314E:
      Result := CLetter + #32 + 'Hieuh';
    $314F:
      Result := CLetter + #32 + 'A';
    $3150:
      Result := CLetter + #32 + 'Ae';
    $3151:
      Result := CLetter + #32 + 'Ya';
    $3152:
      Result := CLetter + #32 + 'Yae';
    $3153:
      Result := CLetter + #32 + 'Eo';
    $3154:
      Result := CLetter + #32 + 'E';
    $3155:
      Result := CLetter + #32 + 'Yeo';
    $3156:
      Result := CLetter + #32 + 'Ye';
    $3157:
      Result := CLetter + #32 + 'O';
    $3158:
      Result := CLetter + #32 + 'Wa';
    $3159:
      Result := CLetter + #32 + 'Wae';
    $315A:
      Result := CLetter + #32 + 'Oe';
    $315B:
      Result := CLetter + #32 + 'Yo';
    $315C:
      Result := CLetter + #32 + 'U';
    $315D:
      Result := CLetter + #32 + 'Weo';
    $315E:
      Result := CLetter + #32 + 'We';
    $315F:
      Result := CLetter + #32 + 'Wi';
    $3160:
      Result := CLetter + #32 + 'Yu';
    $3161:
      Result := CLetter + #32 + 'Eu';
    $3162:
      Result := CLetter + #32 + 'Yi';
    $3163:
      Result := CLetter + #32 + 'I';
    $3164:
      Result := 'Filler';
    $3165:
      Result := CLetter + #32 + 'Ssangnieun';
    $3166:
      Result := CLetter + #32 + 'Nieun-Tikeut';
    $3167:
      Result := CLetter + #32 + 'Nieun-Sios';
    $3168:
      Result := CLetter + #32 + 'Nieun-Pansios';
    $3169:
      Result := CLetter + #32 + 'Rieul-Kiyeok-Sios';
    $316A:
      Result := CLetter + #32 + 'Rieul-Tikeut';
    $316B:
      Result := CLetter + #32 + 'Rieul-Pieup-Sios';
    $316C:
      Result := CLetter + #32 + 'Rieul-Pansios';
    $316D:
      Result := CLetter + #32 + 'Rieul-Yeorinhieuh';
    $316E:
      Result := CLetter + #32 + 'Mieum-Pieup';
    $316F:
      Result := CLetter + #32 + 'Mieum-Sios';
    $3170:
      Result := CLetter + #32 + 'Mieum-Pansios';
    $3171:
      Result := CLetter + #32 + 'Kapyeounmieum';
    $3172:
      Result := CLetter + #32 + 'Pieup-Kiyeok';
    $3173:
      Result := CLetter + #32 + 'Pieup-Tikeut';
    $3174:
      Result := CLetter + #32 + 'Pieup-Sios-Kiyeok';
    $3175:
      Result := CLetter + #32 + 'Pieup-Sios-Tikeut';
    $3176:
      Result := CLetter + #32 + 'Pieup-Cieuc';
    $3177:
      Result := CLetter + #32 + 'Pieup-Thieuth';
    $3178:
      Result := CLetter + #32 + 'Kapyeounpieup';
    $3179:
      Result := CLetter + #32 + 'Kapyeounssangpieup';
    $317A:
      Result := CLetter + #32 + 'Sios-Kiyeok';
    $317B:
      Result := CLetter + #32 + 'Sios-Nieun';
    $317C:
      Result := CLetter + #32 + 'Sios-Tikeut';
    $317D:
      Result := CLetter + #32 + 'Sios-Pieup';
    $317E:
      Result := CLetter + #32 + 'Sios-Cieuc';
    $317F:
      Result := CLetter + #32 + 'Pansios';
    $3180:
      Result := CLetter + #32 + 'Ssangieung';
    $3181:
      Result := CLetter + #32 + 'Yesieung';
    $3182:
      Result := CLetter + #32 + 'Yesieung-Sios';
    $3183:
      Result := CLetter + #32 + 'Yesieung-Pansios';
    $3184:
      Result := CLetter + #32 + 'Kapyeounphieuph';
    $3185:
      Result := CLetter + #32 + 'Ssanghieuh';
    $3186:
      Result := CLetter + #32 + 'Yeorinhieuh';
    $3187:
      Result := CLetter + #32 + 'Yo-Ya';
    $3188:
      Result := CLetter + #32 + 'Yo-Yae';
    $3189:
      Result := CLetter + #32 + 'Yo-I';
    $318A:
      Result := CLetter + #32 + 'Yu-Yeo';
    $318B:
      Result := CLetter + #32 + 'Yu-Ye';
    $318C:
      Result := CLetter + #32 + 'Yu-I';
    $318D:
      Result := CLetter + #32 + 'Araea';
    $318E:
      Result := CLetter + #32 + 'Araeae';
  end;

  // add CHangul + '' to string
  if Result <> '' then
    Result := CHangul + #32 + Result;
end;

function GetUnicodeName(Value: Word): string;
begin
  case Value of
    $0020:
      Result := 'Space';
    $0021:
      Result := 'Exclamation Mark';
    $0022:
      Result := 'Quotation Mark';
    $0023:
      Result := CNumber + #32 + 'Sign';
    $0024:
      Result := 'Dollar Sign';
    $0025:
      Result := 'Percent Sign';
    $0026:
      Result := 'Ampersand';
    $0027:
      Result := 'Apostrophe';
    $0028:
      Result := CLeft + #32 + 'Parenthesis';
    $0029:
      Result := CRight + #32 + 'Parenthesis';
    $002A:
      Result := 'Asterisk';
    $002B:
      Result := 'Plus Sign';
    $002C:
      Result := 'Comma';
    $002D:
      Result := 'Hyphen-Minus';
    $002E:
      Result := 'Full Stop';
    $002F:
      Result := 'Solidus';
    $0030:
      Result := CDigit + #32 + 'Zero';
    $0031:
      Result := CDigit + #32 + 'One';
    $0032:
      Result := CDigit + #32 + 'Two';
    $0033:
      Result := CDigit + #32 + 'Three';
    $0034:
      Result := CDigit + #32 + 'Four';
    $0035:
      Result := CDigit + #32 + 'Five';
    $0036:
      Result := CDigit + #32 + 'Six';
    $0037:
      Result := CDigit + #32 + 'Seven';
    $0038:
      Result := CDigit + #32 + 'Eight';
    $0039:
      Result := CDigit + #32 + 'Nine';
    $003A:
      Result := 'Colon';
    $003B:
      Result := 'Semicolon';
    $003C:
      Result := 'Less-Than Sign';
    $003D:
      Result := 'Equals Sign';
    $003E:
      Result := 'Greater-Than Sign';
    $003F:
      Result := 'Question Mark';
    $0040:
      Result := 'Commercial At';
    $0041..$005A:
      Result := GetLatinUnicodeName(Value);
    $005B:
      Result := CLeft + #32 + CSquare + #32 + 'Bracket';
    $005C:
      Result := 'Reverse Solidus';
    $005D:
      Result := CRight + #32 + CSquare + #32 + 'Bracket';
    $005E:
      Result := CCircumflex + #32 + 'Accent';
    $005F:
      Result := 'Low Line';
    $0060:
      Result := 'Grave Accent';
    $0061..$007A:
      Result := GetLatinUnicodeName(Value);
    $007B:
      Result := CLeft + #32 + 'Curly Bracket';
    $007C:
      Result := 'Vertical Line';
    $007D:
      Result := CRight + #32 + 'Curly Bracket';
    $007E:
      Result := CTilde;
    $00A0:
      Result := 'No-Break Space';
    $00A1:
      Result := 'Inverted Exclamation Mark';
    $00A2:
      Result := 'Cent Sign';
    $00A3:
      Result := 'Pound Sign';
    $00A4:
      Result := 'Currency Sign';
    $00A5:
      Result := 'Yen Sign';
    $00A6:
      Result := 'Broken Bar';
    $00A7:
      Result := 'Section Sign';
    $00A8:
      Result := CDiaeresis;
    $00A9:
      Result := 'Copyright Sign';
    $00AA:
      Result := 'Feminine Ordinal Indicator';
    $00AB:
      Result := 'Left-Pointing Double Angle Quotation Mark';
    $00AC:
      Result := 'Not Sign';
    $00AD:
      Result := 'Soft Hyphen';
    $00AE:
      Result := 'Registered Sign';
    $00AF:
      Result := 'Macron';
    $00B0:
      Result := 'Degree Sign';
    $00B1:
      Result := 'Plus-Minus Sign';
    $00B2:
      Result := 'Superscript Two';
    $00B3:
      Result := 'Superscript Three';
    $00B4:
      Result := 'Acute Accent';
    $00B5:
      Result := 'Micro Sign';
    $00B6:
      Result := 'Pilcrow Sign';
    $00B7:
      Result := 'Middle Dot';
    $00B8:
      Result := CCedilla;
    $00B9:
      Result := 'Superscript One';
    $00BA:
      Result := 'Masculine Ordinal Indicator';
    $00BB:
      Result := 'Right-Pointing Double Angle Quotation Mark';
    $00BC:
      Result := 'Vulgar Fraction One Quarter';
    $00BD:
      Result := 'Vulgar Fraction One Half';
    $00BE:
      Result := 'Vulgar Fraction Three Quarters';
    $00BF:
      Result := 'Inverted Question Mark';
    $00C0..$00D6:
      Result := GetLatinUnicodeName(Value);
    $00D7:
      Result := 'Multiplication Sign';
    $00D8..$00F6:
      Result := GetLatinUnicodeName(Value);
    $00F7:
      Result := 'Division Sign';
    $00F8..$02AF:
      Result := GetLatinUnicodeName(Value);
    $02B0..$02C6:
      Result := GetModifierUnicodeName(Value);
    $02C7:
      Result := 'Caron';
    $02C8..$02D7:
      Result := GetModifierUnicodeName(Value);
    $02D8:
      Result := 'Breve';
    $02D9:
      Result := 'Dot Above';
    $02DA:
      Result := 'Ring Above';
    $02DB:
      Result := 'Ogonek';
    $02DC:
      Result := CSmall + #32 + CTilde;
    $02DD:
      Result := 'Double Acute Accent';
    $02DE..$02E9:
      Result := GetModifierUnicodeName(Value);
    $0300..$0361:
      Result := GetCombiningUnicodeName(Value);
    $0374..$03E0:
      Result := GetGreekUnicodeName(Value);
    $03E2..$03EF:
      Result := GetCopticUnicodeName(Value);
    $03F0..$03F3:
      Result := GetGreekUnicodeName(Value);
    $0401..$0482:
      Result := GetCyrillicUnicodeName(Value);
    $0483..$0486:
      Result := GetCombiningUnicodeName(Value);
    $0490..$04F9:
      Result := GetCyrillicUnicodeName(Value);
    $0531..$0589:
      Result := GetArmenianUnicodeName(Value);
    $05B0..$05F4:
      Result := GetHebrewUnicodeName(Value);
    $060C..$0652:
      Result := GetArabicUnicodeName(Value);
    $0660..$0669:
      Result := GetArabicIndicDigitUnicodeName(Value);
    $066A..$06ED:
      Result := GetArabicUnicodeName(Value);
    $06F0..$06F9:
      Result := GetExtendedArabicIndicDigitUnicodeName(Value);
    $0901..$0970:
      Result := GetDevanagariUnicodeName(Value);
    $0981..$09FA:
      Result := GetBengaliUnicodeName(Value);
    $0A02..$0A74:
      Result := GetGurmukhiUnicodeName(Value);
    $0A81..$0AEF:
      Result := GetGujaratiUnicodeName(Value);
    $0B01..$0B70:
      Result := GetOriyaUnicodeName(Value);
    $0B82..$0BF2:
      Result := GetTamilUnicodeName(Value);
    $0C01..$0C6F:
      Result := GetTeluguUnicodeName(Value);
    $0C82..$0CEF:
      Result := GetKannadaUnicodeName(Value);
    $0D02..$0D6F:
      Result := GetMalayalamUnicodeName(Value);
    $0E01..$0E5B:
      Result := GetThaiUnicodeName(Value);
    $0E81..$0EDD:
      Result := GetLaoUnicodeName(Value);
    $10A0..$10FB:
      Result := GetGeorgianUnicodeName(Value);
    $1100..$11F9:
      Result := GetHangulUnicodeName(Value);
    $1E00..$1EF9:
      Result := GetLatinUnicodeName(Value);
    $1F00..$1FFE:
      Result := GetGreekUnicodeName(Value);
    $2000:
      Result := 'En Quad';
    $2001:
      Result := 'Em Quad';
    $2002:
      Result := 'En Space';
    $2003:
      Result := 'Em Space';
    $2004:
      Result := 'Three-Per-Em Space';
    $2005:
      Result := 'Four-Per-Em Space';
    $2006:
      Result := 'Six-Per-Em Space';
    $2007:
      Result := 'Figure Space';
    $2008:
      Result := 'Punctuation Space';
    $2009:
      Result := 'Thin Space';
    $200A:
      Result := 'Hair Space';
    $200B:
      Result := 'Zero Width Space';
    $200C:
      Result := 'Zero Width Non-Joiner';
    $200D:
      Result := 'Zero Width Joiner';
    $200E:
      Result := 'Left-To-Right Mark';
    $200F:
      Result := 'Right-To-Left Mark';
    $2010:
      Result := 'Hyphen';
    $2011:
      Result := 'Non-Breaking Hyphen';
    $2012:
      Result := 'Figure Dash';
    $2013:
      Result := 'En Dash';
    $2014:
      Result := 'Em Dash';
    $2015:
      Result := 'Horizontal Bar';
    $2016:
      Result := 'Double Vertical Line';
    $2017:
      Result := 'Double Low Line';
    $2018:
      Result := CLeft + #32 + 'Single Quotation Mark';
    $2019:
      Result := CRight + #32 + 'Single Quotation Mark';
    $201A:
      Result := 'Single Low-9 Quotation Mark';
    $201B:
      Result := 'Single High-Reversed-9 Quotation Mark';
    $201C:
      Result := CLeft + #32 + 'Double Quotation Mark';
    $201D:
      Result := CRight + #32 + 'Double Quotation Mark';
    $201E:
      Result := 'Double Low-9 Quotation Mark';
    $201F:
      Result := 'Double High-Reversed-9 Quotation Mark';
    $2020:
      Result := 'Dagger';
    $2021:
      Result := 'Double Dagger';
    $2022:
      Result := 'Bullet';
    $2023:
      Result := 'Triangular Bullet';
    $2024:
      Result := 'One Dot Leader';
    $2025:
      Result := 'Two Dot Leader';
    $2026:
      Result := 'Horizontal Ellipsis';
    $2027:
      Result := 'Hyphenation Point';
    $2028:
      Result := 'Line Separator';
    $2029:
      Result := 'Paragraph Separator';
    $202A:
      Result := 'Left-To-Right Embedding';
    $202B:
      Result := 'Right-To-Left Embedding';
    $202C:
      Result := 'Pop Directional Formatting';
    $202D:
      Result := 'Left-To-Right Override';
    $202E:
      Result := 'Right-To-Left Override';
    $2030:
      Result := 'Per Mille Sign';
    $2031:
      Result := 'Per Ten Thousand Sign';
    $2032:
      Result := 'Prime';
    $2033:
      Result := 'Double Prime';
    $2034:
      Result := 'Triple Prime';
    $2035:
      Result := 'Reversed Prime';
    $2036:
      Result := 'Reversed Double Prime';
    $2037:
      Result := 'Reversed Triple Prime';
    $2038:
      Result := 'Caret';
    $2039:
      Result := 'Single Left-Pointing Angle Quotation Mark';
    $203A:
      Result := 'Single Right-Pointing Angle Quotation Mark';
    $203B:
      Result := 'Reference Mark';
    $203C:
      Result := 'Double Exclamation Mark';
    $203D:
      Result := 'Interrobang';
    $203E:
      Result := 'Overline';
    $203F:
      Result := 'Undertie';
    $2040:
      Result := CCharacter + #32 + 'Tie';
    $2041:
      Result := 'Caret Insertion Point';
    $2042:
      Result := 'Asterism';
    $2043:
      Result := 'Hyphen Bullet';
    $2044:
      Result := 'Fraction Slash';
    $2045:
      Result := CLeft + #32 + CSquare + #32 + 'Bracket' + #32 + CWith + #32 + 'Quill';
    $2046:
      Result := CRight + #32 + CSquare + #32 + 'Bracket' + #32 + CWith + #32 + 'Quill';
    $206A:
      Result := 'Inhibit Symmetric Swapping';
    $206B:
      Result := 'Activate Symmetric Swapping';
    $206C:
      Result := 'Inhibit Arabic Form Shaping';
    $206D:
      Result := 'Activate Arabic Form Shaping';
    $206E:
      Result := 'National Digit Shapes';
    $206F:
      Result := 'Nominal Digit Shapes';
    $2070:
      Result := 'Superscript Zero';
    $2074:
      Result := 'Superscript Four';
    $2075:
      Result := 'Superscript Five';
    $2076:
      Result := 'Superscript Six';
    $2077:
      Result := 'Superscript Seven';
    $2078:
      Result := 'Superscript Eight';
    $2079:
      Result := 'Superscript Nine';
    $207A:
      Result := 'Superscript Plus Sign';
    $207B:
      Result := 'Superscript Minus';
    $207C:
      Result := 'Superscript Equals Sign';
    $207D:
      Result := 'Superscript' + #32 + CLeft + #32 + 'Parenthesis';
    $207E:
      Result := 'Superscript' + #32 + CRight + #32 + 'Parenthesis';
    $207F:
      Result := 'Superscript Latin Small' + #32 + CLetter + #32 + 'N';
    $2080:
      Result := 'Subscript Zero';
    $2081:
      Result := 'Subscript One';
    $2082:
      Result := 'Subscript Two';
    $2083:
      Result := 'Subscript Three';
    $2084:
      Result := 'Subscript Four';
    $2085:
      Result := 'Subscript Five';
    $2086:
      Result := 'Subscript Six';
    $2087:
      Result := 'Subscript Seven';
    $2088:
      Result := 'Subscript Eight';
    $2089:
      Result := 'Subscript Nine';
    $208A:
      Result := 'Subscript Plus Sign';
    $208B:
      Result := 'Subscript Minus';
    $208C:
      Result := 'Subscript Equals Sign';
    $208D:
      Result := 'Subscript' + #32 + CLeft + #32 + 'Parenthesis';
    $208E:
      Result := 'Subscript' + #32 + CRight + #32 + 'Parenthesis';
    $20A0:
      Result := 'Euro-Currency Sign';
    $20A1:
      Result := 'Colon Sign';
    $20A2:
      Result := 'Cruzeiro Sign';
    $20A3:
      Result := 'French Franc Sign';
    $20A4:
      Result := 'Lira Sign';
    $20A5:
      Result := 'Mill Sign';
    $20A6:
      Result := 'Naira Sign';
    $20A7:
      Result := 'Peseta Sign';
    $20A8:
      Result := 'Rupee Sign';
    $20A9:
      Result := 'Won Sign';
    $20AA:
      Result := 'New Sheqel Sign';
    $20D0..$20E1:
      Result := GetCombiningUnicodeName(Value);
    $2100:
      Result := 'Account Of';
    $2101:
      Result := 'Addressed To The Subject';
    $2102:
      Result := 'Double-Struck Capital C';
    $2103:
      Result := 'Degree Celsius';
    $2104:
      Result := 'Centre Line Symbol';
    $2105:
      Result := 'Care Of';
    $2106:
      Result := 'Cada Una';
    $2107:
      Result := 'Euler Constant';
    $2108:
      Result := 'Scruple';
    $2109:
      Result := 'Degree Fahrenheit';
    $210A:
      Result := 'Script Small G';
    $210B:
      Result := 'Script Capital H';
    $210C:
      Result := 'Black-Letter Capital H';
    $210D:
      Result := 'Double-Struck Capital H';
    $210E:
      Result := 'Planck Constant';
    $210F:
      Result := 'Planck Constant Over Two Pi';
    $2110:
      Result := 'Script Capital I';
    $2111:
      Result := 'Black-Letter Capital I';
    $2112:
      Result := 'Script Capital L';
    $2113:
      Result := 'Script Small L';
    $2114:
      Result := 'L B Bar Symbol';
    $2115:
      Result := 'Double-Struck Capital N';
    $2116:
      Result := 'Numero Sign';
    $2117:
      Result := 'Sound Recording Copyright';
    $2118:
      Result := 'Script Capital P';
    $2119:
      Result := 'Double-Struck Capital P';
    $211A:
      Result := 'Double-Struck Capital Q';
    $211B:
      Result := 'Script Capital R';
    $211C:
      Result := 'Black-Letter Capital R';
    $211D:
      Result := 'Double-Struck Capital R';
    $211E:
      Result := 'Prescription Take';
    $211F:
      Result := 'Response';
    $2120:
      Result := 'Service Mark';
    $2121:
      Result := 'Telephone Sign';
    $2122:
      Result := 'Trade Mark Sign';
    $2123:
      Result := 'Versicle';
    $2124:
      Result := 'Double-Struck Capital Z';
    $2125:
      Result := 'Ounce Sign';
    $2126:
      Result := 'Ohm Sign';
    $2127:
      Result := 'Inverted Ohm Sign';
    $2128:
      Result := 'Black-Letter Capital Z';
    $2129:
      Result := CTurned + #32 + 'Greek Small' + #32 + CLetter + #32 + 'Iota';
    $212A:
      Result := 'Kelvin Sign';
    $212B:
      Result := 'Angstrom Sign';
    $212C:
      Result := 'Script Capital B';
    $212D:
      Result := 'Black-Letter Capital C';
    $212E:
      Result := 'Estimated Symbol';
    $212F:
      Result := 'Script Small E';
    $2130:
      Result := 'Script Capital E';
    $2131:
      Result := 'Script Capital F';
    $2132:
      Result := CTurned + #32 + 'Capital F';
    $2133:
      Result := 'Script Capital M';
    $2134:
      Result := 'Script Small O';
    $2135:
      Result := 'Alef Symbol';
    $2136:
      Result := 'Bet Symbol';
    $2137:
      Result := 'Gimel Symbol';
    $2138:
      Result := 'Dalet Symbol';
    $2153:
      Result := 'Vulgar Fraction One Third';
    $2154:
      Result := 'Vulgar Fraction Two Thirds';
    $2155:
      Result := 'Vulgar Fraction One Fifth';
    $2156:
      Result := 'Vulgar Fraction Two Fifths';
    $2157:
      Result := 'Vulgar Fraction Three Fifths';
    $2158:
      Result := 'Vulgar Fraction Four Fifths';
    $2159:
      Result := 'Vulgar Fraction One Sixth';
    $215A:
      Result := 'Vulgar Fraction Five Sixths';
    $215B:
      Result := 'Vulgar Fraction One Eighth';
    $215C:
      Result := 'Vulgar Fraction Three Eighths';
    $215D:
      Result := 'Vulgar Fraction Five Eighths';
    $215E:
      Result := 'Vulgar Fraction Seven Eighths';
    $215F:
      Result := 'Fraction Numerator One';
    $2160..$216F:
      Result := GetRomanNumberalUnicodeName(Value);
    $2170..$217F:
      Result := CSmall + #32 + GetRomanNumberalUnicodeName(Value);
    $2180:
      Result := 'Roman Numeral One Thousand C D';
    $2181:
      Result := 'Roman Numeral Five Thousand';
    $2182:
      Result := 'Roman Numeral Ten Thousand';
    $2190:
      Result := 'Leftwards Arrow';
    $2191:
      Result := 'Upwards Arrow';
    $2192:
      Result := 'Rightwards Arrow';
    $2193:
      Result := 'Downwards Arrow';
    $2194:
      Result := CLeft + #32 + CRight + #32 + 'Arrow';
    $2195:
      Result := CUp + #32 + 'Down Arrow';
    $2196:
      Result := 'North West Arrow';
    $2197:
      Result := 'North East Arrow';
    $2198:
      Result := 'South East Arrow';
    $2199:
      Result := 'South West Arrow';
    $219A:
      Result := 'Leftwards Arrow' + #32 + CWith + #32 + 'Stroke';
    $219B:
      Result := 'Rightwards Arrow' + #32 + CWith + #32 + 'Stroke';
    $219C:
      Result := 'Leftwards Wave Arrow';
    $219D:
      Result := 'Rightwards Wave Arrow';
    $219E:
      Result := 'Leftwards Two Headed Arrow';
    $219F:
      Result := 'Upwards Two Headed Arrow';
    $21A0:
      Result := 'Rightwards Two Headed Arrow';
    $21A1:
      Result := 'Downwards Two Headed Arrow';
    $21A2:
      Result := 'Leftwards Arrow' + #32 + CWith + #32 + 'Tail';
    $21A3:
      Result := 'Rightwards Arrow' + #32 + CWith + #32 + 'Tail';
    $21A4:
      Result := 'Leftwards Arrow From Bar';
    $21A5:
      Result := 'Upwards Arrow From Bar';
    $21A6:
      Result := 'Rightwards Arrow From Bar';
    $21A7:
      Result := 'Downwards Arrow From Bar';
    $21A8:
      Result := CUp + #32 + 'Down Arrow' + #32 + CWith + #32 + 'Base';
    $21A9:
      Result := 'Leftwards Arrow' + #32 + CWith + #32 + 'Hook';
    $21AA:
      Result := 'Rightwards Arrow' + #32 + CWith + #32 + 'Hook';
    $21AB:
      Result := 'Leftwards Arrow' + #32 + CWith + #32 + 'Loop';
    $21AC:
      Result := 'Rightwards Arrow' + #32 + CWith + #32 + 'Loop';
    $21AD:
      Result := CLeft + #32 + CRight + #32 + 'Wave Arrow';
    $21AE:
      Result := CLeft + #32 + CRight + #32 + 'Arrow' + #32 + CWith + #32 + 'Stroke';
    $21AF:
      Result := 'Downwards Zigzag Arrow';
    $21B0:
      Result := 'Upwards Arrow' + #32 + CWith + #32 + 'Tip Leftwards';
    $21B1:
      Result := 'Upwards Arrow' + #32 + CWith + #32 + 'Tip Rightwards';
    $21B2:
      Result := 'Downwards Arrow' + #32 + CWith + #32 + 'Tip Leftwards';
    $21B3:
      Result := 'Downwards Arrow' + #32 + CWith + #32 + 'Tip Rightwards';
    $21B4:
      Result := 'Rightwards Arrow' + #32 + CWith + #32 + 'Corner Downwards';
    $21B5:
      Result := 'Downwards Arrow' + #32 + CWith + #32 + 'Corner Leftwards';
    $21B6:
      Result := 'Anticlockwise Top Semicircle Arrow';
    $21B7:
      Result := 'Clockwise Top Semicircle Arrow';
    $21B8:
      Result := 'North West Arrow To Long Bar';
    $21B9:
      Result := 'Leftwards Arrow To Bar Over Rightwards Arrow To Bar';
    $21BA:
      Result := 'Anticlockwise Open Circle Arrow';
    $21BB:
      Result := 'Clockwise Open Circle Arrow';
    $21BC:
      Result := 'Leftwards Harpoon' + #32 + CWith + #32 + 'Barb Upwards';
    $21BD:
      Result := 'Leftwards Harpoon' + #32 + CWith + #32 + 'Barb Downwards';
    $21BE:
      Result := 'Upwards Harpoon' + #32 + CWith + #32 + 'Barb Rightwards';
    $21BF:
      Result := 'Upwards Harpoon' + #32 + CWith + #32 + 'Barb Leftwards';
    $21C0:
      Result := 'Rightwards Harpoon' + #32 + CWith + #32 + 'Barb Upwards';
    $21C1:
      Result := 'Rightwards Harpoon' + #32 + CWith + #32 + 'Barb Downwards';
    $21C2:
      Result := 'Downwards Harpoon' + #32 + CWith + #32 + 'Barb Rightwards';
    $21C3:
      Result := 'Downwards Harpoon' + #32 + CWith + #32 + 'Barb Leftwards';
    $21C4:
      Result := 'Rightwards Arrow Over Leftwards Arrow';
    $21C5:
      Result := 'Upwards Arrow Leftwards Of Downwards Arrow';
    $21C6:
      Result := 'Leftwards Arrow Over Rightwards Arrow';
    $21C7:
      Result := 'Leftwards Paired Arrows';
    $21C8:
      Result := 'Upwards Paired Arrows';
    $21C9:
      Result := 'Rightwards Paired Arrows';
    $21CA:
      Result := 'Downwards Paired Arrows';
    $21CB:
      Result := 'Leftwards Harpoon Over Rightwards Harpoon';
    $21CC:
      Result := 'Rightwards Harpoon Over Leftwards Harpoon';
    $21CD:
      Result := 'Leftwards Double Arrow' + #32 + CWith + #32 + 'Stroke';
    $21CE:
      Result := CLeft + #32 + CRight + #32 + 'Double Arrow' + #32 + CWith + #32 + 'Stroke';
    $21CF:
      Result := 'Rightwards Double Arrow' + #32 + CWith + #32 + 'Stroke';
    $21D0:
      Result := 'Leftwards Double Arrow';
    $21D1:
      Result := 'Upwards Double Arrow';
    $21D2:
      Result := 'Rightwards Double Arrow';
    $21D3:
      Result := 'Downwards Double Arrow';
    $21D4:
      Result := CLeft + #32 + CRight + #32 + 'Double Arrow';
    $21D5:
      Result := CUp + #32 + 'Down Double Arrow';
    $21D6:
      Result := 'North West Double Arrow';
    $21D7:
      Result := 'North East Double Arrow';
    $21D8:
      Result := 'South East Double Arrow';
    $21D9:
      Result := 'South West Double Arrow';
    $21DA:
      Result := 'Leftwards Triple Arrow';
    $21DB:
      Result := 'Rightwards Triple Arrow';
    $21DC:
      Result := 'Leftwards Squiggle Arrow';
    $21DD:
      Result := 'Rightwards Squiggle Arrow';
    $21DE:
      Result := 'Upwards Arrow' + #32 + CWith + #32 + 'Double Stroke';
    $21DF:
      Result := 'Downwards Arrow' + #32 + CWith + #32 + 'Double Stroke';
    $21E0:
      Result := 'Leftwards Dashed Arrow';
    $21E1:
      Result := 'Upwards Dashed Arrow';
    $21E2:
      Result := 'Rightwards Dashed Arrow';
    $21E3:
      Result := 'Downwards Dashed Arrow';
    $21E4:
      Result := 'Leftwards Arrow To Bar';
    $21E5:
      Result := 'Rightwards Arrow To Bar';
    $21E6:
      Result := 'Leftwards White Arrow';
    $21E7:
      Result := 'Upwards White Arrow';
    $21E8:
      Result := 'Rightwards White Arrow';
    $21E9:
      Result := 'Downwards White Arrow';
    $21EA:
      Result := 'Upwards White Arrow From Bar';
    $2200:
      Result := 'For All';
    $2201:
      Result := 'Complement';
    $2202:
      Result := 'Partial Differential';
    $2203:
      Result := 'There Exists';
    $2204:
      Result := 'There Does Not Exist';
    $2205:
      Result := 'Empty Set';
    $2206:
      Result := 'Increment';
    $2207:
      Result := 'Nabla';
    $2208:
      Result := 'Element Of';
    $2209:
      Result := 'Not An Element Of';
    $220A:
      Result := CSmall + #32 + 'Element Of';
    $220B:
      Result := 'Contains As Member';
    $220C:
      Result := 'Does Not Contain As Member';
    $220D:
      Result := CSmall + #32 + 'Contains As Member';
    $220E:
      Result := 'End Of Proof';
    $220F:
      Result := 'N-Ary Product';
    $2210:
      Result := 'N-Ary Coproduct';
    $2211:
      Result := 'N-Ary Summation';
    $2212:
      Result := 'Minus Sign';
    $2213:
      Result := 'Minus-Or-Plus Sign';
    $2214:
      Result := 'Dot Plus';
    $2215:
      Result := 'Division Slash';
    $2216:
      Result := 'Set Minus';
    $2217:
      Result := 'Asterisk Operator';
    $2218:
      Result := 'Ring Operator';
    $2219:
      Result := 'Bullet Operator';
    $221A:
      Result := CSquare + #32 + 'Root';
    $221B:
      Result := 'Cube Root';
    $221C:
      Result := 'Fourth Root';
    $221D:
      Result := 'Proportional To';
    $221E:
      Result := 'Infinity';
    $221F:
      Result := CRight + #32 + 'Angle';
    $2220:
      Result := 'Angle';
    $2221:
      Result := 'Measured Angle';
    $2222:
      Result := 'Spherical Angle';
    $2223:
      Result := 'Divides';
    $2224:
      Result := 'Does Not Divide';
    $2225:
      Result := 'Parallel To';
    $2226:
      Result := 'Not Parallel To';
    $2227:
      Result := 'Logical And';
    $2228:
      Result := 'Logical Or';
    $2229:
      Result := 'Intersection';
    $222A:
      Result := 'Union';
    $222B:
      Result := 'Integral';
    $222C:
      Result := 'Double Integral';
    $222D:
      Result := 'Triple Integral';
    $222E:
      Result := 'Contour Integral';
    $222F:
      Result := 'Surface Integral';
    $2230:
      Result := 'Volume Integral';
    $2231:
      Result := 'Clockwise Integral';
    $2232:
      Result := 'Clockwise Contour Integral';
    $2233:
      Result := 'Anticlockwise Contour Integral';
    $2234:
      Result := 'Therefore';
    $2235:
      Result := 'Because';
    $2236:
      Result := 'Ratio';
    $2237:
      Result := 'Proportion';
    $2238:
      Result := 'Dot Minus';
    $2239:
      Result := 'Excess';
    $223A:
      Result := 'Geometric Proportion';
    $223B:
      Result := 'Homothetic';
    $223C:
      Result := CTilde + #32 + 'Operator';
    $223D:
      Result := 'Reversed' + #32 + CTilde;
    $223E:
      Result := 'Inverted Lazy S';
    $223F:
      Result := 'Sine Wave';
    $2240:
      Result := 'Wreath Product';
    $2241:
      Result := 'Not' + #32 + CTilde;
    $2242:
      Result := 'Minus' + #32 + CTilde;
    $2243:
      Result := 'Asymptotically Equal To';
    $2244:
      Result := 'Not Asymptotically Equal To';
    $2245:
      Result := 'Approximately Equal To';
    $2246:
      Result := 'Approximately But Not Actually Equal To';
    $2247:
      Result := 'Neither Approximately Nor Actually Equal To';
    $2248:
      Result := 'Almost Equal To';
    $2249:
      Result := 'Not Almost Equal To';
    $224A:
      Result := 'Almost Equal Or Equal To';
    $224B:
      Result := 'Triple' + #32 + CTilde;
    $224C:
      Result := 'All Equal To';
    $224D:
      Result := 'Equivalent To';
    $224E:
      Result := 'Geometrically Equivalent To';
    $224F:
      Result := 'Difference Between';
    $2250:
      Result := 'Approaches The Limit';
    $2251:
      Result := 'Geometrically Equal To';
    $2252:
      Result := 'Approximately Equal To Or The Image Of';
    $2253:
      Result := 'Image Of Or Approximately Equal To';
    $2254:
      Result := 'Colon Equals';
    $2255:
      Result := 'Equals Colon';
    $2256:
      Result := 'Ring In Equal To';
    $2257:
      Result := 'Ring Equal To';
    $2258:
      Result := 'Corresponds To';
    $2259:
      Result := 'Estimates';
    $225A:
      Result := 'Equiangular To';
    $225B:
      Result := 'Star Equals';
    $225C:
      Result := CDelta + #32 + 'Equal To';
    $225D:
      Result := 'Equal To By Definition';
    $225E:
      Result := 'Measured By';
    $225F:
      Result := 'Questioned Equal To';
    $2260:
      Result := 'Not Equal To';
    $2261:
      Result := 'Identical To';
    $2262:
      Result := 'Not Identical To';
    $2263:
      Result := 'Strictly Equivalent To';
    $2264:
      Result := 'Less-Than Or Equal To';
    $2265:
      Result := 'Greater-Than Or Equal To';
    $2266:
      Result := 'Less-Than Over Equal To';
    $2267:
      Result := 'Greater-Than Over Equal To';
    $2268:
      Result := 'Less-Than But Not Equal To';
    $2269:
      Result := 'Greater-Than But Not Equal To';
    $226A:
      Result := 'Much Less-Than';
    $226B:
      Result := 'Much Greater-Than';
    $226C:
      Result := 'Between';
    $226D:
      Result := 'Not Equivalent To';
    $226E:
      Result := 'Not Less-Than';
    $226F:
      Result := 'Not Greater-Than';
    $2270:
      Result := 'Neither Less-Than Nor Equal To';
    $2271:
      Result := 'Neither Greater-Than Nor Equal To';
    $2272:
      Result := 'Less-Than Or Equivalent To';
    $2273:
      Result := 'Greater-Than Or Equivalent To';
    $2274:
      Result := 'Neither Less-Than Nor Equivalent To';
    $2275:
      Result := 'Neither Greater-Than Nor Equivalent To';
    $2276:
      Result := 'Less-Than Or Greater-Than';
    $2277:
      Result := 'Greater-Than Or Less-Than';
    $2278:
      Result := 'Neither Less-Than Nor Greater-Than';
    $2279:
      Result := 'Neither Greater-Than Nor Less-Than';
    $227A:
      Result := 'Precedes';
    $227B:
      Result := 'Succeeds';
    $227C:
      Result := 'Precedes Or Equal To';
    $227D:
      Result := 'Succeeds Or Equal To';
    $227E:
      Result := 'Precedes Or Equivalent To';
    $227F:
      Result := 'Succeeds Or Equivalent To';
    $2280:
      Result := 'Does Not Precede';
    $2281:
      Result := 'Does Not Succeed';
    $2282:
      Result := 'Subset Of';
    $2283:
      Result := 'Superset Of';
    $2284:
      Result := 'Not A Subset Of';
    $2285:
      Result := 'Not A Superset Of';
    $2286:
      Result := 'Subset Of Or Equal To';
    $2287:
      Result := 'Superset Of Or Equal To';
    $2288:
      Result := 'Neither A Subset Of Nor Equal To';
    $2289:
      Result := 'Neither A Superset Of Nor Equal To';
    $228A:
      Result := 'Subset Of' + #32 + CWith + #32 + 'Not Equal To';
    $228B:
      Result := 'Superset Of' + #32 + CWith + #32 + 'Not Equal To';
    $228C:
      Result := 'Multiset';
    $228D:
      Result := 'Multiset Multiplication';
    $228E:
      Result := 'Multiset Union';
    $228F:
      Result := CSquare + #32 + 'Image Of';
    $2290:
      Result := CSquare + #32 + 'Original Of';
    $2291:
      Result := CSquare + #32 + 'Image Of Or Equal To';
    $2292:
      Result := CSquare + #32 + 'Original Of Or Equal To';
    $2293:
      Result := CSquare + #32 + 'Cap';
    $2294:
      Result := CSquare + #32 + 'Cup';
    $2295..$229D:
      Result := GetCircledUnicodeName(Value);
    $229E:
      Result := 'Squared Plus';
    $229F:
      Result := 'Squared Minus';
    $22A0:
      Result := 'Squared Times';
    $22A1:
      Result := 'Squared Dot Operator';
    $22A2:
      Result := CRight + #32 + 'Tack';
    $22A3:
      Result := CLeft + #32 + 'Tack';
    $22A4:
      Result := CDown + #32 + 'Tack';
    $22A5:
      Result := CUp + #32 + 'Tack';
    $22A6:
      Result := 'Assertion';
    $22A7:
      Result := 'Models';
    $22A8:
      Result := 'True';
    $22A9:
      Result := 'Forces';
    $22AA:
      Result := 'Triple Vertical Bar' + #32 + CRight + #32 + 'Turnstile';
    $22AB:
      Result := 'Double Vertical Bar Double' + #32 + CRight + #32 + 'Turnstile';
    $22AC:
      Result := 'Does Not Prove';
    $22AD:
      Result := 'Not True';
    $22AE:
      Result := 'Does Not Force';
    $22AF:
      Result := 'Negated Double Vertical Bar Double' + #32 + CRight + #32 + 'Turnstile';
    $22B0:
      Result := 'Precedes Under Relation';
    $22B1:
      Result := 'Succeeds Under Relation';
    $22B2:
      Result := 'Normal Subgroup Of';
    $22B3:
      Result := 'Contains As Normal Subgroup';
    $22B4:
      Result := 'Normal Subgroup Of Or Equal To';
    $22B5:
      Result := 'Contains As Normal Subgroup Or Equal To';
    $22B6:
      Result := 'Original Of';
    $22B7:
      Result := 'Image Of';
    $22B8:
      Result := 'Multimap';
    $22B9:
      Result := 'Hermitian Conjugate Matrix';
    $22BA:
      Result := 'Intercalate';
    $22BB:
      Result := 'Xor';
    $22BC:
      Result := 'Nand';
    $22BD:
      Result := 'Nor';
    $22BE:
      Result := CRight + #32 + 'Angle' + #32 + CWith + #32 + 'Arc';
    $22BF:
      Result := CRight + #32 + 'Triangle';
    $22C0:
      Result := 'N-Ary Logical And';
    $22C1:
      Result := 'N-Ary Logical Or';
    $22C2:
      Result := 'N-Ary Intersection';
    $22C3:
      Result := 'N-Ary Union';
    $22C4:
      Result := 'Diamond Operator';
    $22C5:
      Result := 'Dot Operator';
    $22C6:
      Result := 'Star Operator';
    $22C7:
      Result := 'Division Times';
    $22C8:
      Result := 'Bowtie';
    $22C9:
      Result := CLeft + #32 + 'Normal Factor Semidirect Product';
    $22CA:
      Result := CRight + #32 + 'Normal Factor Semidirect Product';
    $22CB:
      Result := CLeft + #32 + 'Semidirect Product';
    $22CC:
      Result := CRight + #32 + 'Semidirect Product';
    $22CD:
      Result := 'Reversed Tilde Equals';
    $22CE:
      Result := 'Curly Logical Or';
    $22CF:
      Result := 'Curly Logical And';
    $22D0:
      Result := 'Double Subset';
    $22D1:
      Result := 'Double Superset';
    $22D2:
      Result := 'Double Intersection';
    $22D3:
      Result := 'Double Union';
    $22D4:
      Result := 'Pitchfork';
    $22D5:
      Result := 'Equal And Parallel To';
    $22D6:
      Result := 'Less-Than' + #32 + CWith + #32 + 'Dot';
    $22D7:
      Result := 'Greater-Than' + #32 + CWith + #32 + 'Dot';
    $22D8:
      Result := 'Very Much Less-Than';
    $22D9:
      Result := 'Very Much Greater-Than';
    $22DA:
      Result := 'Less-Than Equal To Or Greater-Than';
    $22DB:
      Result := 'Greater-Than Equal To Or Less-Than';
    $22DC:
      Result := 'Equal To Or Less-Than';
    $22DD:
      Result := 'Equal To Or Greater-Than';
    $22DE:
      Result := 'Equal To Or Precedes';
    $22DF:
      Result := 'Equal To Or Succeeds';
    $22E0:
      Result := 'Does Not Precede Or Equal';
    $22E1:
      Result := 'Does Not Succeed Or Equal';
    $22E2:
      Result := 'Not' + #32 + CSquare + #32 + 'Image Of Or Equal To';
    $22E3:
      Result := 'Not' + #32 + CSquare + #32 + 'Original Of Or Equal To';
    $22E4:
      Result := CSquare + #32 + 'Image Of Or Not Equal To';
    $22E5:
      Result := CSquare + #32 + 'Original Of Or Not Equal To';
    $22E6:
      Result := 'Less-Than But Not Equivalent To';
    $22E7:
      Result := 'Greater-Than But Not Equivalent To';
    $22E8:
      Result := 'Precedes But Not Equivalent To';
    $22E9:
      Result := 'Succeeds But Not Equivalent To';
    $22EA:
      Result := 'Not Normal Subgroup Of';
    $22EB:
      Result := 'Does Not Contain As Normal Subgroup';
    $22EC:
      Result := 'Not Normal Subgroup Of Or Equal To';
    $22ED:
      Result := 'Does Not Contain As Normal Subgroup Or Equal';
    $22EE:
      Result := 'Vertical Ellipsis';
    $22EF:
      Result := 'Midline Horizontal Ellipsis';
    $22F0:
      Result := CUp + #32 + 'Right Diagonal Ellipsis';
    $22F1:
      Result := CDown + #32 + 'Right Diagonal Ellipsis';
    $2300:
      Result := 'Diameter Sign';
    $2302:
      Result := 'House';
    $2303:
      Result := CUp + #32 + 'Arrowhead';
    $2304:
      Result := CDown + #32 + 'Arrowhead';
    $2305:
      Result := 'Projective';
    $2306:
      Result := 'Perspective';
    $2307:
      Result := 'Wavy Line';
    $2308:
      Result := CLeft + #32 + 'Ceiling';
    $2309:
      Result := CRight + #32 + 'Ceiling';
    $230A:
      Result := CLeft + #32 + 'Floor';
    $230B:
      Result := CRight + #32 + 'Floor';
    $230C:
      Result := 'Bottom' + #32 + CRight + #32 + 'Crop';
    $230D:
      Result := 'Bottom' + #32 + CLeft + #32 + 'Crop';
    $230E:
      Result := 'Top' + #32 + CRight + #32 + 'Crop';
    $230F:
      Result := 'Top' + #32 + CLeft + #32 + 'Crop';
    $2310:
      Result := 'Reversed Not Sign';
    $2311:
      Result := CSquare + #32 + 'Lozenge';
    $2312:
      Result := 'Arc';
    $2313:
      Result := 'Segment';
    $2314:
      Result := 'Sector';
    $2315:
      Result := 'Telephone Recorder';
    $2316:
      Result := 'Position Indicator';
    $2317:
      Result := 'Viewdata' + #32 + CSquare;
    $2318:
      Result := 'Place Of Interest Sign';
    $2319:
      Result := CTurned + #32 + 'Not Sign';
    $231A:
      Result := 'Watch';
    $231B:
      Result := 'Hourglass';
    $231C:
      Result := 'Top' + #32 + CLeft + #32 + 'Corner';
    $231D:
      Result := 'Top' + #32 + CRight + #32 + 'Corner';
    $231E:
      Result := 'Bottom' + #32 + CLeft + #32 + 'Corner';
    $231F:
      Result := 'Bottom' + #32 + CRight + #32 + 'Corner';
    $2320:
      Result := 'Top Half Integral';
    $2321:
      Result := 'Bottom Half Integral';
    $2322:
      Result := 'Frown';
    $2323:
      Result := 'Smile';
    $2324:
      Result := CUp + #32 + 'Arrowhead Between Two Horizontal Bars';
    $2325:
      Result := 'Option Key';
    $2326:
      Result := 'Erase To The' + #32 + CRight;
    $2327:
      Result := 'X In A Rectangle Box';
    $2328:
      Result := 'Keyboard';
    $2329:
      Result := 'Left-Pointing Angle Bracket';
    $232A:
      Result := 'Right-Pointing Angle Bracket';
    $232B:
      Result := 'Erase To The' + #32 + CLeft;
    $232C:
      Result := 'Benzene Ring';
    $232D:
      Result := 'Cylindricity';
    $232E:
      Result := 'All Around-Profile';
    $232F:
      Result := 'Symmetry';
    $2330:
      Result := 'Total Runout';
    $2331:
      Result := 'Dimension Origin';
    $2332:
      Result := 'Conical Taper';
    $2333:
      Result := 'Slope';
    $2334:
      Result := 'Counterbore';
    $2335:
      Result := 'Countersink';
    $2336..$237A:
      Result := GetAplFunctionalSymbolUnicodeName(Value);
    $2400..$2421:
      Result := GetSymbolUnicodeName(Value);
    $2422:
      Result := 'Blank Symbol';
    $2423:
      Result := 'Open Box';
    $2424:
      Result := GetSymbolUnicodeName(Value);
    $2440:
      Result := 'Ocr Hook';
    $2441:
      Result := 'Ocr Chair';
    $2442:
      Result := 'Ocr Fork';
    $2443:
      Result := 'Ocr Inverted Fork';
    $2444:
      Result := 'Ocr Belt Buckle';
    $2445:
      Result := 'Ocr Bow Tie';
    $2446:
      Result := 'Ocr Branch Bank Identification';
    $2447:
      Result := 'Ocr Amount Of Check';
    $2448:
      Result := 'Ocr Dash';
    $2449:
      Result := 'Ocr Customer Account Number';
    $244A:
      Result := 'Ocr Double Backslash';
    $2460..$2473:
      Result := GetCircledUnicodeName(Value);
    $2474..$2487:
      Result := GetParenthesizedUnicodeName(Value);
    $2488:
      Result := CDigit + #32 + 'One Full Stop';
    $2489:
      Result := CDigit + #32 + 'Two Full Stop';
    $248A:
      Result := CDigit + #32 + 'Three Full Stop';
    $248B:
      Result := CDigit + #32 + 'Four Full Stop';
    $248C:
      Result := CDigit + #32 + 'Five Full Stop';
    $248D:
      Result := CDigit + #32 + 'Six Full Stop';
    $248E:
      Result := CDigit + #32 + 'Seven Full Stop';
    $248F:
      Result := CDigit + #32 + 'Eight Full Stop';
    $2490:
      Result := CDigit + #32 + 'Nine Full Stop';
    $2491:
      Result := CNumber + #32 + 'Ten Full Stop';
    $2492:
      Result := CNumber + #32 + 'Eleven Full Stop';
    $2493:
      Result := CNumber + #32 + 'Twelve Full Stop';
    $2494:
      Result := CNumber + #32 + 'Thirteen Full Stop';
    $2495:
      Result := CNumber + #32 + 'Fourteen Full Stop';
    $2496:
      Result := CNumber + #32 + 'Fifteen Full Stop';
    $2497:
      Result := CNumber + #32 + 'Sixteen Full Stop';
    $2498:
      Result := CNumber + #32 + 'Seventeen Full Stop';
    $2499:
      Result := CNumber + #32 + 'Eighteen Full Stop';
    $249A:
      Result := CNumber + #32 + 'Nineteen Full Stop';
    $249B:
      Result := CNumber + #32 + 'Twenty Full Stop';
    $249C..$24B5:
      Result := GetParenthesizedUnicodeName(Value);
    $24B6..$24EA:
      Result := GetCircledUnicodeName(Value);
    $2500..$257F:
      Result := GetBoxDrawingsUnicodeName(Value);
    $2580:
      Result := CUpper + #32 + 'Half Block';
    $2581:
      Result := CLower + #32 + 'One Eighth Block';
    $2582:
      Result := CLower + #32 + 'One Quarter Block';
    $2583:
      Result := CLower + #32 + 'Three Eighths Block';
    $2584:
      Result := CLower + #32 + 'Half Block';
    $2585:
      Result := CLower + #32 + 'Five Eighths Block';
    $2586:
      Result := CLower + #32 + 'Three Quarters Block';
    $2587:
      Result := CLower + #32 + 'Seven Eighths Block';
    $2588:
      Result := 'Full Block';
    $2589:
      Result := CLeft + #32 + 'Seven Eighths Block';
    $258A:
      Result := CLeft + #32 + 'Three Quarters Block';
    $258B:
      Result := CLeft + #32 + 'Five Eighths Block';
    $258C:
      Result := CLeft + #32 + 'Half Block';
    $258D:
      Result := CLeft + #32 + 'Three Eighths Block';
    $258E:
      Result := CLeft + #32 + 'One Quarter Block';
    $258F:
      Result := CLeft + #32 + 'One Eighth Block';
    $2590:
      Result := CRight + #32 + 'Half Block';
    $2591:
      Result := CLight + #32 + 'Shade';
    $2592:
      Result := 'Medium Shade';
    $2593:
      Result := 'Dark Shade';
    $2594:
      Result := CUpper + #32 + 'One Eighth Block';
    $2595:
      Result := CRight + #32 + 'One Eighth Block';
    $25A0:
      Result := 'Black' + #32 + CSquare;
    $25A1:
      Result := 'White' + #32 + CSquare;
    $25A2:
      Result := 'White' + #32 + CSquare + #32 + CWith + #32 + 'Rounded Corners';
    $25A3:
      Result := 'White' + #32 + CSquare + #32 + 'Containing Black Small' + #32 + CSquare;
    $25A4:
      Result := CSquare + #32 + CWith + #32 + 'Horizontal Fill';
    $25A5:
      Result := CSquare + #32 + CWith + #32 + 'Vertical Fill';
    $25A6:
      Result := CSquare + #32 + CWith + #32 + 'Orthogonal Crosshatch Fill';
    $25A7:
      Result := CSquare + #32 + CWith + #32 + CUpper + #32 + 'Left To Lower' + #32 + CRight + #32 + 'Fill';
    $25A8:
      Result := CSquare + #32 + CWith + #32 + CUpper + #32 + 'Right To Lower' + #32 + CLeft + #32 + 'Fill';
    $25A9:
      Result := CSquare + #32 + CWith + #32 + 'Diagonal Crosshatch Fill';
    $25AA:
      Result := 'Black Small' + #32 + CSquare;
    $25AB:
      Result := 'White Small' + #32 + CSquare;
    $25AC:
      Result := 'Black Rectangle';
    $25AD:
      Result := 'White Rectangle';
    $25AE:
      Result := 'Black Vertical Rectangle';
    $25AF:
      Result := 'White Vertical Rectangle';
    $25B0:
      Result := 'Black Parallelogram';
    $25B1:
      Result := 'White Parallelogram';
    $25B2:
      Result := 'Black Up-Pointing Triangle';
    $25B3:
      Result := 'White Up-Pointing Triangle';
    $25B4:
      Result := 'Black Up-Pointing Small Triangle';
    $25B5:
      Result := 'White Up-Pointing Small Triangle';
    $25B6:
      Result := 'Black Right-Pointing Triangle';
    $25B7:
      Result := 'White Right-Pointing Triangle';
    $25B8:
      Result := 'Black Right-Pointing Small Triangle';
    $25B9:
      Result := 'White Right-Pointing Small Triangle';
    $25BA:
      Result := 'Black Right-Pointing Pointer';
    $25BB:
      Result := 'White Right-Pointing Pointer';
    $25BC:
      Result := 'Black Down-Pointing Triangle';
    $25BD:
      Result := 'White Down-Pointing Triangle';
    $25BE:
      Result := 'Black Down-Pointing Small Triangle';
    $25BF:
      Result := 'White Down-Pointing Small Triangle';
    $25C0:
      Result := 'Black Left-Pointing Triangle';
    $25C1:
      Result := 'White Left-Pointing Triangle';
    $25C2:
      Result := 'Black Left-Pointing Small Triangle';
    $25C3:
      Result := 'White Left-Pointing Small Triangle';
    $25C4:
      Result := 'Black Left-Pointing Pointer';
    $25C5:
      Result := 'White Left-Pointing Pointer';
    $25C6:
      Result := 'Black Diamond';
    $25C7:
      Result := 'White Diamond';
    $25C8:
      Result := 'White Diamond Containing Black Small Diamond';
    $25C9:
      Result := 'Fisheye';
    $25CA:
      Result := 'Lozenge';
    $25CB:
      Result := 'White Circle';
    $25CC:
      Result := 'Dotted Circle';
    $25CD:
      Result := 'Circle' + #32 + CWith + #32 + 'Vertical Fill';
    $25CE:
      Result := 'Bullseye';
    $25CF:
      Result := 'Black Circle';
    $25D0:
      Result := 'Circle' + #32 + CWith + #32 + CLeft + #32 + 'Half Black';
    $25D1:
      Result := 'Circle' + #32 + CWith + #32 + CRight + #32 + 'Half Black';
    $25D2:
      Result := 'Circle' + #32 + CWith + #32 + CLower + #32 + 'Half Black';
    $25D3:
      Result := 'Circle' + #32 + CWith + #32 + CUpper + #32 + 'Half Black';
    $25D4:
      Result := 'Circle' + #32 + CWith + #32 + CUpper + #32 + 'Right Quadrant Black';
    $25D5:
      Result := 'Circle' + #32 + CWith + #32 +
        'All But' + #32 + CUpper + #32 + 'Left Quadrant Black';
    $25D6:
      Result := CLeft + #32 + 'Half Black Circle';
    $25D7:
      Result := CRight + #32 + 'Half Black Circle';
    $25D8:
      Result := 'Inverse Bullet';
    $25D9:
      Result := 'Inverse White Circle';
    $25DA:
      Result := CUpper + #32 + 'Half Inverse White Circle';
    $25DB:
      Result := CLower + #32 + 'Half Inverse White Circle';
    $25DC:
      Result := CUpper + #32 + 'Left Quadrant Circular Arc';
    $25DD:
      Result := CUpper + #32 + 'Right Quadrant Circular Arc';
    $25DE:
      Result := CLower + #32 + 'Right Quadrant Circular Arc';
    $25DF:
      Result := CLower + #32 + 'Left Quadrant Circular Arc';
    $25E0:
      Result := CUpper + #32 + 'Half Circle';
    $25E1:
      Result := CLower + #32 + 'Half Circle';
    $25E2:
      Result := 'Black Lower' + #32 + CRight + #32 + 'Triangle';
    $25E3:
      Result := 'Black Lower' + #32 + CLeft + #32 + 'Triangle';
    $25E4:
      Result := 'Black' + #32 + CUpper + #32 + 'Left Triangle';
    $25E5:
      Result := 'Black' + #32 + CUpper + #32 + 'Right Triangle';
    $25E6:
      Result := 'White Bullet';
    $25E7:
      Result := CSquare + #32 + CWith + #32 + CLeft + #32 + 'Half Black';
    $25E8:
      Result := CSquare + #32 + CWith + #32 + CRight + #32 + 'Half Black';
    $25E9:
      Result := CSquare + #32 + CWith + #32 + CUpper + #32 +
        'Left Diagonal Half Black';
    $25EA:
      Result := CSquare + #32 + CWith + #32 + CLower + #32 +
        'Right Diagonal Half Black';
    $25EB:
      Result := 'White' + #32 + CSquare + #32 + CWith + #32 +
        'Vertical Bisecting Line';
    $25EC:
      Result := 'White Up-Pointing Triangle' + #32 + CWith + #32 + 'Dot';
    $25ED:
      Result := 'Up-Pointing Triangle' + #32 + CWith + #32 + CLeft + #32 + 'Half Black';
    $25EE:
      Result := 'Up-Pointing Triangle' + #32 + CWith + #32 + CRight + #32 + 'Half Black';
    $25EF:
      Result := 'Large Circle';
    $2600:
      Result := 'Black Sun' + #32 + CWith + #32 + 'Rays';
    $2601:
      Result := 'Cloud';
    $2602:
      Result := 'Umbrella';
    $2603:
      Result := 'Snowman';
    $2604:
      Result := 'Comet';
    $2605:
      Result := 'Black Star';
    $2606:
      Result := 'White Star';
    $2607:
      Result := 'Lightning';
    $2608:
      Result := 'Thunderstorm';
    $2609:
      Result := 'Sun';
    $260A:
      Result := 'Ascending Node';
    $260B:
      Result := 'Descending Node';
    $260C:
      Result := 'Conjunction';
    $260D:
      Result := 'Opposition';
    $260E:
      Result := 'Black Telephone';
    $260F:
      Result := 'White Telephone';
    $2610:
      Result := 'Ballot Box';
    $2611:
      Result := 'Ballot Box' + #32 + CWith + #32 + 'Check';
    $2612:
      Result := 'Ballot Box' + #32 + CWith + #32 + 'X';
    $2613:
      Result := 'Saltire';
    $261A:
      Result := 'Black' + #32 + CLeft + #32 + 'Pointing Index';
    $261B:
      Result := 'Black' + #32 + CRight + #32 + 'Pointing Index';
    $261C:
      Result := 'White' + #32 + CLeft + #32 + 'Pointing Index';
    $261D:
      Result := 'White Up Pointing Index';
    $261E:
      Result := 'White' + #32 + CRight + #32 + 'Pointing Index';
    $261F:
      Result := 'White Down Pointing Index';
    $2620:
      Result := 'Skull And Crossbones';
    $2621:
      Result := 'Caution Sign';
    $2622:
      Result := 'Radioactive Sign';
    $2623:
      Result := 'Biohazard Sign';
    $2624:
      Result := 'Caduceus';
    $2625:
      Result := 'Ankh';
    $2626:
      Result := 'Orthodox Cross';
    $2627:
      Result := 'Chi Rho';
    $2628:
      Result := 'Cross Of Lorraine';
    $2629:
      Result := 'Cross Of Jerusalem';
    $262A:
      Result := 'Star And Crescent';
    $262B:
      Result := 'Farsi Symbol';
    $262C:
      Result := 'Adi Shakti';
    $262D:
      Result := 'Hammer And Sickle';
    $262E:
      Result := 'Peace Symbol';
    $262F:
      Result := 'Yin Yang';
    $2630:
      Result := 'Trigram For Heaven';
    $2631:
      Result := 'Trigram For Lake';
    $2632:
      Result := 'Trigram For Fire';
    $2633:
      Result := 'Trigram For Thunder';
    $2634:
      Result := 'Trigram For Wind';
    $2635:
      Result := 'Trigram For Water';
    $2636:
      Result := 'Trigram For Mountain';
    $2637:
      Result := 'Trigram For Earth';
    $2638:
      Result := 'Wheel Of Dharma';
    $2639:
      Result := 'White Frowning Face';
    $263A:
      Result := 'White Smiling Face';
    $263B:
      Result := 'Black Smiling Face';
    $263C:
      Result := 'White Sun' + #32 + CWith + #32 + 'Rays';
    $263D:
      Result := 'First Quarter Moon';
    $263E:
      Result := 'Last Quarter Moon';
    $263F:
      Result := 'Mercury';
    $2640:
      Result := 'Female Sign';
    $2641:
      Result := 'Earth';
    $2642:
      Result := 'Male Sign';
    $2643:
      Result := 'Jupiter';
    $2644:
      Result := 'Saturn';
    $2645:
      Result := 'Uranus';
    $2646:
      Result := 'Neptune';
    $2647:
      Result := 'Pluto';
    $2648:
      Result := 'Aries';
    $2649:
      Result := 'Taurus';
    $264A:
      Result := 'Gemini';
    $264B:
      Result := 'Cancer';
    $264C:
      Result := 'Leo';
    $264D:
      Result := 'Virgo';
    $264E:
      Result := 'Libra';
    $264F:
      Result := 'Scorpius';
    $2650:
      Result := 'Sagittarius';
    $2651:
      Result := 'Capricorn';
    $2652:
      Result := 'Aquarius';
    $2653:
      Result := 'Pisces';
    $2654:
      Result := 'White Chess King';
    $2655:
      Result := 'White Chess Queen';
    $2656:
      Result := 'White Chess Rook';
    $2657:
      Result := 'White Chess Bishop';
    $2658:
      Result := 'White Chess Knight';
    $2659:
      Result := 'White Chess Pawn';
    $265A:
      Result := 'Black Chess King';
    $265B:
      Result := 'Black Chess Queen';
    $265C:
      Result := 'Black Chess Rook';
    $265D:
      Result := 'Black Chess Bishop';
    $265E:
      Result := 'Black Chess Knight';
    $265F:
      Result := 'Black Chess Pawn';
    $2660:
      Result := 'Black Spade Suit';
    $2661:
      Result := 'White Heart Suit';
    $2662:
      Result := 'White Diamond Suit';
    $2663:
      Result := 'Black Club Suit';
    $2664:
      Result := 'White Spade Suit';
    $2665:
      Result := 'Black Heart Suit';
    $2666:
      Result := 'Black Diamond Suit';
    $2667:
      Result := 'White Club Suit';
    $2668:
      Result := 'Hot Springs';
    $2669:
      Result := 'Quarter Note';
    $266A:
      Result := 'Eighth Note';
    $266B:
      Result := 'Beamed Eighth Notes';
    $266C:
      Result := 'Beamed Sixteenth Notes';
    $266D:
      Result := 'Music Flat Sign';
    $266E:
      Result := 'Music Natural Sign';
    $266F:
      Result := 'Music Sharp Sign';
    $2701:
      Result := CUpper + #32 + 'Blade Scissors';
    $2702:
      Result := 'Black Scissors';
    $2703:
      Result := CLower + #32 + 'Blade Scissors';
    $2704:
      Result := 'White Scissors';
    $2706:
      Result := 'Telephone Location Sign';
    $2707:
      Result := 'Tape Drive';
    $2708:
      Result := 'Airplane';
    $2709:
      Result := 'Envelope';
    $270C:
      Result := 'Victory Hand';
    $270D:
      Result := 'Writing Hand';
    $270E:
      Result := CLower + #32 + 'Right Pencil';
    $270F:
      Result := 'Pencil';
    $2710:
      Result := CUpper + #32 + 'Right Pencil';
    $2711:
      Result := 'White Nib';
    $2712:
      Result := 'Black Nib';
    $2713:
      Result := 'Check Mark';
    $2714:
      Result := CHeavy + #32 + 'Check Mark';
    $2715:
      Result := 'Multiplication X';
    $2716:
      Result := CHeavy + #32 + 'Multiplication X';
    $2717:
      Result := 'Ballot X';
    $2718:
      Result := CHeavy + #32 + 'Ballot X';
    $2719:
      Result := 'Outlined Greek Cross';
    $271A:
      Result := CHeavy + #32 + 'Greek Cross';
    $271B:
      Result := 'Open Centre Cross';
    $271C:
      Result := CHeavy + #32 + 'Open Centre Cross';
    $271D:
      Result := GetLatinUnicodeName(Value);
    $271E:
      Result := 'Shadowed White Latin Cross';
    $271F:
      Result := 'Outlined Latin Cross';
    $2720:
      Result := 'Maltese Cross';
    $2721:
      Result := 'Star Of David';
    $2722:
      Result := 'Four Teardrop-Spoked Asterisk';
    $2723:
      Result := 'Four Balloon-Spoked Asterisk';
    $2724:
      Result := CHeavy + #32 + 'Four Balloon-Spoked Asterisk';
    $2725:
      Result := 'Four Club-Spoked Asterisk';
    $2726:
      Result := 'Black Four Pointed Star';
    $2727:
      Result := 'White Four Pointed Star';
    $2729:
      Result := 'Stress Outlined White Star';
    $272A:
      Result := 'Circled White Star';
    $272B:
      Result := 'Open Centre Black Star';
    $272C:
      Result := 'Black Centre White Star';
    $272D:
      Result := 'Outlined Black Star';
    $272E:
      Result := CHeavy + #32 + 'Outlined Black Star';
    $272F:
      Result := 'Pinwheel Star';
    $2730:
      Result := 'Shadowed White Star';
    $2731:
      Result := CHeavy + #32 + 'Asterisk';
    $2732:
      Result := 'Open Centre Asterisk';
    $2733:
      Result := 'Eight Spoked Asterisk';
    $2734:
      Result := 'Eight Pointed Black Star';
    $2735:
      Result := 'Eight Pointed Pinwheel Star';
    $2736:
      Result := 'Six Pointed Black Star';
    $2737:
      Result := 'Eight Pointed Rectilinear Black Star';
    $2738:
      Result := CHeavy + #32 + 'Eight Pointed Rectilinear Black Star';
    $2739:
      Result := 'Twelve Pointed Black Star';
    $273A:
      Result := 'Sixteen Pointed Asterisk';
    $273B:
      Result := 'Teardrop-Spoked Asterisk';
    $273C:
      Result := 'Open Centre Teardrop-Spoked Asterisk';
    $273D:
      Result := CHeavy + #32 + 'Teardrop-Spoked Asterisk';
    $273E:
      Result := 'Six Petalled Black And White Florette';
    $273F:
      Result := 'Black Florette';
    $2740:
      Result := 'White Florette';
    $2741:
      Result := 'Eight Petalled Outlined Black Florette';
    $2742:
      Result := 'Circled Open Centre Eight Pointed Star';
    $2743:
      Result := CHeavy + #32 + 'Teardrop-Spoked Pinwheel Asterisk';
    $2744:
      Result := 'Snowflake';
    $2745:
      Result := 'Tight Trifoliate Snowflake';
    $2746:
      Result := CHeavy + #32 + 'Chevron Snowflake';
    $2747:
      Result := 'Sparkle';
    $2748:
      Result := CHeavy + #32 + 'Sparkle';
    $2749:
      Result := 'Balloon-Spoked Asterisk';
    $274A:
      Result := 'Eight Teardrop-Spoked Propeller Asterisk';
    $274B:
      Result := CHeavy + #32 + 'Eight Teardrop-Spoked Propeller Asterisk';
    $274D:
      Result := 'Shadowed White Circle';
    $274F:
      Result := CLower + #32 + 'Right Drop-Shadowed White' + #32 + CSquare;
    $2750:
      Result := CUpper + #32 + 'Right Drop-Shadowed White' + #32 + CSquare;
    $2751:
      Result := CLower + #32 + 'Right Shadowed White' + #32 + CSquare;
    $2752:
      Result := CUpper + #32 + 'Right Shadowed White' + #32 + CSquare;
    $2756:
      Result := 'Black Diamond Minus White X';
    $2758:
      Result := CLight + #32 + 'Vertical Bar';
    $2759:
      Result := 'Medium Vertical Bar';
    $275A:
      Result := CHeavy + #32 + 'Vertical Bar';
    $275B:
      Result := CHeavy + #32 + 'Single Turned Comma Quotation Mark Ornament';
    $275C:
      Result := CHeavy + #32 + 'Single Comma Quotation Mark Ornament';
    $275D:
      Result := CHeavy + #32 + 'Double Turned Comma Quotation Mark Ornament';
    $275E:
      Result := CHeavy + #32 + 'Double Comma Quotation Mark Ornament';
    $2761:
      Result := 'Curved Stem Paragraph Sign Ornament';
    $2762:
      Result := CHeavy + #32 + 'Exclamation Mark Ornament';
    $2763:
      Result := CHeavy + #32 + 'Heart Exclamation Mark Ornament';
    $2764:
      Result := CHeavy + #32 + 'Black Heart';
    $2765:
      Result := 'Rotated Heavy Black Heart Bullet';
    $2766:
      Result := 'Floral Heart';
    $2767:
      Result := 'Rotated Floral Heart Bullet';
    $2776..$2793:
      Result := GetDingbatUnicodeName(Value);
    $2794:
      Result := CHeavy + #32 + 'Wide-Headed Rightwards Arrow';
    $2798:
      Result := CHeavy + #32 + 'South East Arrow';
    $2799:
      Result := CHeavy + #32 + 'Rightwards Arrow';
    $279A:
      Result := CHeavy + #32 + 'North East Arrow';
    $279B:
      Result := 'Drafting Point Rightwards Arrow';
    $279C:
      Result := CHeavy + #32 + 'Round-Tipped Rightwards Arrow';
    $279D:
      Result := 'Triangle-Headed Rightwards Arrow';
    $279E:
      Result := CHeavy + #32 + 'Triangle-Headed Rightwards Arrow';
    $279F:
      Result := 'Dashed Triangle-Headed Rightwards Arrow';
    $27A0:
      Result := CHeavy + #32 + 'Dashed Triangle-Headed Rightwards Arrow';
    $27A1:
      Result := 'Black Rightwards Arrow';
    $27A2:
      Result := 'Three-D Top-Lighted Rightwards Arrowhead';
    $27A3:
      Result := 'Three-D Bottom-Lighted Rightwards Arrowhead';
    $27A4:
      Result := 'Black Rightwards Arrowhead';
    $27A5:
      Result := CHeavy + #32 + 'Black Curved Downwards And Rightwards Arrow';
    $27A6:
      Result := CHeavy + #32 + 'Black Curved Upwards And Rightwards Arrow';
    $27A7:
      Result := 'Squat Black Rightwards Arrow';
    $27A8:
      Result := CHeavy + #32 + 'Concave-Pointed Black Rightwards Arrow';
    $27A9:
      Result := 'Right-Shaded White Rightwards Arrow';
    $27AA:
      Result := 'Left-Shaded White Rightwards Arrow';
    $27AB:
      Result := 'Back-Tilted Shadowed White Rightwards Arrow';
    $27AC:
      Result := 'Front-Tilted Shadowed White Rightwards Arrow';
    $27AD:
      Result := CHeavy + #32 + 'Lower Right-Shadowed White Rightwards Arrow';
    $27AE:
      Result := CHeavy + #32 + CUpper + #32 + 'Right-Shadowed White Rightwards Arrow';
    $27AF:
      Result := 'Notched Lower Right-Shadowed White Rightwards Arrow';
    $27B1:
      Result := 'Notched' + #32 + CUpper + #32 + 'Right-Shadowed White Rightwards Arrow';
    $27B2:
      Result := 'Circled Heavy White Rightwards Arrow';
    $27B3:
      Result := 'White-Feathered Rightwards Arrow';
    $27B4:
      Result := 'Black-Feathered South East Arrow';
    $27B5:
      Result := 'Black-Feathered Rightwards Arrow';
    $27B6:
      Result := 'Black-Feathered North East Arrow';
    $27B7:
      Result := CHeavy + #32 + 'Black-Feathered South East Arrow';
    $27B8:
      Result := CHeavy + #32 + 'Black-Feathered Rightwards Arrow';
    $27B9:
      Result := CHeavy + #32 + 'Black-Feathered North East Arrow';
    $27BA:
      Result := 'Teardrop-Barbed Rightwards Arrow';
    $27BB:
      Result := CHeavy + #32 + 'Teardrop-Shanked Rightwards Arrow';
    $27BC:
      Result := 'Wedge-Tailed Rightwards Arrow';
    $27BD:
      Result := CHeavy + #32 + 'Wedge-Tailed Rightwards Arrow';
    $27BE:
      Result := 'Open-Outlined Rightwards Arrow';
    $3000:
      Result := CIdeographic + #32 + 'Space';
    $3001:
      Result := CIdeographic + #32 + 'Comma';
    $3002:
      Result := CIdeographic + #32 + 'Full Stop';
    $3003:
      Result := 'Ditto Mark';
    $3004:
      Result := 'Japanese Industrial Standard Symbol';
    $3005:
      Result := CIdeographic + #32 + 'Iteration Mark';
    $3006:
      Result := CIdeographic + #32 + 'Closing Mark';
    $3007:
      Result := CIdeographic + #32 + 'Number Zero';
    $3008:
      Result := CLeft + #32 + 'Angle Bracket';
    $3009:
      Result := CRight + #32 + 'Angle Bracket';
    $300A:
      Result := CLeft + #32 + 'Double Angle Bracket';
    $300B:
      Result := CRight + #32 + 'Double Angle Bracket';
    $300C:
      Result := CLeft + #32 + 'Corner Bracket';
    $300D:
      Result := CRight + #32 + 'Corner Bracket';
    $300E:
      Result := CLeft + #32 + 'White Corner Bracket';
    $300F:
      Result := CRight + #32 + 'White Corner Bracket';
    $3010:
      Result := CLeft + #32 + 'Black Lenticular Bracket';
    $3011:
      Result := CRight + #32 + 'Black Lenticular Bracket';
    $3012:
      Result := 'Postal Mark';
    $3013:
      Result := 'Geta Mark';
    $3014:
      Result := CLeft + #32 + 'Tortoise Shell Bracket';
    $3015:
      Result := CRight + #32 + 'Tortoise Shell Bracket';
    $3016:
      Result := CLeft + #32 + 'White Lenticular Bracket';
    $3017:
      Result := CRight + #32 + 'White Lenticular Bracket';
    $3018:
      Result := CLeft + #32 + 'White Tortoise Shell Bracket';
    $3019:
      Result := CRight + #32 + 'White Tortoise Shell Bracket';
    $301A:
      Result := CLeft + #32 + 'White' + #32 + CSquare + #32 + 'Bracket';
    $301B:
      Result := CRight + #32 + 'White' + #32 + CSquare + #32 + 'Bracket';
    $301C:
      Result := 'Wave Dash';
    $301D:
      Result := 'Reversed Double Prime Quotation Mark';
    $301E:
      Result := 'Double Prime Quotation Mark';
    $301F:
      Result := 'Low Double Prime Quotation Mark';
    $3020:
      Result := 'Postal Mark Face';
    $3021..$3029:
      Result := GetHangzhouUnicodeName(Value);
    $302A:
      Result := CIdeographic + #32 + 'Level Tone Mark';
    $302B:
      Result := CIdeographic + #32 + 'Rising Tone Mark';
    $302C:
      Result := CIdeographic + #32 + 'Departing Tone Mark';
    $302D:
      Result := CIdeographic + #32 + 'Entering Tone Mark';
    $302E..$302F:
      Result := GetHangulUnicodeName(Value);
    $3030:
      Result := 'Wavy Dash';
    $3031:
      Result := 'Vertical Kana Repeat Mark';
    $3032:
      Result := 'Vertical Kana Repeat' + #32 + CWith + #32 +
        'Voiced Sound Mark';
    $3033:
      Result := 'Vertical Kana Repeat Mark' + #32 + CUpper + #32 + 'Half';
    $3034:
      Result := 'Vertical Kana Repeat' + #32 + CWith + #32 +
        'Voiced Sound Mark' + #32 + CUpper + #32 + 'Half';
    $3035:
      Result := 'Vertical Kana Repeat Mark Lower Half';
    $3036:
      Result := 'Circled Postal Mark';
    $3037:
      Result := CIdeographic + #32 + 'Telegraph Line Feed Separator Symbol';
    $303F:
      Result := CIdeographic + #32 + 'Half Fill Space';
    $3041..$3094:
      Result := GetHiraganaUnicodeName(Value);
    $3099..$309A:
      Result := GetCombiningUnicodeName(Value);
    $309B:
      Result := 'Katakana-Hiragana Voiced Sound Mark';
    $309C:
      Result := 'Katakana-Hiragana Semi-Voiced Sound Mark';
    $309D:
      Result := 'Hiragana Iteration Mark';
    $309E:
      Result := 'Hiragana Voiced Iteration Mark';
    $30A1..$30FB:
      Result := GetKatakanaUnicodeName(Value);
    $30FC:
      Result := 'Katakana-Hiragana Prolonged Sound Mark';
    $30FD..$30FE:
      Result := GetKatakanaUnicodeName(Value);
    $3105..$312C:
      Result := GetBopomofoUnicodeName(Value);
    $3131..$318E:
      Result := GetHangulUnicodeName(Value);
    $3190..$319F:
      Result := GetIdeographicAnnotationUnicodeName(Value);
    $3200..$3243:
      Result := GetParenthesizedUnicodeName(Value);
    $3260..$327B:
      Result := GetCircledUnicodeName(Value);
    $327F:
      Result := 'Korean Standard Symbol';
    $3280..$32B0:
      Result := GetCircledUnicodeName(Value);
    $32C0..$32CB:
      Result := GetIdeographicTelegraphSymbolUnicodeName(Value);
    $32D0..$32FE:
      Result := GetCircledUnicodeName(Value);
    $3300..$3357:
      Result := GetSquareUnicodeName(Value);
    $3358..$3370:
      Result := GetIdeographicTelegraphSymbolUnicodeName(Value);
    $3371..$33DD:
      Result := GetSquareUnicodeName(Value);
    $33E0..$33FE:
      Result := GetIdeographicTelegraphSymbolUnicodeName(Value);
    $4E00:
      Result := '<CJK Ideograph, First>';
    $E000:
      Result := '<Private Use, First>';
    $F8FF:
      Result := '<Private Use, Last>';
    $F900..$FA2D:
      Result := GetCjkCompatibilityIdeographUnicodeName(Value);
    $FB00..$FB06:
      Result := GetLatinUnicodeName(Value);
    $FB13..$FB17:
      Result := GetArmenianUnicodeName(Value);
    $FB1E..$FB4F:
      Result := GetHebrewUnicodeName(Value);
    $FB50..$FD3D:
      Result := GetArabicUnicodeName(Value);
    $FD3E:
      Result := 'Ornate' + #32 + CLeft + #32 + 'Parenthesis';
    $FD3F:
      Result := 'Ornate' + #32 + CRight + #32 + 'Parenthesis';
    $FD50..$FDFB:
      Result := GetArabicUnicodeName(Value);
    $FE20..$FE23:
      Result := GetCombiningUnicodeName(Value);
    $FE30..$FE44:
      Result := GetPresentationFormForVerticalUnicodeName(Value);
    $FE49:
      Result := 'Dashed Overline';
    $FE4A:
      Result := 'Centreline Overline';
    $FE4B:
      Result := 'Wavy Overline';
    $FE4C:
      Result := 'Double Wavy Overline';
    $FE4D:
      Result := 'Dashed Low Line';
    $FE4E:
      Result := 'Centreline Low Line';
    $FE4F:
      Result := 'Wavy Low Line';
    $FE50:
      Result := CSmall + #32 + 'Comma';
    $FE51:
      Result := CSmall + #32 + CIdeographic + #32 + 'Comma';
    $FE52:
      Result := CSmall + #32 + 'Full Stop';
    $FE54:
      Result := CSmall + #32 + 'Semicolon';
    $FE55:
      Result := CSmall + #32 + 'Colon';
    $FE56:
      Result := CSmall + #32 + 'Question Mark';
    $FE57:
      Result := CSmall + #32 + 'Exclamation Mark';
    $FE58:
      Result := CSmall + #32 + 'Em Dash';
    $FE59:
      Result := CSmall + #32 + CLeft + #32 + 'Parenthesis';
    $FE5A:
      Result := CSmall + #32 + CRight + #32 + 'Parenthesis';
    $FE5B:
      Result := CSmall + #32 + CLeft + #32 + 'Curly Bracket';
    $FE5C:
      Result := CSmall + #32 + CRight + #32 + 'Curly Bracket';
    $FE5D:
      Result := CSmall + #32 + CLeft + #32 + 'Tortoise Shell Bracket';
    $FE5E:
      Result := CSmall + #32 + CRight + #32 + 'Tortoise Shell Bracket';
    $FE5F:
      Result := CSmall + #32 + CNumber + #32 + 'Sign';
    $FE60:
      Result := CSmall + #32 + 'Ampersand';
    $FE61:
      Result := CSmall + #32 + 'Asterisk';
    $FE62:
      Result := CSmall + #32 + 'Plus Sign';
    $FE63:
      Result := CSmall + #32 + 'Hyphen-Minus';
    $FE64:
      Result := CSmall + #32 + 'Less-Than Sign';
    $FE65:
      Result := CSmall + #32 + 'Greater-Than Sign';
    $FE66:
      Result := CSmall + #32 + 'Equals Sign';
    $FE68:
      Result := CSmall + #32 + 'Reverse Solidus';
    $FE69:
      Result := CSmall + #32 + 'Dollar Sign';
    $FE6A:
      Result := CSmall + #32 + 'Percent Sign';
    $FE6B:
      Result := CSmall + #32 + 'Commercial At';
    $FE70..$FEFC:
      Result := GetArabicUnicodeName(Value);
    $FEFF:
      Result := 'Zero Width No-Break Space';
    $FF01..$FF5E:
      Result := GetFullwidthUnicodeName(Value);
    $FF61..$FFDC:
      Result := GetHalfwidthUnicodeName(Value);
    $FFE0..$FFE6:
      Result := GetFullwidthUnicodeName(Value);
    $FFE8..$FFEE:
      Result := GetHalfwidthUnicodeName(Value);
    $FFFD:
      Result := 'Replacement Character';
  else
    Result := '';
  end;
end;

end.
