//=============================================================================
// KFExplosion_HRGScorcherGroundFire
//=============================================================================
// Explosion actor class for HRG Scorcher ground fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================

class KFExplosion_HRGScorcherGroundFire extends KFExplosionActorLingering;

/** Replacement particles to play when hitting surfaces at different angles */
var() ParticleSystem LoopingParticleEffectAlternate;//used when Firebug's splash skill activated
var() ParticleSystem LoopingParticleEffectCeiling;
var() ParticleSystem LoopingParticleEffectWall;

defaultproperties
{
   LoopingParticleEffectAlternate=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Ground_Loop_Blue'
   LoopingParticleEffectCeiling=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Ceiling'
   LoopingParticleEffectWall=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Wall_Loop'
   interval=0.500000
   maxTime=6.000000
   bDoFullDamage=True
   LoopStartEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Residual_Fire_Loop'
   LoopStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Residual_Fire_Loop'
   LoopingParticleEffect=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_Splash_Fire_Ground_Loop'
   Name="Default__KFExplosion_HRGScorcherGroundFire"
   ObjectArchetype=KFExplosionActorLingering'KFGame.Default__KFExplosionActorLingering'
}
