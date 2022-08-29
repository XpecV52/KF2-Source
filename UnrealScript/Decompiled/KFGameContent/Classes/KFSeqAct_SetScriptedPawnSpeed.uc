/*******************************************************************************
 * KFSeqAct_SetScriptedPawnSpeed generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_SetScriptedPawnSpeed extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var() float SpeedModifier;

event Activated()
{
    local KFGameReplicationInfo KFGRI;
    local KFMapObjective_EscortPawns EscortObjective;
    local KFPawn_Scripted ScriptedPawn;

    KFGRI = KFGameReplicationInfo(GetWorldInfo().GRI);
    if((KFGRI != none) && KFGRI.CurrentObjective != none)
    {
        EscortObjective = KFMapObjective_EscortPawns(KFGRI.CurrentObjective);
        if((EscortObjective != none) && EscortObjective.ActiveEscortActor != none)
        {
            ScriptedPawn = KFPawn_Scripted(EscortObjective.ActiveEscortActor);
            if(ScriptedPawn != none)
            {
                ScriptedPawn.SpeedScalarForObstacles = SpeedModifier;
                ScriptedPawn.UpdatePawnSpeed();
            }
        }
    }
}

defaultproperties
{
    ObjName="Set Scripted Pawn Speed"
    ObjCategory="Killing Floor"
}