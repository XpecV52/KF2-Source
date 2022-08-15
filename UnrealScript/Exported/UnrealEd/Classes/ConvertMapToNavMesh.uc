/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ConvertMapToNavMesh extends Commandlet
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event int Main(string Params);

cpptext
{
	virtual INT Main(const FString& Params);

}


defaultproperties
{
   Name="Default__ConvertMapToNavMesh"
   ObjectArchetype=Commandlet'Core.Default__Commandlet'
}
