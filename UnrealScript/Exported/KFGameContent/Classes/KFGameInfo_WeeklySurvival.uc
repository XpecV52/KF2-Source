//=============================================================================
// KFGameInfo_WeeklySurvival
//=============================================================================
// Weekly variant of survival with runtime adjusted rule sets.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Dan Weiss
//=============================================================================

class KFGameInfo_WeeklySurvival extends KFGameInfo_Survival;

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

enum BeefcakeType
{
    EBT_Damage,
    EBT_Rally,
    EBT_Scream,
    EBT_StalkerPoison,
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
    
    structdefaultproperties
    {
        HealthScale = 1.f;
        HeadHealthScale = 1.f;
        bExplosiveDeath = false

        MaxBeefcake = 1.5
        MaxBeefcakeHealth = 1.5

        DamageDealtScale = 1.0
        DamageTakenScale = 1.0
        OverrideDeflationRate=(X=0.0,Y=0.0)

        AdditionalSubSpawnCount=(X=1,Y=1)
    }
};

//Overrides for when ResetAllPickups will properly function. PRS_Wave functions like base _Survival.
enum PickupResetTime
{
    PRS_Wave,           //Start of wave
    PRS_Trader,         //During trader time
    PRS_WaveAndTrader,  //During start of wave and start of trader time
    PRS_Never,          //Disable pickups entirely, works like bDisablePickups

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
    }
};

/** List of events setup by design */
var array<WeeklyOverrides> SetEvents;

/** List of events that are in progress or have yet to make the cut */
var array<WeeklyOverrides> TestEvents;

/** Current event being used */
var WeeklyOverrides ActiveEvent;

/** Index of event to use as the default block */
var int ActiveEventIdx;

//-----------------------------------------------------------------------------
// Statics
static event class<GameInfo> SetGameType(string MapName, string Options, string Portal)
{
    local KFGameEngine KGE;

    KGE = KFGameEngine(class'Engine'.static.GetEngine());
    if (KGE != none)
    {
        //Valid index
        if (KGE.GetWeeklyEventIndex() >= 0)
        {
            return super.SetGameType(MapName, Options, Portal);
        }
    }

    //Invalid state, set to normal survival
    return class'KFGameInfo_Survival';
}

static function bool GametypeChecksDifficulty()
{
    return false;
}

static function bool GametypeChecksWaveLength()
{
    return false;
}

//-----------------------------------------------------------------------------
// Initialization

event InitGame( string Options, out string ErrorMessage )
{



    local KFGameEngine KGE;

    //The KFGameEngine at startup will store the week index of our current time
    //      Pull from there and figure out which event it corresponds to.
    //      The beginning of time to reset the loop can be changed in UKFGameEngine::UpdateTimedGameEvents
    KGE = KFGameEngine(class'Engine'.static.GetEngine());
    if (KGE != none)
    {
        ActiveEventIdx = KGE.GetWeeklyEventIndex() % SetEvents.Length;
    }

    ActiveEvent = SetEvents[ActiveEventIdx];






















    SetGameDifficulty();
    SetPickupItemList();
    SetZedTimeOverrides();
    SetSpawnPointOverrides();
    SetWorldInfoOverrides();

    Super.InitGame( Options, ErrorMessage );

    SetGameLength();
}

event PreBeginPlay()
{
    super.PreBeginPlay();

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

function SetGameDifficulty()
{
    //Set game difficulty.  super will create the intended DifficultyInfo object.
    MinGameDifficulty = ActiveEvent.EventDifficulty;
    MaxGameDifficulty = ActiveEvent.EventDifficulty;
}

function SetGameLength()
{
    GameLength = ActiveEvent.GameLength;
}

/** Allow for updates to various game systems if we have an override allowable item list */
function SetPickupItemList()
{
    local STraderItem TraderItem;
    local KFPickupFactory_Item ItemFactory;
    local int Idx;

    //If we have an override weapon list, it's not enough to block trader and default inventory.
    //      Iterate through the item pickups in the map to trim their lists as well.
    if (ActiveEvent.TraderWeaponList != none)
    {
        //So many loops
        foreach AllActors(class'KFPickupFactory_Item', ItemFactory)
        {
            foreach ActiveEvent.TraderWeaponList.SaleItems(TraderItem)
            {
                for (Idx = ItemFactory.ItemPickups.Length - 1; Idx >= 0; --Idx)
                {
                    if (ItemFactory.ItemPickups[Idx].ItemClass.Name != TraderItem.ClassName)
                    {
                        ItemFactory.ItemPickups.Remove(Idx, 1);
                    }
                }
            }
        }
    }    
}

function SetZedTimeOverrides()
{
    if (ZedTimeSlomoScale != ActiveEvent.OverrideZedTimeSlomoScale)
    {
        ZedTimeSlomoScale = ActiveEvent.OverrideZedTimeSlomoScale;
    }    
}

function SetSpawnPointOverrides()
{
    local KFSpawnVolume KFSV;

    foreach WorldInfo.AllActors(class'KFSpawnVolume', KFSV)
    {
        if (ActiveEvent.OverrideSpawnDerateTime >= 0.f)
        {
            KFSV.SpawnDerateTime = ActiveEvent.OverrideSpawnDerateTime;
        }

        if (ActiveEvent.OverrideTeleportDerateTime >= 0.f)
        {
            KFSV.TeleportDerateTime = ActiveEvent.OverrideTeleportDerateTime;
        }
    }
}

function SetWorldInfoOverrides()
{
    if (WorldInfo != None)
    {
        WorldInfo.GlobalGravityZ = ActiveEvent.GlobalGravityZ;
        WorldInfo.WorldGravityZ = WorldInfo.GlobalGravityZ;
    }
}

/** Enable some hax to permanently be in zed time */
function SetPermanentZedTime()
{
    local KFPlayerController KFPC;
    if (ActiveEvent.bPermanentZedTime)
    {
        ZedTimeRemaining = 999999.f;
        bZedTimeBlendingOut = false;
        LastZedTimeEvent = WorldInfo.TimeSeconds;
        SetZedTimeDilation(ZedTimeSlomoScale);

        foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
        {
            if (KFPC != none)
            {
                KFPC.EnterZedTime();
            }
        }
    }
}

//Do a reset on the permanent zed time.  Leaves us in zed time, but puts valid players into the partial mode.
function ResetPermanentZed()
{
    local KFPlayerController KFPC;
    local KFPawn KFP;

    foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
    {
        KFP = KFPawn(KFPC.Pawn);
        if (KFPC != none && KFP != none)
        {
            KFP.bUnaffectedByZedTime = !KFPC.IsAffectedByZedTime();
            if (KFP.bUnaffectedByZedTime)
            {
                KFPC.StartPartialZedTimeSightCounter();
            }
            KFPC.ClientEnterZedTime(KFP.bUnaffectedByZedTime);
        }
    }
}

function StartMatch()
{
    super.StartMatch();

    //Set timer for global ticking damage
    if (ActiveEvent.GlobalDamageTickRate > 0.f && ActiveEvent.GlobalDamageTickAmount > 0.f)
    {
        SetTimer(ActiveEvent.GlobalDamageTickRate, true, 'ApplyGlobalDamage');
    }
}

function CreateDifficultyInfo(string Options)
{
    super.CreateDifficultyInfo(Options);

    //If we want to use custom weapon respawn times, set them here
    if (ActiveEvent.bUseOverrideItemRespawnTime)
    {
        DifficultyInfo.NumPlayers_WeaponPickupRespawnTime = ActiveEvent.OverrideItemRespawnTime;
    }

    //If we want to use custom ammo respawn times, set them here
    if (ActiveEvent.bUseOverrideAmmoRespawnTime)
    {
        DifficultyInfo.NumPlayers_AmmoPickupRespawnTime = ActiveEvent.OverrideAmmoRespawnTime;
    }
}

event PostLogin( PlayerController NewPlayer )
{
    local KFPlayerController_WeeklySurvival KFPC;
    local KFPawn_Customization KFCustomizePawn;
    super.PostLogin(NewPlayer);

    KFPC = KFPlayerController_WeeklySurvival(NewPlayer);
    if (KFPC != none)
    {
        KFPC.bUsingPermanentZedTime = ActiveEvent.bPermanentZedTime;
        KFPC.ZedTimeRadius = ActiveEvent.ZedTimeRadius * ActiveEvent.ZedTimeRadius;
        KFPC.ZedTimeBossRadius = ActiveEvent.ZedTimeBossRadius * ActiveEvent.ZedTimeBossRadius;
        KFPC.ZedTimeHeight = ActiveEvent.ZedTimeHeight;
        KFPC.ZedRecheckTime = ActiveEvent.PermanentZedResetTime;

        //Handle any visual-related things for customization pawn so the pregame lobby has the fun things
        KFCustomizePawn = KFPawn_Customization(KFPC.Pawn);
        if (KFCustomizePawn != none)
        {
            KFCustomizePawn.IntendedHeadScale = ActiveEvent.PlayerSpawnHeadScale;
            KFCustomizePawn.SetHeadScale(KFCustomizePawn.IntendedHeadScale, KFCustomizePawn.CurrentHeadScale);
        }
    }
}

//-----------------------------------------------------------------------------
// Ticking
function TickZedTime( float DeltaTime )
{
    super.TickZedTime(DeltaTime);

    //If we're in permanent mode with a valid wave, set remaining time to a stupid value to stay in zed time
    if (ActiveEvent.bPermanentZedTime && IsWaveActive())
    {
        //Keep up the timer if we have enough zeds left or it's a boss phase
        if (MyKFGRI.AIRemaining > ActiveEvent.PermanentZedTimeCutoff || WaveNum == WaveMax)
        {
            ZedTimeRemaining = 999999.f;
        }
        //Else start the fade back to normal
        else if (ZedTimeRemaining > ZedTimeBlendOutTime)
        {
            ZedTimeRemaining = ZedTimeBlendOutTime;
            ClearZedTimePCTimers();
        }
    }
}

function WaveEnded(EWaveEndCondition WinCondition)
{
    super.WaveEnded(WinCondition);

    if (ActiveEvent.bPermanentZedTime && ZedTimeRemaining > ZedTimeBlendOutTime)
    {
        ClearZedTimePCTimers();
        ZedTimeRemaining = ZedTimeBlendOutTime;
    }
}

function ClearZedTimePCTimers()
{
    local KFPlayerController_WeeklySurvival KFPC;

    foreach AllActors(class'KFPlayerController_WeeklySurvival', KFPC)
    {
        KFPC.ClearTimer('RecheckZedTime');
    }
}

//-----------------------------------------------------------------------------
// Completion
function EndOfMatch(bool bVictory)
{
    local KFPlayerController KFPC;

    super.EndOfMatch(bVictory);

    if (bVictory)
    {
        foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			KFPC.CompletedWeeklySurvival();
		}
    }
}

//-----------------------------------------------------------------------------
// Gametype Functionality
function ModifyGroundSpeed(KFPawn PlayerPawn, out float GroundSpeed)
{
    local KFWeapon KFW;
    local KFInventoryManager KFIM;

    super.ModifyGroundSpeed(PlayerPawn, GroundSpeed);

    if (ActiveEvent.bBackupMeleeSprintSpeed)
    {
        KFW = KFWeapon(PlayerPawn.Weapon);
        if( KFW == none )
        {
            KFIM = KFInventoryManager(PlayerPawn.InvManager);
            if( KFIM != none && KFIM.PendingWeapon != none )
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

//-----------------------------------------------------------------------------
// Wave Status
/** Scale to use against WaveTotalAI to determine full wave size */
function float GetTotalWaveCountScale()
{
    //Boss wave, don't scale it.
    if (WaveNum == WaveMax - 1)
    {
        return 1.0f;
    }
    if (ActiveEvent.WaveAICountScale.Length > 0)
    {
        return GetLivingPlayerCount() > ActiveEvent.WaveAICountScale.Length ? ActiveEvent.WaveAICountScale[ActiveEvent.WaveAICountScale.Length - 1] : ActiveEvent.WaveAICountScale[GetLivingPlayerCount() - 1];
    }
    return 1.0f;
}

function StartWave()
{
    super.StartWave();
    if (ActiveEvent.bPermanentZedTime)
    {
        //If we're a boss wave, wait until the camera animation is going
        if (WaveNum == WaveMax)
        {
            SetTimer(0.25f, true, nameof(BossCameraZedTimeRecheck));
        }
        else
        {
            //Enable permanent zed time
            SetPermanentZedTime();
        }        
    }

    if (ActiveEvent.AdditionalBossWaveInfo != none && WaveNum == WaveMax)
    {
        SetTimer(ActiveEvent.AdditionalBossWaveStartDelay, true, nameof(SpawnBossWave));
    }
}

function BossCameraZedTimeRecheck()
{
    local KFPawn_Monster KFM;

    foreach WorldInfo.AllPawns(class'KFPawn_Monster', KFM)
    {
        if (KFM.IsActiveBoss())
        {
            if (KFM.bUseAnimatedTheatricCamera)
            {
                return;
            }
            //We have a boss that isn't animating.  Go ahead and start zed time
            else
            {
                Cleartimer(nameof(BossCameraZedTimeRecheck));
                SetPermanentZedTime();
            }
        }
    }
}

//Hijack existing boss summon functionality to spawn extra boss wave
function SpawnBossWave()
{
    SetTimer(ActiveEvent.AdditionalBossWaveFrequency, false, nameof(SpawnBossWave));
    SpawnManager.SummonBossMinions(ActiveEvent.AdditionalBossWaveInfo.Squads, GetAdditionalBossSpawns());

    if (!ActiveEvent.bContinuousAdditionalBossWave)
    {
        //Arbitrary time, but delay a bit for spawns to go through, then cut off additional boss wave spawning til next timer hit
        SetTimer(2.f, false, nameof(PauseAdditionalBossWaves));
    }
}

function PauseAdditionalBossWaves()
{
    SpawnManager.StopSummoningBossMinions();
}

function byte GetAdditionalBossSpawns()
{
    return byte(Lerp(ActiveEvent.AdditionalBossSpawnCount.X,ActiveEvent.AdditionalBossSpawnCount.Y,fMax(NumPlayers, 1) / float(MaxPlayers)));
}

function OpenTrader()
{
    //If we're in permanent zed time, disable it for trader time
    if (ActiveEvent.bPermanentZedTime && ZedTimeRemaining > ZedTimeBlendOutTime)
    {
        ClearZedTimePCTimers();
        ZedTimeRemaining = ZedTimeBlendOutTime;
    }    

    if (!ActiveEvent.bDisableTraders)
    {
        super.OpenTrader();
    }
    else if (KFGameReplicationInfo(GameReplicationInfo) != none)
    {
        KFGameReplicationInfo(GameReplicationInfo).StartScavengeTime(TimeBetweenWaves);
    }
}

function SetupNextTrader()
{
    if (!ActiveEvent.bDisableTraders)
    {
        super.SetupNextTrader();
    }
}

State TraderOpen
{
	function BeginState( Name PreviousStateName )
	{
        super.BeginState(PreviousStateName);

        //Adding the call here.  Whether or not super gets called is based on ActiveEvent flag.
        ResetAllPickups();
    }
}

function InitAllPickups()
{
    super.InitAllPickups();

    //If this event is trying to do things to the pickup count, redo the init functionality
    if (ActiveEvent.OverrideItemPickupModifier >= 0.f || ActiveEvent.OverrideAmmoPickupModifier >= 0.f)
    {
        NumWeaponPickups = ItemPickups.Length * (ActiveEvent.OverrideItemPickupModifier >= 0.f ? ActiveEvent.OverrideItemPickupModifier : DifficultyInfo.GetItemPickupModifier());
		NumAmmoPickups = AmmoPickups.Length * (ActiveEvent.OverrideAmmoPickupModifier >= 0.f ? ActiveEvent.OverrideAmmoPickupModifier : DifficultyInfo.GetAmmoPickupModifier());


	if( BaseMutator != none )
	{
		BaseMutator.ModifyPickupFactories();
	}


        ResetAllPickups();
    }
}

function ResetAllPickups()
{
    local bool bCallReset;

    bCallReset = false;
    switch(ActiveEvent.PickupResetTime)
    {
    case PRS_Wave:
        bCallReset = IsWaveActive();
        break;
    case PRS_Trader:
        bCallReset = !IsWaveActive();
        break;
    case PRS_WaveAndTrader:
        bCallReset = true;
        break;
    case PRS_Never:
        bCallReset = false;
        break;
    }

    if (bCallReset)
    {
        super.ResetAllPickups();
    }
}

function ResetPickups( array<KFPickupFactory> PickupList, int NumPickups )
{
    //If we're resetting ammo and in an ammo list, use that modifier
    if (ActiveEvent.WaveAmmoPickupModifiers.Length >= WaveMax && KFPickupFactory_Ammo(PickupList[0]) != none)
    {
        NumPickups *= ActiveEvent.WaveAmmoPickupModifiers[WaveNum];
        super(KFGameInfo).ResetPickups(PickupList, NumPickups);
    }
    //If we're resetting items and in an item list, use that modifier
    else if (ActiveEvent.WaveItemPickupModifiers.Length >= WaveMax && KFPickupFactory_Item(PickupList[0]) != none)
    {
        NumPickups *= ActiveEvent.WaveItemPickupModifiers[WaveNum];
        super(KFGameInfo).ResetPickups(PickupList, NumPickups);
    }
    //Otherwise, use normal path
    else
    {
        super.ResetPickups(PickupList, NumPickups);
    }
}

//-----------------------------------------------------------------------------
// Spawning

/** Allow specific game type to override the spawn class.  Default implementation returns from the AI class list. */
function class<KFPawn_Monster> GetAISpawnType(EAIType AIType)
{
    local SpawnReplacement Replacement;
    local float RandF;

    if (WaveNum < WaveMax || ActiveEvent.bAllowSpawnReplacementDuringBossWave)
    {
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
    }    

    //No override, return default
    return AIClassList[AIType];
}

/** Allow specific game type to override the boss spawn class.  Default implementation returns from the AI class list. */
function class<KFPawn_Monster> GetBossAISpawnType()
{
    local SpawnReplacement Replacement;
    local int BossIdx;
   
    BossIdx = Rand(AIBossClassList.Length);

    //Check if our current weekly event has any overrides available
    foreach ActiveEvent.BossSpawnReplacementList(Replacement)
    {
        if (Replacement.SpawnEntry == BossIdx)
        {
            return Replacement.NewClass;
        }
    }

    return AIBossClassList[BossIdx];
}

//Anything that should occur prior to Possess is called on the controller paired with the new pawn
event PrePossessAdjustments(KFPawn NewSpawn)
{
    local SpawnReplacement Replacement;
    local KFPawn_Monster KFPM;

    if (NewSpawn == none)
    {
        return;
    }

    KFPM = KFPawn_Monster(NewSpawn);

    //Check if we're a boss replacement.  If so, set override boss flag so our
    //      death chain can properly function.
    foreach ActiveEvent.BossSpawnReplacementList(Replacement)
    {
        if (KFPM != none && Replacement.NewClass == NewSpawn.class && KFPawn_MonsterBoss(NewSpawn) == none)
        {
            KFPM.bOverrideAsBoss = true;
            KFPM.bAlwaysRelevant = true;
        }
    }
}

function SetMonsterDefaults( KFPawn_Monster P )
{
    local StatAdjustments ToAdjust;

    //Allow game type to set the defaults first, then override
    super.SetMonsterDefaults(P);   

    if (P == none)
    {
        return;
    }

    //Mode globals
    P.IntendedHeadScale = ActiveEvent.ZedSpawnHeadScale;
    P.SetHeadScale(P.IntendedHeadScale,P.CurrentHeadScale);
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

            if (ToAdjust.bStartEnraged)
            {
                P.SetEnraged(true);
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
                SpawnManager.SummonBossMinions( ToAdjust.AdditionalSubSpawns.Squads, Lerp(ToAdjust.AdditionalSubSpawnCount.X, ToAdjust.AdditionalSubSpawnCount.Y, FMax(NumPlayers, 1) / float(MaxPlayers)) );
            }
        }
    }
}

/** Allow specific game types to modify the spawn rate at a global level */
function float GetGameInfoSpawnRateMod()
{
    return 1.0 / ActiveEvent.SpawnRateMultiplier;
}

/** Whether or not a specific primary weapon is allowed.  Called at player spawn time while setting inventory. */
function bool AllowPrimaryWeapon(string ClassPath)
{
    local STraderItem Item;
    if (ActiveEvent.SpawnWeaponList != none)
    {
        foreach ActiveEvent.SpawnWeaponList.SaleItems(Item)
        {
            if (Item.ClassName == name(ClassPath))
            {
                return true;
            }
        }
        return false;
    }
    return true;
}

/** Allows gametype to adjust starting grenade count.  Called at player spawn time from GiveInitialGrenadeCount in the inventory. */
function int AdjustStartingGrenadeCount(int CurrentCount)
{
    if (ActiveEvent.bDisableGrenades)
    {
        return 0;
    }
    return CurrentCount;
}

function RestartPlayer(Controller NewPlayer)
{
    local KFPawn_Human KFPH;
    local KFInventoryManager KFIM;

    super.RestartPlayer(NewPlayer);

    KFPH = KFPawn_Human(NewPlayer.Pawn);

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

//-----------------------------------------------------------------------------
// Damage

function ScoreDamage( int DamageAmount, int HealthBeforeDamage, Controller InstigatedBy, Pawn DamagedPawn, class<DamageType> damageType )
{
    super.ScoreDamage(DamageAmount, HealthBeforeDamage, InstigatedBy, DamagedPawn, damageType);

    if (ActiveEvent.bScaleOnHealth)
    {
        AdjustPawnScale(DamagedPawn);
    }
    
    if (ActiveEvent.bUseBeefcakeRules)
    {
        if (InstigatedBy != none)
        {
            AdjustForBeefcakeRules(InstigatedBy.Pawn);
        }       

        if (DamagedPawn != none && damageType == class'KFDT_Toxic_PlayerCrawlerSuicide')
        {
            AdjustForBeefcakeRules(DamagedPawn, EBT_StalkerPoison);
        }
    }
}

function ScoreHeal( int HealAmount, int HealthBeforeHeal, Controller InstigatedBy, Pawn HealedPawn, class<DamageType> DamageType )
{
    super.ScoreHeal(HealAmount, HealthBeforeHeal, InstigatedBy, HealedPawn, DamageType);

    if (ActiveEvent.bScaleOnHealth)
    {
        AdjustPawnScale(HealedPawn);
    }
}

function PassiveHeal(int HealAmount, int HealthBeforeHeal, Controller InstigatedBy, Pawn HealedPawn)
{
    super.PassiveHeal(HealAmount, HealthBeforeHeal, InstigatedBy, HealedPawn);

    if (ActiveEvent.bScaleOnHealth)
    {
        AdjustPawnScale(HealedPawn);
    }
}

function ScoreKill( Controller Killer, Controller Other )
{
    local StatAdjustments ToAdjust;
    super.ScoreKill(Killer, Other);

    if (Role == ROLE_Authority && Other != none && Other.Pawn != none)
    {
        foreach ActiveEvent.ZedsToAdjust(ToAdjust)
        {
            if (ToAdjust.ClassToAdjust == Other.Pawn.class)
            {
                if (ToAdjust.bExplosiveDeath && ToAdjust.ExplosionTemplate != none)
                {
                    //Skip if we shouldn't do the normal death explosion
                    if (KFPawn(Other.Pawn) != none && !KFPawn(Other.Pawn).WeeklyShouldExplodeOnDeath())
                    {
                        return;
                    }

                    DoDeathExplosion(Other.Pawn, ToAdjust.ExplosionTemplate, ToAdjust.ExplosionIgnoreClass);
                }
            }
        }
    }    
}

function NotifyRally(KFPawn RalliedPawn)
{
    super.NotifyRally(RalliedPawn);

    if (ActiveEvent.bUseBeefcakeRules)
    {
        AdjustForBeefcakeRules(RalliedPawn, EBT_Rally);
    }
}

function NotifyIgnoredScream(KFPawn ScreamPawn)
{
    super.NotifyIgnoredScream(ScreamPawn);

    if (ActiveEvent.bUseBeefcakeRules)
    {
        AdjustForBeefcakeRules(ScreamPawn, EBT_Scream);
    }
}

function DoDeathExplosion(Pawn DeadPawn, KFGameExplosion ExplosionTemplate, class<KFPawn> ExplosionIgnoreClass)
{
    local KFExplosionActorReplicated ExploActor;

    ExploActor = Spawn(class'KFExplosionActorReplicated', DeadPawn, , DeadPawn.Location);
    if (ExploActor != none)
    {
        ExploActor.InstigatorController = DeadPawn.Controller;
        ExploActor.Instigator = DeadPawn;
        ExploActor.Attachee = DeadPawn;
        ExplosionTemplate.ActorClassToIgnoreForDamage = ExplosionIgnoreClass;
        ExploActor.Explode(ExplosionTemplate, vect(0,0,1));
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
            if (StatAdjust.ClassToAdjust == Pawn.class)
            {
                CurrentScale = KFP.IntendedBodyScale;

                //Set new body scale based on whether or not we rallied
                CurrentScale += StatAdjust.BeefcakeScaleIncreases[Type];
                CurrentScale = FMin(CurrentScale, StatAdjust.MaxBeefcake);
                KFP.IntendedBodyScale = CurrentScale;

                if (StatAdjust.BeefcakeHealthIncreases[Type] > 0.f)
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

//In our case, this should be better explained as a GameInfo-facing AdjustDamage.  Things are being done here that would be incredibly invasive in other classes given the size of our code base.
function ReduceDamage(out int Damage, Pawn Injured, Controller InstigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType, Actor DamageCauser, TraceHitInfo HitInfo)
{
    local int HitZoneIdx;
    local KFPawn InstigatorPawn;
    local StatAdjustments ToAdjust;

    super.ReduceDamage(Damage, Injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser, HitInfo);

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
        if (Injured.Class == ToAdjust.ClassToAdjust)
        {
            Damage *= ToAdjust.DamageTakenScale;            
        }

        if (InstigatorPawn != none && InstigatorPawn.Class == ToAdjust.ClassToAdjust)
        {
            Damage *= ToAdjust.DamageDealtScale;
        }
    }
}

function ApplyGlobalDamage()
{
    local KFPawn_Human Pawn;
    foreach WorldInfo.AllPawns(class'KFPawn_Human', Pawn)
    {
        Pawn.TakeDamage(ActiveEvent.GlobalDamageTickAmount, none, Pawn.Location, vect(0,0,0), class'DmgType_Crushed');
    }
}

defaultproperties
{
   SetEvents(0)=(EventDifficulty=1,GameLength=1,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.PawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',bStartEnraged=True,bExplosiveDeath=True,ExplosionTemplate=KFGameExplosion'GP_Weekly_ARCH.BigPawnExplosionTemplate',ExplosionIgnoreClass=Class'KFGame.KFPawn_Monster')))
   SetEvents(1)=(EventDifficulty=1,GameLength=1,bHeadshotsOnly=True,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.250000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.250000)))
   SetEvents(2)=(EventDifficulty=2,GameLength=1,bScaleOnHealth=True,DeadDamageSizeScale=0.500000)
   SetEvents(3)=(EventDifficulty=2,GameLength=1,SpawnRateMultiplier=2.500000,GlobalAmmoCostScale=0.500000,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthScale=3.000000,HeadHealthScale=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthScale=3.000000,HeadHealthScale=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthScale=3.000000,HeadHealthScale=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthScale=1.500000,HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthScale=3.000000,HeadHealthScale=5.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthScale=2.000000,HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HealthScale=3.000000,HeadHealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthScale=3.000000,HeadHealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',HealthScale=3.000000,HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',HealthScale=3.000000,HeadHealthScale=2.500000)),WaveAICountScale=(0.700000,0.700000,0.700000,0.700000,0.700000,0.700000),ZedSpawnHeadScale=2.700000,PlayerSpawnHeadScale=2.000000,bDisableHeadless=True)
   SetEvents(4)=(EventDifficulty=2,GameLength=1,SpawnReplacementList=((SpawnEntry=2,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.050000),(SpawnEntry=1,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.100000),(SpawnEntry=4,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.100000),(SpawnEntry=3,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.050000),(SpawnEntry=5,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.050000),(SpawnEntry=6,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpound',PercentChance=0.900000),(SpawnEntry=9,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundMini',PercentChance=0.650000)),BossSpawnReplacementList=((NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundKing'),(SpawnEntry=1,NewClass=Class'kfgamecontent.KFPawn_ZedFleshpoundKing')),ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpoundKing',HealthScale=3.750000,bStartEnraged=True)),WaveAICountScale=(0.550000,0.550000,0.550000,0.550000,0.550000,0.550000))
   SetEvents(5)=(EventDifficulty=1,GameLength=1,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',HealthScale=2.000000,HeadHealthScale=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',HealthScale=0.400000,HeadHealthScale=1.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',HealthScale=3.000000,HeadHealthScale=6.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',HealthScale=3.000000,HeadHealthScale=6.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',HealthScale=0.350000,HeadHealthScale=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',HeadHealthScale=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',HealthScale=0.750000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.800000,OverrideDeflationRate=(X=0.010000,Y=0.010000)),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=1.100000,OverrideDeflationRate=(X=0.010000,Y=0.020000)),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',HealthScale=0.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren'),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',HealthScale=3.500000,HeadHealthScale=5.000000)),WaveAICountScale=(0.700000,0.700000,0.700000,0.700000,0.700000,0.700000),bUseZedDamageInflation=True,ZeroHealthInflation=3.000000,InflationDeathGravity=-0.570000,InflationExplosionTimer=1.700000)
   SetEvents(6)=(EventDifficulty=3,SpawnRateMultiplier=15.000000,SpawnReplacementList=((SpawnEntry=5,NewClass=Class'kfgamecontent.KFPawn_ZedScrake',PercentChance=0.070000)),bAllowSpawnReplacementDuringBossWave=False,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',HealthScale=0.800000,DamageDealtScale=0.850000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',HealthScale=0.700000,DamageDealtScale=0.700000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',DamageDealtScale=0.600000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',DamageDealtScale=0.600000)),bPermanentZedTime=True,PermanentZedTimeCutoff=6,OverrideZedTimeSlomoScale=0.500000,ZedTimeRadius=1450.000000,ZedTimeBossRadius=2048.000000,ZedTimeHeight=512.000000,OverrideSpawnDerateTime=0.000000,OverrideTeleportDerateTime=0.000000,WaveAICountScale=(0.500000,0.500000,0.500000,0.500000,0.500000,0.500000),MaxPerkLevel=3)
   SetEvents(7)=(EventDifficulty=2,GameLength=1,ZedsToAdjust=((ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Cyst',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Alpha',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_AlphaKing',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedClot_Slasher',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedSiren',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.500000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedStalker',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawler',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedCrawlerKing',BeefcakeScaleIncreases=(0.100000,0.500000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=4.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefast',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.900000,0.500000,0.500000,0.500000),MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedGorefastDualBlade',BeefcakeScaleIncreases=(0.050000,0.050000,0.020000,0.020000),BeefcakeHealthIncreases=(0.200000,0.200000,0.200000,0.200000),MaxBeefcakeHealth=2.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedBloat',BeefcakeScaleIncreases=(0.050000,0.100000,0.020000,0.020000),BeefcakeHealthIncreases=(0.200000,0.200000,0.200000,0.200000),MaxBeefcake=1.250000,MaxBeefcakeHealth=3.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHusk',BeefcakeScaleIncreases=(0.050000,0.100000,0.020000,0.020000),BeefcakeHealthIncreases=(0.200000,0.200000,0.200000,0.200000),MaxBeefcake=1.250000,MaxBeefcakeHealth=2.500000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedScrake',BeefcakeScaleIncreases=(0.050000,0.200000,0.020000,0.020000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedFleshpound',BeefcakeScaleIncreases=(0.050000,0.200000,0.020000,0.020000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedHans',BeefcakeScaleIncreases=(0.010000,0.010000,0.010000,0.010000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000),(ClassToAdjust=Class'kfgamecontent.KFPawn_ZedPatriarch',BeefcakeScaleIncreases=(0.010000,0.010000,0.010000,0.010000),BeefcakeHealthIncreases=(0.000000,0.000000,0.000000,0.000000),MaxBeefcake=1.250000,MaxBeefcakeHealth=1.000000)),bUseBeefcakeRules=True,WaveAICountScale=(0.750000,0.750000,0.750000,0.750000,0.750000,0.750000))
   ActiveEvent=(SpawnRateMultiplier=1.000000,GlobalAmmoCostScale=1.000000,bAllowSpawnReplacementDuringBossWave=True,OverrideItemPickupModifier=-1.000000,OverrideAmmoPickupModifier=-1.000000,OverrideItemRespawnTime=(PlayersMod[0]=1.000000,PlayersMod[1]=1.000000,PlayersMod[2]=1.000000,PlayersMod[3]=1.000000,PlayersMod[4]=1.000000,PlayersMod[5]=1.000000,ModCap=2.000000),OverrideAmmoRespawnTime=(PlayersMod[0]=1.000000,PlayersMod[1]=1.000000,PlayersMod[2]=1.000000,PlayersMod[3]=1.000000,PlayersMod[4]=1.000000,PlayersMod[5]=1.000000,ModCap=2.000000),PermanentZedResetTime=1.000000,OverrideZedTimeSlomoScale=0.200000,StartingDamageSizeScale=1.000000,DeadDamageSizeScale=0.100000,OverrideSpawnDerateTime=-1.000000,OverrideTeleportDerateTime=-1.000000,GlobalGravityZ=-1150.000000,ZedSpawnHeadScale=1.000000,PlayerSpawnHeadScale=1.000000,bHumanSprintEnabled=True,OffPerkCostScale=1.000000,AdditionalBossWaveStartDelay=15.000000,bContinuousAdditionalBossWave=True,CrushScale=1.000000,JumpDamageScale=1.000000,NumJumpsAllowed=1,ZeroHealthInflation=1.000000,GlobalDeflationRate=0.100000,InflationDeathGravity=-0.100000,InflationExplosionTimer=3.000000,MaxPerkLevel=4)
   GameName="Weekly Outbreak"
   PlayerControllerClass=Class'KFGame.KFPlayerController_WeeklySurvival'
   Name="Default__KFGameInfo_WeeklySurvival"
   ObjectArchetype=KFGameInfo_Survival'kfgamecontent.Default__KFGameInfo_Survival'
}
