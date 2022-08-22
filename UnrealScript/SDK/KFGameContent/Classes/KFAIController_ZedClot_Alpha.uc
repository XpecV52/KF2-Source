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
`if(`notdefined(ShippingPC) && `notdefined(FINAL_RELEASE))
	if( RallyChance == 0.f && MyDifficultySettings.default.bForceSpecialSpawn )
	{
		RallyChance = 0.5f;
		RallyCooldown = 15.f;
	}
`endif
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

DefaultProperties
{
	// ---------------------------------------------
	// AI / Navigation
	SprintWithinEnemyRange=(X=520.f,Y=1200.f)
	EvadeGrenadeChance=0.75f
	RunOverEvadeDelayScale=0.5f

	// ---------------------------------------------
	// Combat
	bIsProbingMeleeRangeEvents=true
	StrikeRangePercentage=0.6

	// ---------------------------------------------
	// Rally
	MinAIRequiredForRally=4

    // ---------------------------------------------
    // Danger Evasion Settings
	DangerEvadeSettings.Empty

	DangerEvadeSettings(0)={(ClassName="KFProj_Bullet_Pellet",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.6, 0.5, 0.3, 0.2),
								ReactionDelayRanges={((X=0.0, Y=0.2), (X=0.0, Y=0.0), (X=0.0, Y=0.15), (X=0.0, Y=0.00))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(1)={(ClassName="KFProj_Nail_Nailgun",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.6, 0.5, 0.3, 0.2),
								ReactionDelayRanges={((X=0.0, Y=0.2), (X=0.0, Y=0.0), (X=0.0, Y=0.15), (X=0.0, Y=0.00))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(2)={(ClassName="KFProj_Bullet_DragonsBreath",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.6, 0.5, 0.3, 0.2),
								ReactionDelayRanges={((X=0.0, Y=0.2), (X=0.0, Y=0.0), (X=0.0, Y=0.15), (X=0.0, Y=0.00))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(3)={(ClassName="KFProj_HighExplosive_M79",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.6, 0.5, 0.3, 0.2),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.2), (X=0.0, Y=0.0), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(4)={(ClassName="KFProj_Rocket_RPG7",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.6, 0.5, 0.3, 0.2),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.2), (X=0.0, Y=0.0), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}

	//shooting fire
	DangerEvadeSettings(5)={(ClassName="KFProj_CaulkNBurn_GroundFire",
								Cooldowns=(3.0, 1.0, 1.0,  1.0), // Normal, Hard, Suicidal, HoE 
								EvadeChances=(0.2, 0.2, 0.3, 0.4),
								ReactionDelayRanges={((X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(6)={(ClassName="KFProj_FlameThrower_GroundFire",
								Cooldowns=(3.0, 1.0, 1.0,  1.0), // Normal, Hard, Suicidal, HoE  
								EvadeChances=(0.2, 0.2, 0.3, 0.4),
								ReactionDelayRanges={((X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(7)={(ClassName="KFWeap_Flame_CaulkBurn",
								Cooldowns=(2.5, 2.5, 2.5,  2.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.2, 0.3, 0.4),
								ReactionDelayRanges={((X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(8)={(ClassName="KFWeap_Flame_Flamethrower",
							    Cooldowns=(2.5, 2.5, 2.5,  2.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.2, 0.3, 0.4),
								ReactionDelayRanges={((X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(9)={(ClassName="KFWeap_Beam_Microwave",
							    Cooldowns=(2.5, 2.5, 2.5,  2.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.2, 0.3, 0.4),
								ReactionDelayRanges={((X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5), (X=0.3, Y=0.5))},
								SoloChanceMultiplier=1.0)}

	//Grenades
	DangerEvadeSettings(10)={(ClassName="KFProj_FragGrenade",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.4, 0.6, 0.8),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.5), (X=0.0, Y=0.3), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}	
	DangerEvadeSettings(11)={(ClassName="KFProj_MolotovGrenade",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.4, 0.6, 0.8),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.5), (X=0.0, Y=0.3), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(12)={(ClassName="KFProj_DynamiteGrenade",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.4, 0.6, 0.8),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.5), (X=0.0, Y=0.3), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}	
	DangerEvadeSettings(13)={(ClassName="KFProj_NailBombGrenade",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.4, 0.6, 0.8),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.5), (X=0.0, Y=0.3), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}
	DangerEvadeSettings(14)={(ClassName="KFProj_HEGrenade",
								Cooldowns=(3.0, 1.0, 0.1,  0.0), // Normal, Hard, Suicidal, HoE
								EvadeChances=(0.2, 0.4, 0.6, 0.8),
								ForcedEvadeChances={((FL=0.0, FR=0.0), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5), (FL=0.5, FR=0.5))},
								ReactionDelayRanges={((X=0.0, Y=0.5), (X=0.0, Y=0.3), (X=0.0, Y=0.15), (X=0.0, Y=0.05))},
								SoloChanceMultiplier=1.0)}	
}