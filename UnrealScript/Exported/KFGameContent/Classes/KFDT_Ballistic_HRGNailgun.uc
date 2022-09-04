//=============================================================================
// KFDT_Ballistic_HRGNailgun
//=============================================================================
// Ballistic damage for nails fired from the HRG Nailgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGNailgun extends KFDT_Piercing
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
   WeaponDef=Class'KFGame.KFWeapDef_Nailgun_HRG'
   StumblePower=20.000000
   GunHitPower=20.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=600.000000
   KDeathVel=150.000000
   KDeathUpKick=200.000000
   Name="Default__KFDT_Ballistic_HRGNailgun"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
