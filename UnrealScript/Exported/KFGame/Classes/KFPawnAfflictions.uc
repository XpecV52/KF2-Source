//=============================================================================
// KFPawnAfflictions
//=============================================================================
// Handles negative status effects that can be applied to a KFPawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawnAfflictions extends Object within KFPawn
	native(Pawn);

/** Abstracted body parts that can be associated with multiple zones */
enum EHitZoneBodyPart
{
	BP_None,
	BP_Head,
	BP_Torso,
	BP_LeftArm,
	BP_RightArm,
	BP_LeftLeg,
	BP_RightLeg,
	BP_Special,
};

/** Per hitzone incap effect resistances */
struct native IncapResist
{
	var() const byte Head;
	var() const byte Torso;
	var() const byte Leg;
	var() const byte Arm;
	var() const byte Special;

	/** Additional resist applied as health approaches zero */
	var() const byte LowHealthBonus;

	/** How long after this incap occurs can it happen again. Prevents pawns from getting spammed with incaps */
	var() const   float Cooldown;
	var transient float LastStartTime;

	structdefaultproperties
	{
		Head=255
		Torso=255
		Leg=255
		Arm=255
		Special=255
		Cooldown=2.f
		LastStartTime=-100.f
	}
};

/* Types of instant afflictions that are used to index the InstantIncaps array */
enum EInstantIncaps
{
	/* special move afflictions */
	IAF_Knockdown,
	IAF_Stun,
	IAF_Stumble,
	IAF_LegStumble,

	/** hit reactions (flinch) */
	IAF_MeleeHit,
	IAF_GunHit,

	IAF_Custom1,
	IAF_Custom2,
	IAF_Custom3,
};

/** Full body incap with stackable IncapPower */
struct native StackingIncapInfo
{
	/** The threshhold that must be crossed to activate this stacked incap */
    var() float Threshhold;
	/** How long this incap lasts once triggered */
	var() float Duration;
	/** How long after this incap is triggered til it can be triggered again */
	var() float Cooldown;
	/** Rate at which the StackedPower will dissipate. Default is 1.0 per second */
	var() float DissipationRate;

	/** Tracks when this incap was last triggered */
	var transient float LastStartTime;
    /** How much incap power is currently stacked up */
	var transient float StackedPower;

	structdefaultproperties
	{
		Threshhold=1.0
        Duration=5.0
		Cooldown=0.f
		DissipationRate=1.0
	}
};

/* Types of stacking afflictions that are used to index the StackingIncaps array */
enum EStackingIncaps
{
	/** All Pawns */
	SAF_EMPPanic,
	SAF_FirePanic,

	/** AI */
	SAF_Poison,
	SAF_Microwave,
	SAF_EMPDisrupt,
	SAF_Freeze,

	SAF_Custom1,
	SAF_Custom2,
	SAF_Custom3
};

/** Debug logging */
var protected bool bDebugLog;

/** Cached mosnter instance for certain FX */
var protected KFPawn_Monster 	MonsterOwner;

/*********************************************************************************************
 * Settings for specific stacking afflictions until we have an OO system
 ********************************************************************************************* */

/** How burned is this zed currently? */
var protected float 	FireBurnedAmount;
/** How long does a pawn have to be burning over the heat threshhold to get to fully charred skin */
var protected float		FireFullyCharredDuration;
/** When over this % on the FirePanicResist.StackedPower, apply charring to the skin shader. Think of it like how "hot" the character needs to get before its shader gets char applied */
var protected float 	FireCharPercentThreshhold;
var protected bool 		bNoBurnedMatBeforeDeath;

/** How microwaved is this zed currently? */
var protected float 	MicrowavedAmount;
/** How microwaved is this zed currently displaying? Used so we can cap how unfluffed the zed gets */
var protected float 	UsedMicrowavedAmount;
/** How burned from microwaves is this zed currently? */
var protected float 	MicrowaveBurnedAmount;
/** Interp curve that allows us to ramp up how charred a zed looks when hit with microwave **/
var() InterpCurveFloat MicroWaveCharCurve;
/** On Microwave Steam Effect Template */
var protected ParticleSystem				SteamingTemplate;
/** On Microwave Steam Effect Particle System Component */
var protected ParticleSystemComponent		SteamingEffect;
/** The microwave steam effect is active */
var protected bool		bSteamEffectActive;

/** On Fire Effect Template */
var protected ParticleSystem				BurningTemplate;
/** On Fire Effect Particle System Component */
var protected ParticleSystemComponent		BurningEffect;
/** On EMP Panic Effect Template */
var protected ParticleSystem				EmpPanicTemplate;
/** EMP Panic Particle System Component */
var protected ParticleSystemComponent		EMPPanicEffect;
/** On EMP Disrupt Template */
var protected ParticleSystem				EmpDisruptTemplate;
/** EMP Disrupt Effect Particle System Component, this is smaller and exists on a disrupted weapon like the husks gun */
var protected ParticleSystemComponent		EMPDisruptEffect;

/** On Fire Effect Socket */
var protected name                          EffectSocketName;
/** The location of EMP Disrupt, this is a smaller effect that should exist on a disrupted weapon like the husks gun */
var protected name                        	EMPDisruptSocketName;

/** Sound to play when this pawn is on fire */
var protected AkEvent OnFireSound;
/** Sound to play when this pawn stops being on fire */
var protected AkEvent OnFireEndSound;

/** Sound to play when this pawn is on fire */
var protected AkEvent OnSteamSound;
/** Sound to play when this pawn stops being on fire */
var protected AkEvent OnSteamEndSound;

/** Sound to play when this pawn has been EMP'd */
var protected AkEvent OnEMPSound;
/** Sound to play when this pawn stops being EMP'd */
var protected AkEvent OnEMPEndSound;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
* @name		Take Damage
********************************************************************************************* */

/** Check, and if needed activate afflictions after being hit (Server only) */
function NotifyTakeHit(Controller DamageInstigator, vector HitDir, class<KFDamageType> DamageType)
{
	local KFPerk InstigatorPerk;

	if( DamageType == none )
	{
		return;
	}

	// Allow damage instigator perk to modify reaction
	if ( DamageInstigator != None && DamageInstigator.bIsPlayer )
	{
		InstigatorPerk = KFPlayerController(DamageInstigator).GetPerk();
	}

    // For now all below effects are for Zeds
    if( GetTeamNum() > 254 && !bPlayedDeath )
    {
        CheckSpecialMoveAfflictions(InstigatorPerk, HitDir, DamageType);
        CheckHitReactionAfflictions(DamageType);
    }

    CheckStackingAfflictions(InstigatorPerk, DamageType);
}

/**
 * Client side test to predict whether or not DoPauseAI is called.  May not always
 * be correct but as long as we use split-body anims it will still look okay
 */
function byte GetPredictedHitReaction(class<KFDamageType> DamageType, EHitZoneBodyPart BodyPart)
{
	// This may not always match the server's result, but as long
	// as we avoid playing FullBody anims it should look okay even if DoPauseAI is skipped.
	if ( DamageType.default.MeleeHitPower > 0
		&& ShouldApply(IAF_MeleeHit, BodyPart, DamageType.default.MeleeHitPower,, true) )
	{
		return HIT_Heavy;
	}
	else if ( DamageType.default.GunHitPower > 0
		&& ShouldApply(IAF_GunHit, BodyPart, DamageType.default.GunHitPower,, true) )
	{
		return HIT_Medium;
	}

	return HIT_Light;
}

/*********************************************************************************************
* @name		Internal (On Hit)
********************************************************************************************* */

/** Afflictions which activate special moves */
protected function CheckSpecialMoveAfflictions(KFPerk InstigatorPerk, vector HitDir, class<KFDamageType> DamageType)
{
	local EHitZoneBodyPart BodyPart;
	local byte HitZoneIdx;
	local vector HitLoc;
	local float KnockdownPowerModifier, StumblePowerModifier, StunPowerModifier;
	local float StumbleCooldownModifier;
	local bool bForceKnockdown, bForceStumble, bForceStun;

	// This is for damage over time, DoT shall never have momentum
	if( IsZero( HitDir ) )
	{
		return;
	}

	HitZoneIdx = HitFxInfo.HitBoneIndex;
	HitLoc = HitFxInfo.HitLocation;
	BodyPart = (HitZoneIdx != 255) ? HitZones[HitZoneIdx].Limb : BP_Torso;

    // Initialize perk benefits
    KnockdownPowerModifier = 1.f;
    StumblePowerModifier = 1.f;
    StumbleCooldownModifier = 1.f;
    StunPowerModifier = 1.f;

	// Allow damage instigator perk to modify reaction
    if ( InstigatorPerk != None )
    {
        KnockdownPowerModifier = InstigatorPerk.GetKnockdownPowerModifier( DamageType, BodyPart, bIsSprinting );
        StumblePowerModifier = InstigatorPerk.GetStumblePowerModifier( Outer, DamageType, StumbleCooldownModifier, BodyPart );
        StunPowerModifier = InstigatorPerk.GetStunPowerModifier( DamageType, HitZoneIdx );
    }

    // If knockdown power would equal or exceed max resistance, always knockdown
    if( KnockdownPowerModifier >= 255.f )
    {
    	bForceKnockdown = true;
    }

    // If stumble power would equal or exceed max resistance, always stumble
    if( StumblePowerModifier >= 255.f )
    {
    	bForceStumble = true;
    }

    // If stun power would equal or exceed max resistance, always stun
    if( StunPowerModifier >= 255.f )
    {
    	bForceStun = true;
    }

	// Check knockdown
	if ( (bForceKnockdown || DamageType.default.KnockdownPower > 0) && CanDoSpecialmove(SM_Knockdown)
		&& ShouldApply(IAF_Knockdown, BodyPart, bForceKnockdown ? 256 : int(DamageType.default.KnockdownPower * KnockdownPowerModifier)) )
	{
		ActivateKnockdown(DamageType, HitLoc, HitDir, HitZoneIdx);
	}
	// Check stun
	else if ( (bForceStun || DamageType.default.StunPower > 0) && CanDoSpecialmove(SM_Stunned)
		&& ShouldApply(IAF_Stun, BodyPart, bForceStun ? 256 : int(DamageType.default.StunPower * StunPowerModifier)) )
	{
		DoSpecialMove(SM_Stunned);
	}
	// Check leg stumble
	else if ( (bForceStumble || DamageType.default.LegStumblePower > 0) && CanDoSpecialmove(SM_Stumble)
		&& ShouldApply(IAF_LegStumble, BodyPart, (bForceStumble ? 256 : int(DamageType.default.LegStumblePower * StumblePowerModifier)), StumbleCooldownModifier) )
	{
		DoSpecialMove(SM_Stumble,,, class'KFSM_Stumble'.static.PackLegHitSMFlags(Outer, HitDir, BodyPart == BP_LeftLeg));
	}
	// Check body stumble
	else if ( (bForceStumble || DamageType.default.StumblePower > 0) && CanDoSpecialmove(SM_Stumble)
		&& ShouldApply(IAF_Stumble, BodyPart, (bForceStumble ? 256 : int(DamageType.default.StumblePower * StumblePowerModifier)), StumbleCooldownModifier) )
	{
		DoSpecialMove(SM_Stumble,,, class'KFSM_Stumble'.static.PackBodyHitSMFlags(Outer, HitDir));
	}
}

/** Afflications which pause AI behavior temporarily */
protected function CheckHitReactionAfflictions(class<KFDamageType> DamageType)
{
	local EHitZoneBodyPart BodyPart;
	local byte HitZoneIdx;

	// Finally, 'Pause' the AI if we're going to play a medium or heavy hit reaction anim in TryPlayHitReactionAnim
	if ( MyKFAIC != None && SpecialMove == SM_None )
	{
		HitZoneIdx = HitFxInfo.HitBoneIndex;
		BodyPart = (HitZoneIdx != 255) ? HitZones[HitZoneIdx].Limb : BP_Torso;

		// Check hard hit reaction
		if ( DamageType.default.MeleeHitPower > 0
			&& ShouldApply(IAF_MeleeHit, BodyPart, DamageType.default.MeleeHitPower) )
		{
			MyKFAIC.DoPauseAI( DamageRecoveryTimeHeavy, true );
		}
		// Force recovery time for the headless hit. GetTimerCount() is a dirty way to do this only on the frame of CauseHeadTrauma()
		if ( HitZoneIdx == HZI_Head && IsHeadless() && GetTimerCount('BleedOutTimer', Outer) == 0.f )
		{
			MyKFAIC.DoPauseAI( DamageRecoveryTimeHeavy, true );
		}
		// Check medium hit reaction
		else if ( DamageType.default.GunHitPower > 0
			&& ShouldApply(IAF_GunHit, BodyPart, DamageType.default.GunHitPower) )
		{
			MyKFAIC.DoPauseAI( DamageRecoveryTimeMedium, true );
		}
	}
}

/** Afflications that accumlate/decay over time */
protected function CheckStackingAfflictions(KFPerk InstigatorPerk, class<KFDamageType> DamageType)
{
	local bool bCanCausePoisonPanic;

	// stacking afflictions can apply on killing blow
	if ( bPlayedDeath && WorldInfo.TimeSeconds > TimeOfDeath )
	{
	    // If we're already dead, go ahead and apply burn stacking power, just
	    // so we can do the burn effects
	    if ( DamageType.default.BurnPower > 0 )
		{
	        AccrueStackingAffliction(SAF_FirePanic, DamageType.default.BurnPower);
		}

		return;
	}

	if ( InstigatorPerk != None )
    {
        // You can currently only deal poison if the skill AcidicCompound is active
        bCanCausePoisonPanic = InstigatorPerk.IsAcidicCompoundActive();
    }

	// SetEMPPanicked
	if ( DamageType.default.EMPPower > 0
		&& AccrueStackingAffliction(SAF_EMPPanic, DamageType.default.EMPPower) )
	{
        SetEMPPanicked(true);
	}

	// Check Fire
	if ( DamageType.default.BurnPower > 0
		&& AccrueStackingAffliction(SAF_FirePanic, DamageType.default.BurnPower) )
	{
        SetFirePanicked(true);
	}

	if ( bCanCausePoisonPanic && DamageType.default.PoisonPower > 0
		&& AccrueStackingAffliction(SAF_Poison, DamageType.default.PoisonPower) )
	{
		SetPoisoned(true);
	}

	if ( DamageType.default.MicrowavePower > 0
		&& AccrueStackingAffliction(SAF_Microwave, DamageType.default.MicrowavePower) )
	{
		SetMicrowavePanicked(true);
	}

	if ( DamageType.default.FreezePower > 0
		&& AccrueStackingAffliction(SAF_Freeze, DamageType.default.FreezePower) )
	{
		SetFrozen(true);
	}

    // Apply the Disruption EMP effects if they are over the threshhold
    if( DamageType.default.EMPPower > 0
    	&& AccrueStackingAffliction(SAF_EMPDisrupt, DamageType.default.EMPPower) )
    {
        SetEMPDisrupted(true);
    }
}

/*********************************************************************************************
* @name		Instant / Special Move Afflications
********************************************************************************************* */

/** Returns true if the threshold is exceeded */
protected function bool ShouldApply(EInstantIncaps Id, EHitZoneBodyPart BodyPart, int InPower, optional float CooldownModifier=1.0, optional bool bTestOnly)
{
	local byte BaseResistValue;
	local float PercentHealth;

	if( InPower <= 0 )
	{
		return false;
	}

	if ( Id >= InstantIncaps.Length )
	{
		return false; // immune
	}

	switch ( BodyPart )
	{
	case BP_Head: 		BaseResistValue = InstantIncaps[Id].Head; break;
	case BP_Torso:		BaseResistValue = InstantIncaps[Id].Torso; break;
	case BP_LeftArm:	BaseResistValue = InstantIncaps[Id].Arm; break;
	case BP_RightArm:	BaseResistValue = InstantIncaps[Id].Arm; break;
	case BP_LeftLeg:	BaseResistValue = InstantIncaps[Id].Leg; break;
	case BP_RightLeg:	BaseResistValue = InstantIncaps[Id].Leg; break;
	case BP_Special:	BaseResistValue = InstantIncaps[Id].Special; break;
	default:
		return FALSE;
	}

	if ( BaseResistValue < 255 )
	{
		if (bDebugLog) LogInternal(Id@self@"Resistance is Base:"@BaseResistValue@"LowHealthBonus:"@InstantIncaps[Id].LowHealthBonus@"Power: "$InPower,'StatusEffect');

		if ( (WorldInfo.TimeSeconds - InstantIncaps[Id].LastStartTime) < (InstantIncaps[Id].Cooldown*CooldownModifier) )
		{
			if (bDebugLog) LogInternal(Id@"rejected because of cooldown",'StatusEffect');
			return FALSE;
		}

		if ( InPower < BaseResistValue )
		{
			if (bDebugLog) LogInternal(Id@"resisted (regardless of health)",'StatusEffect');
			return FALSE;
		}

		if ( InPower < BaseResistValue + InstantIncaps[Id].LowHealthBonus )
		{
			// Use OldHealth to get pre-damage percentage
			PercentHealth = GetOwnerHealthPercent();
			if ( InPower < (BaseResistValue + (1.f - PercentHealth) * InstantIncaps[Id].LowHealthBonus) )
			{
				if (bDebugLog) LogInternal(Id@"resisted because Health is at"@PercentHealth$"%",'StatusEffect');
				return FALSE;
			}
		}

		if ( !bTestOnly )
		{
			InstantIncaps[Id].LastStartTime = WorldInfo.TimeSeconds;
		}
		if (bDebugLog) LogInternal(Id@"applied >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",'StatusEffect');
		return TRUE;
	}

	return FALSE;
}

/** 0-1 */
function float GetOwnerHealthPercent()
{
	local KFPawn_Monster P;

	P = GetMonsterOwner();
	if ( P != None )
	{
		return FMin(P.OldHealth / float(HealthMax), 1.f);
	}

	return FMin(Health / float(HealthMax), 1.f);
}

/*********************************************************************************************
* @name		Stacked / Accumulated Afflications
********************************************************************************************* */

/**
 * Adds StackedPower
 * @return true if the affliction effect should be applied
 */
function bool AccrueStackingAffliction(EStackingIncaps Id, float InPower)
{
	if ( Id >= StackingIncaps.Length || InPower <= 0 || StackingIncaps[Id].Duration <= 0)
	{
		return FALSE; // immune
	}

	if ( (WorldInfo.TimeSeconds - StackingIncaps[Id].LastStartTime) < StackingIncaps[Id].Cooldown )
	{
		if (bDebugLog) LogInternal(GetFuncName()@"rejected because of cooldown:"$Id);
		return false;
	}

	StackingIncaps[Id].StackedPower += InPower;

	if (bDebugLog) LogInternal(GetFuncName()@Id@"Threshold:"$StackingIncaps[Id].Threshhold@"Power:"$StackingIncaps[Id].StackedPower);

	if ( StackingIncaps[Id].Threshhold > StackingIncaps[Id].StackedPower )
	{
		if (bDebugLog) LogInternal(GetFuncName()@"rejected because of threshold:"$Id);
		return FALSE;
	}

	StackingIncaps[Id].LastStartTime = WorldInfo.TimeSeconds;
	if (bDebugLog) LogInternal(GetFuncName()@"accepted:"$Id);
	return TRUE;
}

/** Workaround cached pawn until we have an OO system */
function KFPawn_Monster GetMonsterOwner()
{
	if ( MonsterOwner != None )
	{
		return MonsterOwner;
	}

	MonsterOwner = KFPawn_Monster(Outer);
	return MonsterOwner;
}

/*********************************************************************************************
* ACTIVATION
* It would be great if we could move to a object oriented approach, but for
* now drop all the specific implementations here
********************************************************************************************* */

/*********************************************************************************************
* @name		Knockdown
********************************************************************************************* */

/** Apply a knockdown (on hit) to this character */
protected function ActivateKnockdown(class<DamageType> damageType, vector HitLoc, vector HitDir, byte HitZoneIdx)
{
	local vector Impulse;

	// Handle explosive damage types as radial impulses
	if ( DamageType.default.RadialDamageImpulse > 0 && ClassIsChildOf(damageType, class'KFDT_Explosive') )
	{
		Impulse = DamageType.default.RadialDamageImpulse * HitDir;
		// If we have a cached RadiusDamageScale, assume it's from this hit and use it to calc the radius impulse falloff
		if ( HitFxInfo.bRadialDamage  && HitFxRadialInfo.RadiusDamageScale != 255 )
		{
			Impulse *= ByteToFloat(HitFxRadialInfo.RadiusDamageScale);
		}
		// Add the deathUpKick here for extra oomph
		Impulse += Vect(0,0,1) * DamageType.default.KDeathUpKick;

		// Since we don't have the proper Origin, Radius, and Falloff in TakeDamage use a
		// point impulse, but fake it to to look like a radial impulse.  This is done by:
		// 1) Zeroing the Position.  This causes AddImpulse to call addForce (same as with RadialImpulse) instead of addForceAtPos
		// 2) Zeroing the BoneName.  With AddRadialImpulse, GetNxActor() has no BoneName so addForce will use the root body
		Knockdown(, vect(1,1,1),,,, Impulse);
	}
	else
	{
		// An artifical RBAngularVelocity is used for replication, see NEQ()
		Knockdown(, vect(1,1,1),,,, DamageType.default.KDamageImpulse * HitDir, HitLoc, HitZoneIdx);
	}
}

/*********************************************************************************************
* @name		EMP Panic+Disrupt
********************************************************************************************* */

/** Set the EMP disrupt functionality */
event SetEMPDisrupted(bool bEnabled)
{
    if( Role == ROLE_Authority )
    {
    	if( bEmpDisrupted == bEnabled )
    	{
    		return;
    	}

        bEmpDisrupted = bEnabled;

        // Notify special moves that they've been disrupted
	    if( IsDoingSpecialMove() )
	    {
	    	SpecialMoves[SpecialMove].OnEMPDisrupted();
	   	}

        OnStackingAfflictionChanged(SAF_EMPDisrupt);
    }
    SetEMPEffects(bEmpDisrupted, bEmpPanicked);
}

/** Set the EMP disrupt functionality */
event SetEMPPanicked(bool bEnabled)
{
    if( Role == ROLE_Authority )
    {
    	if( bEmpPanicked == bEnabled )
    	{
    		return;
    	}

        bEmpPanicked = bEnabled;
        OnStackingAfflictionChanged(SAF_EMPPanic);
    }
    SetEMPEffects(bEmpDisrupted, bEmpPanicked);
}

/** Enable/Disable the EMP overlay effect */
function SetEMPEffects(bool bDisrupted, bool bPanicked)
{
	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( bDisrupted )
		{
			if( EMPDisruptEffect == none )
			{
	    		EMPDisruptEffect = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(EmpDisruptTemplate, Mesh, EMPDisruptSocketName, true);
			}
		}
		else if( EMPDisruptEffect != none )
		{
			DetachEmitter( EMPDisruptEffect );
		}

		if( bPanicked && EMPPanicEffect == none )
		{
        	PlaySoundBase(OnEMPSound, true, true, true);
	    	EMPPanicEffect = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(EMPPanicTemplate, Mesh, EffectSocketName, false);
		}
		else if( EMPPanicEffect != none )
		{
        	PlaySoundBase(OnEMPEndSound, true, true );
        	DetachEmitter( EMPPanicEffect );
		}

		SetEMPMatParam(bDisrupted, bPanicked);
    }
}

/** Enable/Disable the EMP overlay effect */
protected function SetEMPMatParam(bool bDisrupted, bool bPanicked)
{
	local MaterialInstanceConstant MIC;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		MIC = (GoreMIC != None) ? GoreMIC : BodyMIC;

        if( bPanicked )
	    {
            MIC.SetScalarParameterValue('Scalar_EMP',5.0);
        }
        else if( bDisrupted )
        {
            MIC.SetScalarParameterValue('Scalar_EMP',1.0);
        }
        else
        {
            MIC.SetScalarParameterValue('Scalar_EMP',0.0);
        }
    }
}

/*********************************************************************************************
* @name		Fire Panic
********************************************************************************************* */

/** Set the fire panic functionality */
event SetFirePanicked(bool bEnabled)
{
    if( Role == ROLE_Authority )
    {
    	if( bFirePanicked == bEnabled )
    	{
    		return;
    	}
		bFirePanicked = bEnabled;
        OnStackingAfflictionChanged(SAF_FirePanic);
    }
    else if( bEnabled )
    {
        // So the client knows when to stop burning
		StackingIncaps[SAF_FirePanic].LastStartTime = WorldInfo.TimeSeconds;
    }

    SetFirePanicEffects(bEnabled);
}

/** Enable/Disable the Burned material effect */
function SetBurnedParameter(float BurnedAmount, optional bool bViaReplication)
{
	local MaterialInstanceConstant MIC;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		MIC = (GoreMIC != None) ? GoreMIC : BodyMIC;
        MIC.SetScalarParameterValue('Scalar_Burnt',BurnedAmount);

        if ( bViaReplication )
        {
        	FireBurnedAmount = BurnedAmount * FireFullyCharredDuration;
        }
    }
}

/** On death send FirePanic strength to all clients so they can continue to burn */
function TearOffFirePanic(byte ServerFirePct)
{
	StackingIncaps[SAF_FirePanic].StackedPower = ByteToFloat(ServerFirePct) * StackingIncaps[SAF_FirePanic].Threshhold;
}

/** Set whether or not this pawn is doing the burning effects */
protected function SetFirePanicEffects(bool bEnabled)
{
	// Don't do the effects on a dedicated server
    if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
        return;
    }

    if( bEnabled )
    {
		if( BurningEffect == none )
		{
			BurningEffect = new(self) class'ParticleSystemComponent';
			BurningEffect.SetTemplate( BurningTemplate );
			Mesh.AttachComponentToSocket( BurningEffect, EffectSocketName );
			BurningEffect.ActivateSystem();
		}
		else
		{
			BurningEffect.SetStopSpawning( -1, false );
		}

        PlaySoundBase( OnFireSound, true, true, true );
	}
	else
	{
		if( BurningEffect != none )
		{
            BurningEffect.SetStopSpawning( -1, true );
        }

        PlaySoundBase( OnFireEndSound, true, true );
	}
}

/** Net: Server */
protected event UpdateBurnedMatParam( float DeltaTime )
{
	local KFPawn_Monster P;
	local float MicrowaveParamValue;
	local float BurnedParam;
	local float FinalCharParam;

	if ( bNoBurnedMatBeforeDeath && !bPlayedDeath )
	{
		return;
	}

    P = GetMonsterOwner();

    // Set the burned value from being microwaved
    if( P != none )
    {
        MicrowaveParamValue = EvalInterpCurveFloat(MicroWaveCharCurve, ByteToFloat(P.RepInflateMatParam));
        // Only make them more burned, not less. You never "unburn"
        if( MicrowaveParamValue > MicrowaveBurnedAmount )
        {
            MicrowaveBurnedAmount = MicrowaveParamValue;
        }
        else
        {
            MicrowaveParamValue = MicrowaveBurnedAmount;
        }
    }

	// Add additional char to the skin if we're over the threshhold
    if( (bPlayedDeath || StackingIncaps[SAF_FirePanic].StackedPower > (StackingIncaps[SAF_FirePanic].Threshhold * FireCharPercentThreshhold)) && FireBurnedAmount < FireFullyCharredDuration )
    {
        FireBurnedAmount = FMin(FireBurnedAmount + DeltaTime, FireFullyCharredDuration);

        BurnedParam = FireBurnedAmount/FireFullyCharredDuration;

        // Use whichever is more burned, fire or microwave burn
        if( MicrowaveParamValue > BurnedParam )
        {
            FinalCharParam = MicrowaveParamValue;
            MicrowaveBurnedAmount = FinalCharParam;
        }
        else
        {
            FinalCharParam =  BurnedParam;
        }

        RepFireBurnedAmount = FloatToByte(FinalCharParam);

        if( WorldInfo.NetMode != NM_DedicatedServer )
        {
            SetBurnedParameter(FinalCharParam);
        }
    }
    // Handle exclusive microwave burn
    else if( MicrowaveParamValue > 0 )
    {
        BurnedParam = FireBurnedAmount/FireFullyCharredDuration;

        // Use whichever is more burned, fire or microwave burn
        if( MicrowaveParamValue > BurnedParam )
        {
            FinalCharParam = MicrowaveParamValue;
        }
        else
        {
            FinalCharParam =  BurnedParam;
        }

        RepFireBurnedAmount = FloatToByte(FinalCharParam);

        if( WorldInfo.NetMode != NM_DedicatedServer )
        {
            SetBurnedParameter(FinalCharParam);
        }
    }

    DeathFireStackedPower = FloatToByte(StackingIncaps[SAF_FirePanic].StackedPower/StackingIncaps[SAF_FirePanic].Threshhold);
}

/*********************************************************************************************
* @name		Poisoned
********************************************************************************************* */

/** Set the EMP disrupt functionality */
event SetPoisoned(bool bEnabled)
{
	local KFPawn_Monster P;

	// @hack: always get a cached owner for the C++ decay code
	P = GetMonsterOwner();

    if( Role == ROLE_Authority )
    {
    	if( P.bIsPoisoned == bEnabled )
    	{
    		return;
    	}

        P.bIsPoisoned = bEnabled;
        OnStackingAfflictionChanged(SAF_Poison);
    }
    SetPoisonedOverlay(bEnabled);
}

function SetPoisonedOverlay( bool bEnabled )
{
	local MaterialInstanceConstant MIC;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		MIC = (GoreMIC != None) ? GoreMIC : BodyMIC;
		if( bEnabled )
		{
        	MIC.SetScalarParameterValue('Scalar_Poison',1.0);
    	}
    	else
    	{
        	MIC.SetScalarParameterValue('Scalar_Poison',0.0);
    	}
    }
}

/*********************************************************************************************
* @name		Frozen
********************************************************************************************* */

/** Set the freeze functionality */
event SetFrozen(bool bEnabled)
{
	if( !IsAliveAndWell() )
	{
		return;
	}

    if( Role == ROLE_Authority )
    {
        OnStackingAfflictionChanged(SAF_Freeze);
        DoSpecialMove( SM_Frozen, true );
    }
}

/** Enable/Disable the Frozen material effect */
function SetFrozenParameter(float FreezeAmount)
{
	local MaterialInstanceConstant MIC;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		MIC = (GoreMIC != None) ? GoreMIC : BodyMIC;
        MIC.SetScalarParameterValue( 'Scalar_Freeze', FreezeAmount );
    }
}

/*********************************************************************************************
* @name		Microwave Inflate
********************************************************************************************* */

/** Set the fire panic functionality */
event SetMicrowavePanicked(bool bEnabled)
{
	local KFPawn_Monster P;

    if( Role == ROLE_Authority )
    {
    	P = GetMonsterOwner();
    	if( P.bMicrowavePanicked != bEnabled )
    	{
			P.bMicrowavePanicked = bEnabled;
			OnStackingAfflictionChanged(SAF_Microwave);
    	}
    }
}

/** Network: Server */
protected event UpdateMicrowaveMatParam( float DeltaTime )
{
	local KFPawn_Monster P;
	local float ParamValue;

    P = GetMonsterOwner();

    // If we're dead, turn off inflate
    if( bPlayedDeath )
    {
        ParamValue=0.0;
    }
    // If we're microwave panicked, turn the inflate all the way up
    else if( P != none && P.bMicrowavePanicked )
    {
        ParamValue=1.0;
	}
	// Set the inflate to our incap power
	else
	{
        ParamValue = FMin(StackingIncaps[SAF_Microwave].StackedPower / StackingIncaps[SAF_Microwave].Threshhold, 1.f);
	}

    // Deflating over time
    if( ParamValue < MicrowavedAmount )
    {
        // If we're dead, ramp down the inflate really fast
        if( bPlayedDeath )
        {
            MicrowavedAmount = FMax(MicrowavedAmount - (DeltaTime * 4.0), 0);
        }
        // Ramp down the inflate over time
        else
        {
            MicrowavedAmount = FMax(MicrowavedAmount - (DeltaTime * 0.5), 0);
        }
    }
    // Inflating over time
    else if( ParamValue > MicrowavedAmount )
    {
        MicrowavedAmount = FMin(MicrowavedAmount + DeltaTime * 2.0, 1);
    }
    // Not inflating or deflating, just use the same value
    else
    {
        MicrowavedAmount = ParamValue;
    }

    // If we've already been inflated a bit, don't let us completely deflate
    if( UsedMicrowavedAmount >= 0.1 )
    {
        // Store what we used for the inflate parameter to check against later
        UsedMicrowavedAmount = FMax(MicrowavedAmount, 0.1);
    }
    else
    {
        // Store what we used for the inflate parameter to check against later
        UsedMicrowavedAmount = MicrowavedAmount;
    }

	// Set the replicated inflate value
    P.RepInflateMatParam = FloatToByte(UsedMicrowavedAmount);

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        SetMicrowaveParameter(UsedMicrowavedAmount);
    }

    // Update the burned parameter if we're not on fire already
    if( StackingIncaps[SAF_FirePanic].StackedPower <= 0 && !bFirePanicked )
    {
        UpdateBurnedMatParam( DeltaTime );
    }
}

/** Set scalar parameter value */
function SetMicrowaveParameter(float ParamValue)
{
	local MaterialInstanceConstant MIC;

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
        // Handle steam effects
        if( ParamValue > 0.1 )
        {
            if( !bSteamEffectActive )
            {
                SetMicrowaveSteamEffects(true);
            }
        }
        else
        {
            if( bSteamEffectActive )
            {
                SetMicrowaveSteamEffects(false);
            }
        }

		MIC = (GoreMIC != None) ? GoreMIC : BodyMIC;
		if( GoreMIC == None )
		{
            MIC.SetScalarParameterValue('Scalar_Inflate', ParamValue * 2.0);
        }
        // Scale inflate down instantly if gore mesh to avoid holes
        else
        {
            MIC.SetScalarParameterValue('Scalar_Inflate', 0);
        }
    }
}

/** Set whether or not this pawn is doing the steaming effects */
protected function SetMicrowaveSteamEffects(bool bEnabled)
{
	// Don't do the effects on a dedicated server
    if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
        return;
    }

    bSteamEffectActive = bEnabled;

    if( bEnabled )
    {
		if( SteamingEffect == none )
		{
            SteamingEffect = new(self) class'ParticleSystemComponent';
			SteamingEffect.SetTemplate( SteamingTemplate );
			Mesh.AttachComponentToSocket( SteamingEffect, EffectSocketName );
			SteamingEffect.ActivateSystem();
		}
		else
		{
            SteamingEffect.SetStopSpawning( -1, false );
		}

        PlaySoundBase( OnSteamSound, true, true, true );
	}
	else
	{
		if( SteamingEffect != none )
		{
            SteamingEffect.SetStopSpawning( -1, true );
        }

        PlaySoundBase( OnSteamEndSound, true, true );
	}
}


/** Accessor to get affliction duration */
function float GetAfflictionDuration( EStackingIncaps AfflictionId )
{
	if( AfflictionId < StackingIncaps.Length )
	{
		return StackingIncaps[AfflictionId].Duration;
	}
}

/** Turns off all affliction sounds / effects */
simulated function Shutdown()
{
	if( bFirePanicked )
	{
		SetFirePanicked( false );
	}

	if( bEMPDisrupted )
	{
		SetEMPDisrupted( false );
	}

	if( bEMPPanicked )
	{
		SetEMPPanicked( false );
	}

	if( bSteamEffectActive )
	{
		SetMicrowaveParameter( 0 );
	}
}

defaultproperties
{
   MicroWaveCharCurve=(Points=(,(InVal=0.750000,OutVal=0.200000),(InVal=1.000000,OutVal=0.750000)))
   SteamingTemplate=ParticleSystem'FX_Impacts_EMIT.FX_Microwave_steam_01'
   BurningTemplate=ParticleSystem'FX_Gameplay_EMIT.Chr.FX_CHR_Fire'
   EmpPanicTemplate=ParticleSystem'FX_Gameplay_EMIT.FX_Char_Emp_clot'
   EmpDisruptTemplate=ParticleSystem'FX_Gameplay_EMIT.Chr.FX_CHR_Weapon_Disable_Emp'
   EffectSocketName="Hips"
   EMPDisruptSocketName="EMPDisruptSocket"
   OnFireSound=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fleshburn_Loop'
   OnFireEndSound=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Fleshburn_Loop'
   OnSteamSound=AkEvent'WW_WEP_SA_Microwave_Gun.Play_Microwave_Steam'
   OnSteamEndSound=AkEvent'WW_WEP_SA_Microwave_Gun.Stop_Microwave_Steam'
   OnEMPSound=AkEvent'WW_WEP_EXP_Grenade_EMP.Play_WEP_EXP_Grenade_EMP_Shock_LP'
   OnEMPEndSound=AkEvent'WW_WEP_EXP_Grenade_EMP.Stop_WEP_EXP_Grenade_EMP_Shock_LP'
   Name="Default__KFPawnAfflictions"
   ObjectArchetype=Object'Core.Default__Object'
}
