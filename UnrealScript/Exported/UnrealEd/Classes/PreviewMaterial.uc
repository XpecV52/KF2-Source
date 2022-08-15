/**
 * MaterialEditorInstanceConstant.uc: This class is used by the material instance editor to hold a set of inherited parameters which are then pushed to a material instance.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class PreviewMaterial extends Material
	native
	dependson(Material);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/**
	 * Allocates a material resource off the heap to be stored in MaterialResource.
	 */
	virtual FMaterialResource* AllocateResource();

}


defaultproperties
{
   Name="Default__PreviewMaterial"
   ObjectArchetype=Material'Engine.Default__Material'
}
