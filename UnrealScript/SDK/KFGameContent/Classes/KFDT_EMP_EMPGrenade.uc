//=============================================================================
// KFDT_EMP_EMPGrenade
//=============================================================================
// EMP damage type for EMP grenades
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_EMP_EMPGrenade extends KFDT_EMP
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KnockdownPower=0
	StumblePower=120
	
	WeaponDef=class'KFWeapDef_Grenade_Berserker'
}
