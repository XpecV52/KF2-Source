//=============================================================================
// KFDT_Ballistic_SealSquealImpact
//=============================================================================
// Rocket impact damage type for the SealSqueal rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_SealSquealImpact extends KFDT_Ballistic_Shell
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
   WeaponDef=Class'KFGame.KFWeapDef_SealSqueal'
   StumblePower=340.000000
   GunHitPower=275.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=0.000000
   Name="Default__KFDT_Ballistic_SealSquealImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
