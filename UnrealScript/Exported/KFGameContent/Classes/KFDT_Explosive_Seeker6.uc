//=============================================================================
// KFDT_Explosive_Seeker6
//=============================================================================
// Explosive damage type for the Seeker6 rocket launcher rocket
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_Seeker6 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Seeker6'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=40.000000
   StumblePower=70.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   ObliterationHealthThreshold=-500
   ObliterationDamageThreshold=500
   KDeathVel=500.000000
   KDeathUpKick=2000.000000
   RadialDamageImpulse=10000.000000
   Name="Default__KFDT_Explosive_Seeker6"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
