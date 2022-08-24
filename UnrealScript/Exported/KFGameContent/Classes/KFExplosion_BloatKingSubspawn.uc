//=============================================================================
// KFExplosion_BloatKingSubspawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFExplosion_BloatKingSubspawn extends KFExplosionActorLingering;

defaultproperties
{
   interval=1.000000
   maxTime=10.000000
   bDoFullDamage=True
   LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
   LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
   DamageScalePerStack=0.000000
   Name="Default__KFExplosion_BloatKingSubspawn"
   ObjectArchetype=KFExplosionActorLingering'KFGame.Default__KFExplosionActorLingering'
}
