//=============================================================================
// KFProj_Bullet_RailGun
//=============================================================================
// Bullet class for the rail gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_RailGun extends KFProj_Bullet_RackEmUp
	hidedropdown;

defaultproperties
{
	MaxSpeed=8000.0
	Speed=8000.0

	DamageRadius=0

	ProjFlightTemplate=ParticleSystem'WEP_1P_L85A2_EMIT.FX_L85A2_Tracer_ZEDTime'
}