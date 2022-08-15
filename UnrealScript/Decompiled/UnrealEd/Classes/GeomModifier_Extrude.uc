/*******************************************************************************
 * GeomModifier_Extrude generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeomModifier_Extrude extends GeomModifier_Edit
    native
    hidecategories(Object,GeomModifier);

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

var(Settings) int Length;
var(Settings) int Segments;
var int SaveCoordSystem;

defaultproperties
{
    Length=16
    Segments=1
    Description="Extrude"
}