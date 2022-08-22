/*******************************************************************************
 * AICommand_Stumble generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Stumble extends AICommand_PushedBySM within KFAIController;

var Vector Momentum;
var KFAfflictionManager.EHitZoneBodyPart HitZoneLimb;

static function bool Stumble(KFAIController AI, Vector InMomentum, KFAfflictionManager.EHitZoneBodyPart InHitZoneLimb)
{
    local AICommand_Stumble Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            Cmd.Momentum = InMomentum;
            Cmd.HitZoneLimb = InHitZoneLimb;
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

function Pushed()
{
    super.Pushed();
    if(!bAllowMeleeCombatDecisions)
    {
        Outer.DisableMeleeRangeEventProbing();
    }
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal(string(GetFuncName()) $ "() Beginning stumble AICommand", 'Command_Stumble');
    }
    Outer.AIActionStatus = "Staggering";
}

function Popped()
{
    super.Popped();
    Outer.EnableMeleeRangeEventProbing();
    Outer.AIActionStatus = "Done Staggering";
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal(string(GetFuncName()) $ "() Finished stumble AICommand", 'Command_Stumble');
    }
}

function bool ShouldIgnoreTimeTransitions()
{
    return true;
}

function bool IsAllowedToAttack()
{
    return false;
}

defaultproperties
{
    bIgnoreNotifies=true
}