/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * The base class of all ambient sound types
 */
class ActorFactoryAmbientSound extends ActorFactory
	config( Editor )
	collapsecategories
	hidecategories( Object )
	native;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var()	SoundCue		AmbientSoundCue;

defaultproperties
{
   MenuName="Add AmbientSound"
   MenuPriority=11
   NewActorClass=Class'Engine.AmbientSound'
   bShowInEditorQuickMenu=True
   Name="Default__ActorFactoryAmbientSound"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
