//=============================================================================
// KFDT_Explosive_HuskCannon
//=============================================================================
// Explosive damage type for the Husk Cannon fireball
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_HuskCannon extends KFDT_Explosive
    abstract
    hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

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
   BurnDamageType=Class'KFGame.KFDT_HuskCannonDot'
   WeaponDef=Class'KFGame.KFWeapDef_HuskCannon'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=50.000000
   StumblePower=170.000000
   MeleeHitPower=50.000000
   BurnPower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.150000
   bExtraMomentumZ=False
   KDamageImpulse=900.000000
   KDeathVel=500.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Explosive_HuskCannon"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
