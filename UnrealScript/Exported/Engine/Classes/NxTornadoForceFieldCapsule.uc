/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class NxTornadoForceFieldCapsule extends NxTornadoForceField
	native(ForceField)
	placeable;

/** Used to preview the radius of the force. */
var()	DrawCapsuleComponent			RenderComponent;

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
   Begin Object Class=DrawCapsuleComponent Name=DrawCapsule0
      ReplacementPrimitive=None
      Name="DrawCapsule0"
      ObjectArchetype=DrawCapsuleComponent'Engine.Default__DrawCapsuleComponent'
   End Object
   RenderComponent=DrawCapsule0
   ForceHeight=200.000000
   Components(0)=DrawCapsule0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadForce'
      SpriteCategoryName="Physics"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   Name="Default__NxTornadoForceFieldCapsule"
   ObjectArchetype=NxTornadoForceField'Engine.Default__NxTornadoForceField'
}
