/*******************************************************************************
 * SeqAct_SetMatInstScalarParam generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_SetMatInstScalarParam extends SequenceAction
    native(Sequence)
    hidecategories(Object);

var() MaterialInstanceConstant MatInst;
var() name ParamName;
var() float ScalarValue;

defaultproperties
{
    VariableLinks(0)=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="ScalarValue",LinkVar=None,PropertyName=ScalarValue,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set ScalarParam"
    ObjCategory="Material Instance"
}