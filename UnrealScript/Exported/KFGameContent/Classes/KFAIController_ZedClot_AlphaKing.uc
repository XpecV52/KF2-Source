//=============================================================================
// KFAIController_ZedClot_AlphaKing
//=============================================================================
// King Alpha clot AI controller
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedClot_AlphaKing extends KFAIController_ZedClot_Alpha;

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
	local class<KFDifficulty_ClotAlphaKing> MyDifficultySettings;

	MyDifficultySettings = class<KFDifficulty_ClotAlphaKing>( MyKFPawn.DifficultySettings );
    RallyChance = MyDifficultySettings.default.RallyTriggerSettings[WorldInfo.Game.GameDifficulty].RallyChance;
    RallyCooldown = MyDifficultySettings.default.RallyTriggerSettings[WorldInfo.Game.GameDifficulty].Cooldown;







}

/** NPC has seen a player - use SeeMonster for similar notifications about seeing any pawns (currently not in use) */
event SeePlayer( Pawn Seen )
{
	super.SeePlayer( Seen );

	// Start a timer once we've seen a player to check every few seconds if we should rally
	if( !IsTimerActive(nameOf(Timer_CheckForRally)) )
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
   Name="Default__KFAIController_ZedClot_AlphaKing"
   ObjectArchetype=KFAIController_ZedClot_Alpha'kfgamecontent.Default__KFAIController_ZedClot_Alpha'
}
