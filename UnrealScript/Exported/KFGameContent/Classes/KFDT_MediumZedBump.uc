//=============================================================================
// KFDT_MediumZedBump
//=============================================================================
// The damage that is used to obliterate players and zeds when bumping them while enraged
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDT_MediumZedBump extends KFDT_HeavyZedBump
	abstract
	hidedropdown;
	

defaultproperties
{
   KnockdownPower=100.000000
   StumblePower=225.000000
   MeleeHitPower=25.000000
   KDamageImpulse=1600.000000
   Name="Default__KFDT_MediumZedBump"
   ObjectArchetype=KFDT_HeavyZedBump'kfgamecontent.Default__KFDT_HeavyZedBump'
}
