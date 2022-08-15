/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// GenericBrowserType_ProcBuildingRuleset
//=============================================================================

class GenericBrowserType_ProcBuildingRuleset
	extends GenericBrowserType
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
	

cpptext
{
	virtual void Init();
	virtual UBOOL ShowObjectEditor( UObject* InObject );
	virtual void QuerySupportedCommands( class USelection* InObjects, TArray< FObjectSupportedCommandType >& OutCommands ) const;

}


defaultproperties
{
   Description="ProcBuilding Ruleset"
   Name="Default__GenericBrowserType_ProcBuildingRuleset"
   ObjectArchetype=GenericBrowserType'UnrealEd.Default__GenericBrowserType'
}
