/*******************************************************************************
 * AICommand_ThrowGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_ThrowGrenade extends AICommand_SpecialMove within KFAIController_Hans;

var int GrenadeBarrage;
var KFAIWaveInfo SummonWave;
var int MaxBossMinions;

static function bool ThrowGrenade(KFAIController_Hans AI, optional int inGrenadeBarrage, optional KFPawn InTarget, optional KFAIWaveInfo NewSummonWave, optional int NewMaxBossMinions)
{
    local AICommand_ThrowGrenade Cmd;

    Cmd = new (AI) default.Class;
    if(Cmd != none)
    {
        Cmd.GrenadeBarrage = inGrenadeBarrage;
        if((NewMaxBossMinions > 0) && NewSummonWave != none)
        {
            Cmd.SummonWave = NewSummonWave;
            Cmd.MaxBossMinions = NewMaxBossMinions;
        }
        AI.PushCommand(Cmd);
        return true;
    }
    return false;
}

function Pushed()
{
    Outer.AIActionStatus = "Attempting to throw grenade";
    Outer.AIZeroMovementVariables();
    Outer.DisableMeleeRangeEventProbing();
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = Outer.Enemy;
    super.Pushed();
}

function Popped()
{
    Outer.Focus = none;
    Outer.EnableMeleeRangeEventProbing();
    super.Popped();
}

state Command_SpecialMove
{
    function bool ShouldFinishRotation()
    {
        return true;
    }

    function bool ExecuteSpecialMove()
    {
        local KFAISpawnManager SpawnManager;

        if(super.ExecuteSpecialMove())
        {
            if(MaxBossMinions > 0)
            {
                SpawnManager = KFGameInfo(Outer.WorldInfo.Game).SpawnManager;
                if(SpawnManager != none)
                {
                    SpawnManager.SummonBossMinions(SummonWave.Squads, MaxBossMinions);
                }
                if(KFPawn_ZedHansBase(Outer.MyKFPawn) != none)
                {
                    KFPawn_ZedHansBase(Outer.MyKFPawn).bPendingSmokeGrenadeBarrage = false;
                }
            }
            return true;            
        }
        else
        {
            if(((GrenadeBarrage > 0) && MaxBossMinions > 0) && KFPawn_ZedHansBase(Outer.MyKFPawn) != none)
            {
                KFPawn_ZedHansBase(Outer.MyKFPawn).bPendingSmokeGrenadeBarrage = true;
            }
            return false;
        }
    }

    function KFPawn.ESpecialMove GetSpecialMove()
    {
        if(GrenadeBarrage == 0)
        {
            return 24;            
        }
        else
        {
            if(GrenadeBarrage == 1)
            {
                return 25;                
            }
            else
            {
                return 26;
            }
        }
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    TimeOutDelaySeconds=25
}