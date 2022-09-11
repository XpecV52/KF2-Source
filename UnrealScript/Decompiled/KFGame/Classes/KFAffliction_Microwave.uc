/*******************************************************************************
 * KFAffliction_Microwave generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAffliction_Microwave extends KFAfflictionAdvanced;

var protected float MicrowavedAmount;
var protected float UsedMicrowavedAmount;
var protected float MicrowaveBurnedAmount;
/** Interp curve that allows us to ramp up how charred a zed looks when hit with microwave */
var() InterpCurveFloat MicroWaveCharCurve;
var protected ParticleSystem SteamingTemplate;
var protected export editinline ParticleSystemComponent SteamingEffect;
var protected bool bSteamEffectActive;
var bool bHasToSpawnFire;
var protected AkEvent OnSteamSound;
var protected AkEvent OnSteamEndSound;

function Activate()
{
    super.Activate();
    SetMicrowavePanicked(true);
}

function DeActivate()
{
    super.DeActivate();
    SetMicrowavePanicked(false);
}

function SetMicrowavePanicked(bool bEnabled)
{
    if(PawnOwner.Role == ROLE_Authority)
    {
        if(MonsterOwner.bMicrowavePanicked != bEnabled)
        {
            MonsterOwner.bMicrowavePanicked = bEnabled;
            MonsterOwner.OnStackingAfflictionChanged(10);
        }
    }
}

event Tick(float DeltaTime)
{
    UpdateMicrowaveMatParam(DeltaTime);
}

protected function UpdateMicrowaveMatParam(float DeltaTime)
{
    local float ParamValue;

    if(PawnOwner.bPlayedDeath)
    {
        ParamValue = 0;        
    }
    else
    {
        if((MonsterOwner != none) && MonsterOwner.bMicrowavePanicked)
        {
            ParamValue = 1;            
        }
        else
        {
            ParamValue = FMin(CurrentStrength / 100, 1);
        }
    }
    if(ParamValue < MicrowavedAmount)
    {
        if(PawnOwner.bPlayedDeath)
        {
            MicrowavedAmount = FMax(MicrowavedAmount - (DeltaTime * 4), 0);            
        }
        else
        {
            MicrowavedAmount = FMax(MicrowavedAmount - (DeltaTime * 0.5), 0);
        }        
    }
    else
    {
        if(ParamValue > MicrowavedAmount)
        {
            MicrowavedAmount = FMin(MicrowavedAmount + (DeltaTime * 2), 1);            
        }
        else
        {
            MicrowavedAmount = ParamValue;
        }
    }
    if(UsedMicrowavedAmount >= 0.1)
    {
        UsedMicrowavedAmount = FMax(MicrowavedAmount, 0.1);        
    }
    else
    {
        UsedMicrowavedAmount = MicrowavedAmount;
    }
    MonsterOwner.RepInflateMatParams.RepInflateMatParam = FloatToByte(UsedMicrowavedAmount);
    MonsterOwner.RepInflateMatParams.bHasToIgniteFlames = bHasToSpawnFire;
    MonsterOwner.RepInflateMatParams.Count += 1;
    if(MonsterOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        SetMaterialParameter(MonsterOwner.GetCurrentInflation());
        UpdateBurnedMatParam(DeltaTime);
    }
}

function UpdateBurnedMatParam(float DeltaTime)
{
    local float ParamValue;
    local KFAffliction_Fire FireAffliction;

    if(!PawnOwner.AfflictionHandler.VerifyAfflictionInstance(1))
    {
        return;
    }
    if(MonsterOwner != none)
    {
        ParamValue = EvalInterpCurveFloat(MicroWaveCharCurve, MonsterOwner.GetCurrentInflation());
        if(ParamValue > MicrowaveBurnedAmount)
        {
            MicrowaveBurnedAmount = ParamValue;            
        }
        else
        {
            ParamValue = MicrowaveBurnedAmount;
        }
        FireAffliction = KFAffliction_Fire(PawnOwner.AfflictionHandler.Afflictions[1]);
        FireAffliction.MicrowaveParamValue = ParamValue;
        if(FireAffliction.CurrentStrength <= float(0))
        {
            FireAffliction.UpdateBurnedMatParam(DeltaTime);
        }
    }
}

function SetMaterialParameter(float ParamValue)
{
    if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(ParamValue > 0.1)
        {
            if(!bSteamEffectActive)
            {
                if(bHasToSpawnFire == false)
                {
                    SetMicrowaveSteamEffects(false);                    
                }
                else
                {
                    SetMicrowaveSteamEffects(true);
                }
            }            
        }
        else
        {
            if(bSteamEffectActive || bHasToSpawnFire == false)
            {
                SetMicrowaveSteamEffects(false);
            }
        }
        if(bHasToSpawnFire == false)
        {
            SetMicrowaveSteamEffects(false);
        }
        if(MonsterOwner != none)
        {
            MonsterOwner.UpdateVisualInflation(ParamValue * 2);
        }
    }
}

protected function SetMicrowaveSteamEffects(bool bEnabled)
{
    if(PawnOwner.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    bSteamEffectActive = bEnabled;
    if(bEnabled)
    {
        if(PawnOwner.bPlayedDeath)
        {
            return;
        }
        if(SteamingEffect == none)
        {
            SteamingEffect = new (self) Class'ParticleSystemComponent';
            SteamingEffect.SetTemplate(SteamingTemplate);
            PawnOwner.Mesh.AttachComponentToSocket(SteamingEffect, EffectSocketName);
            SteamingEffect.ActivateSystem();            
        }
        else
        {
            SteamingEffect.SetStopSpawning(-1, false);
        }
        if(OnSteamSound != none)
        {
            PawnOwner.PlaySoundBase(OnSteamSound, true, true, true);
        }        
    }
    else
    {
        if(SteamingEffect != none)
        {
            SteamingEffect.SetStopSpawning(-1, true);
        }
        if(OnSteamEndSound != none)
        {
            PawnOwner.PlaySoundBase(OnSteamEndSound, true, true);
        }
    }
}

function ShutDown()
{
    if((PawnOwner.WorldInfo.NetMode != NM_DedicatedServer) && CurrentStrength > float(0))
    {
        SetMaterialParameter(0);
    }
    super.ShutDown();
}

defaultproperties
{
    MicroWaveCharCurve=(Points=/* Array type was not detected. */,InVal=0,OutVal=0,ArriveTangent=0,LeaveTangent=0,InterpMode=EInterpCurveMode.CIM_Linear)
    SteamingTemplate=ParticleSystem'FX_Impacts_EMIT.FX_Microwave_steam_01'
    bHasToSpawnFire=true
    bNeedsTick=true
}