//=============================================================================
// KFDT_Explosive_PlayerZedTakeover
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_PlayerZedTakeover extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bShouldSpawnPersistentBlood=True
   KnockdownPower=0.000000
   StumblePower=0.000000
   ObliterationHealthThreshold=0
   ObliterationDamageThreshold=1
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_PlayerZedTakeover"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
