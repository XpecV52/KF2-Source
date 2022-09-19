//=============================================================================
// KFAfflictionBase
//=============================================================================
// A temporary pawn debuff.  Similar architecture to special moves,
// but without a standardized replication method
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAfflictionBase extends Object
	native(Pawn)
	abstract;

const INCAP_THRESHOLD = 100.f;

/*********************************************************************************************
 * General
 ********************************************************************************************* */

/** Amount of stack currently applied */
var float CurrentStrength;
/** Decay rate copied from owner's incap settings */
var float DissipationRate;

/** Cached reference to the owning pawn */
var	KFPawn 				PawnOwner;
var KFPawn_Monster 		MonsterOwner;

/** Special move to activate on success */
var ESpecialMove	SpecialMove;

/** Length of time after activation before it can recieve additional damage */
var float Cooldown;
/** If there is a duration set and the threshold has been reached then this is how long it lasts */
var float LastActivationTime;

/** True if we need frame accurate dissipation (e.g. scalable material params) */
var bool bNeedsTick;
/** If bShould==FALSE, keep track when DissipationRate was processed */
var float LastDissipationTime;

/** Enable debug logging */
var bool bDebug;

/** */
function Init(KFPawn P, EAfflictionType Type, KFPerk InstigatorPerk)
{
	PawnOwner = P;
	MonsterOwner = KFPawn_Monster(P);

	Cooldown = P.IncapSettings[Type].Cooldown;

	if ( bNeedsTick && DissipationRate > 0 )
	{
		P.AfflictionHandler.AfflictionTickArray.AddItem(self);
	}
}

/** */
function Accrue(float InPower, optional class<KFDamageType> DamageType = none)
{
	// total immunity during cooldown
	if ( LastActivationTime > 0 && (PawnOwner.WorldInfo.TimeSeconds - LastActivationTime) < Cooldown )
	{
		if (bDebug) LogInternal(Class.Name@"rejected because of cooldown");
		return;
	}

	// Apply dissipation over time elapsed
	if ( !bNeedsTick )
	{
		if ( CurrentStrength > 0 )
		{
			CurrentStrength -= DissipationRate * (PawnOwner.WorldInfo.TimeSeconds - LastDissipationTime);
		}
		LastDissipationTime = PawnOwner.WorldInfo.TimeSeconds;
	}

	// clamp to a valid range
	CurrentStrength = fClamp(CurrentStrength + InPower, InPower, INCAP_THRESHOLD);
	if ( CurrentStrength >= INCAP_THRESHOLD )
	{
		Activate(DamageType);
	}

	if (bDebug) LogInternal(Class.Name@"Added="$InPower@"NewStrength="$CurrentStrength);
}

/** */
function Activate(optional class<KFDamageType> DamageType = none)
{
	if ( SpecialMove != SM_None )
	{
	    if( PawnOwner.IsAliveAndWell() )
	    {
	        PawnOwner.DoSpecialMove( SpecialMove, true,, GetSpecialMoveFlags() );
	    }
	    CurrentStrength = 0;
	}

	LastActivationTime = PawnOwner.WorldInfo.TimeSeconds;
	if (bDebug) LogInternal(Class.Name@"was activated");
}

/** For subclass special instructions */
function byte GetSpecialMoveFlags();

/** any special shutdown handling */
function Shutdown();

/** Clientside call to toggle replicated effects on/off */
function ToggleEffects(bool bPrimary, optional bool bSecondary)
{
	WarnInternal("called without having a subclass implementation. Will have errors online.");
}

/** Clientside call, usually on a tick, to update a material param */
function SetMaterialParameter(float Value)
{
	WarnInternal("called without having a subclass implementation. Will have errors online.");
}

/** called per tick while CurrentStrength > 0 */
event Tick(float DeltaTime);

/** Accessor to get known affliction knockdown modifier */
function float GetKnockdownModifier()
{
    return 0.f;
}

/** Accessor to get known affliction Stumble modifier */
function float GetStumbleModifier()
{
    return 0.f;
}

/** Accessor to get known affliction Stun modifier */
function float GetStunModifier()
{
    return 0.f;
}

/** Accessor to get known affliction Damage modifier */
function float GetDamageModifier()
{
    return 0.f;
}

/** Accessor to get known affliction speed modifier */
function float GetSpeedModifier()
{
    return 1.f;
}

/** Accessor to get known melee speed modifier */
function float GetAttackSpeedModifier()
{
	return 1.f;
}

function float GetDamageTakenModifier()
{
	return 0.f;
}

defaultproperties
{
   DissipationRate=20.000000
   Name="Default__KFAfflictionBase"
   ObjectArchetype=Object'Core.Default__Object'
}
