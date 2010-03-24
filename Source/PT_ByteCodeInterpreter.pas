unit PT_ByteCodeInterpreter;

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

uses
  Classes, SysUtils, PT_Types, PT_Tables;

procedure ByteCodeToStrings(ByteCodeStream: TStream; Strings: TStrings);
function ByteCodeToString(ByteCode: array of Byte): string;

implementation

uses
  PT_ResourceStrings;

procedure ByteCodeToStrings(ByteCodeStream: TStream; Strings: TStrings);
var
  TempStr      : string;
  Instruction  : Byte;
  ParamCount   : Byte;
  ParamIndex   : Byte;
  ParamValue8  : Byte;
  ParamValue16 : Word;
begin
 with ByteCodeStream do
  while Position < Size do
   begin
    // read instruction
    Read(Instruction, 1);

    // Instruction taking data from the instruction stream
    TempStr := InstructionByteToString(Instruction);

    case Instruction of
     $40 :
       begin
        // read parameter count
        Read(ParamCount, 1);

        // check if parameter count is valid
        if not (Position + ParamCount <= Size)
         then raise Exception.Create(RCStrInvalidInstruction);

        if ParamCount > 0 then
         begin
          // read first parameter value
          Read(ParamValue8, 1);

          // add parameter value to temporary string
          TempStr := TempStr + ' ' + IntToStr(ParamValue8);

          for ParamIndex := 1 to ParamCount - 1 do
           begin
            // read next parameter value
            Read(ParamValue8, 1);

            // add parameter value to temporary string
            TempStr := TempStr + ', ' + IntToStr(ParamValue8);
           end;
         end;
       end;
     $41 :
       begin
        // read parameter count
        Read(ParamCount, 1);

        // check if parameter count is valid
        if not (Position + ParamCount <= Size)
         then raise Exception.Create(RCStrInvalidInstruction);

        if ParamCount > 0 then
         begin
          // read first parameter value
          Read(ParamValue16, 2);

          // add parameter value to temporary string
          TempStr := TempStr + ' ' + IntToStr(Swap16(ParamValue16));

          for ParamIndex := 1 to ParamCount - 1 do
           begin
            // read next parameter value
            Read(ParamValue16, 2);

            // add parameter value to temporary string
            TempStr := TempStr + ', ' + IntToStr(Swap16(ParamValue16));
           end;
         end;
       end;
     $B0 :
       begin
        // read parameter value
        Read(ParamValue8, 1);

        // add parameter value to temporary string
        TempStr := TempStr + ' ' + IntToStr(ParamValue8);
       end;
     $B1..$B7 :
       begin
        // read first parameter value
        Read(ParamValue8, 1);

        // add parameter value to temporary string
        TempStr := TempStr + ' ' + IntToStr(ParamValue8);

        for ParamIndex := 0 to (Instruction - $B0) - 1 do
         begin
          // read next parameter value
          Read(ParamValue8, 1);

          // add parameter value to temporary string
          TempStr := TempStr + ', ' + IntToStr(ParamValue8);
         end;
       end;
     $B8 :
       begin
        // read parameter value
        Read(ParamValue16, 2);

        // add parameter value to temporary string
        TempStr := TempStr + ' ' + IntToStr(Swap16(ParamValue16));
       end;
     $B9..$BF :
       begin
        // read first parameter value
        Read(ParamValue16, 2);

        // add parameter value to temporary string
        TempStr := TempStr + ' ' + IntToStr(Swap16(ParamValue16));

        for ParamIndex := 0 to (Instruction - $B8) - 1 do
         begin
          // read next parameter value
          Read(ParamValue16, 2);

          // add parameter value to temporary string
          TempStr := TempStr + ', ' + IntToStr(Swap16(ParamValue16));
         end;
       end;
     $28, $83..$84, $8F..$AF : raise EPascalTypeError.CreateFmt(RCStrUnknownOpcode, [Instruction]);
    end;

    // add instruction to stream
    Strings.Add(TempStr);
   end;
end;

function ByteCodeToString(ByteCode: array of Byte): string;
var
  MS : TMemoryStream;
  SL : TStringList;
begin
 MS := TMemoryStream.Create;
 try
  MS.Read(ByteCode[0], Length(ByteCode));

  SL := TStringList.Create;
  try
   ByteCodeToStrings(MS, SL);
   Result := SL.Text;
  finally
   FreeAndNil(SL);
  end;

 finally
  FreeAndNil(MS);
 end;
end;

end.
