/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InstancedStaticMeshComponent extends StaticMeshComponent
	native(Mesh);

struct immutablewhencooked native InstancedStaticMeshInstanceData
{
	var matrix Transform;
	var vector2d LightmapUVBias;
	var vector2d ShadowmapUVBias;

	structcpptext
	{
		// Serialization
		friend FArchive& operator<<(FArchive& Ar, FInstancedStaticMeshInstanceData& InstanceData)
		{
			// @warning BulkSerialize: FInstancedStaticMeshInstanceData is serialized as memory dump
			// See TArray::BulkSerialize for detailed description of implied limitations.
			Ar << InstanceData.Transform << InstanceData.LightmapUVBias << InstanceData.ShadowmapUVBias;
			return Ar;
		}
	}
};

struct native InstancedStaticMeshMappingInfo
{
	var native pointer Mapping{class FInstancedStaticMeshStaticLightingTextureMapping};
	var native pointer Lightmap{class FInstancedLightMap2D};
	var texture2d LightmapTexture;
	var shadowmap2d ShadowmapTexture;
};

/** Deprecated array of instances, script serialized */
var deprecated array<InstancedStaticMeshInstanceData> PerInstanceData;

/** Array of instances, bulk serialized */
var native array<InstancedStaticMeshInstanceData> PerInstanceSMData;

/** Number of pending lightmaps still to be calculated (Apply()'d) */
var transient int NumPendingLightmaps;

/**
 * A key for deciding which components are compatible when joining components together after a lighting build. 
 * Will default to the staticmesh pointer when SetStaticMesh is called, so this must be set after calling
 * SetStaticMesh on the component
 */
var int ComponentJoinKey;

/** The mappings for all the instances of this component */
var transient array<InstancedStaticMeshMappingInfo> CachedMappings;

/** Value used to seed the random number stream that generates random numbers for each of this mesh's instances.
	The random number is stored in a buffer accessible to materials through the PerInstanceRandom expression.  If
	this is set to zero (default), it will be populated automatically by the editor */
var() int InstancingRandomSeed;

/** Distance from camera at which each instance begins to fade out */
var(Culling) int InstanceStartCullDistance;

/** Distance from camera at which each instance completely fades out */
var(Culling) int InstanceEndCullDistance;

/** One bit per instance to show selection in the editor */
var editoronly native const BitArray_Mirror SelectedInstances{TBitArray<>};

/** Flag to prevent split up/join components into multiple components after building lighting */
var bool bDontResolveInstancedLightmaps;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bSupportedOnMobile=False
   Name="Default__InstancedStaticMeshComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
