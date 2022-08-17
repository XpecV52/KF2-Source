//=============================================================================
// KFDT_Bludgeon_RailGun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_RailGun extends KFDT_Bludgeon_RifleButt
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

DefaultProperties
{
	//defaults
	WeaponDef=class'KFWeapDef_RailGun'
}