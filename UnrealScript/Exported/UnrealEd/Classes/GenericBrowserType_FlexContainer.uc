/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class GenericBrowserType_FlexContainer
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
	virtual UBOOL ShowObjectEditor(UObject *InObject);

}


defaultproperties
{
   Description="Flex Container"
   Name="Default__GenericBrowserType_FlexContainer"
   ObjectArchetype=GenericBrowserType'UnrealEd.Default__GenericBrowserType'
}
