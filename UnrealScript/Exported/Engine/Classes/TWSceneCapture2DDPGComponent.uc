//=============================================================================
// TWSceneCapture2DDPGComponent
//=============================================================================
// A SceneCapture2DComponent that can additionally specify which DPGs to render
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Sakib Saikia 1/12/2016
//=============================================================================
class TWSceneCapture2DDPGComponent extends SceneCapture2DComponent
    native(TW);

/** Turn on the scene capture for specific DPGs */
var(Capture) bool bRenderForegroundDPG;
var(Capture) bool bRenderWorldDPG;

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
   bRenderForegroundDPG=True
   bRenderWorldDPG=True
   Name="Default__TWSceneCapture2DDPGComponent"
   ObjectArchetype=SceneCapture2DComponent'Engine.Default__SceneCapture2DComponent'
}
