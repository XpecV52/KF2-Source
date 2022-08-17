//=============================================================================
// KFSM_PlayerSiren_VortexScream
//=============================================================================
// Player controlled siren vortex scream
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerSiren_VortexScream extends KFSM_GrappleAttack;

/** Sounds for vortex */
var const AkEvent VortexLoopAkEvent;
var const AkEvent VortexLoopEndAkEvent;
var const AkEvent VortexGrabAkEvent;
var const AkEvent VortexGrabEndAkEvent;

/** How much the view pitch should be constrained */
var const vector2D ViewPitchConstraints;

/** The amount of time between checks to see if an enemy has been caught in the vortex */
var const float VortexCheckTime;

/** The maximum effective range (squared) of the vortex */
var const float MaxRangeSQ;

/** The minimum FOV required for a target */
var const float MinGrabTargetFOV;

/** The time, worldinfo.timeseconds, when we found a victim */
var protected float FollowerAttachTime;

/** Particle system used for the vortex effect */
var const ParticleSystem VortexEffect;

/** Component for vortex particle effect */
var transient ParticleSystemComponent VortexPSC;

/** How long the special move lasts after pulling someone in */
var const float VortexDuration;

/** How long to force the vortex on for after the button has been released */
var const float MinVortexDuration;

/** Set to TRUE after the minimum duration timer expires */
var protected bool bVortexCanBeInterrupted;

/** Interpolated view pitch on remote clients */
var protected float InterpViewPitch;

/** The speed at which to interpolate our camera rotation when locking pawn rotation */
var const float ViewRotInterpSpeed;

/** Interpolated rotation of pawn after aquiring a target */
var protected float InterpolatedRotation;

/** The overall damage done to a follower if they are held for the full vortex duration */
var const float DamageOverDuration;

/** How much damage to do to the follower per second, calculated at start of move */
var protected int FollowerDamagePerSec;

/** Damagetype to use */
var const class<KFDamageType> VortexDamageType;

/** Restrictions for doing Vortex Scream attack */
protected function bool InternalCanDoSpecialMove()
{
	if( KFPOwner.bIsSprinting )
	{
		KFPOwner.SetSprinting( false );
	}

	// Not while jumping/flying/etc
	if( KFPOwner.Physics != PHYS_Walking )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
    // Skip default (instant attach) behavior 
    Super(KFSpecialMove).SpecialMoveStarted( bForced, PrevMove );

    bAlignFollowerLookSameDirAsMe = default.bAlignFollowerLookSameDirAsMe;
    bAlignFollowerRotation = default.bAlignFollowerRotation;
    bAlignPawns = false;

    Follower = none;

	InterpViewPitch = 0.f;
	FollowerAttachTime = 0.f;

    // On the server start a timer to check collision
    if ( PawnOwner.Role == ROLE_Authority )
    {
        PawnOwner.SetTimer( VortexCheckTime, true, nameOf(Timer_CheckVortex), self );

        // Calculate our damage
        FollowerDamagePerSec = int(DamageOverDuration / VortexDuration);
    }

	bVortexCanBeInterrupted = false;
	bPendingStopFire = false;

	// Set our minimum vortex duration timer
	if( KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.SetTimer( MinVortexDuration, false, nameOf(Timer_VortexInterrupt), self );
	}

    KFPawn_Monster(PawnOwner).BumpFrequency = 0.f;
    PlayGrappleAnim();

    // View constraints
    KFPOwner.ViewPitchMin = ViewPitchConstraints.X;
    KFPOwner.ViewPitchMax = ViewPitchConstraints.Y;

    // Head tracking
    if( KFPOwner.IK_Look_Head == none )
	{
		KFPOwner.IK_Look_Head = SkelControlLookAt( KFPOwner.Mesh.FindSkelControl('HeadLook') );
	}
	KFPOwner.bCanHeadTrack = true;
    KFPOwner.bIsHeadTrackingActive = true;
	KFPOwner.MyLookAtInfo.LookAtPct = 1.f;
	KFPOwner.MyLookAtInfo.BlendOut = 0.33f;
	KFPOwner.MyLookAtInfo.BlendIn = 0.2f;

    // Spawn particle effect, play sound
    if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer )
    {
		VortexPSC = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( VortexEffect, KFPOwner.Mesh, 'VortexSocket', true );
		VortexPSC.SetAbsolute( false, true );
		VortexPSC.SetRotation( KFPOwner.Rotation );

		// Post ak event on owner
		KFPOwner.PostAkEvent( VortexLoopAkEvent, true, true, true );
	}

	// Do an immediate check for victims
	/*if( KFPOwner.Role == ROLE_Authority )
	{
		Timer_CheckVortex();
	}*/
}

/** Script Tick function. */
function Tick( float DeltaTime )
{
	local vector EffectLoc;
	local rotator ViewRot, Projection, DesiredRotation;

	// End move if something is blocking the path to the pawn */
	/*if( KFPOwner == none
		|| (KFPOwner.Role == ROLE_Authority
			&& Follower != none
			&& !IsPawnPathClear(KFPOwner, Follower, Follower.Location, KFPOwner.Location, vect(1,1,1), true)) )
	{
		KFPOwner.EndSpecialMove();
	}*/

	if( KFPOwner != none )
	{
		if( Follower == none )
		{
			if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer )
			{
				// Head tracking
				if( PCOwner != none && PCOwner.PlayerCamera != none )
				{
					ViewRot = PCOwner.PlayerCamera.CameraCache.POV.Rotation;
					KFPOwner.MyLookAtInfo.ForcedLookAtLocation = PCOwner.PlayerCamera.CameraCache.POV.Location + vector( ViewRot ) * 5000.f;
				}
				else
				{
					if( InterpViewPitch == 0.f )
					{
						InterpViewPitch = GetUncompressedViewPitch();
					}
					else
					{
						InterpViewPitch = FInterpTo( InterpViewPitch, GetUncompressedViewPitch(), DeltaTime, 15.f );
					}
					ViewRot = KFPOwner.GetViewRotation();
					ViewRot.Pitch = InterpViewPitch;
					KFPOwner.MyLookAtInfo.ForcedLookAtLocation = KFPOwner.GetPawnViewLocation() + vector( ViewRot ) * 5000.f;
				}

				// Vortex effect
				VortexPSC.SetRotation( rotator(KFPOwner.MyLookAtInfo.ForcedLookAtLocation - KFPOwner.Location) );
			}
		}
		else
		{
			KFPOwner.Mesh.GetSocketWorldLocationAndRotation( 'VortexSocket', EffectLoc );
			Projection = rotator( Follower.Location - EffectLoc );
			
			// Set effect rotation
			if( VortexPSC != none )
			{
				VortexPSC.SetRotation( RInterpTo(VortexPSC.GetRotation(), Projection, DeltaTime, ViewRotInterpSpeed) );
			}

			// Set pawn rotation
			DesiredRotation = KFPOwner.Rotation;
			DesiredRotation.Yaw = FInterpTo( KFPOwner.Rotation.Yaw, Projection.Yaw, DeltaTime, ViewRotInterpSpeed );
			ForcePawnRotation( KFPOwner, DesiredRotation, false );

			// Set head tracking target
			if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer )
			{
				KFPOwner.MyLookAtInfo.ForcedLookAtLocation = Follower.Location;
			}
		}
	}
}

/** Returns our uncompressed replicated view pitch */
function float GetUncompressedViewPitch()
{
	return float( NormalizeRotAxis(KFPOwner.RemoteViewPitch << 8) );
}

/** Lock view rotation when grabbing */
function ProcessViewRotation( float DeltaTime, out rotator out_ViewRotation, out Rotator out_DeltaRot )
{
	if( Follower != none )
	{
		out_ViewRotation = RInterpTo( out_ViewRotation, KFPOwner.Rotation, DeltaTime, ViewRotInterpSpeed );
		out_DeltaRot = rot(0,0,0);
	}
}

/** Searches for a valid pawn to interact with */
function Timer_CheckVortex()
{
	local KFPawn KFP, BestTarget;
	local vector CameraNormal, Projection, TraceStart, GrabLocation;
	local float FOV;
	local float DistSQ, BestDistSQ;

	/** Early out if we have no playercontroller or camera */
	if( PCOwner == none || PCOwner.PlayerCamera == none )
	{
		return;
	}

	/** Get camera rotation */
	CameraNormal = vector( PCOwner.PlayerCamera.CameraCache.POV.Rotation );

	// Our trace origin
	TraceStart = KFPOwner.Location + ( KFPOwner.BaseEyeHeight * vect(0,0,1) );

	foreach KFPOwner.WorldInfo.AllPawns( class'KFPawn', KFP )
	{
		if( KFP.GetTeamNum() != KFPOwner.GetTeamNum() && CanInteractWithPawn(KFP) )
		{
			Projection = KFP.Location - TraceStart;
			DistSQ = VSizeSQ( Projection );

			if( DistSQ <= MaxRangeSQ )
			{
				FOV = CameraNormal dot Normal( Projection );

				if( FOV > MinGrabTargetFOV )
				{
					// Need both an extent and zero extent trace!
					// Note: Unreal 3 is weird. -MattF
					GrabLocation = KFP.Location + ( KFP.BaseEyeHeight * vect(0,0,1) );
					if( IsPawnPathClear(KFPOwner, KFP, GrabLocation, TraceStart, vect(2,2,2),, true)
						&& IsPawnPathClear(KFPOwner, KFP, GrabLocation, TraceStart,,, true) )
					{
						if( BestTarget == none || DistSQ < BestDistSQ )
						{
							BestDistSQ = DistSQ;
							BestTarget = KFP;
						}
					}
				}
			}
		}
	}

	if( BestTarget != none )
	{
		// Set our attach time
		FollowerAttachTime = KFPOwner.WorldInfo.TimeSeconds;

		// Add follower to specialmove
		KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true, BestTarget );

		// Damage immediately, set damage timer
		Timer_DamageFollower();
		KFPOwner.SetTimer( 1.f, true, nameOf(Timer_DamageFollower), self );

		// Stop trace
		KFPOwner.ClearTimer( nameOf(Timer_CheckVortex), self );
	}
}

/** We've received an interaction pawn, start the interaction */
function InteractionPawnUpdated()
{
	if( KFPOwner.InteractionPawn != none )
	{
	    bAlignPawns = true;
		CheckReadyToStartInteraction();
	}
	else
	{
		KFPOwner.EndSpecialMove();
	}
}

function StartInteraction() 
{
	if( Follower != none )
	{
	    bAlignPawns = true;
	    Follower.AirSpeed = 10000.f;
	    Follower.SetPhysics( PHYS_Flying );

		/** Must lock pawn rotation now */
		SetLockPawnRotation( true );

		// Play a grab sound
		if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer )
		{
			KFPOwner.PostAkEvent( VortexGrabAkEvent, true, true, true );
		}
	}

	super.StartInteraction();
}

/** Damage the follower, see if it's time to end the move */
function Timer_DamageFollower()
{
	local vector GrabLocation;
	local vector GrabDirection;

	if( KFPOwner.WorldInfo.TimeSeconds - FollowerAttachTime >= VortexDuration )
	{
		KFPOwner.EndSpecialMove();
		return;
	}

	if( Follower != none && !Follower.bPlayedDeath )
	{
		GrabDirection = Normal( KFPOwner.Location - Follower.Location );
		GrabLocation = Follower.Location + (GrabDirection * Follower.CylinderComponent.CollisionRadius); 
	    Follower.TakeDamage( FollowerDamagePerSec, KFPOwner.Controller, GrabLocation, GrabDirection, VortexDamageType,, KFPOwner );

	    // End move if the follower has died
	    if( Follower.bPlayedDeath || Follower.Health <= 0 )
	    {
	    	KFPOwner.EndSpecialMove();
	    	return;
	    }

	    // Do a camera shake, etc
	    KFPawn_Monster(KFPOwner).MeleeAttackHelper.PlayMeleeHitEffects( Follower, GrabLocation, GrabDirection, false );
	}
}

/** Overridden to play a looping anim */
function PlayGrappleAnim()
{
	PlaySpecialMoveAnim( GrappleAnims[0], EAS_FullBody,,,, true );
}

/** When the grapple animation ends, continue it with a different grapple anim */
function SpecialMoveFlagsUpdated()
{
	if( KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
	{
		KFPOwner.EndSpecialMove();
	}
	else
	{
		super.SpecialMoveFlagsUpdated();
	}
}

/** Skip Super(KFSM_GrappleAttack) */
function AnimEndNotify( AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime )
{
    Super(KFSpecialMove).AnimEndNotify( SeqNode, PlayedTime, ExcessTime );
}

/** Follower has left special move */
function OnFollowerLeavingSpecialMove()
{
	super.OnFollowerLeavingSpecialMove();

	ResetFollowerPhysics();
}

/** Resets physics values on follower */
function ResetFollowerPhysics()
{
	if( Follower != none )
	{
		Follower.AirSpeed = Follower.default.AirSpeed;
		if( Follower.Physics == PHYS_Flying )
		{
			Follower.SetPhysics( PHYS_Falling );
		}
	}	
}

/** Special move ended */
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	if( VortexPSC != none )
	{
		VortexPSC.DeactivateSystem();
		VortexPSC = none;
	}

	ResetFollowerPhysics();
	SetLockPawnRotation( false );

	if( KFPOwner != none )
	{
		// Play our vortex end event
		if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer )
		{
			if( Follower != none )
			{
				KFPOwner.PostAkEvent( VortexGrabEndAkEvent, true, true, true );
			}
			else
			{
				KFPOwner.PostAkEvent( VortexLoopEndAkEvent, true, true, true );			
			}
		}

	    // Disable head tracking
	    KFPOwner.bIsHeadTrackingActive = false;
		KFPOwner.MyLookAtInfo.ForcedLookAtLocation = vect(0,0,0);

		// Restore view pitch limits
		KFPOwner.ViewPitchMin = KFPOwner.default.ViewPitchMin;
		KFPOwner.ViewPitchMax = KFPOwner.default.ViewPitchMax;

		// Clear timers
	    if( KFPOwner.Role == ROLE_Authority )
	    {
		    KFPawn_Monster(PawnOwner).BumpFrequency = KFPawn_Monster(PawnOwner).default.BumpFrequency;
			KFPOwner.ClearTimer( nameOf(Timer_CheckVortex), self );
			KFPOwner.ClearTimer( nameOf(Timer_DamageFollower), self );
			KFPOwner.ClearTimer( nameOf(Timer_VortexInterrupt), self );
		}
	}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

/** Called afte the minimum vortex time has been reached */
function Timer_VortexInterrupt()
{
	bVortexCanBeInterrupted = true;

	if( bPendingStopFire )
	{
		SpecialMoveButtonReleased();
	}
}

/* Called on some player-controlled moves when a firemode input has been pressed */
function SpecialMoveButtonRetriggered()
{
	bPendingStopFire = false;
}

/** Called on some player-controlled moves when a firemode input has been released */
function SpecialMoveButtonReleased()
{
	bPendingStopFire = true;

	if( !bVortexCanBeInterrupted )
	{
		return;
	}

	KFPOwner.DoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
	{
		KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
	}
}

defaultproperties
{
   VortexLoopAkEvent=AkEvent'WW_ZED_Siren.Play_Siren_Pull_Start'
   VortexLoopEndAkEvent=AkEvent'WW_ZED_Siren.Stop_Siren_Pull_Start'
   VortexGrabAkEvent=AkEvent'WW_ZED_Siren.Play_Siren_Pull_Hit'
   VortexGrabEndAkEvent=AkEvent'WW_ZED_Siren.Stop_Siren_Pull_Hit'
   ViewPitchConstraints=(X=-8192.000000,Y=8192.000000)
   VortexCheckTime=0.140000
   MaxRangeSQ=1562500.000000
   MinGrabTargetFOV=0.960000
   VortexEffect=ParticleSystem'VFX_TEX_THREE.FX_Siren_Pull_Long_01'
   VortexDuration=6.000000
   MinVortexDuration=1.000000
   ViewRotInterpSpeed=0.500000
   DamageOverDuration=24.000000
   VortexDamageType=Class'kfgamecontent.KFDT_Sonic_VortexScream'
   GrappleAnims(0)="Player_Pull"
   FollowerSpecialMove=SM_SirenVortexVictim
   bAlignLeaderLocation=False
   bAlignFollowerZ=True
   bStopAlignFollowerRotationAtGoal=False
   AlignDistance=360.000000
   AlignDistanceThreshold=4.000000
   AlignSpeedModifier=0.040000
   Handle="KFSM_PlayerSiren_VortexScream"
   Name="Default__KFSM_PlayerSiren_VortexScream"
   ObjectArchetype=KFSM_GrappleAttack'KFGame.Default__KFSM_GrappleAttack'
}
