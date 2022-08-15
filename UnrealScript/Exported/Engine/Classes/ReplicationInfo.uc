//=============================================================================
// ReplicationInfo.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ReplicationInfo extends Info
	abstract
	native(ReplicationInfo);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   Name="Default__ReplicationInfo"
   ObjectArchetype=Info'Engine.Default__Info'
}
