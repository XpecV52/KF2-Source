//=============================================================================
// KFDT_Explosive_RPG7
//=============================================================================
// Explosive damage type for the RPG rocket launcher rocket
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_RPG7 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_RPG7'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=225.000000
   StumblePower=400.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   ObliterationHealthThreshold=-500
   ObliterationDamageThreshold=500
   GibImpulseScale=0.150000
   KDeathVel=500.000000
   KDeathUpKick=1500.000000
   RadialDamageImpulse=2500.000000
   Name="Default__KFDT_Explosive_RPG7"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
