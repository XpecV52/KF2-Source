//=============================================================================
// KFDT_Explosive_M16M203
//=============================================================================
// Explosive damage type for the M16M203 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// -Brooks Butler
//=============================================================================

class KFDT_Explosive_M16M203 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_M16M203'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=150.000000
   StumblePower=400.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_M16M203"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
