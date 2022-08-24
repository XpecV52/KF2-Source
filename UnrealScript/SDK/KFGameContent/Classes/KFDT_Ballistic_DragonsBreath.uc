//=============================================================================
// KFDT_Ballistic_DragonsBreath
//=============================================================================
// Dragons breath damage type (mostly a copy of KFDT_Ballistic_Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 05/06/2015
//=============================================================================

class KFDT_Ballistic_DragonsBreath extends KFDT_Ballistic_Shotgun
	abstract
	hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

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
	GoreDamageGroup=DGT_Shotgun

	BloodSpread=0.4
	BloodScale=0.6

	KDamageImpulse=900
	KDeathUpKick=-500
	KDeathVel=350
	//KDamageImpulse=350
	//KDeathUpKick=120
	//KDeathVel=10

    KnockdownPower=0
	StumblePower=21
	LegStumblePower=21
	GunHitPower=12

	WeaponDef=class'KFWeapDef_DragonsBreath'

	// Even though with do DOT in a different class, we still
	// Need burn power here for the initial incap from the pellet
	// hit
    BurnPower=25.0// 5

	CameraLensEffectTemplate=class'KFCameraLensEmit_Fire'
	EffectGroup=FXG_IncendiaryRound
	BurnDamageType=class'KFDT_Fire_DragonsBreathDoT'

	ModifierPerkList(0)=class'KFPerk_Firebug'
}
