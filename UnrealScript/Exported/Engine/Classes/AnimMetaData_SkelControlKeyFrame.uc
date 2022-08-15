/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimMetaData_SkelControlKeyFrame extends AnimMetaData_SkelControl
	native(Anim);

/** Modifiers for what time and what strength for this skelcontrol **/
var()  editinline array<TimeModifier>  KeyFrames;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bFullControlOverController=False
   Name="Default__AnimMetaData_SkelControlKeyFrame"
   ObjectArchetype=AnimMetaData_SkelControl'Engine.Default__AnimMetaData_SkelControl'
}
