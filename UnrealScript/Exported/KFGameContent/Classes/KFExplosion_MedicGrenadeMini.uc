//=============================================================================
// KFExplosion_MedicGrenadeMini
//=============================================================================
// Used by projectiles and kismet to spawn an explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFExplosion_MedicGrenadeMini extends KFExplosion_MedicGrenade;

defaultproperties
{
   HealingAmount=10.000000
   LoopStartEvent=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_Grenade_Smoke_Loop'
   LoopStopEvent=AkEvent'WW_WEP_Medic_GrenadeLauncher.Stop_WEP_Medic_GrenadeLauncher_Grenade_Smoke_Loop'
   Name="Default__KFExplosion_MedicGrenadeMini"
   ObjectArchetype=KFExplosion_MedicGrenade'kfgamecontent.Default__KFExplosion_MedicGrenade'
}
