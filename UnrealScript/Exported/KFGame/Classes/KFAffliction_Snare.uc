//=============================================================================
// KFAffliction_Snare
//=============================================================================
// The snare (slowing down) affliction
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFAffliction_Snare extends KFAfflictionAdvanced;

/** */
function Activate()
{
	if( !bIsActive )
	{
		super.Activate();
		PawnOwner.SetTimer(Duration, false, nameof(DeActivate), self);
		bIsActive = true;		
		PawnOwner.SetAfflictionSpeedModifier();
	}
}

function DeActivate()
{
	bIsActive = false;
	if (bDebug) LogInternal(self@"was deactivaed");
	PawnOwner.SetAfflictionSpeedModifier();
}

/** Accessor to get known affliction speed modifier */
function float GetSpeedModifier()
{
    return bIsActive ? class'KFPerk_SWAT'.static.GetSnareSpeedModifier() : 1.f;
}

defaultproperties
{
   Name="Default__KFAffliction_Snare"
   ObjectArchetype=KFAfflictionAdvanced'KFGame.Default__KFAfflictionAdvanced'
}
