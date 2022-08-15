/*******************************************************************************
 * SeqEvent_Mover generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqEvent_Mover extends SequenceEvent
    native(Sequence)
    hidecategories(Object,SequenceEvent);

/**  
 *how long the mover should stay open before automatically closing (reverse playback)
 * values <= 0.0 turn off this auto behavior and allow manual control (via the "Completed" and "Reversed" output links for the attached matinee action)
 */
var() float StayOpenTime;

event RegisterEvent()
{
    local InterpActor Mover;

    Mover = InterpActor(Originator);
    if(Mover != none)
    {
        Mover.StayOpenTime = StayOpenTime;
    }
}

function NotifyEncroachingOn(Actor Hit)
{
    local SeqVar_Object ObjVar;
    local array<int> ActivateIndices;

    ActivateIndices[0] = 3;
    if(CheckActivate(Originator, Instigator, false, ActivateIndices, true))
    {
        foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "Actor Hit")
        {
            ObjVar.SetObjectValue(Hit);            
        }        
    }
}

function NotifyAttached(Actor Other)
{
    local array<int> ActivateIndices;

    if((Pawn(Other) != none) && IsZero(Originator.Velocity))
    {
        ActivateIndices[0] = 0;
        CheckActivate(Originator, Other, false, ActivateIndices);
    }
}

function NotifyDetached(Actor Other)
{
    local Pawn P;
    local array<int> ActivateIndices;

    if(Originator == none)
    {
        WarnInternal("Originator mover missing");        
    }
    else
    {
        if(Pawn(Other) != none)
        {
            foreach Originator.BasedActors(Class'Pawn', P)
            {                
                return;                
            }            
            ActivateIndices[0] = 1;
            CheckActivate(Originator, Instigator, false, ActivateIndices);
        }
    }
}

function NotifyFinishedOpen()
{
    local array<int> ActivateIndices;

    ActivateIndices[0] = 2;
    CheckActivate(Originator, Instigator, false, ActivateIndices);
}

defaultproperties
{
    StayOpenTime=1.5
    MaxTriggerCount=0
    bPlayerOnly=false
    OutputLinks(0)=(Links=none,LinkDesc="Pawn Attached",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Pawn Detached",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(2)=(Links=none,LinkDesc="Open Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(3)=(Links=none,LinkDesc="Hit Actor",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Actor Hit",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Mover"
    ObjCategory="Physics"
}