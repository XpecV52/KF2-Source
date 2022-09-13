//=============================================================================
// KFDT_Explosive_GravityImploderWave
//=============================================================================
// Explosive damage type for the Gravity Imploder shockwave
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_HRG_Boomy extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Boomy'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=7.000000
   StumblePower=20.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_HRG_Boomy"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
