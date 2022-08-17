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
   EvadeAnims(0)=(Anims=("Player_Roll_F"))
   EvadeAnims(1)=(Anims=("Player_Roll_B"))
   EvadeAnims(2)=(Anims=("Player_Roll_L"))
   EvadeAnims(3)=(Anims=("Player_Roll_R"))
   EvadeAnims(4)=()
   EvadeAnims(5)=()
   EvadeAnims(6)=()
   EvadeAnims(7)=()
   Name="Default__KFSM_PlayerSlasher_Roll"
   ObjectArchetype=KFSM_Evade'KFGame.Default__KFSM_Evade'
}
