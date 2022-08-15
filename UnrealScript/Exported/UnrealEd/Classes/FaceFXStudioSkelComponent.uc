/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class FaceFXStudioSkelComponent extends SkeletalMeshComponent
	native;

var transient native const pointer RenderWidgetUE3Ptr;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// UPrimitiveComponent interface.
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

}


defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__FaceFXStudioSkelComponent"
   ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
}
