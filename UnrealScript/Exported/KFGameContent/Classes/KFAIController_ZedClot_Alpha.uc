//=============================================================================
// KFAIController_ZedClot_Alpha
//=============================================================================
// Alpha clot AI controller
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedClot_Alpha extends KFAIController_ZedClot;

/** Minimum number of clumped AI (including the alpha clot) for it to trigger a rally */
var protected const byte MinAIRequiredForRally;

/** When all criteria are met, how much of a chance to trigger a rally */
var protected float RallyChance;

/** How long of a cooldown between rally attempts */
var protected float RallyCooldown;

/*********************************************************************************************
* Rally Methods
********************************************************************************************* */

/** Initialize our rally settings */
function InitRallySettings()
{
	local class<KFDifficulty_ClotAlpha> MyDifficultySettings;

	MyDifficultySettings = class<KFDifficulty_ClotAlpha>( MyKFPawn.DifficultySettings );
	if( fRand() < MyDifficultySettings.default.RallyTriggerSettings[WorldInfo.Game.GameDifficulty].SpawnChance )
	{
	    RallyChance = MyDifficultySettings.default.RallyTriggerSettings[WorldInfo.Game.GameDifficulty].RallyChance;
	    RallyCooldown = MyDifficultySettings.default.RallyTriggerSettings[WorldInfo.Game.GameDifficulty].Cooldown;
	}
}

/** Used by the pawn class to determine if this alpha needs a special material */
function bool IsSpecialAlpha()
{
	return RallyChance > 0.f;
}

/** NPC has seen a player - use SeeMonster for similar notifications about seeing any pawns (currently not in use) */
event SeePlayer( Pawn Seen )
{
	super.SeePlayer( Seen );

	// Start a timer once we've seen a player to check every few seconds if we should rally
	if( RallyChance > 0.f && !IsTimerActive(nameOf(Timer_CheckForRally)) )
	{
		SetTimer( 2.0f + (fRand() * 3.0f), false, nameOf(Timer_CheckForRally) );
	}
}

function Timer_CheckForRally()
{
	local float RallyDistSQ;
	local byte NumPawnsForRally;
	local Pawn P;

	// If we're dead or near-dead, don't try to rally anymore
	if( MyKFPawn.IsHeadless() || !MyKFPawn.IsAliveAndWell() )
	{
		return;	
	}

	// If we're in a state that would prevent us from rallying, wait a bit before we try again
	if( MyKFPawn.IsDoingSpecialMove() || !MyKFPawn.CanDoSpecialMove(SM_Rally) )
	{
		SetTimer( 0.5f, false, nameOf(Timer_CheckForRally) );
		return;
	}

	// Check against rally chance
	if( fRand() < RallyChance )
	{
		// Set our rally distance
		RallyDistSQ = Square( class'KFSM_AlphaRally'.default.RallyRadius );
		foreach WorldInfo.AllPawns( class'Pawn', P )
		{
			if( P.GetTeamNum() != GetTeamNum() || !P.IsAliveAndWell() )
			{
				continue;
			}

			if( VSizeSQ(P.Location - MyKFPawn.Location) < RallyDistSQ )
			{
				++NumPawnsForRally;

				if( NumPawnsForRally == MinAIRequiredForRally )
				{
					MyKFPawn.DoSpecialMove( SM_Rally, true,, class'KFSM_AlphaRally'.static.PackRallyFlags() );
					SetTimer( RallyCooldown, false, nameOf(Timer_CheckForRally) );
					return;
				}
			}
		}
	}

	SetTimer( 1.5f, false, nameOf(Timer_CheckForRally) );
}

defaultproperties
{
   MinAIRequiredForRally=4
   RunOverEvadeDelayScale=0.500000
   SprintWithinEnemyRange=(X=520.000000,Y=1200.000000)
   StrikeRangePercentage=0.600000
   EvadeGrenadeChance=0.750000
   DangerEvadeSettings(0)=(ClassName="KFProj_Bullet_Pellet",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(1)=(ClassName="KFProj_Nail_Nailgun",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(2)=(ClassName="KFProj_Bullet_DragonsBreath",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.000000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(3)=(ClassName="KFProj_HighExplosive_M79",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(4)=(ClassName="KFProj_Rocket_RPG7",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.600000,0.500000,0.300000,0.200000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.200000),(X=0.000000,Y=0.000000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(5)=(ClassName="KFProj_CaulkNBurn_GroundFire",Cooldowns=(3.000000,1.000000,1.000000,1.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(6)=(ClassName="KFProj_FlameThrower_GroundFire",Cooldowns=(3.000000,1.000000,1.000000,1.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(7)=(ClassName="KFWeap_Flame_CaulkBurn",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(8)=(ClassName="KFWeap_Flame_Flamethrower",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(9)=(ClassName="KFWeap_Beam_Microwave",Cooldowns=(2.500000,2.500000,2.500000,2.000000),EvadeChances=(0.200000,0.200000,0.300000,0.400000),ReactionDelayRanges=((X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000),(X=0.300000,Y=0.500000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(10)=(ClassName="KFProj_FragGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(11)=(ClassName="KFProj_MolotovGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(12)=(ClassName="KFProj_DynamiteGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(13)=(ClassName="KFProj_NailBombGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   DangerEvadeSettings(14)=(ClassName="KFProj_HEGrenade",Cooldowns=(3.000000,1.000000,0.100000,0.000000),EvadeChances=(0.200000,0.400000,0.600000,0.800000),ForcedEvadeChances=(,(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000),(FL=0.500000,FR=0.500000)),ReactionDelayRanges=((X=0.000000,Y=0.500000),(X=0.000000,Y=0.300000),(X=0.000000,Y=0.150000),(X=0.000000,Y=0.050000)),SoloChanceMultiplier=1.000000)
   Name="Default__KFAIController_ZedClot_Alpha"
   ObjectArchetype=KFAIController_ZedClot'KFGame.Default__KFAIController_ZedClot'
}
