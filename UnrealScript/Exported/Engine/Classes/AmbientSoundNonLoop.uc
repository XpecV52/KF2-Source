/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
// Version of AmbientSoundSimple that picks a random non-looping sound to play.

class AmbientSoundNonLoop extends AmbientSoundSimple
	native( Sound );

defaultproperties
{
   Begin Object Class=SoundCue Name=SoundCue0 Archetype=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
      SoundClass="Ambient"
      Name="SoundCue0"
      ObjectArchetype=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
   End Object
   SoundCueInstance=SoundCue'Engine.Default__AmbientSoundNonLoop:SoundCue0'
   Begin Object Class=SoundNodeAmbientNonLoop Name=SoundNodeAmbientNonLoop0
      Name="SoundNodeAmbientNonLoop0"
      ObjectArchetype=SoundNodeAmbientNonLoop'Engine.Default__SoundNodeAmbientNonLoop'
   End Object
   SoundNodeInstance=SoundNodeAmbientNonLoop'Engine.Default__AmbientSoundNonLoop:SoundNodeAmbientNonLoop0'
   Begin Object Class=AudioComponent Name=AudioComponent0 Archetype=AudioComponent'Engine.Default__AmbientSoundSimple:AudioComponent0'
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundNonLoop:DrawSoundRadius0'
      Name="AudioComponent0"
      ObjectArchetype=AudioComponent'Engine.Default__AmbientSoundSimple:AudioComponent0'
   End Object
   AudioComponent=AudioComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSoundSimple:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Non_Loop'
      SpriteCategoryName="Sounds"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__AmbientSoundSimple:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0 Archetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimple:DrawSoundRadius0'
      SphereColor=(B=51,G=0,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimple:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=AudioComponent0
   DrawScale=2.000000
   Name="Default__AmbientSoundNonLoop"
   ObjectArchetype=AmbientSoundSimple'Engine.Default__AmbientSoundSimple'
}
