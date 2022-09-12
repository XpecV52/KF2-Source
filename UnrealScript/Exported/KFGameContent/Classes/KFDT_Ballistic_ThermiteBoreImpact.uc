//=============================================================================
// KFDT_Ballistic_ThermiteBoreImpact
//=============================================================================
// Rocket impact damage type for the Thermite rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_ThermiteBoreImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
	return false;
}

static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
{
    return false;
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
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_ThermiteImpactDoT'
   WeaponDef=Class'KFGame.KFWeapDef_ThermiteBore'
   KnockdownPower=50.000000
   StumblePower=350.000000
   GunHitPower=300.000000
   BurnPower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   KDamageImpulse=0.000000
   Name="Default__KFDT_Ballistic_ThermiteBoreImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
