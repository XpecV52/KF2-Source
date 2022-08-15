/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Optimizes selected objects by attempting to merge their polygons back together.
 */
class GeomModifier_Optimize
	extends GeomModifier_Edit
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
	

cpptext
{
	/**
	 * @return		TRUE if this modifier will work on the currently selected sub objects.
	 */
	virtual UBOOL Supports();

protected:
	/**
	 * Implements the modifier application.
	 */
 	virtual UBOOL OnApply();

}


defaultproperties
{
   Description="Optimize"
   bPushButton=True
   Name="Default__GeomModifier_Optimize"
   ObjectArchetype=GeomModifier_Edit'UnrealEd.Default__GeomModifier_Edit'
}
