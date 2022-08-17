//=============================================================================
// KFSM_PlayerCrawler_Suicide
//=============================================================================
// Play a suicide attack animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerCrawler_Suicide extends KFSM_PlaySingleAnim;

/** Explosion template for suicide gas attack */
var KFGameExplosion SuicideGasExplosionTemplate;

/** Damagetype used on owner pawn when exploding */
var class<KFDamageType> SuicideDamageType;

protected function bool InternalCanDoSpecialMove()
{
    if( KFPOwner.WorldInfo.GRI.bMatchIsOver )
    {
        return false;
    }

	if( KFPOwner.IsHumanControlled() )
	{
		return KFPOwner.IsAliveAndWell();
	}

	return true;
}

simulated function SpecialMoveEnded( name PrevMove, name NextMove )
{
	TriggerExplosion( KFPOwner );

	super.SpecialMoveEnded( PrevMove, NextMove );
}

/** Called when crawler suicides */
static function TriggerExplosion( KFPawn CrawlerOwner, optional bool bForceExplosion )
{
	local KFExplosion_PlayerCrawlerSuicide ExploActor;

	// Only living crawlers can explode
	if( !CrawlerOwner.bPlayedDeath || bForceExplosion )
	{
        // Cache controller
        KFPawn_ZedCrawler_Versus(CrawlerOwner).OldController = CrawlerOwner.Controller;

    	// Explode using the given template
		ExploActor = CrawlerOwner.Spawn( class'KFExplosion_PlayerCrawlerSuicide', CrawlerOwner,, CrawlerOwner.Location, rotator(vect(0,0,1)) );
		if( ExploActor != none )
		{
            ExploActor.Explode( default.SuicideGasExplosionTemplate );
		}

		// Make sure we're dead!
		if( CrawlerOwner.Role == ROLE_Authority && !CrawlerOwner.bPlayedDeath && !bForceExplosion ) 
   		{
   			CrawlerOwner.TakeRadiusDamage( none, 10000, default.SuicideGasExplosionTemplate.DamageRadius, default.SuicideDamageType, 1, CrawlerOwner.Location, true, none );
   		}
	}
}

defaultproperties
{
   SuicideGasExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFSM_PlayerCrawler_Suicide:ExploTemplate1'
   SuicideDamageType=Class'kfgamecontent.KFDT_Explosive_CrawlerSuicide'
   AnimName="Player_Suicide"
   bUseRootMotion=True
   bPawnRotationLocked=True
   Handle="KFSM_PlayerCrawler_Suicide"
   Name="Default__KFSM_PlayerCrawler_Suicide"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
