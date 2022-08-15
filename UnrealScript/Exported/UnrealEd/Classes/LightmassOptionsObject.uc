/**
 *	Lightmass Options Object
 *	Property window wrapper for various Lightmass settings
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LightmassOptionsObject extends Object
	hidecategories(Object)
	dependson(EngineTypes)
	editinlinenew
	native;

var(Debug)	LightmassDebugOptions	DebugSettings;
var(Swarm)	SwarmDebugOptions	SwarmSettings;

// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   DebugSettings=(bGatherBSPSurfacesAcrossComponents=True,CoplanarTolerance=0.001000,bUseDeterministicLighting=True,bUseImmediateImport=True,bImmediateProcessMappings=True,bSortMappings=True,bPadMappings=True,ExecutionTimeDivisor=15.000000)
   SwarmSettings=(bDistributionEnabled=True)
   Name="Default__LightmassOptionsObject"
   ObjectArchetype=Object'Core.Default__Object'
}
