//=============================================================================
// KFDT_Fire_Ground_HRGIncendiaryRifle
//=============================================================================
// Damage type class for the ground fire and the residual flames from the
// HRG Incendiary Rifle Grenade
// =============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_Ground_HRGIncendiaryRifle extends KFDT_Fire_Ground
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGIncendiaryRifle'
   bNoInstigatorDamage=True
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_Ground_HRGIncendiaryRifle"
   ObjectArchetype=KFDT_Fire_Ground'KFGame.Default__KFDT_Fire_Ground'
}
