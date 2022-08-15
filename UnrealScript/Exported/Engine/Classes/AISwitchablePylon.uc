//=============================================================================
// AISwitchablePylon
//
// represents a mesh which is turned on/off via an AI triggerable switch at runtime.. e.g. an electronic gate, or a laser fence
//
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class AISwitchablePylon extends Pylon
	placeable
	native(inherit);
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


var() bool bOpen;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetEnabled(bOpen);
}

event SetEnabled(bool bEnabled)
{
	bOpen = bEnabled;
	bForceObstacleMeshCollision = !bOpen;
}

event bool IsEnabled()
{
	return bOpen;
}

defaultproperties
{
   Begin Object Class=DrawPylonRadiusComponent Name=DrawPylonRadius0 Archetype=DrawPylonRadiusComponent'Engine.Default__Pylon:DrawPylonRadius0'
      ReplacementPrimitive=None
      Name="DrawPylonRadius0"
      ObjectArchetype=DrawPylonRadiusComponent'Engine.Default__Pylon:DrawPylonRadius0'
   End Object
   PylonRadiusPreview=DrawPylonRadius0
   bNeedsCostCheck=True
   Begin Object Class=NavMeshRenderingComponent Name=NavMeshRenderer Archetype=NavMeshRenderingComponent'Engine.Default__Pylon:NavMeshRenderer'
      ReplacementPrimitive=None
      Name="NavMeshRenderer"
      ObjectArchetype=NavMeshRenderingComponent'Engine.Default__Pylon:NavMeshRenderer'
   End Object
   RenderingComp=NavMeshRenderer
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Pylon:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Pylon:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Pylon:Sprite'
      Sprite=Texture2D'EditorResources.Pylon'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Pylon:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__Pylon:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__Pylon:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__Pylon:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__Pylon:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__Pylon:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__Pylon:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=NavMeshRenderer
   Components(6)=DrawPylonRadius0
   Begin Object Class=SpriteComponent Name=Sprite3 Archetype=SpriteComponent'Engine.Default__Pylon:Sprite3'
      Sprite=Texture2D'EditorResources.BadPylon'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite3"
      ObjectArchetype=SpriteComponent'Engine.Default__Pylon:Sprite3'
   End Object
   Components(7)=Sprite3
   CollisionComponent=CollisionCylinder
   Name="Default__AISwitchablePylon"
   ObjectArchetype=Pylon'Engine.Default__Pylon'
}
