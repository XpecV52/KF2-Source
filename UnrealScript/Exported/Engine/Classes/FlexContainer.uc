/*=============================================================================
	FlexContainer.uc: PhysX Emitter Source.
	Copyright 2007-2008 AGEIA Technologies.
=============================================================================*/

class FlexContainer extends Object
	native(Physics)
	hidecategories(Object);


//=============================================================================
//	Flex Container Parameters
//=============================================================================

enum RelaxationMode
{
	/** The relaxation factor is a fixed multiplier on each constraint's position delta. */
	RelaxationMode_Global,
	/** The relaxation factor is a fixed multiplier on each constraint's delta divided by the particle's constraint count, convergence will be slower but more reliable. */
	RelaxationMode_Local,
};

struct native ParticleInfo
{
	/** The maximum number of particles in this solver. */
	var() int  MaxParticles;
	/** The percent of MaxParticles for flex mesh particles, the left is for flex fluid particles. */
	var() float MeshParticlesBudget <ClampMin=0.0 | ClampMax=1.0>;
};

	/** The radius of particles in this container. */
	var(Flex) float Radius;

	/** The number of particle settings at the different PhysXLevel */
	var(Flex) array<ParticleInfo> MaxParticlesAtPhysXLevel;

	/** Enable debug drawing for this container */
	var(Flex) bool bDebugDrawPoints;

	/** Percentage of radius spheres to be drawn in this container */
	var(Flex) float DebugDrawSpheres <ClampMin=0.0 | ClampMax=1.0>;
	
	/** Number of solver iterations to perform per-substep */
    var(Simulation) int  NumIterations;

	/** Number of sub-steps to take, each sub-step will perform NumIterations constraint iterations. Increasing sub-steps is generally more expensive than taking more solver iterations, but can be more effective at increasing stability. */
    var(Simulation) int  NumSubsteps;

	/** Controls the minimum frame-rate that Flex will attempt to sub-step, any time-steps from the game are clamped to this minimum.
	 *  Setting this lower will result in more sub-steps being taken so it should be set as high as possible, (although the simulation 
	 *  will appear to run slower than real-time if the game cannot maintain this frame rate).
	 */
	var (Simulation) int MinFrameRate;

	/**
	 * If true then each sub-step uses a fixed timestep = 1/(NumSubsteps*60) seconds and will take multiple sub-steps if necessary. 
	 *  If this value is false then each substep will use the variable game's dt/NumSubsteps and will take NumSubsteps steps. 
	 *  It is highly recommended to leave FixedTimeStep enabled for improved behaviour and stability. 
	 */
    var(Simulation) bool bFixedTimeStep;

	/** Constant acceleration applied to all particles */
    var(Simulation) vector Gravity;

	/** Particles with a velocity magnitude < this threshold will be considered fixed */
	var(Simulation) float SleepThreshold;
    
	/** Particle velocity will be clamped to this value at the end of each step */
	var(Simulation) float MaxVelocity;                 
   
	/** Clamp the maximum bound for this container to prevent crashes if flex particles move too far away*/
	var(Simulation) float MaxContainerBound;      

	/** Control the convergence rate of the parallel solver, default: 1, values greater than 1 may lead to instability */
	var(Simulation) float RelaxationFactor;

	/** How the relaxation is applied inside the solver. */
	var(Simulation) RelaxationMode Mode;

	/** If true then a second pass of collision detection will be run against triangle meshes to prevent tunneling, usually not necessary */
    var(Collision) bool bEnableCCD;

	/** If true then particles will collide with complex collision shapes */
    var(Collision) bool bComplexCollision;

	/** Assigning RBChannel for this Flex container */
	var(Collision)	ERBCollisionChannel		RBChannel;

	/** Types of objects that this physics objects will collide with. */
	var(Collision) const RBCollisionChannelContainer	RBCollideWithChannels;

	/** The size of grid cell used for broad phase collision culling  */
    var(Collision) float CellSizeFactor;

	/** Increases the radius used during neighbor finding, this is useful if particles are expected to move significantly during a single step to ensure contacts aren't missed on subsequent iterations */
    var(Collision) float CollisionMargin;

	/** Increases the radius used during contact finding against kinematic shapes, this is useful if particles are expected to move significantly during a single step to ensure contacts aren't missed on subsequent iterations */
    var(Collision) float CollisionMarginShapes;

	/** Distance particles maintain against shapes */
    var(Collision) float CollisionDistance;

    /** Coefficient of dynamic friction when collisind against shapes*/
    var(Collision) float Friction;

    /** Multiplier for friction of particles against other particles */
    var(Collision) float ParticleFriction;

    /** Coefficient of static friction, this is used for both particle and shape collisions */
    var(Collision) float StaticFriction;
	
	/** Coefficient of restitution used when colliding against shapes */
    var(Collision) float Restitution;                 
    
	/** Artificially decrease the mass of particles based on height from a fixed reference point, this makes stacks and piles converge faster */
	var(Collision) float ShockPropagation;
    
	/** Damp particle velocity based on how many particle contacts it has */
	var(Collision) float Dissipation;
	
    /** Constant acceleration applied to particles that belong to dynamic triangles */
    var(Cloth) vector Wind;

	/** Drag force applied to particles belonging to dynamic triangles, proportional to velocity^2*area in the negative velocity direction */
    var(Cloth) float Drag;

	/** Lift force applied to particles belonging to dynamic triangles, proportional to velocity^2*area in the direction perpendicular to velocity and (if possible), parallel to the plane normal */
    var(Cloth) float Lift;

	/** If true, particles with phase 0 are considered fluid particles and interact using the position based fluids method */
    var(Fluid) bool bFluid;                        
	
	/** Controls the distance fluid particles are spaced at the rest density, the absolute distance is given by this value*radius, must be in the range (0, 1) */
	var(Fluid) float RestDistance <ClampMin=0.0 | ClampMax=1.0>;                
    
	/** Control how strongly particles stick to surfaces they hit, default 0.0, range [0.0, +inf] */
	var(Fluid) float Adhesion;
    
	/** Control how strongly particles hold each other together, default: 0.025, range [0.0, +inf] */
	var(Fluid) float Cohesion;
    
	/** Controls how strongly particles attempt to minimize surface area, default: 0.0, range: [0.0, +inf]  */
	var(Fluid) float SurfaceTension;
    
	/** Smoothes particle velocities using XSPH viscosity */
	var(Fluid) float Viscosity;
    
	/** Increases vorticity by applying rotational forces to particles */
	var(Fluid) float VorticityConfinement;
    
	/** Add pressure from solid surfaces to particles */
	var(Fluid) float SolidPressure;
	
	/** Drag force applied to boundary fluid particles */
	var(Fluid) float FreeSurfaceDrag;

	/** Particles belonging to rigid shapes that move with a position delta magnitude > threshold will be permanently deformed in the rest pose */
	var(Rigid) float PlasticThreshold;            
	
	/** Controls the rate at which particles in the rest pose are deformed for particles passing the deformation threshold */
    var(Rigid) float PlasticCreep;





//=============================================================================
//	Non-exposed state 
//=============================================================================

//var transient bool bDestroy;
//var transient bool bSyncFailed;
//// GBX:aalvarez Removed bIsInGame. It's unnecessary now. 2013-08-22
//
//var native pointer PSys {class FFlexContainer};

defaultproperties
{
   Radius=15.000000
   MaxParticlesAtPhysXLevel(0)=(MaxParticles=8192,MeshParticlesBudget=0.300000)
   bFixedTimeStep=True
   NumIterations=3
   NumSubsteps=1
   MinFrameRate=60
   Gravity=(X=0.000000,Y=0.000000,Z=-1000.000000)
   MaxVelocity=5000.000000
   MaxContainerBound=999999995904.000000
   RelaxationFactor=1.000000
   Mode=RelaxationMode_Local
   RBChannel=RBCC_FlexAsset
   RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True)
   CellSizeFactor=2.000000
   Friction=0.200000
   ParticleFriction=0.100000
   Restitution=0.010000
   RestDistance=0.500000
   Cohesion=0.025000
   SolidPressure=1.000000
   Name="Default__FlexContainer"
   ObjectArchetype=Object'Core.Default__Object'
}
