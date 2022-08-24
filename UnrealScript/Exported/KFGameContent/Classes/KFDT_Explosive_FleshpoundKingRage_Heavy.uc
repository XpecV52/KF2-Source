//=============================================================================
// KFDT_Explosive_FleshpoundKingRage_Heavy
//=============================================================================
// Explosive damage type for Fleshpound King's light rage pound
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFDT_Explosive_FleshpoundKingRage_Heavy extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bNoInstigatorDamage=True
   bShouldSpawnPersistentBlood=True
   KnockdownPower=400.000000
   StumblePower=0.000000
   ObliterationHealthThreshold=-10
   ObliterationDamageThreshold=15
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2500.000000
   Name="Default__KFDT_Explosive_FleshpoundKingRage_Heavy"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
