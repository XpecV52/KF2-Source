//=============================================================================
// KFDT_Ballistic_NailShotgun
//=============================================================================
// Ballistic damage for nails fired from the Nail Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_NailShotgun extends KFDT_Ballistic_Shotgun
	abstract
	hidedropdown;

/**
 * Returns the class of the projectile to spawn if the weapon using this damage
 * type can pin a zed when it kills it
 */
static simulated function class<KFProj_PinningBullet> GetPinProjectileClass()
{
    return class'KFProj_Nail_Nailgun';
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Nailgun'
   StumblePower=24.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Support'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=400.000000
   KDeathVel=15.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_NailShotgun"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
