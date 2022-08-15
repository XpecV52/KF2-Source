//=============================================================================
// KFExplosion_Nuke
//=============================================================================
// Used by projectiles and kismet to spawn an explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFExplosion_Nuke extends KFExplosionActorLingering;

/**
  * Deal damage
  */
protected simulated function AffectsPawn(Pawn Victim, float DamageScale)
{
	local KFPawn_Monster MonsterVictim;

	if( Victim != none && Victim.IsAliveAndWell() )
	{
		MonsterVictim = KFPawn_Monster(Victim);
		if( MonsterVictim != none )
		{
			super.AffectsPawn(Victim, DamageScale);
		}
	}
}

DefaultProperties
{
	Interval=1
	MaxTime=8

	bExplodeMoreThanOnce=true
	bDoFullDamage=true
	bSkipLineCheckForPawns=true

	LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
	LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
}
