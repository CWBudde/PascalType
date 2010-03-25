unit PT_ResourceStrings;

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

resourcestring
  RCStrCharMapError = 'Error in character map';
  RCStrCharMapErrorEndCount = 'Error in Character Map: wrong end count (%d)';
  RCStrCharMapErrorIdDelta = 'Error in Character Map: wrong ID delta (%d)';
  RCStrCharMapErrorReserved = 'Error in Character Map: wrong reserved value (%d)';
  RCStrCharMapErrorStartCount = 'Error in Character Map: wrong start count (%d)';
  RCStrChecksumError = 'Checksum error at table ''%s''';
  RCStrCompositeGlyphFlagError = 'Composite Glyph Flag Error';
  RCStrErrorInKerningSubTable = 'Error in kerning subtable format 0';
  RCStrGlyphDataFlagRepeatError = 'Flag repeat error: %d / %d';
  RCStrGlyphDataFlagReservedError = 'Flag ''Reserved'' error at point: %d / %d';
  RCStrHeaderFlagError = 'Header flag error';
  RCStrHorizontalHeaderReserved = 'Horizontal Header Reserved Value <> 0';
  RCStrIndexOutOfBounds = 'Index out of bounds (%d)';
  RCStrInvalidInstruction = 'Invalid Instruction';
  RCStrNoHorizontalHeader = 'Horizontal header not found';
  RCStrNoMagic = 'There is no magic in it!';
  RCStrNotImplemented = 'not implemented';
  RCStrNoVerticalHeader = 'Vertical header not found';
  RCStrTableIncomplete = 'Could not load the table entirely!';
  RCStrTablesMissing = 'Not all required tables are present!';
  RCStrTooManyContours = 'Too many contours (%d / %d)';
  RCStrTooManyInstructions = 'Too many instructions (%d)';
  RCStrTooManyPoints = 'Too many points (%d)';
  RCStrUnknownClassDefinition = 'Unknown class definition format';
  RCStrUnknownFormat = 'Unknown format!';
  RCStrUnknownGlyphDataType = 'Unknown glyph data type (%d)';
  RCStrUnknownOpcode = 'Unknown opcode (%d)';
  RCStrUnknownVersion = 'Unknown version';
  RCStrUnsupportedPlatform = 'Unsupported Platform ID (%d)';
  RCStrUnsupportedVersion = 'Unsupported version';
  RCStrWrongCharacterIndex = 'Wrong character index!';
  RCStrWrongEntrySelector = 'Wrong entry selector!';
  RCStrWrongFilesize = 'Wrong file size!';
  RCStrWrongRangeShift = 'Wrong range shift!';
  RCStrWrongSearchRange = 'Wrong search range!';

implementation

end.
