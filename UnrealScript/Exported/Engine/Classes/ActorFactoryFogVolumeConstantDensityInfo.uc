/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryFogVolumeConstantDensityInfo extends ActorFactory
	config(Editor)
	native(FogVolume);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var	MaterialInterface SelectedMaterial;
var bool bNothingSelected;

defaultproperties
{
   MenuName="Add FogVolumeConstantDensityInfo"
   NewActorClass=Class'Engine.FogVolumeConstantDensityInfo'
   Name="Default__ActorFactoryFogVolumeConstantDensityInfo"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
