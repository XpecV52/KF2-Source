/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class TerrainComponent extends PrimitiveComponent
	native(Terrain);

/**	INTERNAL: Array of shadow map data applied to the terrain component.		*/
var private const array<ShadowMap2D> ShadowMaps;
/**	INTERNAL: Array of lights that don't apply to the terrain component.		*/
var const array<Guid>				IrrelevantLights;

var const native transient pointer	TerrainObject{struct FTerrainObject};
var const int						SectionBaseX,
									SectionBaseY,
									SectionSizeX,
									SectionSizeY;

/** The actual section size in vertices...										*/
var const int						TrueSectionSizeX;
var const int						TrueSectionSizeY;

var native private const LightMapRef LightMap;

struct TerrainPatchBounds
{
	var float MinHeight;
	var float MaxHeight;
	var float MaxDisplacement;
};

struct TerrainMaterialMask
{
	var qword BitMask;
	var int NumBits;
};

var private const native transient array<TerrainPatchBounds>	PatchBounds;
var private const native transient array<TerrainMaterialMask>	BatchMaterials;
var private const native transient int		FullBatch;


/** Place holder structure that mirrors the byte size needed for a BV tree. */
struct TerrainBVTree
{
	var private const native array<int> Nodes;
};

/** Used for in-game collision tests against terrain. */
var private const native transient TerrainBVTree BVTree;

/**
 * This is a low poly version of the terrain vertices in world space. The
 * triangle data is created based upon Terrain->CollisionTesselationLevel
 */
var private const native transient array<vector>		CollisionVertices;

/** 
  *	Physics engine version of heightfield data. 
  * User first version for PhysX-2.8.x, second for PhysX-3.x
  */

/*var const native pointer RBHeightfield{class NxHeightField};*/
var const native pointer RBHeightfield{class PxHeightField};

/**
 *	Indicates the the terrain collision level should be rendered.
 */
var private const bool	bDisplayCollisionLevel;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   ReplacementPrimitive=None
   bAllowCullDistanceVolume=False
   bUseAsOccluder=True
   bAcceptsStaticDecals=True
   CastShadow=True
   bAcceptsLights=True
   bUsePrecomputedShadows=True
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   Name="Default__TerrainComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
