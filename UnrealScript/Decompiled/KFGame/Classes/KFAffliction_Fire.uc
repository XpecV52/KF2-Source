/*******************************************************************************
 * KFAffliction_Fire generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAffliction_Fire extends KFAfflictionAdvanced;

var protected float FireBurnedAmount;
var protected float FireFullyCharredDuration;
var protected float FireCharPercentThreshhold;
var protected ParticleSystem BurningTemplate;
var protected export editinline ParticleSystemComponent BurningEffect;
var float MicrowaveParamValue;
var protected AkEvent OnFireSound;
var protected AkEvent OnFireEndSound;

function Init(KFPawn P, KFAfflictionManager.EAfflictionType Type)
{
    super.Init(P, Type);
    FireFullyCharredDuration = P.AfflictionHandler.FireFullyCharredDuration;
    FireCharPercentThreshhold = P.AfflictionHandler.FireCharPercentThreshhold;
}

function Activate()
{
    if(!PawnOwner.bPlayedDeath)
    {
        super.Activate();
        SetFirePanicked(true);
    }
}

function DeActivate()
{
    super.DeActivate();
    SetFirePanicked(false);
}

event Tick(float DeltaTime)
{
    UpdateBurnedMatParam(DeltaTime);
}

function SetFirePanicked(bool bEnabled)
{
    if(PawnOwner.Role == ROLE_Authority)
    {
        if(PawnOwner.bFirePanicked == bEnabled)
        {
            return;
        }
        PawnOwner.bFirePanicked = bEnabled;
        PawnOwner.OnStackingAfflictionChanged(1);
    }
    ToggleEffects(bEnabled);
}

function SetMaterialParameter(float BurnedAmount)
{
    local MaterialInstanceConstant MIC;

    if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        foreach PawnOwner.CharacterMICs(MIC,)
        {
            MIC.SetScalarParameterValue('Scalar_Burnt', BurnedAmount);            
        }        
        if(PawnOwner.Role < ROLE_Authority)
        {
            FireBurnedAmount = BurnedAmount * PawnOwner.AfflictionHandler.FireFullyCharredDuration;
        }
    }
}

function ToggleEffects(bool bEnabled, optional bool bDummy)
{
    if(PawnOwner.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(bEnabled)
    {
        if(BurningEffect == none)
        {
            BurningEffect = new (self) Class'ParticleSystemComponent';
            BurningEffect.SetTemplate(BurningTemplate);
            PawnOwner.Mesh.AttachComponentToSocket(BurningEffect, EffectSocketName);
            BurningEffect.ActivateSystem();            
        }
        else
        {
            BurningEffect.SetStopSpawning(-1, false);
        }
        PawnOwner.PlaySoundBase(OnFireSound, true, true, true);
        if(PawnOwner.Role < ROLE_Authority)
        {
            LastActivationTime = PawnOwner.WorldInfo.TimeSeconds;
        }        
    }
    else
    {
        if(BurningEffect != none)
        {
            BurningEffect.SetStopSpawning(-1, true);
        }
        PawnOwner.PlaySoundBase(OnFireEndSound, true, true);
    }
}

function UpdateBurnedMatParam(float DeltaTime)
{
    local float BurnedParam, FinalCharParam;

    if(!PawnOwner.bPlayedDeath && PawnOwner.GetTeamNum() == 0)
    {
        return;
    }
    if((PawnOwner.bPlayedDeath || CurrentStrength > (100 * FireCharPercentThreshhold)) && FireBurnedAmount < FireFullyCharredDuration)
    {
        FireBurnedAmount = FMin(FireBurnedAmount + DeltaTime, FireFullyCharredDuration);
        BurnedParam = FireBurnedAmount / FireFullyCharredDuration;
        if(MicrowaveParamValue > BurnedParam)
        {
            FinalCharParam = MicrowaveParamValue;            
        }
        else
        {
            FinalCharParam = BurnedParam;
        }
        PawnOwner.RepFireBurnedAmount = FloatToByte(FinalCharParam);
        if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
        {
            SetMaterialParameter(FinalCharParam);
        }        
    }
    else
    {
        if(MicrowaveParamValue > float(0))
        {
            BurnedParam = FireBurnedAmount / FireFullyCharredDuration;
            if(MicrowaveParamValue > BurnedParam)
            {
                FinalCharParam = MicrowaveParamValue;                
            }
            else
            {
                FinalCharParam = BurnedParam;
            }
            PawnOwner.RepFireBurnedAmount = FloatToByte(FinalCharParam);
            if(PawnOwner.WorldInfo.NetMode != NM_DedicatedServer)
            {
                SetMaterialParameter(FinalCharParam);
            }
        }
    }
    PawnOwner.DeathFireStackedPower = FloatToByte(CurrentStrength / 100);
}

function ShutDown()
{
    super.ShutDown();
    if(PawnOwner.bTearOff)
    {
        CurrentStrength = ByteToFloat(PawnOwner.DeathFireStackedPower) * 100;
    }
}

defaultproperties
{
    BurningTemplate=ParticleSystem'FX_Gameplay_EMIT.Chr.FX_CHR_Fire'
    OnFireSound=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fleshburn_Loop'
    OnFireEndSound=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Fleshburn_Loop'
    DissipationRate=10
    bNeedsTick=true
}