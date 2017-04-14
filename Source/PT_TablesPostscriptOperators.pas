unit PT_TablesPostscriptOperators;

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
  Classes, Contnrs, SysUtils, PT_Types, PT_Classes, PT_Tables,
  PT_TablesPostscript;

type
  TPascalTypePostscriptVersionOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptNoticeOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptFullNameOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptFamilyNameOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptWeightOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptFontBBoxOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptBlueValuesOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptOtherBluesOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptFamilyBluesOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptFamilyOtherBluesOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptStdHWOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptStdVWOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptEscapeOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  private
    FOpCode: Byte;
  protected
    class function GetOperator: Byte; override;
  public
    property Opcode: Byte read FOpCode write FOpCode;
  end;

  TPascalTypePostscriptUniqueIDOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptXUIDOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptCharsetOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptEncodingOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptCharStringOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptPrivateOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptSubrsOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptDefaultWidthXOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

  TPascalTypePostscriptNominalWidthXOperator = class
    (TCustomPascalTypePostscriptDictOperator)
  protected
    class function GetOperator: Byte; override;
  end;

implementation

{ TPascalTypePostscriptVersionOperator }

class function TPascalTypePostscriptVersionOperator.GetOperator: Byte;
begin
  Result := 0;
end;

{ TPascalTypePostscriptNoticeOperator }

class function TPascalTypePostscriptNoticeOperator.GetOperator: Byte;
begin
  Result := 1;
end;

{ TPascalTypePostscriptFullNameOperator }

class function TPascalTypePostscriptFullNameOperator.GetOperator: Byte;
begin
  Result := 2;
end;

{ TPascalTypePostscriptFamilyNameOperator }

class function TPascalTypePostscriptFamilyNameOperator.GetOperator: Byte;
begin
  Result := 3;
end;

{ TPascalTypePostscriptWeightOperator }

class function TPascalTypePostscriptWeightOperator.GetOperator: Byte;
begin
  Result := 4;
end;

{ TPascalTypePostscriptFontBBoxOperator }

class function TPascalTypePostscriptFontBBoxOperator.GetOperator: Byte;
begin
  Result := 5;
end;

{ TPascalTypePostscriptBlueValuesOperator }

class function TPascalTypePostscriptBlueValuesOperator.GetOperator: Byte;
begin
  Result := 6;
end;

{ TPascalTypePostscriptOtherBluesOperator }

class function TPascalTypePostscriptOtherBluesOperator.GetOperator: Byte;
begin
  Result := 7;
end;

{ TPascalTypePostscriptFamilyBluesOperator }

class function TPascalTypePostscriptFamilyBluesOperator.GetOperator: Byte;
begin
  Result := 8;
end;

{ TPascalTypePostscriptFamilyOtherBluesOperator }

class function TPascalTypePostscriptFamilyOtherBluesOperator.GetOperator: Byte;
begin
  Result := 9;
end;

{ TPascalTypePostscriptStdHWOperator }

class function TPascalTypePostscriptStdHWOperator.GetOperator: Byte;
begin
  Result := 10;
end;

{ TPascalTypePostscriptStdVWOperator }

class function TPascalTypePostscriptStdVWOperator.GetOperator: Byte;
begin
  Result := 11;
end;

{ TPascalTypePostscriptEscapeOperator }

class function TPascalTypePostscriptEscapeOperator.GetOperator: Byte;
begin
  Result := 12;
end;

{ TPascalTypePostscriptUniqueIDOperator }

class function TPascalTypePostscriptUniqueIDOperator.GetOperator: Byte;
begin
  Result := 13;
end;

{ TPascalTypePostscriptXUIDOperator }

class function TPascalTypePostscriptXUIDOperator.GetOperator: Byte;
begin
  Result := 14;
end;

{ TPascalTypePostscriptCharsetOperator }

class function TPascalTypePostscriptCharsetOperator.GetOperator: Byte;
begin
  Result := 15;
end;

{ TPascalTypePostscriptEncodingOperator }

class function TPascalTypePostscriptEncodingOperator.GetOperator: Byte;
begin
  Result := 16;
end;

{ TPascalTypePostscriptCharStringOperator }

class function TPascalTypePostscriptCharStringOperator.GetOperator: Byte;
begin
  Result := 17;
end;

{ TPascalTypePostscriptPrivateOperator }

class function TPascalTypePostscriptPrivateOperator.GetOperator: Byte;
begin
  Result := 18;
end;

{ TPascalTypePostscriptSubrsOperator }

class function TPascalTypePostscriptSubrsOperator.GetOperator: Byte;
begin
  Result := 19;
end;

{ TPascalTypePostscriptDefaultWidthXOperator }

class function TPascalTypePostscriptDefaultWidthXOperator.GetOperator: Byte;
begin
  Result := 20;
end;

{ TPascalTypePostscriptNominalWidthXOperator }

class function TPascalTypePostscriptNominalWidthXOperator.GetOperator: Byte;
begin
  Result := 21;
end;

initialization

RegisterOperators([TPascalTypePostscriptVersionOperator,
  TPascalTypePostscriptNoticeOperator, TPascalTypePostscriptFullNameOperator,
  TPascalTypePostscriptFamilyNameOperator, TPascalTypePostscriptWeightOperator,
  TPascalTypePostscriptFontBBoxOperator,
  TPascalTypePostscriptBlueValuesOperator,
  TPascalTypePostscriptOtherBluesOperator,
  TPascalTypePostscriptFamilyBluesOperator,
  TPascalTypePostscriptFamilyOtherBluesOperator,
  TPascalTypePostscriptStdHWOperator, TPascalTypePostscriptStdVWOperator,
  TPascalTypePostscriptEscapeOperator, TPascalTypePostscriptUniqueIDOperator,
  TPascalTypePostscriptXUIDOperator, TPascalTypePostscriptCharsetOperator,
  TPascalTypePostscriptEncodingOperator,
  TPascalTypePostscriptCharStringOperator, TPascalTypePostscriptPrivateOperator,
  TPascalTypePostscriptSubrsOperator,
  TPascalTypePostscriptDefaultWidthXOperator,
  TPascalTypePostscriptNominalWidthXOperator]);

end.
