/*******************************************************************************
 * KFOnlineStatsRead generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFOnlineStatsRead extends OnlineStatsRead
    native;

const KFMAX_Perks = 10;
const VIEWID_KFGameStats = 1;
const STATID_None = 0;
const STATID_Cmdo_Progress = 1;
const STATID_Cmdo_Build = 2;
const STATID_Bsrk_Progress = 10;
const STATID_Bsrk_Build = 11;
const STATID_Sup_Progress = 20;
const STATID_Sup_Build = 21;
const STATID_Sup_WeldPoints = 22;
const STATID_Fire_Progress = 30;
const STATID_Fire_Build = 31;
const STATID_Medic_Progress = 40;
const STATID_Medic_Build = 41;
const STATID_Medic_HealPoints = 42;
const STATID_Shrp_Progress = 50;
const STATID_Shrp_Build = 51;
const STATID_Demo_Progress = 60;
const STATID_Demo_Build = 61;
const STATID_Surv_Progress = 70;
const STATID_Surv_Build = 71;
const STATID_Guns_Progress = 80;
const STATID_Guns_Build = 81;
const STATID_SWAT_Progress = 90;
const STATID_SWAT_Build = 91;
const STATID_Kills = 200;
const STATID_StalkerKills = 201;
const STATID_CrawlerKills = 202;
const STATID_FleshpoundKills = 203;
const STATID_SpecialEventProgress = 300;
const STATID_WeeklyEventProgress = 301;
const STATID_DailyEventInfo = 302;
const STATID_DailyEventIDs = 303;
const STATID_DailyEventStats1 = 304;
const STATID_DailyEventStats2 = 305;
const STATID_SpecialEventKills_DEPRECATED = 306;
const STATID_SeasonalEventStats1 = 307;
const STATID_SeasonalEventStats2 = 308;
const STATID_SeasonalEventStats3 = 309;
const STATID_SeasonalEventStats4 = 310;
const STATID_SeasonalEventStats5 = 311;
const STATID_DoshVaultTotal = 400;
const STATID_LastViewedDoshVaultTotal = 401;
const STATID_DoshVaultProgress = 402;
const STATID_DoshVaultRecovered = 403;
const STATID_AchievementPlaceholder = 500;
const STATID_AnalyticsPlaceholder = 800;
const STATID_PersonalBest_KnifeKills = 2000;
const STATID_PersonalBest_PistolKills = 2001;
const STATID_PersonalBest_HeadShots = 2002;
const STATID_PersonalBest_Healing = 2003;
const STATID_PersonalBest_Kills = 2004;
const STATID_PersonalBest_Assists = 2005;
const STATID_PersonalBest_LargeZedKill = 2006;
const STATID_PersonalBest_Dosh = 2007;
const STATID_MatchWins = 3000;
const STATID_DingoAchievementStart = 4000;
const STATID_ACHIEVE_MrPerky5 = 4001;
const STATID_ACHIEVE_MrPerky10 = 4002;
const STATID_ACHIEVE_MrPerky15 = 4003;
const STATID_ACHIEVE_MrPerky20 = 4004;
const STATID_ACHIEVE_MrPerky25 = 4005;
const STATID_ACHIEVE_HardWins = 4015;
const STATID_ACHIEVE_SuicidalWins = 4016;
const STATID_ACHIEVE_HellWins = 4017;
const STATID_ACHIEVE_VSZedWins = 4009;
const STATID_ACHIEVE_VSHumanWins = 4010;
const STATID_ACHIEVE_HoldOut = 4011;
const STATID_ACHIEVE_DieVolter = 4012;
const STATID_ACHIEVE_FleshPoundKill = 4013;
const STATID_ACHIEVE_ShrikeKill = 4014;
const STATID_ACHIEVE_SirenKill = 4018;
const STATID_ACHIEVE_Benefactor = 4019;
const STATID_ACHIEVE_HealTeam = 4020;
const STATID_ACHIEVE_QuickOnTheTrigger = 4033;
const STATID_ACHIEVE_CollectCatacolmbs = 4021;
const STATID_ACHIEVE_BioticsCollectibles = 4022;
const STATID_ACHIEVE_EvacsCollectibles = 4023;
const STATID_ACHIEVE_OutpostCollectibles = 4024;
const STATID_ACHIEVE_PrisonCollectibles = 4025;
const STATID_ACHIEVE_ManorCollectibles = 4026;
const STATID_ACHIEVE_ParisCollectibles = 4027;
const STATID_ACHIEVE_FarmhouseCollectibles = 4028;
const STATID_ACHIEVE_BlackForestCollectibles = 4029;
const STATID_ACHIEVE_ContainmentStationCollectibles = 4030;
const STATID_ACHIEVE_InfernalRealmCollectibles = 4031;
const STATID_ACHIEVE_HostileGroundsCollectibles = 4032;
const STATID_ACHIEVE_ZedLandingCollectibles = 4035;
const STATID_ACHIEVE_DescentCollectibles = 4036;
const STATID_ACHIEVE_NukedCollectibles = 4037;
const STATID_ACHIEVE_TragicKingdomCollectibles = 4038;
const STATID_ACHIEVE_NightmareCollectibles = 4039;
const STATID_ACHIEVE_KrampusCollectibles = 4040;
const STATID_ACHIEVE_ArenaCollectibles = 4041;
const STATID_ACHIEVE_PowercoreCollectibles = 4042;
const STATID_ACHIEVE_AirshipCollectibles = 4043;
const STATID_ACHIEVE_LockdownCollectibles = 4044;
const STATID_ACHIEVE_MonsterBallCollectibles = 4045;
const STATID_ACHIEVE_MonsterBallSecretRoom = 4046;
const STATID_ACHIEVE_SantasWorkshopCollectibles = 4047;
const STATID_ACHIEVE_ShoppingSpreeCollectibles = 4048;
const STATID_ACHIEVE_SpillwayCollectibles = 4049;
const STATID_ACHIEVE_SteamFortressCollectibles = 4050;
const STATID_ACHIEVE_AsylumCollectibles = 4051;
const STATID_ACHIEVE_SanitariumCollectibles = 4052;
const STATID_ACHIEVE_DefeatMatriarch = 4053;
const STATID_ACHIEVE_BiolapseCollectibles = 4054;
const STATID_ACHIEVE_DesolationCollectibles = 4055;
const STATID_ACHIEVE_HellmarkStationCollectibles = 4056;
const STATID_ACHIEVE_ElysiumEndlessWaveFifteen = 4057;

var KFOnlineStatsWrite LinkedWriteObject;
var UniqueNetId OwningUniqueID;
var Engine.OnlineSubsystem.EOnlineEnumerationReadState UserStatsReceivedState;
var bool bLogStatsRead;

function OnStatsInitialized(bool bWasSuccessful)
{
    if(!bWasSuccessful)
    {
        WarnInternal("##########################################################################");
        WarnInternal("KFOnlineStatsRead: Unable to get Steam statistics.  Stats will not be set!");
        WarnInternal("##########################################################################");        
    }
    else
    {
        OnReadComplete();
    }
}

// Export UKFOnlineStatsRead::execNativeOnReadComplete(FFrame&, void* const)
native function NativeOnReadComplete();

function OnInventoryReadComplete_Steamworks()
{
    Class'GameEngine'.static.GetOnlineSubsystem().ClearOnInventoryReadCompleteDelegate(OnInventoryReadComplete_Steamworks);
    LinkedWriteObject.CheckPerkPSGRewards(none);
}

function OnInventoryReadComplete_Playfab(bool bWasSuccessful)
{
    Class'GameEngine'.static.GetPlayfabInterface().ClearInventoryReadCompleteDelegate(OnInventoryReadComplete_Playfab);
    if(bWasSuccessful)
    {
        LinkedWriteObject.CheckPerkPSGRewards(none);
    }
}

event OnReadComplete()
{
    NativeOnReadComplete();
    if(bLogStatsRead)
    {
        LogInternal(((("KFOnlineStatsRead: OnReadComplete called, Rows[0].Columns.Length=" $ string(Rows[0].Columns.Length)) @ "self:'") $ string(self)) $ "'", 'DevOnline');
    }
    if(Class'WorldInfo'.static.IsConsoleBuild() || Class'WorldInfo'.static.IsEOSBuild())
    {
        if(Class'GameEngine'.static.GetOnlineSubsystem().CurrentInventory.Length == 0)
        {
            Class'GameEngine'.static.GetPlayfabInterface().AddInventoryReadCompleteDelegate(OnInventoryReadComplete_Playfab);            
        }
        else
        {
            LinkedWriteObject.CheckPerkPSGRewards(none);
        }        
    }
    else
    {
        if(!Class'GameEngine'.static.GetOnlineSubsystem().bInventoryReady)
        {
            Class'GameEngine'.static.GetOnlineSubsystem().AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete_Steamworks);            
        }
        else
        {
            LinkedWriteObject.CheckPerkPSGRewards(none);
        }
    }
}

defaultproperties
{
    ViewId=1
    ColumnIds=/* Array type was not detected. */
    ColumnMappings=/* Array type was not detected. */
}