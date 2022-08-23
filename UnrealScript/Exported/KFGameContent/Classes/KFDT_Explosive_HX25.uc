//=============================================================================
// KFDT_Explosive_HX25
//=============================================================================
// Explosive damage type for the HX25 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_HX25 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HX25'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=100.000000
   StumblePower=150.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.770000
   KDeathVel=250.000000
   RadialDamageImpulse=500.000000
   Name="Default__KFDT_Explosive_HX25"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
