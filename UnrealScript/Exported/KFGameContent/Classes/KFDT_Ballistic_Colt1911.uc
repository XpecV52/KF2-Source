//=============================================================================
// KFDT_Ballistic_Colt1911
//=============================================================================
// Colt 1911 pistol damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Ballistic_Colt1911 extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Colt1911'
   KnockdownPower=15.000000
   StumblePower=20.000000
   GunHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=1500.000000
   KDeathVel=200.000000
   KDeathUpKick=-450.000000
   Name="Default__KFDT_Ballistic_Colt1911"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
