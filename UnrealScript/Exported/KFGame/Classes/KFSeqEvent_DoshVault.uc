//=============================================================================
// KFSeqEvent_DoshVault
//=============================================================================
// Called when we need to start filling the dosh vault
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Zane Gholson
//=============================================================================

class KFSeqEvent_DoshVault extends SequenceEvent;

var int DoshTier;

enum EDoshVaultEvent
{
    DVE_Idle,
    DVE_IdleNoDosh,
    DVE_FillComplete,
    DVE_PauseFill,
    DVE_ResumeFill,
    DVE_Abort,
};

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
   OutputLinks(0)=(LinkDesc="Idle")
   OutputLinks(1)=(LinkDesc="IdleNoDosh")
   OutputLinks(2)=(LinkDesc="FillComplete")
   OutputLinks(3)=(LinkDesc="Pause Fill")
   OutputLinks(4)=(LinkDesc="Resume Fill")
   OutputLinks(5)=(LinkDesc="Abort")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Tier Value",PropertyName="DoshTier")
   ObjName="Dosh Vault State Change"
   ObjCategory="Dosh Vault"
   Name="Default__KFSeqEvent_DoshVault"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
