/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_DelaySwitch extends SeqAct_Latent
	deprecated
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

var() int							LinkCount;

var transient int					CurrentIdx;
var transient float					SwitchDelay;
var transient float					NextLinkTime;

defaultproperties
{
   LinkCount=1
   OutputLinks(0)=(LinkDesc="Link 1")
   OutputLinks(1)=()
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Delay",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Active Link",MinVars=0)
   ObjName="Delayed"
   ObjCategory="Switch"
   Name="Default__SeqAct_DelaySwitch"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
