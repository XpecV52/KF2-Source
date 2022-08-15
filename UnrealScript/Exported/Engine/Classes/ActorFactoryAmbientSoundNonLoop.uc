/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundNonLoop extends ActorFactoryAmbientSoundSimple
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
   MenuName="Add AmbientSoundNonLoop"
   MenuPriority=10
   NewActorClass=Class'Engine.AmbientSoundNonLoop'
   Name="Default__ActorFactoryAmbientSoundNonLoop"
   ObjectArchetype=ActorFactoryAmbientSoundSimple'Engine.Default__ActorFactoryAmbientSoundSimple'
}
