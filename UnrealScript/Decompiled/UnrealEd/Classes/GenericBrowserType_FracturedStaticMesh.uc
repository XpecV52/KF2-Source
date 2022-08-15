/*******************************************************************************
 * GenericBrowserType_FracturedStaticMesh generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GenericBrowserType_FracturedStaticMesh extends GenericBrowserType_StaticMesh
    native
    hidecategories(Object,GenericBrowserType);

cpptext
{
	virtual void Init();

	/**
	 * Returns a list of commands that this object supports (or the object type supports, if InObject is NULL)
	 *
	 * @param	InObjects		The objects to query commands for (if NULL, query commands for all objects of this type.)
	 * @param	OutCommands		The list of custom commands to support
	 */
	virtual void QuerySupportedCommands( class USelection* InObjects, TArray< FObjectSupportedCommandType >& OutCommands ) const;

	virtual void InvokeCustomCommand( INT InCommand, TArray<UObject*>& InObjects );

}

defaultproperties
{
    Description="Fractured Static Meshes"
}