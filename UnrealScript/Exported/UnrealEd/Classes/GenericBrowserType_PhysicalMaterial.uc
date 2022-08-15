/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// GenericBrowserType_PhysicalMaterial: Physical properties of a material
//=============================================================================

class GenericBrowserType_PhysicalMaterial
	extends GenericBrowserType
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
   Description="Physical Materials"
   Name="Default__GenericBrowserType_PhysicalMaterial"
   ObjectArchetype=GenericBrowserType'UnrealEd.Default__GenericBrowserType'
}
