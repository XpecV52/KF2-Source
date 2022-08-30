/*******************************************************************************
 * KFSeqAct_StartObjectiveWave generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_StartObjectiveWave extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local KFGameInfo_Objective KFGI;

    KFGI = KFGameInfo_Objective(Class'WorldInfo'.static.GetWorldInfo().Game);
    if(KFGI != none)
    {
        KFGI.SeqActStartWave();
    }
}

defaultproperties
{
    ObjName="Start Objective Wave"
    ObjCategory="Killing Floor"
}