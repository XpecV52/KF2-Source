/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileTouchInputVolume extends SequenceEvent;

defaultproperties
{
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Touch")
   OutputLinks(1)=(LinkDesc="Release")
   OutputLinks(2)=(LinkDesc="Double Tap")
   ObjName="Touch Input Volume"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileTouchInputVolume"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
