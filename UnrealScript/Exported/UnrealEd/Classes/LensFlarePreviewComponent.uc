/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LensFlarePreviewComponent extends PrimitiveComponent
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var native transient const pointer	LensFlareEditorPtr{class WxLensFlareEditor};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Render(const FSceneView* View,FPrimitiveDrawInterface* PDI);

}


defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__LensFlarePreviewComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
