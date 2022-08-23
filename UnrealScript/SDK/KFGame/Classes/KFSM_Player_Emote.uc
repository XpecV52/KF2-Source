//=============================================================================
// KFSM_Player_Emote
//=============================================================================
// Play a emote animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFSM_Player_Emote extends KFSM_PlaySingleAnim;

`include(KFGame/KFGameDialog.uci)

/** Camera animation */
var CameraAnim CameraAnim;

/** Stores the last camera mode for restoration after move ends */
var Name LastCameraMode;

/** Camera fades */
var color FadeInColor, FadeOutColor;
var float FadeInTime, FadeOutTime;

var rotator InitialRotation;

/** Time from the end of an emote until the next emote can be done */
var protected const float EmoteCooldownTime;

/** Last time an emote was executed */
var protected float LastEmoteTime;

/** Contains a list of particle systems spawned during the move */
var protected array<ParticleSystemComponent> AnimParticles;

/** Checks to see if this Special Move can be done */
protected function bool InternalCanDoSpecialMove()
{
	if( KFPOwner == none || KFPOwner.Physics == PHYS_Falling || `TimeSinceEx(KFPOwner, LastEmoteTime) < EmoteCooldownTime )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

/** Disable crosshair */
function bool CanDrawCrosshair()
{
	return false;
}

static function byte PackFlagsBase( KFPawn P )
{
	return class'KFEmoteList'.static.GetEmoteIndex( class'KFEmoteList'.static.GetEquippedEmoteId() );
}

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	// Clear our anim particles array just in case
	ClearSMParticles();

	super.SpecialMoveStarted( bForced, PrevMove );

	// This ensures the emote animation is always using the correct root bone axis option 
	// since it is possible that the previous pooled anim node sequence has not been cleared
	// KFPOwner.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Default, RBA_Default, RBA_Default);

	// Cache off starting rotation. Instead of snapping the pawn to the new camera direction, we'll set the camera back
	// to this so that it smoothly blends out of the move.
	InitialRotation = KFPOwner.Rotation;
}

function PlayAnimation()
{
	AnimName = class'KFEmoteList'.static.GetEmoteFromIndex( KFPOwner.SpecialMoveFlags );

	PlaySpecialMoveAnim( AnimName, AnimStance, BlendInTime, BlendOutTime, 1.f );

	if( KFPOwner.Role == ROLE_Authority )
	{	
		KFGameInfo(KFPOwner.WorldInfo.Game).DialogManager.PlayDialogEvent( KFPOwner, `ACT_DoshTrain );
	}

	// Store camera mode for restoration after move ends
	LastCameraMode = 'FirstPerson';
	if( PCOwner != none && PCOwner.PlayerCamera != none )
	{
		LastCameraMode = PCOwner.PlayerCamera.CameraStyle;
	}

	// Set camera to emote third person camera
	if( PCOwner == none || !PawnOwner.IsLocallyControlled() )
	{
		KFPOwner.SetWeaponAttachmentVisibility( false );
		return;
	}

	if( PCOwner.CanViewCinematics() )
	{
		PCOwner.ClientSetCameraFade( true, FadeInColor, vect2d(1.f, 0.f), FadeInTime, true );
		PCOwner.PlayerCamera.CameraStyle = 'Emote';

		// Switch camera modes immediately in single player or on client
		if( PCOwner.WorldInfo.NetMode != NM_DedicatedServer )
		{
			PCOwner.ClientSetCameraMode( 'Emote' );
		}

		KFPOwner.SetWeaponAttachmentVisibility( false );
	}
}

/** Clears the array of particle systems that were created while this animation was playing */
function ClearSMParticles()
{
	if( AnimParticles.Length > 0 )
	{
		AnimParticles.Remove( 0, AnimParticles.Length );
	}	
}

/** Called from KFPawn::OnAnimNotifyParticleSystemSpawned() */
simulated function OnAnimNotifyParticleSystemSpawned( const AnimNotify_PlayParticleEffect AnimNotifyData, ParticleSystemComponent PSC )
{
	local AnimSequence AnimSeq;

	if( AnimNotifyData.Outer != none )
	{
		AnimSeq = AnimSequence( AnimNotifyData.Outer );
		if( AnimSeq != none && string(AnimSeq.SequenceName) ~= string(AnimName) ) // string conversion so we don't have case mismatches
		{
			AnimParticles.AddItem( PSC );
		}
	}
}

/** Constantly apply rotation while move is active */
function Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( KFPOwner != none )
	{
		// If we're no longer on the ground, we need to kill the special move
		if( KFPOwner.Role == ROLE_Authority && KFPOwner.Physics == PHYS_Falling && KFPOwner.SpecialMoves[KFPOwner.SpecialMove] == self )
		{
			KFPOwner.EndSpecialMove();
		}

		if( KFPOwner.Role != ROLE_SimulatedProxy )
		{
			KFPOwner.SetRotation( InitialRotation );
		}
	}
}

function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	local int i;

	// abort animation if something ended the emote early
 	if( KFPOwner.BodyStanceNodes[AnimStance].bIsPlayingCustomAnim )
 	{
		KFPOwner.StopBodyAnim( AnimStance, 0.2 );

		// Stop our animnotify-created particle systems early if we have any
		for( i = 0; i < AnimParticles.Length; ++i )
		{
			if( AnimParticles[i] != none && AnimParticles[i].bIsActive )
			{
				AnimParticles[i].DeactivateSystem();
			}
	}
	}

	// Clear particles spawned by animnotifies
	ClearSMParticles();

	// Don't change attachment visibility if another camera mode has already been set
	KFPOwner.SetWeaponAttachmentVisibility( PCOwner == none || PCOwner.IsEmoteCameraMode() );

	if( PCOwner == none || !KFPOwner.IsLocallyControlled() )
	{
		// Make sure camera settings on the server match
		if( PCOwner != none && PCOwner.IsEmoteCameraMode() )
		{
			PCOwner.SetRotation( InitialRotation );
			PCOwner.PlayerCamera.CameraStyle = LastCameraMode;
		}

		Super.SpecialMoveEnded( PrevMove, NextMove );
		return;
	}

	// Set our last used emote time so we can enforce a cooldown
	LastEmoteTime = KFPOwner.WorldInfo.TimeSeconds;

	// Stop the camera anim
	if( CameraAnim != none )
	{
		PCOwner.ClientStopCameraAnim( CameraAnim );
	}

	// Return the camera to the player
	if( PCOwner.IsEmoteCameraMode() )
	{
		PCOwner.ClientSetCameraFade( true, FadeOutColor, vect2d(1.f, 0.f), FadeOutTime, true );
		PCOwner.SetRotation( InitialRotation );

		// Switch camera modes immediately in single player or on client
		if( PCOwner.WorldInfo.NetMode != NM_DedicatedServer )
		{
			PCOwner.ClientSetCameraMode( LastCameraMode );
		}
	}

	Super.SpecialMoveEnded( PrevMove, NextMove );
}

DefaultProperties
{
	// ---------------------------------------------
	// SpecialMove
	Handle=KFSM_Player_Emote
	bDisableMovement=true
	bDisablesWeaponFiring=false
	bDisableSteering=true
	bLockPawnRotation=true

	// ---------------------------------------------
	// Animation
	BlendOutTime=0.15f

	// ---------------------------------------------
	// Camera fade
	FadeInColor=(R=0,G=0,B=0)
	FadeInTime=1.5f
	FadeOutColor=(R=255,G=255,B=255)
	FadeOutTime=0.6f

	// ---------------------------------------------
	// KFSM_Player_Emote
	EmoteCooldownTime=6.f
}