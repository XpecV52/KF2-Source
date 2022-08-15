/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//-----------------------------------------------------------
// Browser type for prefabs
//-----------------------------------------------------------
class GenericBrowserType_Prefab extends GenericBrowserType
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Init();
	virtual UBOOL ShowObjectEditor( UObject* InObject );

}


defaultproperties
{
   Description="Prefabs"
   Name="Default__GenericBrowserType_Prefab"
   ObjectArchetype=GenericBrowserType'UnrealEd.Default__GenericBrowserType'
}
