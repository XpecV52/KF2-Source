/*******************************************************************************
 * KFSeqEvent_DoshVault generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqEvent_DoshVault extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

enum EDoshVaultEvent
{
    DVE_Idle,
    DVE_IdleNoDosh,
    DVE_FillComplete,
    DVE_PauseFill,
    DVE_ResumeFill,
    DVE_Abort,
    DVE_MAX
};

var int DoshTier;

function NotifyIdle(Actor InInstigator, Actor InTrigger)
{
    local array<int> ActiveIndices;

    ActiveIndices[0] = 0;
    CheckActivate(InInstigator, InTrigger, false, ActiveIndices);
}

function NotifyIdleNoDosh(Actor InInstigator, Actor InTrigger)
{
    local array<int> ActiveIndices;

    ActiveIndices[0] = 1;
    CheckActivate(InInstigator, InTrigger, false, ActiveIndices);
}

function NotifyFillComplete(Actor InInstigator, Actor InTrigger)
{
    local array<int> ActiveIndices;

    ActiveIndices[0] = 2;
    CheckActivate(InInstigator, InTrigger, false, ActiveIndices);
}

function NotifyAbort(Actor InInstigator, Actor InTrigger)
{
    local array<int> ActiveIndices;

    ActiveIndices[0] = 3;
    CheckActivate(InInstigator, InTrigger, false, ActiveIndices);
}

function SetDoshTier(int TierValue)
{
    DoshTier = TierValue;
}

defaultproperties
{
    MaxTriggerCount=0
    OutputLinks(0)=(Links=none,LinkDesc="Idle",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="IdleNoDosh",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(2)=(Links=none,LinkDesc="FillComplete",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(3)=(Links=none,LinkDesc="Pause Fill",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(4)=(Links=none,LinkDesc="Resume Fill",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(5)=(Links=none,LinkDesc="Abort",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Tier Value",LinkVar=None,PropertyName=DoshTier,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Dosh Vault State Change"
    ObjCategory="Dosh Vault"
}