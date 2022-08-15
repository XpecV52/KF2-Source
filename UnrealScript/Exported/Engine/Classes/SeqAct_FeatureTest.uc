/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_FeatureTest extends SeqAct_Log
	native(Sequence);

/** Location and Orientation values for the FreezeAt command. */
var() string FreezeAtParameters;

/** The delay (in seconds) between freezing and taking the screenshot. */
var() float ScreenShotDelay;

/** (Optional) File name for the screenshot. */
var() string ScreenShotName;

/** The time remaining between freezing and taking the screenshot. */
var float RemainingScreenShotDelay;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   ScreenShotDelay=1.000000
   bLatentExecution=True
   bAutoActivateOutputLinks=False
   ObjName="Feature Test"
   Name="Default__SeqAct_FeatureTest"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
}
