//=============================================================================
// KFAIController_ZedHusk
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedHusk extends KFAIController_Monster;

var bool bBaseCommandInitialized;

var float	MinDistanceToSuicide;
var float	RequiredHealthPercentForSuicide;
var vector	LastEnemySeenPosition;

var float LastFireBallTime;
var float LastFlameThrowerTime;

/** The time until we shoot again based on difficulty without any randomization */
var float BaseTimeBetweenFireBalls;
/** The time to wait until our next shot, gets randomized with each shot */
var float TimeBetweenFireBalls;

/** The time to wait until we can use the flamethrower again*/
var float TimeBetweenFlameThrower;

var float FireballRandomizedValue;

var int MaxDistanceForFlameThrower;
var int MaxDistanceForFireBall;

var bool bCanUseFlameThrower;

var float LastCheckSpecialMoveTime;
var float CheckSpecialMoveTime;

/** Fireball projectile attack */
var name							FireballSocketName;
var const	float					FireballAimError;
var const	float					FireballLeadTargetAimError;
var const	bool					bDebugAimError;
var const	bool					bCanLeadTarget;
var const	float					FireballSpeed;

/** Fireball projectile attack difficulty scalars */
var const	float					SplashAimChanceNormal;
var const	float					SplashAimChanceHard;
var const	float					SplashAimChanceSuicidal;
var const	float					SplashAimChanceHellOnEarth;

var const float					FireballFireIntervalNormal;
var const float					FireballFireIntervalHard;
var const float					FireballFireIntervalSuicidal;
var const float					FireballFireIntervalHellOnEarth;

/** Offset for firing fireballs. */
var vector							FireOffset;

//var transient array<KFDoorMarker> Doors;

function bool IsNearDoor()
{
	//local int i;

	//for( i = 0; i < Doors.Length; i++ )
	//{
	//	if( VSizeSq(Pawn.Location - Doors[i].Location) < 160000.f )
	//	{
	//		return true;
	//	}
	//}
	return false;
}

event Possess( Pawn inPawn, bool bVehicleTransition )
{
//	local KFDoorMarker KFDM;
//
	super.Possess( inPawn, bVehicleTransition );

	//if( Doors.Length == 0 )
	//{
	//	foreach WorldInfo.AllNavigationPoints( class'KFDoorMarker', KFDM )
	//	{
	//		Doors.AddItem( KFDM );
	//	}
	//}
}

event PostBeginPlay()
{
	local KFGameInfo KFGI;

	super.PostBeginPlay();

	if( WorldInfo.Game != none )
	{
		KFGI = KFGameInfo(WorldInfo.Game);
		// If the difficulty is hard or higher, enable the flamethrower
		if ( KFGI != none && KFGI.GameDifficulty >= KFGI.DifficultyInfo.GetDifficultyValue(2))
		{
			bCanUseFlameThrower = true;
		}
	}

	// Determine the interval of allowing fireballs to be fired
    if( Skill == class'KFDifficultyInfo'.static.GetDifficultyValue(0) ) // Normal
    {
        BaseTimeBetweenFireBalls = FireballFireIntervalNormal;
    }
    else if( Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(1) ) // Hard
    {
        BaseTimeBetweenFireBalls = FireballFireIntervalHard;
    }
    else if( Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(2) ) // Suicidal
    {
        BaseTimeBetweenFireBalls = FireballFireIntervalSuicidal;
    }
    else // Hell on Earth
    {
        BaseTimeBetweenFireBalls = FireballFireIntervalHellOnEarth;
    }

	TimeBetweenFireBalls = BaseTimeBetweenFireBalls + RandRange(-FireballRandomizedValue, FireballRandomizedValue);
}

simulated function Tick( FLOAT DeltaTime )
{
	local float DistToTargetSq;

	super.Tick(DeltaTime);

	if( Role == ROLE_Authority && Enemy != none && MyKFPawn != none )
	{
		// Do not check every tick
		if( (WorldInfo.TimeSeconds - LastCheckSpecialMoveTime) >= CheckSpecialMoveTime && !MyKFPawn.IsDoingSpecialMove() )
		{
			if( GetActiveCommand() != none && !GetActiveCommand().IsA('AICommand_SpecialMove') )
			{
				DistToTargetSq = VSizeSq( Enemy.Location - Pawn.Location );

				// If you are suicidal, do not even try to use the flamethrower or fireball
				if( IsSuicidal() )
				{
					if( CanDoSuicide(DistToTargetSq) )
					{
						class'AICommand_Husk_Suicide'.static.Suicide(self);
					}
				}
				// Check if i can use my flamethrower
				else if( CanDoFlamethrower(DistToTargetSq) )
				{
					class'AICommand_HuskFlameThrowerAttack'.static.FlameThrowerAttack(self);
				}
				// Check if i can use my projectile
				else if( CanDoFireball(DistToTargetSq) )
				{
					class'AICommand_HuskFireBallAttack'.static.FireBallAttack(self);
					// Randomize the next fireball time
					TimeBetweenFireBalls = BaseTimeBetweenFireBalls + RandRange(-FireballRandomizedValue, FireballRandomizedValue);
				}
			}
			LastCheckSpecialMoveTime = WorldInfo.TimeSeconds;
		}
	}
}

function bool IsSuicidal()
{
	if( MyKFPawn == none || MyKFPawn.bIsHeadless )
	{
		return false;
	}
	return( GetHealthPercentage() <= RequiredHealthPercentForSuicide );
}

function bool CanDoSuicide( float DistToTargetSq )
{
	 if( DistToTargetSq <= (MinDistanceToSuicide * MinDistanceToSuicide) &&
		MyKFPawn.CanDoSpecialMove(SM_Suicide) )
	 {
		 return true;
	 }
	 return false;
}

function bool CanDoFlamethrower( float DistToTargetSq )
{
	 if( bCanUseFlameThrower &&
		(LastFlameThrowerTime == 0 || ((WorldInfo.TimeSeconds - LastFlameThrowerTime) > TimeBetweenFlameThrower)) &&
		DistToTargetSq <= MaxDistanceForFlameThrower * MaxDistanceForFlameThrower &&
		MyKFPawn.CanDoSpecialMove(SM_HoseWeaponAttack) )
	 {
		 return true;
	 }
	 return false;
}

function bool CanDoFireball( float DistToTargetSq )
{
	 if( (LastFireBallTime == 0 || ((WorldInfo.TimeSeconds - LastFireBallTime) > TimeBetweenFireBalls)) &&
		  DistToTargetSq <= MaxDistanceForFireBall * MaxDistanceForFireBall &&
		  MyKFPawn.CanDoSpecialMove(SM_StandAndShotAttack))
	 {
		 return true;
	 }
	 return false;
}

/** Overridden so the husk will not change to an enemy outside his view while doing the fireball attack */
event bool SetEnemy( Pawn NewEnemy )
{
	if( MyKFPawn == none || MyKFPawn.IsDoingSpecialMove(SM_StandAndShotAttack) )
	{
		if( MyKFPawn.NeedToTurn(NewEnemy.Location) )
		{
			AILog_Internal(GetFuncName()$"() rejecting "$NewEnemy$" because current enemy ("$Enemy$") we would need to turn to see it",'SetEnemy',);
			return false;
		}
	}

	return super.SetEnemy( NewEnemy );
}

/** Always sprint if we are suicidal */
function bool ShouldSprint()
{
	if( IsSuicidal() )
	{
		return true;
	}
	return super.ShouldSprint();
}

function DoStrike()
{
	if( MyKFPawn.PawnAnimInfo.Attacks[PendingAnimStrikeIndex].Tag == 'Projectile' )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotRocketsDialog( MyKFPawn );
	}

	super.DoStrike();
}

function ShootFireball(class<KFProjectile> FireballClass)
{
	local vector		SocketLocation, DirToEnemy, HitLocation, HitNormal;
	local KFProjectile	MyFireball;
	local actor			HitActor;
	local Vector AimLocation, GroundAimLocation;
	local float SplashAimChance;
	local vector randVectorDraw;
	local float randDraw;
	local vector displacementToHitLoc;
	local float distanceToHitLoc;

	if( MyKFPawn == none )
	{
		return;
	}

   	if( bDebugAimError )
	{
		// Render debug lines and simulate several shots at once to evaluate aimerror
		DebugAimError();
		return;
	}

	SocketLocation = MyKFPawn.GetPawnViewLocation() + (FireOffset >> Pawn.GetViewRotation());
	if( MyKFPawn.Health > 0.f && Role == ROLE_Authority && MyKFPawn.IsDoingSpecialMove(SM_StandAndShotAttack) )
	{
        AimLocation = Enemy.Location;

        // Determine the random chance of aiming at the ground for splash damage
        if( Skill == class'KFDifficultyInfo'.static.GetDifficultyValue(0) ) // Normal
        {
            SplashAimChance = SplashAimChanceNormal;
        }
        else if( Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(1) ) // Hard
        {
            SplashAimChance = SplashAimChanceHard;
        }
        else if( Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(2) ) // Suicidal
        {
            SplashAimChance = SplashAimChanceSuicidal;
        }
        else // Hell on Earth
        {
            SplashAimChance = SplashAimChanceHellOnEarth;
        }

		randDraw = FRand();

		if( self!= None ) { self.AILog_Internal(GetFuncName() @ " SplashAimChance: " @ SplashAimChance @ " randDraw: " @ randDraw,'FireBall'); };

        if( randDraw < SplashAimChance )
		{
			// Simple pass at making the Husk try and do splash damage when it shoots at a player rather than just shoot directly at them (and most likely miss)
            GroundAimLocation = Enemy.Location - (vect(0,0,1) * Enemy.GetCollisionHeight());

            if( GroundAimLocation.Z < SocketLocation.Z )
            {
                AimLocation = GroundAimLocation;
            }
		}

		//DrawDebugLine( SocketLocation, AimLocation, 0, 0, 255, true );

        HitActor = Trace( HitLocation, HitNormal, AimLocation, SocketLocation, true );

        // Don't shoot if it's too close
		if( HitActor == Enemy )
		{
			//DrawDebugStar( HitLocation, 50, 0, 255, 0, true );

			randVectorDraw = VRand();

			if( !bCanLeadTarget )
			{
 				DirToEnemy = normal( AimLocation - SocketLocation ) + randVectorDraw * FireballAimError;

				if( self!= None ) { self.AILog_Internal(GetFuncName() @ " HitActor: " @ HitActor @ " Is My Enemy: " @ Enemy @ " randVectorDraw: " @ randVectorDraw @ " - not leading with an error of: " @ randVectorDraw * FireballAimError,'FireBall'); };
			}
 			else
 			{
 				DirToEnemy = normal( CalcAimLocToHit(AimLocation, SocketLocation, FireballSpeed, FireballSpeed, Enemy.Velocity) - SocketLocation ) + randVectorDraw * FireballLeadTargetAimError;

				if( self!= None ) { self.AILog_Internal(GetFuncName() @ " HitActor: " @ HitActor @ " Is My Enemy: " @ Enemy @ " randVectorDraw: " @ randVectorDraw @ " - leading with an error of: " @ randVectorDraw * FireballLeadTargetAimError,'FireBall'); };
 			}
		}
		else
		{
			// If our path to the enemy is blocked, try his last known position
			AimLocation = AICommand_HuskFireBallAttack(GetActiveCommand()).LastKnownEnemyLocation;
			HitActor = Trace( HitLocation, HitNormal, AimLocation, SocketLocation, true );

			displacementToHitLoc = HitLocation - SocketLocation;
			distanceToHitLoc = VSize( displacementToHitLoc );

			// If there is an object in front of us, cancel the attack
			if( distanceToHitLoc < 300 )
			{
				//DrawDebugStar( HitLocation, 50, 255, 0, 0, true );

				if( self!= None ) { self.AILog_Internal(GetFuncName() @ " HitActor: " @ HitActor @ " Is NOT My Enemy: " @ Enemy @ " and distanceToHitLoc: " @ distanceToHitLoc @ " is too close so not firing!!!",'FireBall'); };
				MyKFPawn.SpecialMoves[ SM_StandAndShotAttack ].AbortedByAICommand();
				LastFireBallTime = WorldInfo.TimeSeconds;
				return;
			}
			else // Otherwise fire at the enemies last known position
			{
				//DrawDebugStar( HitLocation, 50, 0, 0, 255, true );

				randVectorDraw = VRand();
				DirToEnemy = normal( (AimLocation - SocketLocation) + randVectorDraw * FireballAimError );

				if( self!= None ) { self.AILog_Internal(GetFuncName() @" Fire at enemy last known position: " @ Enemy @ AimLocation @ " randVectorDraw: " @ randVectorDraw @ " - leading with an error of: " @ randVectorDraw * FireballLeadTargetAimError,'FireBall'); };
			}
		}

		//DrawDebugLine( SocketLocation, SocketLocation + DirToEnemy * 5000.0, 255, 0, 0, true );

		// Shoot the fireball
		MyFireball = Spawn( FireballClass, MyKFPawn,, SocketLocation, Rotator(DirToEnemy) );
		MyFireball.Instigator			= MyKFPawn;
		MyFireball.InstigatorController	= self;
		MyFireball.Speed				= FireballSpeed;
		MyFireball.MaxSpeed				= FireballSpeed;
		MyFireball.Init( DirToEnemy );

		LastFireBallTime = WorldInfo.TimeSeconds;
	}
}

/** If bDebugAimError is true, this will render the projectile's trajectory with no aimerror in green and simulate 7 more shots, rendering
 *  those trajectories in red (using aimerror) */
function DebugAimError()
{
	local int			i;
	local KFDebugLines	KFDL;
	local vector		SocketLocation, DirToEnemy;
	local rotator		SocketRotation;

	KFDL = class'KFDebugLines'.static.GetDebugLines();

	if( KFDL == none )
	{
		msg( "You need to turn KFDebugLines on (bEnableAdvDebugLines in KFGame.ini) to do this." );
		return;
	}

	MyKFPawn.Mesh.GetSocketWorldLocationAndRotation( FireballSocketName, SocketLocation, SocketRotation );

	KFDL.AddDebugLine( SocketLocation, SocketLocation + normal(Enemy.Location - SocketLocation) * 3024.f, 0, 255, 0, TRUE );
	for( i = 0; i < 7; i++ )
	{
		DirToEnemy = normal(Enemy.Location - SocketLocation) + VRand() * FireballAimError;
		KFDL.AddDebugLine( SocketLocation, SocketLocation + DirToEnemy * 3024.f, 255, 0, 0, TRUE );
	}
	msg( "GAME PAUSED, UNPAUSE TO CONTINUE" );
	DebugFreezeGame();
}

defaultproperties
{
   MinDistanceToSuicide=280.000000
   RequiredHealthPercentForSuicide=0.150000
   TimeBetweenFlameThrower=5.000000
   FireballRandomizedValue=1.000000
   MaxDistanceForFlameThrower=500
   MaxDistanceForFireBall=4000
   CheckSpecialMoveTime=0.250000
   FireballSocketName="FireballSocket"
   FireballAimError=0.030000
   FireballLeadTargetAimError=0.030000
   FireballSpeed=3600.000000
   SplashAimChanceNormal=0.250000
   SplashAimChanceHard=0.350000
   SplashAimChanceSuicidal=0.500000
   SplashAimChanceHellOnEarth=0.750000
   FireballFireIntervalNormal=5.000000
   FireballFireIntervalHard=4.500000
   FireballFireIntervalSuicidal=4.000000
   FireballFireIntervalHellOnEarth=3.500000
   FireOffset=(X=15.000000,Y=32.000000,Z=-12.000000)
   bCanTeleportCloser=False
   bUseDesiredRotationForMelee=False
   EvadeGrenadeChance=0.900000
   BaseShapeOfProjectileForCalc=(X=10.000000,Y=10.000000,Z=10.000000)
   Name="Default__KFAIController_ZedHusk"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
