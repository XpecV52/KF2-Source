/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ActorFactoryAmbientSoundMovable extends ActorFactoryAmbientSound
	config( Editor )
	hidecategories( Object )
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuName="Add AmbientSoundMovable"
   MenuPriority=10
   NewActorClass=Class'Engine.AmbientSoundMovable'
   bShowInEditorQuickMenu=False
   Name="Default__ActorFactoryAmbientSoundMovable"
   ObjectArchetype=ActorFactoryAmbientSound'Engine.Default__ActorFactoryAmbientSound'
}
