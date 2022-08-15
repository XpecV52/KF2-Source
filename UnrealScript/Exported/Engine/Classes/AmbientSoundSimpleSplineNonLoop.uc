/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AmbientSoundSimpleSplineNonLoop extends AmbientSoundSimpleSpline;

defaultproperties
{
   Begin Object Class=SplineComponentSimplified Name=SplineComponent0 Archetype=SplineComponentSimplified'Engine.Default__AmbientSoundSimpleSpline:SplineComponent0'
      ReplacementPrimitive=None
      Name="SplineComponent0"
      ObjectArchetype=SplineComponentSimplified'Engine.Default__AmbientSoundSimpleSpline:SplineComponent0'
   End Object
   SplineComponent=SplineComponent0
   Begin Object Class=SimpleSplineNonLoopAudioComponent Name=AudioComponent3
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimpleSplineNonLoop:DrawSoundRadius0'
      Name="AudioComponent3"
      ObjectArchetype=SimpleSplineNonLoopAudioComponent'Engine.Default__SimpleSplineNonLoopAudioComponent'
   End Object
   AudioComponent=AudioComponent3
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSoundSimpleSpline:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Non_Loop'
      SpriteCategoryName="Sounds"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__AmbientSoundSimpleSpline:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0 Archetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimpleSpline:DrawSoundRadius0'
      SphereColor=(B=51,G=0,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimpleSpline:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=SplineComponent0
   Components(3)=AudioComponent3
   Name="Default__AmbientSoundSimpleSplineNonLoop"
   ObjectArchetype=AmbientSoundSimpleSpline'Engine.Default__AmbientSoundSimpleSpline'
}
