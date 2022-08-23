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

/** Called from KFPawn_Monster::SetSprinting() */
function bool CanSetSprinting( bool bNewSprintStatus )
{
	return !bNewSprintStatus || MyKFPawn.bIsEnraged;
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

function bool CanAttackDestructibles()
{
    return !MyKFPawn.bIsEnraged && super.CanAttackDestructibles();
}

defaultproperties
{
   bUseRunOverWarning=True
   MinRunOverSpeed=270.000000
   MinRunOverWarningAim=0.850000
   bCanTeleportCloser=False
   FrustrationThreshold=0
   TeleportCooldown=10.000000
   HiddenRelocateTeleportThreshold=7.000000
   EvadeGrenadeChance=0.750000
   FrustrationDelay=5.000000
   LowIntensityAttackCooldown=5.000000
   DangerEvadeSettings(0)=(ClassName="KFWeap_Rifle_Winchester1894",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   DangerEvadeSettings(1)=(ClassName="KFWeap_Bow_Crossbow",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   DangerEvadeSettings(2)=(ClassName="KFWeap_Rifle_M14EBR",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   DangerEvadeSettings(3)=(ClassName="KFWeap_Rifle_RailGun",Cooldowns=(0.500000,0.400000,0.300000,0.200000),BlockChances=(0.100000,0.200000,0.700000,0.850000))
   Name="Default__KFAIController_ZedScrake"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
