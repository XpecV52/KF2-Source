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
   bIgnoreZedOnZedScaling=True
   Name="Default__KFDT_HeavyZedBump"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
