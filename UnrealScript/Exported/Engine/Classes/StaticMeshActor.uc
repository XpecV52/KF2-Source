//=============================================================================
// StaticMeshActor.
// An actor that is drawn using a static mesh(a mesh that never changes, and
// can be cached in video memory, resulting in a speed boost).
// Note that PostBeginPlay() and SetInitialState() are never called for StaticMeshActors
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class StaticMeshActor extends StaticMeshActorBase
	native
	placeable;

var() const editconst StaticMeshComponent	StaticMeshComponent;

/** If checked, this actor will not try to set its base to any proc building below it.*/
var() editoronly bool bDisableAutoBaseOnProcBuilding;

/**
 * If checked, this actor is a proxy built from other (now hidden) actors.
 * This should only be true, if it can be reverted to the actors it was constructed from!
 */
var private editoronly bool bProxy;

/**
 * If checked, this actor is one of the actors that was used to create a proxy
 * This should only be true, if it can be reverted to it's previous state
 */
var private editoronly bool bHiddenByProxy;

/**
 * We need to disable lighting/shadows when bHiddenByProxy is true, but we need to
 * revert to it's previous state when it returns to false, so use this to track it
 */
var private editoronly bool OldCastShadow;
var private editoronly bool OldAcceptsLights;
var private editoronly ECollisionType OldCollisionType;


var transient matrix DefaultLocalToWorld;
var transient bool bResetCapable;



/** Structure to hold info about precombined actor to recreate old actors */
struct native PreCombinedStaticMeshActor
{
		var StaticMesh  mesh;
		var vector Location;
		var rotator Rotation;
		var vector PrePivot;
		var float DrawScale;
		var vector DrawScale3D;
		var vector ComponentScale3D;
};
var () editoronly array  <PreCombinedStaticMeshActor> PreCombinedStaticMeshActors;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event PreBeginPlay() {}


native function ResetToDefaults();

/** Reset dynamic static mesh actors */
simulated event Reset()
{
	if( bResetCapable )
	{
		ResetToDefaults();
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      RBCollideWithChannels=(Visibility=True)
      bAcceptReflections=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   OldCollisionType=COLLIDE_NoCollision
   Components(0)=StaticMeshComponent0
   CollisionType=COLLIDE_BlockAll
   BlockRigidBody=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__StaticMeshActor"
   ObjectArchetype=StaticMeshActorBase'Engine.Default__StaticMeshActorBase'
}
