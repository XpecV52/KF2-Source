//=============================================================================
// KFTeamInfo_Human
//=============================================================================
// KFTeamInfo_Human
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFTeamInfo_Human extends TeamInfo;

function PostBeginPlay()
{
	super.PostBeginPlay();
	//force a replication since we are putting team index in default properties.
	bForceNetUpdate = true;
	bNetDirty = true;
}

defaultproperties
{
   TeamIndex=0
   Name="Default__KFTeamInfo_Human"
   ObjectArchetype=TeamInfo'Engine.Default__TeamInfo'
}
