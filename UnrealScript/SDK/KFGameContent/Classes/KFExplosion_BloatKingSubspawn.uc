//=============================================================================
// KFExplosion_BloatKingSubspawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFExplosion_BloatKingSubspawn extends KFExplosionActorLingering;

DefaultProperties
{
	Interval=1
	MaxTime=10
	DamageScalePerStack=0.f

	bExplodeMoreThanOnce=true
	bDoFullDamage=true

	LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
	LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
}
