//=============================================================================
// KFDT_Explosive_FragGrenade
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_FragGrenade extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Support'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=0.000000
   StumblePower=500.000000
   MeleeHitPower=100.000000
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_FragGrenade"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
