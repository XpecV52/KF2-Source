//=============================================================================
// KFExplosion_HansNerveGasGrenade
//=============================================================================
// Explosion info for Hans' Nerve Gas Grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFExplosion_HansNerveGasGrenade extends KFExplosionActorLingering;

defaultproperties
{
   interval=1.000000
   maxTime=8.000000
   bDoFullDamage=True
   LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
   LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
   DamageScalePerStack=0.000000
   Name="Default__KFExplosion_HansNerveGasGrenade"
   ObjectArchetype=KFExplosionActorLingering'KFGame.Default__KFExplosionActorLingering'
}
