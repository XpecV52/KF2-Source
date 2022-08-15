/*=============================================================================
	PhysXParticleSystem.uc: PhysX Emitter Source.
	Copyright 2007-2008 AGEIA Technologies.
=============================================================================*/

class PhysXParticleSystem extends Object
	native(Particle)
	hidecategories(Object);

enum ESimulationMethod
{
	ESM_SPH,
	ESM_NO_PARTICLE_INTERACTION,
	ESM_MIXED_MODE
};

enum EPacketSizeMultiplier
{
	EPSM_4,
	EPSM_8,
	EPSM_16,
	EPSM_32,
	EPSM_64,
	EPSM_128
};

//=============================================================================
//	PhysX SDK Parameters (Basic parameters for colliding particles) 
//=============================================================================

/** Maximum number of particles to simulate. */
var(Buffer) int MaxParticles<UIMin=1|UIMax=65535>;
/** Maximum number of particles that will be deleted per frame to make room for newly spawned particles if MaxParticles is reached. */
var(Buffer) int ParticleSpawnReserve<UIMin=0|UIMax=4096>;

/** Enum indicating what type of object this particle should be considered for rigid body collision. */
var(Collision)  const ERBCollisionChannel RBChannel; 
/** Types of objects that this particle will collide with. */ 
var(Collision)	const RBCollisionChannelContainer RBCollideWithChannels; 

/** Distance between particles and collision geometry maintained during simulation. */ 
var(Collision) float CollisionDistance;
/** "Bounciness" against static objects. */
var(Collision) float RestitutionWithStaticShapes<ClampMin=0.0|ClampMax=1.0>;
/** "Bounciness" against dynamic objects. */
var(Collision) float RestitutionWithDynamicShapes<ClampMin=0.0|ClampMax=1.0>;
/** Dynamic friction with static objects. */
var(Collision) float FrictionWithStaticShapes<ClampMin=0.0|ClampMax=1.0>;
/** Dynamic friction with dynamic objects. */
var(Collision) float FrictionWithDynamicShapes<ClampMin=0.0|ClampMax=1.0>;
/** Static friction with static objects. */
var(Collision) float StaticFrictionWithStaticShapes<ClampMin=0.0|UIMax=1.0>;
/** Static friction with dynamic objects. */
var(Collision) float StaticFrictionWithDynamicShapes<ClampMin=0.0|UIMax=1.0>;
/** Whether to collide with dynamic shapes. Disabling this option can improve performance. */
var(Collision) bool bDynamicCollision;
/** Distance fluid can travel in one simulation step. Decreasing this value can improve performance. */
var(Dynamics) float MaxMotionDistance;
/** Velocity damping coefficient. */
var(Dynamics) float Damping<ClampMin=0.0|UIMax=1.0>;
/** Acceleration applied to each particle. */
var(Dynamics) vector ExternalAcceleration;
/** Disable gravity. */
var(Dynamics) bool bDisableGravity;

//=============================================================================
//	More PhysX SDK Params. (SPH particles and parallelization settings, ect...) 
//=============================================================================
/** Whether to simulate PhysX particles on GPU. */
var(SdkExpert) bool bUseGPU;
/** Whether to collide with static shapes. Disabling this flag isn't recommended. */
var(SdkExpert) bool bStaticCollision;
/** Whether dynamic particle collision affects the shapes the particles collide with. */
var(SdkExpert) bool bTwoWayCollision;
/** Use SPH particles if you want particles to interact with each other. */
var(SdkExpert) ESimulationMethod SimulationMethod;
/** Packet size can influence collision performance. */
var(SdkExpert) EPacketSizeMultiplier PacketSizeMultiplier;
/** Particle mass = RestParticleDistance^3 * RestDensity. Also rest state for SPH fluid particles. */
var(SdkExpert) float RestParticleDistance;
/** Particle mass = RestParticleDistance^3 * RestDensity. Also target density for SPH fluid particles. */
var(SdkExpert) float RestDensity<ClampMin=0.0>;
/** Sphere of influence for SPH fluid particles. */
var(SdkExpert) float KernelRadiusMultiplier<UIMin=1.0|UIMax=3.0>;
/** Affects compressibility of SPH fluid particles. Low values are more compressible. Higher values could result in unstable simulation. */
var(SdkExpert) float Stiffness<ClampMin=0.0|UIMin=1.0|UIMax=200.0>;
/** Viscosity for SPH fluid particles. Higher values will result in honey-like behavior. */
var(SdkExpert) float Viscosity<ClampMin=0.0|UIMin=5.0|UIMax=300.0>;
/** Impulse transfer from particles to colliding dynamic shapes, if bTwoWayCollision has been set. */
var(SdkExpert) float CollisionResponseCoefficient<ClampMin=0.0|UIMax=1.0>;

//=============================================================================
//	Non-exposed state 
//=============================================================================

var transient bool bDestroy;
var transient bool bSyncFailed;
var transient bool bIsInGame;

var native pointer CascadeScene {class FRBPhysScene};
var native pointer PSys {class FPhysXParticleSystem};


//=============================================================================
//	TW: Modification for impact sounds - aladenberger
//=============================================================================
/** Whether this system should trigger collision impact effects */
var(KFImpactEvent) bool bProcessImpactEffects;

/** Minimum impact magnitude to trigger effects */
var(KFImpactEvent) float ImpactThreshold<EditCondition=bProcessImpactEffects>;

/** Default sound effect to play on collision */
var(KFImpactEvent) AkBaseSoundObject ImpactSound<DisplayName=Default Impact Sound | EditCondition=bProcessImpactEffects>;

struct native PhysXParticleImpactInfo
{
	/** Material type that has a impact sound override */
	var() EMaterialTypes MaterialType;
	/** Sound effect to play on collision */
	var() AkBaseSoundObject ImpactSound;
};

/** Override sounds for specific physical material types */
var(KFImpactEvent) array<PhysXParticleImpactInfo> MaterialImpactSounds<EditCondition=bProcessImpactEffects>;

/** Time (Seconds) between tracing for an updated physical material */
var transient float PhysMaterialFrequency;


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
   MaxParticles=32767
   RBChannel=RBCC_EffectPhysics
   SimulationMethod=ESM_NO_PARTICLE_INTERACTION
   PacketSizeMultiplier=EPSM_16
   RBCollideWithChannels=(Default=True,GameplayPhysics=True,FluidDrain=True)
   CollisionDistance=10.000000
   RestitutionWithStaticShapes=0.500000
   RestitutionWithDynamicShapes=0.500000
   FrictionWithStaticShapes=0.050000
   FrictionWithDynamicShapes=0.500000
   bDynamicCollision=True
   bStaticCollision=True
   MaxMotionDistance=64.000000
   RestParticleDistance=4.500000
   RestDensity=1000.000000
   KernelRadiusMultiplier=2.000000
   Stiffness=20.000000
   Viscosity=6.000000
   CollisionResponseCoefficient=0.200000
   ImpactThreshold=0.500000
   Name="Default__PhysXParticleSystem"
   ObjectArchetype=Object'Core.Default__Object'
}
