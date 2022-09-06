//=============================================================================
// KFExplosion_Molotov
//=============================================================================
// Used by projectiles and kismet to spawn an explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================

class KFExplosion_Molotov extends KFExplosionActorLingering;

/** Replacement particles to play when hitting surfaces at different angles */
var() ParticleSystem LoopingParticleEffectCeiling;
var() ParticleSystem LoopingParticleEffectWall;

defaultproperties
{
   LoopingParticleEffectCeiling=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Molotov_Grenade_Spread_Ceiling_01'
   LoopingParticleEffectWall=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Molotov_Grenade_Spread_Wall_01'
   interval=0.500000
   maxTime=10.000000
   bDoFullDamage=True
   LoopStartEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Residual_Fire_Loop'
   LoopStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Residual_Fire_Loop'
   LoopingParticleEffect=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Molotov_ground_fire_01'
   Name="Default__KFExplosion_Molotov"
   ObjectArchetype=KFExplosionActorLingering'KFGame.Default__KFExplosionActorLingering'
}
