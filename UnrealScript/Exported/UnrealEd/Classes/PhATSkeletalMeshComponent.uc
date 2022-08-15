/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class PhATSkeletalMeshComponent extends SkeletalMeshComponent
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient native const pointer	PhATPtr;

/** Mesh-space matrices showing state of just animation (ie before physics) - useful for debugging! */
var transient native const array<AnimNode.BoneAtom>	AnimationSpaceBases;

cpptext
{
	// UPrimitiveComponent interface.
	virtual void Render(const FSceneView* View, class FPrimitiveDrawInterface* PDI);
	virtual void RenderHitTest(const FSceneView* View,class FPrimitiveDrawInterface* PDI);

	/**
	 * Creates a proxy to represent the primitive to the scene manager in the rendering thread.
	 * @return The proxy object.
	 */
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

	// PhATSkeletalMeshComponent interface
	void RenderAssetTools(const FSceneView* View, class FPrimitiveDrawInterface* PDI, UBOOL bHitTest);
	void DrawHierarchy(FPrimitiveDrawInterface* PDI, UBOOL bAnimSkel);

}


defaultproperties
{
   Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0
      bLooping=True
      Name="AnimNodeSeq0"
      ObjectArchetype=AnimNodeSequence'Engine.Default__AnimNodeSequence'
   End Object
   Animations=AnimNodeSequence'UnrealEd.Default__PhATSkeletalMeshComponent:AnimNodeSeq0'
   PhysicsWeight=1.000000
   ForcedLodModel=1
   bUpdateJointsFromAnimation=True
   ReplacementPrimitive=None
   RBCollideWithChannels=(Default=True)
   Name="Default__PhATSkeletalMeshComponent"
   ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
}
