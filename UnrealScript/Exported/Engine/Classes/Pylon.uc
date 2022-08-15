//=============================================================================
// Pylon
//
// Used to determine the start location for exploration/creation of a NavMesh
//
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Pylon extends NavigationPoint
	hidecategories(Lighting,LightColor,Force)
	implements(EditorLinkSelectionInterface,Interface_NavigationHandle)
	placeable
	
	config(Game)
	
	native;

enum ENavMeshEdgeType
{

	NAVEDGE_UnknownType,

	NAVEDGE_Normal,
	NAVEDGE_Mantle,
	NAVEDGE_Coverslip,
	NAVEDGE_SwatTurn,
	NAVEDGE_DropDown,
	NAVEDGE_PathObject,
	NAVEDGE_BackRefDummy,
	NAVEDGE_Jump,

	NAVEDGE_CrossPylon,
	NAVEDGE_OneWayEdge,

};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Navigation mesh created for this pylon */
var const native pointer NavMeshPtr{class UNavigationMeshBase};
/** Obstacle mesh used for "can-go" raycasts */
var const native pointer ObstacleMesh{class UNavigationMeshBase};
/** Obstacle mesh used for "can-go" raycasts - built from dynamic obstacles! */
var const native pointer DynamicObstacleMesh{class UNavigationMeshBase};

/** Working set ptr - used internally for building nav mesh */
var const native transient pointer WorkingSetPtr{TDoubleLinkedList<struct FNavMeshPolyBase*>};
/** internally used list of pathobjects which affect this pylon's mesh.  Used only at navmesh generation time*/
var const native transient private pointer PathObjectsThatAffectThisPylon { TArray<class IInterface_NavMeshPathObject*> };
/** Seed points created by last round of cover info */
var const transient array<Vector>	NextPassSeedList;

/** ID member var for octree functionality */
var	const native OctreeElementId	OctreeId{FOctreeElementId};

/** pointer to the octree this pylon was added to (so we can tell when the octree changes */
var const native Pointer OctreeIWasAddedTo{void};

/** Next pylon in the linked list */
var const Pylon NextPylon;

/** A list of volumes within which is valid to explore Note this trumps expansion radius */
var(MeshGeneration) array<Volume> ExpansionVolumes;

/** radius within which expansion will be allowed.  Note if this pylon has an expansion volume linked to it, this parameter has no effect*/
var(MeshGeneration) float ExpansionRadius;
/** Used to prevent exploration from wrapping past the 65536 available indices in a WORD */
var	  const float MaxExpansionRadius;

var DrawPylonRadiusComponent PylonRadiusPreview;

/** Indicates if this pylon is associated with an imported mesh */
var bool bImportedMesh;

/** when TRUE, center of sphere used for expansion bounds will be ExpansionSphereCenter rather than this.location*/
var bool bUseExpansionSphereOverride;
var vector ExpansionSphereCenter;

/** indicates that this pylon's CostFor function needs to be called when considering edges owned by it
    False by default in order to avoid unnecessary vfunc calls*/
var bool bNeedsCostCheck;

/** pointer to this pylon's rendering component */
var NavMeshRenderingComponent RenderingComp;

/** sprite comp to be used when this pylon is broken somehow */
var const transient SpriteComponent BrokenSprite;


/** Imposter pylon - this is another pylon which at some point will replace this one due to a gameplay event or some such.  Meshbuild of this
 *  pylon will ignore collisions with the imposter pylon (e.g. build through it)
 */
var(MeshGeneration) Array<Pylon> ImposterPylons;

/** when this pylon is being built, disable collision for these actors */
var(MeshGeneration) array<Actor> OnBuild_DisableCollisionForThese;

/** when this pylon is being built, enable collision for these actors */
var(MeshGeneration) array<Actor> OnBuild_EnableCollisionForThese;

var(MeshGeneration) float   MaxPolyHeight_Optional;

/** used for HPF heuristic shaping (e.g. bias against leaving pylons that are not in high level path) */
var transient bool bPylonInHighLevelPath;

/** Generate NavMesh using Recast */
var(MeshGeneration) bool	bUseRecast <bShowOnlyWhenTrue=bAllowRecastGenerator>;
var transient bool bAllowRecastGenerator;

/** Generator used to create NavMesh, check ENavigationMeshGeneratorType for details */
var byte NavMeshGenerator;


//
// Nav Mesh Overloads
//

// ONLY WORKS FOR RECAST BUILDS
var (NavMeshOverloads) bool bAllowNavMeshOverLoads;
// How long and wide the building blocks for nav mesh simplifaction, smaller means more detail, but more build time, like 1.3X for every %50 reduction is size, and maybe more memory
var (NavMeshOverloads) float Recast_CellSize<ClampMin = 5.0 | ClampMax = 100.0>;
// How tall the building blocks for nav mesh simplifaction, smaller means more detail, but more build time, like 1.3X for every %50 reduction is size, and maybe more memory
var (NavMeshOverloads) float Recast_CellHeight<ClampMin = 5.0 | ClampMax = 150.0>;
// DO NOT USE YET!!! it works but does not give the results we want yet
var (NavMeshOverloads) float Recast_AgentMaxSlope<ClampMin = 0.0 | ClampMax = 90.0>;
// USE WITH CARE, changes the height that the nav mesh conciders (STATIC) obstacles, but does not take into concideration what the actual pawns step up height is, so if you set this to 100 and the pawns step up height was only 45 he would get stuck
var (NavMeshOverloads) float NavMeshGen_MaxStepHeight<ClampMin = 1.0 | ClampMax = 500.0>;
// DO NOT USE YET!!!! way to many changes to know all effects yet!!!!
var (NavMeshOverloads) float NavMeshGen_MinPolyArea;

/** when this is TRUE a dashed-red line will be drawn across the gap of a one-way edge to highlight those situations */
var(NavMeshOverloads) bool bHightlightOneWayReachSpecs;



//
//
//

// recast transient vars
var transient array<KMeshProps.KAggregateGeom> VoxelFilterBounds;
var transient array<matrix> VoxelFilterTM;


var const float BufferEpsilonToAddedToBoundsBoxForDropEdgeCheck;


//debug
var(Debug) int DebugEdgeCount;
var(Debug) bool bDrawEdgePolys;
var(Debug) bool bDrawPolyBounds;
var(Display) bool bRenderInShowPaths;
var(Display) bool bDrawWalkableSurface;
var(Display) bool bDrawObstacleSurface;

/** Show Obstacle mesh as solid polys instead of lines with "show paths" in game */
var(Display) bool bSolidObstaclesInGame;

struct immutablewhencooked native PolyReference
{
	var ActorReference OwningPylon;
	// Poly ID that indexes into the navmesh poly array
	// NOTE: this has two WORDs shoved into it, lowest 2 bytes are Top level poly ID, highest 2 bytes are sub-poly ID
	var private {private} INT PolyId;
	var native private {private} Pointer CachedPoly{struct FNavMeshPolyBase};

	structcpptext
	{
		FPolyReference()
		{
			SetPolyId(MAXWORD,MAXWORD);
		}
		FPolyReference(EEventParm)
		{
			appMemzero(this, sizeof(FPolyReference));
		}

		explicit FPolyReference(AActor* Pylon, INT InPolyId)
		{
			OwningPylon = FActorReference(Pylon,*Pylon->GetGuid());
			SetPolyId(InPolyId,MAXWORD);
		}

		explicit FPolyReference(struct FNavMeshPolyBase* InPoly);

		// overload various operators to make the reference struct as transparent as possible
		struct FNavMeshPolyBase* operator*();

		/**
		 * this will dereference the poly and return a pointer to it
		 * @param bEvenIfPylonDisabled - pass TRUE to this if you want the poly even if its pylon is bDisabled
		 * @return the poly assoicated with this poly ref
		 */
		struct FNavMeshPolyBase* GetPoly(UBOOL bEvenIfPylonDisabled=FALSE);

		FORCEINLINE struct FNavMeshPolyBase* operator->()
		{
			return *(*this);
		}
		FPolyReference* operator=(FNavMeshPolyBase* Poly);
		FORCEINLINE UBOOL operator==(const FPolyReference &Ref) const
		{
			return ((Ref.OwningPylon == OwningPylon) && Ref.GetTopLevelPolyId() == GetTopLevelPolyId() && Ref.GetSubPolyId() == GetSubPolyId());
		}
		FORCEINLINE UBOOL operator!=(const FPolyReference &Ref) const
		{
			return ((Ref.OwningPylon != OwningPylon) || Ref.GetTopLevelPolyId() != GetTopLevelPolyId() || Ref.GetSubPolyId() != GetSubPolyId());
		}

		/**
		 * returns TRUE if the passed poly matches this ref
		 * minimizes poly lookups for speed
		 * @param Poly - poly to match
		 * @return TRUE if poly matches the poly ref
		 */
		UBOOL operator==(FNavMeshPolyBase* Poly) const;

		operator UBOOL();
		UBOOL operator!();

		FORCEINLINE void Clear()
		{
			OwningPylon.Actor = NULL;
			OwningPylon.Guid  = FGuid(0,0,0,0);
			SetPolyId(MAXWORD,MAXWORD);
		}

		FORCEINLINE void ClearCachedPoly()
		{
			CachedPoly = NULL;
		}

		class APylon* Pylon();

		friend FArchive& operator<<( FArchive& Ar, FPolyReference& T );

		FORCEINLINE WORD GetTopLevelPolyId() const { return PolyId&65535; }
		FORCEINLINE WORD GetSubPolyId() const { return PolyId>>16; }
		FORCEINLINE void SetPolyId(WORD NewTopLevelPolyId, WORD NewSubPolyId) 
		{
			PolyId = NewTopLevelPolyId | (NewSubPolyId<<16); 
			CachedPoly=NULL;
		}

		friend DWORD GetTypeHash(const FPolyReference& Ref)
		{
			DWORD GuidVal = appMemCrc(&Ref.OwningPylon.Guid, sizeof(FGuid));
			
			return (GuidVal << 16) | (Ref.PolyId&65535);
		}


	}
};

/** when FALSE this pylon's navmesh will not be cleared, nor built during 'build paths' -- useful for building subsets of the map at once*/
var transient bool bBuildThisPylon;

// when TRUE, this pylon and its mesh are considered invalid (same as unloaded)
var bool bDisabled;

// when TRUE, obstacle mesh polys will collide even if they have Cross Pylon edges which are loaded
var bool bForceObstacleMeshCollision;

// extent used for doing debug reachability pathing 
var transient Vector DebugPathExtent;

// location to do debug pathing from
var transient Vector DebugPathStartLocation;

/**
 * called whenever this pylon is turned on or off.. will do necessary work 
 * in area to make sure the state of the mesh is up to date
 */
native function OnPylonStatusChange();

/**
 * allow registered obstacles to affect this pylon as it is spawned/streamed in
 */
native function UpdateMeshForPreExistingNavMeshObstacles();


/**
 * will remove all dynamic edges associated with this pylon
 */
native function FlushDynamicEdges();


/**
 * loop through high level reach specs and verify that we can actually path to all our top level connections 
 */
function vector GetTestPathExtent()
{
	local class<Scout> ScoutClass;
	local vector Extent;

	ScoutClass = class<Scout>(DynamicLoadObject(class'Engine'.default.ScoutClassName,class'Class'));

	Extent.X = ScoutClass.default.PathSizes[0].Radius;
	Extent.Y = ScoutClass.default.PathSizes[0].Radius;
	Extent.Z = ScoutClass.default.PathSizes[0].Height;

	return Extent;
}

function VerifyTopLevelConnections()
{
	local NavigationHandle DebugHandle;
		local int i,PtIdx;
	local Pylon NeighborPylon;
	local array<vector> pts,Dst_Pts;
	local bool bFoundPath;


	DebugHandle = new(self) class'NavigationHandle';
	
	DebugPathStartLocation = Location;

	
	DebugPathExtent = GetTestPathExtent();

	DebugHandle.GetValidPositionsForBox(Location,DebugPathExtent.X*10,DebugPathExtent,false,Pts,5);

	if( Pts.length == 0 )
	{
		LogInternal("PATH CONNECTION FAILURE!"@self@"Could not get valid start path location");
		DrawDebugLine(Location,Location+vect(0,0,100),255,255,0,TRUE);
		return;
	}

	for ( i=0; i<PathList.Length; ++i )
	{
		NeighborPylon = Pylon(PathList[i].End.Actor);
		if( NeighborPylon != none )
		{
			DebugHandle.GetValidPositionsForBox(NeighborPylon.Location,DebugPathExtent.X*10,DebugPathExtent,false,Dst_Pts,1);
			if( Dst_pts.length < 1 )
			{
				LogInternal("PATH CONNECTION FAILURE!"@self@"Could not get valid dest path location to "@NeighborPylon);
				DrawDebugLine(NeighborPylon.Location,NeighborPylon.Location+vect(0,0,100),255,255,0,TRUE);
				continue;;
			}

			bFoundPath = false;
			for(PtIdx=0;PtIdx<Pts.length;++PtIdx)
			{
				DebugPathStartLocation = Pts[PtIdx];


				class'NavmeshPath_Toward'.static.TowardPoint(DebugHandle,Dst_Pts[0]);
				class'NavMeshGoal_At'.static.AtLocation(DebugHandle,Dst_Pts[0]);
				if( DebugHandle.FindPath() )
				{
					bFoundPath=true;
					break;
				}
			}

			if(!bFoundPath)
			{
				LogInternal("PATH CONNECTION FAILURE!"@self@"Location:'"$Location$"'"@"failed to path to "@NeighborPylon@"Dst_Pts[0]:'"$Dst_Pts[0]$"'");
				DrawDebugLine(Location, Dst_Pts[0],255,0,0,TRUE);
				DrawDebugCoordinateSystem(Location,rot(0,0,0),15,TRUE);
			}

		}
	}	
}

/**
 *  this event is called when an edge is deleted that this handle is actively using
 */
event NotifyPathChanged()
{
}

function PostBeginPlay()
{
	Super.PostBeginPlay();

	SetEnabled( !bBlocked );
}


event SetEnabled(bool bEnabled)
{
	bDisabled = !bEnabled;
	bForceObstacleMeshCollision = bDisabled;
	OnPylonStatusChange();
}

event bool IsEnabled()
{
	return !bDisabled;
}

function OnToggle(SeqAct_Toggle action)
{
	if (action.InputLinks[0].bHasImpulse)
	{
		// turn on
		SetEnabled(true);
	}
	else if (action.InputLinks[1].bHasImpulse)
	{
		// turn off
		SetEnabled(false);
	}
	else if (action.InputLinks[2].bHasImpulse)
	{
		// toggle
		SetEnabled(!IsEnabled());
	}

}

native function bool CanReachPylon( Pylon DestPylon, Controller C );

defaultproperties
{
   ExpansionRadius=2048.000000
   MaxExpansionRadius=7168.000000
   Begin Object Class=DrawPylonRadiusComponent Name=DrawPylonRadius0
      ReplacementPrimitive=None
      Name="DrawPylonRadius0"
      ObjectArchetype=DrawPylonRadiusComponent'Engine.Default__DrawPylonRadiusComponent'
   End Object
   PylonRadiusPreview=DrawPylonRadius0
   bRenderInShowPaths=True
   bDrawWalkableSurface=True
   bDrawObstacleSurface=True
   Begin Object Class=NavMeshRenderingComponent Name=NavMeshRenderer
      ReplacementPrimitive=None
      Name="NavMeshRenderer"
      ObjectArchetype=NavMeshRenderingComponent'Engine.Default__NavMeshRenderingComponent'
   End Object
   RenderingComp=NavMeshRenderer
   Recast_CellSize=25.000000
   Recast_CellHeight=10.000000
   Recast_AgentMaxSlope=45.000000
   NavMeshGen_MaxStepHeight=40.000000
   BufferEpsilonToAddedToBoundsBoxForDropEdgeCheck=10.000000
   DebugEdgeCount=-1
   bDestinationOnly=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.Pylon'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=NavMeshRenderer
   Components(6)=DrawPylonRadius0
   Begin Object Class=SpriteComponent Name=Sprite3
      Sprite=Texture2D'EditorResources.BadPylon'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite3"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(7)=Sprite3
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=CollisionCylinder
   Name="Default__Pylon"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
