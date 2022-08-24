//=============================================================================
// KFPawn_ZedBloatKing
//=============================================================================
// Boss king variant of the bloat.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedBloatKing extends KFPawn_ZedBloat
    implements(KFInterface_MonsterBoss);

const HeadBit = 0x1;
const FrontBit = 0x2;
const BackBit = 0x4;

//local player so we can update the UI
var KFPlayerController KFPC;

//List of hit zones that can apply damage to armor before the body
var array<name> ArmorHitzoneNames;

//List of zones of armor (similar to hit zones)
struct ArmorZoneInfo
{
    var() name ArmorZoneName;   //Name of the armor zone
	var() name SocketName;		//Name of the socket explosion FX play from
    var() int ArmorHealth;      //Amount of health the armor absorbs before it blows off
	var() int ArmorHealthMax;
	var() ParticleSystem ExplosionTemplate;
	var() AkEvent ExplosionSFXTemplate;
	var() Texture2D ZoneIcon;
};
var array<ArmorZoneInfo> ArmorZones;
var float ArmorScale;

//Byte array of armor percentages, replicated to clients
var repnotify byte RepArmorPct[3];

//Bit field for the status of the armor zones.  1 = attached
var repnotify byte ArmorZoneStatus;
var byte PreviousArmorZoneStatus;

//Localization
var localized array<string> BossCaptionStrings;

//Intro Camera
var bool bUseAnimatedCamera;
var vector AnimatedBossCameraOffset;

//List of things that are getting pulled, 0-5 players, 6-10 zeds
var KFPawn PullVictims[11];

//Explosion template for fart attack
var protected const KFGameExplosion FartExplosionTemplate;
var const ParticleSystem FartFXTemplate;
var const name FartFXSocket;
var repnotify byte FartFXNotify;

//Note: Fart attack happens on a timer without any special move
//      It uses a base timer, then a variance to +/- it a bit at random
var Vector2D BaseFartAttackTimer;
var Vector2D VarianceFartAttackTimer;
var Vector2D RageFartAttackTimer;
var Vector2D RageVarianceFartAttackTimer;

var array<Vector2D> DifficultyFartAttackTimers;
var array<Vector2D> DifficultyVarianceFartTimers;
var array<Vector2D> DifficultyRageFartTimers;
var array<Vector2D> DifficultyVarianceRageFartTimers;

//Trigger used to track pawns that are within range of the KB
var KFTrigger_BloatKingGorge GorgeTrigger;

//Poop Monster spawn offset
var const float PoopMonsterOffset;
var ParticleSystem PoopMonsterFXTemplate;
var AkEvent PoopMonsterSFXTemplate;
var const name PoopMonsterFXSocket;
var repnotify byte PoopMonsterFXNotify;

//Delayed spawn tracking of poop monsters
var const float PoopMonsterSpawnDelay;
var int CurrentDelayedSpawns;

//Hit FX overrides for hitting armor
var const int OverrideArmorFXIndex;

//Sprint speed specific to enrage
var const float RageSprintSpeedMultiplier;

//Health thresholds for triggering enrage
var array<float> EnrageHealthThresholds;

/** Footstep camera shake */
var protected const float FootstepCameraShakePitchAmplitude;
var protected const float FootstepCameraShakeRollAmplitude;

replication
{
    if (Role == ROLE_Authority)
        ArmorZoneStatus, PullVictims, RepArmorPct, FartFXNotify, PoopMonsterFXNotify;
}

simulated event ReplicatedEvent(name VarName)
{
    if (VarName == 'ArmorZoneStatus')
    {
        UpdateArmorPieces();
    }
    else if (VarName == 'bIsEnraged')
    {
        SetEnraged(bIsEnraged);
    }
	else if (VarName == 'RepArmorPct')
	{
		UpdateArmorPieces();
	}
	else if (VarName == 'FartFXNotify')
	{
		PlayFartSpawnFX();
	}
	else if (VarName == 'PoopMonsterFXNotify')
	{
		PlayPoopSpawnFX();
	}
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

//-----------------------------------------------------------------------------
// Boss interface
//-----------------------------------------------------------------------------
simulated function KFPawn_Monster GetMonsterPawn()
{
    return self;
}

simulated function string GetRandomBossCaption()
{
    if (default.BossCaptionStrings.Length <= 0)
    {
        return "";
    }

    return default.BossCaptionStrings[Rand(default.BossCaptionStrings.Length)];
}

static simulated event bool IsABoss()
{
    return true;
}

simulated function float GetHealthPercent()
{
	return float(Health) / float(HealthMax);
}

/** Turn on the boss camera animation mode */
simulated function SetAnimatedBossCamera(bool bEnable, optional vector CameraOffset)
{
    bUseAnimatedCamera = bEnable;
    if (bUseAnimatedCamera)
    {
        AnimatedBossCameraOffset = CameraOffset;
    }
    else
    {
        AnimatedBossCameraOffset = vect(0, 0, 0);
    }
}

/** Whether this pawn is in theatric camera mode */
simulated function bool UseAnimatedBossCamera()
{
    return bUseAnimatedCamera;
}

/** The name of the socket to use as a camera base for theatric sequences */
simulated function name GetBossCameraSocket()
{
    return 'TheatricCameraRootSocket';
}

/** The relative offset to use for the cinematic camera */
simulated function vector GetBossCameraOffset()
{
    return AnimatedBossCameraOffset;
}

function OnZedDied(Controller Killer)
{
    super.OnZedDied(Killer);

    KFGameInfo(WorldInfo.Game).BossDied(Killer);
	ClearFartTimer();
}

function KFAIWaveInfo GetWaveInfo(int BattlePhase, int Difficulty)
{
    //@TODO: King Bloat boss wave functionality
    return none;
}

function byte GetNumMinionsToSpawn()
{
    //@TODO: King Bloat boss wave functionality
    return 0;
}

//-----------------------------------------------------------------------------
// Pawn
//-----------------------------------------------------------------------------
function PossessedBy(Controller C, bool bVehicleTransition)
{
    Super.PossessedBy(C, bVehicleTransition);

	if(DifficultyFartAttackTimers.length > 0)
	{
		BaseFartAttackTimer = DifficultyFartAttackTimers[Min(WorldInfo.Game.GameDifficulty, DifficultyFartAttackTimers.length)];
	}

	if (DifficultyVarianceFartTimers.length > 0)
	{
		VarianceFartAttackTimer = DifficultyVarianceFartTimers[Min(WorldInfo.Game.GameDifficulty, DifficultyVarianceFartTimers.length)];
	}

	if (DifficultyRageFartTimers.length > 0)
	{
		RageFartAttackTimer = DifficultyRageFartTimers[Min(WorldInfo.Game.GameDifficulty, DifficultyRageFartTimers.length)];
	}

	if (DifficultyVarianceRageFartTimers.length > 0)
	{
		RageVarianceFartAttackTimer = DifficultyVarianceRageFartTimers[Min(WorldInfo.Game.GameDifficulty, DifficultyVarianceRageFartTimers.length)];
	}

	PlayBossMusic();
	ServerDoSpecialMove(SM_BossTheatrics);
	SetFartAttackTimer();
	InitArmor();

	GorgeTrigger = Spawn(class'KFTrigger_BloatKingGorge', self, , Location, Rotation);
	GorgeTrigger.SetBase(self);
	GorgeTrigger.SetRelativeLocation(vect(0, 0, 0));
	GorgeTrigger.CylinderComponent.SetCylinderSize(Sqrt(class'KFSM_BloatKing_Gorge'.default.GorgeAttackRangeSq), CylinderComponent.CollisionHeight);
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic()
{
    if (KFGameInfo(WorldInfo.Game) != none)
    {
        KFGameInfo(WorldInfo.Game).ForcePatriarchMusicTrack();
    }
}

function bool CanObliterateDoors()
{
	//King Bloat will always obliterate doors
	return true;
}

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	Super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);

	if (EnrageHealthThresholds.Length > 0 && (float(Health) / float(HealthMax)) < EnrageHealthThresholds[0])
	{
		EnrageHealthThresholds.Remove(0, 1);
		KFAIController_ZedBloatKing(Controller).StartArmorEnrage();
	}
}

function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

	//If the damage doesn't have a bone hit source, it's likely AoE.  Split over all remaining armor evenly.
	if (HitInfo.BoneName != '')
	{
		AdjustBoneDamage(InDamage, HitInfo.BoneName, HitLocation);
	}
	else
	{
		AdjustNonBoneDamage(InDamage);
	}
}

function AdjustBoneDamage(out int InDamage, name BoneName, Vector HitLocation)
{
	local int HitZoneIdx, ArmorZoneIdx;
	local name IntendedArmorZoneName;
	local int ArmorDamage;

	//Make sure this hit zone is valid
	HitZoneIdx = HitZones.Find('ZoneName', BoneName);
	if (HitZoneIdx >= 0)
	{
		//Lookup valid armor zone if it exists in our armor list
		ArmorZoneIdx = INDEX_NONE;
		if (ArmorHitzoneNames.Find(HitZones[HitZoneIdx].ZoneName) != INDEX_NONE)
		{
			IntendedArmorZoneName = '';
			switch (HitZones[HitZoneIdx].ZoneName)
			{
			case 'head':
				IntendedArmorZoneName = 'head';
				break;
			default:
				IntendedArmorZoneName = (HitLocation - Location) dot Vector(Rotation) > 0 ? 'front' : 'back';
				break;
			}
			ArmorZoneIdx = ArmorZones.Find('ArmorZoneName', IntendedArmorZoneName);
		}

		//Now that we have an armor zone, do adjustments
		if (ArmorZoneIdx != INDEX_NONE && ArmorZones[ArmorZoneIdx].ArmorHealth > 0)
		{
			ArmorDamage = Clamp(InDamage, 0, ArmorZones[ArmorZoneIdx].ArmorHealth);
			InDamage -= ArmorDamage;
			ArmorZones[ArmorZoneIdx].ArmorHealth -= ArmorDamage;
			RepArmorPct[ArmorZoneIdx] = FloatToByte(float(ArmorZones[ArmorZoneIdx].ArmorHealth) / float(ArmorZones[ArmorZoneIdx].ArmorHealthMax));

			if (ArmorZones[ArmorZoneIdx].ArmorHealth <= 0)
			{
				ExplodeArmor(ArmorZoneIdx, IntendedArmorZoneName);
				KFAIController_ZedBloatKing(Controller).StartArmorEnrage();
			}
			UpdateArmorUI();
		}
	}
}

function AdjustNonBoneDamage(out int InDamage)
{
	local int ValidArmorZones;
	local int ArmorReduction, ArmorRemainder, ArmorDamage;
	local int Idx;

	//Find amount of valid hit zones to split damage
	ValidArmorZones = 0;
	for (Idx = 0; Idx < ArmorZones.Length; ++Idx)
	{
		if (ArmorZones[Idx].ArmorHealth > 0)
		{
			ValidArmorZones++;
		}
	}

	//Have some damageable zones around
	if (ValidArmorZones > 0)
	{
		//Store the initial split.  Any modulo remainder will go in a holding value until later
		//		We'll just lazily pull any remainder from surviving armor zones
		ArmorReduction = InDamage / ValidArmorZones;
		ArmorRemainder = InDamage % ValidArmorZones;

		//First pass to do split damage
		for (Idx = 0; Idx < ArmorZones.Length; ++Idx)
		{
			if (ArmorZones[Idx].ArmorHealth > 0)
			{
				//Find final damage value to this zone and add some into the remainder if needed
				ArmorDamage = Clamp(ArmorReduction, 0, ArmorZones[Idx].ArmorHealth);
				if (ArmorDamage < ArmorReduction)
				{
					ArmorRemainder += ArmorReduction - ArmorDamage;
				}

				//Update, do FX, etc.
				InDamage -= ArmorDamage;
				ArmorZones[Idx].ArmorHealth -= ArmorDamage;
				RepArmorPct[Idx] = FloatToByte(float(ArmorZones[Idx].ArmorHealth) / float(ArmorZones[Idx].ArmorHealthMax));

				if (ArmorZones[Idx].ArmorHealth <= 0)
				{
					ExplodeArmor(Idx, ArmorZones[Idx].ArmorZoneName);
					KFAIController_ZedBloatKing(Controller).StartArmorEnrage();
				}
				UpdateArmorUI();
			}
		}

		//Second pass to clear out remaining damage.  If anything remains after this step, it'll go out via the InDamage variable
		for (Idx = 0; Idx < ArmorZones.Length && ArmorRemainder > 0; ++Idx)
		{
			if (ArmorZones[Idx].ArmorHealth > 0)
			{
				ArmorDamage = Clamp(ArmorRemainder, 0, ArmorZones[Idx].ArmorHealth);

				//Update, do FX, etc.
				InDamage -= ArmorDamage;
				ArmorRemainder -= ArmorDamage;
				ArmorZones[Idx].ArmorHealth -= ArmorDamage;
				RepArmorPct[Idx] = FloatToByte(float(ArmorZones[Idx].ArmorHealth) / float(ArmorZones[Idx].ArmorHealthMax));

				if (ArmorZones[Idx].ArmorHealth <= 0)
				{
					ExplodeArmor(Idx, ArmorZones[Idx].ArmorZoneName);
					KFAIController_ZedBloatKing(Controller).StartArmorEnrage();
				}
				UpdateArmorUI();
			}
		}
	}
}

function int GetHitZoneIndex(name BoneName)
{
	if (BoneName == 'KBArmor')
	{
		//Known arbitrary, hacking some things in place
		return OverrideArmorFXIndex;
	}

	return super.GetHitZoneIndex(BoneName);
}

function PlayHit(float Damage, Controller InstigatedBy, vector HitLocation, class<DamageType> damageType, vector Momentum, TraceHitInfo HitInfo)
{
	//TODO: Figure out how to separate 0 damage armor hits from valid 0 damage hits if needed
	if (Damage == 0)
	{
		HitInfo.BoneName = 'KBArmor';

		//Passing 1 damage to minimize need to rewrite for a single pawn
		super.PlayHit(1, InstigatedBy, HitLocation, damageType, Momentum, HitInfo);
	}
	else
	{
		super.PlayHit(Damage, InstigatedBy, HitLocation, damageType, Momentum, HitInfo);
	}
}

simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects(int HitZoneIdx)
{
	if (HitZoneIdx == OverrideArmorFXIndex)
	{
		return CharacterArch.ImpactSkins[2];
	}
	return super.GetHitZoneSkinTypeEffects(HitZoneIdx);
}

function ExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
    local byte StatusField;

    switch (ArmorZoneName)
    {
    case 'head':
        StatusField = FrontBit | BackBit;
        break;
    case 'front':
        StatusField = HeadBit | BackBit;
        break;
    case 'back':
        StatusField = FrontBit | HeadBit;
        break;
    }

    ArmorZoneStatus = ArmorZoneStatus & StatusField;
    UpdateArmorPieces();
}

simulated function UpdateArmorPieces()
{
	local int i;
	local Vector SocketLocation;
	local Rotator SocketRotation;
	local KFCharacterInfo_Monster MonsterArch;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MonsterArch = GetCharacterMonsterInfo();
		switch (ArmorZoneStatus ^ PreviousArmorZoneStatus)
		{
		case HeadBit:
			//King bloat uses 2 static attachments for the head piece.  Assume these are slot 0, 1 for future possible holiday purposes.
			//		Min at list length in case there are fewer than default meshes.
			for (i = Min(1, StaticAttachList.Length - 1); i >= 0; --i)
			{
				Mesh.DetachComponent(StaticAttachList[i]);
				DetachComponent(StaticAttachList[i]);
				StaticAttachList.Remove(i, 1);
			}
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[0].SocketName, SocketLocation, SocketRotation);
			WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[0], SocketLocation, SocketRotation);
			PlaySoundBase(default.ArmorZones[0].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			break;
		case FrontBit:
			//Front armor is locked to attach list slot 1
			DetachComponent(ThirdPersonAttachments[1]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[1].SocketName, SocketLocation, SocketRotation);
			WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[1], SocketLocation, SocketRotation);
			PlaySoundBase(default.ArmorZones[1].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			ThirdPersonAttachments[1] = none;
			break;
		case BackBit:
			//Back armor is locked to attach list slot 2
			DetachComponent(ThirdPersonAttachments[2]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[2].SocketName, SocketLocation, SocketRotation);
			WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[2], SocketLocation, SocketRotation);
			PlaySoundBase(default.ArmorZones[2].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			ThirdPersonAttachments[2] = none;
			break;
		default:
			//Nothing changed
			break;
		}

		UpdateArmorUI();
	}

	PreviousArmorZoneStatus = ArmorZoneStatus;
}

simulated function KFPlayerController GetKFPC()
{
	if (KFPC == none)
	{
		KFPC = KFPlayerController(GetALocalPlayerController());
	}

	return KFPC;
}

simulated function UpdateArmorUI()
{
	local SCompressedArmorInfo CompressedArmorInfoList[3];
	local int i;

	if (GetKFPC() == none)
	{
		return;
	}

	for (i = 0; i < ArmorZones.length; i++)
	{
		CompressedArmorInfoList[i].Percentage = ByteToFloat(RepArmorPct[i]);
		CompressedArmorInfoList[i].IconTexture = default.ArmorZones[i].ZoneIcon;
	}

	if (KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.bossHealthBar != none)
	{
		KFPC.MyGFxHUD.bossHealthBar.UpdateArmorUI(CompressedArmorInfoList);
	}
}

function InitArmor()
{
	local KFGameInfo KFGI;
	local float HealthMod;
	local float HeadHealthMod;
	local int i;

	KFGI = KFGameInfo(WorldInfo.Game);
	if (KFGI != None)
	{
		HealthMod = 1.f;
		HeadHealthMod = 1.f;
		KFGI.DifficultyInfo.GetAIHealthModifier(self, KFGI.GameDifficulty, KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);

		for (i = 0; i < ArmorZones.Length; ++i)
		{
			ArmorZones[i].ArmorHealth *= HealthMod;
			ArmorZones[i].ArmorHealthMax = ArmorZones[i].ArmorHealth;
			RepArmorPct[i] = FloatToByte(float(ArmorZones[i].ArmorHealth) / float(ArmorZones[i].ArmorHealthMax));
		}
	}
	UpdateArmorUI();
}

function SetShieldScale(float InScale)
{
	local int i;

	ArmorScale = InScale;
	for (i = 0; i < ArmorZones.Length; ++i)
	{
		ArmorZones[i].ArmorHealth *= InScale;
		ArmorZones[i].ArmorHealthMax = ArmorZones[i].ArmorHealth;
		RepArmorPct[i] = FloatToByte(float(ArmorZones[i].ArmorHealth) / float(ArmorZones[i].ArmorHealthMax));
	}
}

simulated event bool CanDoSpecialMove(ESpecialMove AMove, optional bool bForceCheck)
{
	if (bIsEnraged && AMove == SM_Block)
	{
		return false;
	}

	return super.CanDoSpecialMove(AMove, bForceCheck);
}

/** Called by PawnAnimInfo when determining whether an attack with bSpecializedMode TRUE can be performed. This makes the
FleshPound use attacks from his PawnAnimInfo that are configured as "specialized" only if he's enraged. */
function bool ShouldPlaySpecialMeleeAnims()
{
    return IsEnraged();
}

/** Return current rage status */
simulated event bool IsEnraged()
{
    return bIsEnraged;
}

/** Enrage this FleshPound! */
simulated function SetEnraged(bool bNewEnraged)
{
    if (!bCanRage || (Role == ROLE_Authority && bNewEnraged == bIsEnraged))
    {
        return;
    }

    if (Role == ROLE_Authority)
    {
        bIsEnraged = bNewEnraged;

        // End blocking on rage
        if (IsDoingSpecialMove(SM_Block))
        {
            EndSpecialMove();
        }
		if (bIsEnraged)
		{
			DoSpecialMove(SM_Custom1, true, , SpecialMoveHandler.SpecialMoveClasses[SM_Custom1].static.PackFlagsBase(self));

			//If we're higher then the average rage fart attack timer, reset it here to the new lower rage time
			if (GetTimerCount(nameof(TimerFartAttack)) > Lerp(RageFartAttackTimer.X, RageFartAttackTimer.Y, GetHealthPercentage()))
			{
				ClearFartTimer();
				SetFartAttackTimer();
			}

			if (KFAIController_ZedBloatKing(Controller) != None)
			{
				KFAIController_ZedBloatKing(Controller).SetEnrageTimer();
			}
		}

        SetSprinting(bNewEnraged);
    }
}

function AdjustMovementSpeed(float SpeedAdjust)
{
	//Redo calculation here to account for the multiplier on sprint speed
	if (bIsEnraged)
	{
		DesiredAdjustedGroundSpeed = default.GroundSpeed * SpeedAdjust * InitialGroundSpeedModifier;

		if (IsDoingSpecialMove())
		{
			DesiredAdjustedSprintSpeed = fMax(default.SprintSpeed * SpeedAdjust * InitialGroundSpeedModifier * SpecialMoves[SpecialMove].GetSprintSpeedModifier() * default.RageSprintSpeedMultiplier, DesiredAdjustedGroundSpeed);
		}
		else
		{
			DesiredAdjustedSprintSpeed = fMax(default.SprintSpeed * SpeedAdjust * InitialGroundSpeedModifier * default.RageSprintSpeedMultiplier, DesiredAdjustedGroundSpeed);
		}

		NormalGroundSpeed = DesiredAdjustedGroundSpeed;
		NormalSprintSpeed = DesiredAdjustedSprintSpeed;
	}
	else
	{
		super.AdjustMovementSpeed(SpeedAdjust);
	}
}

/** Overridden to cause slight camera shakes when walking. */
simulated event PlayFootStepSound(int FootDown)
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (IsHumanControlled() && IsLocallyControlled())
		{
			FootstepCameraShake.RotOscillation.Pitch.Amplitude = 0;
			FootstepCameraShake.RotOscillation.Roll.Amplitude = 0;
		}
		else
		{
			FootstepCameraShake.RotOscillation.Pitch.Amplitude = FootstepCameraShakePitchAmplitude;
			FootstepCameraShake.RotOscillation.Roll.Amplitude = FootstepCameraShakeRollAmplitude;
			FootstepCameraShakeInnerRadius = default.FootstepCameraShakeInnerRadius;
			FootstepCameraShakeOuterRadius = default.FootstepCameraShakeOuterRadius;
			if (!bIsSprinting || VSizeSQ(Velocity) < 10000.f)
			{
				FootstepCameraShake.RotOscillation.Pitch.Amplitude *= 0.75f;
				FootstepCameraShake.RotOscillation.Roll.Amplitude *= 0.75f;
			}
		}
	}

	super.PlayFootStepSound(FootDown);
}

/** Spawn a puke mine */
simulated function ANIMNOTIFY_PukeMineAttack()
{
    local vector SpawnLocation;
    local rotator SpawnRotation;

    if (Role == ROLE_Authority)
    {
        Mesh.GetSocketWorldLocationAndRotation('PukeSocket', SpawnLocation, SpawnRotation);
        SpawnPukeMine(SpawnLocation, SpawnRotation);
    }
}

function SetFartAttackTimer()
{
	local float HealthPct, TimerValue;

	HealthPct = GetHealthPercentage();
	if (bIsEnraged)
	{
		TimerValue = Lerp(RageFartAttackTimer.X, RageFartAttackTimer.Y, HealthPct) + ((FRand() - 0.5) * 2.0f) * Lerp(RageVarianceFartAttackTimer.X, RageVarianceFartAttackTimer.Y, HealthPct);
	}
	else
	{
		TimerValue = Lerp(BaseFartAttackTimer.X, BaseFartAttackTimer.Y, HealthPct) + ((FRand() - 0.5) * 2.0f) * Lerp(VarianceFartAttackTimer.X, VarianceFartAttackTimer.Y, HealthPct);
	}

    SetTimer(TimerValue, false, nameof(TimerFartAttack));
}

function ClearFartTimer()
{
	ClearTimer(nameof(TimerFartAttack));
}

simulated function TimerFartAttack()
{
	local Vector FartLocation;
	local Rotator FartRotation;

	if (!IsAliveAndWell())
	{
		ClearTimer(nameof(TimerFartAttack));
		return;
	}

    // Explode using the given template
	Mesh.GetSocketWorldLocationAndRotation(default.FartFXSocket, FartLocation, FartRotation);

	// Notify to trigger client spawn
	++FartFXNotify;

	// Explosion, fart visual FX
	PlayFartSpawnFX();

	// Puke mine using the same tech for the standard puke mines
	if (bIsEnraged)
	{
		SpawnPukeMine(FartLocation, FartRotation);
	}

	//Reset timer for next attack
    SetFartAttackTimer();
}

simulated function PlayFartSpawnFX()
{
	local Vector SocketLocation;
	local Rotator SocketRotation;
	local KFExplosion_BloatKingFart ExploActor;

	if (Role == ROLE_Authority)
	{
		SpawnPoopMonster();
	}

	ExploActor = Spawn(class'KFExplosion_BloatKingFart', self, , Location, Rotation);
	if (ExploActor != none)
	{
		ExploActor.InstigatorController = Controller;
		ExploActor.Instigator = self;
		ExploActor.Explode(FartExplosionTemplate);
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		Mesh.GetSocketWorldLocationAndRotation(default.FartFXSocket, SocketLocation, SocketRotation);
		WorldInfo.MyEmitterPool.SpawnEmitter(default.FartFXTemplate, SocketLocation, SocketRotation);
	}
}

function AddGorgeVictim(KFPawn NewPawn)
{
	local bool bHuman;
	local int i;

	bHuman = KFPawn_Human(NewPawn) != none;

	NewPawn.SetCollision(true, false);
	NewPawn.setPhysics(PHYS_Interpolating);
	for (i = bHuman ? 0 : 6; i < bHuman ? 6 : 11; ++i)
	{
		if (PullVictims[i] == none)
		{
			PullVictims[i] = NewPawn;
			return;
		}
	}
}

function RemoveGorgeVictim(KFPawn OldPawn)
{
	local int i;

	OldPawn.SetCollision(true, true);
	OldPawn.SetPhysics(PHYS_Walking);
	for (i = 0; i < 11; ++i)
	{
		if (PullVictims[i] == OldPawn)
		{
			PullVictims[i] = none;
			return;
		}
	}
}

function AllowNextPoopMonster()
{
	if (CurrentDelayedSpawns > 0)
	{
		//Clear timer to force it to be out of the way when the call to spawn next monster checks for active timer
		ClearTimer(NameOf(AllowNextPoopMonster));
		CurrentDelayedSpawns--;
		SpawnPoopMonster();
	}
}

function SpawnPoopMonster()
{
	local KFPawn_Monster NewZed;
	local Vector X,Y,Z;

	if (IsTimerActive(NameOf(AllowNextPoopMonster)))
	{
		++CurrentDelayedSpawns;
		return;
	}

	GetAxes(Rotation, X, Y, Z);
	NewZed = Spawn(class'KFPawn_ZedBloatKingSubspawn', , , Location  + (X * PoopMonsterOffset), Rotation, , true);
	if (NewZed != None)
	{
		NewZed.SetPhysics(PHYS_Falling);
		KFGameInfo(WorldInfo.Game).SetMonsterDefaults(NewZed);
		NewZed.SpawnDefaultController();
		NewZed.Knockdown(, vect(1, 1, 1), NewZed.Location, 1000, 100);
		if (KFAIController(NewZed.Controller) != None)
		{
			KFGameInfo(WorldInfo.Game).GetAIDirector().AIList.AddItem(KFAIController(NewZed.Controller));
			KFAIController(NewZed.Controller).SetTeam(1);
		}

		++PoopMonsterFXNotify;
		PlayPoopSpawnFX();
	}

	SetTimer(PoopMonsterSpawnDelay, false, NameOf(AllowNextPoopMonster));
}

simulated function PlayPoopSpawnFX()
{
	local Vector SocketLocation;
	local Rotator SocketRotation;
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		Mesh.GetSocketWorldLocationAndRotation(default.PoopMonsterFXSocket, SocketLocation, SocketRotation);
		WorldInfo.MyEmitterPool.SpawnEmitter(default.PoopMonsterFXTemplate, SocketLocation, SocketRotation);
		PlaySoundBase(default.PoopMonsterSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
	}
}

//-----------------------------------------------------------------------------
// Pawn Removals
//-----------------------------------------------------------------------------
function CauseHeadTrauma(float BleedOutTime = 5.f)
{
    return;
}

simulated function bool PlayDismemberment(int InHitZoneIndex, class<KFDamageType> InDmgType, optional vector HitDirection)
{
    return false;
}

simulated function PlayHeadAsplode()
{
    return;
}

simulated function ApplyHeadChunkGore(class<KFDamageType> DmgType, vector HitLocation, vector HitDirection)
{
    return;
}

defaultproperties
{
    LocalizationKey=KFPawn_ZedBloatKing

    //-----------------------------------------------------
    // Gameplay
    ArmorZoneStatus=7 // 0b00000111
    PreviousArmorZoneStatus=7
    bCanRage=true

	//There can be as many thresholds here as you want.  Just do them in order from highest -> lowest
	EnrageHealthThresholds=(0.75,0.50,0.20)

    //Fart is base timer +/- some random amount of the variance, giving you a range of say 25-35 seconds with a base of 30 and variance of 5
	//		These values are X = 0 health, Y = 100% health
	DifficultyFartAttackTimers(0)=(X=5.0,Y=11.0) // Normal
	DifficultyFartAttackTimers(1)=(X=4.5,Y=10.5) // Hard
	DifficultyFartAttackTimers(2)=(X=4.0,Y=10.0) // Suicidal
	DifficultyFartAttackTimers(3)=(X=4.0,Y=10.0) // Hell On Earth

	DifficultyVarianceFartTimers(0)=(X=3.0,Y=6.0) // Normal
	DifficultyVarianceFartTimers(1)=(X=2.5,Y=5.5) // Hard
	DifficultyVarianceFartTimers(2)=(X=2.0,Y=5.0) // Suicidal
	DifficultyVarianceFartTimers(3)=(X=2.0,Y=5.0) // Hell On Earth

	DifficultyRageFartTimers(0)=(X=1.75,Y=2.5) // Normal
	DifficultyRageFartTimers(1)=(X=1.25,Y=2.0) // Hard
	DifficultyRageFartTimers(2)=(X=0.75,Y=1.5) // Suicidal
	DifficultyRageFartTimers(3)=(X=0.75,Y=1.5) // Hell On Earth

	DifficultyVarianceRageFartTimers(0)=(X=1.65,Y=2.1) // Normal
	DifficultyVarianceRageFartTimers(1)=(X=1.15,Y=1.6) // Hard
	DifficultyVarianceRageFartTimers(2)=(X=0.65,Y=1.1) // Suicidal
	DifficultyVarianceRageFartTimers(3)=(X=0.65,Y=1.1) // Hell On Earth

	//Offset from center of the BK to spawn the poop monster
	PoopMonsterOffset=-100
	PoopMonsterFXTemplate=ParticleSystem'CHR_Bile_EMIT.FX_Bile_Birth_01'
	PoopMonsterSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Bile_Spawn'
	PoopMonsterFXSocket=Poop_Attach

	//Amount of time between spawns
	PoopMonsterSpawnDelay=2.f

    // Used for special crawler gas AOE attack "explosion" template  FART ATTACK
    Begin Object Class=KFGameExplosion Name=ExploTemplate0
        Damage=14 //4 //9
        DamageRadius=450 //600
        DamageFalloffExponent=0.f
        DamageDelay=0.f
        MyDamageType=class'KFDT_Toxic_BloatKingFart'

        // Damage Effects
        KnockDownStrength=0
        KnockDownRadius=0
        FractureMeshRadius=0
        FracturePartVel=0
        ExplosionEffects=KFImpactEffectInfo'ZED_BloatKing_ARCH.FX_GasAoE_Explosion_01'
        ExplosionSound=AkEvent'WW_ZED_Abomination.Play_Abomination_AOE_Explo'
        MomentumTransferScale=100

        // Dynamic Light
        ExploLight=none

        // Camera Shake
        CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=350  //450
        CamShakeOuterRadius=600 //900
        CamShakeFalloff=1.f
        bOrientCameraShakeTowardsEpicenter=true
    End Object
    FartExplosionTemplate =ExploTemplate0

	FartFXTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_Bloatking_Fart_01'
	FartFXSocket=Poop_Attach

	// ---------------------------------------------
    // effects
	Begin Object Class=CameraShake Name=FootstepCameraShake0
		bSingleInstance=true
		OscillationDuration=0.25f
		RotOscillation={(Pitch=(Amplitude=120.f,Frequency=60.f),Roll=(Amplitude=60.f,Frequency=40.f))}
	End Object
	FootstepCameraShake=FootstepCameraShake0
	FootstepCameraShakePitchAmplitude=120.f
	FootstepCameraShakeRollAmplitude=60.f
	FootstepCameraShakeInnerRadius=200
	FootstepCameraShakeOuterRadius=900

    // ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_GrappleAttack)=class'KFSM_BloatKing_Gorge'
		SpecialMoveClasses(SM_Custom1)=class'KFSM_BloatKing_Enrage'
	End Object

    //-----------------------------------------------------
    // Content
    MonsterArchPath="ZED_ARCH.ZED_BloatKing_Archetype"
    PawnAnimInfo=KFPawnAnimInfo'ZED_BloatKing_ANIM.BloatKing_AnimGroup'
    DifficultySettings=class'KFDifficulty_BloatKing'
	OverrideArmorFXIndex=200
	PukeMineProjectileClass=class'KFGameContent.KFProj_BloatKingPukeMine'

    //-----------------------------------------------------
    // AI / Nav
    ControllerClass=class'KFAIController_ZedBloatKing'

    Begin Object Name=MeleeHelper_0
        BaseDamage=55.f
        MaxHitRange=375.f
        MomentumTransfer=40000.f
        MyDamageType=class'KFDT_Bludgeon_BloatKing'
    End Object

    // Stats
    XPValues(0)=1291
    XPValues(1)=1694
    XPValues(2)=1790
    XPValues(3)=1843

    Health=9000  //11250
    DoshValue=500
    Mass=400.f

    RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
    GroundSpeed=231.0f  //160 //210
    SprintSpeed=330.0f   //260 //210  410 //315
	RageSprintSpeedMultiplier=1.62f //1.25 1.45 //1.55

    // Mapping between armor piece and hit zones to block pawn damage hitting active armor and apply that damage to the armor
    ArmorHitzoneNames.Add(head)
    ArmorHitzoneNames.Add(chest)
    ArmorHitzoneNames.Add(heart)
    ArmorHitzoneNames.Add(stomach)
    ArmorHitzoneNames.Add(abdomen)

    //Armor info
    ArmorZones.Add((ArmorZoneName=head,SocketName=FX_Armor_Head,ArmorHealth=1000,ArmorHealthMax=2000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Head_Armor'))
    ArmorZones.Add((ArmorZoneName=front,SocketName=FX_Armor_Chest,ArmorHealth=4000,ArmorHealthMax=4000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Chest_Armor'))
    ArmorZones.Add((ArmorZoneName=back,SocketName=FX_Armor_Back,ArmorHealth=3000,ArmorHealthMax=3000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Back_Armor'))
	ArmorScale=1.f
	RepArmorPct[0]=255
	RepArmorPct[1]=255
	RepArmorPct[2]=255

	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=MaxInt, DmgScale=1.1, SkinID=1)

    // for reference: Vulnerability=(default, head, legs, arms, special)
    // cutting everything in half to make it harder to stumble except the head.
    IncapSettings(AF_Stun)=     (Vulnerability=(0.05, 0.55, 0.05, 0.05, 0.55), Cooldown=17.0, Duration=1.25)
    IncapSettings(AF_Knockdown)=(Vulnerability=(0.05, 0.4, 0.05, 0.05, 0.25),  Cooldown=20.0)
    IncapSettings(AF_Stumble)=  (Vulnerability=(0.05, 0.3, 0.05, 0.05, 0.4),   Cooldown=10.0)
    IncapSettings(AF_GunHit)=   (Vulnerability=(0.05, 0.1, 0.05, 0.05, 0.5),   Cooldown=1.7)
    IncapSettings(AF_MeleeHit)= (Vulnerability=(0.05, 0.95, 0.05, 0.05, 0.75), Cooldown=2.0)
    IncapSettings(AF_Poison)=   (Vulnerability=(0))
    IncapSettings(AF_Microwave)=(Vulnerability=(0.08),                      Cooldown=10.0, Duration=3.0)
    IncapSettings(AF_FirePanic)=(Vulnerability=(0.32),                      Cooldown=15.0, Duration=1.2)
    IncapSettings(AF_EMP)=      (Vulnerability=(0.5),                      Cooldown=10.0, Duration=2.2)
    IncapSettings(AF_Freeze)=   (Vulnerability=(0.25),                       Cooldown=10.0, Duration=1.0)
    IncapSettings(AF_Snare)=    (Vulnerability=(1.0, 1.0, 2.0, 1.0, 1.0),   Cooldown=10.5, Duration=3.0)
    IncapSettings(AF_Bleed)=    (Vulnerability=(0.15),                      Cooldown=10.0)

    // Resistant damage types
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun',    DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle',     DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun',          DamageScale=(0.4)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun',          DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle',            DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing',                   DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon',                   DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Fire',                       DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave',                  DamageScale=(0.9)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive',                  DamageScale=(0.4)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing',                   DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic',                      DamageScale=(0.05)))

    ParryResistance=4

    	// Penetration
    PenetrationResistance=10.0
}