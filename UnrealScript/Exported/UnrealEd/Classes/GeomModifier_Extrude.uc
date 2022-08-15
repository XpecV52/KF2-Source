/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Extrudes selected objects.
 */
class GeomModifier_Extrude
	extends GeomModifier_Edit
	native;
	
var(Settings)	int		Length;
var(Settings)	int		Segments;

var int					SaveCoordSystem;

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

	/**
	 * Gives the individual modifiers a chance to do something the first time they are activated.
	 */
	virtual void Initialize();

	virtual void WasActivated();

	virtual void WasDeactivated();

protected:
	/**
	 * Implements the modifier application.
	 */
 	virtual UBOOL OnApply();

 	
private:
 	void Apply(INT InLength, INT InSegments);

}


defaultproperties
{
   Length=16
   Segments=1
   Description="Extrude"
   Name="Default__GeomModifier_Extrude"
   ObjectArchetype=GeomModifier_Edit'UnrealEd.Default__GeomModifier_Edit'
}
