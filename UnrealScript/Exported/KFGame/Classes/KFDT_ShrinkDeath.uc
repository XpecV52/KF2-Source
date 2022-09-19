//=============================================================================
// KFDT_ShrinkDeath
//=============================================================================
// damage applied for killind zeds by shrinking them
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_ShrinkDeath extends KFDamageType;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_ShrinkRayGun'
   bCanGib=True
   bIgnoreAggroOnDamage=True
   bCanObliterate=True
   bUseHitLocationForGibImpulses=True
   bPointImpulseTowardsOrigin=True
   ObliterationDamageThreshold=1
   MaxObliterationGibs=12.000000
   ImpulseOriginScale=100.000000
   ImpulseOriginLift=150.000000
   RadialDamageImpulse=1000.000000
   Name="Default__KFDT_ShrinkDeath"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
