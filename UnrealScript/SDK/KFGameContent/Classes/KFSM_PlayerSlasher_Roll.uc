//=============================================================================
// KFSM_PlayerSpecial_Slasher
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerSlasher_Roll extends KFSM_Evade;

static function byte PackFlagsBase(KFPawn P)
{
	return class'KFSM_PlayerMeleeBase'.static.GetFourWayMoveDirection(P);
}

defaultproperties
{
    //Cooldown=1.f

	// @note: Using EPawnOctant not EEvadeDir.  EEvadeDir is defined twice, weirdly offset, and should probably be deleted!
	EvadeAnims(DIR_Forward)=(Anims=(Player_Roll_F))
	EvadeAnims(DIR_Backward)=(Anims=(Player_Roll_B))
	EvadeAnims(DIR_Left)=(Anims=(Player_Roll_L))
	EvadeAnims(DIR_Right)=(Anims=(Player_Roll_R))
}