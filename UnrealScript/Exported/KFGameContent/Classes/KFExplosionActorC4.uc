//=============================================================================
// KFExplosionActorC4
//=============================================================================
// Explosion actor class that potentially does less damage each subsequent hit
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFExplosionActorC4 extends KFExplosionActor;

simulated function float GetDamageFor( Actor Victim )
{
	return ExplosionTemplate.Damage * CalcStackingDamageScale(KFPawn(Victim), default.LifeSpan);
}

defaultproperties
{
   DamageScalePerStack=0.750000
   LifeSpan=3.000000
   Name="Default__KFExplosionActorC4"
   ObjectArchetype=KFExplosionActor'KFGame.Default__KFExplosionActor'
}
