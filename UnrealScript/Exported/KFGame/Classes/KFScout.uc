//=============================================================================
// KFScout
//=============================================================================
// KF2 scout class used when generating AI paths
//=============================================================================
// Killing Floor 2
// Copyright (C) 2012-2013 Tripwire Interactive LLC
//=============================================================================
class KFScout extends Scout
	native(AI);

var config bool						bReplacePathNodesWithKFPathNodes;
var config bool						bDebugReplacePathNodes;
var array< class<KFPawn> >			PrototypePawnClasses;
var int								PrototypeIndex;
var transient array<KFDoorMarker>	KFDoorMarkerList;
var float							TestSprintSpeed;
var float							TestHiddenGroundSpeed;
var float							DefaultMaxFallSpeed;
var float							DefaultJumpZ;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   PrototypePawnClasses(0)=Class'KFGame.KFPawn_Monster'
   DefaultMaxFallSpeed=500.000000
   DefaultJumpZ=650.000000
   PathSizes(0)=(Desc="ClotsAllSirenStalker",Radius=36.000000,Height=90.000000)
   PathSizes(1)=(Desc="Human",Radius=40.000000,Height=90.000000)
   PathSizes(2)=(Desc="Crawler",Radius=48.000000,Height=48.000000)
   PathSizes(3)=(Desc="GoreFastHusk",Radius=48.000000,Height=90.000000)
   PathSizes(4)=(Desc="BloatScrakeFleshPoundHans",Radius=55.000000,Height=90.000000)
   PathSizes(5)=(Desc="Max",Radius=120.000000,Height=120.000000)
   TestJumpZ=650.000000
   TestGroundSpeed=500.000000
   TestMaxFallSpeed=500.000000
   DefaultReachSpecClass=Class'KFGame.KFReachSpec'
   EdgePathColors(0)=(B=255,G=0,R=0,A=255)
   EdgePathColors(1)=(B=47,G=255,R=173,A=255)
   EdgePathColors(2)=(B=0,G=128,R=0,A=255)
   EdgePathColors(3)=(B=0,G=255,R=0,A=255)
   EdgePathColors(4)=(B=255,G=255,R=255,A=0)
   EdgePathColors(5)=(B=180,G=105,R=255,A=255)
   NavMeshGen_MaxDropHeight=250.000000
   NavMeshGen_MaxStepHeight=40.000000
   NavMeshGen_MaxPolyHeight=200.000000
   bHightlightOneWayReachSpecs=True
   MaxStepHeight=70.000000
   MaxJumpHeight=128.000000
   bCanJumpOverWalls=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Scout:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Scout:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFScout"
   ObjectArchetype=Scout'Engine.Default__Scout'
}
