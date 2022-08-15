/**
 * SeqEvent_MobileTouch
 *
 * This event gets called when an actor in the world gets "touched" by the player through a touch-screen device.
 * The actor must have bEnableMobileTouch set for this to work.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileTouch extends SequenceEvent;

defaultproperties
{
   MaxTriggerCount=0
   ReTriggerDelay=0.200000
   OutputLinks(0)=(LinkDesc="Tap")
   ObjName="MobileInput Touch Actor"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileTouch"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
