//=============================================================================
// KFDT_Explosive_M79
//=============================================================================
// Explosive damage type for the M79 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_M79 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_M79'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=150.000000
   StumblePower=400.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_M79"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
