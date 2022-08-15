//=============================================================================
// KFAnim_TurnInPlace_Rotator
//=============================================================================
// Node to to rotate mesh, paired with KFAnim_TurnInPlace
// This could be done in the TurnInPlace node, except that the TurnInPlace node
// is often placed after an upper body blend.  This rotator component should
// be placed before blend by bone nodes so that the entire body is effected.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
// Based on GearAnim_TurnInPlace_Rotator 
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class KFAnim_TurnInPlace_Rotator extends AnimNodeBlendBase
	native(Anim);

/** Internal cached pointers */
var const duplicatetransient KFAnim_TurnInPlace TurnInPlaceNode;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Children(0)=(Name="Input",Weight=1.000000)
   bFixNumChildren=True
   CategoryDesc="TurnInPlace"
   Name="Default__KFAnim_TurnInPlace_Rotator"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
