//=============================================================================
// KFDT_Ballistic_HRGScorcherLightingImpact
//=============================================================================
// Damage caused by heat and combustion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================
class KFDT_Ballistic_HRGScorcherLightingImpact extends KFDT_Ballistic_Handgun
	abstract;

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
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_HRGScorcherDoT'
   WeaponDef=Class'KFGame.KFWeapDef_HRGScorcher'
   EffectGroup=FXG_Flare
   KnockdownPower=70.000000
   StumblePower=400.000000
   GunHitPower=275.000000
   BurnPower=45.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   KDamageImpulse=1000.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_HRGScorcherLightingImpact"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
