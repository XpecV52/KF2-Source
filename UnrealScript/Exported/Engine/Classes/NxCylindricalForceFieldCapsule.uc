/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class NxCylindricalForceFieldCapsule extends NxCylindricalForceField
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
// (cpptext)
// (cpptext)

/** 
 * This is used to InitRBPhys for a dynamically spawned ForceField.
 * Used for starting RBPhsys on dyanmically spawned force fields.  This will probably need to set some transient pointer to NULL  
 **/
native function DoInitRBPhys();

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
   Name="Default__NxCylindricalForceFieldCapsule"
   ObjectArchetype=NxCylindricalForceField'Engine.Default__NxCylindricalForceField'
}
