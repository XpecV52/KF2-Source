/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This is a simple thumbnail label renderer for fonts that
 * lists info about the font that was imported
 */
class FontThumbnailLabelRenderer extends ThumbnailLabelRenderer
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
	 * Adds the name of the object and font import info
	 *
	 * @param Object the object to build the labels for
	 * @param OutLabels the array that is added to
	 */
	void BuildLabelList(UObject* Object, const ThumbnailOptions& InOptions, TArray<FString>& OutLabels);

}


defaultproperties
{
   Name="Default__FontThumbnailLabelRenderer"
   ObjectArchetype=ThumbnailLabelRenderer'UnrealEd.Default__ThumbnailLabelRenderer'
}
