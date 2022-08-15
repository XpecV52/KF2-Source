//=============================================================================
// KFDummyReplicationInfo
//=============================================================================
// A dummy PRI for bots that is only used when bEnableGameAnalytics=TRUE.
// Normally, PRI's are not required for bots.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDummyReplicationInfo extends PlayerReplicationInfo;

simulated function bool ShouldBroadCastWelcomeMessage(optional bool bExiting)
{
	return false;
}

defaultproperties
{
   bIsInactive=True
   RemoteRole=ROLE_None
   bTickIsDisabled=True
   Name="Default__KFDummyReplicationInfo"
   ObjectArchetype=PlayerReplicationInfo'Engine.Default__PlayerReplicationInfo'
}
