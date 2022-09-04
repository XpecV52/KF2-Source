class KFTraderVoiceGroup_Objective extends KFTraderVoiceGroupBase;









































































































































































































































































































































































































































































































































































































































#linenumber 3

defaultproperties
{
   DialogEvents(0)=(AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COM_20ZedDead',Priority=1,Chance=0.300000)
   DialogEvents(1)=(EventID=1,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COM_80ZedDead',Priority=1,Chance=0.300000)
   DialogEvents(2)=(EventID=2,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COM_LastZedDead',Priority=1)
   DialogEvents(4)=(EventID=4,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_PlayerArrives',Chance=0.300000)
   DialogEvents(5)=(EventID=5,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_TooExp')
   DialogEvents(6)=(EventID=6,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_TooHeavy')
   DialogEvents(7)=(EventID=7,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_30Seconds',Chance=0.400000)
   DialogEvents(8)=(EventID=8,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_10Seconds')
   DialogEvents(9)=(EventID=9,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_LastShop')
   DialogEvents(10)=(EventID=10,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_LongRun',Priority=1,Cooldown=10.000000)
   DialogEvents(11)=(EventID=11,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_NoArmor',Priority=1)
   DialogEvents(12)=(EventID=12,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_LowArmor',Priority=1)
   DialogEvents(13)=(EventID=13,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_LowAmmo',Priority=1)
   DialogEvents(14)=(EventID=14,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_NoNades',Priority=1)
   DialogEvents(15)=(EventID=15,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_Heal',Priority=1,Cooldown=10.000000,Chance=0.250000)
   DialogEvents(16)=(EventID=16,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_TeamHeal',Priority=1,Cooldown=10.000000,Chance=0.250000)
   DialogEvents(17)=(EventID=17,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_SHOP_RichBastard',Priority=1)
   DialogEvents(18)=(EventID=18,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_GoodHealing',Priority=1)
   DialogEvents(19)=(EventID=19,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_SoleSruv',Priority=1)
   DialogEvents(20)=(EventID=20,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_Died',Priority=1)
   DialogEvents(21)=(EventID=21,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_KillMost',Priority=1)
   DialogEvents(22)=(EventID=22,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_TeamPLayer',Priority=1)
   DialogEvents(23)=(EventID=23,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_SurvRounds',Priority=1)
   DialogEvents(24)=(EventID=24,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_DiedRounds',Priority=1)
   DialogEvents(25)=(EventID=25,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_NooneDied',Priority=1)
   DialogEvents(26)=(EventID=26,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_NoDamage',Priority=1)
   DialogEvents(27)=(EventID=27,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_SomeDied',Priority=1)
   DialogEvents(28)=(EventID=28,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_50Better',Priority=1,Chance=0.500000)
   DialogEvents(29)=(EventID=29,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_LotDamage',Priority=1)
   DialogEvents(30)=(EventID=30,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_LotDamLotHeal',Priority=1)
   DialogEvents(31)=(EventID=31,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_MostDosh',Priority=1)
   DialogEvents(32)=(EventID=32,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_KillFP',Priority=1)
   DialogEvents(33)=(EventID=33,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_KillScrake',Priority=1)
   DialogEvents(34)=(EventID=34,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_POST_LowDosh',Priority=1)
   DialogEvents(35)=(EventID=35,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_ClotA',Priority=1)
   DialogEvents(36)=(EventID=36,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_ClotU',Priority=1)
   DialogEvents(37)=(EventID=37,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_ClotS',Priority=1)
   DialogEvents(38)=(EventID=38,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Gore1',Priority=1)
   DialogEvents(39)=(EventID=39,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Gore2',Priority=1)
   DialogEvents(40)=(EventID=40,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Stalk',Priority=1)
   DialogEvents(41)=(EventID=41,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Bloat',Priority=1)
   DialogEvents(42)=(EventID=42,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Scrake',Priority=1)
   DialogEvents(43)=(EventID=43,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_FP',Priority=1)
   DialogEvents(44)=(EventID=44,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Siren',Priority=1)
   DialogEvents(45)=(EventID=45,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Husk',Priority=1)
   DialogEvents(46)=(EventID=46,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Patty',Priority=1)
   DialogEvents(47)=(EventID=47,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Hans',Priority=1)
   DialogEvents(48)=(EventID=48,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Matty',Priority=1)
   DialogEvents(49)=(EventID=49,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_Target',Priority=1)
   DialogEvents(50)=(EventID=50,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_Won',Priority=1)
   DialogEvents(51)=(EventID=51,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_ObjDecl',Priority=1)
   DialogEvents(52)=(EventID=52,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_StartFail',Priority=1)
   DialogEvents(53)=(EventID=53,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_Target',Priority=1)
   DialogEvents(54)=(EventID=54,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_Won',Priority=1)
   DialogEvents(55)=(EventID=55,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_ObjDecl',Priority=1)
   DialogEvents(56)=(EventID=56,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_StartFail',Priority=1)
   DialogEvents(57)=(EventID=57,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_Areas',Priority=1)
   DialogEvents(58)=(EventID=58,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_Won',Priority=1)
   DialogEvents(59)=(EventID=59,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_ObjDecl',Priority=1)
   DialogEvents(60)=(EventID=60,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_StartFail',Priority=1)
   DialogEvents(61)=(EventID=61,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_Areas',Priority=1)
   DialogEvents(62)=(EventID=62,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_Won',Priority=1)
   DialogEvents(63)=(EventID=63,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_ObjDecl',Priority=1)
   DialogEvents(64)=(EventID=64,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_StartFail',Priority=1)
   DialogEvents(65)=(EventID=65,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_HackTerms',Priority=1)
   DialogEvents(66)=(EventID=66,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_Won',Priority=1)
   DialogEvents(67)=(EventID=67,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_ObjDecl',Priority=1)
   DialogEvents(68)=(EventID=68,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_StartFail',Priority=1)
   DialogEvents(69)=(EventID=69,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_HackTerms',Priority=1)
   DialogEvents(70)=(EventID=70,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_Won',Priority=1)
   DialogEvents(71)=(EventID=71,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_ObjDecl',Priority=1)
   DialogEvents(72)=(EventID=72,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_StartFail',Priority=1)
   DialogEvents(73)=(EventID=73,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_DownloadData',Priority=1)
   DialogEvents(74)=(EventID=74,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_Won',Priority=1)
   DialogEvents(75)=(EventID=75,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_ObjDecl',Priority=1)
   DialogEvents(76)=(EventID=76,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_StartFail',Priority=1)
   DialogEvents(77)=(EventID=77,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_RepairTarget',Priority=1)
   DialogEvents(78)=(EventID=78,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_Won',Priority=1)
   DialogEvents(79)=(EventID=79,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_ObjDecl',Priority=1)
   DialogEvents(80)=(EventID=80,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_StartFail',Priority=1)
   DialogEvents(81)=(EventID=81,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_RepairTargets',Priority=1)
   DialogEvents(82)=(EventID=82,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_Won',Priority=1)
   DialogEvents(83)=(EventID=83,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_ObjDecl',Priority=1)
   DialogEvents(84)=(EventID=84,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_StartFail',Priority=1)
   DialogEvents(85)=(EventID=85,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_VIP',Priority=1)
   DialogEvents(86)=(EventID=86,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_Won',Priority=1)
   DialogEvents(87)=(EventID=87,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_ObjDecl',Priority=1)
   DialogEvents(88)=(EventID=88,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_StartFail',Priority=1)
   DialogEvents(89)=(EventID=89,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_VIPs',Priority=1)
   DialogEvents(90)=(EventID=90,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_Won',Priority=1)
   DialogEvents(91)=(EventID=91,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_ObjDecl',Priority=1)
   DialogEvents(92)=(EventID=92,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_StartFail',Priority=1)
   DialogEvents(93)=(EventID=93,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_Item',Priority=1)
   DialogEvents(94)=(EventID=94,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_Won',Priority=1)
   DialogEvents(95)=(EventID=95,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_ObjDecline',Priority=1)
   DialogEvents(96)=(EventID=96,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_StartFail',Priority=1)
   DialogEvents(97)=(EventID=97,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_Items',Priority=1)
   DialogEvents(98)=(EventID=98,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_Won',Priority=1)
   DialogEvents(99)=(EventID=99,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_ObjDecl',Priority=1)
   DialogEvents(100)=(EventID=100,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_StartFail',Priority=1)
   DialogEvents(101)=(EventID=101,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ADVC_Crawler',Priority=1)
   DialogEvents(102)=(EventID=102,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_StartFailX',Priority=1)
   DialogEvents(103)=(EventID=103,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_WonJust',Priority=1)
   DialogEvents(104)=(EventID=104,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_WonGood',Priority=1)
   DialogEvents(105)=(EventID=105,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF1_WonPerfect',Priority=1)
   DialogEvents(106)=(EventID=106,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_StartFailX',Priority=1)
   DialogEvents(107)=(EventID=107,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_WonJust',Priority=1)
   DialogEvents(108)=(EventID=108,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_WonGood',Priority=1)
   DialogEvents(109)=(EventID=109,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEF9_WonPerfect',Priority=1)
   DialogEvents(110)=(EventID=110,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_StartFailX',Priority=1)
   DialogEvents(111)=(EventID=111,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_WonJust',Priority=1)
   DialogEvents(112)=(EventID=112,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_WonGood',Priority=1)
   DialogEvents(113)=(EventID=113,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFA_WonPerfect',Priority=1)
   DialogEvents(114)=(EventID=114,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_StartFailX',Priority=1)
   DialogEvents(115)=(EventID=115,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_WonJust',Priority=1)
   DialogEvents(116)=(EventID=116,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_WonGood',Priority=1)
   DialogEvents(117)=(EventID=117,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DEFS_WonPerfect',Priority=1)
   DialogEvents(118)=(EventID=118,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_StartFailx',Priority=1)
   DialogEvents(119)=(EventID=119,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_WonJust',Priority=1)
   DialogEvents(120)=(EventID=120,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_WonGood',Priority=1)
   DialogEvents(121)=(EventID=121,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK1_WonPerfect',Priority=1)
   DialogEvents(122)=(EventID=122,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_StartFail',Priority=1)
   DialogEvents(123)=(EventID=123,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_WonJust',Priority=1)
   DialogEvents(124)=(EventID=124,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_WonGood',Priority=1)
   DialogEvents(125)=(EventID=125,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_HCK9_WonPerfect',Priority=1)
   DialogEvents(126)=(EventID=126,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_StartFail',Priority=1)
   DialogEvents(127)=(EventID=127,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_WonJust',Priority=1)
   DialogEvents(128)=(EventID=128,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_WonGood',Priority=1)
   DialogEvents(129)=(EventID=129,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_DNLD_WonPerfect',Priority=1)
   DialogEvents(130)=(EventID=130,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_StartFailX',Priority=1)
   DialogEvents(131)=(EventID=131,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_WonJust',Priority=1)
   DialogEvents(132)=(EventID=132,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_WonGood',Priority=1)
   DialogEvents(133)=(EventID=133,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP1_WonPerfect',Priority=1)
   DialogEvents(134)=(EventID=134,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_StartFailX',Priority=1)
   DialogEvents(135)=(EventID=135,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_WonJust',Priority=1)
   DialogEvents(136)=(EventID=136,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_WonGood',Priority=1)
   DialogEvents(137)=(EventID=137,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_REP9_WonPerfect',Priority=1)
   DialogEvents(138)=(EventID=138,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_StartFailX',Priority=1)
   DialogEvents(139)=(EventID=139,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_WonJust',Priority=1)
   DialogEvents(140)=(EventID=140,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_WonGood',Priority=1)
   DialogEvents(141)=(EventID=141,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC1_WonPerfect',Priority=1)
   DialogEvents(142)=(EventID=142,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_StartFailX',Priority=1)
   DialogEvents(143)=(EventID=143,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_WonJust',Priority=1)
   DialogEvents(144)=(EventID=144,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_WonGood',Priority=1)
   DialogEvents(145)=(EventID=145,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_ESC9_WonPerfect',Priority=1)
   DialogEvents(146)=(EventID=146,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_StartFailX',Priority=1)
   DialogEvents(147)=(EventID=147,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_WonJust',Priority=1)
   DialogEvents(148)=(EventID=148,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_WonGood',Priority=1)
   DialogEvents(149)=(EventID=149,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL1_WonPerfect',Priority=1)
   DialogEvents(150)=(EventID=150,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_StartFailX',Priority=1)
   DialogEvents(151)=(EventID=151,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_WonJust',Priority=1)
   DialogEvents(152)=(EventID=152,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_WonGood',Priority=1)
   DialogEvents(153)=(EventID=153,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COL9_WonPerfect',Priority=1)
   DialogEvents(154)=(EventID=154,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COM_TeamLastOne',Priority=1)
   DialogEvents(155)=(EventID=155,AudioCue=AkEvent'WW_VOX_OBJ_Trader.Play_VOX_OBJ_Trader_COM_FirstWave',Priority=1)
   Name="Default__KFTraderVoiceGroup_Objective"
   ObjectArchetype=KFTraderVoiceGroupBase'KFGame.Default__KFTraderVoiceGroupBase'
}
