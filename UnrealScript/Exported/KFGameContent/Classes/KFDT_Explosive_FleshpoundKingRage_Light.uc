//=============================================================================
// KFDT_Explosive_FleshpoundKingRage_Light
//=============================================================================
// Explosive damage type for Fleshpound King's light rage pound
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFDT_Explosive_FleshpoundKingRage_Light extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bNoInstigatorDamage=True
   bShouldSpawnPersistentBlood=True
   KnockdownPower=0.000000
   StumblePower=400.000000
   ObliterationHealthThreshold=-7
   ObliterationDamageThreshold=15
   KDeathVel=100.000000
   KDeathUpKick=300.000000
   RadialDamageImpulse=200.000000
   Name="Default__KFDT_Explosive_FleshpoundKingRage_Light"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
