/**
 * Event which is activated by GameInfo.StartMatch when the match begins.
 * Originator: current WorldInfo
 * Instigator: None
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_LevelStartup extends SequenceEvent
	deprecated
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bPlayerOnly=False
   ObjName="Level Startup"
   Name="Default__SeqEvent_LevelStartup"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
