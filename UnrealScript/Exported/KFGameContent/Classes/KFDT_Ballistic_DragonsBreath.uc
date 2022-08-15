//=============================================================================
// KFDT_Ballistic_DragonsBreath
//=============================================================================
// Dragons breath damage type (mostly a copy of KFDT_Ballistic_Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 05/06/2015
//=============================================================================

class KFDT_Ballistic_DragonsBreath extends KFDT_Ballistic
	abstract
	hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;






































	















#linenumber 18;

/** Allows the damage type to customize exactly which hit zones it can dismember */
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

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
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

/** Play damage type specific impact effects when taking damage */
static function PlayImpactHitEffects( KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator )
{
	// Play burn effect when dead
	if( P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath )
	{
		default.BurnDamageType.static.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
		return;
	}

	super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

/** Whether this damage type can apply damage over time */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT,  optional Controller InstigatedBy )
{
	// Overriden to specific a different damage type to do the burn damage over
	// time. We do this so we don't get shotgun pellet impact sounds/fx during
	// the DOT burning.
    KFDT = default.BurnDamageType;
    return KFDT.default.DoT_Type != DOT_None;
}

defaultproperties
{
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_DragonsBreathDoT'
   WeaponDef=Class'KFGame.KFWeapDef_DragonsBreath'
   StumblePower=53
   LegStumblePower=53
   GunHitPower=30
   EffectGroup=FXG_IncendiaryRound
   GoreDamageGroup=DGT_Shotgun
   BurnPower=0.500000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=350.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_DragonsBreath"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
