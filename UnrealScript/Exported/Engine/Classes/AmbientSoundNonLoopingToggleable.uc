/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
// Version of AmbientSoundToggleable that picks a random non-looping sound to play.

class AmbientSoundNonLoopingToggleable extends AmbientSoundSimpleToggleable
	native( Sound );

defaultproperties
{
   Begin Object Class=SoundCue Name=SoundCue0 Archetype=SoundCue'Engine.Default__AmbientSoundSimpleToggleable:SoundCue0'
      SoundClass="Ambient"
      Name="SoundCue0"
      ObjectArchetype=SoundCue'Engine.Default__AmbientSoundSimpleToggleable:SoundCue0'
   End Object
   SoundCueInstance=SoundCue'Engine.Default__AmbientSoundNonLoopingToggleable:SoundCue0'
   Begin Object Class=SoundNodeAmbientNonLoopToggle Name=SoundNodeAmbientNonLoopToggle0
      Name="SoundNodeAmbientNonLoopToggle0"
      ObjectArchetype=SoundNodeAmbientNonLoopToggle'Engine.Default__SoundNodeAmbientNonLoopToggle'
   End Object
   SoundNodeInstance=SoundNodeAmbientNonLoopToggle'Engine.Default__AmbientSoundNonLoopingToggleable:SoundNodeAmbientNonLoopToggle0'
   Begin Object Class=AudioComponent Name=AudioComponent0 Archetype=AudioComponent'Engine.Default__AmbientSoundSimpleToggleable:AudioComponent0'
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundNonLoopingToggleable:DrawSoundRadius0'
      Name="AudioComponent0"
      ObjectArchetype=AudioComponent'Engine.Default__AmbientSoundSimpleToggleable:AudioComponent0'
   End Object
   AudioComponent=AudioComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSoundSimpleToggleable:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Non_Loop'
      SpriteCategoryName="Sounds"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__AmbientSoundSimpleToggleable:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0 Archetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimpleToggleable:DrawSoundRadius0'
      SphereColor=(B=51,G=0,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimpleToggleable:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=AudioComponent0
   Name="Default__AmbientSoundNonLoopingToggleable"
   ObjectArchetype=AmbientSoundSimpleToggleable'Engine.Default__AmbientSoundSimpleToggleable'
}
