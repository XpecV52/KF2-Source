/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LandscapeComponent extends PrimitiveComponent
	native(Terrain)
	hidecategories(Display, Attachment, Physics, Debug, Lighting, Collision, Movement, Rendering, PrimitiveComponent, Object);

var() const editconst int			SectionBaseX,
									SectionBaseY;

var const int						ComponentSizeQuads,		// Total number of quads for this component
									SubsectionSizeQuads,	// Number of quads for a subsection of the component. SubsectionSizeQuads+1 must be a power of two.
									NumSubsections;			// Number of subsections in X or Y axis

var() MaterialInterface             OverrideMaterial;
var MaterialInstanceConstant		MaterialInstance;

/** Stores information about which weightmap texture and channel each layer is stored */
struct native WeightmapLayerAllocationInfo
{
	var Name LayerName;
	var byte WeightmapTextureIndex;
	var byte WeightmapTextureChannel;

	structcpptext
	{
		FWeightmapLayerAllocationInfo(FName InLayerName)
		:	LayerName(InLayerName)
		,	WeightmapTextureIndex(255)	// Indicates an invalid allocation
		,	WeightmapTextureChannel(255)
		{}
	}
};

/** List of layers, and the weightmap and channel they are stored */
var private const array<WeightmapLayerAllocationInfo> WeightmapLayerAllocations;

/** Weightmap texture reference */
var private const array<Texture2D> WeightmapTextures;

/** UV offset to component's weightmap data from component local coordinates*/
var Vector4 WeightmapScaleBias;

/** U or V offset into the weightmap for the first subsection, in texture UV space */
var float WeightmapSubsectionOffset;

/** UV offset to Heightmap data from component local coordinates */
var Vector4 HeightmapScaleBias;

/** Heightmap texture reference */
var private const Texture2D HeightmapTexture;

/** Cached bounds, created at heightmap update time */
var const BoxSphereBounds CachedBoxSphereBounds;

/** Cached local-space bounding box, created at heightmap update time */
var const Box CachedLocalBox;

/** Unique ID for this component, used for caching during distributed lighting */
var private const editoronly Guid LightingGuid;

/** Array of shadow maps for this component. */
var private const array<ShadowMap2D> ShadowMaps;
/**	INTERNAL: Array of lights that don't apply to the terrain component.		*/
var const array<Guid>		IrrelevantLights;

/** Reference to the texture lightmap resource. */
var native private const LightMapRef LightMap;


var(PersistentSplats) private const editconst int SplatterMapRes;
var private const TWSplatterMap2D SplatterMap;


/** Pointer to data shared with the render therad, used by the editor tools */
var private native pointer EditToolRenderData{struct FLandscapeEditToolRenderData};

/** Heightfield mipmap used to generate collision */
var int CollisionMipLevel;

/** Platform-specific data */
var private native pointer PlatformData{void};

/** Platform-specific data size */
var const native int PlatformDataSize;

var editoronly transient bool bNeedPostUndo;

/** Forced LOD level to use when rendering */
var(LOD) int ForcedLOD;
/** Neighbor LOD data to use when rendering, 255 is unspecified */
var byte NeighborLOD[8];
/** LOD level Bias to use when rendering */
var(LOD) int LODBias;
/** Neighbor LOD bias to use when rendering, 128 is 0 bias, 0 is -128 bias, 255 is 127 bias */
var byte NeighborLODBias[8];

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   WeightmapScaleBias=(X=0.000000,Y=0.000000,Z=0.000000,W=1.000000)
   HeightmapScaleBias=(X=0.000000,Y=0.000000,Z=0.000000,W=1.000000)
   ForcedLOD=-1
   NeighborLOD(0)=255
   NeighborLOD(1)=255
   NeighborLOD(2)=255
   NeighborLOD(3)=255
   NeighborLOD(4)=255
   NeighborLOD(5)=255
   NeighborLOD(6)=255
   NeighborLOD(7)=255
   NeighborLODBias(0)=128
   NeighborLODBias(1)=128
   NeighborLODBias(2)=128
   NeighborLODBias(3)=128
   NeighborLODBias(4)=128
   NeighborLODBias(5)=128
   NeighborLODBias(6)=128
   NeighborLODBias(7)=128
   ReplacementPrimitive=None
   bAllowCullDistanceVolume=False
   bUseAsOccluder=True
   bAcceptsStaticDecals=True
   bForceDirectLightMap=True
   bAcceptsLights=True
   bUsePrecomputedShadows=True
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   bOverrideAutoLightingChannels=True
   bAllowPersistentSplatters=True
   Name="Default__LandscapeComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
   CustomProperties LandscapeHeightData LayerNum=0 
}
