/*******************************************************************************
 * KFOutbreakEvent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFOutbreakEvent extends Object within KFGameInfo;

enum PickupResetTime
{
    PRS_Wave,
    PRS_Trader,
    PRS_WaveAndTrader,
    PRS_Never,
    PRS_MAX
};

enum BeefcakeType
{
    EBT_Damage,
    EBT_Rally,
    EBT_Scream,
    EBT_StalkerPoison,
    EBT_MAX
};

struct StatAdjustments
{
    /** Individual per-class adjustments to make after a zed spawns //Class to adjust */
    var() class<KFPawn_Monster> ClassToAdjust;
    /** Individual per-class adjustments to make after a zed spawns //Class to adjust//Health percentage scale
 */
    var() float HealthScale;
    /** Individual per-class adjustments to make after a zed spawns //Class to adjust//Health percentage scale
//Scale for gore health of the head hit zone
 */
    var() float HeadHealthScale;
    /** Individual per-class adjustments to make after a zed spawns //Class to adjust//Health percentage scale
//Scale for gore health of the head hit zone
//Scale for shield for zeds that support this
 */
    var() float ShieldScale;
    /** Individual per-class adjustments to make after a zed spawns //Class to adjust//Health percentage scale
//Scale for gore health of the head hit zone
//Scale for shield for zeds that support this
//Start enraged
 */
    var() bool bStartEnraged;
    /** Individual per-class adjustments to make after a zed spawns //Class to adjust//Health percentage scale
//Scale for gore health of the head hit zone
//Scale for shield for zeds that support this
//Start enraged
//Whether or not to explode on death
 */
    var() bool bExplosiveDeath;
    var KFGameExplosion ExplosionTemplate;
    var class<KFPawn> ExplosionIgnoreClass;
    var array<float> BeefcakeScaleIncreases;
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
    /** Ammount of health recovered to the player on kill */
    var() int HealByKill;
    /** Ammount of health recovered to the player on kill assistance */
    var() int HealByAssistance;
    /** Killing the zed should give a different dosh amount than the standard. */
    var() int DoshGiven;
    /** Speed modifier */
    var() float InitialGroundSpeedModifierScale;

    structdefaultproperties
    {
        ClassToAdjust=none
        HealthScale=1
        HeadHealthScale=1
        ShieldScale=1
        bStartEnraged=false
        bExplosiveDeath=false
        ExplosionTemplate=none
        ExplosionIgnoreClass=none
        BeefcakeScaleIncreases=none
        BeefcakeHealthIncreases=none
        MaxBeefcake=1.5
        MaxBeefcakeHealth=1.5
        DamageDealtScale=1
        DamageTakenScale=1
        OverrideDeflationRate=(X=0,Y=0)
        AdditionalSubSpawns=none
        AdditionalSubSpawnCount=(X=1,Y=1)
        HealByKill=0
        HealByAssistance=0
        DoshGiven=-1
        InitialGroundSpeedModifierScale=1
    }
};

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
    /**  
     *If this array is not empty, modifies the pawn's DefaultInventory
     *            array prior to calling in to P.AddDefaultInventory
     */
    var() KFGFxObject_TraderItems SpawnWeaponList;
    /** If this flag is set to true, the secondary weapon will be checked for availability in the current game mode */
    var() bool bSpawnWeaponListAffectsSecondaryWeapons;
    /** If this array is not empty, modifies the trader's list of available weapons */
    var() KFGFxObject_TraderItems TraderWeaponList;
    /** Whether or not grenades are disabled at spawn and for purchase */
    var() bool bDisableGrenades;
    /** If this array is not empty, modifies the list of perks available for this weekly mode */
    var() const array< class<KFPerk> > PerksAvailableList;
    /**  
     *Activates the special conditions for the Colliseum Weekly Mode
     *               1) Disables Berserker lvl25 skills  2) Enables lvl25 battery ram skill of the swat
     */
    var() bool bColliseumSkillConditionsActive;
    /** If this array is not empty, replaces AIClassList entries with a new spawn class */
    var() array<SpawnReplacement> SpawnReplacementList;
    /** Whether or not to use the spawn replacement list in the boss wave */
    var() bool bAllowSpawnReplacementDuringBossWave;
    /** If this array is not empty, replaces AIClassList entries with a new spawn class */
    var() array<BossSpawnReplacement> BossSpawnReplacementList;
    /** If this array is not empty, properties set in ZedsToAdjust are used in AdjustSpawnedAIPawn */
    var() array<StatAdjustments> ZedsToAdjust;
    /** Whether or not to skip opening of the trader */
    var() bool bDisableTraders;
    /** When to reset pickups */
    var() KFOutbreakEvent.PickupResetTime PickupResetTime;
    /** Override for the difficulty's item pickup modifier */
    var() float OverrideItemPickupModifier<ClampMax=1.0>;
    /** Overrride for the difficulty's ammo pickup modifier */
    var() float OverrideAmmoPickupModifier<ClampMax=1.0>;
    /** Overrides for the standard wave scale behavior of WaveNum / WaveMax */
    var() array<float> WaveItemPickupModifiers;
    /** Overrides for the standard wave scale behavior of WaveNum / WaveMax */
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
    var() float ZedTimeBossRadius;
    /** Height to use for kicking players out of partial zed time */
    var() float ZedTimeHeight;
    /** Use a new probability of getting a drama event when a Zed is killed on a 3m radius of the player */
    var() bool bModifyZedTimeOnANearZedKill;
    /** Percentage value (0...1) for the probability of getting a drama event when a Zed is killed on a 3m radius of the player */
    var() float ZedTimeOnANearZedKill;
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
    /** Heal after kill */
    var() bool bHealAfterKill;
    /** Cannot be Healed */
    var() bool bCannotBeHealed;
    /** Global Damage affects shield or ignores it */
    var() bool bGlobalDamageAffectsShield;
    /** Global Damage Should be applied during a boss wave */
    var() bool bApplyGlobalDamageBossWave;
    /** Replenish player's health once a wave ends. */
    var() bool bHealPlayerAfterWave;
    /** Global modifier of dosh received by players when a zed is killed. Default value is 1.0 */
    var() float DoshOnKillGlobalModifier;
    /** Delay After a wave starts for applying global damage. */
    var() float DamageDelayAfterWaveStarted;
    /** If another outbreak mode shares the same events, this will link the two to quicker UI lookup */
    var() int WeeklyOutbreakId;

    structdefaultproperties
    {
        EventDifficulty=0
        GameLength=0
        bHeadshotsOnly=false
        SpawnRateMultiplier=1
        GlobalDamageTickRate=0
        GlobalDamageTickAmount=0
        GlobalAmmoCostScale=1
        SpawnWeaponList=none
        bSpawnWeaponListAffectsSecondaryWeapons=false
        TraderWeaponList=none
        bDisableGrenades=false
        PerksAvailableList=none
        bColliseumSkillConditionsActive=false
        SpawnReplacementList=none
        bAllowSpawnReplacementDuringBossWave=true
        BossSpawnReplacementList=none
        ZedsToAdjust=none
        bDisableTraders=false
        PickupResetTime=PickupResetTime.PRS_Wave
        OverrideItemPickupModifier=-1
        OverrideAmmoPickupModifier=-1
        WaveItemPickupModifiers=none
        WaveAmmoPickupModifiers=none
        bUseOverrideItemRespawnTime=false
        OverrideItemRespawnTime=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2)
        bUseOverrideAmmoRespawnTime=false
        OverrideAmmoRespawnTime=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2)
        bPermanentZedTime=false
        PermanentZedTimeCutoff=0
        PermanentZedResetTime=1
        OverrideZedTimeSlomoScale=0.2
        ZedTimeRadius=0
        ZedTimeBossRadius=0
        ZedTimeHeight=0
        bModifyZedTimeOnANearZedKill=false
        ZedTimeOnANearZedKill=0.05
        bScaleOnHealth=false
        StartingDamageSizeScale=1
        DeadDamageSizeScale=0.1
        OverrideSpawnDerateTime=-1
        OverrideTeleportDerateTime=-1
        GlobalGravityZ=-1150
        bUseBeefcakeRules=false
        WaveAICountScale=none
        ZedSpawnHeadScale=1
        PlayerSpawnHeadScale=1
        bHumanSprintEnabled=true
        OffPerkCostScale=1
        bBackupMeleeSprintSpeed=false
        AdditionalBossWaveInfo=none
        AdditionalBossWaveFrequency=0
        AdditionalBossWaveStartDelay=15
        AdditionalBossSpawnCount=(X=0,Y=0)
        bContinuousAdditionalBossWave=true
        CrushScale=1
        JumpDamageScale=1
        NumJumpsAllowed=1
        bUseZedDamageInflation=false
        ZeroHealthInflation=1
        GlobalDeflationRate=0.1
        InflationDeathGravity=-0.1
        InflationExplosionTimer=3
        bDisableHeadless=false
        MaxPerkLevel=4
        MaxBoomsPerFrame=0
        bHealAfterKill=false
        bCannotBeHealed=false
        bGlobalDamageAffectsShield=true
        bApplyGlobalDamageBossWave=true
        bHealPlayerAfterWave=false
        DoshOnKillGlobalModifier=1
        DamageDelayAfterWaveStarted=10
        WeeklyOutbreakId=-1
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
    var PerkAvailableData PerksAvailableData;

    structdefaultproperties
    {
        TraderItems=none
        GameAmmoCostScale=1
        bAllowGrenadePurchase=true
        bTradersEnabled=true
        MaxPerkLevel=0
        CachedWorldGravityZ=0
        CachedGlobalGravityZ=0
        PerksAvailableData=(bPerksAvailableLimited=false,bBerserkerAvailable=false,bCommandoAvailable=false,bSupportAvailable=false,bFieldMedicAvailable=false,bDemolitionistAvailable=false,bFirebugAvailable=false,bGunslingerAvailable=false,bSharpshooterAvailable=false,bSwatAvailable=false,bSurvivalistAvailable=false)
    }
};

var array<WeeklyOverrides> SetEvents;
var array<WeeklyOverrides> TestEvents;
var WeeklyOverrides ActiveEvent;
var CachedOutbreakInfo CachedItems;

function SetActiveEvent(int ActiveEventIdx)
{
    if(ActiveEventIdx < SetEvents.Length)
    {
        ActiveEvent = SetEvents[ActiveEventIdx];
    }
}

function ClearActiveEvent()
{
    local WeeklyOverrides EmptyEvent;

    Outer.WorldInfo.WorldGravityZ = CachedItems.CachedWorldGravityZ;
    Outer.WorldInfo.GlobalGravityZ = CachedItems.CachedGlobalGravityZ;
    if((Outer.GameReplicationInfo != none) && KFGameReplicationInfo(Outer.GameReplicationInfo) != none)
    {
        if(ActiveEvent.TraderWeaponList != none)
        {
            KFGameReplicationInfo(Outer.GameReplicationInfo).TraderItems = CachedItems.TraderItems;
        }
        if(ActiveEvent.PerksAvailableList.Length > 0)
        {
            KFGameReplicationInfo(Outer.GameReplicationInfo).PerksAvailableData = CachedItems.PerksAvailableData;
        }
        KFGameReplicationInfo(Outer.GameReplicationInfo).GameAmmoCostScale = CachedItems.GameAmmoCostScale;
        KFGameReplicationInfo(Outer.GameReplicationInfo).bAllowGrenadePurchase = CachedItems.bAllowGrenadePurchase;
        KFGameReplicationInfo(Outer.GameReplicationInfo).bTradersEnabled = CachedItems.bTradersEnabled;
        KFGameReplicationInfo(Outer.GameReplicationInfo).MaxPerkLevel = CachedItems.MaxPerkLevel;
    }
    ActiveEvent = EmptyEvent;
}

function CacheGRI()
{
    CachedItems.CachedGlobalGravityZ = Outer.WorldInfo.GlobalGravityZ;
    CachedItems.CachedWorldGravityZ = Outer.WorldInfo.WorldGravityZ;
    if((Outer.GameReplicationInfo != none) && KFGameReplicationInfo(Outer.GameReplicationInfo) != none)
    {
        if(ActiveEvent.TraderWeaponList != none)
        {
            CachedItems.TraderItems = KFGameReplicationInfo(Outer.GameReplicationInfo).TraderItems;
        }
        if(ActiveEvent.PerksAvailableList.Length > 0)
        {
            CachedItems.PerksAvailableData = KFGameReplicationInfo(Outer.GameReplicationInfo).PerksAvailableData;
        }
        CachedItems.GameAmmoCostScale = KFGameReplicationInfo(Outer.GameReplicationInfo).GameAmmoCostScale;
        CachedItems.bAllowGrenadePurchase = KFGameReplicationInfo(Outer.GameReplicationInfo).bAllowGrenadePurchase;
        CachedItems.bTradersEnabled = KFGameReplicationInfo(Outer.GameReplicationInfo).bTradersEnabled;
        CachedItems.MaxPerkLevel = KFGameReplicationInfo(Outer.GameReplicationInfo).MaxPerkLevel;
    }
}

function UpdateGRI()
{
    local int I;
    local KFGameReplicationInfo KFGRI;

    CacheGRI();
    if((Outer.GameReplicationInfo != none) && KFGameReplicationInfo(Outer.GameReplicationInfo) != none)
    {
        KFGRI = KFGameReplicationInfo(Outer.GameReplicationInfo);
        if(ActiveEvent.TraderWeaponList != none)
        {
            KFGRI.TraderItems = ActiveEvent.TraderWeaponList;
        }
        if(ActiveEvent.PerksAvailableList.Length > 0)
        {
            KFGRI.PerksAvailableData.bPerksAvailableLimited = true;
            KFGRI.PerksAvailableData.bBerserkerAvailable = false;
            KFGRI.PerksAvailableData.bCommandoAvailable = false;
            KFGRI.PerksAvailableData.bSupportAvailable = false;
            KFGRI.PerksAvailableData.bFieldMedicAvailable = false;
            KFGRI.PerksAvailableData.bDemolitionistAvailable = false;
            KFGRI.PerksAvailableData.bFirebugAvailable = false;
            KFGRI.PerksAvailableData.bGunslingerAvailable = false;
            KFGRI.PerksAvailableData.bSharpshooterAvailable = false;
            KFGRI.PerksAvailableData.bSwatAvailable = false;
            KFGRI.PerksAvailableData.bSurvivalistAvailable = false;
            I = 0;
            J0x355:

            if(I < ActiveEvent.PerksAvailableList.Length)
            {
                if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Berserker')
                {
                    KFGRI.PerksAvailableData.bBerserkerAvailable = true;                    
                }
                else
                {
                    if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Commando')
                    {
                        KFGRI.PerksAvailableData.bCommandoAvailable = true;                        
                    }
                    else
                    {
                        if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Support')
                        {
                            KFGRI.PerksAvailableData.bSupportAvailable = true;                            
                        }
                        else
                        {
                            if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_FieldMedic')
                            {
                                KFGRI.PerksAvailableData.bFieldMedicAvailable = true;                                
                            }
                            else
                            {
                                if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Demolitionist')
                                {
                                    KFGRI.PerksAvailableData.bDemolitionistAvailable = true;                                    
                                }
                                else
                                {
                                    if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Firebug')
                                    {
                                        KFGRI.PerksAvailableData.bFirebugAvailable = true;                                        
                                    }
                                    else
                                    {
                                        if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Gunslinger')
                                        {
                                            KFGRI.PerksAvailableData.bGunslingerAvailable = true;                                            
                                        }
                                        else
                                        {
                                            if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Sharpshooter')
                                            {
                                                KFGRI.PerksAvailableData.bSharpshooterAvailable = true;                                                
                                            }
                                            else
                                            {
                                                if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_SWAT')
                                                {
                                                    KFGRI.PerksAvailableData.bSwatAvailable = true;                                                    
                                                }
                                                else
                                                {
                                                    if(ActiveEvent.PerksAvailableList[I] == Class'KFPerk_Survivalist')
                                                    {
                                                        KFGRI.PerksAvailableData.bSurvivalistAvailable = true;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                ++ I;
                goto J0x355;
            }
        }
        KFGRI.GameAmmoCostScale = ActiveEvent.GlobalAmmoCostScale;
        KFGRI.bAllowGrenadePurchase = !ActiveEvent.bDisableGrenades;
        KFGRI.bTradersEnabled = !ActiveEvent.bDisableTraders;
        KFGRI.MaxPerkLevel = ActiveEvent.MaxPerkLevel;
    }
}

function ModifyGroundSpeed(KFPawn PlayerPawn, out float GroundSpeed)
{
    local KFWeapon KFW;
    local KFInventoryManager KFIM;

    if(ActiveEvent.bBackupMeleeSprintSpeed)
    {
        KFW = KFWeapon(PlayerPawn.Weapon);
        if(KFW == none)
        {
            KFIM = KFInventoryManager(PlayerPawn.InvManager);
            if((KFIM != none) && KFIM.PendingWeapon != none)
            {
                KFW = KFWeapon(KFIM.PendingWeapon);
            }
        }
        if(((KFW != none) && KFW.IsMeleeWeapon()) && KFW.bIsBackupWeapon)
        {
            GroundSpeed = PlayerPawn.default.SprintSpeed;
        }
    }
}

function ReduceDamage(out int Damage, Pawn injured, Controller InstigatedBy, class<DamageType> DamageType, TraceHitInfo HitInfo)
{
    local int HitZoneIdx;
    local KFPawn InstigatorPawn;
    local StatAdjustments ToAdjust;

    if((ActiveEvent.bHeadshotsOnly && KFPawn_Monster(injured) != none) && ClassIsChildOf(DamageType, Class'KFDamageType'))
    {
        HitZoneIdx = KFPawn_Monster(injured).HitZones.Find('ZoneName', HitInfo.BoneName;
        if(HitZoneIdx != 0)
        {
            Damage = 0;
        }
    }
    if(InstigatedBy != none)
    {
        InstigatorPawn = KFPawn(InstigatedBy.Pawn);
        if(InstigatorPawn != none)
        {
            if((ActiveEvent.JumpDamageScale != 1) && InstigatorPawn.bJumping)
            {
                Damage *= ActiveEvent.JumpDamageScale;
            }
        }
    }
    foreach ActiveEvent.ZedsToAdjust(ToAdjust,)
    {
        if(injured.Class == ToAdjust.ClassToAdjust)
        {
            Damage *= ToAdjust.DamageTakenScale;
        }
        if((InstigatorPawn != none) && InstigatorPawn.Class == ToAdjust.ClassToAdjust)
        {
            Damage *= ToAdjust.DamageDealtScale;
        }        
    }    
}

function AdjustForBeefcakeRules(Pawn Pawn, optional KFOutbreakEvent.BeefcakeType Type)
{
    local float CurrentScale, PercentIncrease;
    local KFPawn_Monster KFP;
    local StatAdjustments StatAdjust;
    local float IntendedHeadScaling, OldHealthMax;

    Type = 0;
    KFP = KFPawn_Monster(Pawn);
    if(KFP != none)
    {
        foreach ActiveEvent.ZedsToAdjust(StatAdjust,)
        {
            if(Pawn.Class == StatAdjust.ClassToAdjust)
            {
                CurrentScale = KFP.IntendedBodyScale;
                CurrentScale += StatAdjust.BeefcakeScaleIncreases[Type];
                CurrentScale = FMin(CurrentScale, StatAdjust.MaxBeefcake);
                KFP.IntendedBodyScale = CurrentScale;
                if((StatAdjust.BeefcakeHealthIncreases[Type] > 0) && !KFP.IsABoss())
                {
                    PercentIncrease = StatAdjust.BeefcakeHealthIncreases[Type];
                    OldHealthMax = float(KFP.HealthMax);
                    KFP.HealthMax += int(float(KFP.default.Health) * PercentIncrease);
                    KFP.HealthMax = Min(int(float(KFP.default.Health) * StatAdjust.MaxBeefcakeHealth), KFP.HealthMax);
                    if(OldHealthMax < float(KFP.HealthMax))
                    {
                        KFP.Health += int(float(KFP.default.Health) * PercentIncrease);
                        KFP.Health = Min(KFP.Health, KFP.HealthMax);
                    }
                }
                IntendedHeadScaling = 1 / CurrentScale;
                KFP.IntendedHeadScale = IntendedHeadScaling;
                KFP.SetHeadScale(IntendedHeadScaling, KFP.CurrentHeadScale);
            }            
        }        
    }
}

function AdjustScoreDamage(Controller InstigatedBy, Pawn DamagedPawn, class<DamageType> DamageType)
{
    if(ActiveEvent.bScaleOnHealth)
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
    if(ActiveEvent.bScaleOnHealth)
    {
        if(MonsterPawn != none)
        {
            ScalePercent = ActiveEvent.StartingDamageSizeScale - ((ActiveEvent.StartingDamageSizeScale - ActiveEvent.DeadDamageSizeScale) * (float(1) - (float(CurrentHealth) / float(Pawn.HealthMax))));
            MonsterPawn.IntendedBodyScale = ScalePercent;            
        }
        else
        {
            if(HumanPawn != none)
            {
                if(CurrentHealth > 100)
                {
                    ScalePercent = ActiveEvent.StartingDamageSizeScale;                    
                }
                else
                {
                    ScalePercent = ActiveEvent.StartingDamageSizeScale - ((ActiveEvent.StartingDamageSizeScale - ActiveEvent.DeadDamageSizeScale) * (float(1) - (float(CurrentHealth) / 100)));
                }
                HumanPawn.IntendedBodyScale = ScalePercent;
            }
        }
    }
}

function AdjustMonsterDefaults(out KFPawn_Monster P)
{
    local StatAdjustments ToAdjust;

    if(P == none)
    {
        return;
    }
    P.IntendedHeadScale = ActiveEvent.ZedSpawnHeadScale;
    P.SetHeadScale(P.IntendedHeadScale, P.CurrentHeadScale);
    P.CrushScale = ActiveEvent.CrushScale;
    P.bDisableHeadless = ActiveEvent.bDisableHeadless;
    if(ActiveEvent.bUseZedDamageInflation)
    {
        P.bUseDamageInflation = true;
        P.ZeroHealthInflation = ActiveEvent.ZeroHealthInflation;
        P.DamageDeflationRate = ActiveEvent.GlobalDeflationRate;
        P.bDisableGoreMeshWhileAlive = true;
        P.InflationExplosionTimer = ActiveEvent.InflationExplosionTimer;
        P.InflateDeathGravity = ActiveEvent.InflationDeathGravity;
    }
    foreach ActiveEvent.ZedsToAdjust(ToAdjust,)
    {
        if(P.Class == ToAdjust.ClassToAdjust)
        {
            P.Health *= ToAdjust.HealthScale;
            P.HealthMax *= ToAdjust.HealthScale;
            P.HitZones[0].GoreHealth *= ToAdjust.HeadHealthScale;
            P.HitZones[0].MaxGoreHealth = P.HitZones[0].GoreHealth;
            P.SetShieldScale(ToAdjust.ShieldScale);
            P.HealByKill = ToAdjust.HealByKill;
            P.HealByAssistance = ToAdjust.HealByAssistance;
            P.InitialGroundSpeedModifier *= ToAdjust.InitialGroundSpeedModifierScale;
            if(ToAdjust.bStartEnraged)
            {
                if((KFAIController(P.Controller) == none) || !KFAIController(P.Controller).SpawnEnraged())
                {
                    P.SetEnraged(true);
                }
            }
            if(ToAdjust.bExplosiveDeath && ToAdjust.ExplosionTemplate != none)
            {
                P.bUseExplosiveDeath = true;
            }
            if(ActiveEvent.bUseZedDamageInflation && (ToAdjust.OverrideDeflationRate.X > 0) || ToAdjust.OverrideDeflationRate.Y > 0)
            {
                P.DamageDeflationRate = Lerp(ToAdjust.OverrideDeflationRate.X, ToAdjust.OverrideDeflationRate.Y, FMax(float(Outer.NumPlayers), 1) / float(Outer.MaxPlayers));
            }
            if(ToAdjust.AdditionalSubSpawns != none)
            {
                Outer.SpawnManager.SummonBossMinions(ToAdjust.AdditionalSubSpawns.Squads, int(Lerp(ToAdjust.AdditionalSubSpawnCount.X, ToAdjust.AdditionalSubSpawnCount.Y, FMax(float(Outer.NumPlayers), 1) / float(Outer.MaxPlayers))));
            }
        }        
    }    
}

function AdjustRestartedPlayer(out KFPawn_Human KFPH)
{
    local KFInventoryManager KFIM;

    if(KFPH != none)
    {
        KFPH.bAllowSprinting = ActiveEvent.bHumanSprintEnabled;
        KFPH.NumJumpsAllowed = ActiveEvent.NumJumpsAllowed;
        KFPH.IntendedHeadScale = ActiveEvent.PlayerSpawnHeadScale;
        KFPH.SetHeadScale(KFPH.IntendedHeadScale, KFPH.CurrentHeadScale);
        KFPH.bDisableTraderDialog = ActiveEvent.bDisableTraders;
        KFIM = KFInventoryManager(KFPH.InvManager);
        if(KFIM != none)
        {
            KFIM.OffPerkCostScale = ActiveEvent.OffPerkCostScale;
        }
    }
}

function OnScoreKill(Pawn KilledPawn);

function ApplyGlobalDamage()
{
    local KFPawn_Human Pawn;
    local class<DamageType> DamageType;

    DamageType = ((ActiveEvent.bGlobalDamageAffectsShield) ? Class'DmgType_Crushed' : Class'KFDT_Falling');
    foreach Outer.WorldInfo.AllPawns(Class'KFPawn_Human', Pawn)
    {
        Pawn.TakeDamage(int(Outer.OutbreakEvent.ActiveEvent.GlobalDamageTickAmount), none, Pawn.Location, vect(0, 0, 0), DamageType);        
    }    
}

function CacheWorldInfo()
{
    if(Outer.WorldInfo != none)
    {
        CachedItems.CachedGlobalGravityZ = Outer.WorldInfo.GlobalGravityZ;
        CachedItems.CachedWorldGravityZ = Outer.WorldInfo.WorldGravityZ;
    }
}

function SetWorldInfoOverrides()
{
    CacheWorldInfo();
    if(Outer.WorldInfo != none)
    {
        Outer.WorldInfo.GlobalGravityZ = Outer.OutbreakEvent.ActiveEvent.GlobalGravityZ;
        Outer.WorldInfo.WorldGravityZ = Outer.WorldInfo.GlobalGravityZ;
    }
}

function class<KFPawn_Monster> GetAISpawnOverrirde(KFAISpawnManager.EAIType AIType)
{
    local SpawnReplacement Replacement;
    local float RandF;

    foreach ActiveEvent.SpawnReplacementList(Replacement,)
    {
        if(Replacement.SpawnEntry == AIType)
        {
            if(Replacement.PercentChance < 1)
            {
                RandF = FRand();
                if(RandF > Replacement.PercentChance)
                {
                    continue;
                    goto J0x11A;
                }
            }
            if(Replacement.NewClass.Length > 0)
            {                
                return Replacement.NewClass[Rand(Replacement.NewClass.Length)];
            }
        }        
    }
    J0x11A:
    
    return Outer.AIClassList[AIType];
}

static function int GetOutbreakId(int SetEventsIndex);

defaultproperties
{
    ActiveEvent=(EventDifficulty=0,GameLength=0,bHeadshotsOnly=false,SpawnRateMultiplier=1,GlobalDamageTickRate=0,GlobalDamageTickAmount=0,GlobalAmmoCostScale=1,SpawnWeaponList=none,bSpawnWeaponListAffectsSecondaryWeapons=false,TraderWeaponList=none,bDisableGrenades=false,PerksAvailableList=none,bColliseumSkillConditionsActive=false,SpawnReplacementList=none,bAllowSpawnReplacementDuringBossWave=true,BossSpawnReplacementList=none,ZedsToAdjust=none,bDisableTraders=false,PickupResetTime=PickupResetTime.PRS_Wave,OverrideItemPickupModifier=-1,OverrideAmmoPickupModifier=-1,WaveItemPickupModifiers=none,WaveAmmoPickupModifiers=none,bUseOverrideItemRespawnTime=false,OverrideItemRespawnTime=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2),bUseOverrideAmmoRespawnTime=false,OverrideAmmoRespawnTime=(PlayersMod=1,PlayersMod[1]=1,PlayersMod[2]=1,PlayersMod[3]=1,PlayersMod[4]=1,PlayersMod[5]=1,ModCap=2),bPermanentZedTime=false,PermanentZedTimeCutoff=0,PermanentZedResetTime=1,OverrideZedTimeSlomoScale=0.2,ZedTimeRadius=0,ZedTimeBossRadius=0,ZedTimeHeight=0,bModifyZedTimeOnANearZedKill=false,ZedTimeOnANearZedKill=0.05,bScaleOnHealth=false,StartingDamageSizeScale=1,DeadDamageSizeScale=0.1,OverrideSpawnDerateTime=-1,OverrideTeleportDerateTime=-1,GlobalGravityZ=-1150,bUseBeefcakeRules=false,WaveAICountScale=none,ZedSpawnHeadScale=1,PlayerSpawnHeadScale=1,bHumanSprintEnabled=true,OffPerkCostScale=1,bBackupMeleeSprintSpeed=false,AdditionalBossWaveInfo=none,AdditionalBossWaveFrequency=0,AdditionalBossWaveStartDelay=15,AdditionalBossSpawnCount=(X=0,Y=0),bContinuousAdditionalBossWave=true,CrushScale=1,JumpDamageScale=1,NumJumpsAllowed=1,bUseZedDamageInflation=false,ZeroHealthInflation=1,GlobalDeflationRate=0.1,InflationDeathGravity=-0.1,InflationExplosionTimer=3,bDisableHeadless=false,MaxPerkLevel=4,MaxBoomsPerFrame=0,bHealAfterKill=false,bCannotBeHealed=false,bGlobalDamageAffectsShield=true,bApplyGlobalDamageBossWave=true,bHealPlayerAfterWave=false,DoshOnKillGlobalModifier=1,DamageDelayAfterWaveStarted=10,WeeklyOutbreakId=-1)
    CachedItems=(TraderItems=none,GameAmmoCostScale=1,bAllowGrenadePurchase=true,bTradersEnabled=true,MaxPerkLevel=0,CachedWorldGravityZ=0,CachedGlobalGravityZ=0,PerksAvailableData=(bPerksAvailableLimited=false,bBerserkerAvailable=false,bCommandoAvailable=false,bSupportAvailable=false,bFieldMedicAvailable=false,bDemolitionistAvailable=false,bFirebugAvailable=false,bGunslingerAvailable=false,bSharpshooterAvailable=false,bSwatAvailable=false,bSurvivalistAvailable=false))
}