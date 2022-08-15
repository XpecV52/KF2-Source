//=============================================================================
// Ambient sound, sits there and emits its sound.
// Copyright 1998-2007 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class AkAmbientSound extends Keypoint native;

/** Should the audio component automatically play on load? */
//var() bool bAutoPlay; Not showing this parameter to user since it is not working properly yet.
var bool bAutoPlay;

/** Audio component to play */
var() AkEvent PlayEvent;

var() bool StopWhenOwnerIsDestroyed;

/** Is the audio component currently playing? */
var transient private bool bIsPlaying;

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
// (cpptext)

defaultproperties
{
   bAutoPlay=True
   StopWhenOwnerIsDestroyed=True
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
      Sprite=Texture2D'AkResources.Wwise'
      SpriteCategoryName="Keypoints"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Name="Default__AkAmbientSound"
   ObjectArchetype=Keypoint'Engine.Default__Keypoint'
}
