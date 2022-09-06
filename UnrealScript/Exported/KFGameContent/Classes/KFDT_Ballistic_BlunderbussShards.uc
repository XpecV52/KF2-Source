//=============================================================================
// KFDT_Ballistic_BlunderbussShards
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_BlunderbussShards extends KFDT_Piercing
	abstract
	hidedropdown;

/**
 * Returns the class of the projectile to spawn if the weapon using this damage
 * type can pin a zed when it kills it
 */
static simulated function class<KFProj_PinningBullet> GetPinProjectileClass()
{
    return class'KFProj_Nail_Blunderbuss';
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Blunderbuss'
   StumblePower=40.000000
   GunHitPower=40.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Support'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=2500.000000
   KDeathVel=1200.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Ballistic_BlunderbussShards"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
