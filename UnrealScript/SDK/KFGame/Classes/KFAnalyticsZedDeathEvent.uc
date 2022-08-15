//=============================================================================
// KFAnalyticsZedDeathEvent
//=============================================================================
// Zed death event for analytics system. Modeled after GenericParamListStatEntry
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - @author Jonathan Howard 140805
//=============================================================================
class KFAnalyticsZedDeathEvent extends Object
	native(Analytics);

cpptext
{
	// don't leak the stat event if we get destroyed before CommitToDisk().
	virtual void BeginDestroy();
};

var native transient pointer StatEvent{struct FZedDeathEvent};
var protected transient KFGameplayEventsWriter Writer;

function native SetBasicInfo( Controller Killer, Controller Monster, KFPawn_Monster MonsterPawn );
function native AddPerPlayer( Controller Player, float DamageDealt, int ReceivedExp, int ReceivedDosh, class<KFPerk> Perk );

function native CommitToDisk();
