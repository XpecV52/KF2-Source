/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
 // A simplified ambient sound actor for enhanced workflow
 
class AmbientSoundSimple extends AmbientSound
	hidecategories( Audio )
	AutoExpandCategories( AmbientSoundSimple )
	native( Sound );

/** Mirrored property for easier editability, set in Spawned.		*/
var()	editinline editconst	SoundNodeAmbient	AmbientProperties;
/** Dummy sound cue property to force instantiation of subobject.	*/
var		editinline export const SoundCue			SoundCueInstance;
/** Dummy sound node property to force instantiation of subobject.	*/
var		editinline export const SoundNodeAmbient	SoundNodeInstance;

defaultproperties
{
   Begin Object Class=SoundCue Name=SoundCue0
      SoundClass="Ambient"
      Name="SoundCue0"
      ObjectArchetype=SoundCue'Engine.Default__SoundCue'
   End Object
   SoundCueInstance=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
   Begin Object Class=SoundNodeAmbient Name=SoundNodeAmbient0
      Name="SoundNodeAmbient0"
      ObjectArchetype=SoundNodeAmbient'Engine.Default__SoundNodeAmbient'
   End Object
   SoundNodeInstance=SoundNodeAmbient'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0'
   Begin Object Class=AudioComponent Name=AudioComponent0 Archetype=AudioComponent'Engine.Default__AmbientSound:AudioComponent0'
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimple:DrawSoundRadius0'
      Name="AudioComponent0"
      ObjectArchetype=AudioComponent'Engine.Default__AmbientSound:AudioComponent0'
   End Object
   AudioComponent=AudioComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSound:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Simple'
      SpriteCategoryName="Sounds"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__AmbientSound:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0 Archetype=DrawSoundRadiusComponent'Engine.Default__AmbientSound:DrawSoundRadius0'
      SphereColor=(B=255,G=102,R=0,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSound:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=AudioComponent0
   CollisionType=COLLIDE_CustomDefault
   Name="Default__AmbientSoundSimple"
   ObjectArchetype=AmbientSound'Engine.Default__AmbientSound'
}
