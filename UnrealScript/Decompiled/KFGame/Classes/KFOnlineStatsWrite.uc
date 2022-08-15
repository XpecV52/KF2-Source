/*******************************************************************************
 * KFOnlineStatsWrite generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFOnlineStatsWrite extends OnlineStatsWrite
    native
    config(Game);

const WeldingPointsRequired = 510;
const HealingPointsRequired = 20;
const MaxPerkLevel = 25;
const MaxPrestigeLevel = 10;
const KFACHID_ParisNormal = 0;
const KFACHID_ParisHard = 1;
const KFACHID_ParisSuicidal = 2;
const KFACHID_ParisHellOnEarth = 3;
const KFACHID_OutpostNormal = 4;
const KFACHID_OutpostHard = 5;
const KFACHID_OutpostSuicidal = 6;
const KFACHID_OutpostHellOnEarth = 7;
const KFACHID_BioticsNormal = 8;
const KFACHID_BioticsHard = 9;
const KFACHID_BioticsSuicidal = 10;
const KFACHID_BioticsHellOnEarth = 11;
const KFACHID_ManorNormal = 12;
const KFACHID_ManorHard = 13;
const KFACHID_ManorSuicidal = 14;
const KFACHID_ManorHellOnEarth = 15;
const KFACHID_ParisCollectibles = 16;
const KFACHID_OutpostCollectibles = 17;
const KFACHID_BioticsCollectibles = 18;
const KFACHID_ManorCollectibles = 19;
const KFACHID_EvacNormal = 20;
const KFACHID_EvacHard = 21;
const KFACHID_EvacSuicidal = 22;
const KFACHID_EvacHellOnEarth = 23;
const KFACHID_CatacombsNormal = 24;
const KFACHID_CatacombsHard = 25;
const KFACHID_CatacombsSuicidal = 26;
const KFACHID_CatacombsHellOnEarth = 27;
const KFACHID_EvacsCollectibles = 28;
const KFACHID_CatacombsCollectibles = 29;

var KFPlayerController MyKFPC;
var private int Kills;
var private int StalkerKills;
var private int CrawlerKills;
var private int FleshPoundKills;
var private int WeldingPoints;
var private int HealingPoints;
var private int CommandoXP;
var private int CommandoLVL;
var private int CommandoPSG;
var private int CommandoBuild;
var private int BerserkerXP;
var private int BerserkerLVL;
var private int BerserkerPSG;
var private int BerserkerBuild;
var private int SupportXP;
var private int SupportLVL;
var private int SupportPSG;
var private int SupportBuild;
var private int MedicXP;
var private int MedicLVL;
var private int MedicPSG;
var private int MedicBuild;
var private int FirebugXP;
var private int FirebugLVL;
var private int FirebugPSG;
var private int FirebugBuild;
var private int DemoXP;
var private int DemoLVL;
var private int DemoPSG;
var private int DemoBuild;
var private int PersonalBest_KnifeKills;
var private int PersonalBest_PistolKills;
var private int PersonalBest_HeadShots;
var private int PersonalBest_Healing;
var private int PersonalBest_Kills;
var private int PersonalBest_Assists;
var private int PersonalBest_LargeZedKil;
var private int PersonalBest_Dosh;
var int PerRoundWeldXP;
var int PerRoundHealXP;
var array<AchievementDetails> Achievements;
var const int XPTable[25];
var config bool bAllowPerkCheats;
var private const bool bDisabled;
var bool bLogStatsWrite;

// Export UKFOnlineStatsWrite::execIncrementIntStat(FFrame&, void* const)
native function IncrementIntStat(int StatId, optional int IncBy)
{
    IncBy = 1;                
}

// Export UKFOnlineStatsWrite::execIncrementFloatStat(FFrame&, void* const)
native function IncrementFloatStat(int StatId, optional float IncBy)
{
    IncBy = 1;                
}

// Export UKFOnlineStatsWrite::execSetIntStat(FFrame&, void* const)
native function SetIntStat(int StatId, int Value);

// Export UKFOnlineStatsWrite::execSetFloatStat(FFrame&, void* const)
native function SetFloatStat(int StatId, float Value);

// Export UKFOnlineStatsWrite::execHasCheated(FFrame&, void* const)
native final function bool HasCheated();

// Export UKFOnlineStatsWrite::execNotifyCheats(FFrame&, void* const)
native final function NotifyCheats(optional bool bSaveToConfig);

// Export UKFOnlineStatsWrite::execLogSubsystemIntStat(FFrame&, void* const)
private native final function int LogSubsystemIntStat(int StatId);

simulated function LogStats()
{
    LogInternal("###############################################################");
    LogInternal("CACHED VALUES:");
    LogInternal((("CommandoXP, CommandoLVL " @ "    =") @ string(CommandoXP)) @ string(CommandoLVL));
    LogInternal((("BerserkerXP, BerserkerLVL " @ "  =") @ string(BerserkerXP)) @ string(BerserkerLVL));
    LogInternal((("SupportXP, SupportLVL " @ "      =") @ string(SupportXP)) @ string(SupportLVL));
    LogInternal((("MedicXP, MedicLVL " @ "          =") @ string(MedicXP)) @ string(MedicLVL));
    LogInternal("---------------------------------------------------------------");
    LogInternal("STEAM VALUES:");
    LogInternal((("CommandoXP, CommandoLVL " @ "    =") @ string(GetXPFromProgress(LogSubsystemIntStat(1)))) @ string(GetLVLFromProgress(LogSubsystemIntStat(1))));
    LogInternal((("BerserkerXP, BerserkerLVL " @ "  =") @ string(GetXPFromProgress(LogSubsystemIntStat(10)))) @ string(GetLVLFromProgress(LogSubsystemIntStat(10))));
    LogInternal((("SupportXP, SupportLVL " @ "      =") @ string(GetXPFromProgress(LogSubsystemIntStat(20)))) @ string(GetLVLFromProgress(LogSubsystemIntStat(20))));
    LogInternal((("MedicXP, MedicLVL " @ "          =") @ string(GetXPFromProgress(LogSubsystemIntStat(40)))) @ string(GetLVLFromProgress(LogSubsystemIntStat(40))));
    LogInternal(" ");
    LogInternal(("CommandoProgress " @ "           =") @ string(LogSubsystemIntStat(1)));
    LogInternal(("BerserkerProgress " @ "          =") @ string(LogSubsystemIntStat(10)));
    LogInternal(("SupportProgress " @ "            =") @ string(LogSubsystemIntStat(20)));
    LogInternal(("MedicProgress " @ "              =") @ string(LogSubsystemIntStat(40)));
    LogInternal("###############################################################");
}

event CacheStatsValue(int StatId, float Value)
{
    switch(StatId)
    {
        case 1:
            CommandoXP = GetXPFromProgress(int(Value));
            CommandoLVL = GetLVLFromProgress(int(Value));
            CommandoPSG = GetPSGFromProgress(int(Value));
            if(bLogStatsWrite)
            {
                LogInternal(((((string(GetFuncName()) @ "CommandoXP:") @ string(CommandoXP)) @ string(CommandoLVL)) @ "VALUE:") @ string(Round(Value)));
            }
            break;
        case 2:
            CommandoBuild = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "CommandoBuild:") @ string(CommandoBuild));
            }
            break;
        case 10:
            BerserkerXP = GetXPFromProgress(int(Value));
            BerserkerLVL = GetLVLFromProgress(int(Value));
            BerserkerPSG = GetPSGFromProgress(int(Value));
            if(bLogStatsWrite)
            {
                LogInternal(((((string(GetFuncName()) @ "BerserkerXP:") @ string(BerserkerXP)) @ string(BerserkerLVL)) @ "VALUE:") @ string(Round(Value)));
            }
            break;
        case 11:
            BerserkerBuild = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "BerserkerBuild:") @ string(BerserkerBuild));
            }
            break;
        case 20:
            SupportXP = GetXPFromProgress(int(Value));
            SupportLVL = GetLVLFromProgress(int(Value));
            SupportPSG = GetPSGFromProgress(int(Value));
            if(bLogStatsWrite)
            {
                LogInternal(((((string(GetFuncName()) @ "SupportXP:") @ string(SupportXP)) @ string(SupportLVL)) @ "VALUE:") @ string(Round(Value)));
            }
            break;
        case 21:
            SupportBuild = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "SupportBuild:") @ string(SupportBuild));
            }
            break;
        case 40:
            MedicXP = GetXPFromProgress(int(Value));
            MedicLVL = GetLVLFromProgress(int(Value));
            MedicPSG = GetPSGFromProgress(int(Value));
            if(bLogStatsWrite)
            {
                LogInternal(((((string(GetFuncName()) @ "MedicXP:") @ string(MedicXP)) @ string(MedicLVL)) @ "VALUE:") @ string(Round(Value)));
            }
            break;
        case 41:
            MedicBuild = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "MedicBuild:") @ string(MedicBuild));
            }
            break;
        case 30:
            FirebugXP = GetXPFromProgress(int(Value));
            FirebugLVL = GetLVLFromProgress(int(Value));
            FirebugPSG = GetPSGFromProgress(int(Value));
            if(bLogStatsWrite)
            {
                LogInternal(((((string(GetFuncName()) @ "FirebugXP:") @ string(FirebugXP)) @ string(FirebugLVL)) @ "VALUE:") @ string(Round(Value)));
            }
            break;
        case 31:
            FirebugBuild = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "FirebugBuild:") @ string(FirebugBuild));
            }
            break;
        case 60:
            DemoXP = GetXPFromProgress(int(Value));
            DemoLVL = GetLVLFromProgress(int(Value));
            DemoPSG = GetPSGFromProgress(int(Value));
            if(bLogStatsWrite)
            {
                LogInternal(((((string(GetFuncName()) @ "DemoXP:") @ string(DemoXP)) @ string(DemoLVL)) @ "VALUE:") @ string(Round(Value)));
            }
            break;
        case 61:
            DemoBuild = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "DemoBuild:") @ string(DemoBuild));
            }
            break;
        case 200:
            Kills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "Kills:") @ string(Kills));
            }
            break;
        case 201:
            StalkerKills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "Stalker Kills:") @ string(StalkerKills));
            }
            break;
        case 22:
            WeldingPoints = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "Welding points:") @ string(WeldingPoints));
            }
            break;
        case 42:
            HealingPoints = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "Healing points:") @ string(HealingPoints));
            }
            break;
        case 202:
            CrawlerKills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "Crawler kills:") @ string(CrawlerKills));
            }
            break;
        case 203:
            FleshPoundKills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "Fleshpound kills:") @ string(FleshPoundKills));
            }
            break;
        case 2000:
            PersonalBest_KnifeKills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_KnifeKills:") @ string(PersonalBest_KnifeKills));
            }
            break;
        case 2001:
            PersonalBest_PistolKills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_PistolKills:") @ string(PersonalBest_PistolKills));
            }
            break;
        case 2002:
            PersonalBest_HeadShots = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_HeadShots:") @ string(PersonalBest_HeadShots));
            }
            break;
        case 2003:
            PersonalBest_Healing = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_Healing:") @ string(PersonalBest_Healing));
            }
            break;
        case 2004:
            PersonalBest_Kills = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_Kills:") @ string(PersonalBest_Kills));
            }
            break;
        case 2005:
            PersonalBest_Assists = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_Assists:") @ string(PersonalBest_Assists));
            }
            break;
        case 2006:
            PersonalBest_LargeZedKil = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_LargeZedKil:") @ string(PersonalBest_LargeZedKil));
            }
            break;
        case 2007:
            PersonalBest_Dosh = int(Value);
            if(bLogStatsWrite)
            {
                LogInternal((string(GetFuncName()) @ "PersonalBest_Dosh:") @ string(PersonalBest_Dosh));
            }
            break;
        default:
            break;
    }
}

private final event GetPerkBuildFromStats(class<KFPerk> PerkClass, out int Build)
{
    switch(PerkClass)
    {
        case Class'KFPerk_Commando':
            Build = CommandoBuild;
            break;
        case Class'KFPerk_Berserker':
            Build = BerserkerBuild;
            break;
        case Class'KFPerk_Support':
            Build = SupportBuild;
            break;
        case Class'KFPerk_FieldMedic':
            Build = MedicBuild;
            break;
        case Class'KFPerk_Firebug':
            Build = FirebugBuild;
            break;
        case Class'KFPerk_Demolitionist':
            Build = DemoBuild;
            break;
        default:
            break;
    }
}

private final event SaveBuildToStats(class<KFPerk> InPerk, int Build)
{
    local int StatId;

    StatId = InPerk.static.GetPerkBuildStatID();
    SetIntStat(StatId, Build);
    CacheStatsValue(StatId, float(Build));
    if(bLogStatsWrite)
    {
        LogInternal((((string(GetFuncName()) @ "Saving build for perk:") @ string(InPerk)) @ "Build:") @ string(Build));
    }
}

// Export UKFOnlineStatsWrite::execGetPerkLevel(FFrame&, void* const)
native final function int GetPerkLevel(class<KFPerk> Perk);

// Export UKFOnlineStatsWrite::execGetPerkBuild(FFrame&, void* const)
native final function int GetPerkBuild(class<KFPerk> Perk);

// Export UKFOnlineStatsWrite::execGetXPNeededAt(FFrame&, void* const)
native static final function int GetXPNeededAt(int Level);

// Export UKFOnlineStatsWrite::execIncrementXPStat(FFrame&, void* const)
private native final function IncrementXPStat(class<KFPerk> PerkClass, optional int IncBy)
{
    IncBy = 1;                
}

// Export UKFOnlineStatsWrite::execGetXPFromProgress(FFrame&, void* const)
private native final function int GetXPFromProgress(int PerkProgress);

// Export UKFOnlineStatsWrite::execGetLVLFromProgress(FFrame&, void* const)
private native final function int GetLVLFromProgress(int PerkProgress);

// Export UKFOnlineStatsWrite::execGetPSGFromProgress(FFrame&, void* const)
private native final function int GetPSGFromProgress(int PerkProgress);

private final event AddXP(class<KFPerk> PerkClass, int dXP)
{
    if(PerkClass == none)
    {
        return;
    }
    IncrementXPStat(PerkClass, dXP);
    if(MyKFPC != none)
    {
        MyKFPC.NotifyXPGain(PerkClass, dXP);
    }
    if(bLogStatsWrite)
    {
        LogInternal((("AddXP Perk:" $ string(PerkClass)) @ "dXP:") $ string(dXP));
    }
}

private final event NotifyLevelUp(class<KFPerk> PerkClass, int NewLVL)
{
    if(MyKFPC != none)
    {
        MyKFPC.NotifyLevelUp(PerkClass, byte(NewLVL));
        if(bLogStatsWrite)
        {
            LogInternal((((string(GetFuncName()) @ "PerkClass:") @ string(PerkClass)) @ "New LVL:") @ string(NewLVL));
        }
    }
}

private final event int GetPerkXP(int StatId)
{
    switch(StatId)
    {
        case 1:
            return CommandoXP;
        case 10:
            return BerserkerXP;
        case 20:
            return SupportXP;
        case 40:
            return MedicXP;
        case 30:
            return FirebugXP;
        case 60:
            return DemoXP;
        default:
            return 0;
            break;
    }
}

private final event int GetPerkLVLInternal(int StatId)
{
    switch(StatId)
    {
        case 1:
            return CommandoLVL;
        case 10:
            return BerserkerLVL;
        case 20:
            return SupportLVL;
        case 40:
            return MedicLVL;
        case 30:
            return FirebugLVL;
        case 60:
            return DemoLVL;
        default:
            return 0;
            break;
    }
}

private final event int GetPerkPSG(int StatId)
{
    switch(StatId)
    {
        case 1:
            return CommandoPSG;
        case 10:
            return BerserkerPSG;
        case 20:
            return SupportPSG;
        case 40:
            return MedicPSG;
        case 30:
            return FirebugPSG;
        case 60:
            return DemoPSG;
        default:
            return 0;
            break;
    }
}

private final event int GetPerkLVLByClass(class<KFPerk> PerkClass)
{
    local int StatId;

    StatId = PerkClass.static.GetProgressStatID();
    return GetPerkLVLInternal(StatId);
}

function int GetPersonalBest(EphemeralMatchStats.EPersonalBests PersonalBestID)
{
    switch(PersonalBestID)
    {
        case 0:
            return PersonalBest_KnifeKills;
        case 1:
            return PersonalBest_PistolKills;
        case 2:
            return PersonalBest_HeadShots;
        case 3:
            return PersonalBest_Healing;
        case 4:
            return PersonalBest_Kills;
        case 5:
            return PersonalBest_Assists;
        case 6:
            return PersonalBest_LargeZedKil;
        case 7:
            return PersonalBest_Dosh;
        default:
            return 0;
            break;
    }
}

function SavePersonalBest(EphemeralMatchStats.EPersonalBests PersonalBestID, int Value)
{
    switch(PersonalBestID)
    {
        case 0:
            SetIntStat(2000, Value);
            break;
        case 1:
            SetIntStat(2001, Value);
            break;
        case 2:
            SetIntStat(2002, Value);
            break;
        case 3:
            SetIntStat(2003, Value);
            break;
        case 4:
            SetIntStat(2004, Value);
            break;
        case 5:
            SetIntStat(2005, Value);
            break;
        case 6:
            SetIntStat(2006, Value);
            break;
        case 7:
            SetIntStat(2007, Value);
            break;
        default:
            break;
    }
}

private final event AddToKills(class<KFPawn_Monster> MonsterClass, byte Difficulty, class<DamageType> DT)
{
    IncrementIntStat(200, 1);
    ++ Kills;
    if(IsStalkerKill(MonsterClass, DT))
    {
        AddStalkerKill(Difficulty);        
    }
    else
    {
        if(IsCrawlerKill(MonsterClass, DT))
        {
            AddCrawlerKill(Difficulty);            
        }
        else
        {
            if(IsFleshPoundKill(MonsterClass, DT))
            {
                AddFleshpoundKill(Difficulty);
            }
        }
    }
    if((MyKFPC != none) && MyKFPC.MatchStats != none)
    {
        MyKFPC.MatchStats.RecordZedKill(MonsterClass, DT);
    }
}

private final function AddStalkerKill(byte Difficulty)
{
    ++ StalkerKills;
    IncrementIntStat(201, 1);
    AddXP(Class'KFPerk_Commando', Class'KFPerk_Commando'.static.GetStalkerKillXP(Difficulty));
    if(bLogStatsWrite)
    {
        LogInternal((string(GetFuncName()) @ "Adding stalker kill, IncrementIntStat STATID_StalkerKills by:") @ string(Class'KFPerk_Commando'.static.GetStalkerKillXP(Difficulty)));
    }
    if(((MyKFPC != none) && MyKFPC.MatchStats != none) && Class'KFPerk_Commando' != none)
    {
        MyKFPC.MatchStats.RecordSecondaryXPGain(Class'KFPerk_Commando', Class'KFPerk_Commando'.static.GetStalkerKillXP(Difficulty));
    }
}

private final function AddCrawlerKill(byte Difficulty)
{
    ++ CrawlerKills;
    IncrementIntStat(202, 1);
    AddXP(Class'KFPerk_Firebug', Class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty));
    if(bLogStatsWrite)
    {
        LogInternal((string(GetFuncName()) @ "Adding crawler kill, IncrementIntStat STATID_CrawlerKills by:") @ string(Class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty)));
    }
    if(((MyKFPC != none) && MyKFPC.MatchStats != none) && Class'KFPerk_Firebug' != none)
    {
        MyKFPC.MatchStats.RecordSecondaryXPGain(Class'KFPerk_Firebug', Class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty));
    }
}

private final function AddFleshpoundKill(byte Difficulty)
{
    ++ FleshPoundKills;
    IncrementIntStat(203, 1);
    AddXP(Class'KFPerk_Demolitionist', Class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP(Difficulty));
    if(bLogStatsWrite)
    {
        LogInternal((string(GetFuncName()) @ "Adding crawler kill, IncrementIntStat STATID_CrawlerKills by:") @ string(Class'KFPerk_Firebug'.static.GetCrawlerKillXP(Difficulty)));
    }
    if(((MyKFPC != none) && MyKFPC.MatchStats != none) && Class'KFPerk_Demolitionist' != none)
    {
        MyKFPC.MatchStats.RecordSecondaryXPGain(Class'KFPerk_Demolitionist', Class'KFPerk_Demolitionist'.static.GetFleshpoundKillXP(Difficulty));
    }
}

private final function bool IsCrawlerKill(class<KFPawn_Monster> MonsterClass, class<DamageType> DT)
{
    return MonsterClass.static.IsCrawlerClass() && Class'KFPerk'.static.IsDamageTypeOnThisPerk(class<KFDamageType>(DT), Class'KFPerk_Firebug'.static.GetPerkClass());
}

private final function bool IsStalkerKill(class<KFPawn_Monster> MonsterClass, class<DamageType> DT)
{
    return MonsterClass.static.IsStalkerClass() && Class'KFPerk'.static.IsDamageTypeOnThisPerk(class<KFDamageType>(DT), Class'KFPerk_Commando'.static.GetPerkClass());
}

private final function bool IsFleshPoundKill(class<KFPawn_Monster> MonsterClass, class<DamageType> DT)
{
    return MonsterClass.static.IsFleshpoundClass() && Class'KFPerk'.static.IsDamageTypeOnThisPerk(class<KFDamageType>(DT), Class'KFPerk_Demolitionist'.static.GetPerkClass());
}

private final event AddSmallRadiusKill(byte Difficulty)
{
    AddXP(Class'KFPerk_Berserker', Class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty));
    if(((MyKFPC != none) && MyKFPC.MatchStats != none) && Class'KFPerk_Berserker' != none)
    {
        MyKFPC.MatchStats.RecordSecondaryXPGain(Class'KFPerk_Berserker', Class'KFPerk_Berserker'.static.GetSmallRadiusKillXP(Difficulty));
    }
}

private final function int ComputeWeldingXP(int Points)
{
    local int XPEarned;
    local KFGameReplicationInfo KFGRI;

    XPEarned = FFloor(float(Points) / float(510));
    if(XPEarned >= 1)
    {
        KFGRI = KFGameReplicationInfo(MyKFPC.WorldInfo.GRI);
        Class'KFPerk_Support'.static.MultiplySecondaryXPPoints(XPEarned, KFGRI.GameDifficulty);
    }
    return XPEarned;
}

private final event int AddWeldingPoints(int PointsWelded)
{
    local int XPEarned;

    WeldingPoints += PointsWelded;
    if(bLogStatsWrite)
    {
        LogInternal((string(GetFuncName()) @ "WeldingPoints are now:") @ string(WeldingPoints));
    }
    XPEarned = ComputeWeldingXP(WeldingPoints);
    if(XPEarned >= 1)
    {
        AddXP(Class'KFPerk_Support', XPEarned);
        if(((MyKFPC != none) && MyKFPC.MatchStats != none) && Class'KFPerk_Support' != none)
        {
            MyKFPC.MatchStats.RecordSecondaryXPGain(Class'KFPerk_Support', XPEarned);
        }
        PerRoundWeldXP += XPEarned;
        WeldingPoints = WeldingPoints % 510;
        if(bLogStatsWrite)
        {
            LogInternal((string(GetFuncName()) @ "Welding XP earned :") @ string(XPEarned));
        }
    }
    SetIntStat(22, WeldingPoints);
    return XPEarned;
}

private final function int ComputeHealingXP(int Points)
{
    local int XPEarned;
    local KFGameReplicationInfo KFGRI;

    XPEarned = FFloor(float(Points) / float(20));
    if(XPEarned >= 1)
    {
        KFGRI = KFGameReplicationInfo(MyKFPC.WorldInfo.GRI);
        Class'KFPerk_FieldMedic'.static.MultiplySecondaryXPPoints(XPEarned, KFGRI.GameDifficulty);
    }
    return XPEarned;
}

private final event int AddHealingPoints(int PointsHealed)
{
    local int XPEarned;

    HealingPoints += PointsHealed;
    if(bLogStatsWrite)
    {
        LogInternal((string(GetFuncName()) @ "HealingPoints are now:") @ string(20));
    }
    XPEarned = ComputeHealingXP(HealingPoints);
    if(XPEarned >= 1)
    {
        AddXP(Class'KFPerk_FieldMedic', XPEarned);
        if(((MyKFPC != none) && MyKFPC.MatchStats != none) && Class'KFPerk_FieldMedic' != none)
        {
            MyKFPC.MatchStats.RecordSecondaryXPGain(Class'KFPerk_FieldMedic', XPEarned);
        }
        PerRoundHealXP += XPEarned;
        HealingPoints = HealingPoints % 20;
        if(bLogStatsWrite)
        {
            LogInternal((string(GetFuncName()) @ "Healing XP earned :") @ string(XPEarned));
        }
    }
    SetIntStat(42, HealingPoints);
    return XPEarned;
}

function GetAchievements()
{
    if(MyKFPC.IsLocalPlayerController())
    {
        Achievements.Remove(0, Achievements.Length;
        MyKFPC.OnlineSub.PlayerInterface.GetAchievements(0, Achievements);
    }
}

function bool IsAchievementUnlocked(int AchievementIndex)
{
    return (AchievementIndex < Achievements.Length) && Achievements[AchievementIndex].bWasAchievedOnline;
}

function OnUnlockAchievement(int AchievementIndex)
{
    GetAchievements();
}

// Export UKFOnlineStatsWrite::execOnGameWon(FFrame&, void* const)
native final function OnGameWon(string MapName, byte Difficulty, byte GameLength, byte bCoop);

// Export UKFOnlineStatsWrite::execCheckMapEndAchievements(FFrame&, void* const)
native final function CheckMapEndAchievements(string MapName, byte Difficulty, byte bCoop);

defaultproperties
{
    XPTable[0]=2640
    XPTable[1]=2917
    XPTable[2]=3224
    XPTable[3]=3562
    XPTable[4]=3936
    XPTable[5]=4349
    XPTable[6]=4806
    XPTable[7]=5311
    XPTable[8]=5868
    XPTable[9]=6484
    XPTable[10]=7165
    XPTable[11]=7918
    XPTable[12]=8749
    XPTable[13]=9667
    XPTable[14]=10683
    XPTable[15]=11804
    XPTable[16]=13044
    XPTable[17]=14413
    XPTable[18]=15927
    XPTable[19]=17599
    XPTable[20]=19447
    XPTable[21]=21489
    XPTable[22]=23745
    XPTable[23]=26238
    XPTable[24]=28993
    Properties=/* Array type was not detected. */
    ViewIds=/* Array type was not detected. */
}