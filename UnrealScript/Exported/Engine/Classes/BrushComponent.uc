/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class BrushComponent extends PrimitiveComponent
	native
	// removed noexport
	collapsecategories
	dependson(KMeshProps)
	editinlinenew;

var const Model						Brush;

//  made class non-noexport (instead of simply mirroring FKCachedConvexData, actually expose it to script)

struct native KCachedConvexDataElement
{
	/** Cooked data stream for physics engine for one convex hull. */
	var native init array<byte> ConvexElementData;
	var native transient pointer ConvexMesh{class PxConvexMesh};

	/** Caches the size of the convex hull byte buffer because the array is emptied when the mesh is actually instantiated */
	var native int ConvexMeshDataSize;

	structcpptext
	{
		FKCachedConvexDataElement() 
			: ConvexMesh(NULL),	
			 ConvexMeshDataSize(0)	
		{}

		friend FArchive& operator<<( FArchive& Ar, FKCachedConvexDataElement& S )
		{
			S.ConvexElementData.BulkSerialize(Ar);	
			if ( Ar.Ver() >= VER_PHYSX_3 )
			{
				if ( 1 ) //!GIsCookingForFinalRelease || !Ar.IsSaving() )
				{
					Ar << S.ConvexMeshDataSize;
					//LOC_MOD
					//check( !Ar.IsLoading() || S.ConvexMeshDataSize == S.ConvexElementData.Num() );
				}
			}
			else if ( Ar.IsLoading() )
			{
				S.ConvexMeshDataSize = S.ConvexElementData.Num();
			}	
			return Ar;
		}
	}
};

/** Intermediate cooked data from the physics engine for a collection of convex hulls. */
struct native KCachedConvexData
{
	/** Array of cooked physics data - one element for each convex hull.*/
	var native init array<KCachedConvexDataElement> CachedConvexElements;

	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FKCachedConvexData& S )
{
			Ar << S.CachedConvexElements;
			return Ar;
		}
	}
};


/** Simplified collision data for the mesh. */
var KMeshProps.KAggregateGeom		BrushAggGeom;

/** Cached brush convex-mesh data for use with the physics engine. */
var native private const transient noimport KCachedConvexData CachedPhysBrushData;

/**
 *	Indicates version that CachedPhysBrushData was created at.
 *	Compared against CurrentCachedPhysDataVersion.
 */
var private const int				CachedPhysBrushDataVersion;

/** 
 *	Normally a blocking volume is considered 'pure simplified collision', so when tracing for complex collision, never collide 
 *	This flag overrides that behaviour
 */
var() bool	bBlockComplexCollisionTrace;

// made non-noexport (added cpptext here)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   HiddenGame=True
   bUseAsOccluder=True
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__BrushComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
