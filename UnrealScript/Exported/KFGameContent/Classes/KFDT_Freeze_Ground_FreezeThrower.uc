//=============================================================================
// KFDT_Freeze_Ground_FreezeThrower
//=============================================================================
// A damage type for KFProj_GroundIce
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Freeze_Ground_FreezeThrower extends KFDT_Freeze_Ground
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FreezeThrower'
   SnarePower=100.000000
   Name="Default__KFDT_Freeze_Ground_FreezeThrower"
   ObjectArchetype=KFDT_Freeze_Ground'KFGame.Default__KFDT_Freeze_Ground'
}
