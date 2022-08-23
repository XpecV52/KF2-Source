/*******************************************************************************
 * KFAIController_ZedClot_AlphaKing generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedClot_AlphaKing extends KFAIController_ZedClot_Alpha
    config(AI)
    hidecategories(Navigation);

var protected const byte MinAIRequiredForRally;
var protected float RallyChance;
var protected float RallyCooldown;

function InitRallySettings()
{
    local class<KFDifficulty_ClotAlphaKing> MyDifficultySettings;

    MyDifficultySettings = class<KFDifficulty_ClotAlphaKing>(MyKFPawn.DifficultySettings);
    RallyChance = MyDifficultySettings.default.RallyTriggerSettings[int(WorldInfo.Game.GameDifficulty)].RallyChance;
    RallyCooldown = MyDifficultySettings.default.RallyTriggerSettings[int(WorldInfo.Game.GameDifficulty)].Cooldown;
}

event SeePlayer(Pawn Seen)
{
    super(KFAIController).SeePlayer(Seen);
    if(!IsTimerActive('Timer_CheckForRally'))
    {
        SetTimer(2 + (FRand() * 3), false, 'Timer_CheckForRally');
    }
}

function Timer_CheckForRally()
{
    local float RallyDistSQ;
    local byte NumPawnsForRally;
    local Pawn P;

    if(MyKFPawn.IsHeadless() || !MyKFPawn.IsAliveAndWell())
    {
        return;
    }
    if(MyKFPawn.IsDoingSpecialMove() || !MyKFPawn.CanDoSpecialMove(18))
    {
        SetTimer(0.5, false, 'Timer_CheckForRally');
        return;
    }
    if(FRand() < RallyChance)
    {
        RallyDistSQ = Square(Class'KFSM_AlphaRally'.default.RallyRadius);
        foreach WorldInfo.AllPawns(Class'Pawn', P)
        {
            if((P.GetTeamNum() != GetTeamNum()) || !P.IsAliveAndWell())
            {
                continue;                
            }
            if(VSizeSq(P.Location - MyKFPawn.Location) < RallyDistSQ)
            {
                ++ NumPawnsForRally;
                if(NumPawnsForRally == MinAIRequiredForRally)
                {
                    MyKFPawn.DoSpecialMove(18, true,, Class'KFSM_AlphaRally'.static.PackRallyFlags());
                    SetTimer(RallyCooldown, false, 'Timer_CheckForRally');                    
                    return;
                }
            }            
        }        
    }
    SetTimer(1.5, false, 'Timer_CheckForRally');
}

defaultproperties
{
    MinAIRequiredForRally=4
}