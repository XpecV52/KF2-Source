/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundNonLoopingToggleable extends ActorFactoryAmbientSoundSimpleToggleable
	config( Editor )
	collapsecategories
	hidecategories( Object )
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuName="Add AmbientSoundNonLoopingToggleable"
   NewActorClass=Class'Engine.AmbientSoundNonLoopingToggleable'
   Name="Default__ActorFactoryAmbientSoundNonLoopingToggleable"
   ObjectArchetype=ActorFactoryAmbientSoundSimpleToggleable'Engine.Default__ActorFactoryAmbientSoundSimpleToggleable'
}
