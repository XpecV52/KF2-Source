/**
 * SeqAct_LevelStreaming
 *
 * Kismet action exposing loading and unloading of levels.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_LevelStreaming extends SeqAct_LevelStreamingBase
	native(Sequence);

/** LevelStreaming object that is going to be loaded/ unloaded on request	*/
var const	 LevelStreaming			Level;

/** LevelStreaming object name */
var() const	 Name					LevelName<autocomment=true>;

var transient bool bStatusIsOk;

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

defaultproperties
{
   ObjName="Stream Level"
   bSuppressAutoComment=False
   Name="Default__SeqAct_LevelStreaming"
   ObjectArchetype=SeqAct_LevelStreamingBase'Engine.Default__SeqAct_LevelStreamingBase'
}
