//=============================================================================
// KFSM_PlayerCrawler_Suicide
//=============================================================================
// Play a suicide attack animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerCrawler_Suicide extends KFSM_PlaySingleAnim;

/** Explosion template for suicide gas attack */
var KFGameExplosion SuicideGasExplosionTemplate;

/** Damagetype used on owner pawn when exploding */
var class<KFDamageType> SuicideDamageType;

protected function bool InternalCanDoSpecialMove()
{
    if( KFPOwner.WorldInfo.GRI.bMatchIsOver || KFGameReplicationInfoVersus(KFPOwner.WorldInfo.GRI).bRoundIsOver )
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
    //if( !bPendingStopFire )
    //{
    	TriggerExplosion( KFPOwner, default.SuicideGasExplosionTemplate );
    //}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

/** Called when crawler suicides */
static function TriggerExplosion( KFPawn CrawlerOwner, KFGameExplosion ExplosionTemplate, optional bool bForceExplosion )
{
	local KFExplosion_PlayerCrawlerSuicide ExploActor;
    local KFPawn_ZedCrawler_Versus CrawlerOwnerV;

	// Only living crawlers can explode
	if( CrawlerOwner != none && (!CrawlerOwner.bPlayedDeath || bForceExplosion) )
	{
        // Cache controller
        CrawlerOwnerV = KFPawn_ZedCrawler_Versus( CrawlerOwner );
        if( CrawlerOwnerV != none )
        {
            KFPawn_ZedCrawler_Versus(CrawlerOwner).OldController = CrawlerOwner.Controller;
        }

    	// Explode using the given template
		ExploActor = CrawlerOwner.Spawn( class'KFExplosion_PlayerCrawlerSuicide', CrawlerOwner,, CrawlerOwner.Location, rotator(vect(0,0,1)) );
		if( ExploActor != none )
		{
            ExploActor.InstigatorController = CrawlerOwner.Controller;
            ExploActor.Instigator = CrawlerOwner;
            ExploActor.Explode( ExplosionTemplate );
		}

		// Make sure we're dead!
		if( CrawlerOwner.Role == ROLE_Authority && !CrawlerOwner.bPlayedDeath && !bForceExplosion ) 
   		{
   			CrawlerOwner.TakeRadiusDamage( none, 10000, default.SuicideGasExplosionTemplate.DamageRadius, default.SuicideDamageType, 1, CrawlerOwner.Location, true, none );
   		}
	}
}

/** Interrupts the special move if the player has released the button */
/*function SpecialMoveFlagsUpdated()
{
    if( !KFPOwner.IsLocallyControlled() && KFPOwner.SpecialMoveFlags == FLAG_SpecialMoveButtonReleased )
    {
        bPendingStopFire = true;
        bCanBeInterrupted = true;

        // End the special move on the server
        if( KFPOwner.Role == ROLE_Authority )
        {
            // Wait 2 frames for the pending stopfire flag to propagate
            KFPOwner.SetTimer( KFPOwner.WorldInfo.DeltaSeconds*2.f, false, nameOf(KFPOwner.EndSpecialMove) );
        }
    }
    else
    {
        super.SpecialMoveFlagsUpdated();
    }
}*/

/** Interrupt the move if the button was released */
/*function SpecialMoveButtonReleased()
{
    bPendingStopFire = true;
    if( KFPOwner.Role < ROLE_Authority && KFPOwner.IsLocallyControlled() )
    {
        KFPOwner.ServerDoSpecialMove( KFPOwner.SpecialMove, true,, FLAG_SpecialMoveButtonReleased );
    }
    KFPOwner.EndSpecialMove();
}*/

defaultproperties
{
   SuicideGasExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFSM_PlayerCrawler_Suicide:ExploTemplate1'
   SuicideDamageType=Class'kfgamecontent.KFDT_Explosive_CrawlerSuicide'
   AnimName="Player_Suicide"
   bUseRootMotion=True
   bPawnRotationLocked=True
   bShouldDeferToPostTick=True
   Handle="KFSM_PlayerCrawler_Suicide"
   Name="Default__KFSM_PlayerCrawler_Suicide"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
