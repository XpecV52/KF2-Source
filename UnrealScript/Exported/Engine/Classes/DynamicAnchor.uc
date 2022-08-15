/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */


/** a dynamic anchor is a NavigationPoint temporarily added to the navigation network during gameplay, when the AI is trying
 * to get on the network but there is no directly reachable NavigationPoint available. It tries to find something else that is
 * reachable (for example, part of a ReachSpec) and places one of these there and connects it to the network. Doing it this way
 * allows us to handle these situations without any special high-level code; as far as script is concerned, the AI is moving
 * along a perfectly normal NavigationPoint connected to the network just like any other.
 * DynamicAnchors handle destroying themselves and cleaning up any connections when they are no longer in use.
 */
class DynamicAnchor extends NavigationPoint
	native;

/** current controller that's using us to navigate */
var Controller CurrentUser;

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
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionType=COLLIDE_CustomDefault
   bStatic=False
   bNoDelete=False
   bCollideWhenPlacing=False
   CollisionComponent=CollisionCylinder
   Name="Default__DynamicAnchor"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
