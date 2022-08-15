//=============================================================================
// KFProj_Missile_Patriarch
//=============================================================================
// High explosive missile fired from Patriarch weapons platform.
// Based on flocking code from UT3
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFProj_Missile_Patriarch extends KFProjectile
	hidedropdown;

/** Used for the curling missile effect */
var KFProj_Missile_Patriarch Flock[2];

var float InitialSpeed;

var float FlockRadius;
var float FlockStiffness;
var float FlockMaxForce;
var float FlockCurlForce;

var repnotify byte bCurl;
var float VelocityScale;

var vector Dir;

/** Applies wobble to the missile, making it seem erratic. Simulates real liquid state thrusters */
var bool bWobble;
var float WobbleForce;

/** How long to wait after spawning before starting to seek */
var float SeekDelay;

/** How strong a force should be applied to the missile when seeking */
var float SeekForce;

/** Gravity application */
var float GravForce;
var float DistToApplyGravitySQ;

/** Target impact location for seeking */
var vector TargetImpactLoc;

/** Flight light */
var PointLightComponent FlightLight;

replication
{
	if ( bNetInitial && (Role == ROLE_Authority) )
		bCurl, FlockCurlForce, VelocityScale, TargetImpactLoc,
		SeekDelay, SeekForce, GravForce, DistToApplyGravitySQ, InitialSpeed;
}

simulated protected function PrepareExplosionTemplate()
{
	super.PrepareExplosionTemplate();
	
	/** Since bIgnoreInstigator is transient, its value must be defined here */
	ExplosionTemplate.bIgnoreInstigator = true;
}

function InitEx( vector AimDir, float CurlForceMultiplier, vector TargetLoc, float InitialMissileSpeed,
				float NewSeekDelay, float NewSeekForce, float NewGravForce, float NewDistToApplyGravitySQ )
{
	Init( AimDir );

	// Our base speed
	InitialSpeed = InitialMissileSpeed;
	Speed = InitialSpeed;

	// Do some randomization for an even cooler effect
	FlockCurlForce = (default.FlockCurlForce * (0.95f + (fRand()*0.1f))) * CurlForceMultiplier;
	VelocityScale = 0.95f + (fRand()*0.1f);

	// Our impact target location
	TargetImpactLoc = TargetLoc;

	// Set our seek delay
	SeekDelay = NewSeekDelay;

	// Set our seek force
	SeekForce = NewSeekForce;

	// Set our gravity force
	GravForce = NewGravForce;

	// Set our distance before we apply gravity
	DistToApplyGravitySQ = NewDistToApplyGravitySQ;
}

simulated function StartCurlTimer()
{
	SetTimer( 0.06f, true, nameOf(CurlTimer) );
}

simulated event ReplicatedEvent(name VarName)
{
	local KFProj_Missile_Patriarch R;
	local int i;

	if( VarName == 'bCurl' )
	{
		StartCurlTimer();

		// look for other missiles
		if( bCurl < 3 && Flock[1] == None )
		{
			foreach DynamicActors( class'KFProj_Missile_Patriarch', R )
			{
				if( R.Instigator == Instigator )
				{
					Flock[i] = R;
					if ( R.Flock[0] == None )
					{
						R.Flock[0] = self;
					}
					else if ( R.Flock[0] != self )
					{
						R.Flock[1] = self;
					}

					i++;
					if ( i == 2 )
					{
						break;
					}
				}
			}
		}
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( FlightLight != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		FlightLight.Radius = 120.f + FlightLight.default.Radius * Abs( Cos(WorldInfo.TimeSeconds * (DeltaTime * 800.f)) );
	}

	// Finalize rotation
	SetRotation( rotator(Velocity) );	
}

simulated function CurlTimer()
{
	local vector TargetVec, SeekDir, X,Y,Z;

	// Initialize Dir, if necessary
	if( SeekForce > 0.f )
	{
		if( bCurl == 3 || IsZero(Dir) )
		{
			Dir = Normal(Velocity);
		}

		if( bCurl < 3 )
		{
			Velocity = (InitialSpeed * Normal(Dir * 0.5 * InitialSpeed + Velocity)) * VelocityScale;
		}

		TargetVec = TargetImpactLoc - Location;

		// Add seeking
		if( (WorldInfo.TimeSeconds - CreationTime) >= SeekDelay )
		{
			SeekDir = Normal(TargetVec);
			if( GravForce > 0.f )
			{
				SeekDir.Z = 0.f;
			}

			Velocity += SeekDir * SeekForce;

			// Apply pseudo-gravity
			if( GravForce > 0.f && TargetVec.Z < Location.Z )
			{
				TargetVec.Z = 0.f;
				if( VSizeSQ(TargetVec) <= DistToApplyGravitySQ )
				{
					Velocity += vect(0,0,-1) * GravForce;
				}
				else
				{
					Velocity += vect(0,0,-1) * GravForce * 0.1f;
				}
			}
		}

		if( bCurl < 3 )
		{
			DoFlocking();
		}

		// Update our rotation before adding wobble
		SetRotation( rotator(Velocity) );
	}

	// Add some crazy wobble
	GetAxes( Rotation, X,Y,Z );
	Velocity += (bWobble ? Z * WobbleForce : -Z * WobbleForce)
				+ (bWobble ? Y * WobbleForce : -Y * WobbleForce);

	bWobble = !bWobble;
}

simulated function DoFlocking()
{
	local int i;
	local vector ForceDir, CurlDir;
	local float ForceMag;

	// Curl missiles around each other
	for( i = 0; i < 2; i++ )
	{
		if( Flock[i] == None )
			continue;

		// Attract if distance between missiles is over 2*FlockRadius, repulse if below.
		ForceDir = Flock[i].Location - Location;
		ForceMag = FlockStiffness * ( (2 * FlockRadius) - VSize(ForceDir) );
		Acceleration = Normal(ForceDir) * Min(ForceMag, FlockMaxForce*VelocityScale);

		// Vector 'curl'
		CurlDir = Flock[i].Velocity Cross ForceDir;
		if( bCurl == Flock[i].bCurl )
			Acceleration += Normal(CurlDir) * FlockCurlForce;
		else
			Acceleration -= Normal(CurlDir) * FlockCurlForce;
	}
}

/** Overloaded to apply direct damage on hit */
simulated function bool TraceProjHitZones(Pawn P, vector EndTrace, vector StartTrace, out array<ImpactInfo> out_Hits)
{
	if( P != none )
	{
		P.TakeDamage( Damage, InstigatorController, StartTrace, MomentumTransfer * Normal(Velocity), MyDamageType,, self );
		return true;
	}

	return false;
}

/** Stops projectile simulation without destroying it.  Projectile is resting, essentially. */
simulated protected function StopSimulating()
{
	super.StopSimulating();

	FlightLight.SetEnabled( false );
	DetachComponent( FlightLight );
	FlightLight = none;
}

simulated function Destroyed()
{
	ClearTimer( nameOf(CurlTimer) );

	super.Destroyed();
}

defaultproperties
{
   FlockRadius=10.000000
   FlockStiffness=-20.000000
   FlockMaxForce=700.000000
   FlockCurlForce=3600.000000
   WobbleForce=120.000000
   SeekForce=10.000000
   Begin Object Class=PointLightComponent Name=FlightPointLight
      Radius=120.000000
      FalloffExponent=10.000000
      Brightness=1.500000
      LightColor=(B=150,G=205,R=255,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      Name="FlightPointLight"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   FlightLight=FlightPointLight
   bAutoStartAmbientSound=True
   bStopAmbientSoundOnExplode=True
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Patriarch_ARCH.Missile_Explosion'
      Damage=70.000000
      DamageRadius=650.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_PatMissile'
      ExplosionSound=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=700.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Missile_Patriarch:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_Rocket_Projectile'
   AmbientSoundPlayEvent=AkEvent'WW_ZED_Patriarch.Play_Mini_Rocket_Trail_1'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=2000.000000
   MaxSpeed=2000.000000
   Damage=200.000000
   MomentumTransfer=1000.000000
   MyDamageType=Class'kfgamecontent.KFDT_Explosive_PatMissile'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=FlightPointLight
   Components(2)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=50000)
   Name="Default__KFProj_Missile_Patriarch"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
