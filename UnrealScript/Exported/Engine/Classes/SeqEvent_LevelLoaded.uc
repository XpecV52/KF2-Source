/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This event will be fired when a level is loaded and made visible. It is primarily 
 * used for notifying when a sublevel is associated with the world.
 *
 **/
class SeqEvent_LevelLoaded extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 2;
}

defaultproperties
{
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Loaded and Visible")
   OutputLinks(1)=(LinkDesc="Beginning of Level")
   OutputLinks(2)=(LinkDesc="Level Reset")
   ObjName="Level Loaded"
   Name="Default__SeqEvent_LevelLoaded"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
