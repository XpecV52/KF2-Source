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
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_DragonsBreathDoT'
   WeaponDef=Class'KFGame.KFWeapDef_DragonsBreath'
   EffectGroup=FXG_IncendiaryRound
   StumblePower=21.000000
   LegStumblePower=21.000000
   GunHitPower=12.000000
   BurnPower=25.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=900.000000
   KDeathVel=350.000000
   KDeathUpKick=-500.000000
   Name="Default__KFDT_Ballistic_DragonsBreath"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
