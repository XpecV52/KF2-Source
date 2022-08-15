/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryFogVolumeLinearHalfspaceDensityInfo extends ActorFactoryFogVolumeConstantDensityInfo
	config(Editor)
	native(FogVolume);

defaultproperties
{
   MenuName="Add FogVolumeLinearHalfspaceDensityInfo"
   NewActorClass=Class'Engine.FogVolumeLinearHalfspaceDensityInfo'
   Name="Default__ActorFactoryFogVolumeLinearHalfspaceDensityInfo"
   ObjectArchetype=ActorFactoryFogVolumeConstantDensityInfo'Engine.Default__ActorFactoryFogVolumeConstantDensityInfo'
}
