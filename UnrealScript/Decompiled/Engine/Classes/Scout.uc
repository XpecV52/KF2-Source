/*******************************************************************************
 * Scout generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Scout extends Pawn
    transient
    native(Pawn)
    config(Game)
    notplaceable
    hidecategories(Navigation);

struct native PathSizeInfo
{
    var name Desc;
    var float Radius;
    var float Height;
    var float CrouchHeight;
    var byte PathColor;

    structdefaultproperties
    {
        Desc=None
        Radius=0
        Height=0
        CrouchHeight=0
        PathColor=0
    }
};

var array<PathSizeInfo> PathSizes;
var float TestJumpZ;
var float TestGroundSpeed;
var float TestMaxFallSpeed;
var float TestFallSpeed;
var const float MaxLandingVelocity;
var int MinNumPlayerStarts;
var class<ReachSpec> DefaultReachSpecClass;
var array<Color> EdgePathColors;
var float NavMeshGen_StepSize;
var float NavMeshGen_EntityHalfHeight;
var float NavMeshGen_StartingHeightOffset;
var float NavMeshGen_MaxDropHeight;
var float NavMeshGen_MaxStepHeight;
var float NavMeshGen_VertZDeltaSnapThresh;
var float NavMeshGen_MinPolyArea;
var float NavMeshGen_BorderBackfill_CheckDist;
var float NavMeshGen_MinMergeDotAreaThreshold;
var float NavMeshGen_MinMergeDotSmallArea;
var float NavMeshGen_MinMergeDotLargeArea;
var float NavMeshGen_MaxPolyHeight;
var float NavMeshGen_HeightMergeThreshold;
var float NavMeshGen_EdgeMaxDelta;
var float NavMeshGen_MaxGroundCheckSize;
var float NavMeshGen_MinEdgeLength;
var bool NavMeshGen_ExpansionDoObstacleMeshSimplification;
/** when this is TRUE a dashed-red line will be drawn across the gap of a one-way edge to highlight those situations */
var() bool bHightlightOneWayReachSpecs;
var float MinMantleFallDist;
var float MaxMantleFallDist;
var float MinMantleLateralDist;
var float MaxMantleLateralDist;
var float MaxMantleFallTime;

simulated event PreBeginPlay()
{
    if(bCollideActors)
    {
        SetCollision(false, false);
    }
}

defaultproperties
{
    PathSizes(0)=(Desc=Human,Radius=48,Height=80,CrouchHeight=0,PathColor=0)
    PathSizes(1)=(Desc=Common,Radius=72,Height=100,CrouchHeight=0,PathColor=0)
    PathSizes(2)=(Desc=Max,Radius=120,Height=120,CrouchHeight=0,PathColor=0)
    PathSizes(3)=(Desc=Vehicle,Radius=260,Height=120,CrouchHeight=0,PathColor=0)
    TestJumpZ=420
    TestGroundSpeed=600
    TestMaxFallSpeed=2500
    TestFallSpeed=1200
    MinNumPlayerStarts=1
    DefaultReachSpecClass=Class'ReachSpec'
    EdgePathColors(0)=
/* Exception thrown while deserializing EdgePathColors
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.UnrealStreamImplementations.ReadName(IUnrealStream stream)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    EdgePathColors(1)=(NavMeshGen_StepSize=30,NavMeshGen_EntityHalfHeight=72,NavMeshGen_StartingHeightOffset=65,NavMeshGen_MaxDropHeight=60,NavMeshGen_MaxStepHeight=35,NavMeshGen_VertZDeltaSnapThresh=20,NavMeshGen_MinPolyArea=25,NavMeshGen_BorderBackfill_CheckDist=70,NavMeshGen_MinMergeDotAreaThreshold=2,NavMeshGen_MinMergeDotLargeArea=0.95,NavMeshGen_MaxPolyHeight=160,NavMeshGen_HeightMergeThreshold=10,NavMeshGen_EdgeMaxDelta=2,NavMeshGen_MaxGroundCheckSize=30,NavMeshGen_MinEdgeLength=7,NavMeshGen_ExpansionDoObstacleMeshSimplification=true,AccelRate=1,CylinderComponent=CylinderComponent'Default__Scout.CollisionCylinder',Components=(CylinderComponent'Default__Scout.CollisionCylinder'),RemoteRole=ENetRole.ROLE_None,bCollideActors=false,bCollideWorld=false,bBlockActors=false,bProjTarget=false,bPathColliding=true,CollisionComponent=CylinderComponent'Default__Scout.CollisionCylinder')
    EdgePathColors(2)=
/* Exception thrown while deserializing EdgePathColors
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.__Error.EndOfFile()
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadInt32()
   at UELib.UnrealReader.ReadNameIndex(Int32& num)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    EdgePathColors(3)=
/* Exception thrown while deserializing EdgePathColors
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.__Error.EndOfFile()
   at System.IO.BinaryReader.FillBuffer(Int32 numBytes)
   at System.IO.BinaryReader.ReadInt32()
   at UELib.UnrealReader.ReadNameIndex(Int32& num)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    NavMeshGen_StepSize=30
    NavMeshGen_EntityHalfHeight=72
    NavMeshGen_StartingHeightOffset=65
    NavMeshGen_MaxDropHeight=60
    NavMeshGen_MaxStepHeight=35
    NavMeshGen_VertZDeltaSnapThresh=20
    NavMeshGen_MinPolyArea=25
    NavMeshGen_BorderBackfill_CheckDist=70
    NavMeshGen_MinMergeDotAreaThreshold=2
    NavMeshGen_MinMergeDotLargeArea=0.95
    NavMeshGen_MaxPolyHeight=160
    NavMeshGen_HeightMergeThreshold=10
    NavMeshGen_EdgeMaxDelta=2
    NavMeshGen_MaxGroundCheckSize=30
    NavMeshGen_MinEdgeLength=7
    NavMeshGen_ExpansionDoObstacleMeshSimplification=true
    AccelRate=1
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__Scout.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__Scout.CollisionCylinder'
    Components(0)=CollisionCylinder
    RemoteRole=ENetRole.ROLE_None
    bCollideActors=false
    bCollideWorld=false
    bBlockActors=false
    bProjTarget=false
    bPathColliding=true
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__Scout.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}