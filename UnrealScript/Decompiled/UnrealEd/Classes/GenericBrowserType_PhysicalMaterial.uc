/*******************************************************************************
 * GenericBrowserType_PhysicalMaterial generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GenericBrowserType_PhysicalMaterial extends GenericBrowserType
    native
    hidecategories(Object,GenericBrowserType);

cpptext
{
	virtual void Init();
	virtual UBOOL ShowObjectEditor( UObject* InObject );

}

defaultproperties
{
    Description="Physical Materials"
}