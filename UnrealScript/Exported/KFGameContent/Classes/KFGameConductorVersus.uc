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

    if (bLogGameConductor) LogInternal("CurrentVersusZedHealthMod = "$CurrentVersusZedHealthMod$" CurrentVersusZedDamageMod = "$CurrentVersusZedDamageMod);

    // Take us out of a forced lull if the time is up
    if( GameConductorStatus == GCS_ForceLull && (WorldInfo.TimeSeconds - PlayerDeathForceLullTime) > PlayerDeathForceLullLength )
    {
        GameConductorStatus = GCS_Normal;
        if (bLogGameConductor) LogInternal("Forced lull completed");
    }

    MyKFGRI.CurrentGameConductorStatus = GameConductorStatus;
    MyKFGRI.CurrentParZedLifeSpan = GetParZedLifeSpan();

	for( i = 0; i < (ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) - 1); i++ )
	{
        MyKFGRI.OverallRankAndSkillModifierTracker[i] = MyKFGRI.OverallRankAndSkillModifierTracker[i+1];
	}

    // Bypassing making game conductor adjustments
    OverallRankAndSkillModifier = 0.5;
    if (bLogGameConductor) LogInternal("Bypassing GameConductor adjustment OverallRankAndSkillModifier = "$OverallRankAndSkillModifier);
    MyKFGRI.OverallRankAndSkillModifierTracker[ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) -1] = OverallRankAndSkillModifier;
    return;

    //`log("OverallRankAndSkillModifier= "$OverallRankAndSkillModifier$" GetParZedLifeSpan() = "$GetParZedLifeSpan(), bLogGameConductor);
}

defaultproperties
{
   HumanRankZedHealthScaleCurve=(Points=((OutVal=0.500000),(InVal=12.000000,OutVal=0.700000),(InVal=25.000000,OutVal=1.180000)))
   HumanRankZedDamageScaleCurve=(Points=((OutVal=0.350000),(InVal=12.000000,OutVal=0.500000),(InVal=25.000000,OutVal=0.750000)))
   TargetPerkRankRange(0)=(X=0.000000,Y=25.000000)
   CurrentSpawnRateModification=1.300000
   Name="Default__KFGameConductorVersus"
   ObjectArchetype=KFGameConductor'KFGame.Default__KFGameConductor'
}
