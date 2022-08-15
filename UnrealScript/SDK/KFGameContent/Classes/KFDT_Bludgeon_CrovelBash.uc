//=============================================================================
// KFDT_Bludgeon_CrovelBash
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_CrovelBash extends KFDT_Bludgeon_Crovel
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{

	KnockdownPower=24
	StunPower=42
    StumblePower=51
	LegStumblePower=51

    AARWeaponID=`AAR_Crovel
}
