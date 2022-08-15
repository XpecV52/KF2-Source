//=============================================================================
// ReachSpec.
//
// A Reachspec describes the reachability requirements between two NavigationPoints
//
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ReachSpec extends Object
	native;

const BLOCKEDPATHCOST = 10000000; // any path cost >= this value indicates the path is blocked to the pawn

/** pointer to object in navigation octree */
var native transient const editconst pointer NavOctreeObject{struct FNavigationOctreeObject};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var	int		Distance;
var Vector	Direction;	// only valid when both start/end are static
var() const editconst NavigationPoint	Start;		// navigationpoint at start of this path
var() const editconst ActorReference	End;
var() const editconst int				CollisionRadius;
var() const editconst int				CollisionHeight;

var bool								bManuallyForced;
var() const editconst int				reachFlags;					// see EReachSpecFlags definition in UnPath.h
var() const editconst int				MaxLandingVelocity;





var	byte	bPruned;
var byte	PathColorIndex;				// used to look up pathcolor, set when reachspec is created
/** whether or not this ReachSpec should be added to the navigation octree */
var const editconst bool bAddToNavigationOctree;
/** If true, pawns moving along this path can cut corners transitioning between this reachspec and adjacent reachspecs */

var() bool bCanCutCorners;




/** whether AI should check for dynamic obstructions (Actors with bBlocksNavigation=true) when traversing this ReachSpec */

var() bool bCheckForObstructions;




/** Prune paths should skip trying to prune along these */
var const bool	bSkipPrune;
/** Can always prune against these types of specs (even though class doesn't match) */
var const array< class<ReachSpec> > PruneSpecList;

/** Actor that is blocking this ReachSpec, making it temporarily unusable */
var Actor BlockedBy;
/** Reachspec has been disabled/blocked by kismet */
var() editconst bool  bDisabled;

/** CostFor()
Returns the "cost" in unreal units
for Pawn P to travel from the start to the end of this reachspec
*/
native final noexport function int CostFor(Pawn P);

/**
 * Returns nav point reference at end of spec
 */
native final noexport function NavigationPoint GetEnd();

/**
 * Returns direction of this reach spec (considers non-static nodes)
 */
native final noexport function Vector GetDirection();

function bool IsBlockedFor(Pawn P)
{
	return (CostFor(P) >= BLOCKEDPATHCOST);
}


function int GetCostFor(Pawn P)
{
	return CostFor(P);
}

defaultproperties
{
   bAddToNavigationOctree=True
   bCanCutCorners=True
   bCheckForObstructions=True
   Name="Default__ReachSpec"
   ObjectArchetype=Object'Core.Default__Object'
}
