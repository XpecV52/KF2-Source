/**
 * Event which is triggered by the AI code when an NPC sees an enemy pawn.
 * Originator: the pawn associated with the NPC
 * Insigator: the enemy PC that has been spotted.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_AISeeEnemy extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Max distance before allowing activation */
var() float MaxSightDistance;

defaultproperties
{
   ObjName="See Enemy"
   ObjCategory="AI"
   Name="Default__SeqEvent_AISeeEnemy"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
