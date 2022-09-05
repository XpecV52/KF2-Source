//=============================================================================
// KFDT_Ballistic_MosinNagantSpecial
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
// For use with the Mosin Nagant "bullet stab"
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_MosinNagantSpecial extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MosinNagant'
   KnockdownPower=200.000000
   StumblePower=150.000000
   GunHitPower=150.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   KDamageImpulse=2500.000000
   KDeathVel=300.000000
   KDeathUpKick=450.000000
   Name="Default__KFDT_Ballistic_MosinNagantSpecial"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
