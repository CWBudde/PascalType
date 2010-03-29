////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  PascalType - Compiler Switches                                            //
//  ------------------------------                                            //
//                                                                            //
//  With this include file you can finetune some settings. Not all of them    //
//  are documented in full length, but at least a hint is given here as well. //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

{ Enable this option, if you want to check even reserved values and other
  not mandatory values. }
{$DEFINE AmbigiousExceptions}

{ This compiler switch enables the checksum test for each table. To ensure the
  font file is valid this should be enabled. However some older fonts contain
  invalid checksums, which will result in an exception. }
{$DEFINE ChecksumTest}

{ Enable this option, if you want to enable using floating points where
  applicable. If this is disabled you may be able to use this library on
  processors that do not support floating point operations or run too slow. }
{$DEFINE UseFloatingPoint}