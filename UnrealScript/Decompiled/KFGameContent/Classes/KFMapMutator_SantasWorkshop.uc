/*******************************************************************************
 * KFMapMutator_SantasWorkshop generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMapMutator_SantasWorkshop extends KFMapMutator;

var float EndlessWaveDoshScalar;

static simulated function ModifyGameClassBossAIClassList(out array< class<KFPawn_Monster> > GameClassBossAIClassList)
{
    local int I;

    if(Class'WorldInfo'.static.GetWorldInfo().GRI.GameClass == Class'KFGameInfo_Survival')
    {
        I = 0;
        J0x62:

        if(I < GameClassBossAIClassList.Length)
        {
            if(GameClassBossAIClassList[I] == Class'KFPawn_ZedBloatKing')
            {
                GameClassBossAIClassList[I] = Class'KFPawn_ZedBloatKing_SantasWorkshop';
            }
            ++ I;
            goto J0x62;
        }
    }
}

static simulated function ModifyAIDoshValue(out float AIDoshValue)
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Class'WorldInfo'.static.GetWorldInfo().GRI);
    if(KFGRI.GameClass == Class'KFGameInfo_Survival')
    {
        if(KFGRI.bWaveIsEndless)
        {
            AIDoshValue *= default.EndlessWaveDoshScalar;
        }
    }
}

defaultproperties
{
    EndlessWaveDoshScalar=0.5
}