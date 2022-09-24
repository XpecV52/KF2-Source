//=============================================================================
// KFDT_Ballistic_HRG_Dragonbreath
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRG_Dragonbreath extends KFDT_Ballistic_Shotgun
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

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{	
	// Overriden to specific a different damage type to do the burn damage over
	// time. We do this so we don't get shotgun pellet impact sounds/fx during
	// the DOT burning.
    if ( default.BurnDamageType.default.DoT_Type != DOT_None )
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.BurnDamageType);
    }
}

defaultproperties
{
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_HRG_DragonsBreathDoT'
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Dragonbreath'
   EffectGroup=FXG_IncendiaryRound
   StumblePower=40.000000
   GunHitPower=50.000000
   BurnPower=40.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   GibImpulseScale=1.000000
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=3500.000000
   KDeathVel=650.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Ballistic_HRG_Dragonbreath"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
