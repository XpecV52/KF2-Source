/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstDirector extends InterpTrackInst
	native(Interpolation);


var	Actor	OldViewTarget;

/** Rendering overrides that were active on the player camera, used to restore settings when the director track ends in game. */
var RenderingPerformanceOverrides OldRenderingOverrides;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   OldRenderingOverrides=(bAllowAmbientOcclusion=True,bAllowDominantWholeSceneDynamicShadows=True,bAllowMotionBlurSkinning=True,bAllowTemporalAA=True,bAllowLightShafts=True)
   Name="Default__InterpTrackInstDirector"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
