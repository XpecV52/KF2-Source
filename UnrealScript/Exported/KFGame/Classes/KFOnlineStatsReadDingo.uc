//=============================================================================
// KFOnlineStatsReadDingo
//=============================================================================
// The KF 2 game stats class that holds and modifies the read stats data (XB1 only)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Brandon Johnson 1-4-17
//=============================================================================

class KFOnlineStatsReadDingo extends KFOnlineStatsRead;

defaultproperties
{
   ColumnIds(37)=4001
   ColumnIds(38)=4002
   ColumnIds(39)=4003
   ColumnIds(40)=4004
   ColumnIds(41)=4005
   ColumnIds(42)=4015
   ColumnIds(43)=4016
   ColumnIds(44)=4017
   ColumnIds(45)=4009
   ColumnIds(46)=4010
   ColumnIds(47)=4011
   ColumnIds(48)=4012
   ColumnIds(49)=4013
   ColumnIds(50)=4014
   ColumnIds(51)=4018
   ColumnIds(52)=4019
   ColumnIds(53)=4020
   ColumnIds(54)=4021
   ColumnIds(55)=4022
   ColumnIds(56)=4023
   ColumnIds(57)=4024
   ColumnIds(58)=4025
   ColumnIds(59)=4026
   ColumnIds(60)=4027
   ColumnIds(61)=4028
   ColumnIds(62)=4029
   ColumnIds(63)=4030
   ColumnIds(64)=4031
   ColumnIds(65)=4032
   ColumnIds(66)=4035
   ColumnIds(67)=4036
   ColumnIds(68)=4037
   ColumnIds(69)=4033
   ColumnIds(70)=4038
   ColumnMappings(37)=(Id=4001,Name="AchievementMrPerky5")
   ColumnMappings(38)=(Id=4002,Name="AchievementMrPerky10")
   ColumnMappings(39)=(Id=4003,Name="AchievementMrPerky15")
   ColumnMappings(40)=(Id=4004,Name="AchievementMrPerky20")
   ColumnMappings(41)=(Id=4005,Name="AchievementMrPerky25")
   ColumnMappings(42)=(Id=4015,Name="AchievementHardWins")
   ColumnMappings(43)=(Id=4016,Name="AchievementSuicidalWins")
   ColumnMappings(44)=(Id=4017,Name="AchievementHellWins")
   ColumnMappings(45)=(Id=4009,Name="AchievementVsZedWins")
   ColumnMappings(46)=(Id=4010,Name="AchievementVsHumanWins")
   ColumnMappings(47)=(Id=4011,Name="AchievementHoldOut")
   ColumnMappings(48)=(Id=4012,Name="AchievementDieVolter")
   ColumnMappings(49)=(Id=4013,Name="AchievementFleshpoundKills")
   ColumnMappings(50)=(Id=4014,Name="AchievementShrikeKills")
   ColumnMappings(51)=(Id=4018,Name="AchievementSirenKill")
   ColumnMappings(52)=(Id=4019,Name="AchievementBenefactor")
   ColumnMappings(53)=(Id=4020,Name="AchievementHealTeam")
   ColumnMappings(54)=(Id=4021,Name="AchievementCollectCatacolmbs")
   ColumnMappings(55)=(Id=4022,Name="AchievementBioticsCollectibles")
   ColumnMappings(56)=(Id=4023,Name="AchievementEvacsCollectibles")
   ColumnMappings(57)=(Id=4024,Name="AchievementOutpostCollectibles")
   ColumnMappings(58)=(Id=4025,Name="AchievementPrisonCollectibles")
   ColumnMappings(59)=(Id=4026,Name="AchievementManorCollectibles")
   ColumnMappings(60)=(Id=4027,Name="AchievementParisCollectibles")
   ColumnMappings(61)=(Id=4028,Name="AchievementFarmhouseCollectibles")
   ColumnMappings(62)=(Id=4029,Name="AchievementBlackForestCollectibles")
   ColumnMappings(63)=(Id=4030,Name="AchievementContainmentStationCollectibles")
   ColumnMappings(64)=(Id=4031,Name="AchievementInfernalRealmsCollectibles")
   ColumnMappings(65)=(Id=4032,Name="AchievementHostileGroundsCollectibles")
   ColumnMappings(66)=(Id=4035,Name="AchievementCollectZedLanding")
   ColumnMappings(67)=(Id=4036,Name="AchievementCollectDescent")
   ColumnMappings(68)=(Id=4037,Name="AchievementCollectNuked")
   ColumnMappings(69)=(Id=4033,Name="AchievementQuickOnTheTrigger")
   ColumnMappings(70)=(Id=4038,Name="AchievementCollectTragicKingdom")
   Name="Default__KFOnlineStatsReadDingo"
   ObjectArchetype=KFOnlineStatsRead'KFGame.Default__KFOnlineStatsRead'
}
