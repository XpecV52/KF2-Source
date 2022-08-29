//=============================================================================
// KFDT_Ballistic_MicrowaveRifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_MicrowaveRifle extends KFDT_Microwave
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
	 		return true;
	}

	return false;
}

/** Play damage type specific impact effects when taking damage */
static function PlayImpactHitEffects(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
	// Play burn effect when dead
	if (P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath)
	{
		default.BurnDamageType.static.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
		return;
	}

	super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
	// Overriden to specific a different damage type to do the burn damage over
	// time. We do this so we don't get shotgun pellet impact sounds/fx during
	// the DOT burning.
	if (default.BurnDamageType.default.DoT_Type != DOT_None)
	{
		Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.BurnDamageType);
	}
}

defaultproperties
{
   BurnDamageType=Class'KFGame.KFDT_Fire_MicrowaveRifleDoT'
   WeaponDef=Class'KFGame.KFWeapDef_MicrowaveRifle'
   EffectGroup=FXG_MicrowaveProj
   StumblePower=18.000000
   BurnPower=10.000000
   MicrowavePower=30.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   GibImpulseScale=0.850000
   KDamageImpulse=550.000000
   KDeathVel=200.000000
   KDeathUpKick=-200.000000
   Name="Default__KFDT_Ballistic_MicrowaveRifle"
   ObjectArchetype=KFDT_Microwave'KFGame.Default__KFDT_Microwave'
}
