//=============================================================================
// KFDT_Explosive_Thermite
//=============================================================================
// Explosive damage type for the Seal Squeal
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_Thermite extends KFDT_Fire
	abstract
	hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

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
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_ThermiteExplosionDoT'
   WeaponDef=Class'KFGame.KFWeapDef_ThermiteBore'
   bShouldSpawnPersistentBlood=True
   StumblePower=200.000000
   BurnPower=50.000000
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_Thermite"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
