//=============================================================================
// KFGameConductorVersus
//=============================================================================
// Game conductor which dynamically manages the difficulty and fun of the game
// Versus version
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================
class KFGameConductorVersus extends KFGameConductor
	config(Game);

/** How much to scale the zed's health based on the human team players average perk rank */
var() InterpCurveFloat	HumanRankZedHealthScaleCurve;

/** How much to scale the zed's health based on the human team players average perk rank */
var() InterpCurveFloat	HumanRankZedDamageScaleCurve;

/** Called once per second to evaluate changes to gameplay */
function TimerUpdate()
{
    UpdatePlayerAccuracyStats();
    UpdateZedLifespanStats();
    UpdatePlayersStatus();
    UpdatePlayersAggregateSkill();

    UpdateOverallStatus();
}

/** Calculate the overall status of the player's rank and performance */
function UpdateOverallStatus()
{
    local int i;

    // Adjust the zed damage and health to balance out player perk rank
    if( !bBypassGameConductor )
    {
        CurrentVersusZedHealthMod = EvalInterpCurveFloat(HumanRankZedHealthScaleCurve, AveragePlayerPerkRank);
        CurrentVersusZedDamageMod = EvalInterpCurveFloat(HumanRankZedDamageScaleCurve, AveragePlayerPerkRank);
    }
    else
    {
        CurrentVersusZedHealthMod = default.CurrentVersusZedHealthMod;
        CurrentVersusZedDamageMod = default.CurrentVersusZedDamageMod;
    }

    MyKFGRI.VersusZedHealthMod = CurrentVersusZedHealthMod;
    MyKFGRI.VersusZedDamageMod = CurrentVersusZedDamageMod;

    `log("CurrentVersusZedHealthMod = "$CurrentVersusZedHealthMod$" CurrentVersusZedDamageMod = "$CurrentVersusZedDamageMod, bLogGameConductor);

    // Take us out of a forced lull if the time is up
    if( GameConductorStatus == GCS_ForceLull && `TimeSince(PlayerDeathForceLullTime) > PlayerDeathForceLullLength )
    {
        GameConductorStatus = GCS_Normal;
        `log("Forced lull completed", bLogGameConductor);
    }

    MyKFGRI.CurrentGameConductorStatus = GameConductorStatus;
    MyKFGRI.CurrentParZedLifeSpan = GetParZedLifeSpan();

	for( i = 0; i < (ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) - 1); i++ )
	{
        MyKFGRI.OverallRankAndSkillModifierTracker[i] = MyKFGRI.OverallRankAndSkillModifierTracker[i+1];
	}

    // Bypassing making game conductor adjustments
    OverallRankAndSkillModifier = 0.5;
    `log("Bypassing GameConductor adjustment OverallRankAndSkillModifier = "$OverallRankAndSkillModifier, bLogGameConductor);
    MyKFGRI.OverallRankAndSkillModifierTracker[ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) -1] = OverallRankAndSkillModifier;
    return;

    //`log("OverallRankAndSkillModifier= "$OverallRankAndSkillModifier$" GetParZedLifeSpan() = "$GetParZedLifeSpan(), bLogGameConductor);
}


defaultproperties
{
    TargetPerkRankRange(0)=(X=0,Y=25) // Normal, should result in a CurrentTargetPerkRank of 12.5, right in the middle

    HumanRankZedHealthScaleCurve=(Points=((InVal=0.f,OutVal=0.7f),(InVal=12.f, OutVal=0.7),(InVal=25.f, OutVal=1.18f)))// level 0  0.525
    HumanRankZedDamageScaleCurve=(Points=((InVal=0.f,OutVal=0.5f),(InVal=12.f, OutVal=0.75),(InVal=25.f, OutVal=0.84f)))// level 25 0.83

    CurrentSpawnRateModification=1.3 // Slow down all spawning in versus globally
}