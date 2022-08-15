/*=============================================================================
	ApexDestructibleActor.uc: PhysX APEX integration. Destructible Actor
	Copyright 2008-2009 NVIDIA Corporation.
=============================================================================*/

/*** This class defines a single instance of a destructible asset */
class ApexDestructibleActor extends Actor
	dependson(ApexDestructibleAsset)
	dependson(LightComponent)
	native(Mesh)
	placeable
	config(Engine);


/** Expose LightEnvironment to the user */
var() DynamicLightEnvironmentComponent LightEnvironment;

/** If set, use this actor's fracture materials instead of the asset's fracture materials. */
var() bool														bFractureMaterialOverride;

/** Fracture effects for each fracture level. Used only if Fracture Material Override is set. */
var() const editfixedsize	array<FractureMaterial>				FractureMaterials;

/** If checked, only a single effect from FractureMaterials is played within the bounding box of all fractured chunks.  The effect chosen will be the one corresponding to the destructible's SupportDepth. */
var() const bool												bPlaySingleFractureMaterialEffect;

/** The destructible static component. */
var() const editconst ApexStaticDestructibleComponent			StaticDestructibleComponent;

/** LOD setting.  LOD < 0 enables automatic LOD.  LOD >= 0 forces an LOD setting. */
var() const int													LOD;

/** Defines an array that designates which of the destructible chunks are visible */
var init array<byte>								VisibilityFactors;

/** Cached sounds for fractures. */
var transient    array<SoundCue>                FractureSounds;
/** Cached particle effects for fractures. */
var transient    array<ParticleSystem>          FractureParticleEffects;


event SpawnFractureEmitter(ParticleSystem EmitterTemplate, vector SpawnLocation, vector SpawnDirection)
{
	local ParticleSystemComponent PSC;
	local LightingChannelContainer Lights;
	PSC = WorldInfo.MyEmitterPool.SpawnEmitter( EmitterTemplate, SpawnLocation, rotator(SpawnDirection) );
	Lights = PSC.LightingChannels;
	// TODO: Modify Lights here according to FractureMaterial
	Lights.Dynamic = TRUE;
	Lights.bInitialized = TRUE;
	PSC.SetLightingChannels(Lights);
}

/** Initialize FractureSounds and FractureParticleEffects */
native function CacheFractureEffects();

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	CacheFractureEffects();
}

/** Declares the TakeDamage script function */
simulated native function TakeDamage
(
	int						Damage,				/* The amount of Damage to apply */
	Controller				EventInstigator,    /* The instigator of this event */
	vector					HitLocation,		/* The location where the impact occured */
	vector					Momentum,			/* The momentum of the impact */
	class<DamageType>		DamageType,			/* The type of damage to apply */
	optional TraceHitInfo	HitInfo,			/* The detailed hit information for this damage event */
	optional Actor			DamageCauser		/* The actor which caused the damage */
);

/** Declares the radius damage script function */
simulated native function TakeRadiusDamage
(
	Controller			InstigatedBy,		/* The instigator for this radius damage */
	float				BaseDamage,			/* The base damage amount */
	float				DamageRadius,		/* The radius of the damage */
	class<DamageType>	DamageType,			/* The type of damage to apply */
	float				Momentum,			/* The momentum of the damage */
	vector				HurtOrigin,			/* The origin of the damage */
	bool				bFullDamage,		/* Whether or not to apply full damage or attenuated damage */
	Actor				DamageCauser,		/* The actor which caused the damage */
	optional float      DamageFalloffExponent=1.f
);
function OnSetMaterial(SeqAct_SetMaterial Action)
{
	StaticDestructibleComponent.SetMaterial( Action.MaterialIndex, Action.NewMaterial );
}
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=LightEnvironment0
      Name="LightEnvironment0"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   LightEnvironment=LightEnvironment0
   Begin Object Class=ApexStaticDestructibleComponent Name=DestructibleComponent0
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__ApexDestructibleActor:LightEnvironment0'
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      Name="DestructibleComponent0"
      ObjectArchetype=ApexStaticDestructibleComponent'Engine.Default__ApexStaticDestructibleComponent'
   End Object
   StaticDestructibleComponent=DestructibleComponent0
   LOD=-1
   Components(0)=LightEnvironment0
   Components(1)=DestructibleComponent0
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   bRouteBeginPlayEvenIfStatic=False
   bGameRelevant=True
   bCanBeDamaged=True
   bCollideActors=True
   bBlockActors=True
   bProjTarget=True
   bNoEncroachCheck=True
   bEdShouldSnap=True
   CollisionComponent=DestructibleComponent0
   Name="Default__ApexDestructibleActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
