//=============================================================================
// KFAffliction_Bleed
//=============================================================================
// Affliction for bleed-based weapons (Ex: Bleed Launcher). After a threshold
//      is reached, initiates material effects on the victim and adds an
//      incapacitation multiplier, similar to user perk multipliers on incaps.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================
class KFAffliction_Bleed extends KFAfflictionAdvanced;

//Point at which the deflate (visual and incap modifier) turn on
var const float DeflateThreshold;

//Incapacitation modifier applied to stun, stumble, and knockdown while in deflate state
var const float IncapModifier;

// Damage modifier applied while in deflate state
var const float DamageModifier;

// Speed modifier applied while in deflate state
var const float SpeedModifier;

// State tracking for speed mod reset
var float PrevStrength;

// Goal deflate when in effect
var const float MaxDeflate;

// Current deflate float value
var float CurDeflate;

// State tracking for deflation
//      When the threshold is crossed, the pawn will blend in and out of 
//      full deflate over a set period of time (or partial time if it's hopping
//      between two states), rather than the % base of microwave.
enum DeflateState
{
    EDS_None,
    EDS_Inflate,
    EDS_Deflate,
};
var DeflateState CurrentDeflateState;

// Rate of change of deflation when a state change occurs
var const float DeflateChangeRate;

/** Accessor to get known affliction knockdown modifier */
function float GetKnockdownModifier()
{
    if (CurrentStrength > DeflateThreshold)
    {
        return IncapModifier;
    }

    return 0.f;
}

/** Accessor to get known affliction Stumble modifier */
function float GetStumbleModifier()
{
    if (CurrentStrength > DeflateThreshold)
    {
        return IncapModifier;
    }

    return 0.f;
}

/** Accessor to get known affliction Stun modifier */
function float GetStunModifier()
{
    if (CurrentStrength > DeflateThreshold)
    {
        return IncapModifier;
    }

    return 0.f;
}

/** Accessor to get known affliction Damage modifier */
function float GetDamageModifier()
{
    if (CurrentStrength > DeflateThreshold)
    {
        return DamageModifier;
    }

    return 0.f;
}

/** Accessor to get known affliction speed modifier */
function float GetSpeedModifier()
{
    if (CurrentStrength > DeflateThreshold)
    {
        return SpeedModifier;
    }

    return 1.f;
}

function Accrue(float InPower)
{
    super.Accrue(InPower);
    if (PawnOwner != none)
    {
        PawnOwner.SetAfflictionSpeedModifier();
    }
}

function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    if (PawnOwner != none && CurrentStrength < DeflateThreshold && PrevStrength > DeflateThreshold)
    {
        PawnOwner.SetAfflictionSpeedModifier();
    }
    UpdateDeflateMaterialParam(DeltaTime);

    PrevStrength = CurrentStrength;
}

/** Network: Server */
protected function UpdateDeflateMaterialParam(float DeltaTime)
{
    //Check each state. If we're in the none state, we want to trigger state changes as appropriate to
    //      kick the visual changes in the next frame.  Otherwise we can simply get out of here.
    switch (CurrentDeflateState)
    {
    case EDS_None:
        CheckStateChange();
        return;
    case EDS_Inflate:
        CalcInflate(DeltaTime);
        break;
    case EDS_Deflate:
        CalcDeflate(DeltaTime);
        break;
    }

    MonsterOwner.RepBleedInflateMatParam = FloatToByte(CurDeflate);
    if (MonsterOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        SetMaterialParameter(CurDeflate);
    }
}

protected function CheckStateChange()
{
    if (PrevStrength == CurrentStrength)
    {
        return;
    }

    //Currently losing bleed strength, can start inflating back up
    if (PrevStrength > CurrentStrength && CurrentStrength < DeflateThreshold)
    {
        CurrentDeflateState = EDS_Inflate;
    }

    //Currently bleeding out, can start deflating
    if (PrevStrength < CurrentStrength && CurrentStrength > DeflateThreshold)
    {
        CurrentDeflateState = EDS_Deflate;
    }
}

protected function CalcInflate(float DeltaTime)
{
    CurDeflate -= DeflateChangeRate * DeltaTime;
    if (CurDeflate < 0)
    {
        CurDeflate = 0.f;
        CurrentDeflateState = EDS_None;
    }
}

protected function CalcDeflate(float DeltaTime)
{
    CurDeflate += DeflateChangeRate * DeltaTime;
    if (CurDeflate >MaxDeflate)
    {
        CurDeflate = MaxDeflate;
        CurrentDeflateState = EDS_None;
    }
}

/** Set scalar parameter value */
function SetMaterialParameter(float ParamValue)
{
    local MaterialInstanceConstant MIC;
    local float InflateParam, DesatParam;

    if (PawnOwner.WorldInfo.NetMode != NM_DedicatedServer && KFPawn_Monster(PawnOwner) != none)
    {
        InflateParam = (!PawnOwner.bIsGoreMesh) ? KFPawn_Monster(PawnOwner).GetCurrentInflation() * 2.0 : 0.f;
        DesatParam = FClamp(Abs(ParamValue / MaxDeflate), 0.0, 1.0);
        foreach PawnOwner.CharacterMICs(MIC)
        {
            // Scale inflate down instantly if gore mesh to avoid holes
            MIC.SetScalarParameterValue('Scalar_Inflate', InflateParam);
            MIC.SetScalarParameterValue('Scalar_SkinDesat', DesatParam);
        }
    }
}

defaultproperties
{
    bNeedsTick=true
    DissipationRate=5.0
    DeflateThreshold=30.0
    IncapModifier=0.3
    DamageModifier=-0.3
    SpeedModifier=0.7f
    MaxDeflate=0.5
    DeflateChangeRate=0.5
}