/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LandscapeHeightfieldCollisionComponent extends PrimitiveComponent
	native(Terrain);

/** The collision height values. */
var native const UntypedBulkData_Mirror	CollisionHeightData{FWordBulkData};

/** List of layers painted on this component. Matches the WeightmapLayerAllocations array in the LandscapeComponent. */
var const array<Name> ComponentLayers;

/** Indices into the ComponentLayers array for the per-vertex dominant layer. */
var native const UntypedBulkData_Mirror	DominantLayerData{FByteBulkData};

/** Offset of component in landscape quads */
var const int SectionBaseX;
var const int SectionBaseY;

/** Size of component in collision quads */
var int CollisionSizeQuads;

/** Collision scale: (ComponentSizeQuads+1) / (CollisionSizeQuads+1) */
var float CollisionScale;

/** The flags for each collision quad. See ECollisionQuadFlags. */
var const array<byte> CollisionQuadFlags;

var const array<PhysicalMaterial> PhysicalMaterials;

/** Physics engine version of heightfield data. */
/*var const native pointer RBHeightfield{class NxHeightField};*/
var const native pointer RBHeightfield{class PxHeightField};

/** Cached bounds, created at heightmap update time */
var const BoxSphereBounds CachedBoxSphereBounds;

var bool bIncludeHoles;
var editoronly transient bool bHeightFieldDataHasHole;


/** Needed to reconstruct hit UVs */
var Vector4 LandscapeLightmapScaleBias;

/** Ref to the same splattermap as the LandscapeComponent */
var private const TWSplatterMap2D SplatterMap;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   LandscapeLightmapScaleBias=(X=0.000000,Y=0.000000,Z=0.000000,W=1.000000)
   ReplacementPrimitive=None
   bAllowCullDistanceVolume=False
   bUseAsOccluder=True
   bAcceptsDynamicDecals=False
   CastShadow=True
   bAcceptsLights=True
   bUsePrecomputedShadows=True
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   Name="Default__LandscapeHeightfieldCollisionComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
   CustomProperties CollisionHeightData 
}
