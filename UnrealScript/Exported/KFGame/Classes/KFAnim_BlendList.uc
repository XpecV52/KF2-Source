//=============================================================================
// KFAnim_BlendList
//=============================================================================
// Added two optional fields to AnimNodeBlendList
// 1) BlendInTime per child
// 2) BlockSetActiveChildWhenRelevant per child
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
// 
class KFAnim_BlendList extends AnimNodeBlendList
	native(Anim);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

// Custom blend in time for each child
var()	Array<float>	ChildBlendInTime;

/** 
 * Blend to DesiredChild index, only if node is not relevant in tree.
 * This is used to blend until a transition animation is played.
 */
var()	Array<bool>		BlockSetActiveChildWhenRelevant;

native function SetActiveChild(INT ChildIndex, FLOAT BlendTime);

defaultproperties
{
   Name="Default__KFAnim_BlendList"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
