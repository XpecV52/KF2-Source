/*******************************************************************************
 * KFExplosion_HRGScorcherGroundFire generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosion_HRGScorcherGroundFire extends KFExplosionActorLingering
    config(Weapon)
    hidecategories(Navigation);

/** Replacement particles to play when hitting surfaces at different angles */
var() ParticleSystem LoopingParticleEffectAlternate;
var() ParticleSystem LoopingParticleEffectCeiling;
var() ParticleSystem LoopingParticleEffectWall;

defaultproperties
{
    LoopingParticleEffectAlternate=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Ground_Loop_Blue'
    LoopingParticleEffectCeiling=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Ceiling'
    LoopingParticleEffectWall=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Wall_Loop'
    interval=0.5
    maxTime=6
    bDoFullDamage=true
    LoopStartEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Residual_Fire_Loop'
    LoopStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Residual_Fire_Loop'
    LoopingParticleEffect=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Ground_Loop'
}