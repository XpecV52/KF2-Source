/*******************************************************************************
 * SceneCaptureCubeMapComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SceneCaptureCubeMapComponent extends SceneCaptureComponent
    native
    hidecategories(Object);

/** texture targets for the six cubemap faces */
var(Capture) TextureRenderTargetCube TextureTarget;
/** near plane clip distance */
var(Capture) float NearPlane;
/** far plane clip distance */
var(Capture) float FarPlane;
var private native const transient Vector WorldLocation;

defaultproperties
{
    NearPlane=20
    FarPlane=500
}