/*******************************************************************************
 * SceneCapturePortalComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SceneCapturePortalComponent extends SceneCaptureComponent
    native
    hidecategories(Object);

/** render target resource to set as target for capture */
var(Capture) const TextureRenderTarget2D TextureTarget;
/** scale field of view so that there can be some overdraw */
var(Capture) const float ScaleFOV;
/**  
 *actor at the target view location for this portal
 * (this will be the point where the scene is captured from)
 */
var(Capture) const Actor ViewDestination;

// Export USceneCapturePortalComponent::execSetCaptureParameters(FFrame&, void* const)
native final function SetCaptureParameters(optional TextureRenderTarget2D NewTextureTarget, optional float NewScaleFOV, optional Actor NewViewDest)
{
    NewTextureTarget = TextureTarget;
    NewScaleFOV = ScaleFOV;
    NewViewDest = ViewDestination;                    
}

defaultproperties
{
    ScaleFOV=1
    bSkipUpdateIfOwnerOccluded=true
    FrameRate=1000
}