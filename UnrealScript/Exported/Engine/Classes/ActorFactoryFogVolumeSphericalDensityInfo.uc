/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryFogVolumeSphericalDensityInfo extends ActorFactoryFogVolumeConstantDensityInfo
	config(Editor)
	native(FogVolume);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuName="Add FogVolumeSphericalDensityInfo"
   NewActorClass=Class'Engine.FogVolumeSphericalDensityInfo'
   Name="Default__ActorFactoryFogVolumeSphericalDensityInfo"
   ObjectArchetype=ActorFactoryFogVolumeConstantDensityInfo'Engine.Default__ActorFactoryFogVolumeConstantDensityInfo'
}
