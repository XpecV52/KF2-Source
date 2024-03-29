/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This is the skeletal mesh label renderer
 */
class SkeletalMeshLabelRenderer extends ThumbnailLabelRenderer
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

cpptext
{
protected:
	/**
	 * Adds the name of the object and information about the mesh
	 *
	 * @param Object the object to build the labels for
	 * @param OutLabels the array that is added to
	 */
	void BuildLabelList(UObject* Object, const ThumbnailOptions& InOptions, TArray<FString>& OutLabels);

}


defaultproperties
{
   Name="Default__SkeletalMeshLabelRenderer"
   ObjectArchetype=ThumbnailLabelRenderer'UnrealEd.Default__ThumbnailLabelRenderer'
}
