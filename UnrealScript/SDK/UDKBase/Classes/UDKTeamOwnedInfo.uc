/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class UDKTeamOwnedInfo extends ReplicationInfo
	native;

/** Team associated with this info */
var TeamInfo Team;

simulated native function byte GetTeamNum();
