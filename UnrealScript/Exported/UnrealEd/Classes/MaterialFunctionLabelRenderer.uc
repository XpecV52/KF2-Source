/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This is the material function label renderer.
 */
class MaterialFunctionLabelRenderer extends ThumbnailLabelRenderer
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
	 * Adds the name of the object and information about the material function.
	 *
	 * @param Object		The object to build the labels for.
	 * @param OutLabels		The array that is added to.
	 */
	void BuildLabelList(UObject* Object, const ThumbnailOptions& InOptions, TArray<FString>& OutLabels);

}


defaultproperties
{
   Name="Default__MaterialFunctionLabelRenderer"
   ObjectArchetype=ThumbnailLabelRenderer'UnrealEd.Default__ThumbnailLabelRenderer'
}
