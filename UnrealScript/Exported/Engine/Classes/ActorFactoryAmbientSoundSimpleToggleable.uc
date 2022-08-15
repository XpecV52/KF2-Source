/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundSimpleToggleable extends ActorFactoryAmbientSoundSimple
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
   MenuName="Add AmbientSoundSimpleToggleable"
   MenuPriority=10
   NewActorClass=Class'Engine.AmbientSoundSimpleToggleable'
   Name="Default__ActorFactoryAmbientSoundSimpleToggleable"
   ObjectArchetype=ActorFactoryAmbientSoundSimple'Engine.Default__ActorFactoryAmbientSoundSimple'
}
