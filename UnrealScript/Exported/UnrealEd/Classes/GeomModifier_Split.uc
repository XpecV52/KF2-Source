/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Splits selected objects.
 */
class GeomModifier_Split
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
   Description="Split"
   bPushButton=True
   Name="Default__GeomModifier_Split"
   ObjectArchetype=GeomModifier_Edit'UnrealEd.Default__GeomModifier_Edit'
}
