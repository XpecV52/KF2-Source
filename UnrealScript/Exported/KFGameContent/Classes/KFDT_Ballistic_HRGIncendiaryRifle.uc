//=============================================================================
// KFDT_Ballistic_HRGIncendiaryRifle
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGIncendiaryRifle extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

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
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_HRGIncendiaryRifleBulletDoT'
   WeaponDef=Class'KFGame.KFWeapDef_HRGIncendiaryRifle'
   EffectGroup=FXG_IncendiaryRound
   GunHitPower=0.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_HRGIncendiaryRifle"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
