//=============================================================================
// KFDT_Ballistic_HansAK12
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - It Was I 01/2014
//=============================================================================

class KFDT_Ballistic_HansAK12 extends KFDT_Ballistic_AK12
	abstract
	hidedropdown;

`include(KFGame/KFGameDialog.uci)

static function int GetKillerDialogID()
{
	return `HANS_KillGuns;
}
