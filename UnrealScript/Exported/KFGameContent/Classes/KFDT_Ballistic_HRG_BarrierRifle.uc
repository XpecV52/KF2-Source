//=============================================================================
// KFDT_Ballistic_HRG_BarrierRifle
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_HRG_BarrierRifle extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_BarrierRifle'
   StumblePower=20.000000
   GunHitPower=20.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_HRG_BarrierRifle"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
