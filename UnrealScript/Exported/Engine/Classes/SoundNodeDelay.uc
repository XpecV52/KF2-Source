/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
/** 
 * Defines a delay
 */ 
 
class SoundNodeDelay extends SoundNode
	native( Sound )
	hidecategories( Object )
	editinlinenew;

var( Delay )			float					DelayMin<ToolTip=The lower bound of delay time in seconds>;
var( Delay )			float					DelayMax<ToolTip=The upper bound of delay time in seconds>;

var			deprecated	rawdistributionfloat	DelayDuration;

defaultproperties
{
   Name="Default__SoundNodeDelay"
   ObjectArchetype=SoundNode'Engine.Default__SoundNode'
}
