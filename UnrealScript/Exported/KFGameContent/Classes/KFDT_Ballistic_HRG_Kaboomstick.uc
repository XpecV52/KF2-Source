//=============================================================================
// KFDT_Ballistic_HRG_Kaboomstick
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Ballistic_HRG_Kaboomstick extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Kaboomstick'
   StumblePower=75.000000
   GunHitPower=45.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=3500.000000
   KDeathVel=650.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Ballistic_HRG_Kaboomstick"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
