//=============================================================================
// KFInterface_MinigameTarget
//=============================================================================
// Anim notify that has some specialty code related to whether or not a sound
//      attached to a minigame target can be played.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFAnimNotify_AkEvent_IfActiveMGTarget extends AnimNotify_AkEvent
    native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event bool CanPlayAkEvent(Actor inOwner)
{
    if (KFInterface_MinigameActor(inOwner) != none)
    {
        return KFInterface_MinigameActor(inOwner).CanPlayAkEvent(inOwner, BoneName);
    }

    return false;
}

defaultproperties
{
   Name="Default__KFAnimNotify_AkEvent_IfActiveMGTarget"
   ObjectArchetype=AnimNotify_AkEvent'Engine.Default__AnimNotify_AkEvent'
}
