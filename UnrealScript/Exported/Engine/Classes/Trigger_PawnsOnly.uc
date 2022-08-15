/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class Trigger_PawnsOnly extends Trigger
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=40.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Trigger:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Trigger:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__Trigger_PawnsOnly"
   ObjectArchetype=Trigger'Engine.Default__Trigger'
}
