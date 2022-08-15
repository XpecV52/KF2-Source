//=============================================================================
// KFAnim_Random
//=============================================================================
// Same as AnimNodeRandom with a few optional settings
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAnim_Random extends AnimNodeRandom
	native(Anim);

/** If set, select a new random child instead of resuming */
var() bool bNoResumeOnRelevant;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

defaultproperties
{
   Name="Default__KFAnim_Random"
   ObjectArchetype=AnimNodeRandom'Engine.Default__AnimNodeRandom'
}
