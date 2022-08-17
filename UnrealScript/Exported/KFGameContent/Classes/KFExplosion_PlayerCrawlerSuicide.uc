//=============================================================================
// KFExplosion_PlayerCrawlerSuicide
//=============================================================================
// Explosion info crawler suicide gas explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFExplosion_PlayerCrawlerSuicide extends KFExplosionActorLingering;

defaultproperties
{
   interval=1.000000
   maxTime=15.000000
   bDoFullDamage=True
   LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
   LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
   DamageScalePerStack=0.000000
   Name="Default__KFExplosion_PlayerCrawlerSuicide"
   ObjectArchetype=KFExplosionActorLingering'KFGame.Default__KFExplosionActorLingering'
}
