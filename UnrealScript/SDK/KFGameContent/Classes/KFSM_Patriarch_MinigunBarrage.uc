//=============================================================================
// KFSM_Patriarch_MinigunBarrage
//=============================================================================
// Patriarch's minigun barrage attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Patriarch_MinigunBarrage extends KFSM_PlaySingleAnim;

/** Cached reference to Patriarch pawn */
var KFPawn_ZedPatriarch MyPatPawn;

/** Cached reference to Patriarch AI controller */
var KFAIController_ZedPatriarch MyPatController;

/** Wind Up animation name */
var Name WindUpAnimName;

/** Wind Down animation name */
var Name WindDownAnimName;

/** Alternate fan attack animation names */
var array<Name> FanAnimNames;

/** Set according to special move flags */
var bool bIsFanFire;

/** Rotation rate to use when focus firing */
var rotator FocusFireRotationRate;

/** Minigun sounds */
var AkEvent MinigunLoop;
var AkEvent MinigunLoopEnd;

/** Time to check before firing if an enemy is still visible */
var float VisibilityCheckTime;

/** Set to true if AI command interrupted move early */
var bool bInterrupted;

/** Set to true if fire LOS was obstructed mid-move */
var bool bObstructed;

/** Pack the animation type we'll be using (fan vs. focus fire) */
static function byte PackSMFlags( bool bIsFanFireAttack )
{
	return ( bIsFanFireAttack ? 1 : 0 ) + ( Rand(default.FanAnimNames.Length) << 4 );
}

/** Notification called when Special Move starts */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	local byte Type, Variant;

	Super.SpecialMoveStarted( bForced,PrevMove );

	MyPatPawn = KFPawn_ZedPatriarch(KFPOwner);

	// Uncloak
	MyPatPawn.SetCloaked( false );

	// Set anim type by flag
	Type = MyPatPawn.SpecialMoveFlags & 15; //0x0f
	Variant = MyPatPawn.SpecialMoveFlags >> 4;

	// Set the anim according to the type of barrage we'll be doing
	if( Type > 0 )
	{
		MyPatPawn.bSprayingFire = true;
		bIsFanFire = true;
		AnimName = FanAnimNames[Variant];
	}
	else
	{
		MyPatPawn.bSprayingFire = false;
		if( MyPatPawn.Role == ROLE_Authority )
		{
			MyPatPawn.SetGunTracking( true );
		}
	}

	// Clear the special move flags now so that SpecialMoveFlagsUpdated never fails
	MyPatPawn.SpecialMoveFlags = 255;

	// Zero movement
	MyPatPawn.ZeroMovementVariables();

	// Play dialog
	MyPatPawn.PlayMinigunWarnDialog();

	// Cache controller
	MyPatController	= KFAIController_ZedPatriarch( MyPatPawn.Controller );

	// Play wind up
	PlayWindUpAnimation();

	// Check to make sure our enemy is still visible
	if( MyPatPawn.Role == ROLE_Authority && !MyPatPawn.IsHumanControlled() )
	{
		MyPatPawn.SetTimer( VisibilityCheckTime, false, nameOf(Timer_CheckEnemyLOS), self );
	}

	bObstructed = false;
	bInterrupted = false;
}


/** Overridden to do nothing */
function PlayAnimation() {}

/** Plays our wind up anim, starts the barrel spin skel controller */
function PlayWindUpAnimation()
{
	/*bUseRootMotion = true;
	MyPatPawn.Mesh.RootMotionMode = RMM_Accel;
	MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);*/
	PlaySpecialMoveAnim( WindUpAnimName, EAS_FullBody, BlendInTime, BlendOutTime, 1.f );
	MyPatPawn.SpinMinigunBarrels( true );

	// Play our looping minigun sound
	MyPatPawn.PostAkEventOnBone( MinigunLoop, 'BarrelSpinner', true, true );
}

/** Make sure we have a clear path to enemy */
function Timer_CheckEnemyLOS()
{
	local vector StartTrace, EndTrace;

	if( MyPatPawn != none && MyPatPawn.Controller != none )
	{
		MyPatPawn.Mesh.GetSocketWorldLocationAndRotation( 'MissileCenter', StartTrace );
		EndTrace = StartTrace + (Normal(MyPatPawn.Controller.Enemy.Location - StartTrace) * 300.f);
		if( !MyPatPawn.FastTrace(EndTrace, StartTrace,, true) )
		{
	        MyPatPawn.SpecialMoveFlags = 128;
	        MyPatPawn.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
	        bObstructed = true;
			PlayWindDownAnim();
		}
	}
}

/** Play the wind down if we have to */
function SpecialMoveFlagsUpdated()
{
	switch( MyPatPawn.SpecialMoveFlags )
	{
		// No more valid targets
		case 64:
        	bInterrupted = true;
	        if( !bIsFanFire )
	        {
	        	MyPatPawn.StopBodyAnim( EAS_UpperBody, 0.1f );
		    }
       		PlayWindDownAnim();
       		break;

	    // Obstructed
	    case 128:
	    	bObstructed = true;
	        PlayWindDownAnim();
	        break;
	}
}

/** Plays our fire animation, starts weapon fire */
function PlayFireAnim()
{
	if( bInterrupted || bObstructed )
	{
		return;
	}

	// Play dialog
	MyPatPawn.PlayMinigunAttackDialog();

	if( bIsFanFire )
	{
		MyPatPawn.bDisableTurnInPlace = true;
		bUseRootMotion = true;
		MyPatPawn.Mesh.RootMotionMode = RMM_Accel;
		MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);
		PlaySpecialMoveAnim( AnimName, EAS_FullBody, 0.1f, 0.2f );
	}
	else
	{
		bUseRootMotion = false;
		MyPatPawn.Mesh.RootMotionMode = KFPOwner.Mesh.default.RootMotionMode;
		MyPatPawn.RotationRate = FocusFireRotationRate;
		MyPatPawn.bDisableTurnInPlace = false;
		MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
		PlaySpecialMoveAnim( AnimName, EAS_UpperBody, BlendInTime, BlendOutTime, 1.f );
	}

	// Zero movement
	MyPatPawn.ZeroMovementVariables();

	// Start firing
	if( MyPatPawn.Role == ROLE_Authority )
	{
		MyPatPawn.StartFire( 0 );

		if( !bIsFanFire && !MyPatPawn.IsHumanControlled() )
		{
			MyPatPawn.SetTimer( 0.06f, true, nameOf(Timer_CheckIfFireAllowed), self );
			MyPatPawn.SetTimer( 2.0f, true, nameOf(Timer_SearchForMinigunTargets), self );
		}
	}


}

/** Starts and stops minigun fire depending on whether pawn is directly facing enemy */
function Timer_CheckIfFireAllowed()
{
	local KFPawn KFP;
	local vector Projection, OtherProjection, PawnRot2D;
	local float DistSQ;

	Projection = MyPatController.Enemy.Location - MyPatPawn.Location;
	DistSQ = VSizeSQ( Projection );

	// Search for enemies obstructing us and our enemy
	foreach MyPatPawn.WorldInfo.AllPawns( class'KFPawn', KFP )
	{
		OtherProjection = KFP.Location - MyPatPawn.Location;

		if( KFP.IsAliveAndWell() 
			&& KFP.GetTeamNum() != MyPatPawn.GetTeamNum()
			&& VSizeSQ(OtherProjection) < DistSQ
			&& vector(MyPatPawn.Rotation) dot Normal(OtherProjection) >= 0.9f
			&& MyPatPawn.FastTrace(KFP.Location, MyPatPawn.Location,, true) )
		{
			MyPatController.ChangeEnemy( KFP, false );
			MyPatPawn.SetTimer( 2.0f, true, nameOf(Timer_SearchForMinigunTargets), self );
			MyPatPawn.SetGunTracking( true );
			if( !MyPatPawn.IsFiring() )
			{
				MyPatPawn.StartFire( 0 );
			}
			return;
		}
	}

	if( MyPatPawn.Controller != none && MyPatController.Enemy != none )
	{
		PawnRot2D = vector( MyPatPawn.Rotation );
		PawnRot2D.Z = 0.f;
		if( PawnRot2D dot Normal2D(Projection) >= 0.9f )
		{
			if( !MyPatPawn.IsFiring() )
			{
				MyPatPawn.StartFire( 0 );
			}
			return;
		}
	}

	if( MyPatPawn.IsFiring() )
	{
		MyPatPawn.StopFiring();
	}
}

/** Searches for new minigun targets */
function Timer_SearchForMinigunTargets()
{
	if( bIsFanFire || MyPatController == none )
	{
		return;
	}

	// Try to find a new enemy
	if( MyPatController.CheckForEnemiesInFOV(4000.f, 0.6f, 1.f, true, false) != none )
	{
		MyPatPawn.SetGunTracking( true );
		return;
	}

	// If we have no valid enemy, or no valid LOS to enemy, end barrage
	if ( MyPatController.Enemy == none || !MyPatPawn.FastTrace(MyPatController.Enemy.Location, MyPatPawn.Location,, true) )
	{
		MyPatPawn.SpecialMoveFlags = 64;
		SpecialMoveFlagsUpdated();
	}
}

/** Plays our wind down animation, stops firing, disables barrel spin skel controller */
function PlayWindDownAnim()
{
	if( bObstructed )
	{
		MyPatPawn.StopBodyAnim( EAS_FullBody, 0.33f );
	}

	// Clear our fire rotation check timer
	MyPatPawn.ClearTimer( nameOf(Timer_CheckIfFireAllowed), self );

	// Clear our target switching timer
	MyPatPawn.ClearTimer( nameOf(Timer_SearchForMinigunTargets), self );

	// Sync weapon state
	if( MyPatPawn.Weapon != none && !MyPatPawn.Weapon.IsInState('Active') )
	{
		MyPatPawn.StopFiring();
		MyPatPawn.Weapon.GotoState('Active');
	}

	// Zero movement
	MyPatPawn.ZeroMovementVariables();

	bUseRootMotion = true;
	MyPatPawn.Mesh.RootMotionMode = RMM_Accel;
	MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);
	MyPatPawn.SpinMinigunBarrels( false );
	MyPatPawn.SetGunTracking( false );
	PlaySpecialMoveAnim( WindDownAnimName, EAS_FullBody, BlendInTime, BlendOutTime, 1.f );

	// Play our minigun loop end sound
	MyPatPawn.PostAkEventOnBone( MinigunLoopEnd, 'BarrelSpinner', true, true );
}

/** Plays subsequent animations in the barrage */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	switch( SeqNode.AnimSeqName )
	{
		case WindUpAnimName:
			PlayFireAnim();
			break;

		case AnimName:
			PlayWindDownAnim();
			break;

		case WindDownAnimName:
			KFPOwner.EndSpecialMove();
			break;
	}
}

function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	if( MyPatPawn != none )
	{
	    if( !bObstructed )
	    {
	    	MyPatPawn.StartWeaponCooldown();
	    }

		// Sync weapon state
		if( MyPatPawn.Weapon != none && !MyPatPawn.Weapon.IsInState('Active') )
		{
			MyPatPawn.StopFiring();
			MyPatPawn.Weapon.GotoState('Active');
		}

		// Play our minigun loop end sound
		if( MyPatPawn.bSpinBarrels )
		{
			MyPatPawn.PostAkEventOnBone( MinigunLoopEnd, 'BarrelSpinner', true, true );
		}

		MyPatPawn.ClearTimer( nameOf(Timer_CheckIfFireAllowed), self );
		MyPatPawn.ClearTimer( nameOf(Timer_CheckEnemyLOS), self );
		MyPatPawn.SetGunTracking( false );
		MyPatPawn.SpinMinigunBarrels( false );
		MyPatPawn.bSprayingFire = false;
		MyPatPawn.RotationRate = MyPatPawn.default.RotationRate;
		MyPatPawn.bDisableTurnInPlace = MyPatPawn.default.bDisableTurnInPlace;
		MyPatPawn = none;
	}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

DefaultProperties
{
	// SpecialMove
	Handle=KFSM_Patriarch_MinigunBarrage
	bDisableSteering=false
	bDisableMovement=true
   	bCanBeInterrupted=false
	bAllowFireAnims=true
	FocusFireRotationRate=(Pitch=30000,Yaw=30000,Roll=30000)
	VisibilityCheckTime=1.0f

	// Sound
	MinigunLoop=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_Start'
	MinigunLoopEnd=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_Stop'

   	// Animation
	WindUpAnimName=Gun_TO_Load
	WindDownAnimName=Gun_TO_Idle
	AnimName=Gun_Idle
	FanAnimNames(0)=Gun_Shoot_Fan_V1
	FanAnimNames(1)=Gun_Shoot_Fan_V2
	FanAnimNames(2)=Gun_Shoot_Fan_V3
	
	BlendInTime=0.15f
	BlendOutTime=0.1f
	AbortBlendOutTime=0.1f
}