//=============================================================================
// KFSM_FleshpoundKing_ChestBeam
//=============================================================================
// Fleshpound king's chest beam attach. Beam particle code from
// KFSM_Matriarch_PlasmaCannon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Matt 'Squirrlz' Farber
//=============================================================================
class KFSM_FleshpoundKing_ChestBeam extends KFSM_PlaySingleAnim;

/** Cached king pawn owner */
var KFPawn_ZedFleshpoundKing KingPawnOwner;

/** Template for the plasma beam */
var const ParticleSystem BeamPSCTemplate;

/** PSC generated from the beam template.  Gets recycled in and out of the emitter pool as needed. */
var ParticleSystemComponent BeamPSC;

/** Template for beam hit location FX */
var const ParticleSystem BeamHitPSCTemplate;

/** PSC for the hit location. On when the beam is hitting anything, off when missing everything */
var ParticleSystemComponent BeamHitPSC;

/** AK Event for start of beam charge */
var AkEvent BeamStartSFX;

/** AK Event for end of special move */
var AkEvent BeamEndSFX;

/** Looping sound for beam hit */
var AkEvent BeamHitSFX;
var AkEvent BeamHitStopSFX;

/** Camera shake impact */
var CameraShake BeamHitShake;

/** Socket to attach origin of beam */
var const Name ChestBeamSocketName;

/** How much time to wait before attempting to sweep to a new target */
var const float TimeUntilTargetChange;

/** Damagetype used for beam attack */
var const class<KFDamageType> BeamDamageType;

/** The maximum length the beam can be (used both for FX and damage) */
var const float MaxBeamLength;

/** The width, height, and depth of the beam, used for damage traces */
var const vector BeamExtent;

/** How much time to wait between damage ticks */
var const float DamageInterval;

/** How much damage to deal per damage tick */
var const int DamagePerTick;

/** How much of a momentum impulse to apply each damage tick */
var const float DamageMomentumImpulse;

/** Draws a debug line between the beam's start and end points */
var const bool bDrawDebugBeam;

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
    super.SpecialMoveStarted(bForced, PrevMove);

    // Attempt a sweep attack if we have multiple targets in front of us
    if( KFPOwner.Role == ROLE_Authority )
    {
    	KFPOwner.SetTimer( TimeUntilTargetChange, false, nameOf(Timer_AttemptTargetChange), self );
    }

    // Use custom FX/lights
    KFPOwner.UpdateGameplayMICParams();

    //Start KFP beam SFX
    KFPOwner.SetWeaponAmbientSound(BeamStartSFX);

    KingPawnOwner = KFPawn_ZedFleshpoundKing(KFPOwner);
}

/** Updates beam PSC */
function Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( KFPOwner.WorldInfo.NetMode != NM_DedicatedServer && BeamPSC != none && BeamPSC.bIsActive )
	{
		SetBeamTarget();
	}
}

function bool IsValidBeamTarget(Actor HitActor)
{
    //If we're a pawn or we're a non-resettable static mesh actor
    return Pawn(HitActor) != none || (StaticMeshActor(HitActor) != none && !StaticMeshActor(HitActor).bResetCapable) || SkeletalMeshActor(HitActor) != none || StaticMeshCollectionActor(HitActor) != none;
}

function SetBeamTarget()
{
	local vector SocketLoc, BeamEnd, HitLocation, HitNormal;
	local rotator SocketRot;
    local Actor HitActor;
    local bool bShouldActivateHit;

	KFPOwner.Mesh.GetSocketWorldLocationAndRotation( ChestBeamSocketName, SocketLoc, SocketRot );
	BeamEnd = SocketLoc + vector(KFPOwner.Rotation) * MaxBeamLength; // for now use Pawn's rotation, I don't know why but this socket's rotation freaks out during the animation

    bShouldActivateHit = false;
    foreach KFPOwner.TraceActors(class'Actor', HitActor, HitLocation, HitNormal, BeamEnd, SocketLoc, BeamExtent, , KFPOwner.TRACEFLAG_Bullet)
    {
        //Beam will be stopped on all valid targets
        if (IsValidBeamTarget(HitActor))
        {
            if (HitActor != none && HitActor.bCanBeDamaged)
            {
                BeamEnd = HitLocation - vect(0, 0, 64);
            }
            else
            {
                BeamEnd = HitLocation;
            }
            bShouldActivateHit = HitActor != none;
            break;
        }
    }

	BeamPSC.SetBeamTargetPoint( 0, BeamEnd, 0 );

    //Setup impact sound/fx if valid
    if (bShouldActivateHit)
    {
		//Trigger sound and VFX at the same time, use the more reliable SFX
        if (BeamHitPSC == none)
        {
            BeamHitPSC = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitter(BeamHitPSCTemplate, BeamEnd);
			KingPawnOwner.BeamHitAC.PlayEvent(BeamHitSFX);
        }
    }
	else
	{
		if (BeamHitPSC != none && BeamHitPSC.bIsActive)
		{
			BeamHitPSC.DeactivateSystem();
			BeamHitPSC = none;
			KingPawnOwner.BeamHitAC.PlayEvent(BeamHitStopSFX);
		}
	}

    //Update location of sound/fx
    if (BeamHitPSC != none)
    {
        BeamHitPSC.SetAbsolute(true, true, false);
        BeamHitPSC.SetTranslation(BeamEnd);
        BeamHitPSC.SetRotation(KFPOwner.Rotation);
    }

	if( bDrawDebugBeam )
	{
		KFPOwner.FlushPersistentDebugLines();
		KFPOwner.DrawDebugLine( SocketLoc, BeamEnd, 100, 128, 255, true );
	}
}

function ToggleBeam( bool bEnable )
{
    local ParticleSysParam SourceParam;

	if( bEnable )
	{
	    //Startup visual FX
	    if( BeamPSCTemplate != none)
	    {
	        BeamPSC = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( BeamPSCTemplate, KFPOwner.Mesh, ChestBeamSocketName, true );
	        if( BeamPSC != none)
	        {
	            SourceParam.Name = 'SourceActor';
	            SourceParam.ParamType = PSPT_Actor;
	            SourceParam.Actor = KFPOwner;
	            BeamPSC.InstanceParameters.AddItem( SourceParam );

	            SetBeamTarget();
	        }
	    }

	    // Start damage timer. We'll do damage on the client too so we affect ragdolls!
	    KFPOwner.SetTimer( DamageInterval, true, nameOf(Timer_TickDamage), self );
	}
	else
	{
		DisableBeamFX();

		// Stop dealing damage
	    KFPOwner.ClearTimer( nameOf(Timer_TickDamage), self );
	}
}

/** Turns the beam particle system/sound OFF */
function DisableBeamFX()
{
	if( BeamPSC != none && BeamPSC.bIsActive )
	{
        BeamPSC.DeactivateSystem();
        BeamPSC = none;
	}

    if (BeamHitPSC != none)
    {
        BeamHitPSC.DeactivateSystem();
        BeamHitPSC = none;
    }

    if (KingPawnOwner.BeamHitAC != none)
    {
        KingPawnOwner.BeamHitAC.StopEvents();
    }
}

function Timer_AttemptTargetChange()
{
	local Pawn P, BestTarget;
	local KFAIController_ZedFleshpoundKing KingFPController;
	local vector PawnDir;
	local float DotAngle, BestAngle;

	PawnDir = vector( KFPOwner.Rotation );

	foreach KFPOwner.WorldInfo.AllPawns( class'Pawn', P )
	{
		if( P != KFPOwner
			&& P != AIOwner.Enemy
			&& P.GetTeamNum() != KFPOwner.GetTeamNum()
			&& P.IsAliveAndWell() 
			&& P.CanAITargetThisPawn(KFPOwner.Controller))
		{
			DotAngle = PawnDir dot Normal( P.Location - KFPOwner.Location );
			if( DotAngle < 0.2f )
			{
				continue;
			}

			// Choose the target furthest from the center to create the widest sweep
			if( BestAngle == 0.f || DotAngle < BestAngle )
			{
				BestAngle = DotAngle;
				BestTarget = P;
			}
		}
	}

	// Set our new target if we can
	if( BestTarget != none )
	{
		KingFPController = KFAIController_ZedFleshpoundKing( AIOwner );
		if( KingFPController != none )
		{
			KingFPController.ForceTargetChange( BestTarget );
		}
	}
}

function Timer_TickDamage()
{
	local vector SocketLoc, BeamDir, EndTrace, HitLocation, HitNormal;
	local rotator SocketRot;
	local Actor HitActor;
	local TraceHitInfo HitInfo;

	KFPOwner.Mesh.GetSocketWorldLocationAndRotation( ChestBeamSocketName, SocketLoc, SocketRot );
	BeamDir = vector( KFPOwner.Rotation ); // for now use Pawn's rotation, I don't know why but this socket's rotation freaks out during the animation
	EndTrace = SocketLoc + BeamDir * MaxBeamLength;

    foreach KFPOwner.TraceActors(class'Actor', HitActor, HitLocation, HitNormal, EndTrace, SocketLoc, BeamExtent, , KFPOwner.TRACEFLAG_Bullet)
    {
        //Beam will be stopped on all valid targets
        if (IsValidBeamTarget(HitActor))
        {
            if (HitActor.bCanBeDamaged)
            {
                HitActor.TakeDamage(DamagePerTick, KFPOwner.Controller, HitLocation, BeamDir*DamageMomentumImpulse, BeamDamageType, HitInfo, KFPOwner);
				if (Pawn(HitActor) != none && PlayerController(Pawn(HitActor).Controller) != none)
				{
					PlayerController(Pawn(HitActor).Controller).ClientPlayCameraShake(BeamHitShake, 1.f, true);
				}
            }
            return;
        }
    }
}

function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
    super.SpecialMoveEnded(PrevMove, NextMove);

    ToggleBeam(false);

    //Start KFP beam SFX
    KFPOwner.SetWeaponAmbientSound(BeamEndSFX);

    // Restore FX/lights
    if( KFPOwner != none && KFPOwner.IsAliveAndWell() )
    {
	    KFPOwner.UpdateGameplayMICParams();
	}

	KFPOwner.FlushPersistentDebugLines(); // temp, @todo: remove
}

defaultproperties
{
   BeamPSCTemplate=ParticleSystem'zed_fleshpound_king_emit.FX_ChestBeam'
   BeamHitPSCTemplate=ParticleSystem'zed_fleshpound_king_emit.FX_ChestBeam_Impact'
   BeamStartSFX=AkEvent'ww_zed_fleshpound_2.Play_King_FP_Beam_Start_LP'
   BeamEndSFX=AkEvent'ww_zed_fleshpound_2.Play_King_FP_Beam_End'
   BeamHitSFX=AkEvent'ww_zed_fleshpound_2.Play_FP_Beam_Hit_LP'
   BeamHitStopSFX=AkEvent'ww_zed_fleshpound_2.Stop_FP_Beam_Hit_LP'
   BeamHitShake=CameraShake'kfgamecontent.Default__KFSM_FleshpoundKing_ChestBeam:BeamHitShake0'
   ChestBeamSocketName="ChestBeamSocket"
   TimeUntilTargetChange=0.750000
   BeamDamageType=Class'kfgamecontent.KFDT_FleshpoundKing_ChestBeam'
   MaxBeamLength=3000.000000
   BeamExtent=(X=15.000000,Y=15.000000,Z=15.000000)
   DamageInterval=0.100000
   DamagePerTick=12
   DamageMomentumImpulse=100.000000
   AnimName="Atk_ChestBeam"
   bUseCustomRotationRate=True
   bDisableMovement=True
   bDisableSteering=False
   bDisableTurnInPlace=True
   CustomRotationRate=(Pitch=50000,Yaw=25000,Roll=50000)
   Handle="KFSM_FleshpoundKing_ChestBeam"
   Name="Default__KFSM_FleshpoundKing_ChestBeam"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
