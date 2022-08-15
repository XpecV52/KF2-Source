/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAttractorBoneSocket extends ParticleModuleAttractorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *  Falloff type enumeration.
 */
enum EBoneSocketAttractorFalloffType
{
	BSFOFF_Constant,
	BSFOFF_Linear,
	BSFOFF_Exponent
};

/**
 *  Type of falloff.
 *
 *  FOFF_Constant - Falloff is constant so just use the strength for the whole range.
 *  FOFF_Linear - Linear falloff over the range.
 *  FOFF_ExponentExponential falloff over the range.
 */
var() EBoneSocketAttractorFalloffType FalloffType;

/** When TRUE the attraction force is particle life relative, when FALSE it is emitter life relative. */
var() bool bParticleLifeRelative;

/**
 *  Optional falloff exponent for FOFF_Exponent type.
 */
var() interp rawdistributionfloat FalloffExponent;

/**
 *  Range of the attractor.
 */
var() interp rawdistributionfloat Range;

/**
 *  Strength of the attraction over time.
 */
var() interp rawdistributionfloat Strength;

/**
 *  Radius bounding the attraction point for use with collisions.
 */
var() interp rawdistributionfloat CollisionRadius;

/**
 *  Drag coefficient, a value of 1.0f means no drag, a value > 1.0f means accelerate.
 *  This value is multiplied with the DragCoefficient value in the attractor to get the
 *  resultant drag coefficient and generate the drag force.
 */
var() interp rawdistributionfloat DragCoefficient;

/**
 *  Apply the drag when the particle is within this radius.
 */
var() interp rawdistributionfloat DragRadius;

enum ELocationBoneSocketDestination
{
	BONESOCKETDEST_Bones,
	BONESOCKETDEST_Sockets
};

/**
 *	Whether the module uses Bones or Sockets for locations.
 *
 *	BONESOCKETSOURCE_Bones		- Use Bones as the source locations.
 *	BONESOCKETSOURCE_Sockets	- Use Sockets as the source locations.
 */
var(BoneSocket)	ELocationBoneSocketDestination	DestinationType;

/** Only applies to Bone destination type.  When TRUE, the particles will be attracted to points along the length of the bone. */
var(BoneSocket) bool bAttractAlongLengthOfBone;

/** An offset to apply to each bone/socket */
var(BoneSocket)	vector	UniversalOffset;

struct native AttractLocationBoneSocketInfo
{
	/** The name of the bone/socket on the skeletal mesh */
	var()	name	BoneSocketName;
	/** The offset from the bone/socket to use */
	var()	vector	Offset;
};

/** The name(s) of the bone/socket(s) to position at */
var(BoneSocket)	array<AttractLocationBoneSocketInfo>	SourceLocations;

enum ELocationBoneSocketDestSelectionMethod
{
	BONESOCKETDESTSEL_Sequential,
	BONESOCKETDESTSEL_Random,
	BONESOCKETDESTSEL_RandomExhaustive,
	BONESOCKETDESTSEL_BlendAll
};

/**
 *	The method by which to select the bone/socket to spawn at.
 *
 *	SEL_Sequential			- loop through the bone/socket array in order
 *	SEL_Random				- randomly select a bone/socket from the array
 *	SEL_RandomExhaustive	- randomly select a bone/socket, but never the same one twice until all have been used, then reset
 *  SEL_BlendAll			- weights every entry in the list equally and attracts to all of them simultaneously
 */
var(BoneSocket)	ELocationBoneSocketDestSelectionMethod	SelectionMethod;

// TODO: Orient meshes on entry
/** If TRUE, rotate mesh emitter meshes to orient w/ the socket */
//var(BoneSocket)	bool	bOrientMeshEmitters;

/**
 *	The parameter name of the skeletal mesh actor that supplies the SkelMeshComponent for in-game.
 */
var(BoneSocket)	name	SkelMeshActorParamName;

/** The name of the skeletal mesh to use in the editor */
var(BoneSocket)	editoronly	SkeletalMesh	EditorSkelMesh;

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
   DestinationType=BONESOCKETDEST_Sockets
   FalloffExponent=(Distribution=DistributionFalloffExponent,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Range=(Distribution=DistributionRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   DragCoefficient=(Distribution=DistributionDragCoefficient,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   DragRadius=(Distribution=DistributionDragRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   SkelMeshActorParamName="BoneSocketActor"
   bSpawnModule=True
   bUpdateModule=True
   bFinalUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleAttractorBoneSocket"
   ObjectArchetype=ParticleModuleAttractorBase'Engine.Default__ParticleModuleAttractorBase'
}
