/*******************************************************************************
 * KFAnimNotify_MeleeTrails generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAnimNotify_MeleeTrails extends AnimNotify_Trails
    native(Anim)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Trails) ParticleSystem BlueTrailParticle;
var(Trails) ParticleSystem RedTrailParticle;

defaultproperties
{
    BlueTrailParticle=ParticleSystem'FX_Gameplay_EMIT_THREE.Trails.FX_Trail_Blue_R_01'
    RedTrailParticle=ParticleSystem'FX_Gameplay_EMIT_THREE.Trails.FX_Trail_Red_R_01'
}