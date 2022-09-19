//=============================================================================
// KFPawn_ZedMatriarch
//=============================================================================
// Pawn class for the matriarch.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFPawn_ZedMatriarch extends KFPawn_MonsterBoss;

const HEAD_ARMOR_IDX = 0;
const CLAW_ARMOR_IDX = 1;

const BATTLE_PHASE_SHIELD = 0;
const BATTLE_PHASE_ARMOR = 1;
const BATTLE_PHASE_FLESH = 2;
const BATTLE_PHASE_CLOAK = 3;

//=============================================================================
// @name Battle Phases
//=============================================================================

struct BattleDamageFXInfo
{
	var ParticleSystem Template;
	var array<name> Sockets;
};

struct BattleDamageInfo
{
	var array<BattleDamageFXInfo> FXInfo;
	var transient array<ParticleSystemComponent> FXComponents;
};

/** Info for patriarch battle phases */
struct MatriarchBattlePhaseInfo
{
	var float NextPhaseHealthPctThreshold;

	// sweeping melee attack
    var bool bCanUseSweepingClaw;

	// instant ranged attack that jumps between players
	var bool bCanUseTeslaBlast;

	// sweeping ranged beam attack
	var bool bCanUsePlasmaCannon;

	// aoe attack around Matriarch
	var bool bCanUseLightningStorm;

	// shield against explosives
	var bool bCanUseWarningSiren;

	// ranged grapple attack
	var bool bCanUseScorpionWhip;

	/** Damage done by tentacle attack this battle phase */
	var int TentacleDamage;

	/** Base damage done by Melee Helper (this will replace the melee helper's BaseDamage) */
	var float MeleeBaseDamage;
	var float MeleeDamageScale;

	var float GroundSpeedScale;
	var float SprintSpeedScale;

	var bool bCanCloak;

	var bool bUseAltSprintAnim;

	var bool bShouldTaunt;

	var array<IncapSettingsInfo> IncapSettings;

	var BattleDamageInfo DamageFX;
};

var array<MatriarchBattlePhaseInfo> BattlePhases;
var int TentacleDamage;
var class<KFDamageType> TentacleDamageType;
var bool bUseAltSprintAnim;
var bool bShouldTaunt;

//=============================================================================
// @name Dialog
//=============================================================================

/** Restricts how often tickdialog can be called */
var float TickDialogInterval;

//=============================================================================
// @name FX
//=============================================================================

/** Component used by the beam special move to play a hit location sound effect */
var AkComponent BeamHitAC;

var name LightSocketFront;
var name LightSocketBack;

var transient PointLightComponent LightTemplate_Phase1;
var transient PointLightComponent LightTemplate_Phase2;
var transient PointLightComponent LightTemplate_Phase3;
var transient PointLightComponent LightTemplate_Phase4;

var transient PointLightComponent BattlePhaseLightFront;
var transient PointLightComponent BattlePhaseLightBack;

var LinearColor GlowColor_Phase1;
var LinearColor GlowColor_Phase2;
var LinearColor GlowColor_Phase3;
var LinearColor GlowColor_Phase4;

//=============================================================================
// @name Gun tracking
//=============================================================================

/** Skel control for gun arm tracking */
var SkelControlLookAt GunTrackingSkelCtrl;

/** Allows gun tracking on the server if server aim precision is necessary (player-controlled, etc) */
var protected const bool bUseServerSideGunTracking;

/** Turns gun tracking on and off */
var bool bGunTracking;

/** The target to use for tracking */
var repnotify Pawn GunTarget;

var name GunTargetBoneName;

var Pawn BeamTarget;

//=============================================================================
// @name Shield
//=============================================================================

/** Shield Vars */
/** Amount of health shield has remaining */
var repnotify bool					bShieldUp;
var bool							bShieldBroken;
var float                           ShieldHealth;
var float                           ShieldHealthMax;
var const array<float>              ShieldHealthMaxDefaults;
var float							ShieldHealthScale;

var float							ShieldBreakPawnHealthPct;

/** Replicated shield health percentage */
var repnotify   byte            ShieldHealthPctByte;

var float LastShieldHealthPct;

var ParticleSystem InvulnerableShieldFX;
var ParticleSystemComponent InvulnerableShieldPSC;
var name ShieldSocketName;

var KFSkinTypeEffects ShieldImpactEffects;
var KFGameExplosion ShieldShatterExplosionTemplate;

var const color ShieldColorGreen;
var const color ShieldCoreColorGreen;
var const color ShieldColorYellow;
var const color ShieldCoreColorYellow;
var const color ShieldColorOrange;
var const color ShieldCoreColorOrange;
var const color ShieldColorRed;
var const color ShieldCoreColorRed;

//=============================================================================
// @name Cloaking
//=============================================================================

/** Effect played upon cloaking/uncloaking */
var ParticleSystem CloakFX;
var Name CloakFXSocketName;

/** Gameplay-driven Ak objects, instanced at runtime */
var AkComponent CloakedAkComponent;
var AkEvent CloakedLoop;
var AkEvent CloakedLoopEnd;

/** Percent cloaked [0-1.0] */
var float CloakPercent;

/** Cloak speeds */
var float CloakSpeed;
var float DeCloakSpeed;

/** Cloak damage shimmer */
var float CloakShimmerAmount;
var float LastCloakShimmerTime;

//=============================================================================
// @name Minions
//=============================================================================

var float MinionSpawnDuration;

//=============================================================================
// @name Bump
//=============================================================================

/** The damage type to use when sprinting and bumping zeds */
var class<KFDamageType> HeavyBumpDamageType;

//=============================================================================
// @name Code
//=============================================================================

replication
{
    if (bNetDirty)
        bShieldUp, ShieldHealthPctByte, GunTarget, bUseAltSprintAnim, BeamTarget;
}

simulated event ReplicatedEvent(name VarName)
{
    switch (VarName)
    {
    case nameof(ShieldHealthPctByte):
        UpdateShield();
        break;

	case nameOf(bIsCloakingSpottedByTeam):
		UpdateGameplayMICParams();
		break;
		
	case nameof(bShieldUp):
		SetShieldUp(bShieldUp);
		break;

	case nameOf(bIsCloaking):
		ClientCloakingStateUpdated();
		break;

	case nameOf(GunTarget):
		SetGunTracking(GunTarget != none);
		break;

	case nameof(ArmorZoneStatus):
		super.ReplicatedEvent(VarName);
		OnArmorZoneStatusUpdated();
		break;

    default:
        super.ReplicatedEvent(VarName);
    }
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	// Give Matriarch his weapon
    AddDefaultInventory();

    // Set weapon state to active
    if (Weapon != none)
    {
    	Weapon.GotoState('Active');
    }








	// Start the dialog timer
    if( WorldInfo.NetMode != NM_Client )
    {
        SetTimer(2.f, false, nameOf(Timer_TickDialog));
    }
}

/** Cache skel controls */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	if (WorldInfo.NetMode != NM_DedicatedServer || bUseServerSideGunTracking)
	{
		GunTrackingSkelCtrl = SkelControlLookAt(SkelComp.FindSkelControl('GunTracking'));
		GunTrackingSkelCtrl.SetSkelControlActive( false );
	}
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy(Controller C, bool bVehicleTransition)
{
    Super.PossessedBy(C, bVehicleTransition);
    InitializeCurrentBattlePhase();
}

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local float HealthPct;

	super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	HealthPct = float(Health) / float(HealthMax);
	if (HealthPct <= BattlePhases[CurrentBattlePhase].NextPhaseHealthPctThreshold)
	{
		IncrementBattlePhase();
	}
}

function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	// let the shield absorb unadjusted damage...
	if (bShieldUp && ShieldHealth > 0)
    {
        ShieldHealth -= InDamage;

        if (ShieldHealth < 0)
        {
            InDamage = Abs(ShieldHealth);
            ShieldHealth = 0;
        }
        else
        {
            InDamage = 0;
        }

        ShieldHealthPctByte = FloatToByte(FClamp(ShieldHealth / ShieldHealthMax, 0.f, 1.f));
        UpdateShield();
    }

	// then let the pawn adjust the remaining damage (if any)
	super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
}

simulated event Tick(float DeltaTime)
{
	local int i;
	local float MinCloakPct;
	local KFCharacterInfo_Monster MonsterInfo;

	super.Tick(DeltaTime);
	UpdateGunTrackingSkelCtrl(DeltaTime);

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MonsterInfo = GetCharacterMonsterInfo();
		if (CharacterMICs[0].Parent != MonsterInfo.SpottedSkins[0])
		{
			MinCloakPct = GetMinCloakPct();

			if (!bIsCloaking)
			{
				if (CloakPercent < 1.0f)
				{
					CloakPercent = fMin(CloakPercent + DeltaTime*DeCloakSpeed, 1.f);

					if (CloakPercent == 1.0f)
					{
						UpdateGameplayMICParams();
					}
					else
					{
						for (i = 0; i < CharacterMICs.Length; ++i)
						{
							CharacterMICs[i].SetScalarParameterValue('Transparency', CloakPercent);
						}
					}
				}
			}
			else if (CloakPercent > MinCloakPct)
			{
				CloakPercent = fMax(CloakPercent - DeltaTime*CloakSpeed, MinCloakPct);
				for (i = 0; i < CharacterMICs.Length; ++i)
				{
					CharacterMICs[i].SetScalarParameterValue('Transparency', CloakPercent);
				}
			}
		}
	}
}

/** Gets the minimum cloaked amount based on the viewer */
simulated protected function float GetMinCloakPct()
{
	return 0.f;
}

//=============================================================================
// @name Shield
//=============================================================================

simulated function SetShieldUp(bool bUp)
{
	if (bShieldBroken)
	{
		return;
	}

	if (Role == ROLE_Authority && ShieldHealth > 0)
	{
		bShieldUp = bUp;

		if (Role == Role_Authority)
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchShieldUpEvent(self);
		}
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (bShieldUp)
		{
			// this creates a new component instead of reactivating the old one because reactivating
			// doesn't work at the moment or maybe ever?
			ActivateShieldFX();
		}
		else
		{
			InvulnerableShieldPSC.DeactivateSystem();
			InvulnerableShieldPSC = none;
		}
	}
}

function ActivateShield()
{
    local KFGameInfo KFGI;
    local float HealthMod;
    local float HeadHealthMod;

    KFGI = KFGameInfo(WorldInfo.Game);
    if (KFGI != None)
    {
        HealthMod = 1.f;
        KFGI.DifficultyInfo.GetAIHealthModifier(self, KFGI.GetModifiedGameDifficulty(), KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);

        ShieldHealth = ShieldHealthMaxDefaults[KFGI.GetModifiedGameDifficulty()] * HealthMod * ShieldHealthScale;
        
		if (KFGI.OutbreakEvent != none && KFGi.OutbreakEvent.ActiveEvent.bBossRushMode)
		{
			ShieldHealth = ShieldHealth * ArmorInfo.ArmorScale;
		}

		
		ShieldHealthMax = ShieldHealth;
        ShieldHealthPctByte = FloatToByte( fClamp(ShieldHealth / ShieldHealthMax, 0.f, 1.f) );

		UpdateShield();
    }
}

simulated function ActivateShieldFX()
{
	if (InvulnerableShieldPSC == none)
	{
		InvulnerableShieldPSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(InvulnerableShieldFX, Mesh, ShieldSocketName, true);
		InvulnerableShieldPSC.SetAbsolute(false, true, true);
	}
}

simulated function UpdateShield()
{
    local float ShieldHealthPct;

	if (bShieldBroken)
	{
		return;
	}

    ShieldHealthPct = ByteToFloat(ShieldHealthPctByte);
	if (ShieldHealthPctByte == 0)
    {
        BreakShield();
    }

	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

    if (ShieldHealthPct > 0.f && LastShieldHealthPct <= 0.f)
    {
        ActivateShieldFX();
    }

    if (InvulnerableShieldPSC != none)
	{
		if (ShieldHealthPct >= 0.75f) // Green
		{
			if (LastShieldHealthPct < 0.75f)
			{
				InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorGreen));
				InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorGreen));
			}
		}
		else if (ShieldHealthPct >= 0.5f) // Yellow
		{
			if (LastShieldHealthPct >= 0.75f || LastShieldHealthPct < 0.5f)
			{
				InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorYellow));
				InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorYellow));
			}
		}
		else if (ShieldHealthPct >= 0.25f) // Orange
		{
			if (LastShieldHealthPct >= 0.5f || LastShieldHealthPct < 0.25f)
			{
				InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorOrange));
				InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorOrange));
			}
		}
		else if (LastShieldHealthPct >= 0.25f) // Red
		{
			InvulnerableShieldPSC.SetVectorParameter('Shield_Color', MakeVectorFromColor(ShieldColorRed));
			InvulnerableShieldPSC.SetVectorParameter('Shield_CoreColor', MakeVectorFromColor(ShieldCoreColorRed));
		}
	}

    //// Scale the invulnerable material param
    //TorsoMIC.SetScalarParameterValue('Scalar_DamageResist', ShieldHealthPct);

	// Cache off so we know whether the material params need to change
    LastShieldHealthPct = ShieldHealthPct;
    UpdateShieldUI();
}

/** Creates a vector parameter from a standard color */
simulated function vector MakeVectorFromColor(color InColor)
{
    local LinearColor LinColor;
    local vector ColorVec;

    LinColor = ColorToLinearColor(InColor);
    ColorVec.X = LinColor.R;
    ColorVec.Y = LinColor.G;
    ColorVec.Z = LinColor.B;

    return ColorVec;
}

/** Breaks the shield */
simulated function BreakShield()
{
    local KFExplosionActor ExplosionActor;

	if (bShieldBroken)
	{
		return;
	}

	bShieldBroken = true;
	bShieldUp = false;

	// Spawn a shatter explosion
	// Spawn on server (to actually do damage) and client (to actually produce visuals)
	// (why doesn't the actor replicate its explosion?)
    ExplosionActor = Spawn(class'KFExplosionActor', self, , Location, rotator(vect(0, 0, 1)));
    if (ExplosionActor != None)
    {
        ExplosionActor.Explode(ShieldShatterExplosionTemplate);
    }

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        // Detach shield and zero out material params
        DetachShieldFX();
        //TorsoMIC.SetScalarParameterValue('Scalar_DamageResist', 0.0);
    }

	if (Role == ROLE_Authority)
	{
		SetBattlePhase(BATTLE_PHASE_ARMOR);
	}
}

simulated function DetachShieldFX()
{
    LastShieldHealthPct = 0.f;
    DetachEmitter(InvulnerableShieldPSC);
    UpdateShieldUI();
}

simulated function UpdateShieldUI()
{
    if (KFPC != none && KFPC.IsLocalController())
    {
        if (KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.bossHealthBar != none)
        {
            KFPC.MyGFxHUD.bossHealthBar.UpdateBossShield(LastShieldHealthPct);
        }
    }
}

//=============================================================================
// @name Gun tracking
//=============================================================================

/** Toggles gun tracking on and off */
simulated function SetGunTracking(bool bEnableTracking)
{
	if (WorldInfo.NetMode != NM_DedicatedServer || bUseServerSideGunTracking)
	{
		bGunTracking = bEnableTracking;
		GunTrackingSkelCtrl.SetSkelControlActive( bEnableTracking );
	}

	if (Role == ROLE_Authority)
	{
		if (bEnableTracking && Controller != None && Controller.Enemy != none)
		{
			GunTarget = Controller.Enemy;
		}
		else
		{
			GunTarget = none;
		}
	}

	bForceNetUpdate = true;
}

/** Updates our gun tracking skeletal control */
simulated function UpdateGunTrackingSkelCtrl(float DeltaTime)
{
	// Track the player with the gun arm
	if (GunTrackingSkelCtrl != none)
	{
		if (bGunTracking && GunTarget != None)
		{
			GunTrackingSkelCtrl.DesiredTargetLocation = GunTarget.Mesh.GetBoneLocation(GunTargetBoneName);
			GunTrackingSkelCtrl.InterpolateTargetLocation(DeltaTime);
		}
		else
		{
			GunTrackingSkelCtrl.SetSkelControlActive(false);
		}
	}
}

//=============================================================================
// @name Phases
//=============================================================================

function bool CanUseSweepingClaw()
{
	return BattlePhases[CurrentBattlePhase].bCanUseSweepingClaw &&
		CanDoSpecialMove(SM_Custom1);
}

function bool CanUseTeslaBlast()
{
	return	BattlePhases[CurrentBattlePhase].bCanUseTeslaBlast &&
			CanDoSpecialMove(SM_StandAndShootAttack) &&
			PowerClawIsFunctional();
}

function bool CanUsePlasmaCannon()
{
	return	BattlePhases[CurrentBattlePhase].bCanUsePlasmaCannon &&
			CanDoSpecialMove(SM_HoseWeaponAttack) &&
			PowerClawIsFunctional();
}

function bool CanUseLightningStorm()
{
	return BattlePhases[CurrentBattlePhase].bCanUseLightningStorm &&
		CanDoSpecialMove(SM_Custom2);
}

function bool CanUseWarningSiren()
{
	return BattlePhases[CurrentBattlePhase].bCanUseWarningSiren &&
		CanDoSpecialMove(SM_SonicAttack);
}

function bool CanUseScorpionWhip()
{
	return !PowerClawIsFunctional() &&
		CanDoSpecialMove(SM_GrappleAttack);
}

function SetBattlePhase(int Phase)
{
	if (Phase > CurrentBattlePhase && Phase < BattlePhases.Length)
	{
		CurrentBattlePhase = Phase;

		if (CurrentBattlePhase > BATTLE_PHASE_SHIELD)
		{
			ShieldHealthPctByte = 0;
			UpdateShield();
		}

		if (CurrentBattlePhase > BATTLE_PHASE_ARMOR)
		{
			ArmorInfo.ExplodeArmor(HEAD_ARMOR_IDX);
			ArmorInfo.ExplodeArmor(CLAW_ARMOR_IDX);
			ArmorInfo.UpdateArmorUI();
			
			// Forcing armor to be updated.
			OnArmorZoneStatusUpdated();
		}

		DoStumble();
		SummonMinions();
		InitializeCurrentBattlePhase();
		OnBattlePhaseChanged();
		bForceNetUpdate = true;
	}
}

function IncrementBattlePhase()
{
	SetBattlePhase(CurrentBattlePhase + 1);
}

function InitializeCurrentBattlePhase()
{
	local int i;

	TentacleDamage = BattlePhases[CurrentBattlePhase].TentacleDamage;
	MeleeAttackHelper.BaseDamage = MeleeAttackHelper.default.BaseDamage * BattlePhases[CurrentBattlePhase].MeleeDamageScale;
	InitialGroundSpeedModifier = BattlePhases[CurrentBattlePhase].GroundSpeedScale;
	bCanCloak = BattlePhases[CurrentBattlePhase].bCanCloak;
	bUseAltSprintAnim = BattlePhases[CurrentBattlePhase].bUseAltSprintAnim;
	bShouldTaunt = BattlePhases[CurrentBattlePhase].bShouldTaunt;
	IncapSettings = BattlePhases[CurrentBattlePhase].IncapSettings;

	// re-init existing afflictions to account for new IncapSettings
	for (i = 0; i < EAfflictionType_MAX; ++i)
	{
		if (i < AfflictionHandler.Afflictions.Length && AfflictionHandler.Afflictions[i] != none)
		{
			AfflictionHandler.Afflictions[i].Init(self, EAfflictionType(i), none);
		}
	}

	if (bCanCloak)
	{
		SetCloaked(true);
	}

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchBattlePhaseDialog(self, CurrentBattlePhase);

	bNetDirty = true;
}

function SummonMinions()
{
    local KFAIWaveInfo MinionWave;
    local KFGameInfo MyKFGameInfo;
	local KFAIController_ZedBoss MyBossAIController;

	MyKFGameInfo = KFGameInfo(WorldInfo.Game);

    // Force frustration mode on
    MyKFGameInfo.GetAIDirector().bForceFrustration = true;

    // Select the correct batch of zeds to spawn during this battle phase
    MinionWave = GetWaveInfo(CurrentBattlePhase, MyKFGameInfo.GetModifiedGameDifficulty());
    if (MinionWave != none)
    {
		if (MyKFGameInfo.SpawnManager != none)
		{
			MyKFGameInfo.SpawnManager.LeftoverSpawnSquad.Length = 0;
		 	MyKFGameInfo.SpawnManager.SummonBossMinions(MinionWave.Squads, GetNumMinionsToSpawn());
		}
	}

	MyBossAIController = KFAIController_ZedBoss(Controller);
	if (MyBossAIController != none)
	{
		MyBossAIController.SetTimer(MinionSpawnDuration, false, nameof(MyBossAIController.Timer_StopSummoningZeds));
	}
}

/** Sets various material scalars and FX based on the phase of battle */
simulated function OnBattlePhaseChanged()
{
    if (WorldInfo.NetMode == NM_DedicatedServer || Health <= 0)
    {
        return;
    }

    super.OnBattlePhaseChanged();

	UpdateBattlePhaseLights();
	UpdateBattlePhaseMaterials();
	UpdateBattlePhaseParticles();
}

/** Updates dynamic lights based on battle phase */
simulated function UpdateBattlePhaseLights()
{
    local PointLightComponent LightTemplate;

    if (BattlePhaseLightFront != none)
    {
        BattlePhaseLightFront.DetachFromAny();
        BattlePhaseLightFront = none;
    }

    if (BattlePhaseLightBack != none)
    {
        BattlePhaseLightBack.DetachFromAny();
        BattlePhaseLightBack = none;
    }

    switch (CurrentBattlePhase)
    {
    case 0:
        LightTemplate = LightTemplate_Phase1;
        break;

    case 1:
        LightTemplate = LightTemplate_Phase2;
        break;

    case 2:
        LightTemplate = LightTemplate_Phase3;
        break;

    case 3:
		// don't activate lights after death
    	if (IsAliveAndWell())
    	{
        	LightTemplate = LightTemplate_Phase4;
        }
        break;
    };

    if (LightTemplate != none)
    {
	    BattlePhaseLightFront = new(self) Class'PointLightComponent' (LightTemplate);
	    BattlePhaseLightBack = new(self) Class'PointLightComponent' (LightTemplate);
	}

    if (BattlePhaseLightFront != none)
    {
        Mesh.AttachComponentToSocket(BattlePhaseLightFront, LightSocketFront);
        BattlePhaseLightFront.SetEnabled(true);
    }

    if (BattlePhaseLightBack != none)
    {
        Mesh.AttachComponentToSocket(BattlePhaseLightBack, LightSocketBack);
        BattlePhaseLightBack.SetEnabled(true);
    }
}

/** Updates battle damage on material instance based on battle phase */
simulated function UpdateBattlePhaseMaterials()
{
	local MaterialInstanceConstant MIC;

	foreach CharacterMICs(MIC)
	{
		switch (CurrentBattlePhase)
		{
		case 1:
			MIC.SetScalarParameterValue('Scalar_BattleGrime', 0.0);
			MIC.SetScalarParameterValue('Scalar_Damage_Blood_Contrast', 1.0);
			MIC.SetScalarParameterValue('Scalar_GlowFlashing', 0.0);
			MIC.SetVectorParameterValue('Vector_GlowColor', GlowColor_Phase1);
			break;

		case 2:
			MIC.SetScalarParameterValue('Scalar_BattleGrime', 0.25);
			MIC.SetScalarParameterValue('Scalar_Damage_Blood_Contrast', 1.48);
			MIC.SetScalarParameterValue('Scalar_GlowFlashing', 0.0);
			MIC.SetVectorParameterValue('Vector_GlowColor', GlowColor_Phase2);
			break;

		case 3:
			MIC.SetScalarParameterValue('Scalar_BattleGrime', 0.25);
			MIC.SetScalarParameterValue('Scalar_Damage_Blood_Contrast', 1.49);
			MIC.SetScalarParameterValue('Scalar_GlowFlashing', 0.0);
			MIC.SetVectorParameterValue('Vector_GlowColor', GlowColor_Phase3);
			break;

		case 4:
			MIC.SetScalarParameterValue('Scalar_BattleGrime', 0.5);
			MIC.SetScalarParameterValue('Scalar_Damage_Blood_Contrast', 1.6);
			// don't activate blinking after death
			MIC.SetScalarParameterValue('Scalar_GlowFlashing', IsAliveAndWell() ? 1.0 : 0.0);
			MIC.SetVectorParameterValue('Vector_GlowColor', GlowColor_Phase4);
			break;
		};
	}
}

simulated function UpdateBattlePhaseParticles()
{
	local int i, j;
	local ParticleSystem PS;
	local name Socket;
	local ParticleSystemComponent PSC;

	if (CurrentBattlePhase > 0)
	{
		for (i = 0; i < BattlePhases[CurrentBattlePhase-1].DamageFX.FXComponents.Length; ++i)
		{
			BattlePhases[CurrentBattlePhase-1].DamageFX.FXComponents[i].DeactivateSystem();
		}
		BattlePhases[CurrentBattlePhase-1].DamageFX.FXComponents.Length = 0;
	}

	for (i = 0; i < BattlePhases[CurrentBattlePhase].DamageFX.FXInfo.Length; ++i)
	{
		PS = BattlePhases[CurrentBattlePhase].DamageFX.FXInfo[i].Template;
		for (j = 0; j < BattlePhases[CurrentBattlePhase].DamageFX.FXInfo[i].Sockets.Length; ++j)
		{
			Socket = BattlePhases[CurrentBattlePhase].DamageFX.FXInfo[i].Sockets[j];
			PSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(PS, Mesh, Socket, true);
			BattlePhases[CurrentBattlePhase].DamageFX.FXComponents.AddItem(PSC);
		}
	}
}

simulated function DoStumble()
{
	if (IsIncapacitated())
	{
		return;
	}

	if (IsDoingSpecialMove())
	{
		EndSpecialMove();
	}

	DoSpecialMove( SM_Stumble,,, class'KFSM_Stumble'.static.PackBodyHitSMFlags(self, -vector(Rotation)) );
}

//=============================================================================
// Cloaking
//=============================================================================

/** Toggle cloaking material */
function SetCloaked(bool bNewCloaking)
{
	if( bCanCloak && bNewCloaking != bIsCloaking )
	{
		if( bNewCloaking && (IsImpaired() || IsIncapacitated()) )
		{
			return;
		}

		if( MaxHeadChunkGoreWhileAlive == 0 && bIsCloaking != bNewCloaking && IsAliveAndWell() )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotCloakDialog( self, bNewCloaking );
		}

		bIsCloaking = bNewCloaking;

		// Initial spotted callout should be slightly delayed
		if( bIsCloaking )
		{
			bIsCloakingSpottedByLP = false;
			bIsCloakingSpottedByTeam = false;
			LastSpottedStatusUpdate = WorldInfo.TimeSeconds - 0.2f;
		}

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			UpdateGameplayMICParams();
			HideBattleDamageFX(bIsCloaking);
		}

		super.SetCloaked( bNewCloaking );

		if (Role == ROLE_Authority && bIsCloaking)
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchCloakedEvent(self);
		}
	}
}

simulated function HideBattleDamageFX(bool bHide)
{
	local int i;

	for (i = 0; i < BattlePhases[CurrentBattlePhase].DamageFX.FXComponents.Length; ++i)
	{
		BattlePhases[CurrentBattlePhase].DamageFX.FXComponents[i].SetHidden(bHide);
	}
}

/**
 * bIsCloaking replicated state changed
 * Network: Local and Remote Clients
 */
simulated function ClientCloakingStateUpdated()
{
	if( bIsCloaking )
	{
		ClearBloodDecals();

		// Initial spotted callout should be slightly delayed
		bIsCloakingSpottedByLP = false;
		bIsCloakingSpottedByTeam = false;
		LastSpottedStatusUpdate = WorldInfo.TimeSeconds - 0.2f;
	}

	UpdateGameplayMICParams();
	HideBattleDamageFX(bIsCloaking);
}

/**
 * Called every 0.5f seconds to check if a cloaked zed has been spotted
 * Network: All but dedicated server
 */
simulated event UpdateSpottedStatus()
{
	local bool bOldSpottedByLP;
	local KFPlayerController LocalPC;
	local KFPerk LocalPerk;
	local float DistanceSq, Range;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	bOldSpottedByLP = bIsCloakingSpottedByLP;
	bIsCloakingSpottedByLP = false;

	LocalPC = KFPlayerController(GetALocalPlayerController());
	if( LocalPC != none )
	{
		LocalPerk = LocalPC.GetPerk();
	}

	if ( LocalPC != none && LocalPC.Pawn != None && LocalPC.Pawn.IsAliveAndWell() && LocalPerk != none &&
		 LocalPerk.bCanSeeCloakedZeds && (WorldInfo.TimeSeconds - LastRenderTime) < 1.f )
	{
		DistanceSq = VSizeSq(LocalPC.Pawn.Location - Location);
		Range = LocalPerk.GetCloakDetectionRange();

		if ( DistanceSq < Square(Range) )
		{
			bIsCloakingSpottedByLP = true;
			if ( LocalPerk.IsCallOutActive() )
			{
				// Beware of server spam.  This RPC is marked unreliable and UpdateSpottedStatus has it's own cooldown timer
				LocalPC.ServerCallOutPawnCloaking(self);
			}
		}
	}

	// If spotted by team already, there is no point in trying to update the MIC here
	if ( !bIsCloakingSpottedByTeam )
	{
		if ( bIsCloakingSpottedByLP != bOldSpottedByLP )
		{
			UpdateGameplayMICParams();
		}
	}
}

/** notification from player with CallOut ability */
function CallOutCloaking( optional KFPlayerController CallOutController )
{
	bIsCloakingSpottedByTeam = true;
	UpdateGameplayMICParams();
	SetTimer(2.f, false, nameof(CallOutCloakingExpired));
}

/** Call-out cloaking ability has timed out */
function CallOutCloakingExpired()
{
	bIsCloakingSpottedByTeam = false;
	UpdateGameplayMICParams();
}

/** Handle cloaking materials */
simulated function UpdateGameplayMICParams()
{
	local int i;
	local bool bIsSpotted;
	local bool bWasCloaked;
	local KFCharacterInfo_Monster MonsterInfo;

	// skip KFPawn_MonsterBoss because it calls OnBattlePhaseChanged (?)
	super(KFPawn_Monster).UpdateGameplayMICParams();

	// Cannot cloak after patriarch has been gored
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MonsterInfo = GetCharacterMonsterInfo();

		// visible by local player or team (must go after ServerCallOutCloaking)
		bIsSpotted = (bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam);
		if ((!bIsCloaking || IsImpaired()) && CharacterMICs[0].Parent != MonsterInfo.Skins[0])
		{
			for (i = 0; i < MonsterInfo.Skins.Length; ++i)
			{
				bWasCloaked = bWasCloaked ||
							  (CharacterMICs[i].Parent == MonsterInfo.CloakedSkins[i]) ||
							  (CharacterMICs[i].Parent == MonsterInfo.SpottedSkins[i]);
				CharacterMICs[i].SetParent(MonsterInfo.Skins[i]);
			}

			Mesh.CastShadow = true;
			Mesh.SetPerObjectShadows(true);

			// Needed to avoid effects occurring on gore mesh swap
	   		if (bWasCloaked)
	   		{
				//SetDamageFXActive( true );
				PlayStealthSoundLoopEnd();
				DoCloakFX();
			}

            //Update PAC meshes
            for (i = 0; i < 3; ++i)
            {
                if (ThirdPersonAttachments[i] != none)
                {
                    ThirdPersonAttachments[i].SetHidden(false);
                }
            }
		}
		else if (bIsCloaking && bIsSpotted && CharacterMICs[0].Parent != MonsterInfo.SpottedSkins[0])
		{
			for (i = 0; i < MonsterInfo.SpottedSkins.Length; ++i)
			{
				CharacterMICs[i].SetParent(MonsterInfo.SpottedSkins[i]);
			}

			CloakPercent = 1.0f;

			Mesh.CastShadow = false;
			Mesh.SetPerObjectShadows(false);
			//SetDamageFXActive( false );

            //Update PAC meshes
            for (i = 0; i < 3; ++i)
            {
                if (ThirdPersonAttachments[i] != none)
                {
                    ThirdPersonAttachments[i].SetHidden(true);
                }
            }
		}
		else if (bIsCloaking && !bIsSpotted && CharacterMICs[0].Parent != MonsterInfo.CloakedSkins[0])
		{
			for (i = 0; i < MonsterInfo.CloakedSkins.Length; ++i)
			{
				CharacterMICs[i].SetParent(MonsterInfo.CloakedSkins[i]);
			}

			PlayStealthSoundLoop();
			DoCloakFX();
			Mesh.CastShadow = false;
			Mesh.SetPerObjectShadows(false);
			//SetDamageFXActive( false );

            //Update PAC meshes
            for (i = 0; i < 3; ++i)
            {
                if (ThirdPersonAttachments[i] != none)
                {
                    ThirdPersonAttachments[i].SetHidden(true);
                }
            }
		}
	}
}

simulated function DoCloakFX()
{
	local ParticleSystemComponent CloakPSC;

    CloakPSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment( CloakFX, Mesh, CloakFXSocketName, true );
    CloakPSC.SetAbsolute( false, true, false );
}

simulated function PlayStealthSoundLoop()
{
	if( WorldInfo.NetMode != NM_DedicatedServer && !CloakedAkComponent.IsPlaying(CloakedLoop) )
	{
		CloakedAkComponent.PlayEvent( CloakedLoop, true, true );
	}
}

simulated function PlayStealthSoundLoopEnd()
{
	if( WorldInfo.NetMode != NM_DedicatedServer && CloakedAkComponent.IsPlaying(CloakedLoop) )
	{
		CloakedAkComponent.PlayEvent( CloakedLoopEnd, true, true );
	}
}

simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	// Uncloak on death
	SetCloaked(false);
	bCanCloak = false;

	Super.PlayDying(DamageType, HitLoc);
}

/*********************************************************************************************
* Dialog / Audio
**********************************************************************************************/
/** Returns (hardcoded) dialog event ID for when players kills this zed type */
function int GetKillerDialogID()
{
	return 67;//KILL_Boss
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	if( bIsCloaking && MaxHeadChunkGoreWhileAlive == 0 )
    {
        return 135;//SPOTZ_Cloaked
    }

	return 125;//SPOTZ_Generic
}

/** Players dialog such as taunts at regular intervals */
function Timer_TickDialog()
{
    if (!IsAliveAndWell())
    {
        return;
    }

    if (!IsDoingSpecialMove())
    {
        if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchTickDialog(self, ArmorZoneStatus, CurrentBattlePhase);
    }

    SetTimer(TickDialogInterval, false, nameOf(Timer_TickDialog));
}

function PlayPlasmaCannonDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchPlasmaCannonEvent(self);
}

function PlaySweepingClawDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchSweepingClawEvent(self);
}

function PlayTeslaBlastDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchTeslaBlastEvent(self);
}

function PlayLightningStormDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchLightningStormEvent(self);
}

function PlayScorpionWhipDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchScorpionWhipEvent(self);
}

function PlayWarningSirenDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchWarningSirenEvent(self);
}

/*********************************************************************************************
* @name Armor
**********************************************************************************************/

function ZedExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
	super.ZedExplodeArmor(ArmorZoneIdx, ArmorZoneName);
	OnArmorZoneStatusUpdated();
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayMatriarchExplodeArmorDialog(self, ArmorZoneName);

	if (Role == ROLE_Authority)
	{
		if (ArmorZoneStatus == 0)
		{
			SetBattlePhase(BATTLE_PHASE_FLESH);
		}
		else
		{
			DoStumble();
		}
	}
}

function bool PowerClawIsFunctional()
{
	return bool(ArmorZoneStatus & (1 << CLAW_ARMOR_IDX));
}

simulated function OnArmorZoneStatusUpdated()
{
	local int Idx;

	if ((ArmorZoneStatus & (1 << HEAD_ARMOR_IDX)) == 0)
	{
		Idx = HitZones.Find('BoneName', 'dome');
		if (Idx != INDEX_NONE)
		{
			HitZones.Remove(Idx, 1);
		}
	}

	if ((ArmorZoneStatus & (1 << CLAW_ARMOR_IDX)) == 0)
	{
		Idx = HitZones.Find('BoneName', 'LeftHandCap');
		if (Idx != INDEX_NONE)
		{
			HitZones.Remove(Idx, 1);
		}
	}

	DialogAkComponent.SetRTPCValue("Matriarch_Helmet", int(bool(ArmorZoneStatus & (1 << HEAD_ARMOR_IDX))));
}

/*********************************************************************************************
* @name Gore
**********************************************************************************************/

simulated function ApplyHeadChunkGore(class<KFDamageType> DmgType, vector HitLocation, vector HitDirection)
{
    return;
}

/*********************************************************************************************
* @name KFSkinTypeEffects
**********************************************************************************************/

function int GetHitZoneIndex(name BoneName)
{
	if (BoneName == 'KBArmor')
	{
		//Known arbitrary, hacking some things in place
		return OverrideArmorFXIndex;
	}

	return super.GetHitZoneIndex(BoneName);
}

/** Gets skin effects associated with hit zone (allows pawns to override) */
simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects( int HitZoneIdx )
{
    if (bShieldUp)
    {
        return ShieldImpactEffects; // InvulnerabilityShield
    }
	else if (bIsCloaking)
	{
		return CharacterArch.ImpactSkins[4]; // 4 = Patriarch_Cloaked
	}
	else if (HitZoneIdx == OverrideArmorFXIndex)
	{
		return CharacterArch.ImpactSkins[5];
	}
    else
    {
        return super.GetHitZoneSkinTypeEffects( HitZoneIdx );
    }
}

/*********************************************************************************************
* @name Movement
**********************************************************************************************/

function AdjustMovementSpeed( float SpeedAdjust )
{
    DesiredAdjustedGroundSpeed = default.GroundSpeed * SpeedAdjust * BattlePhases[CurrentBattlePhase].GroundSpeedScale;

	DesiredAdjustedSprintSpeed = default.SprintSpeed * SpeedAdjust * BattlePhases[CurrentBattlePhase].SprintSpeedScale;
	DesiredAdjustedSprintSpeed *= (IsDoingSpecialMove() ? SpecialMoves[SpecialMove].GetSprintSpeedModifier() : 1.f);
	DesiredAdjustedSprintSpeed = fMax(DesiredAdjustedSprintSpeed, DesiredAdjustedGroundSpeed);

	if (bPlayPanicked)
	{
		// Make sure groundspeed is in "walk" range so animtree can play correct panic anim
		DesiredAdjustedGroundSpeed = Min(DesiredAdjustedGroundSpeed, MovementAnimNode.Constraints[1]);
	}

    NormalGroundSpeed = DesiredAdjustedGroundSpeed;
	NormalSprintSpeed = DesiredAdjustedSprintSpeed;
}

//=============================================================================
// @name Bump
//=============================================================================

function class<KFDamageType> GetBumpAttackDamageType()
{
	return HeavyBumpDamageType;
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic()
{
	if( KFGameInfo(WorldInfo.Game) != none )
	{
		KFGameInfo(WorldInfo.Game).ForceMatriarchMusicTrack();
	}
}

defaultproperties
{
   BattlePhases(0)=(NextPhaseHealthPctThreshold=0.750000,bCanUseSweepingClaw=True,bCanUseTeslaBlast=True,bCanUsePlasmaCannon=True,bCanUseLightningStorm=True,MeleeDamageScale=1.000000,GroundSpeedScale=1.000000,SprintSpeedScale=1.000000,IncapSettings=((Duration=2.500000,Cooldown=10.000000,Vulnerability=(1.000000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.000000)),(Cooldown=2.000000,Vulnerability=(0.000000)),(Cooldown=2.000000,Vulnerability=(0.000000)),(Cooldown=10.000000,Vulnerability=(0.000000)),(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.000000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.000000)),(Duration=3.000000,Cooldown=10.500000,Vulnerability=(1.000000,2.000000,1.000000,1.000000,2.000000)),(Cooldown=20.000000,Vulnerability=(0.000000)),(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.000000)),(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000)),(Cooldown=10.000000,Vulnerability=(0.150000)),(Vulnerability=(0.000000)),(Vulnerability=(1.000000))))
   BattlePhases(1)=(NextPhaseHealthPctThreshold=0.500000,bCanUseSweepingClaw=True,bCanUseTeslaBlast=True,bCanUsePlasmaCannon=True,bCanUseLightningStorm=True,MeleeDamageScale=1.000000,GroundSpeedScale=1.500000,SprintSpeedScale=1.000000,bShouldTaunt=True,IncapSettings=((Duration=2.500000,Cooldown=10.000000,Vulnerability=(1.000000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.000000)),(Cooldown=2.000000,Vulnerability=(0.100000,0.950000,0.100000,0.100000,0.750000)),(Cooldown=2.000000,Vulnerability=(0.100000,0.100000,0.100000,0.100000,0.500000)),(Cooldown=10.000000,Vulnerability=(0.100000,0.300000,0.100000,0.100000,0.400000)),(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.000000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.000000)),(Duration=3.000000,Cooldown=10.500000,Vulnerability=(1.000000,2.000000,1.000000,1.000000,2.000000)),(Cooldown=20.000000,Vulnerability=(0.000000)),(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.650000)),(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000)),(Cooldown=10.000000,Vulnerability=(0.150000)),(Vulnerability=(0.000000)),(Vulnerability=(1.000000))),DamageFX=(FXInfo=((Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Low_Damage_01',Sockets=("FX_LeftKnee","Hand_FX_Start_R","FX_RightHip")),(Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Medium_Damage_01',Sockets=("FX_LeftKnee")))))
   BattlePhases(2)=(NextPhaseHealthPctThreshold=0.250000,bCanUseSweepingClaw=True,bCanUseLightningStorm=True,bCanUseWarningSiren=True,MeleeDamageScale=1.000000,GroundSpeedScale=2.250000,SprintSpeedScale=1.050000,bUseAltSprintAnim=True,bShouldTaunt=True,IncapSettings=((Duration=2.500000,Cooldown=10.000000,Vulnerability=(1.000000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.650000)),(Cooldown=2.000000,Vulnerability=(0.100000,0.950000,0.100000,0.100000,0.750000)),(Cooldown=2.000000,Vulnerability=(0.100000,0.100000,0.100000,0.100000,0.500000)),(Cooldown=10.000000,Vulnerability=(0.100000,0.300000,0.100000,0.100000,0.400000)),(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.100000,0.550000,0.100000,0.100000,0.550000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.000000)),(Duration=3.000000,Cooldown=10.500000,Vulnerability=(1.000000,2.000000,1.000000,1.000000,2.000000)),(Cooldown=20.000000,Vulnerability=(0.100000,0.400000,0.100000,0.100000,0.250000)),(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.650000)),(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000)),(Cooldown=10.000000,Vulnerability=(0.150000)),(Vulnerability=(0.000000)),(Vulnerability=(1.000000))),DamageFX=(FXInfo=((Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Low_Damage_01',Sockets=("Hand_FX_Start_R","FX_RightHip")),(Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Medium_Damage_01',Sockets=("FX_LeftKnee")),(Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_LowD_01',Sockets=("FX_Armor_Chest")),(Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_MidD_01',Sockets=("FX_LeftForearm")),(Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Damage_Shoulder_02',Sockets=("Head_Attach")))))
   BattlePhases(3)=(bCanUseSweepingClaw=True,bCanUseWarningSiren=True,MeleeDamageScale=1.200000,GroundSpeedScale=2.500000,SprintSpeedScale=1.150000,bCanCloak=True,bUseAltSprintAnim=True,bShouldTaunt=True,IncapSettings=((Duration=2.500000,Cooldown=10.000000,Vulnerability=(1.000000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.650000)),(Cooldown=2.000000,Vulnerability=(0.100000,0.950000,0.100000,0.100000,0.750000)),(Cooldown=2.000000,Vulnerability=(0.100000,0.100000,0.100000,0.100000,0.500000)),(Cooldown=10.000000,Vulnerability=(0.100000,0.300000,0.100000,0.100000,0.400000)),(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.100000,0.550000,0.100000,0.100000,0.550000)),(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.000000)),(Duration=3.000000,Cooldown=10.500000,Vulnerability=(1.000000,2.000000,1.000000,1.000000,2.000000)),(Cooldown=20.000000,Vulnerability=(0.100000,0.400000,0.100000,0.100000,0.250000)),(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.650000)),(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000)),(Cooldown=10.000000,Vulnerability=(0.150000)),(Vulnerability=(0.000000)),(Vulnerability=(1.000000))),DamageFX=(FXInfo=((Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_High_Damage_01',Sockets=("FX_LeftKnee","Hand_FX_Start_R","FX_RightHip")),(Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_HighD_01',Sockets=("FX_Armor_Chest")),(Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Low_Damage_01',Sockets=("FX_Armor_Chest")),(Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_HighD_01',Sockets=("FX_LeftForearm")),(Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Damage_Shoulder_01',Sockets=("Head_Attach")))))
   TentacleDamageType=Class'kfgamecontent.KFDT_Slashing_MatriarchTentacle'
   bUseServerSideGunTracking=True
   bShieldUp=True
   TickDialogInterval=0.500000
   Begin Object Class=AkComponent Name=BeamHitAC0
      bStopWhenOwnerDestroyed=True
      Name="BeamHitAC0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   BeamHitAC=BeamHitAC0
   LightSocketFront="FX_Armor_Chest"
   LightSocketBack="FX_Armor_Back"
   GlowColor_Phase1=(R=0.100000,G=1.000000,B=0.000000,A=1.000000)
   GlowColor_Phase2=(R=1.000000,G=0.500000,B=0.000000,A=1.000000)
   GlowColor_Phase3=(R=1.000000,G=0.100000,B=0.000000,A=1.000000)
   GlowColor_Phase4=(R=2.000000,G=0.000000,B=0.000000,A=1.000000)
   GunTargetBoneName="Spine2"
   ShieldHealthMaxDefaults(0)=2000.000000
   ShieldHealthMaxDefaults(1)=3000.000000
   ShieldHealthMaxDefaults(2)=4500.000000
   ShieldHealthMaxDefaults(3)=5600.000000
   ShieldHealthScale=1.000000
   ShieldBreakPawnHealthPct=0.750000
   InvulnerableShieldFX=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield'
   ShieldSocketName="Root"
   ShieldImpactEffects=KFSkinTypeEffects_InvulnerabilityShield'kfgamecontent.Default__KFPawn_ZedMatriarch:ShieldEffects'
   ShieldShatterExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedMatriarch:ShatterExploTemplate0'
   ShieldColorGreen=(B=50,G=255,R=50,A=0)
   ShieldCoreColorGreen=(B=0,G=255,R=0,A=0)
   ShieldColorYellow=(B=20,G=255,R=255,A=0)
   ShieldCoreColorYellow=(B=0,G=255,R=255,A=0)
   ShieldColorOrange=(B=10,G=110,R=255,A=0)
   ShieldCoreColorOrange=(B=0,G=105,R=255,A=0)
   ShieldColorRed=(B=20,G=20,R=255,A=0)
   ShieldCoreColorRed=(B=10,G=10,R=255,A=0)
   Begin Object Class=AkComponent Name=CloakedAkComponent0
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="CloakedAkComponent0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   CloakedAkComponent=CloakedAkComponent0
   CloakedLoop=AkEvent'WW_ZED_Matriarch.Play_Matriarch_SFX_Cloak'
   CloakedLoopEnd=AkEvent'WW_ZED_Matriarch.Stop_Matriarch_SFX_Cloak'
   CloakPercent=1.000000
   CloakSpeed=3.000000
   DeCloakSpeed=4.500000
   CloakShimmerAmount=0.600000
   MinionSpawnDuration=30.000000
   HeavyBumpDamageType=Class'kfgamecontent.KFDT_HeavyZedBump'
   SummonWaves(0)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Normal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Normal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Normal_Three')
   SummonWaves(1)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Hard_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Hard_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Hard_Three')
   SummonWaves(2)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Suicidal_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Suicidal_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Suicidal_Three')
   SummonWaves(3)=(PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_HOE_One',PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_HOE_Two',PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_HOE_Three')
   NumMinionsToSpawn=(X=3.000000,Y=5.000000)
   BossCaptionStrings(0)="The Matriarch's protective force field shuts off when she attacks. Use this to your advantage."
   BossCaptionStrings(1)="The Matriarch's cannon and helmet can be destroyed to expose her head and sensitive claw. She'll be quite angry afterwards."
   BossCaptionStrings(2)="Careful about bunching up with others when she fires her Tesla Blast. It'll shock more than just you."
   BossCaptionStrings(3)="Don't think that the battle is over once her cannon is destroyed. She packs a punch!"
   BossCaptionStrings(4)="E.D.A.Rs will come to her aid when they detect threat levels rising too high."
   BossCaptionStrings(5)="The Matriarch deploys a cloaking field when close to death. Unlike her father, she doesn't run away."
   bCloakOnMeleeEnd=True
   MonsterArchPath="ZED_ARCH.ZED_Matriarch_Archetype"
   ParryResistance=4
   RepArmorPct(0)=255
   RepArmorPct(1)=255
   ArmorZoneStatus=3
   PreviousArmorZoneStatus=3
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_MonsterBoss:MeleeHelper_0'
      BaseDamage=55.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Matriarch'
      MomentumTransfer=40000.000000
      MaxHitRange=375.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_MonsterBoss:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedMatriarch:MeleeHelper_0'
   DoshValue=500
   XPValues(0)=1291.000000
   XPValues(1)=1694.000000
   XPValues(2)=1790.000000
   XPValues(3)=1843.000000
   WeakSpotSocketNames(1)="Hand_FX_End_L"
   ZEDCowboyHatAttachName="Hat_Attach"
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.400000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.500000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.500000))
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   DamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(0.900000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.400000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   DamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_MicrowaveRifle',DamageScale=(0.700000))
   DamageTypeModifiers(13)=(DamageType=Class'KFGame.KFDT_Toxic_HRGHealthrower',DamageScale=(0.500000))
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_HRGTeslauncher',DamageScale=(0.700000))
   DamageTypeModifiers(15)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Minigun',DamageScale=(0.750000))
   DamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Toxic_MineReconstructorExplosion',DamageScale=(0.600000))
   DamageTypeModifiers(17)=(DamageType=Class'kfgamecontent.KFDT_EMP_ArcGenerator_Beam',DamageScale=(1.500000))
   DamageTypeModifiers(18)=(DamageType=Class'kfgamecontent.KFDT_EMP_ArcGeneratorSphereImpact',DamageScale=(2.000000))
   DamageTypeModifiers(19)=(DamageType=Class'kfgamecontent.KFDT_EMP_ArcGenerator_DefaultFiremodeZapDamage',DamageScale=(1.500000))
   DamageTypeModifiers(20)=(DamageType=Class'kfgamecontent.KFDT_EMP_ArcGenerator_AltFiremodeZapDamage',DamageScale=(1.500000))
   DamageTypeModifiers(21)=(DamageType=Class'kfgamecontent.KFDT_Shrink_ShrinkRayGun',DamageScale=(3.000000))
   DamageTypeModifiers(22)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_HRGScorcherLightingImpact',DamageScale=(0.400000))
   DamageTypeModifiers(23)=(DamageType=Class'kfgamecontent.KFDT_Fire_HRGScorcherDoT',DamageScale=(0.400000))
   DamageTypeModifiers(24)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_HRG_Vampire_BloodBallImpact',DamageScale=(0.400000))
   DamageTypeModifiers(25)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_HRG_Vampire_BloodBallHeavyImpact',DamageScale=(0.400000))
   DamageTypeModifiers(26)=(DamageType=Class'kfgamecontent.KFDT_Piercing_HRG_Vampire_CrystalSpike',DamageScale=(0.300000))
   DamageTypeModifiers(27)=(DamageType=Class'kfgamecontent.KFDT_Bleeding_HRG_Vampire_BloodSuck',DamageScale=(0.700000))
   DamageTypeModifiers(28)=(DamageType=Class'kfgamecontent.KFDT_Piercing_HRG_CranialPopper',DamageScale=(2.000000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Matriarch'
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   Begin Object Class=AkComponent Name=HeadshotAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:HeadshotAkComponent0'
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   OnDeathAchievementID=267
   ArmorInfoClass=Class'kfgamecontent.KFZedArmorInfo_Matriarch'
   OverrideArmorFXIndex=200
   ShrinkEffectModifier=0.150000
   PawnAnimInfo=KFPawnAnimInfo'ZED_Matriarch_ANIM.Matriarch_AnimGroup'
   LocalizationKey="KFPawn_ZedMatriarch"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bEnableAimOffset=True
   bCanCloak=True
   HitZones(0)=(ZoneName="dome",BoneName="dome",GoreHealth=2147483647,DmgScale=1.000000,SkinID=2)
   HitZones(1)=(ZoneName="head",BoneName="head",GoreHealth=2147483647,DmgScale=1.300000,SkinID=1)
   HitZones(2)=(BoneName="Spine",DmgScale=0.250000,SkinID=2)
   HitZones(3)=(ZoneName="abdomen",BoneName="hips",GoreHealth=2147483647,DmgScale=0.500000,Limb=BP_Torso)
   HitZones(4)=(ZoneName="stomach",BoneName="SpineDisc",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_Torso,SkinID=2)
   HitZones(5)=(ZoneName="lupperarm",BoneName="LeftShoulder",GoreHealth=50,DmgScale=0.500000)
   HitZones(6)=(ZoneName="lupperauldron",BoneName="LeftPauldron",GoreHealth=2147483647,DmgScale=0.250000,SkinID=2)
   HitZones(7)=(ZoneName="lforearm",BoneName="LeftForearm",GoreHealth=20,Limb=BP_LeftArm)
   HitZones(8)=(ZoneName="lhandcap",BoneName="LeftHandCap",GoreHealth=2147483647,Limb=BP_LeftArm,SkinID=2)
   HitZones(9)=(ZoneName="lhand",BoneName="LeftHandMain",GoreHealth=2147483647,DmgScale=1.300000,Limb=BP_LeftArm,SkinID=3)
   HitZones(10)=(ZoneName="rupperarm",BoneName="RightShoulder",GoreHealth=50,DmgScale=0.500000,Limb=BP_RightArm)
   HitZones(11)=(ZoneName="rupperpauldron",BoneName="RightPauldron",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_RightArm,SkinID=2)
   HitZones(12)=(ZoneName="rupperhose",BoneName="RightArmHose1",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_RightArm,SkinID=2)
   HitZones(13)=(ZoneName="rforearm",BoneName="RightForearm",GoreHealth=20,DmgScale=0.250000,Limb=BP_RightArm,SkinID=2)
   HitZones(14)=(ZoneName="lthigh",BoneName="LeftUpLeg",GoreHealth=100,DmgScale=0.250000,SkinID=2)
   HitZones(15)=(ZoneName="lcalf",BoneName="LeftLeg",GoreHealth=50,DmgScale=0.250000,Limb=BP_LeftLeg,SkinID=2)
   HitZones(16)=(ZoneName="lfoot",BoneName="LeftFoot",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_LeftLeg,SkinID=2)
   HitZones(17)=(ZoneName="rthigh",BoneName="RightUpLeg",GoreHealth=100,DmgScale=0.250000,SkinID=2)
   HitZones(18)=(ZoneName="rcalf",BoneName="RightLeg",DmgScale=0.250000,Limb=BP_RightLeg,SkinID=2)
   HitZones(19)=(ZoneName="rfoot",BoneName="RightFoot",GoreHealth=2147483647,DmgScale=0.250000,Limb=BP_RightLeg,SkinID=2)
   HitZones(20)=(ZoneName="heart",BoneName="Tentacle1",GoreHealth=2147483647,DmgScale=1.300000,Limb=BP_Special,SkinID=3)
   HitZones(21)=(ZoneName="teslacoil",BoneName="EMP_Main",GoreHealth=2147483647,Limb=BP_Special,SkinID=2)
   PenetrationResistance=4.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_MonsterBoss:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_MonsterBoss:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedMatriarch:Afflictions_0'
   KnockdownImpulseScale=1.000000
   SprintSpeed=650.000000
   DefaultInventory(0)=Class'kfgamecontent.KFWeap_PowerClaw_Matriarch'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_MonsterBoss:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'kfgamecontent.KFSM_Matriarch_ScorpionWhip'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'kfgamecontent.KFSM_Matriarch_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=Class'kfgamecontent.KFSM_Matriarch_WarningSiren'
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_Matriarch_TeslaBlast'
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_Matriarch_PlasmaCannon'
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=None
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=None
      SpecialMoveClasses(38)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      SpecialMoveClasses(39)=None
      SpecialMoveClasses(40)=None
      SpecialMoveClasses(41)=None
      SpecialMoveClasses(42)=None
      SpecialMoveClasses(43)=None
      SpecialMoveClasses(44)=Class'kfgamecontent.KFSM_Matriarch_SweepingClaw'
      SpecialMoveClasses(45)=Class'kfgamecontent.KFSM_Matriarch_LightningStorm'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_MonsterBoss:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedMatriarch:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_MonsterBoss:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_MonsterBoss:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedMatriarch:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=SecondaryWeaponAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:SecondaryWeaponAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="SecondaryWeaponAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:SecondaryWeaponAkSoundComponent'
   End Object
   SecondaryWeaponAkComponent=SecondaryWeaponAkSoundComponent
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Begin Object Class=AkComponent Name=PowerUpAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:PowerUpAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="PowerUpAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_MonsterBoss:PowerUpAkSoundComponent'
   End Object
   PowerUpAkComponent=PowerUpAkSoundComponent
   DamageRecoveryTimeHeavy=0.650000
   DamageRecoveryTimeMedium=0.850000
   Mass=200.000000
   GroundSpeed=300.000000
   Health=7000
   ControllerClass=Class'kfgamecontent.KFAIController_ZedMatriarch'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_MonsterBoss:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_MonsterBoss:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_MonsterBoss:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_MonsterBoss:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_MonsterBoss:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_MonsterBoss:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_MonsterBoss:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=PowerUpAkSoundComponent
   Components(9)=SecondaryWeaponAkSoundComponent
   Components(10)=SprintAkComponent0
   Components(11)=HeadshotAkComponent0
   Components(12)=CloakedAkComponent0
   Components(13)=BeamHitAC0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
   Name="Default__KFPawn_ZedMatriarch"
   ObjectArchetype=KFPawn_MonsterBoss'KFGame.Default__KFPawn_MonsterBoss'
}
