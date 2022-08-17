//=============================================================================
// KFDT_Ballistic_Shotgun
//=============================================================================
// Container class for shotgun damage types
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 11/22/2013
//=============================================================================

class KFDT_Ballistic_Shotgun extends KFDT_Ballistic
	abstract
	hidedropdown;

/** Allows the damage type to map a hit zone to a different bone for dismemberment purposes. */
static simulated function GetBoneToDismember(KFPawn_Monster InPawn, vector HitDirection, name InHitZoneName, out name OutBoneName)
{
	local KFCharacterInfo_Monster MonsterInfo;

	MonsterInfo = InPawn.GetCharacterMonsterInfo();
    if ( MonsterInfo != none )
	{
		// Randomly pick the left or right shoulder to dismember
		if( InHitZoneName == 'chest')
		{
			OutBoneName = Rand(2) == 0 ? MonsterInfo.SpecialMeleeDismemberment.LeftShoulderBoneName : MonsterInfo.SpecialMeleeDismemberment.RightShoulderBoneName;
		}
	}
}

/**
 * This allows us to customize how much gore damage to apply (for gore fx)
 * independently of the actual damage. It also allows the damage type to attenuate
 * the damage based on distance e.g for shotgun damage
 */
static function float GetGoreDamageScale(vector Location, vector InstigatorLocation)
{
	local float DistSq;

	DistSq = VSizeSq(InstigatorLocation - Location);
	if( DistSq > 1000000 )
	{
		// Quarter damage if more than 10m away
		return 0.25;
	}
	else if (DistSq > 160000 )
	{
		// Half damage if more than 4m away
		return 0.5;
	}
	else
	{
		// Full damage for anything closer than 2m
		return 1.0;
	}
}

defaultproperties
{
	GoreDamageGroup=DGT_Shotgun
	ModifierPerkList(0)=class'KFPerk_Support'
	HeadDestructionDamageScale=7.0
	HeadDestructionImpulseForceScale=7.0
}
