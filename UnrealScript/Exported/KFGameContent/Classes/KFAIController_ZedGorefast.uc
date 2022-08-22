//=============================================================================
// KFAIController_ZedGorefast
//=============================================================================
// Base controller for the Gorefast
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedGorefast extends KFAIController_Monster;

var bool	bExecutedSprint;

/*********************************************************************************************
* Movement Methods
********************************************************************************************* */

/** Timer function called during latent moves that determines whether NPC should sprint or stop sprinting */
function bool ShouldSprint()
{
	if( Enemy != none && MyKFPawn != none && MyKFPawn.IsCombatCapable() && (bExecutedSprint ||
		MyKFPawn.Health < MyKFPawn.HealthMax || (VSizeSq(Enemy.Location - Pawn.Location) <= (SprintWithinEnemyRange.Y * SprintWithinEnemyRange.Y))) )
	{
		bExecutedSprint = true;
		return true;
	}
	else
	{
		return false;
	}
}

/** Called from KFPawn_Monster::SetSprinting() */
function bool CanSetSprinting( bool bNewSprintStatus )
{
	return bExecutedSprint;
}

/** Turn off sprinting if we've lost sight of our enemy */
event EnemyNotVisible()
{
	if( MyKFPawn.bIsSprinting && !bForceFrustration && MyKFGameInfo.MyKFGRI.AIRemaining > FrustrationThreshold )  // don't stop sprinting if we're in frustration mode
	{
		bExecutedSprint = false;
		MyKFPawn.SetSprinting( false );
	}
	bEnemyIsVisible = false;
	DisableEnemyNotVisible();
	EnableSeePlayer();
}

/** Update sprint settings based on Frustration */
function UpdateSprintFrustration( optional byte bForceFrustrationState=255 )
{
	if( bForceFrustration )
	{
		bExecutedSprint = true;
		bCanSprint = true;
	}
}

function bool IsFrustrated()
{
	if( bForceFrustration )
	{
		return true;
	}

	return false;
}

defaultproperties
{
   bEvadeOnRunOverWarning=True
   RunOverEvadeDelayScale=0.500000
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=0.000000,Y=800.000000)
   StrikeRangePercentage=0.750000
   MaxMeleeHeightAngle=0.680000
   EvadeGrenadeChance=0.750000
   LowIntensityAttackCooldown=3.000000
   DangerEvadeSettings(2)=(ClassName="KFProj_FragGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.000000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(3)=(ClassName="KFProj_MolotovGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.000000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(4)=(ClassName="KFProj_DynamiteGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.000000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(5)=(ClassName="KFProj_NailBombGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.000000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(6)=(ClassName="KFProj_HEGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.000000,0.200000,0.500000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(7)=(ClassName="KFWeap_Beam_Microwave",Cooldowns=(3.000000,3.000000,2.500000,1.500000),EvadeChances=(0.000000,0.300000,0.500000,0.800000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   Name="Default__KFAIController_ZedGorefast"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
