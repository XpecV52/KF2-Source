//=============================================================================
// KFDT_Fire_FlareGun
//=============================================================================
// Damage caused by heat and combustion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDT_Fire_FlareGun extends KFDT_Ballistic_Handgun
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
   BurnDamageType=Class'kfgamecontent.KFDT_Fire_FlareGunDoT'
   WeaponDef=Class'KFGame.KFWeapDef_FlareGun'
   EffectGroup=FXG_Flare
   KnockdownPower=15.000000
   StumblePower=100.000000
   GunHitPower=150.000000
   BurnPower=15.500000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Gunslinger'
   ModifierPerkList(2)=Class'KFGame.KFPerk_Sharpshooter'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   KDamageImpulse=1000.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Fire_FlareGun"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
