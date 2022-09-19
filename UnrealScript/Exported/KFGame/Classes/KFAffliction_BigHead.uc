//=============================================================================
// KFAffliction_BigHead
//=============================================================================
// Affliction for cranial popper
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFAffliction_BigHead extends KFAfflictionAdvanced;

var() float EffectAppliedByStack;
var() float ApplyEffectVel;
var() float RemoveEffectVel;
var() array<float> StackDamageExplosion;
var() byte  MaxStack;
var() byte  MaxStackBobbleHead; 

var transient byte CurrentStack;
var transient float CurrentEffectApplied;
var transient bool bIsBobbleHeadMode; 
var transient bool bIsShrunkenHeads;
var transient byte CurrentMaxStack;

function Init(KFPawn P, EAfflictionType Type, KFPerk InstigatorPerk)
{
    local KFGameReplicationInfo KFGRI;
    local int EndlessWeeklyWaveIdx;
    
	Super.Init(P, Type, InstigatorPerk);

    KFGRI = KFGameReplicationInfo(P.WorldInfo.GRI);

    if (KFGRI != none)
    {
        bIsBobbleHeadMode = (KFGRI.bIsWeeklyMode && KFGRI.CurrentWeeklyIndex == 3) || (KFGRI.IsWeeklyWave(EndlessWeeklyWaveIdx) && EndlessWeeklyWaveIdx == 3);
        bIsShrunkenHeads  = KFGRI.bIsWeeklyMode && KFGRI.CurrentWeeklyIndex == 15;

        if (bIsBobbleHeadMode)
        {
            MaxStack = MaxStackBobbleHead;
        }
    }

    CurrentMaxStack = bIsBobbleHeadMode ? MaxStackBobbleHead : MaxStack;
}

function Activate(optional class<KFDamageType> DamageType = none)
{
    if (CurrentStack < CurrentMaxStack)
    {
        Super.Activate();

        if (!bIsBobbleHeadMode && !bIsShrunkenHeads)
        {
            ++CurrentStack;
        }
    }
}

event Tick(float DeltaTime)
{
    local float Target;

    if ( PawnOwner.bPlayedDeath )
    {
        CurrentStrength= 0.0f;
        super.Deactivate();
        return;
    }

    if (bIsBobbleHeadMode || bIsShrunkenHeads)
    {
        return;
    }

    Target = CurrentStack * EffectAppliedByStack;
    
    if (CurrentEffectApplied != Target)
    {
        if (CurrentEffectApplied < Target)
        {
            CurrentEffectApplied = FMin(CurrentEffectApplied + DeltaTime * ApplyEffectVel, Target);
        }
        else
        {
            CurrentEffectApplied = FMax(CurrentEffectApplied - DeltaTime * ApplyEffectVel, 0.0f);
        }

        PawnOwner.IntendedHeadScale = 1 + CurrentEffectApplied;
        PawnOwner.SetHeadScale(1 + CurrentEffectApplied, PawnOwner.CurrentHeadScale);
        PawnOwner.bNetDirty = true;
    }

    if (CurrentStrength <= 0.0f)
    {
        CurrentStack = 0;
        CurrentStrength = 0.1f;

        if (CurrentEffectApplied <= 0.0f)
        {
            CurrentStrength = 0.0f;
            super.Deactivate();
        }
    }
}

/** Accessor to get known affliction Damage modifier */
function float GetDamageModifier()
{
    local float damage;
    
    damage = bIsBobbleHeadMode ? StackDamageExplosion[MaxStackBobbleHead] : StackDamageExplosion[CurrentStack];

    CurrentStack = 0;

    return damage;
}

defaultproperties
{
   EffectAppliedByStack=0.300000
   ApplyEffectVel=1.000000
   RemoveEffectVel=1.000000
   StackDamageExplosion(0)=0.000000
   StackDamageExplosion(1)=150.000000
   StackDamageExplosion(2)=300.000000
   StackDamageExplosion(3)=500.000000
   StackDamageExplosion(4)=0.000000
   StackDamageExplosion(5)=0.000000
   MaxStack=3
   MaxStackBobbleHead=1
   DissipationRate=10.000000
   bNeedsTick=True
   Name="Default__KFAffliction_BigHead"
   ObjectArchetype=KFAfflictionAdvanced'KFGame.Default__KFAfflictionAdvanced'
}
