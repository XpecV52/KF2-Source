//=============================================================================
// KFDT_Explosive_GravityImploder
//=============================================================================
// Explosive damage type for the Gravity Imploder explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_GravityImploder extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_GravityImploder'
   bShouldSpawnPersistentBlood=True
   StumblePower=200.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.850000
   KDeathVel=200.000000
   KDeathUpKick=-200.000000
   RadialDamageImpulse=-200.000000
   Name="Default__KFDT_Explosive_GravityImploder"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
