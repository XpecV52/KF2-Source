//=============================================================================
// KFDT_Ballistic_FAMAS_Rifle
//=============================================================================
// Damage type class for the FAMAS rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_FAMAS_Rifle extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FAMAS'
   StumblePower=12.000000
   GunHitPower=0.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Commando'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Support'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_FAMAS_Rifle"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
