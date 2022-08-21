//=============================================================================
// KFDT_ExplosiveSubmunition_HX25
//=============================================================================
// Explosive damage type for the HX25 Grenade launcher grenade submunitions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_ExplosiveSubmunition_HX25 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HX25'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=5.000000
   StumblePower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=250.000000
   KDeathUpKick=350.000000
   RadialDamageImpulse=2500.000000
   Name="Default__KFDT_ExplosiveSubmunition_HX25"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
