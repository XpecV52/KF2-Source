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
	WeaponDef=class'KFWeapDef_FreezeThrower'
	SnarePower=100.0
}