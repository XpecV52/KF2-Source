//=============================================================================
// KFDT_Ballistic_HRG_Energy_Secondary
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRG_Energy_Secondary extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Energy'
   EffectGroup=FXG_Energy_Magenta
   KnockdownPower=20.000000
   StumblePower=100.000000
   GunHitPower=250.000000
   EMPPower=60.000000
   ModifierPerkList(0)=None
   ModifierPerkList(1)=None
   ModifierPerkList(2)=Class'KFGame.KFPerk_Gunslinger'
   Name="Default__KFDT_Ballistic_HRG_Energy_Secondary"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
