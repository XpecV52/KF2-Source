/**
 *	Simple controller for multiplication node.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class SkelControl_Multiply extends SkelControlBase
	native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** How much to scale the angle */
var()   FLOAT   Multiplier;

defaultproperties
{
   Multiplier=1.000000
   bIgnoreWhenNotRendered=True
   CategoryDesc="Single Bone"
   Name="Default__SkelControl_Multiply"
   ObjectArchetype=SkelControlBase'Engine.Default__SkelControlBase'
}
