/*******************************************************************************
 * SequenceVariable generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SequenceVariable extends SequenceObject
    abstract
    native(Sequence)
    hidecategories(Object);

/** This is used by SeqVar_Named to find a variable anywhere in the levels sequence. */
var() name VarName;

defaultproperties
{
    ObjName="Undefined Variable"
    ObjColor=(B=0,G=0,R=0,A=255)
    bDrawLast=true
}