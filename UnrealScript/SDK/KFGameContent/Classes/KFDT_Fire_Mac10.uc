//=============================================================================
// KFDT_Fire_Mac10
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_Mac10 extends KFDT_Ballistic_DragonsBreath
	abstract
	hidedropdown;


defaultproperties
{
	GoreDamageGroup = DGT_Submachinegun
	WeaponDef=class'KFWeapDef_Mac10'
	ModifierPerkList(0)=class'KFPerk_Firebug'
	ModifierPerkList(1)=class'KFPerk_SWAT'

	BurnPower=18.5 //1.0
	GunHitPower=12
	
	CameraLensEffectTemplate = class'KFCameraLensEmit_Fire'
	EffectGroup = FXG_IncendiaryRound
	BurnDamageType=class'KFDT_Fire_Mac10DoT'
}
