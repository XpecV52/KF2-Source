//=============================================================================
// KFDT_Piercing_NailFragment
//=============================================================================
// Nail bomb grenade nail damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_Piercing_NailFragment extends KFDT_Piercing
	abstract
	hidedropdown;





































	















#linenumber 14;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	switch ( InHitZoneName )
	{
	 	case 'lhand':
		case 'rhand':
		case 'lfoot':
		case 'rfoot':
		case 'lforearm':
		case 'rforearm':
		case 'lcalf':
		case 'rcalf':
		case 'lthigh':
		case 'rthigh':
	 		return true;
	}

	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Gunslinger'
   bShouldSpawnBloodSplat=True
   bShouldSpawnPersistentBlood=True
   GunHitPower=25
   MeleeHitPower=20
   EffectGroup=FXG_Ballistic
   GoreDamageGroup=DGT_Handgun
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   BodyWoundDecalMaterials(0)=MaterialInstanceConstant'FX_Gore_MAT.FX_CH_Wound_01_Mic'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=400.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_NailFragment"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
