//=============================================================================
// KFDT_Explosive_HRG_Kaboomstick
//=============================================================================
// Explosive damage type for the HRG Kaboomstick explosive pellets
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Explosive_HRG_Kaboomstick extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Kaboomstick'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=5.000000
   StumblePower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.770000
   KDeathVel=250.000000
   RadialDamageImpulse=500.000000
   Name="Default__KFDT_Explosive_HRG_Kaboomstick"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
