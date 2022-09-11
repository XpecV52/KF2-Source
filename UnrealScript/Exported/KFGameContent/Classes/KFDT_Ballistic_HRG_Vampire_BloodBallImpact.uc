//=============================================================================
// KFDT_Ballistic_HRG_Vampire_BloodBallImpact
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRG_Vampire_BloodBallImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Vampire'
   EffectGroup=FXG_Toxic
   StumblePower=40.000000
   GunHitPower=40.000000
   PoisonPower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Ballistic_HRG_Vampire_BloodBallImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
