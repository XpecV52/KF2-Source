//=============================================================================
// KFDT_HeavyZedBump
//=============================================================================
// The damage that is used to obliterate players and zeds when bumping them while enraged
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_HeavyZedBump extends KFDamageType
	abstract
	hidedropdown;
	
defaultproperties
{
	bCanObliterate=false
	bIgnoreZedOnZedScaling=true
}
