/*******************************************************************************
 * KFCameraLensEmit_EMP generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCameraLensEmit_EMP extends EmitterCameraLensEffectBase
    hidecategories(Navigation);

defaultproperties
{
    PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_EMP'
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFCameraLensEmit_EMP.ParticleSystemComponent0'
    ParticleSystemComponent=ParticleSystemComponent0
    bDepthTestEnabled=false
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFCameraLensEmit_EMP.ParticleSystemComponent0'
    Components(0)=ParticleSystemComponent0
    LifeSpan=5
}