//=============================================================================
// KFProj_Nail_Blunderbuss
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Nail_Blunderbuss extends KFProj_Nail_Nailgun
	hidedropdown;

defaultproperties
{
	MaxSpeed=7000.0
	Speed=7000.0

    bWarnAIWhenFired=true

	DamageRadius=0

	LifeSpan = 2.0

    BouncesLeft=1
    DampingFactor=0.65
    RicochetEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Light_bullet_impact'

	ProjFlightTemplate=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Blunderbuss_Shard_Tracer'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_Blunderbuss_EMIT.FX_Blunderbuss_Shard_Tracer_ZEDTime'
}



