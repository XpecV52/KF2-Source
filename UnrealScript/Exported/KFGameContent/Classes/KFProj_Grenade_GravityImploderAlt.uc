//=============================================================================
// KFProj_Grenade_GravityImploderAlt
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFProj_Grenade_GravityImploderAlt extends KFProj_BallisticExplosive
	hidedropdown;

/** Factor added to the rolling speed of the ball when bouncing **/
var(Projectile) float RollingFactor;

/** Indicates that the ball hit the wall and is doing rolling animations **/
var transient bool bIsRolling;

/** Amount of roll stored for this cannonball **/
var transient float CurrentRoll;

var bool bHasAlreadyBounced;

/** Collider **/
var Object Collider;
/** Time before starting the implosion effect **/
var float PreparationTime;

/** Vortex params. */
var float VortexDuration;
var float VortexTime;
var float VortexRadius;
var float VortexAbsorptionStrength;
var float VortexElevationStrength;
var bool  bVortexReduceImpulseOnDist;

var protected transient bool bFirstAbsorption;
var protected transient vector VortexLocation;

var protected vector				VortexNormal;
var protected KFImpactEffectInfo	VortexImpactEffects;

simulated state PreparingState
{
	simulated function BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);
		SetTimer( PreparationTime, false, nameOf(Timer_Ready) );
	}

	simulated event Tick(float DeltaTime)
	{
		local vector RollDelta;
		local rotator NewRotation;

		// Let's roll (only in the client)
		if ( bIsRolling && WorldInfo.NetMode != NM_DedicatedServer && Physics != PHYS_None && (Velocity.X != 0 || Velocity.Y != 0) )
		{
			CurrentRoll -= (Abs(Velocity.X) + Abs(Velocity.Y)) * DeltaTime * RollingFactor; 
			RollDelta = ((vect(1, 0 , 0) * (Velocity.X)) + (vect(0, 1, 0) * (Velocity.Y) ));
			NewRotation = Rotator(RollDelta);
			NewRotation.pitch += CurrentRoll;
			SetRotation(NewRotation);
		}

		Super.Tick(DeltaTime);
	}

	simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
	{
		VortexNormal = HitNormal;

		ProcessRebound(HitNormal, Wall, WallComp);

		if( !bDud && !bIsTimedExplosive )
		{
			Super.HitWall(HitNormal, Wall, WallComp);
		}
	}

	simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
	{
		local bool bWantsClientSideDudHit;
		local float TraveledDistance;
		local Vector VNorm;
		//local int Index;

		// If we collided with a Siren shield, let the shield code handle touches
		if( Other.IsA('KFTrigger_SirenProjectileShield') )
		{
			return;
		}

		if ( !bCollideWithTeammates && Pawn(Other) != None )
		{
			// Don't hit teammates
			if( Other.GetTeamNum() == GetTeamNum() )
			{
				return;
			}
		}

		// Need to do client side dud hits if this is a client
		if( Instigator != none && Instigator.Role < ROLE_Authority )
		{
			bWantsClientSideDudHit = true;
		}

		TraveledDistance = ((WorldInfo.TimeSeconds - CreationTime) * Speed);
		TraveledDistance *= TraveledDistance;

		if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) && ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)))
		{
			// Don't touch the same actor multiple time's immediately after just
			// touching it if the TouchTimeThreshhold is set to greater than 0.
			// This was causing projectiles just to "stop" sometimes when hitting
			// dead/ragdolled pawns because it was counting as multiple penetrations
			if( LastTouched.Actor == Other && TouchTimeThreshhold > 0
				&& (WorldInfo.TimeSeconds - LastTouched.Time) <= TouchTimeThreshhold )
			{
				return;
			}

			//TODO: Add an impact sound here
			SetIsDud(bWantsClientSideDudHit, HitNormal);

			if (Other != Instigator && !Other.bStatic && Other.GetTeamNum() != GetTeamNum() && !CheckRepeatingTouch(Other))
			{
				ProcessBulletTouch(Other, HitLocation, HitNormal);
			}
			// Reflect off Wall w/damping but allow penetration if the pawn is dead
			//if(KFPawn_Monster(Other) == None || KFPawn_Monster(Other).Health > 0)
			//{
				VNorm = (Velocity dot HitNormal) * HitNormal;
				Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
				Speed = VSize(Velocity);
			//}
		}
		else if (!bDud && !bIsTimedExplosive)
		{
			// Process impact hits
			if (Other != Instigator && !Other.bStatic)
			{
				// check/ignore repeat touch events
				if( !CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
				{
					ProcessBulletTouch(Other, HitLocation, HitNormal);
				}
			}

			if( WorldInfo.NetMode == NM_Standalone ||
				(WorldInfo.NetMode == NM_ListenServer && Instigator != none && Instigator.IsLocallyControlled()) )
			{
				Super.ProcessTouch( Other, HitLocation, HitNormal );
				return;
			}

			if( Owner != none && KFWeapon( Owner ) != none && Instigator != none )
			{
				if( Instigator.Role < ROLE_Authority && Instigator.IsLocallyControlled() )
				{
					KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
					Super.ProcessTouch( Other, HitLocation, HitNormal );
					return;
				}
			}
		}
	}
} 

simulated state WaitingToImplode
{
	simulated function BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);
	}

	simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
	{
		if (HitNormal Dot vect(0,0,1) > 0.5f)
		{
			GotoState('ImplodingState');
			return;
		}
		
		ProcessRebound(HitNormal, Wall, WallComp);
		if(!bDud && !bIsTimedExplosive)
		{
			Super.HitWall(HitNormal, Wall, WallComp);
		}
	}

	simulated function Tick(float Delta)
	{
		if (vSize(Velocity) < 0.05f)
		{
			GotoState('ImplodingState');
			return;
		}

		super.Tick(Delta);
	}

	simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
	{
		// Prevent default funcionality;
		super.ProcessTouch(Other, HitLocation, HitNormal);
	}
}

simulated state ImplodingState
{
	simulated function BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);

		StopSimulating();

		AdjustVortexForPerk();
		if ( WorldInfo.NetMode != NM_Client )
		{
			Velocity=vect(0,0,0);
			Acceleration=vect(0,0,0);
			RotationRate=rot(0,0,0);
			GravityScale=0.0;
			
			bFirstAbsorption=true;
			VortexTime=0.0f;

			SetTimer(VortexDuration, false, nameOf(Detonation_Ready) );
		}

		VortexLocation = Location + vect(0,0,1) * 125;

		// Start VGC
		StartVortexVFX();
	}

	simulated function StartVortexVFX()
	{
		if(VortexImpactEffects != None)
		{
			if(VortexImpactEffects.DefaultImpactEffect.ParticleTemplate != None)
			{
				WorldInfo.MyEmitterPool.SpawnEmitter(VortexImpactEffects.DefaultImpactEffect.ParticleTemplate, VortexLocation, rotator(VortexNormal));
			}
			if(VortexImpactEffects.DefaultImpactEffect.Sound != None)
			{
				PlaySoundBase(VortexImpactEffects.DefaultImpactEffect.Sound, true,,, VortexLocation);
			}
		}
	}	

	simulated function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);
	}

	simulated event Tick(float DeltaTime)
	{
		Super.Tick(DeltaTime);

		// Avoids to be moved in case there's any force applied.
		SetLocation(VortexLocation);









		if (WorldInfo.NetMode < NM_Client)
		{
			VortexTime += DeltaTime;
			AbsorbEnemies();
			bFirstAbsorption=false;
		}
	}

	function AdjustVortexForPerk()
	{
		local KFPlayerController KFPC;
		local KFPerk Perk;

		KFPC = KFPlayerController(InstigatorController);
		if( KFPC != none )
		{
			Perk = KFPC.GetPerk();
			if(Perk != none)
			{
				VortexRadius = default.VortexRadius * Perk.GetAoERadiusModifier();
			}
		}
	}

	simulated function AbsorbEnemies()
	{
		local Actor          Victim;
		local TraceHitInfo   HitInfo;
		local KFPawn         KFP;
		local KFPawn_Monster KFPM;
		local float		     ColRadius, ColHeight;
		local float		     Dist;
		local vector	     Dir;
		local vector         Momentum;
		local float          MomentumModifier;

		foreach CollidingActors(class'Actor', Victim, VortexRadius, VortexLocation, true,, HitInfo)
		{
			KFP  = KFPawn(Victim);
			KFPM = KFPawn_Monster(Victim);

			if (Victim != Self
				&& (!Victim.bWorldGeometry || Victim.bCanBeDamaged)
				&& (NavigationPoint(Victim) == None)
				&& Victim != Instigator
				&& KFP != None 
				&& KFPawn_Human(Victim) == none // No player's character
				&& (KFPM == none || VortexTime < VortexDuration*KFPM.GetVortexAttractionModifier()) )
			{
				KFP.GetBoundingCylinder(ColRadius, ColHeight);

				if (bFirstAbsorption)
				{
					Dir      = vect(0,0,1);
					Momentum = Dir * VortexElevationStrength;
				}
				else
				{
					Dir              = Normal(VortexLocation - KFP.Location);
					Dist             = FMax(vSize(Dir) - ColRadius, 0.f);
					MomentumModifier = bVortexReduceImpulseOnDist ? (1.0f - Dist / VortexRadius) : 1.0f;
					Momentum         = Dir * VortexAbsorptionStrength * MomentumModifier + vect(0,0,1) * (Dist/VortexRadius) * VortexAbsorptionStrength;
				}

				if(KFPM != none)
				{
					Momentum *= KFPM.GetVortexAttractionModifier();
				}

				KFP.AddVelocity( Momentum, KFP.Location - 0.5 * (ColHeight + ColRadius) * Dir, class 'KFDT_Explosive_GravityImploder');
			}
		}
	}
}

simulated state DetonatingState
{
	simulated function BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);
		Detonate();
	}
}


simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	GotoState('PreparingState');
}

simulated function Timer_Ready()
{
	// GotoState('ImplodingState');
	GotoState('WaitingToImplode');
}

simulated function Detonation_Ready()
{
	GotoState('DetonatingState');
}

simulated function Detonate()
{
	local vector ExplosionNormal, vExplosionOffset;

	// Check if the bomb should explode right now
	if (!bHasExploded && !bHasDisintegrated)
	{
		ExplosionNormal =  vect(0,0,1) >> Rotation;
		vExplosionOffset.x = 0;
		vExplosionOffset.y = 0;
		vExplosionOffset.z = 10;
		SetLocation(VortexLocation + vExplosionOffset);
		CallExplode(VortexLocation, ExplosionNormal);
	}
	// If not, mark the bomb to explode as soon as it hits something
	else
	{
		bIsTimedExplosive = false;
		bNetDirty = true;
	}
}

simulated function SetIsDud(bool bWantsClientSideDudHit, vector HitNormal)
{
	// This projectile doesn't dud.
}

simulated protected function StopSimulating()
{
	Velocity = vect(0,0,0);
	Acceleration = vect(0,0,0);
	RotationRate = rot(0,0,0);
	SetCollision(FALSE, FALSE);

	StopFlightEffects();

	bRotationFollowsVelocity = FALSE;
}

simulated function ProcessRebound(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	local Vector VNorm;
	local rotator NewRotation;
	local Vector Offset;
	local bool bWantsClientSideDudHit;
	local TraceHitInfo HitInfo;
	local float TraveledDistance;

	bIsRolling = true;

	// Need to do client side dud hits if this is a client
	if( Instigator != none && Instigator.Role < ROLE_Authority )
	{
		bWantsClientSideDudHit = true;
	}

	TraveledDistance = ((WorldInfo.TimeSeconds - CreationTime) * Speed);
	TraveledDistance *= TraveledDistance;

	// Bounce off the wall and cause the shell to dud if we hit too close
	if( bDud || ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive || (OriginalLocation == vect(0,0,0) && ArmDistSquared > 0)))
	{
		// Reflect off Wall w/damping
		VNorm = (Velocity dot HitNormal) * HitNormal;
		Velocity = -VNorm * WallHitDampenFactor + (Velocity - VNorm) * WallHitDampenFactorParallel;
		Speed = VSize(Velocity);

		if( (!bDud || ( bWantsClientSideDudHit && !bClientDudHit)) )
		{
			SetIsDud(bWantsClientSideDudHit, HitNormal);
		}

		if ( WorldInfo.NetMode != NM_DedicatedServer && Pawn(Wall) == none && bHasAlreadyBounced == false )
		{
			// do the impact effects
			bHasAlreadyBounced = true;
			KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, HitNormal, GrenadeBounceEffectInfo, true );
		}

		// if we hit a pawn or we are moving too slowly stop moving and lay down flat
		if ( Speed < MinSpeedBeforeStop  )
		{
			ImpactedActor = Wall;
			SetPhysics(PHYS_None);
			if( ProjEffects != none )
			{
				ProjEffects.SetTranslation(LandedTranslationOffset);
			}

			// Position the shell on the ground
			RotationRate.Yaw = 0;
			RotationRate.Pitch = 0;
			RotationRate.Roll = 0;
			NewRotation = Rotation;
			NewRotation.Pitch = 0;
			if(ResetRotationOnStop)
			{
				SetRotation(NewRotation);
			}
			Offset.Z = LandedTranslationOffset.X;
			SetLocation(Location + Offset);
		}

		if( !Wall.bStatic && Wall.bCanBeDamaged && (DamageRadius == 0 || bDamageDestructiblesOnTouch) && !CheckRepeatingTouch(Wall) )
		{
			HitInfo.HitComponent = WallComp;
			HitInfo.Item = INDEX_None;
			Wall.TakeDamage( Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
		}
	}
}

defaultproperties
{
   RollingFactor=1100.000000
   PreparationTime=0.800000
   VortexDuration=0.500000
   VortexRadius=500.000000
   VortexAbsorptionStrength=120.000000
   VortexElevationStrength=700.000000
   VortexImpactEffects=KFImpactEffectInfo'WEP_Gravity_Imploder_ARCH.Blue_Attract'
   bIsTimedExplosive=True
   ResetRotationOnStop=False
   GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
   DampenFactor=0.100000
   DampenFactorParallel=0.000000
   WallHitDampenFactor=0.400000
   WallHitDampenFactorParallel=0.400000
   MinSpeedBeforeStop=5.000000
   bWarnAIWhenFired=True
   TouchTimeThreshhold=60.000000
   TerminalVelocity=3200.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Gravity_Imploder_ARCH.Blue_Explosion'
      Damage=1.000000
      DamageRadius=450.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_GravityImploderWave'
      KnockDownStrength=150.000000
      MomentumTransferScale=10000.000000
      ExplosionSound=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Grenade_Blue_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Grenade_GravityImploderAlt:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Grenade_GravityImploderAlt:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_Gravity_Imploder_ARCH.Blue_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_Gravity_Imploder_EMIT.FX_Blue_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Gravity_Imploder_EMIT.FX_Blue_Projectile_ZEDTIME'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=3200.000000
   MaxSpeed=3200.000000
   MomentumTransfer=100000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bUpdateSimulatedPosition=True
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Grenade_GravityImploderAlt"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
