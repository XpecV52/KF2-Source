//=============================================================================
// KFSM_PlayerSpecial_Slasher
//=============================================================================
// Player controlled stalker attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerStalker_Roll extends KFSM_Evade;

static function byte PackFlagsBase(KFPawn P)
{
	return class'KFSM_PlayerMeleeBase'.static.GetFourWayMoveDirection(P);
}

/** Notification called when Special Move starts */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );

	// Disable cloak
	if( KFPOwner != none && KFPawn_Monster(KFPOwner).bIsCloaking )
	{
		KFPawn_Monster(KFPOwner).SetCloaked( false );
	}
}

/** Special move ended */
function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	// Re-enable cloak
	if( KFPOwner != none )
	{
		KFPawn_Monster(KFPOwner).SetCloaked( true );
	}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

defaultproperties
{
   EvadeAnims(0)=(Anims=("Player_Cartwheel_F"))
   EvadeAnims(1)=(Anims=("Player_Cartwheel_B"))
   EvadeAnims(2)=(Anims=("Player_Cartwheel_L"))
   EvadeAnims(3)=(Anims=("Player_Cartwheel_R"))
   EvadeAnims(4)=()
   EvadeAnims(5)=()
   EvadeAnims(6)=()
   EvadeAnims(7)=()
   Name="Default__KFSM_PlayerStalker_Roll"
   ObjectArchetype=KFSM_Evade'KFGame.Default__KFSM_Evade'
}
