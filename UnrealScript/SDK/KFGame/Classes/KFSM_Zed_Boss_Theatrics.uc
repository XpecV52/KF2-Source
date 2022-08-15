//=============================================================================
// KFSM_Zed_Boss_Theatrics
//=============================================================================
// Play a taunt animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Zed_Boss_Theatrics extends KFSM_PlaySingleAnim;

enum ETheatricType
{
	THEATRIC_Entrance,
	THEATRIC_Victory
};

var byte CurrentTheatricType;

protected function bool InternalCanDoSpecialMove()
{
	local KFGameReplicationInfo KFGRI;
	KFGRI = KFGameReplicationInfo(AIOwner.WorldInfo.GRI);
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return false;
	}
	return true;
}

static function byte PackSMFlags( KFPawn P, byte InTauntType )
{
	local byte Variant;
	local KFPawnAnimInfo PAI;

	PAI = P.PawnAnimInfo;
	Variant = 255;
	// Get the number of taunt anims from the AnimInfo class
	switch ( InTauntType )
	{
	case THEATRIC_Entrance:
		if( PAI.TheatricBossEntranceAnims.Length > 0 )
		{
			Variant = Rand(PAI.TheatricBossEntranceAnims.Length);
		}
		break;
	case THEATRIC_Victory:
		if( PAI.TheatricBossVictoryAnims.Length > 0 )
		{
			Variant = Rand(PAI.TheatricBossVictoryAnims.Length);
		}
		break;
	}

	if ( Variant != 255 )
	{
		return InTauntType + (Variant << 4);
	}
	else
	{
		return 255;
	}
}

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	local KFPlayerController KFPC;

	super.SpecialMoveStarted( bForced, PrevMove );

	// This ensures the boss animation is always using the correct root bone axis option 
	// since it is possible that the previous pooled anim node sequence has not been cleared
	KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Default, RBA_Default, RBA_Default);

	if( AIOwner != none && AIOwner.Role == ROLE_Authority )
	{
		// Set the camera to the boss
		foreach AIOwner.WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			KFPC.SetBossCamera(KFPOwner);
			KFPC.SetCinematicMode(true, false, false, true, true, true);
		}

		KFPawn_MonsterBoss( KFPOwner ).PlayMonologue( CurrentTheatricType );
	}
}

function PlayAnimation()
{
	local byte Variant;

	CurrentTheatricType = KFPOwner.SpecialMoveFlags & 15;
	Variant = KFPOwner.SpecialMoveFlags >> 4;

	switch ( CurrentTheatricType )
	{
	case THEATRIC_Entrance:
		AnimName = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnims[Variant];
		break;
	case THEATRIC_Victory:
		AnimName = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnims[Variant];
		break;
	default:
		AnimName = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnims[Variant];
		break;
	}

	`AILog_Ext( GetFuncName()$" "$self$" chose theatric animation "$AnimName, 'AIController', AIOwner );
	PlaySpecialMoveAnim( AnimName, AnimStance, BlendInTime, BlendOutTime, 1.f );
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	local KFPlayerController KFPC;

	// abort animation if something ended the taunt early
 	if ( KFPOwner.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim )
 	{
		KFPOwner.StopBodyAnim(AnimStance, 0.2);
	}

	if( AIOwner != none )
	{
		AIOwner.AIZeroMovementVariables();

		// Return the camera to the player
		if( AIOwner.Role == ROLE_Authority && CurrentTheatricType == THEATRIC_Entrance )
		{
			foreach AIOwner.WorldInfo.AllControllers(class'KFPlayerController', KFPC)
			{
				if( KFPC.Pawn != none )
				{
					KFPC.SetViewTarget(KFPC.Pawn);
				}
				KFPC.ServerCamera( 'FirstPerson' );
       			KFPC.SetCinematicMode(false, false, true, true, true, false);
			}
		}
	}

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

DefaultProperties
{
	// ---------------------------------------------
	// SpecialMove
	Handle=KFSM_Zed_Boss_Theatrics
	bDisableMovement=true
	bDisablesWeaponFiring=true
}
