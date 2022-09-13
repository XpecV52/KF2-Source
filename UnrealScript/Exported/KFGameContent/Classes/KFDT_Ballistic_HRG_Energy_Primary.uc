//=============================================================================
// KFDT_Ballistic_HRG_Energy_Primary
//=============================================================================
// HRG Energy Gun Damage Type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRG_Energy_Primary extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Energy'
   EffectGroup=FXG_Energy_Yellow
   StumblePower=15.000000
   GunHitPower=175.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_HRG_Energy_Primary"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
