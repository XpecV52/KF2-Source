/*=============================================================================
	FlexForceFieldComponent.uc: Flex force field component integration.
	Copyright 2008-2011 NVIDIA Corporation.
=============================================================================*/

class FlexForceFieldComponent extends PrimitiveComponent
	hidecategories(Collision,Lighting,Physics,Rendering,Object,PersistentSplats)
	native(Physics)
	editinlinenew;

/** Rotational field strength */
var(ForceField)	float	RotationalFieldStrength;
/** Radial field strength */
var(ForceField)	float	RadialFieldStrength;
/** Lift field strength */
var(ForceField)	float	LiftFieldStrength;

/** Height of capsule field */
var(ForceField)	float	CapsuleFieldHeight <ClampMin=0.0>;
/** Bottom radius of capsule field */
var(ForceField)	float	CapsuleFieldBottomRadius <ClampMin=0.0>;
/** Top radius of capsule field */
var(ForceField)	float	CapsuleFieldTopRadius <ClampMin=0.0>;
/** Percentage of distance from boundary to center where fade out starts */
var(ForceField)	float	BoundaryFadePercentage <ClampMin=0.0 | ClampMax=1.0>;

/** Enable/Disable Field Sampler */
var(ForceField) bool	bEnabled;

/** Which types of object to apply this field sampler to */
var(ForceField)	const RBCollisionChannelContainer CollideWithChannels;

/** enum indicating what collision filtering channel this field sampler should be in */
var(ForceField)	const ERBCollisionChannel	CollisionChannel;

/** Duration in seconds the field sampler should be exist.  0 = Infinite*/
var(ForceField)   float   Duration;

/** Percentage of noise applied to force field. 0 = None 1 = Infinite */
var(ForceField)	float	NoiseStrength <ClampMin=0.0 | ClampMax=1.0>;


/** Internal variable for storing the elapsed time of the field sampler */
var     float   ElapsedTime;

native function DoInitRBPhys();
native final function SetEnabled(bool enabled);

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
   RotationalFieldStrength=750.000000
   RadialFieldStrength=-400.000000
   CapsuleFieldHeight=200.000000
   CapsuleFieldBottomRadius=100.000000
   CapsuleFieldTopRadius=50.000000
   BoundaryFadePercentage=0.100000
   bEnabled=True
   CollideWithChannels=(FlexAsset=True)
   CollisionChannel=RBCC_FlexAsset
   NoiseStrength=0.010000
   ReplacementPrimitive=None
   TickGroup=TG_PreAsyncWork
   Name="Default__FlexForceFieldComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
