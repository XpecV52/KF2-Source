//=============================================================================
// KFEmit_DirectionalPath
//=============================================================================
// Directional emitter
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//============================================================================

class KFEmit_DirectionalPath extends Emitter;

/** The Template to use for this emitter */
var() ParticleSystem EmitterTemplate;

/** path points to travel to */
var vector DestinationFinal;
var vector DestinationMidPoint;
var vector DestinationCurrent;

/** limit to destroy the partcile */
var float LimitDistanceCurrent;
var float LimitDistanceCurrentPowed;
var float LimitDistanceDestinationFinal;
var float LimitDistanceDestinationMidPoint;

/** rate to changed dir on curves */
var float CurveTurnRateCurrent;
var float CurveTurnRateUntilDestinationFinal;
var float CurveTurnRateUntilDestinationMidPoint;

var float RateTickCheckHasReached;

var vector LastDir;
var vector NewDir;
var bool IsEnabled;

/*********************************************************************************************
* Acceleration physics
 ********************************************************************************************* */

/** Acceleration magnitude */
var() float ParticleSpeed;

var float HalfAngleSpawnCone;

var transient bool bInitialized;

var transient bool bReachDestinationFinal;
var transient bool bReachDestinationMidPoint;
var transient float TickCheckHasReachedTime;

simulated function PostBeginPlay()
{
	//LifeSpan = 3.0;
	TickCheckHasReachedTime = RateTickCheckHasReached;
	Super.PostBeginPlay();
}

/** Override the final waypoint (optional) */
simulated function SetDestination( 	vector NewDestinationFinal,
									vector NewDestinationMidPoint,
									float NewLimitDistanceDestinationFinal,
									float NewLimitDistanceDestinationMidPoint,
									float NewCurveTurnRateUntilDestinationFinal,
									float NewCurveTurnRateUntilDestinationMidPoint,
									float NewHalfAngleSpawnCone)
{
	DestinationFinal = NewDestinationFinal;
	DestinationMidPoint = NewDestinationMidPoint;

	LimitDistanceDestinationFinal = NewLimitDistanceDestinationFinal;
	LimitDistanceDestinationMidPoint = NewLimitDistanceDestinationMidPoint;

	CurveTurnRateUntilDestinationFinal = NewCurveTurnRateUntilDestinationFinal;
	CurveTurnRateUntilDestinationMidPoint = NewCurveTurnRateUntilDestinationMidPoint;

	bReachDestinationFinal = false;
	bReachDestinationMidPoint = false;
	HalfAngleSpawnCone = NewHalfAngleSpawnCone;

	DestinationCurrent = DestinationMidPoint;
	LimitDistanceCurrent = LimitDistanceDestinationMidPoint;
	LimitDistanceCurrentPowed = LimitDistanceCurrent * LimitDistanceCurrent;
	CurveTurnRateCurrent = CurveTurnRateUntilDestinationMidPoint;

	Velocity = VRandCone(Normal(DestinationCurrent - Location), HalfAngleSpawnCone) * ParticleSpeed;
	LastDir = Normal(Velocity);
	SetRotation(rotator(Normal(Velocity)));
	SetPhysics(PHYS_Projectile);

	//OriginalDistanceToDestination = VSize(Destination - Location);

	bInitialized = true;
}

simulated function UpdateDestination( vector NewDestinationFinal, optional vector NewDestinationMidPoint )
{
	DestinationFinal = NewDestinationFinal;
	DestinationMidPoint = NewDestinationMidPoint;

	DestinationCurrent = DestinationFinal;
	if (!bReachDestinationMidPoint)
	{
		DestinationCurrent = DestinationMidPoint;
	}
}

simulated event SetTemplate(ParticleSystem NewTemplate, optional bool bDestroyOnFinish)
{
	Super(Emitter).SetTemplate(NewTemplate, bDestroyOnFinish);
}

simulated function bool HasReachedDestinationFinal()
{
	Local bool bCloseEnough;
	bCloseEnough = VSizeSq(Location - DestinationFinal) <= LimitDistanceCurrentPowed ;
	return bCloseEnough;
}

simulated function bool HasReachedDestinationMidPoint()
{
	Local bool bCloseEnough;
	bCloseEnough = VSizeSq(Location - DestinationMidPoint) <= LimitDistanceCurrentPowed ;
	return bCloseEnough;
}

	
simulated function Tick(float DeltaTime)
{
	if ( !bInitialized || IsEnabled == false )
	{
		return;
	}

	TickCheckHasReachedTime -= DeltaTime;
	if (TickCheckHasReachedTime <= 0)
	{
		TickCheckHasReachedTime = RateTickCheckHasReached;
		
		if (bReachDestinationMidPoint)
		{
			if (bReachDestinationFinal)
			{
				SetLocation(DestinationFinal);
				return;
			}
			if( HasReachedDestinationFinal() )
			{
				bReachDestinationFinal = true;
				SetLocation(DestinationFinal);
				return;
			}
		}
		else
		{
			if( HasReachedDestinationMidPoint() )
			{
				bReachDestinationMidPoint = true;
				DestinationCurrent = DestinationFinal;
				LimitDistanceCurrent = LimitDistanceDestinationFinal;
				LimitDistanceCurrentPowed = LimitDistanceCurrent * LimitDistanceCurrent;
				CurveTurnRateCurrent = CurveTurnRateUntilDestinationFinal;
			}
		}
	}

	



	//Acceleration = CurveTurnRate * DeltaTime * ACCEL_RATE * Normal(Destination - Location);
	//Velocity = Velocity + Acceleration; // force double acceleration
	NewDir = Normal(DestinationCurrent - Location);
	SetRotation(rotator(LastDir + CurveTurnRateCurrent * NewDir));
	Velocity = vector(Rotation) * ParticleSpeed;
	//SetRotation(rotator(Normal(Velocity)));
	LastDir = vector(Rotation);
	//Velocity = vector(Rotation) * ParticleSpeed;

	//DrawDebugSphere(Location, 12, 12, 255, 0, 0, false);
}

simulated function DeactivateEmitter()
{
	ParticleSystemComponent.DeactivateSystem();
	IsEnabled = false;
	bReachDestinationFinal = false;
	bReachDestinationMidPoint = false;
	SetTickIsDisabled(true);
	SetHidden(true);
}

simulated function ActivateEmitter()
{
	ParticleSystemComponent.ActivateSystem();
	IsEnabled = true;
	bInitialized = true;
	SetTickIsDisabled(false);
	SetHidden(false);
}

simulated function OnParticleSystemFinished(ParticleSystemComponent FinishedComponent)
{
	return;
}

defaultproperties
{
   LimitDistanceDestinationFinal=5.000000
   LimitDistanceDestinationMidPoint=16.000000
   CurveTurnRateUntilDestinationFinal=0.400000
   CurveTurnRateUntilDestinationMidPoint=4.000000
   RateTickCheckHasReached=0.050000
   ParticleSpeed=600.000000
   HalfAngleSpawnCone=60.000000
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Emitter:Sprite'
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      SpriteCategoryName="Effects"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Emitter:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=ParticleSystemComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__Emitter:ArrowComponent0'
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      SpriteCategoryName="Effects"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__Emitter:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   bNoDelete=False
   Name="Default__KFEmit_DirectionalPath"
   ObjectArchetype=Emitter'Engine.Default__Emitter'
}
