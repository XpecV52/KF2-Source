/*******************************************************************************
 * SeqAct_Delay generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_Delay extends SeqAct_Latent
    native(Sequence)
    hidecategories(Object);

var const bool bDelayActive;
/** When set triggering start again with restart the time without triggering the finished output, otherwise default behavior of not changing the initial delay time */
var() bool bStartWillRestart;
var const float DefaultDuration;
/** Default duration to use if no variables are linked */
var() float Duration<autocomment=true>;
var const float LastUpdateTime;
var const float RemainingTime;

function Reset()
{
    ResetDelayActive();
}

// Export USeqAct_Delay::execResetDelayActive(FFrame&, void* const)
native function ResetDelayActive();

defaultproperties
{
    DefaultDuration=1
    Duration=1
    InputLinks(0)=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(2)=(LinkDesc="Pause",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(0)=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Duration",LinkVar=None,PropertyName=Duration,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Delay"
    ObjCategory="Misc"
}