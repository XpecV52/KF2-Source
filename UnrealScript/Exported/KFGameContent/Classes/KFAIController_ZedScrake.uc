//=============================================================================
// KFAIController_ZedScrake
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedScrake extends KFAIController_Monster;

function bool AmIAllowedToSuicideWhenStuck()
{
	return false;
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

defaultproperties
{
   bCanTeleportCloser=False
   FrustrationThreshold=0
   TeleportCooldown=10.000000
   HiddenRelocateTeleportThreshold=7.000000
   EvadeGrenadeChance=0.750000
   FrustrationDelay=5.000000
   LowIntensityAttackCooldown=5.000000
   Name="Default__KFAIController_ZedScrake"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
