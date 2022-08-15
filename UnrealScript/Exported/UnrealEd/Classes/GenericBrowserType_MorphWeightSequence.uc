/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//-----------------------------------------------------------
// Browser type for morph weight sequence
//-----------------------------------------------------------
class GenericBrowserType_MorphWeightSequence extends GenericBrowserType
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
   Description="Morph Target Weights"
   Name="Default__GenericBrowserType_MorphWeightSequence"
   ObjectArchetype=GenericBrowserType'UnrealEd.Default__GenericBrowserType'
}
