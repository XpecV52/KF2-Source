//=============================================================================
// KFAIController_ZedScrake
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedScrake extends KFAIController_Monster;

/** Threshold of health below which the Scrake will start rage charging*/
var(RageCharge) float       RageHealthThreshold;

function bool AmIAllowedToSuicideWhenStuck()
{
	return false;
}

/* epic ===============================================
* ::NotifyTakeHit
*
* Notification from pawn that it has received damage
* via TakeDamage().
*
* =====================================================
*/
function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> damageType, vector Momentum)
{
    // Rage charge NOW if we have taken enough damage
    if( ShouldSprint() && MyKFPawn != none )
    {
        MyKFPawn.SetSprinting( true );
    }

    Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
}

/** Timer function called during latent moves that determines whether NPC should sprint or stop sprinting */
function bool ShouldSprint()
{
	if( MyKFPawn == none || (Enemy == none && DoorEnemy == none) || !MyKFPawn.IsAliveAndWell() || !Enemy.IsAliveAndWell() )
	{
		return false;
	}

	if( MyKFPawn.bIsEnraged )
	{
		return true;
	}

	return false;
}

/** Frustration mode should not change sprint settings on Scrake */
function UpdateSprintFrustration( optional byte bForceFrustrationState=255 )
{
}

function bool CanEvadeGrenade()
{
    if(MyKFPawn == none || MyKFPawn.bIsSprinting)
    {
        return false;
    }
    return super.CanEvadeGrenade();
}

DefaultProperties
{
    bCanTeleportCloser=false
    EvadeGrenadeChance=0.75f
	TeleportCooldown=10.0
	HiddenRelocateTeleportThreshold=7.0
    FrustrationThreshold=0
    FrustrationDelay=5.0
    LowIntensityAttackCooldown=5.0
}
