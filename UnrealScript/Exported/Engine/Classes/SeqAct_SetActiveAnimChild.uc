/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetActiveAnimChild extends SequenceAction 
	native(Sequence);

/** Node name in the AnimTree - the node should always be active **/
var()	name		NodeName;
/** start with 1-N **/
var()	int			ChildIndex;
/** float blend time **/
var()	float		BlendTime;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   BlendTime=0.250000
   InputLinks(0)=(LinkDesc="Activate")
   ObjName="Set Active Anim Child"
   ObjCategory="Anim"
   Name="Default__SeqAct_SetActiveAnimChild"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
