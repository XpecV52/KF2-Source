//=============================================================================
// KFDT_Explosive_HEGrenade
//=============================================================================
// Explosive damage type for high explosive grenades
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_HEGrenade extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Commando'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=0.000000
   StumblePower=50.000000
   MeleeHitPower=200.000000
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_HEGrenade"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
