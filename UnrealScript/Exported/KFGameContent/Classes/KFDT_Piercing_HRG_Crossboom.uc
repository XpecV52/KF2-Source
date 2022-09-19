//=============================================================================
// KFDT_Piercing_HRG_Crossboom
//=============================================================================
// Damage type for HRG_Crossboom
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_HRG_Crossboom extends KFDT_Piercing
	abstract
	hidedropdown;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
	return false;
}

static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
{
    return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Crossboom'
   StumblePower=250.000000
   GunHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=0.000000
   Name="Default__KFDT_Piercing_HRG_Crossboom"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
