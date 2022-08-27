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
	ClearTimer('AllowNextPoopMonster');
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
        KFGameInfo(WorldInfo.Game).ForceAbominationMusicTrack();
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
		AdjustBoneDamage(InDamage, HitInfo.BoneName, DamageCauser.Location);
	}
	else
	{
		AdjustNonBoneDamage(InDamage);
	}

	if (bLogTakeDamage) LogInternal(self @ GetFuncName() @ " After armor adjustment Damage=" $ InDamage @ "Momentum=" $ Momentum @ "Zone=" $ HitInfo.BoneName @ "DamageType=" $ DamageType);
}

function AdjustBoneDamage(out int InDamage, name BoneName, Vector DamagerSource)
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
				IntendedArmorZoneName = (DamagerSource - Location) dot Vector(Rotation) > 0 ? 'front' : 'back';
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
   ArmorHitzoneNames(0)="head"
   ArmorHitzoneNames(1)="chest"
   ArmorHitzoneNames(2)="heart"
   ArmorHitzoneNames(3)="stomach"
   ArmorHitzoneNames(4)="abdomen"
   ArmorZones(0)=(ArmorZoneName="head",SocketName="FX_Armor_Head",ArmorHealth=1000,ArmorHealthMax=2000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Head_Armor')
   ArmorZones(1)=(ArmorZoneName="Front",SocketName="FX_Armor_Chest",ArmorHealth=4000,ArmorHealthMax=4000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Chest_Armor')
   ArmorZones(2)=(ArmorZoneName="back",SocketName="FX_Armor_Back",ArmorHealth=3000,ArmorHealthMax=3000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Back_Armor')
   ArmorScale=1.000000
   RepArmorPct(0)=255
   RepArmorPct(1)=255
   RepArmorPct(2)=255
   ArmorZoneStatus=7
   PreviousArmorZoneStatus=7
   BossCaptionStrings(0)="The Abomination has heavy armor plating that must be destroyed; it cannot be pierced, but you can shoot around it."
   BossCaptionStrings(1)="The Abomination can eat Zeds and pass them out again as... let's just say their smell does not improve."
   BossCaptionStrings(2)="Don't let the Abomination's size fool you; he can move fast when he wants."
   BossCaptionStrings(3)="Don't let the Abomination get near other Zeds; he can ingest them to... on second thought, you don't want to know."
   BossCaptionStrings(4)="If you let the Abomination get too close he will do far more than vomit on you. Those axes are not for show."
   BossCaptionStrings(5)="Destroying the Abomination's armor will send him into a rage, which is his most deadly state."
   FartExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedBloatKing:ExploTemplate0'
   FartFXTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_Bloatking_Fart_01'
   FartFXSocket="Poop_Attach"
   DifficultyFartAttackTimers(0)=(X=5.000000,Y=11.000000)
   DifficultyFartAttackTimers(1)=(X=4.500000,Y=10.500000)
   DifficultyFartAttackTimers(2)=(X=4.000000,Y=10.000000)
   DifficultyFartAttackTimers(3)=(X=4.000000,Y=10.000000)
   DifficultyVarianceFartTimers(0)=(X=3.000000,Y=6.000000)
   DifficultyVarianceFartTimers(1)=(X=2.500000,Y=5.500000)
   DifficultyVarianceFartTimers(2)=(X=2.000000,Y=5.000000)
   DifficultyVarianceFartTimers(3)=(X=2.000000,Y=5.000000)
   DifficultyRageFartTimers(0)=(X=1.750000,Y=2.500000)
   DifficultyRageFartTimers(1)=(X=1.250000,Y=2.000000)
   DifficultyRageFartTimers(2)=(X=0.750000,Y=1.500000)
   DifficultyRageFartTimers(3)=(X=0.750000,Y=1.500000)
   DifficultyVarianceRageFartTimers(0)=(X=1.650000,Y=2.100000)
   DifficultyVarianceRageFartTimers(1)=(X=1.150000,Y=1.600000)
   DifficultyVarianceRageFartTimers(2)=(X=0.650000,Y=1.100000)
   DifficultyVarianceRageFartTimers(3)=(X=0.650000,Y=1.100000)
   PoopMonsterOffset=-100.000000
   PoopMonsterFXTemplate=ParticleSystem'CHR_Bile_EMIT.FX_Bile_Birth_01'
   PoopMonsterSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Bile_Spawn'
   PoopMonsterFXSocket="Poop_Attach"
   PoopMonsterSpawnDelay=2.000000
   OverrideArmorFXIndex=200
   RageSprintSpeedMultiplier=1.620000
   EnrageHealthThresholds(0)=0.750000
   EnrageHealthThresholds(1)=0.500000
   EnrageHealthThresholds(2)=0.200000
   FootstepCameraShakePitchAmplitude=120.000000
   FootstepCameraShakeRollAmplitude=60.000000
   PukeMineProjectileClass=Class'kfgamecontent.KFProj_BloatKingPukeMine'
   bCanRage=True
   MonsterArchPath="ZED_ARCH.ZED_BloatKing_Archetype"
   ParryResistance=4
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedBloat:MeleeHelper_0'
      BaseDamage=55.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_BloatKing'
      MomentumTransfer=40000.000000
      MaxHitRange=375.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedBloat:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedBloatKing:MeleeHelper_0'
   DoshValue=500
   XPValues(0)=1291.000000
   XPValues(1)=1694.000000
   XPValues(2)=1790.000000
   XPValues(3)=1843.000000
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   DamageTypeModifiers(15)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   DamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.400000))
   DamageTypeModifiers(17)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.500000))
   DamageTypeModifiers(18)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.500000))
   DamageTypeModifiers(19)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(20)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   DamageTypeModifiers(21)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   DamageTypeModifiers(22)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(0.900000))
   DamageTypeModifiers(23)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.400000))
   DamageTypeModifiers(24)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   DamageTypeModifiers(25)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_BloatKing'
   FootstepCameraShakeInnerRadius=200.000000
   FootstepCameraShakeOuterRadius=900.000000
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedBloatKing:FootstepCameraShake0'
   PawnAnimInfo=KFPawnAnimInfo'ZED_BloatKing_ANIM.BloatKing_AnimGroup'
   LocalizationKey="KFPawn_ZedBloatKing"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedBloat:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedBloat:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=2147483647,DmgScale=1.100000)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=()
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=()
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   HitZones(18)=()
   HitZones(19)=()
   PenetrationResistance=10.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedBloat:Afflictions_0'
      FireFullyCharredDuration=3.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedBloat:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedBloatKing:Afflictions_0'
   IncapSettings(0)=(Duration=2.200000,Cooldown=10.000000,Vulnerability=(0.500000))
   IncapSettings(1)=(Duration=1.200000,Cooldown=15.000000,Vulnerability=(0.320000))
   IncapSettings(2)=(Cooldown=2.000000,Vulnerability=(0.050000,0.950000,0.050000,0.050000,0.750000))
   IncapSettings(3)=(Cooldown=1.700000,Vulnerability=(0.050000,0.100000,0.050000,0.050000,0.500000))
   IncapSettings(4)=(Cooldown=10.000000,Vulnerability=(0.050000,0.300000,0.050000,0.050000,0.400000))
   IncapSettings(5)=(Duration=1.250000,Cooldown=17.000000,Vulnerability=(0.050000,0.550000,0.050000,0.050000,0.550000))
   IncapSettings(6)=(Vulnerability=(0.000000))
   IncapSettings(7)=(Cooldown=10.500000,Vulnerability=(1.000000,1.000000,2.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=20.000000,Vulnerability=(0.050000,0.400000,0.050000,0.050000,0.250000))
   IncapSettings(9)=(Duration=1.000000,Cooldown=10.000000,Vulnerability=(0.250000))
   IncapSettings(10)=(Duration=3.000000,Cooldown=10.000000,Vulnerability=(0.080000))
   IncapSettings(11)=(Cooldown=10.000000,Vulnerability=(0.150000))
   SprintSpeed=330.000000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedBloat:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedBloat:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedBloat:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'kfgamecontent.KFSM_BloatKing_Gorge'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
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
      SpecialMoveClasses(35)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=None
      SpecialMoveClasses(38)=None
      SpecialMoveClasses(39)=None
      SpecialMoveClasses(40)=Class'kfgamecontent.KFSM_BloatKing_Enrage'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedBloat:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedBloatKing:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedBloat:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedBloat:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedBloatKing:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedBloat:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Mass=400.000000
   GroundSpeed=231.000000
   Health=9000
   ControllerClass=Class'kfgamecontent.KFAIController_ZedBloatKing'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedBloat:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
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
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedBloat:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedBloat:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedBloat:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedBloat:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedBloat:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedBloat:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedBloat:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedBloatKing"
   ObjectArchetype=KFPawn_ZedBloat'kfgamecontent.Default__KFPawn_ZedBloat'
}