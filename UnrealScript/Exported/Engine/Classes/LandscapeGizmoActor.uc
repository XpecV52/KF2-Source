/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class LandscapeGizmoActor extends Actor
	notplaceable
	native(Terrain);

var(Gizmo) editoronly float Width;
var(Gizmo) editoronly float Height;
var(Gizmo) editoronly float LengthZ;
var(Gizmo) editoronly float MarginZ;

var(Gizmo) editoronly float MinRelativeZ;
var(Gizmo) editoronly float RelativeScaleZ;

var(Gizmo) editoronly editconst transient LandscapeInfo TargetLandscapeInfo;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Width=1280.000000
   Height=1280.000000
   LengthZ=1280.000000
   MarginZ=512.000000
   RelativeScaleZ=1.000000
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_DecalActorIcon'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.300000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bStatic=True
   bMovable=False
   bEditable=False
   Name="Default__LandscapeGizmoActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
