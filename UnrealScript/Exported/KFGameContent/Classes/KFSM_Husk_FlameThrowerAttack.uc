//=============================================================================
// KFSM_Husk_FlameThrowerAttack
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Husk_FlameThrowerAttack extends KFSM_PlaySingleAnim;

/** The Archetype to spawn for our fire spray actors. */
var KFSprayActor 	                    FlameSprayArchetype;
var KFSprayActor					    MyFlameSpray;
/** Emitter to play when firing stops. */
var ParticleSystemComponent             PSC_EndSpray;
/** Replicated flag to turn off the flamethrower effect on clients. */
var bool                     	 		bFlameThrowerActive;

/** Pilot light sound play event */
var AkEvent                             FlameAttackPlayEvent;

/** Pilot light sound stop event */
var AkEvent	                            FlameAttackStopEvent;

protected function bool InternalCanDoSpecialMove()
{
	local vector HitLocation, HitNormal;
	local Actor HitActor;

	if( KFPOwner.IsHumanControlled() )
	{
		return KFPOwner.IsAliveAndWell();
	}

	if( AIOwner == none || AIOwner.MyKFPawn == none || AIOwner.Enemy == none )
	{
		return false;
	}

	if( AIOwner.MyKFPawn.IsImpaired() )
	{
		return false;
	}

    // Make sure we have line of sight
	HitActor = PawnOwner.Trace(HitLocation, HitNormal, AIOwner.Enemy.Location, PawnOwner.Location, true);
	if ( HitActor != None && HitActor != AIOwner.Enemy )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );	

	if( AIOwner != none )
	{
		if( AIOwner!= None ) { AIOwner.AILog_Internal(self@"started for"@AIOwner,'Husk'); };
		AIOwner.AIZeroMovementVariables();
	}
}

/** Turns the flamethrower on */
simulated function TurnOnFlamethrower()
{
	local KFPawn_ZedHusk HuskOwner;

	HuskOwner = KFPawn_ZedHusk( PawnOwner );

	if( HuskOwner == none || !HuskOwner.IsAliveAndWell() || bFlameThrowerActive )
	{
		return;
	}

    if( MyFlameSpray == none )
    {
    	MyFlameSpray = HuskOwner.Spawn(FlameSprayArchetype.Class, HuskOwner,, HuskOwner.Location, HuskOwner.Rotation, FlameSprayArchetype, TRUE);

    	// Use a particular ImpactProjectileClass that will scale damage by difficulty
    	MyFlameSpray.ImpactProjectileClass = class'KFProj_HuskGroundFire';
    	MyFlameSpray.OwningKFPawn = HuskOwner;
    	MyFlameSpray.SetBase(HuskOwner,, HuskOwner.Mesh, MyFlameSpray.SpraySocketName );

    	if( HuskOwner.WorldInfo.NetMode != NM_DedicatedServer && PSC_EndSpray != None )
    	{
    		if( PSC_EndSpray != None)
        	{
        		PSC_EndSpray.SetTemplate(MyFlameSpray.SprayEndEffect);
        	}
            HuskOwner.Mesh.AttachComponentToSocket( PSC_EndSpray, MyFlameSpray.SpraySocketName );
    	}


    	if( HuskOwner.Role < ROLE_Authority )
    	{
            // Set these to be visual only as we do the damage on the server versions
        	MyFlameSpray.bVisualOnly=true;
    	}
	}

	bFlameThrowerActive = true;

    if( HuskOwner.Role == ROLE_Authority || HuskOwner.IsLocallyControlled() )
    {
        HuskOwner.SetWeaponAmbientSound(FlameAttackPlayEvent);
    }

	if( MyFlameSpray != none )
	{
		MyFlameSpray.BeginSpray();
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	TurnOffFlamethrower();

	super.SpecialMoveEnded( PrevMove, NextMove );

	if( AIOwner != none )
	{
		if( AIOwner!= None ) { AIOwner.AILog_Internal(self@"ended for"@AIOwner,'Husk'); };
	}
}

/** Turns the flamethrower off */
simulated function TurnOffFlamethrower()
{
	local KFPawn_ZedHusk HuskOwner;

	HuskOwner = KFPawn_ZedHusk( PawnOwner );

	if( HuskOwner == none || !bFlameThrowerActive )
	{
		return;
	}

    bFlameThrowerActive = false;

    if( HuskOwner.Role == ROLE_Authority || HuskOwner.IsLocallyControlled() )
    {
    	HuskOwner.SetWeaponAmbientSound(FlameAttackStopEvent);
    }

	// play end-of-firing poof.  will stop itself.
	if( PSC_EndSpray != None )
	{
		PSC_EndSpray.ActivateSystem();
	}

	if( MyFlameSpray != none )
	{
		MyFlameSpray.DetachAndFinish();
	}
}

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'Knockdown') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

defaultproperties
{
   FlameSprayArchetype=SprayActor_Flame'zed_husk_arch.Husk_Flamethrower_Flame'
   Begin Object Class=ParticleSystemComponent Name=FlameEndSpray0
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   PSC_EndSpray=FlameEndSpray0
   FlameAttackPlayEvent=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Flamethrower_LP'
   FlameAttackStopEvent=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Flamethrower_Stop'
   AnimName="Player_Flame"
   bCanBeInterrupted=True
   bDisableMovement=True
   bDisableSteering=False
   Handle="KFSM_Husk_FlameThrowerAttack"
   Name="Default__KFSM_Husk_FlameThrowerAttack"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
