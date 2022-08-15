/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LensFlareEditorPropertyWrapper extends Object
	native
	dontcollapsecategories
	hidecategories(Object);

/** The element being displayed the lens flare */
var()	LensFlareElement		Element;

/** The lens flare being edited. */
var	private const LensFlare		SourceLensFlare;
/** The index of the element being edited. */
var private const int			ElementIndex;

//
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//

cpptext
{
	// UObject interface.
	virtual void PreEditChange(UProperty* PropertyAboutToChange);
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   Name="Default__LensFlareEditorPropertyWrapper"
   ObjectArchetype=Object'Core.Default__Object'
}
