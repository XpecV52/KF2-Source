//=============================================================================
// NavigationHandle
//
// Component that encapsulates navigation behavior.  Attach this to your actor of choice to
// enable that actor to pathfind
//
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class NavigationHandle extends Object within Actor
	native(AI);

struct native PolySegmentSpan
{
	var native pointer Poly{FNavMeshPolyBase};
	var Vector P1, P2;

	structcpptext
	{
		explicit FPolySegmentSpan( struct FNavMeshPolyBase* inPoly, FVector inP1, FVector inP2 )
		{
			Poly = inPoly;
			P1 = inP1;
			P2 = inP2;
		}
	}
};

/** Current pylon AI is anchored to */
var Pylon		AnchorPylon;
var native pointer AnchorPoly{FNavMeshPolyBase};

/** dummy struct used to match alignment in pathcache array */
struct {FNavMeshEdgeBase*} EdgePointer
{
	var native const pointer Dummy{FNavMeshEdgeBase};
};

// struct containing the pathcache aray.  Used so that
// pathcaches can easily be stored and copied around in script
struct native PathStore
{
	structcpptext
	{
		FORCEINLINE FNavMeshEdgeBase*& operator()( INT i )
		{
			return EdgeList(i);
		}

		FORCEINLINE INT Num()
		{
			return EdgeList.Num();
		}

		FNavMeshEdgeBase*& Last( INT c=0 )
		{
			return EdgeList.Last(c);
		}

		FNavMeshEdgeBase*& Top()
		{
			return Last();
		}
	}

	var native array<EdgePointer>	EdgeList;
};

var PathStore PathCache;

/**
 * This points to the BestUnfinishedPathPoint.  Which will usually be set by some EvaluateGoal or DetermineFinalGoal function/
 * In some cases it is not possible to get a full path, but having the best unfinished path is good enough (e.g. ai on top
 * of a crevice, or on a navmesh island disconnected from everyone else)
 **/
var transient native pointer BestUnfinishedPathPoint{FNavMeshPolyBase};

/** List of polys to move through */
var const native pointer CurrentEdge{FNavMeshEdgeBase};

/** the poly we're currently trying to get inside */
var const native pointer SubGoal_DestPoly{FNavMeshPolyBase};

/** Final destination */
var BasedPosition FinalDestination;
/** AI should not update route cache - flag to prevent cache from being changed when pathing is used to evaluate squad location */
var bool bSkipRouteCacheUpdates;

const LINECHECK_GRANULARITY = 768.f;

/** List of search constraints for pathing */
var NavMeshPathConstraint		PathConstraintList;
var NavMeshPathGoalEvaluator	PathGoalList;

/** when this is TRUE the goal evaluator chain will be treated as an OR chain instead of an AND chain */
var bool bUseORforEvaluateGoal;

/** this is a handy way of ensuring everyone is setting the necessary parameters.. this should always reflect the number of
 *  parameters in the NavMeshPathParams struct, and then in SetupPathingParams a check will be inserted with the
 *  number of params in existence at the time of writing the function, so if the number of params changes and the implementations
 *  are not updated an assert will fire
 */
const NUM_PATHFINDING_PARAMS = 9;

// this struct is where all the non-volatile pathing params are cached at the beginning of a path search.
// Populated from Interface_NavigationHandle::SetupPathfindingParams()
struct native NavMeshPathParams
{
	/** the navhandle interface for the pathing entity */
	var native pointer Interface{IInterface_NavigationHandle};

	/** can this entity use mantle edges? */
	var bool bCanMantle;

	/** do we need to perform extra checks when determining if an edge supports the entiy? */
	var bool bNeedsMantleValidityTest;

	/**  is this entity valid to pathfind (does it have a pawn, etc..) */
	var bool bAbleToSearch;

	/** the size of the entity looking for a path */
	/* @NOTE: this will use the LARGEST of the X/Y dimensions.  Pathfinding extents must be symmetrical, so if the extent is not,
	   it will be made to be symmetric. (for long train-like objects path with the extent of the leader, and the rest will follow)
	   @see FNavMeshEdgeBase::Supports()
    */
	var Vector SearchExtent;
	var float  SearchLaneMultiplier;

	/** the starting location for the path search */
	var vector SearchStart;

	/** the maximum valid height for this entity to 'drop down' (e.g. max height to use on dropdown edges) */
	var float  MaxDropHeight;

	/** the minimum value for the Z component of walkable surfaces */
	var float MinWalkableZ;

	/** max hover distance -- the maximum distance this entity can hover above the surface of a polygon.  (-1 means arbitrarily high) */
	var float MaxHoverDistance;
};

// the cached path params for the current search
var NavMeshPathParams CachedPathParams;

/** when this bool is TRUE, statistics about which constraints are doing what will be printed following
 *  path searches
 */
var(PathDebug) bool bDebugConstraintsAndGoalEvals;

/**
 * when true TONS of information will be printed to the log, as well as a bunch of stuff drawn to the screen.
 * debug lines will be drawn indicating the progress of the path traversal, and whenever a log message is printed related
 * to an edge on the navmesh a number will be printed to the screen above it indexing into the log messages to tell you
 * what that message is.
 * RED lines indicate expansion was stopped at that step, other colors will change depending on the expansion generation
 * (e.g. all edges traversed in the first step will be of the same color, second step a different color etc..
 */
var(PathDebug) bool bUltraVerbosePathDebugging;

/** If true, only adds the visual parts of verbose path debugging, without the log spew */
var(PathDebug) bool bVisualPathDebugging;

/** 
 *  Relevant error code set by FindPath when a path search fails. 
 *  Allows decision on how to resolve a failed search by providing more information on the failure cause .
 *  Only valid if FindPath returns FALSE.  Safe to ignore otherwise.
 *  This value is not updated until the next search fails.
 */  
var(PathDebug) EPathFindingError    LastPathError;
var(PathDebug) float                LastPathFailTime;

/** max breadcrumbs - number of breadcrumbs to keep track of */
const NumBreadCrumbs = 10;
/** ring buffer of breadcrumb positions */
var vector Breadcrumbs[NumBreadCrumbs];
/** index that represents the most recent breadcrumb */
var int BreadCrumbMostRecentIdx;
/** bread crumb interval (how far we need to move before laying a new breadcrumb) */
var float BreadCrumbDistanceInterval;
/** draw breadcrumb debug info? */
var() bool bDebug_Breadcrumbs;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** 
 *  sets the pathcache to a copy of the passed path store
 *  @param PathStore - path store to copy over pathcache
 */
native function CopyPathStoreToPathCache(const out PathStore InStore);

/**
 * checks if we've moved far enough, and if so updates the breadcrumb trail 
 * @param Location - current location
 */
native function UpdateBreadCrumbs(vector InLocation);

/**
 * will return the most recent breadcrumb, and pop it off the list
 */
native function bool GetNextBreadCrumb(out vector out_BreadCrumbLoc);

/**
 * Path constraint operations
 * Allows the user to push a list of constraints which affect pathing heuristics, as well as determine when the path traversal is finished
 */
native function ClearConstraints();
native function AddPathConstraint( NavMeshPathConstraint Constraint );
native function AddGoalEvaluator( NavMeshPathGoalEvaluator Evaluator );

/**
 * returns whether or not pylon A has any path to Pylon B (useful for high level early outs)
 */
native function Pylon BuildFromPylonAToPylonB(Pylon A, Pylon B);

/**
 * returns whether or not pylon A has any path to Pylon B (useful for high level early outs)
 */
native function bool DoesPylonAHaveAPathToPylonB(Pylon A, Pylon B);

/**
* Path shaping creation functions...
* these functions by default will just new the class, but this offers a handy
* interface to override for to do things like pool the constraints
*/
function NavMeshPathConstraint CreatePathConstraint( class<NavMeshPathConstraint> ConstraintClass )
{
	return WorldInfo.GetNavMeshPathConstraintFromCache(ConstraintClass,self);
}
function NavMeshPathGoalEvaluator CreatePathGoalEvaluator( class<NavMeshPathGoalEvaluator> GoalEvalClass )
{
	return WorldInfo.GetNavMeshPathGoalEvaluatorFromCache(GoalEvalClass,self);
}

function int GetPathCacheLength()
{
	return PathCache.EdgeList.Length;
}

/** Path Cache Operations
 *	Allows operations on nodes in the route while modifying route (ie before emptying the cache)
 *	Should override in subclasses as needed
 */
native function bool PathCache_Empty();

/**
 *  After FindPath has been called this will return the location in the world that the pathfind found based on the NavMeshGoals
 *  the FindPath used.
 **/
native function vector PathCache_GetGoalPoint();
native function bool PathCache_RemoveIndex(int InIdx, int Count = 1);

/**
 * This will return the best "unfinished path".  We need this for things where we are using the navmesh to find locations which
 * are not connected (pathable) to the originating NavHandle but are still valid world positions.
 **/
native function vector GetBestUnfinishedPathPoint() const;

// finds the the pylon the AI attached to this handle is within
native function bool FindPylon();
// finds the pylon (if any) assoicated with the position passed
native static function Pylon GetPylonFromPos( vector Position );

/**
 * will return the actual point that we should move to right now to walk along our path
 * this will usually be a point along our current edge, but sometimes will
 * be something else in special situations (e.g. right on top of the edge)
 * @param out_MoveDest - output movement destination we have determined
 * @param ArrivalDistance - this tells getnextmovelocation how close to a point we have to be before MoveTo() returns
 *                          necessary so we can compesnate for early arrivals in some situations
 */
native function bool GetNextMoveLocation( out Vector out_MoveDest, float ArrivalDistance );

/**
 * lets the navigation handle know what the ultimate goal of the current move is
 * @param FinalDest - the destination desired
 * @return - whether or not the final destination is reachable
 */
native function bool SetFinalDestination(Vector FinalDest);

/**
 *  ComputeValidFinalDestination
 *  will find a valid, pathable point near the passed desired destination
 */
native function bool ComputeValidFinalDestination(out vector out_ComputedPosition);

/**
 * this will set up a path search, and ultimately call GeneratePath to do the A* path search
 * Note: it's up to your constraints to determine what it is you're doing.. if you're trying to
 *       path to a particular point you probably want to add a NavmeshGoal_At goal evaluator
 *       and supply it with the position you're pathing toward so the goal evaluator can stop the path search
 *       once the destination is found.  You also need a path constraint to provide a heuristic for the search,
 *       which typically is going to consist of at least a NavMeshPath_Toward which will weight based on
 *       euclidian distance to the goal.
 * @param out_DestActor - output variable which goal evaluators can use to supply the 'found' actor at path finish
 * @param out_DestItem  - output variable which goal evaluators can use to supply extra data to path search clients
 * @return - whether the path search was successful or not
 */
native function bool FindPath( optional out Actor out_DestActor, optional out int out_DestItem );

/**
 * this will notify our curretn edge we're about to traverse it, and allow that edge to perform custom actions for traversal
 * @param MovePt - the point we're about to move to
 * @param C      - controller we're suggesting move prep for
 * @return TRUE if the edge is handling getting the bot to the proper position for the move, FALSE if
 *         calling code is responsible for getting th bot to movept
 */
native function bool SuggestMovePreparation( out Vector MovePt, Controller C );

/**
 * does a line check against the obstacle mesh
 * @param Start - start of the line segment to check
 * @param End   - end position of the line segment to check
 * @param Extent - extent of box to be swept along line segment
 * @param out_HitLoc - hit location of obstacle line check (if any)
 * @param out_hitNorm - hit normal of surface we hit during obstacle line check (if any)
 * @return - TRUE if nothing was hit (note: only collides against the obstacle mesh, not the normal mesh)
 */
static native final function bool ObstacleLineCheck( vector Start, vector End, vector Extent, optional out vector out_HitLoc, optional out vector out_HitNorm );
/**
 * Does a point check against the obstacle mesh
 * @param Pt - centroid of box to check aginast obstacle mesh
 * @param Extent - Extent of box to check against obstacl mesh
 * @return - TRUE if didn't hit anything
 */
static native final function bool ObstaclePointCheck(vector Pt, vector Extent);

/**
 * does a line check against the Walkable mesh
 * @param Start - start of the line segment to check
 * @param End   - end position of the line segment to check
 * @param Extent - extent of box to be swept along line segment
 * @return - TRUE if nothing was hit
 */
native function bool LineCheck( vector Start, vector End, vector Extent, optional out vector out_HitLocation, optional out vector out_HitNormal );

/**
 * Does a point check against the Walkable mesh
 * @param Pt - centroid of box to check against obstacle mesh
 * @param Extent - Extent of box to check against obstacle mesh
 * @return - TRUE if didn't hit anything
 */
native function bool PointCheck( vector Pt, vector Extent );


/**
 * returns TRUE if Point/Actor is directly reachable
 * @param Point - point we want to test to
 * @param OverrideStartPoint (optional) - optional override for starting position of AI (default uses bot location)
 * @param bAllowHitsInEndCollisionBox (optional) - optional.. (defaults to ON) if this is true and a hit is detected that falls within the collision cylinder of the entity, let the hit pass
 * @return TRUE if the point is reachable
 */
native function bool PointReachable( Vector Point, optional Vector OverrideStartPoint, optional bool bAllowHitsInEndCollisionBox=true);
native function bool ActorReachable( Actor A );

// debug function for drawing cache polys
native function DrawPathCache(optional Vector DrawOffset, optional bool bPersistent, optional color DrawColor);

// debug function which prints out info about the current path cache
native function PrintPathCacheDebugText();

/**
 * for debugging.. will return descriptive text about the current edge 
 */
native function string GetCurrentEdgeDebugText();

/**
 * NULLs the currentedge reference 
 */
native function ClearCurrentEdge();

/**
 * @returns the edge type for the current edge (if any)
 */
native function ENavMeshEdgeType GetCurrentEdgeType();

/**
 * returns the center points of all polys within the specefied area
 * @param Pos - Center of bounds to check for polys
 * @param Extent - Extent of area to return
 * @param out_PolyCtrs - out var of poly centers within the specefied area
 */
native static function GetAllPolyCentersWithinBounds(Vector Pos, Vector Extent, out Array<Vector> out_PolyCtrs);

/**
 * will return a list of valid spots on the mesh which fit the passed extent and are within radius to Pos
 * @param Pos - Center of bounds to check for polys
 * @param Radius - radius from Pos to find valid positions within
 * @param Extent - Extent of entity we're finding a spot for
 * @param bMustBeReachableFromStartPos - if TRUE, only positions which are directly reachable from the starting position will be returned
 * @param ValidPositions - out var of valid positions for the passed entity size
 * @param MaxPositions - the maximum positions needed (e.g. the search for valid positions will stop after this many have been found)
 * @param MinRadius    - minimum distance from center position to potential spots (default 0)
 * @param ValidBoxAroundStartPos - when bMustBeReachableFromStartPos is TRUE, all hits that are within this AABB of the start pos will be considered valid
 */
native static function GetValidPositionsForBox(Vector Pos, float Radius, Vector Extent, bool bMustBeReachableFromStartPos, out Array<Vector> out_ValidPositions, optional int MaxPositions=-1, optional float MinRadius, optional vector ValidBoxAroundStartPos=vect(0,0,0));

/**
 * will clip off edges from the pathcache which are greater than the specified distance from the start of the path
 * @param MaxDist - the maximum distance for the path
 */
native function LimitPathCacheDistance(float MaxDist);

/**
 * this function will determine if the poly this entity is currently in is inescapable by that entity
 * @return TRUE If the poly this handle is in isn't escapable
 */
native function bool IsAnchorInescapable();

/**
 * this will a good point on the first edge in the pathcache (or the finaldest if there is no pathcache)
 */
native function vector GetFirstMoveLocation();

/**
 * this will calculate the optimal edge positions along the pathcache, and add up the distances
 * to generate an accurate distance that will be travelled along the current path
 * Note: includes distance to final destination
 * @param FinalDest - optional finaldest override (if not passed will use NavigationHandle.FinalDestination)
 * @return - the path distance calculated
 */
native function float CalculatePathDistance(optional Vector FinalDest);

/**
 * Copies over move points into the passed vector array
 * @param FinalDest - 
 * @param out_MovePoints - array to be stuffed with move points
  */
native function CopyMovePointsFromPathCache(Vector FinalDest, out array<vector> out_MovePoints);

/**
 * this will take the given position and attempt to move it the passed height above the poly that point is in (along a cardinal axis)
 * @param Point - point to adjust
 * @param Height - height above mesh you would like
 * @return Adjusted point
 */
static native function Vector MoveToDesiredHeightAboveMesh(vector Point, float Height);

/**
 * This will attempt to grab an interface_navigationhandle from outer, and have that interface populate
 * our cached pathing params.
 * @return TRUE if cache population was succesful
 */
native final function bool PopulatePathfindingParamCache();

/**
 * Gather all cover slot info within radius of the given point
 * @param FromLoc - location at center of sphere to check
 * @param Radius - radius of sphere within which to gather cover
 * @param out_CoverList - out array filled with cover infos within radius
 * @return TRUE if found any cover
 */
static native final function bool GetAllCoverSlotsInRadius( Vector FromLoc, FLOAT Radius, out array<CoverInfo> out_CoverList );

/** 
 * will get a point nearby which is in a poly that has edges outbound that support this AI
 * @param out_NewAnchorLoc - out param stuffed with the position we found
 * @param OverrideStartLoc - optional param to override the starting location for this query (if none is given this AI's searchstart will be used)
 * @return - TRUE if we found a spot
 */
native final function bool GetValidatedAnchorPosition(out vector out_NewAnchorLoc, optional vector OverrideStartLoc );

/** 
 * will get a point nearby which is in a poly that has edges outbound that support this AI
 * @param out_NewAnchorLoc - out param stuffed with the position we found
 * @param StartCheckBaseLocation - location to start looking (to find poitns near)
 * @param Extent - extent of the AI we're trying to find a spot for
 * @return - TRUE if we found a spot
 */
static native final function bool StaticGetValidatedAnchorPosition(out vector out_NewAnchorLoc, Vector StartCheckBaseLocation, Vector Extent );

function DrawBreadCrumbs(bool bPersistent=false)
{


	local int i,count;
	local vector lastPt,curPt;

	if( bDebug_Breadcrumbs )
	{
		if( bPersistent) FlushPersistentDebugLines();
		for(i=BreadCrumbMostRecentIdx;count < NumBreadCrumbs; ++count)
		{
			curPt = Breadcrumbs[i];
			if( curPt == vect(0,0,0) )
			{
				break;
			}
			if( lastPt != vect(0,0,0) && count < NumBreadCrumbs-1)
			{
				DrawDebugLine(curPt,LastPt,0,255,0,bPersistent);
			}

			DrawDebugBox(curPt,vect(5,5,5),0,0,255,bPersistent);
			--i;
			if( i<0 )
			{
				i=NumBreadCrumbs-1;
			}
			lastPt=CurPt;
		}
	}
	
}

defaultproperties
{
   BreadCrumbDistanceInterval=75.000000
   Name="Default__NavigationHandle"
   ObjectArchetype=Object'Core.Default__Object'
}
