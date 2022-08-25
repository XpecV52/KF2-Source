//=============================================================================
// KFGameDifficulty_Endless
//=============================================================================
// Manages Zed adjustments used in any game mode with Outbreak waves..
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFOutbreakEvent extends Object
	within KFGameInfo;

//Overrides for when ResetAllPickups will properly function. PRS_Wave functions like base _Survival.
enum PickupResetTime
{
	PRS_Wave,           //Start of wave
	PRS_Trader,         //During trader time
	PRS_WaveAndTrader,  //During start of wave and start of trader time
	PRS_Never,          //Disable pickups entirely, works like bDisablePickups

};

enum BeefcakeType
{
	EBT_Damage,
	EBT_Rally,
	EBT_Scream,
	EBT_StalkerPoison,
};

/** Class replacements for each zed type */
struct SpawnReplacement
{
	/** Entry to replace, some form of AT_* */
	var() int SpawnEntry;

	/** Class to use instead of default */
	var() class<KFPawn_Monster> NewClass;

	/** Percent chance that the spawn will be replaced by NewClass */
	var() float PercentChance;

	structdefaultproperties
	{
		PercentChance = 1.f;
	}
};

/** Individual per-class adjustments to make after a zed spawns */
struct StatAdjustments
{
	//Class to adjust
	var() class<KFPawn_Monster> ClassToAdjust;

	//Health percentage scale
	var() float HealthScale;

	//Scale for gore health of the head hit zone
	var() float HeadHealthScale;

	//Scale for shield for zeds that support this
	var() float ShieldScale;

	//Start enraged
	var() bool bStartEnraged;

	//Whether or not to explode on death
	var() bool bExplosiveDeath;

	//Template to use for explosion
	var KFGameExplosion ExplosionTemplate;

	//Class to ignore on explosion
	var class<KFPawn> ExplosionIgnoreClass;

	/** Amount to scale up per-beefcake application per-type */
	var array<float> BeefcakeScaleIncreases;

	/** Amount to scale up per-beefcake application per-type */
	var array<float> BeefcakeHealthIncreases;

	/** Max Beefcake Scale - This should probably never go > 1.5 for collision reasons */
	var() float MaxBeefcake;

	/** Max beefcake health scale - This can scale forever really since it's not tied to visual scale */
	var() float MaxBeefcakeHealth;

	/** Scale to all damage that has this zed as an instigator */
	var() float DamageDealtScale;

	/** Scale to all damage that has this zed as a victim */
	var() float DamageTakenScale;

	/** Override of the global deflation rate to define a different per-zed rate, LERP between X and Y by player count */
	var() Vector2D OverrideDeflationRate;

	/** Additional sub wave to use when one of this type of zed spawns */
	var() KFAIWaveInfo AdditionalSubSpawns;

	/** 1 to max player count range of how many AI should spawn during the sub wave */
	var() Vector2D AdditionalSubSpawnCount;

	/** Killing the zed should give a different dosh amount than the standard. */
	var() int DoshGiven;

	structdefaultproperties
	{
		HealthScale = 1.f;
		HeadHealthScale = 1.f;
		ShieldScale = 1.f;
		bExplosiveDeath = false

		MaxBeefcake = 1.5
		MaxBeefcakeHealth = 1.5

		DamageDealtScale = 1.0
		DamageTakenScale = 1.0
		OverrideDeflationRate = (X = 0.0,Y = 0.0)

		AdditionalSubSpawnCount = (X = 1,Y = 1)

		DoshGiven=INDEX_NONE
	}
};

/** Individual property overrides that drive other behavior to allow for
*      a large amount of variety in our weekly event mode.
*/
struct WeeklyOverrides
{
	/** Difficulty to use for this event */
	var() int EventDifficulty;

	/** Length of game to use for this event */
	var() int GameLength;

	/** Only allow headshots */
	var() bool bHeadshotsOnly;

	/** Spawn rate multiplier.  Modifies how KFAISpawnManager runs logic */
	var() float SpawnRateMultiplier;

	/** How often global damage should occur (0 = Off) */
	var() float GlobalDamageTickRate;

	/** How much damage should be applied by global tick */
	var() float GlobalDamageTickAmount;

	/** How much the cost of ammo should be scaled (Default 1.0) */
	var() float GlobalAmmoCostScale;

	/** If this array is not empty, modifies the pawn's DefaultInventory
	*      array prior to calling in to P.AddDefaultInventory
	*/
	var() KFGFxObject_TraderItems SpawnWeaponList;

	/** If this array is not empty, modifies the trader's list of available weapons */
	var() KFGFxObject_TraderItems TraderWeaponList;

	/** Whether or not grenades are disabled at spawn and for purchase */
	var() bool bDisableGrenades;

	/** If this array is not empty, replaces AIClassList entries with a new spawn class */
	var() array<SpawnReplacement> SpawnReplacementList;

	/** Whether or not to use the spawn replacement list in the boss wave*/
	var() bool bAllowSpawnReplacementDuringBossWave;

	/** If this array is not empty, replaces AIClassList entries with a new spawn class */
	var() array<SpawnReplacement> BossSpawnReplacementList;

	/** If this array is not empty, properties set in ZedsToAdjust are used in AdjustSpawnedAIPawn */
	var() array<StatAdjustments> ZedsToAdjust;

	/** Whether or not to skip opening of the trader */
	var() bool bDisableTraders;

	/** When to reset pickups */
	var() PickupResetTime PickupResetTime;

	/** Override for the difficulty's item pickup modifier */
	var() float OverrideItemPickupModifier <ClampMax = 1.0>;

	/** Overrride for the difficulty's ammo pickup modifier */
	var() float OverrideAmmoPickupModifier <ClampMax = 1.0>;

	/** Overrides for the standard wave scale behavior of WaveNum / WaveMax */
	var() array<float> WaveItemPickupModifiers;
	var() array<float> WaveAmmoPickupModifiers;

	/** Whether or not to use the override item pickup timings */
	var() bool bUseOverrideItemRespawnTime;

	/** Override timings for item pickup respawn */
	var() NumPlayerMods OverrideItemRespawnTime;

	/** Whether or not to use the override ammo pickup timings */
	var() bool bUseOverrideAmmoRespawnTime;

	/** Override timings for ammo pickup respawn */
	var() NumPlayerMods OverrideAmmoRespawnTime;

	/** Permanent zed time */
	var() bool bPermanentZedTime;

	/** Amount of pawns at which zed time will turn off */
	var() int PermanentZedTimeCutoff;

	/** Amount of time between checks to stay in full slomo.  Note: Scaled by zed time dilation */
	var() float PermanentZedResetTime;

	/** Override time dilation for zed time */
	var() float OverrideZedTimeSlomoScale;

	/** Radius to use for kicking players out of partial zed time */
	var() float ZedTimeRadius;

	/** Radius to use specifically against bosses for partial zed time */
	var() Float ZedTimeBossRadius;

	/** Height to use for kicking players out of partial zed time */
	var() float ZedTimeHeight;

	/** Whether or not to use size scale on damage */
	var() bool bScaleOnHealth;

	/** Starting size scale (typically should be 1.0) */
	var() float StartingDamageSizeScale;

	/** Damage size scale at 0 health */
	var() float DeadDamageSizeScale;

	/** Global Override Spawn Derate Time */
	var() float OverrideSpawnDerateTime;

	/** Global Override Teleport Derate Time */
	var() float OverrideTeleportDerateTime;

	/** Global gravity override */
	var() float GlobalGravityZ;

	/** Turn on beef cake mode. We're going full Cartman. Pawn scales up when doing damage or being rallied by an alpha. */
	var() bool bUseBeefcakeRules;

	/** Per-player count percent to scale amount of AI in the wave by */
	var() array<float> WaveAICountScale;

	/** Head size */
	var() float ZedSpawnHeadScale;

	/** Player head size */
	var() float PlayerSpawnHeadScale;

	/** Allow human sprinting */
	var() bool bHumanSprintEnabled;

	/** Cost scale for weapons not on the user's active perk */
	var() float OffPerkCostScale;

	/** Whether or not we should allow ground speed to become sprint if the melee backup is active */
	var() bool bBackupMeleeSprintSpeed;

	/** Additional wave info to use during boss phase */
	var() KFAIWaveInfo AdditionalBossWaveInfo;

	/** Frequency of additional wave spawn */
	var() float AdditionalBossWaveFrequency;

	/** Delay until first wave. This should never be 0, and likely never less than ~5 seconds, it can potentially never spawn boss if it is. */
	var() float AdditionalBossWaveStartDelay;

	/** 1 to max player count range of how many AI should spawn during the additional waves */
	var() Vector2D AdditionalBossSpawnCount;

	/** Whether or not to spawn a continuous wave type every x seconds, or a single spawn every x seconds */
	var() bool bContinuousAdditionalBossWave;

	/** Scale to use to increase or decrease crush damage */
	var() float CrushScale;

	/** Scale to increase or decrease damage while jumping */
	var() float JumpDamageScale;

	/** Amount of jumps the player can take */
	var() int NumJumpsAllowed;

	/** Whether to turn on inflation rules within KFPawn_Monster */
	var() bool bUseZedDamageInflation;

	/** Maximum pawn inflation (0 health) */
	var() float ZeroHealthInflation;

	/** Deflation Percent Per Second */
	var() float GlobalDeflationRate;

	/** Inflation death gravity */
	var() float InflationDeathGravity;

	/** Inflation explosion timer */
	var() float InflationExplosionTimer;

	/** Disable headless mode on a pawn */
	var() bool bDisableHeadless;

	/** Maximum level of perk allowed to be in use. -1 = all off, 4 = level 25 */
	var() byte MaxPerkLevel;

	/** Boom performance optimization - Max booms in one frame (avoids big Demo spikes) */
	var() int MaxBoomsPerFrame;

	/** If another outbreak mode shares the same events, this will link the two to quicker UI lookup */
	var() int WeeklyOutbreakId;

	structdefaultproperties
	{
		GameLength = GL_Short
		SpawnRateMultiplier = 1.0
		GlobalAmmoCostScale = 1.0
		PickupResetTime = PRS_Wave
		OverrideItemPickupModifier = -1.0
		OverrideAmmoPickupModifier = -1.0
		PermanentZedResetTime = 1.0
		OverrideZedTimeSlomoScale = 0.2
		StartingDamageSizeScale = 1.0
		DeadDamageSizeScale = 0.1
		OverrideSpawnDerateTime = -1.f;
		OverrideTeleportDerateTime = -1.f
		GlobalGravityZ = -1150 //Matches WorldInfo.uc default
		PlayerSpawnHeadScale = 1.0
		ZedSpawnHeadScale = 1.0
		bHumanSprintEnabled = true
		OffPerkCostScale = 1.0
		bBackupMeleeSprintSpeed = false
		AdditionalBossWaveStartDelay = 15
		bContinuousAdditionalBossWave = true
		CrushScale = 1.0
		JumpDamageScale = 1.0
		NumJumpsAllowed = 1
		ZeroHealthInflation = 1.0
		GlobalDeflationRate = 0.1
		InflationExplosionTimer = 3.0
		InflationDeathGravity = -0.1
		MaxPerkLevel = 4
		bAllowSpawnReplacementDuringBossWave = true
		WeeklyOutbreakId=INDEX_NONE
	}
};

struct CachedOutbreakInfo
{
	var KFGFxObject_TraderItems TraderItems;
	var float GameAmmoCostScale;
	var bool bAllowGrenadePurchase;
	var bool bTradersEnabled;
	var byte MaxPerkLevel;
	var float CachedWorldGravityZ;
	var float CachedGlobalGravityZ;

	structdefaultproperties
	{
		bTradersEnabled=true,
		bAllowGrenadePurchase=true
		GameAmmoCostScale=1.0
	}
};

/** List of events setup by design */
var array<WeeklyOverrides> SetEvents;

/** List of events that are in progress or have yet to make the cut */
var array<WeeklyOverrides> TestEvents;

/** Current event being used */
var WeeklyOverrides ActiveEvent;

/** Stored values of World Info and GRI items incase we need to reset it. */
var CachedOutbreakInfo CachedItems;

function SetActiveEvent(int ActiveEventIdx)
{
`if(`notdefined(ShippingPC))
	local string LocalURL;
`endif

`if(`notdefined(ShippingPC))
	//Runtime override by URL options for testing purposes
	LocalURL = WorldInfo.GetLocalURL();
	LocalURL = Split(LocalURL, "?"); //remove map name
	ActiveEventIdx = GetIntOption(LocalURL, "ActiveEventIdx", ActiveEventIdx);

	//If our override is out of bounds, see if it's a valid test event
	if (ActiveEventIdx >= SetEvents.Length)
	{
		ActiveEventIdx -= SetEvents.Length;
		if (ActiveEventIdx <= TestEvents.Length && ActiveEventIdx >= 0)
		{
			ActiveEvent = TestEvents[ActiveEventIdx];
		}
	}
	else
	{
		ActiveEvent = SetEvents[ActiveEventIdx];
	}
`else
	if(ActiveEventIdx < SetEvents.length)
	{
		ActiveEvent = SetEvents[ActiveEventIdx];
	}
`endif
}

function ClearActiveEvent()
{
	local WeeklyOverrides EmptyEvent;

	WorldInfo.WorldGravityZ = CachedItems.CachedWorldGravityZ;
	WorldInfo.GlobalGravityZ = CachedItems.CachedGlobalGravityZ;

	if (GameReplicationInfo != none && KFGameReplicationInfo(GameReplicationInfo) != none)
	{
		if (ActiveEvent.TraderWeaponList != none)
		{
			KFGameReplicationInfo(GameReplicationInfo).TraderItems = CachedItems.TraderItems;
		}

		KFGameReplicationInfo(GameReplicationInfo).GameAmmoCostScale = CachedItems.GameAmmoCostScale;
		KFGameReplicationInfo(GameReplicationInfo).bAllowGrenadePurchase = CachedItems.bAllowGrenadePurchase;
		KFGameReplicationInfo(GameReplicationInfo).bTradersEnabled = CachedItems.bTradersEnabled;
		KFGameReplicationInfo(GameReplicationInfo).MaxPerkLevel = CachedItems.MaxPerkLevel;
	}

	ActiveEvent = EmptyEvent;
}

function CacheGRI()
{
	CachedItems.CachedGlobalGravityZ = WorldInfo.GlobalGravityZ;
	CachedItems.CachedWorldGravityZ = WorldInfo.WorldGravityZ;

	if (GameReplicationInfo != none && KFGameReplicationInfo(GameReplicationInfo) != none)
	{
		if (ActiveEvent.TraderWeaponList != none)
		{
			CachedItems.TraderItems = KFGameReplicationInfo(GameReplicationInfo).TraderItems;
		}

		CachedItems.GameAmmoCostScale = KFGameReplicationInfo(GameReplicationInfo).GameAmmoCostScale;
		CachedItems.bAllowGrenadePurchase = KFGameReplicationInfo(GameReplicationInfo).bAllowGrenadePurchase;
		CachedItems.bTradersEnabled = KFGameReplicationInfo(GameReplicationInfo).bTradersEnabled;
		CachedItems.MaxPerkLevel = KFGameReplicationInfo(GameReplicationInfo).MaxPerkLevel;
	}
}

function UpdateGRI()
{
	CacheGRI();

	//This should have just been spawned in the super
	if (GameReplicationInfo != none && KFGameReplicationInfo(GameReplicationInfo) != none)
	{
		if (ActiveEvent.TraderWeaponList != none)
		{
			KFGameReplicationInfo(GameReplicationInfo).TraderItems = ActiveEvent.TraderWeaponList;
		}

		KFGameReplicationInfo(GameReplicationInfo).GameAmmoCostScale = ActiveEvent.GlobalAmmoCostScale;
		KFGameReplicationInfo(GameReplicationInfo).bAllowGrenadePurchase = !ActiveEvent.bDisableGrenades;
		KFGameReplicationInfo(GameReplicationInfo).bTradersEnabled = !ActiveEvent.bDisableTraders;
		KFGameReplicationInfo(GameReplicationInfo).MaxPerkLevel = ActiveEvent.MaxPerkLevel;
	}
}

function ModifyGroundSpeed(KFPawn PlayerPawn, out float GroundSpeed)
{
	local KFWeapon KFW;
	local KFInventoryManager KFIM;

	if (ActiveEvent.bBackupMeleeSprintSpeed)
	{
		KFW = KFWeapon(PlayerPawn.Weapon);
		if (KFW == none)
		{
			KFIM = KFInventoryManager(PlayerPawn.InvManager);
			if (KFIM != none && KFIM.PendingWeapon != none)
			{
				KFW = KFWeapon(KFIM.PendingWeapon);
			}
		}

		if (KFW != None && KFW.IsMeleeWeapon() && KFW.bIsBackupWeapon)
		{
			GroundSpeed = PlayerPawn.default.SprintSpeed;
		}
	}
}

//In our case, this should be better explained as a GameInfo-facing AdjustDamage.  Things are being done here that would be incredibly invasive in other classes given the size of our code base.
function ReduceDamage(out int Damage, Pawn Injured, Controller InstigatedBy, class<DamageType> DamageType, TraceHitInfo HitInfo)
{
	local int HitZoneIdx;
	local KFPawn InstigatorPawn;
	local StatAdjustments ToAdjust;

	//Some events can be headshot only.  Do this only if the incoming damage is against a monster-derived class
	//      and it's one of our custom damage types.  Keeps things like crush damage from being scaled to 0.
	if (ActiveEvent.bHeadshotsOnly && KFPawn_Monster(Injured) != none && ClassIsChildOf(DamageType, class'KFDamageType'))
	{
		HitZoneIdx = KFPawn_Monster(Injured).HitZones.Find('ZoneName', HitInfo.BoneName);
		if (HitZoneIdx != HZI_Head)
		{
			Damage = 0;
		}
	}

	if (InstigatedBy != none)
	{
		InstigatorPawn = KFPawn(InstigatedBy.Pawn);

		//Do any instigator-based adjustments here
		if (InstigatorPawn != None)
		{
			if (ActiveEvent.JumpDamageScale != 1.0 && InstigatorPawn.bJumping)
			{
				Damage *= ActiveEvent.JumpDamageScale;
			}
		}
	}

	foreach ActiveEvent.ZedsToAdjust(ToAdjust)
	{
		//Injured zed reduction
		if (Injured.class == ToAdjust.ClassToAdjust)
		{
			Damage *= ToAdjust.DamageTakenScale;
		}

		if (InstigatorPawn != none && InstigatorPawn.class == ToAdjust.ClassToAdjust)
		{
			Damage *= ToAdjust.DamageDealtScale;
		}
	}
}

//Become Cartman
function AdjustForBeefcakeRules(Pawn Pawn, optional BeefcakeType Type = EBT_Damage)
{
	local float CurrentScale, PercentIncrease;
	local KFPawn_Monster KFP;
	local StatAdjustments StatAdjust;
	local float IntendedHeadScaling;
	local float OldHealthMax;

	KFP = KFPawn_Monster(Pawn);
	if (KFP != none)
	{
		foreach ActiveEvent.ZedsToAdjust(StatAdjust)
		{
			if (Pawn.class == StatAdjust.ClassToAdjust)
			{
				CurrentScale = KFP.IntendedBodyScale;

				//Set new body scale based on whether or not we rallied
				CurrentScale += StatAdjust.BeefcakeScaleIncreases[Type];
				CurrentScale = FMin(CurrentScale, StatAdjust.MaxBeefcake);
				KFP.IntendedBodyScale = CurrentScale;

				if (StatAdjust.BeefcakeHealthIncreases[Type] > 0.f && !KFP.IsABoss())
				{
					//Adjust their health by the specified amount
					PercentIncrease = StatAdjust.BeefcakeHealthIncreases[Type];
					OldHealthMax = KFP.HealthMax;
					KFP.HealthMax += KFP.default.Health * PercentIncrease;
					KFP.HealthMax = Min(KFP.default.Health * StatAdjust.MaxBeefcakeHealth, KFP.HealthMax);

					//If we haven't capped health max, also adjust health
					if (OldHealthMax < KFP.HealthMax)
					{
						KFP.Health += KFP.default.Health * PercentIncrease;
						KFP.Health = Min(KFP.Health, KFP.HealthMax);
					}
				}

				//Heads in beefcake are supposed to stay at the original scale.  Do that here.
				IntendedHeadScaling = 1.0 / CurrentScale;
				KFP.IntendedHeadScale = IntendedHeadScaling;
				KFP.SetHeadScale(IntendedHeadScaling, KFP.CurrentHeadScale);
			}
		}
	}
}

function AdjustScoreDamage(Controller InstigatedBy, Pawn DamagedPawn, class<DamageType> damageType)
{
	if (ActiveEvent.bScaleOnHealth)
	{
		AdjustPawnScale(DamagedPawn);
	}
}

function AdjustPawnScale(Pawn Pawn)
{
	local float ScalePercent;
	local KFPawn_Monster MonsterPawn;
	local KFPawn_Human HumanPawn;
	local int CurrentHealth;

	MonsterPawn = KFPawn_Monster(Pawn);
	HumanPawn = KFPawn_Human(Pawn);
	CurrentHealth = Max(Pawn.Health, 0);

	if (ActiveEvent.bScaleOnHealth)
	{
		if (MonsterPawn != none)
		{
			ScalePercent = ActiveEvent.StartingDamageSizeScale - (ActiveEvent.StartingDamageSizeScale - ActiveEvent.DeadDamageSizeScale) * (1 - (float(CurrentHealth) / float(Pawn.HealthMax)));
			MonsterPawn.IntendedBodyScale = ScalePercent;
		}
		//Humans can go > 100 health, only scale down if they fall below the 100 threshold for starting health
		else if (HumanPawn != none)
		{
			if (CurrentHealth > 100)
			{
				ScalePercent = ActiveEvent.StartingDamageSizeScale;
			}
			else
			{
				ScalePercent = ActiveEvent.StartingDamageSizeScale - (ActiveEvent.StartingDamageSizeScale - ActiveEvent.DeadDamageSizeScale) * (1 - (float(CurrentHealth) / 100.0));
			}
			HumanPawn.IntendedBodyScale = ScalePercent;
		}
	}
}

function AdjustMonsterDefaults(out KFPawn_Monster P)
{
	local StatAdjustments ToAdjust;

	if (P == none)
	{
		return;
	}

	//Mode globals
	P.IntendedHeadScale = ActiveEvent.ZedSpawnHeadScale;
	P.SetHeadScale(P.IntendedHeadScale, P.CurrentHeadScale);
	P.CrushScale = ActiveEvent.CrushScale;
	P.bDisableHeadless = ActiveEvent.bDisableHeadless;

	if (ActiveEvent.bUseZedDamageInflation)
	{
		P.bUseDamageInflation = true;
		P.ZeroHealthInflation = ActiveEvent.ZeroHealthInflation;
		P.DamageDeflationRate = ActiveEvent.GlobalDeflationRate;
		P.bDisableGoreMeshWhileAlive = true;
		P.InflationExplosionTimer = ActiveEvent.InflationExplosionTimer;
		P.InflateDeathGravity = ActiveEvent.InflationDeathGravity;
	}

	//Per class overrides
	foreach ActiveEvent.ZedsToAdjust(ToAdjust)
	{
		if (P.class == ToAdjust.ClassToAdjust)
		{
			P.Health *= ToAdjust.HealthScale;
			P.HealthMax *= ToAdjust.HealthScale;
			P.HitZones[HZI_HEAD].GoreHealth *= ToAdjust.HeadHealthScale;
			P.HitZones[HZI_HEAD].MaxGoreHealth = P.HitZones[HZI_HEAD].GoreHealth;
			P.SetShieldScale(ToAdjust.ShieldScale);

			if (ToAdjust.bStartEnraged)
			{
				//If we aren't using the AI controller's spawn enrage, go into the pawn
				if (KFAIController(P.Controller) == none || !KFAIController(P.Controller).SpawnEnraged())
				{
					P.SetEnraged(true);
				}
			}

			if (ToAdjust.bExplosiveDeath && ToAdjust.ExplosionTemplate != none)
			{
				P.bUseExplosiveDeath = true;
			}

			if (ActiveEvent.bUseZedDamageInflation && (ToAdjust.OverrideDeflationRate.X > 0.0f || ToAdjust.OverrideDeflationRate.Y > 0.0f))
			{
				P.DamageDeflationRate = Lerp(ToAdjust.OverrideDeflationRate.X, ToAdjust.OverrideDeflationRate.Y, FMax(NumPlayers, 1) / float(MaxPlayers));
			}

			if (ToAdjust.AdditionalSubSpawns != none)
			{
				SpawnManager.SummonBossMinions(ToAdjust.AdditionalSubSpawns.Squads, Lerp(ToAdjust.AdditionalSubSpawnCount.X, ToAdjust.AdditionalSubSpawnCount.Y, FMax(NumPlayers, 1) / float(MaxPlayers)));
			}
		}
	}
}

function AdjustRestartedPlayer(out KFPawn_Human KFPH)
{
	local KFInventoryManager KFIM;

	//Do human spawn time things
	if (KFPH != none)
	{
		KFPH.bAllowSprinting = ActiveEvent.bHumanSprintEnabled;
		KFPH.NumJumpsAllowed = ActiveEvent.NumJumpsAllowed;
		KFPH.IntendedHeadScale = ActiveEvent.PlayerSpawnHeadScale;
		KFPH.SetHeadScale(KFPH.IntendedHeadScale, KFPH.CurrentHeadScale);
		KFPH.bDisableTraderDialog = ActiveEvent.bDisableTraders;

		KFIM = KFInventoryManager(KFPH.InvManager);
		if (KFIM != none)
		{
			KFIM.OffPerkCostScale = ActiveEvent.OffPerkCostScale;
		}
	}
}

function OnScoreKill(Pawn KilledPawn)
{
}

function ApplyGlobalDamage()
{
	local KFPawn_Human Pawn;
	foreach WorldInfo.AllPawns(class'KFPawn_Human', Pawn)
	{
		Pawn.TakeDamage(OutbreakEvent.ActiveEvent.GlobalDamageTickAmount, none, Pawn.Location, vect(0, 0, 0), class'DmgType_Crushed');
	}
}


function CacheWorldInfo()
{
	if (WorldInfo != none)
	{
		CachedItems.CachedGlobalGravityZ = WorldInfo.GlobalGravityZ;
		CachedItems.CachedWorldGravityZ = WorldInfo.WorldGravityZ;
	}
}

function SetWorldInfoOverrides()
{
	CacheWorldInfo();

	if (WorldInfo != None)
	{
		WorldInfo.GlobalGravityZ = OutbreakEvent.ActiveEvent.GlobalGravityZ;
		WorldInfo.WorldGravityZ = WorldInfo.GlobalGravityZ;
	}
}

function class<KFPawn_Monster> GetAISpawnOverrirde(EAIType AIType)
{
	local SpawnReplacement Replacement;
	local float RandF;

	//Check if our current weekly event has any overrides available
	foreach ActiveEvent.SpawnReplacementList(Replacement)
	{
		if (Replacement.SpawnEntry == AIType)
		{
			if (Replacement.PercentChance < 1.f)
			{
				RandF = FRand();
				//Let loop continue in case we have multiple possible replacements.
				if (RandF > Replacement.PercentChance)
				{
					continue;
				}
			}

			return Replacement.NewClass;
		}
	}

	return AIClassList[AIType];
}

// This will convert the provided Outbreak Index into an Id that corresponds to the Weekly Event.
static function int GetOutbreakId(int SetEventsIndex);

defaultproperties
{

}
