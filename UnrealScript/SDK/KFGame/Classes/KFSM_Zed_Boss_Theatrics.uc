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

/** Camera animation */
var CameraAnim CameraAnim;

/** Camera fades */
var color FadeInColor, FadeOutColor;
var float FadeInTime, FadeOutTime;

protected function bool InternalCanDoSpecialMove()
{
	local KFGameReplicationInfo KFGRI;

	if( PCOwner != none )
	{
        KFGRI = KFGameReplicationInfo(PCOwner.WorldInfo.GRI);
	}
	else if( AIOwner != none )
	{
        KFGRI = KFGameReplicationInfo(AIOwner.WorldInfo.GRI);
	}
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return false;
	}
	return super.InternalCanDoSpecialMove();
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
		if( PAI.TheatricBossEntranceAnimInfos.Length > 0 )
		{
			Variant = Rand(PAI.TheatricBossEntranceAnimInfos.Length);
		}
		break;
	case THEATRIC_Victory:
		if( PAI.TheatricBossVictoryAnimInfos.Length > 0 )
		{
			Variant = Rand(PAI.TheatricBossVictoryAnimInfos.Length);
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
	super.SpecialMoveStarted( bForced, PrevMove );

	// This ensures the boss animation is always using the correct root bone axis option 
	// since it is possible that the previous pooled anim node sequence has not been cleared
	KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Default, RBA_Default, RBA_Default);

	// Cache hud reference
	if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer )
	{
		KFGFxHudWrapper(KFPOwner.WorldInfo.GetALocalPlayerController().myHUD).BossPawn = KFPawn_MonsterBoss(KFPOwner);
	}
}

function PlayAnimation()
{
	local byte Variant;
	local KFPawn_MonsterBoss BossPawn;
	local KFPlayerController KFPC;
	local vector CameraAnimOffset;

	CurrentTheatricType = KFPOwner.SpecialMoveFlags & 15;
	Variant = KFPOwner.SpecialMoveFlags >> 4;

	switch ( CurrentTheatricType )
	{
	case THEATRIC_Entrance:
		AnimName = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].AnimationName;
		CameraAnim = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimation;
		CameraAnimOffset = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimOffset;
		BlendInTime = 0.f;
		BlendOutTime = 0.f;
		KFPOwner.SetPhysics(PHYS_Falling);
		break;
	case THEATRIC_Victory:
		AnimName = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnimInfos[Variant].AnimationName;
		CameraAnim = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnimInfos[Variant].CameraAnimation;
		CameraAnimOffset = KFPOwner.PawnAnimInfo.TheatricBossVictoryAnimInfos[Variant].CameraAnimOffset;
		break;
	default:
		AnimName = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].AnimationName;
		CameraAnim = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimation;
		CameraAnimOffset = KFPOwner.PawnAnimInfo.TheatricBossEntranceAnimInfos[Variant].CameraAnimOffset;
		break;
	}

	`AILog_Ext( GetFuncName()$" "$self$" chose theatric animation "$AnimName, 'AIController', AIOwner );
	PlaySpecialMoveAnim( AnimName, AnimStance, BlendInTime, BlendOutTime, 1.f );

	// Set the camera to the boss
	BossPawn = KFPawn_MonsterBoss( KFPOwner );

	// Obliterated cam
	if( BossPawn == none || BossPawn.bPlayedDeath || BossPawn.bPendingDelete || BossPawn.HitFxInfo.bObliterated )
	{
		if( AIOwner != none && AIOwner.Role == ROLE_Authority )
		{
			foreach AIOwner.WorldInfo.AllControllers( class'KFPlayerController', KFPC )
			{
				KFPC.SetBossCamera( none );
			}
		}
		else if( PCOwner != none && PCOwner.Role == ROLE_Authority )
		{
			foreach PCOwner.WorldInfo.AllControllers( class'KFPlayerController', KFPC )
			{
				KFPC.SetBossCamera( none );
			}
		}		
		return;
	}

	// Take player-controlled boss into account
	if( BossPawn.Role == ROLE_Authority && BossPawn.IsHumanControlled() )
	{
		KFPlayerController(BossPawn.Controller).ServerCamera( 'Boss' );
	}

	// Regular boss cam
	if( BossPawn.WorldInfo.NetMode != NM_DedicatedServer )
	{
		KFPC = GetALocalKFPlayerController();

		// Play a camera fade
		KFPC.ClientSetCameraFade( true, FadeInColor, vect2d(1.f, 0.f), FadeInTime, true );

		// Set view target and camera mode
		KFPC.SetViewTarget( BossPawn );
		KFPC.ClientSetCameraMode( 'Boss' );

		// Play a camera anim if we have one
		if( CameraAnim != none )
		{
			BossPawn.bUseAnimatedTheatricCamera = true;
			BossPawn.TheatricCameraAnimOffset = CameraAnimOffset;

			// Set cinematic mode
			KFPC.SetCinematicMode( true, false, false, true, true, true );

			// Lengthen and add a tiny bit of blend out time to avoid snapping
			KFPC.ClientPlayCameraAnim( CameraAnim, 1.f, 0.99f, BlendInTime, BlendOutTime + 0.03f, false, false );
		}
	}

	if( BossPawn.Role == ROLE_Authority )
	{	
		BossPawn.PlayMonologue( CurrentTheatricType );
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	local KFPlayerController KFPC;
	local KFPawn_MonsterBoss BossPawn;

	BossPawn = KFPawn_MonsterBoss( KFPOwner );
	KFPC = GetALocalKFPlayerController();

	if( BossPawn != none )
	{
		BossPawn.bUseAnimatedTheatricCamera = false;
		BossPawn.TheatricCameraAnimOffset = vect(0,0,0);

		if( BossPawn.WorldInfo.NetMode != NM_DedicatedServer )
		{	
			if( CurrentTheatricType == THEATRIC_Entrance )
			{
				KFPC.ClientSetCameraFade( true, FadeOutColor, vect2d(1.f, 0.f), FadeOutTime, true );
			}

			// Stop the camera anim
			if( CameraAnim != none )
			{
				KFPC.ClientStopCameraAnim( CameraAnim );
			}
		}

		// abort animation if something ended the taunt early
	 	if ( BossPawn.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim )
	 	{
			BossPawn.StopBodyAnim( AnimStance, 0.2 );
		}
	}

	if( CurrentTheatricType == THEATRIC_Entrance )
	{
		if( AIOwner != none )
		{
			AIOwner.AIZeroMovementVariables();

			// Return the camera to the player
			if( AIOwner.Role == ROLE_Authority )
			{
				foreach AIOwner.WorldInfo.AllControllers( class'KFPlayerController', KFPC )
				{
					if( KFPC.Pawn != none )
					{
						KFPC.SetViewTarget( KFPC.Pawn );
					}
					KFPC.ServerCamera( 'FirstPerson' );
	       			KFPC.SetCinematicMode( false, false, true, true, true, false );
				}
			}
		}
		else if( PCOwner != none )
		{
			// Return the camera to the player
			if( PCOwner.Role == ROLE_Authority )
			{
				foreach PCOwner.WorldInfo.AllControllers( class'KFPlayerController', KFPC )
				{
					if( KFPC.Pawn != none )
					{
						KFPC.SetViewTarget( KFPC.Pawn );
					}

					if( KFPC != PCOwner && KFPC.Pawn != none && KFPC.GetTeamNum() == 0  )
					{
						KFPC.ServerCamera( 'FirstPerson' );
					}
					else if( KFPC == PCOwner )
					{
						KFPC.ServerCamera( 'ThirdPerson' );
					}
					else
					{
						KFPC.ServerCamera( 'FreeCam' );
					}

	       			KFPC.SetCinematicMode( false, false, true, true, true, false );
				}
			}
		}

		// Reset cinematic mode on clients
		if( BossPawn.WorldInfo.NetMode != NM_DedicatedServer )
		{
			KFPC.SetCinematicMode( false, false, true, true, true, false );
			if( KFPC.Pawn != none )
			{
				KFPC.SetViewTarget( KFPC.Pawn );
			}
		}
	}

	Super.SpecialMoveEnded(PrevMove, NextMove);
}

function KFPlayerController GetALocalKFPlayerController()
{
	local KFPlayerController KFPC;

	foreach KFPOwner.WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		if( KFPC.IsLocalPlayerController() )
		{
			return KFPC;
		}
	}

	return KFPlayerController( KFPOwner.GetALocalPlayerController() );
}

DefaultProperties
{
	// ---------------------------------------------
	// SpecialMove
	Handle=KFSM_Zed_Boss_Theatrics
	bDisableMovement=true
	bDisablesWeaponFiring=true

	// ---------------------------------------------
	// Camera fade
	FadeInColor=(R=0,G=0,B=0)
	FadeInTime=3.2f
	FadeOutColor=(R=255,G=255,B=255)
	FadeOutTime=0.6f	
}
