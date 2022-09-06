//=============================================================================
// KFDT_Explosive_Blunderbuss
//=============================================================================
// Explosive damage type for the Blunderbuss Cannonball explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Explosive_Blunderbuss extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Blunderbuss'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=150.000000
   StumblePower=400.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_Blunderbuss"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
