//=============================================================================
// KFAnimNotify_HideBone
//=============================================================================
// Hide/Unhide a given bone
// NOTE: Notifies are not always triggered (e.g. interrupted anim), so be
//		 careful when toggling things on/off within an animation
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnimNotify_HideBone extends AnimNotify
	native(Anim);

/** Bone to spawn this actor on */
var() name BoneName;
/** If set, unhide instead of hide */
var() bool bUnhideBone;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   BoneName="RW_Magazine1"
   NotifyColor=(B=255,G=0,R=255,A=255)
   Name="Default__KFAnimNotify_HideBone"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
