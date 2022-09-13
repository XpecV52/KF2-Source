//=============================================================================
// KFExplosion_ParasiteSeedHuman
//=============================================================================
// Explosion created when hitting a human
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFExplosion_ParasiteSeedHuman extends KFExplosion_MedicGrenade;

defaultproperties
{
   HealingDamageType=Class'kfgamecontent.KFDT_Healing_ParasiteSeed'
   HealingAmount=30.000000
   maxTime=0.500000
   bDoFullDamage=False
   LoopStartEvent=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_Grenade_Smoke_Loop'
   LoopStopEvent=AkEvent'WW_WEP_Medic_GrenadeLauncher.Stop_WEP_Medic_GrenadeLauncher_Grenade_Smoke_Loop'
   LoopingParticleEffect=ParticleSystem'WEP_3P_Medic_Grenade_EMIT.FX_Medic_Grenade_Explosion'
   bExplodeMoreThanOnce=False
   Name="Default__KFExplosion_ParasiteSeedHuman"
   ObjectArchetype=KFExplosion_MedicGrenade'kfgamecontent.Default__KFExplosion_MedicGrenade'
}
