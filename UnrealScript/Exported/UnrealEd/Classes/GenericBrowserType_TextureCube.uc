/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// GenericBrowserType_TextureCube: Generic browser type for cubemaps
//=============================================================================

class GenericBrowserType_TextureCube
	extends GenericBrowserType_Texture
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
	

cpptext
{
	/** Initialize this generic browser type */
	virtual void Init();

}


defaultproperties
{
   Description="TextureCubes"
   Name="Default__GenericBrowserType_TextureCube"
   ObjectArchetype=GenericBrowserType_Texture'UnrealEd.Default__GenericBrowserType_Texture'
}
