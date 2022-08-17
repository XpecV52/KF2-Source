/*******************************************************************************
 * KFPawnAfflictions_Patriarch generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawnAfflictions_Patriarch extends KFPawnAfflictions within KFPawn_ZedPatriarch;

protected function SetEMPMatParam(bool bDisrupted, bool bPanicked)
{
    local float EMPValue;

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
        Outer.BodyMIC.SetScalarParameterValue('Scalar_EMP', EMPValue);
        Outer.BodyAltMIC.SetScalarParameterValue('Scalar_EMP', EMPValue);
    }
}

function SetPoisonedOverlay(bool bEnabled)
{
    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bEnabled)
        {
            Outer.BodyMIC.SetScalarParameterValue('Scalar_Poison', 1);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Poison', 1);            
        }
        else
        {
            Outer.BodyMIC.SetScalarParameterValue('Scalar_Poison', 0);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Poison', 0);
        }
    }
}

function SetBurnedParameter(float BurnedAmount, optional bool bViaReplication)
{
    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        Outer.BodyMIC.SetScalarParameterValue('Scalar_Burnt', FMin(BurnedAmount, 0.35));
        Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Burnt', FMin(BurnedAmount, 0.35));
        if(bViaReplication)
        {
            FireBurnedAmount = BurnedAmount * FireFullyCharredDuration;
        }
    }
}

function SetMicrowaveParameter(float ParamValue)
{
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
        if(Outer.GoreMIC == none)
        {
            Outer.BodyMIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2);            
        }
        else
        {
            Outer.BodyMIC.SetScalarParameterValue('Scalar_Inflate', 0);
            Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Inflate', 0);
        }
    }
}

function SetFrozenParameter(float FreezeAmount)
{
    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        Outer.BodyMIC.SetScalarParameterValue('Scalar_Freeze', FreezeAmount);
        Outer.BodyAltMIC.SetScalarParameterValue('Scalar_Freeze', FreezeAmount);
    }
}
