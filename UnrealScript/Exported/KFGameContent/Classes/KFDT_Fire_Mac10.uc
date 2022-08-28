//=============================================================================
// KFDT_Fire_Mac10
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_Mac10 extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;


// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
	if (super.CanDismemberHitZone(InHitZoneName))
	{
		return true;
	}

	switch (InHitZoneName)
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
   BurnDamageType=Class'KFGame.KFDT_Fire_Mac10DoT'
   WeaponDef=Class'KFGame.KFWeapDef_Mac10'
   EffectGroup=FXG_IncendiaryRound
   StumblePower=12.000000
   LegStumblePower=12.000000
   GunHitPower=12.000000
   BurnPower=18.500000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   ModifierPerkList(1)=Class'KFGame.KFPerk_SWAT'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   Name="Default__KFDT_Fire_Mac10"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
