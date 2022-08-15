//=============================================================================
// KFProj_Bullet_Pellet
//=============================================================================
// Shotgun pellet class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Pellet extends KFProj_Bullet
	hidedropdown;

defaultproperties
{
	MaxSpeed=7000.0
	Speed=7000.0

	DamageRadius=0

	ProjFlightTemplate=ParticleSystem'WEP_1P_MB500_EMIT.FX_MB500_Tracer'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_1P_MB500_EMIT.FX_MB500_Tracer_ZEDTime'
}

