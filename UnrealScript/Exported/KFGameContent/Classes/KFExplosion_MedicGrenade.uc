//=============================================================================
// KFExplosion_MedicGrenade
//=============================================================================
// Used by projectiles and kismet to spawn an explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFExplosion_MedicGrenade extends KFExplosionActorLingering;

var() class<KFDamageType> HealingDamageType;
var() float HealingAmount;

var AkEvent SmokeLoopStartEvent;
var AkEvent SmokeLoopStopEvent;

var KFPerk CachedInstigatorPerk;

/*
 * @param Direction     For bDirectionalExplosion=true explosions, this is the forward direction of the blast.
 * Overridden to add the ability to spawn fragments from the explosion
 **/
simulated function Explode(GameExplosion NewExplosionTemplate, optional vector Direction)
{
	local KFPawn KFP;
	super.Explode(NewExplosionTemplate, Direction);

	if( Instigator != none )
	{
		KFP = KFPawn(Instigator);
		if( KFP != none )
		{
			CachedInstigatorPerk = KFP.GetPerk();
		}
	}
}

/**
  * Deal damage or heal players
  */
protected simulated function AffectsPawn(Pawn Victim, float DamageScale)
{
	local KFPawn_Human HumanVictim;
	local KFPawn_Monster MonsterVictim;
	local KFProj_MedicGrenade OwnerProjectile;
	local bool bCanRepairArmor;

	if( Victim != none && Victim.IsAliveAndWell() )
	{
		MonsterVictim = KFPawn_Monster(Victim);
		if( MonsterVictim != none )
		{
			if( CachedInstigatorPerk != none && CachedInstigatorPerk.ShouldSedate() )
			{
				MonsterVictim.DoSpecialMove( SM_Stunned );
			}
		
			super.AffectsPawn(Victim, DamageScale);
		}
		else 
		{
			HumanVictim = KFPawn_Human(Victim);
			if( HumanVictim != none && HumanVictim.GetExposureTo(Location) > 0 )
			{
				OwnerProjectile = KFProj_MedicGrenade(Owner);
				if( OwnerProjectile != none )
				{
					bCanRepairArmor = OwnerProjectile.HealedPawns.Find( HumanVictim ) == INDEX_NONE;
				}
				
				HumanVictim.HealDamage(HealingAmount, InstigatorController, HealingDamageType, bCanRepairArmor);

				if( bCanRepairArmor )
				{
					OwnerProjectile.HealedPawns.AddItem( HumanVictim );
				}
			}
		}
	}
}

defaultproperties
{
   HealingDamageType=Class'kfgamecontent.KFDT_Healing_MedicGrenade'
   HealingAmount=5.000000
   interval=1.000000
   maxTime=8.000000
   bSkipLineCheckForPawns=True
   bDoFullDamage=True
   LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
   LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
   Name="Default__KFExplosion_MedicGrenade"
   ObjectArchetype=KFExplosionActorLingering'KFGame.Default__KFExplosionActorLingering'
}
