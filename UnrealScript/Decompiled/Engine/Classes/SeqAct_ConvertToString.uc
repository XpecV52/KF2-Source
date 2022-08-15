/*******************************************************************************
 * SeqAct_ConvertToString generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_ConvertToString extends SequenceAction
    native(Sequence)
    hidecategories(Object);

var() bool bIncludeVarComment;
var() string VarSeparator;
var() int NumberOfInputs;

static event int GetObjClassVersion()
{
    return super(SequenceObject).GetObjClassVersion() + 1;
}

defaultproperties
{
    bIncludeVarComment=true
    VarSeparator=", "
    NumberOfInputs=1
    VariableLinks(0)=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Inputs",LinkVar=None,PropertyName=Targets,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=true,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'SeqVar_String',LinkedVariables=none,LinkDesc="Output",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Convert To String"
    ObjCategory="Misc"
}