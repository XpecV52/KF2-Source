/*******************************************************************************
 * KFSeqAct_TriggerMapObjective generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_TriggerMapObjective extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var Actor objective;

event Activated()
{
    local KFGameReplicationInfo KFGRI;

    if(NotEqual_InterfaceInterface(KFInterface_MapObjective(objective), (none)))
    {
        KFGRI = KFGameReplicationInfo(GetWorldInfo().GRI);
        if(KFGRI != none)
        {
            if(InputLinks[0].bHasImpulse)
            {
                KFGRI.ActivateObjective(KFInterface_MapObjective(objective));                
            }
            else
            {
                if(InputLinks[1].bHasImpulse)
                {
                    KFGRI.DeactivateObjective();
                }
            }
        }
    }
}

defaultproperties
{
    InputLinks(0)=(LinkDesc="Activate",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Deactivate",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Objective",LinkVar=None,PropertyName=objective,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Activate Map Objective"
    ObjCategory="Killing Floor"
}