/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldRadial extends NxForceField
	native(ForceField)
	placeable;

var() editinline ForceFieldShape Shape;

var ActorComponent DrawComponent;

/** Strength of the force applied by this actor. Positive forces are applied outwards. */
var()	interp float	ForceStrength;

/** Radius of influence of the force. */
var()	interp float	ForceRadius;

/** */
var()	interp float	SelfRotationStrength;

/** Way in which the force falls off as objects are further away from the location. */
var()	PrimitiveComponent.ERadialImpulseFalloff	ForceFalloff;

/** custom force field kernel */
var const native transient pointer		Kernel{class NxForceFieldKernelRadial};

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


/** 
 * This is used to InitRBPhys for a dynamically spawned ForceField.
 * Used for starting RBPhsys on dyanmically spawned force fields.  This will probably need to set some transient pointer to NULL  
 **/
native function DoInitRBPhys();

defaultproperties
{
   ForceRadius=200.000000
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
   Components(0)=Sprite
   Name="Default__NxForceFieldRadial"
   ObjectArchetype=NxForceField'Engine.Default__NxForceField'
}
