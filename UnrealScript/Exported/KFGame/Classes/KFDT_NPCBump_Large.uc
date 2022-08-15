//=============================================================================
// KFDT_NPCBump_Large
//=============================================================================
// Damage type caused by NPCs bumping into KFDestructibleActors. If a 
// destructible actor has this class in its InstaKillDamageType list then
// any *LARGE* Zed will attempt to path through the destructible actor. Other
// Zeds will consider the destructible actor to be blocking their navigation.
// See KFScout, PathSizes for current Large size. 
// See AKFAIController::ShouldIgnoreNavigationBlocking() for where this is 
// checked.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_NPCBump_Large extends KFDT_NPCBump
	abstract;

defaultproperties
{
   Name="Default__KFDT_NPCBump_Large"
   ObjectArchetype=KFDT_NPCBump'KFGame.Default__KFDT_NPCBump'
}
