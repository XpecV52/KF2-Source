/*******************************************************************************
 * KFSeqAct_FlickerLightning generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_FlickerLightning extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local SeqVar_Object ObjVar;
    local KFDominantDirectionalLightning Lightning;

    if(InputLinks[0].bHasImpulse)
    {
        foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "KF Dominant Directional Lightning")
        {
            Lightning = KFDominantDirectionalLightning(ObjVar.GetObjectValue());
            break;            
        }        
        if(Lightning == none)
        {
            return;
        }
        Lightning.TriggerAnimation();
    }
}

defaultproperties
{
    bCallHandler=false
    InputLinks(0)=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="KF Dominant Directional Lightning",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Flicker Lightning"
    ObjCategory="Killing Floor"
}