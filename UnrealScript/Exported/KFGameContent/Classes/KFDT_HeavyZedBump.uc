//=============================================================================
// KFDT_HeavyZedBump
//=============================================================================
// The damage that is used to obliterate players and zeds when bumping them while enraged
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_HeavyZedBump extends KFDamageType
	abstract
	hidedropdown;
	

defaultproperties
{
   bCanGib=True
   bCanObliterate=True
   bUseHitLocationForGibImpulses=True
   bPointImpulseTowardsOrigin=True
   bIgnoreZedOnZedScaling=True
   GoreDamageGroup=DGT_Explosive
   KnockdownPower=200.000000
   StumblePower=550.000000
   MeleeHitPower=100.000000
   ObliterationDamageThreshold=1
   MaxObliterationGibs=12.000000
   ImpulseOriginScale=100.000000
   ImpulseOriginLift=150.000000
   KDamageImpulse=3200.000000
   KDeathVel=375.000000
   KDeathUpKick=700.000000
   RadialDamageImpulse=8000.000000
   Name="Default__KFDT_HeavyZedBump"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
