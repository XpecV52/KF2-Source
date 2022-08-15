//=============================================================================
// KFProj_Bullet_PistolDeagle
//=============================================================================
// Bullet class for Desert Eagle pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFProj_Bullet_PistolDeagle extends KFProj_Bullet_Gunslinger
	hidedropdown;

defaultproperties
{
	MaxSpeed=5000.0
	Speed=5000.0

	DamageRadius=0

	ProjFlightTemplate=ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
}

