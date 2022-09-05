//=============================================================================
// KFDT_Fire_Ground_HuskCannon
//=============================================================================
// A damage type for KFProj_HuskCannon_Fireball for the Husk Cannon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Fire_Ground_HuskCannon extends KFDT_Fire_Ground
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HuskCannon'
   BurnPower=10.500000
   Name="Default__KFDT_Fire_Ground_HuskCannon"
   ObjectArchetype=KFDT_Fire_Ground'KFGame.Default__KFDT_Fire_Ground'
}
