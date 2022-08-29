//=============================================================================
// KFDT_Slashing_AbominationAxeHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_AbominationAxeHeavy extends KFDT_Slashing_ZweihanderHeavy
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_AbominationAxe'
   bCanGib=True
   bCanObliterate=True
   bUseHitLocationForGibImpulses=True
   bPointImpulseTowardsOrigin=True
   GoreDamageGroup=DGT_Explosive
   KnockdownPower=150.000000
   StumblePower=250.000000
   ObliterationDamageThreshold=100
   MaxObliterationGibs=12.000000
   ImpulseOriginScale=100.000000
   ImpulseOriginLift=150.000000
   KDamageImpulse=3600.000000
   KDeathVel=750.000000
   KDeathUpKick=400.000000
   RadialDamageImpulse=8000.000000
   Name="Default__KFDT_Slashing_AbominationAxeHeavy"
   ObjectArchetype=KFDT_Slashing_ZweihanderHeavy'kfgamecontent.Default__KFDT_Slashing_ZweihanderHeavy'
}
