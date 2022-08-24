//=============================================================================
// KFSeqEvent_MinigameGeneratorStateChanged
//=============================================================================
// Called when a minigame generator turns on or off.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFSeqEvent_MinigameGeneratorStateChanged extends SequenceEvent;

function StateChanged(Actor InInstigator, Actor InTrigger, bool bIsActive, bool bReactivated)
{
    local array<int> ActiveIndices;

    if (bIsActive)
    {
        if (bReactivated)
        {
            ActiveIndices[0] = 2;
        }
        else
        {
            ActiveIndices[0] = 0;
        }        
    }
    else
    {
        ActiveIndices[0] = 1;
    }

    CheckActivate(InInstigator, InTrigger, false, ActiveIndices);
}

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Active")
   OutputLinks(1)=(LinkDesc="Inactive")
   OutputLinks(2)=(LinkDesc="Reactivate")
   ObjName="Minigame Generator State Changed"
   Name="Default__KFSeqEvent_MinigameGeneratorStateChanged"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
