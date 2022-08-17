/*******************************************************************************
 * KFPawnAfflictions_Scrake generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawnAfflictions_Scrake extends KFPawnAfflictions within KFPawn_ZedScrake;

protected function SetEMPMatParam(bool bDisrupted, bool bPanicked)
{
    local float EMPValue;
    local MaterialInstanceConstant MIC;

    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bPanicked)
        {
            EMPValue = 5;            
        }
        else
        {
            if(bDisrupted)
            {
                EMPValue = 1;                
            }
            else
            {
                EMPValue = 0;
            }
        }
        MIC = ((Outer.GoreMIC != none) ? Outer.GoreMIC : Outer.BodyMIC);
        MIC.SetScalarParameterValue('Scalar_EMP', EMPValue);
        Outer.BodyAltMIC.SetScalarParameterValue('Scalar_EMP', EMPValue);
    }
}

function SetPoisonedOverlay(bool bEnabled)
{
    local MaterialInstanceConstant MIC;

    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        MIC = ((Outer.GoreMIC != none) ? Outer.GoreMIC : Outer.BodyMIC);
        if(bEnabled)
        {
            MIC.SetScalarParameterValue('Scalar_Poison', 1);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Poison', 1);            
        }
        else
        {
            MIC.SetScalarParameterValue('Scalar_Poison', 0);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Poison', 0);
        }
    }
}

function SetBurnedParameter(float BurnedAmount, optional bool bViaReplication)
{
    local MaterialInstanceConstant MIC;

    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        MIC = ((Outer.GoreMIC != none) ? Outer.GoreMIC : Outer.BodyMIC);
        MIC.SetScalarParameterValue('Scalar_Burnt', BurnedAmount);
        Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Burnt', BurnedAmount);
        if(bViaReplication)
        {
            FireBurnedAmount = BurnedAmount * FireFullyCharredDuration;
        }
    }
}

function SetMicrowaveParameter(float ParamValue)
{
    local MaterialInstanceConstant MIC;

    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(ParamValue > 0.1)
        {
            if(!bSteamEffectActive)
            {
                SetMicrowaveSteamEffects(true);
            }            
        }
        else
        {
            if(bSteamEffectActive)
            {
                SetMicrowaveSteamEffects(false);
            }
        }
        MIC = ((Outer.GoreMIC != none) ? Outer.GoreMIC : Outer.BodyMIC);
        if(Outer.GoreMIC == none)
        {
            MIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2);            
        }
        else
        {
            MIC.SetScalarParameterValue('Scalar_Inflate', 0);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', 0);
        }
    }
}