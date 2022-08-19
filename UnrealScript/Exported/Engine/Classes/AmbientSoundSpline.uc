/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Sound is emmited by virtual speaker. Virtual speaker is placed in evaluated in the mean loudest position in listener's scope.
 * The points used to virtual speaker evaluation are placed on spline.
 */ 

class AmbientSoundSpline extends AmbientSound
	AutoExpandCategories( AmbientSoundSpline )
	native( Sound );
/**
 * Maximal distance on spline between points, that are used to eval virtual speaker position (Minimal number of points is 3) 
 * Points are placed on spline automatically.
 */
var(AmbientSoundSpline) editoronly float            DistanceBetweenPoints<ToolTip=Maximal distance on spline between points, that are used to eval virtual speaker position (Minimal number of points is 3).>;

/** SplineComponent with spline curve defining the source of sound */
var(AmbientSoundSpline) editoronly SplineComponent  SplineComponent;

/** Only to test algorithm finding nearest point. Editor shows virtual speaker position for listener placed in TestPoint.*/
var editoronly vector                                   TestPoint;

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

defaultproperties
{
   DistanceBetweenPoints=200.000000
   Begin Object Class=SplineComponentSimplified Name=SplineComponent0
      ReplacementPrimitive=None
      Name="SplineComponent0"
      ObjectArchetype=SplineComponentSimplified'Engine.Default__SplineComponentSimplified'
   End Object
   SplineComponent=SplineComponent0
   Begin Object Class=SplineAudioComponent Name=AudioComponent1
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSpline:DrawSoundRadius0'
      Name="AudioComponent1"
      ObjectArchetype=SplineAudioComponent'Engine.Default__SplineAudioComponent'
   End Object
   AudioComponent=AudioComponent1
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSound:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound'
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
      SphereColor=(B=0,G=153,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSound:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=SplineComponent0
   Components(3)=AudioComponent1
   Name="Default__AmbientSoundSpline"
   ObjectArchetype=AmbientSound'Engine.Default__AmbientSound'
}
