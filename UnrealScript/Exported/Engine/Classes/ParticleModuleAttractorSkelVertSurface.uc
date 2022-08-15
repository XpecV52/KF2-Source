/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleAttractorSkelVertSurface extends ParticleModuleAttractorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *  Falloff type enumeration.
 */
enum EVertSurfaceAttractorFalloffType
{
	VSFOFF_Constant,
	VSFOFF_Linear,
	VSFOFF_Exponent
};

/**
 *  Type of falloff.
 *
 *  FOFF_Constant - Falloff is constant so just use the strength for the whole range.
 *  FOFF_Linear - Linear falloff over the range.
 *  FOFF_Exponent - Exponential falloff over the range.
 */
var() EVertSurfaceAttractorFalloffType FalloffType;

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

enum EAttractorSkelVertSurfaceDestination
{
	VERTSURFACEDEST_Vert,
	VERTSURFACEDEST_Surface
};

/**
 *	Whether the module uses Verts or Surfaces for locations.
 *
 *	VERTSURFACEDEST_Vert		- Use Verts as the destination locations.
 *	VERTSURFACEDEST_Surface		- Use Surfaces as the destination locations.
 */
var(VertSurface)	EAttractorSkelVertSurfaceDestination	DestinationType;

/** An offset to apply to each vert/surface */
var(VertSurface)	vector	UniversalOffset;

/**
 *	The parameter name of the skeletal mesh actor that supplies the SkelMeshComponent for in-game.
 */
var(VertSurface)	name	SkelMeshActorParamName;

/** The name of the skeletal mesh to use in the editor */
var(VertSurface)	editoronly	SkeletalMesh	EditorSkelMesh;

/** This module will only spawn from verts or surfaces associated with the bones in this list */
var(VertSurface)	array<Name>	ValidAssociatedBones;

/** When TRUE use the RestrictToNormal and NormalTolerance values to check surface normals */
var(VertSurface)	bool	bEnforceNormalCheck;

/** Use this normal to restrict spawning locations */
var(VertSurface)	vector	NormalToCompare;

/** Normal tolerance.  0 degrees means it must be an exact match, 180 degrees means it can be any angle. */
var(VertSurface)	float	NormalCheckToleranceDegrees;

/** Normal tolerance.  Value between 1.0 and -1.0 with 1.0 being exact match, 0.0 being everything up to
    perpendicular and -1.0 being any direction or don't restrict at all. */
var					float	NormalCheckTolerance;

/**
 *	Array of material indices that are valid materials to spawn from.
 *	If empty, any material will be considered valid
 */
var(VertSurface)	array<int>	ValidMaterialIndices;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   FalloffExponent=(Distribution=DistributionFalloffExponent,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Range=(Distribution=DistributionRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   DragCoefficient=(Distribution=DistributionDragCoefficient,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   DragRadius=(Distribution=DistributionDragRadius,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   SkelMeshActorParamName="VertSurfaceActor"
   bSpawnModule=True
   bUpdateModule=True
   bFinalUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleAttractorSkelVertSurface"
   ObjectArchetype=ParticleModuleAttractorBase'Engine.Default__ParticleModuleAttractorBase'
}
