//=============================================================================
// KFAnimNotify_AkEvent_NotEmpty_1P
//=============================================================================
// A situational sound notify that is skipped when the first person weapon
// is empty.  This is tied directly to the empty anim blend node rather than
// ammo count, because empty means different things for different weapons.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class KFAnimNotify_AkEvent_NotEmpty_1P extends AnimNotify_AkEvent
	native(Anim);

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
   bIgnoreIfActorHidden=True
   NotifyColor=(B=255,G=200,R=200,A=255)
   Name="Default__KFAnimNotify_AkEvent_NotEmpty_1P"
   ObjectArchetype=AnimNotify_AkEvent'Engine.Default__AnimNotify_AkEvent'
}
