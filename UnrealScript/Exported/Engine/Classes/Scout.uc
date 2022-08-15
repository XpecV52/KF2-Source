//=============================================================================
// Scout used for path generation.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Scout extends Pawn
	native(Pawn)
	config(Game)
	notplaceable
	transient
	dependsOn(ReachSpec);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

struct native PathSizeInfo
{
	var Name		Desc;
	var	float		Radius,
					Height,
					CrouchHeight;
	var byte		PathColor;
};
var array<PathSizeInfo>			PathSizes;		// dimensions of reach specs to test for
var float						TestJumpZ,
								TestGroundSpeed,
								TestMaxFallSpeed,
								TestFallSpeed;

var const float MaxLandingVelocity;

var int MinNumPlayerStarts;

/** Specifies the default class to use when constructing reachspecs connecting NavigationPoints */
var class<ReachSpec> DefaultReachSpecClass;

//////////////////////////////////////////////////////////////////////////
// Navigation Mesh generation configuration parameters					//
//////////////////////////////////////////////////////////////////////////

// EdgePathColors                      - color to draw edges at the given index
var array<Color> EdgePathColors;

// NavMeshGen_StepSize                 - Size of our expansion step. (also the size of the base square added at each step to the mesh)
var float NavMeshGen_StepSize;

// NavMeshGen_EntityHalfHeight         - half height of expansion tests done (this should be the half height of your smallest pathing entity)
var float NavMeshGen_EntityHalfHeight;

// NavMeshGen_StartingHeightOffset     - starting offset for ground checks done during each expansion step
var float NavMeshGen_StartingHeightOffset;

// NavMeshGen_MaxDropHeight            - maximum valid height for ledges to drop before no expansion is allowed
var float NavMeshGen_MaxDropHeight;

// NavMeshGen_MaxStepHeight            - maximum height to consider valid for step-ups
var float NavMeshGen_MaxStepHeight;

// NavMeshGen_VertZDeltaSnapThresh     - when two potential vert locations are within stepheight, but greater than this threshold
//                                       a line check is done to snap the new shared vert to the ground
//										 (should probably be about half of max step height)
var float NavMeshGen_VertZDeltaSnapThresh;

// NavMeshGen_MinPolyArea              - minimum area of polygons (below threshold will be culled)
var float NavMeshGen_MinPolyArea;

// NavMeshGen_BorderBackfill_CheckDist - size around each vertex to check for other verts which might be candidates for backfilling
var float NavMeshGen_BorderBackfill_CheckDist;

// NavMeshGen_MinMergeDotAreaThreshold - multiplier of NAVMESHGEN_STEP_SIZE used to determine if small area mindot or large area mindot should be used
var float NavMeshGen_MinMergeDotAreaThreshold;

// NavMeshGen_MinMergeDotSmallArea     - minimum dot product necessary for merging polys of an area below NAVMESHGEN_MERGE_DOT_AREA_THRESH
var float NavMeshGen_MinMergeDotSmallArea;

// NavMeshGen_MinMergeDotLargeArea     - minimum dot product necessary for merging polys of an area above NAVMESHGEN_MERGE_DOT_AREA_THRESH
var float NavMeshGen_MinMergeDotLargeArea;

// NavMeshGen_MaxPolyHeight		       - maximum height to check height against (should be the height of your biggest entity)
var float NavMeshGen_MaxPolyHeight;

// NavMeshGen_HeightMergeThreshold     - height threshold used when determining if two polys can be merged (e.g. if the two poly heights are within this value, they are OK to merge)
var float NavMeshGen_HeightMergeThreshold;

// NavMeshGen_EdgeCreationThreshold    - the maximum distance off projected points along paralell edges
var float NavMeshGen_EdgeMaxDelta;

// NavMeshGen_MaxGroundCheckSize       - the maximum size (used as Extent X/Y on ground check) to be used for ground checks. this is useful to allow large step sizes, while still maintaining
//										 ground check resolution.
var float NavMeshGen_MaxGroundCheckSize;

// NavMeshGen_MinEdgeLength				- minimum length for an edge.  Edges shorter than this value will be thrown out
var float NavMeshGen_MinEdgeLength;
///////////////////////////////////////////////////////////////////

// NavMeshGen_ExpansionDoObstacleMeshSimplification           - simplify the obstacle mesh with a basic poly merge??
var bool NavMeshGen_ExpansionDoObstacleMeshSimplification;

/** when this is TRUE a dashed-red line will be drawn across the gap of a one-way edge to highlight those situations */
var() bool bHightlightOneWayReachSpecs;


//**  these vars are used when automatically generating mantles.
var		float			 MinMantleFallDist;
var		float			 MaxMantleFallDist;
var		float			 MinMantleLateralDist;
var		float			 MaxMantleLateralDist;
var     float            MaxMantleFallTime;

simulated event PreBeginPlay()
{
	// make sure this scout has all collision disabled
	if (bCollideActors)
	{
		SetCollision(FALSE,FALSE);
	}
}

defaultproperties
{
   PathSizes(0)=(Desc="Human",Radius=48.000000,Height=80.000000)
   PathSizes(1)=(Desc="Common",Radius=72.000000,Height=100.000000)
   PathSizes(2)=(Desc="Max",Radius=120.000000,Height=120.000000)
   PathSizes(3)=(Desc="Vehicle",Radius=260.000000,Height=120.000000)
   TestJumpZ=420.000000
   TestGroundSpeed=600.000000
   TestMaxFallSpeed=2500.000000
   TestFallSpeed=1200.000000
   MinNumPlayerStarts=1
   DefaultReachSpecClass=Class'Engine.ReachSpec'
   EdgePathColors(0)=(B=255,G=0,R=0,A=0)
   EdgePathColors(1)=(B=0,G=255,R=0,A=0)
   EdgePathColors(2)=(B=0,G=0,R=255,A=0)
   EdgePathColors(3)=(B=255,G=255,R=0,A=0)
   NavMeshGen_StepSize=30.000000
   NavMeshGen_EntityHalfHeight=72.000000
   NavMeshGen_StartingHeightOffset=65.000000
   NavMeshGen_MaxDropHeight=60.000000
   NavMeshGen_MaxStepHeight=35.000000
   NavMeshGen_VertZDeltaSnapThresh=20.000000
   NavMeshGen_MinPolyArea=25.000000
   NavMeshGen_BorderBackfill_CheckDist=70.000000
   NavMeshGen_MinMergeDotAreaThreshold=2.000000
   NavMeshGen_MinMergeDotLargeArea=0.950000
   NavMeshGen_MaxPolyHeight=160.000000
   NavMeshGen_HeightMergeThreshold=10.000000
   NavMeshGen_EdgeMaxDelta=2.000000
   NavMeshGen_MaxGroundCheckSize=30.000000
   NavMeshGen_MinEdgeLength=7.000000
   NavMeshGen_ExpansionDoObstacleMeshSimplification=True
   AccelRate=1.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Pawn:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Pawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   RemoteRole=ROLE_None
   bCollideActors=False
   bCollideWorld=False
   bBlockActors=False
   bProjTarget=False
   bPathColliding=True
   CollisionComponent=CollisionCylinder
   Name="Default__Scout"
   ObjectArchetype=Pawn'Engine.Default__Pawn'
}
