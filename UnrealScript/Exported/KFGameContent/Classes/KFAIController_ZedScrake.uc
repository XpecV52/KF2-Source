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
* ::Possess
*
* Overridden set the rage health threshold
*
* =====================================================
*/
event Possess( Pawn inPawn, bool bVehicleTransition )
{
    if( KFPawn_ZedScrake(inPawn) != none )
    {
        // Determine what rage health threshold to use
        if( Skill == class'KFDifficultyInfo'.static.GetDifficultyValue(0) ) // Normal
        {
            RageHealthThreshold = KFPawn_ZedScrake(inPawn).RageHealthThresholdNormal;
        }
        else if( Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(1) ) // Hard
        {
            RageHealthThreshold = KFPawn_ZedScrake(inPawn).RageHealthThresholdHard;
        }
        else if( Skill <= class'KFDifficultyInfo'.static.GetDifficultyValue(2) ) // Suicidal
        {
            RageHealthThreshold = KFPawn_ZedScrake(inPawn).RageHealthThresholdSuicidal;
        }
        else // Hell on Earth
        {
            RageHealthThreshold = KFPawn_ZedScrake(inPawn).RageHealthThresholdHellOnEarth;
        }
    }

	super.Possess( inPawn, bVehicleTransition );
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

	if( IsEnraged() || IsFrustrated() )
	{
		return true;
	}

	return false;
}

function bool IsEnraged()
{
    return ( GetHealthPercentage() < RageHealthThreshold );
}

/**
 * Update sprint settings based on Frustration
 */
function UpdateSprintFrustration( optional byte bForceFrustration=255 )
{
    super.UpdateSprintFrustration( (IsEnraged() ? 1 : bForceFrustration) );
}

function bool IsFrustrated()
{
    return ( IsEnraged() || super.IsFrustrated() );
}

function bool CanEvadeGrenade()
{
    if(MyKFPawn == none || MyKFPawn.bIsSprinting)
    {
        return false;
    }
    return super.CanEvadeGrenade();
}

defaultproperties
{
   bCanTeleportCloser=False
   TeleportCooldown=10.000000
   HiddenRelocateTeleportThreshold=7.000000
   EvadeGrenadeChance=0.750000
   FrustrationDelay=5.000000
   Name="Default__KFAIController_ZedScrake"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
