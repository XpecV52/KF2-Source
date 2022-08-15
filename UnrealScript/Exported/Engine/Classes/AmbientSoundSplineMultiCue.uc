/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 


class AmbientSoundSplineMultiCue extends AmbientSoundSpline
	AutoExpandCategories( AmbientSoundSpline )
	native( Sound );

/** Index of currently edited sound-slot */
var(AmbientSoundSpline) editoronly int EditedSlot<ToolTip=Index of currently edited slot.>;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=SplineComponentSimplified Name=SplineComponent0 Archetype=SplineComponentSimplified'Engine.Default__AmbientSoundSpline:SplineComponent0'
      ReplacementPrimitive=None
      Name="SplineComponent0"
      ObjectArchetype=SplineComponentSimplified'Engine.Default__AmbientSoundSpline:SplineComponent0'
   End Object
   SplineComponent=SplineComponent0
   Begin Object Class=MultiCueSplineAudioComponent Name=AudioComponent2
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSplineMultiCue:DrawSoundRadius0'
      Name="AudioComponent2"
      ObjectArchetype=MultiCueSplineAudioComponent'Engine.Default__MultiCueSplineAudioComponent'
   End Object
   AudioComponent=AudioComponent2
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSoundSpline:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Simple'
      SpriteCategoryName="Sounds"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__AmbientSoundSpline:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0 Archetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSpline:DrawSoundRadius0'
      SphereColor=(B=0,G=153,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSpline:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=SplineComponent0
   Components(3)=AudioComponent2
   Name="Default__AmbientSoundSplineMultiCue"
   ObjectArchetype=AmbientSoundSpline'Engine.Default__AmbientSoundSpline'
}
