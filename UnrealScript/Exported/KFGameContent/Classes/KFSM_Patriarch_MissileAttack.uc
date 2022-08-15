//=============================================================================
// KFSM_Patriarch_MissileAttack
//=============================================================================
// Patriarch's triple missile attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Patriarch_MissileAttack extends KFSM_PlaySingleAnim;

/** Cached reference to Patriarch pawn */
var KFPawn_ZedPatriarch MyPatPawn;

/** Cached reference to Patriarch AI controller */
var KFAIController_ZedPatriarch MyPatController;

/** Missile projectile class */
var class<KFProj_Missile_Patriarch> MissileClass;

/** Load animation names */
var Name LoadAnimNames[2];

/** The load animation chosen */
var Name LoadAnim;

/** Wind down animation name */
var Name WindDownAnimName;

/** Base socket name for each missile */
var String BaseSocketName;

/** Rotation rate to use for special move */
var rotator MissileFireRotationRate;

/** Whether we should allow gun tracking or not */
var bool bAllowGunTracking;

/** Disables or enables missile flocking (attraction) */
var bool bMissileFlocking;

/** How fast the missiles should travel */
var float InitialMissileSpeed;

/** How long a missile should wait after spawning to start seeking */
var float SeekDelay;

/** How much seek force should be applied to the missiles */
var float SeekForce;

/** How much gravity force to apply */
var float GravForce;

/** The distance from the target location before we start applying gravity */
var float DistToApplyGravitySQ;

/** Fire sound */
var AkEvent FireSound;

/** Notification called when Special Move starts */
function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	Super.SpecialMoveStarted( bForced,PrevMove );

	MyPatPawn = KFPawn_ZedPatriarch(KFPOwner);

	// Set load anim
	if( MyPatPawn.SpecialMoveFlags == 1 )
	{
		LoadAnim = LoadAnimNames[1];
	}
	else
	{
		LoadAnim = LoadAnimNames[0];
	}

	// Uncloak
	MyPatPawn.SetCloaked( false );

	// Zero movement
	MyPatPawn.ZeroMovementVariables();

	// Play wind up
	PlayLoadAnimation();

	// Cache controller
	MyPatController	= KFAIController_ZedPatriarch( MyPatPawn.Controller );

	// Set a timer to start gun tracking
	if( bAllowGunTracking && MyPatPawn.Role == ROLE_Authority )
	{
		MyPatPawn.SetTimer( KFSkeletalMeshComponent(MyPatPawn.Mesh).GetAnimInterruptTime(LoadAnim), false, nameOf(StartGunTracking), self );
	}
}

/** Overridden to do nothing */
function PlayAnimation() {}

/** Play the load animation */
function PlayLoadAnimation()
{
	bUseRootMotion = false;
	//MyPatPawn.Mesh.RootMotionMode = RMM_Accel;
	//MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);
	PlaySpecialMoveAnim( LoadAnim, EAS_FullBody, BlendInTime, 0.f, 1.f );
}

/** Start gun tracking as the weapon is being brought level */
function StartGunTracking()
{
	if( MyPatPawn != none )
	{
		MyPatPawn.SetGunTracking( true );
	}
}

/** Play the fire animation */
function PlayFireAnimation()
{
	if( MyPatPawn == none )
	{
		return;
	}

	bUseRootMotion = false;
	MyPatPawn.Mesh.RootMotionMode = MyPatPawn.Mesh.default.RootMotionMode;
	MyPatPawn.RotationRate = MissileFireRotationRate;
	MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Discard, RBA_Discard, RBA_Discard);
	PlaySpecialMoveAnim( AnimName, EAS_UpperBody, 0.f, BlendOutTime, 1.f );

	// Shoot some missiles on the server
	if( MyPatPawn.Role == ROLE_Authority )
	{
		FireMissiles();
	}

	// Play our fire sound
	MyPatPawn.PostAkEventOnBone( FireSound, 'BarrelSpinner', true, true );

	// Zero movement
	MyPatPawn.ZeroMovementVariables();
}

/** Retrieves the aim direction and target location for each missile */
function GetAimDirAndTargetLoc( int MissileNum, vector MissileLoc, rotator MissileRot, out vector AimDir, out vector TargetLoc )
{
	local vector X,Y,Z;
	local Pawn EnemyPawn;
	local int EnemyIndex;

	// Get the best location to aim at
	EnemyPawn = MyPatPawn.Controller.Enemy;
	if( MyPatController != none && !MyPatController.CanSee(EnemyPawn) )
	{
		EnemyIndex = MyPatController.RecentlySeenEnemyList.Find( 'TrackedEnemy', KFPawn(EnemyPawn) );
		if( EnemyIndex != INDEX_NONE )
		{
			TargetLoc = MyPatController.RecentlySeenEnemyList[EnemyIndex].LastVisibleLocation;
		}
		else
		{
			EnemyIndex = MyPatController.HiddenEnemies.Find( 'TrackedEnemy', KFPawn(EnemyPawn) );
			if( EnemyIndex != INDEX_NONE )
			{
				TargetLoc = MyPatController.HiddenEnemies[EnemyIndex].LastVisibleLocation;
			}
			else
			{
				TargetLoc = EnemyPawn.Location;
			}
		}
	}
	else
	{
		TargetLoc = EnemyPawn.Location;
	}

	// Try to aim somewhat for the feet
	TargetLoc += (vect(0,0,-1) * (EnemyPawn.GetCollisionHeight() * 0.25f));

	// If no LOS, aim higher
	if( !MyPatPawn.FastTrace(TargetLoc, MissileLoc,, true) )
	{
		TargetLoc = EnemyPawn.Location + (vect(0,0,1) * EnemyPawn.BaseEyeHeight);
	}

	// Nudge the spread a tiny bit to make the missiles less concentrated on a single point
	GetAxes( MissileRot, X,Y,Z );
	AimDir = Normal( (TargetLoc - MissileLoc) + (Z*6.f) );
}

/** Fire our three missiles */
function FireMissiles()
{
	local KFProj_Missile_Patriarch Missile;
	local Array<KFProj_Missile_Patriarch> FiredMissiles;
	local vector SpawnLoc, TargetLoc, AimDir;
	local rotator SpawnRot;
	local int i,j,k;
	local bool bCurl;
	local float CurlForceMultiplier;

	// Fire three missiles in a curling spread
	CurlForceMultiplier = 1.f + fRand()*0.1;
	for( i = 0; i < 3; ++i )
	{
		// Spawn a missile at each of the launch bays
		MyPatPawn.Mesh.GetSocketWorldLocationAndRotation( Name( BaseSocketName$String(i+1) ), SpawnLoc, SpawnRot );
		Missile = MyPatPawn.Spawn( MissileClass, MyPatPawn,, SpawnLoc, SpawnRot,, true );
		
		GetAimDirAndTargetLoc( i, SpawnLoc, SpawnRot, AimDir, TargetLoc );

		// If missile flocking is disabled, we still want things like seeking etc
		if( !bMissileFlocking )
		{
			Missile.bCurl = 3;
			Missile.StartCurlTimer();
		}

		Missile.InitEx( AimDir, CurlForceMultiplier, TargetLoc, InitialMissileSpeed, SeekDelay, SeekForce, GravForce, DistToApplyGravitySQ );
		FiredMissiles[FiredMissiles.Length] = Missile;
	}

	// To get crazy flying, we tell each projectile in the flock about the others
	if( bMissileFlocking )
	{
		bCurl = false;
		for( i = 0; i < 3; ++i )
		{
			if( FiredMissiles[i] != None )
			{
				j=0;
				for( k = 0; k < 3; k++ )
				{
					if( (i != k) && (FiredMissiles[k] != None) )
					{
						FiredMissiles[i].Flock[j] = FiredMissiles[k];
						j++;
					}
				}

				FiredMissiles[i].bCurl = 1 + byte(bCurl);
				FiredMissiles[i].StartCurlTimer();
				bCurl = !bCurl;
			}
		}
	}
}

/** If we had to interrupt the move because we lost LOS, play a wind down animation */
function PlayWindDownAnimation()
{
	// Zero movement
	MyPatPawn.ZeroMovementVariables();

	MyPatPawn.StopBodyAnim( EAS_FullBody, 0.33f );
	bUseRootMotion = true;
	MyPatPawn.Mesh.RootMotionMode = RMM_Accel;
	MyPatPawn.BodyStanceNodes[EAS_FullBody].SetRootBoneAxisOption(RBA_Translate, RBA_Translate, RBA_Translate);
	PlaySpecialMoveAnim( WindDownAnimName, EAS_FullBody, 0.33f, BlendOutTime, 1.f );
}

/** Plays subsequent animations in the barrage */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	switch( SeqNode.AnimSeqName )
	{
		case LoadAnim:
			PlayFireAnimation();
			break;

		case AnimName:
			MyPatPawn.EndSpecialMove();
			break;

		case WindDownAnimName:
			MyPatPawn.EndSpecialMove();
			break;
	}
}

/** End special move */
function SpecialMoveEnded( Name PrevMove, Name NextMove )
{
	if( MyPatPawn != none )
	{
		MyPatPawn.StartWeaponCooldown();

		if( bAllowGunTracking )
		{
			MyPatPawn.ClearTimer( nameOf(StartGunTracking) );
			MyPatPawn.SetGunTracking( false );
		}
		MyPatPawn.RotationRate = MyPatPawn.default.RotationRate;
	}

	MyPatPawn = none;
	MyPatController = none;

	super.SpecialMoveEnded( PrevMove, NextMove );
}

defaultproperties
{
   MissileClass=Class'kfgamecontent.KFProj_Missile_Patriarch'
   LoadAnimNames(0)="Rocket_TO_Load"
   LoadAnimNames(1)="Rocket_TO_LoadQ"
   WindDownAnimName="Rocket_TO_Idle"
   BaseSocketName="Missile"
   MissileFireRotationRate=(Pitch=15000,Yaw=15000,Roll=15000)
   bAllowGunTracking=True
   bMissileFlocking=True
   InitialMissileSpeed=2000.000000
   SeekForce=15.000000
   FireSound=AkEvent'WW_ZED_Patriarch.Play_Mini_Rocket_Fire'
   AnimName="Rocket_Shoot"
   BlendInTime=0.150000
   BlendOutTime=0.250000
   AbortBlendOutTime=0.100000
   bDisableMovement=True
   bDisableSteering=False
   Handle="KFSM_Patriarch_MissileAttack"
   Name="Default__KFSM_Patriarch_MissileAttack"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
