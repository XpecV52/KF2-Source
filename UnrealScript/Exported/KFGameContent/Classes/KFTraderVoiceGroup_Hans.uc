class KFTraderVoiceGroup_Hans extends KFTraderVoiceGroupBase;






































































































































































































































































































































































































































































































































































































































































#linenumber 3

defaultproperties
{
   DialogEvents(1)=(EventID=1,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_COM_80ZedDead',Priority=1)
   DialogEvents(2)=(EventID=2,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_COM_LastZedDead',Priority=1)
   DialogEvents(3)=(EventID=3,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_COM_ShopClose',Priority=5)
   DialogEvents(4)=(EventID=4,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_PlayerArrives',Chance=0.300000)
   DialogEvents(5)=(EventID=5,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_TooExp')
   DialogEvents(6)=(EventID=6,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_TooHeavy')
   DialogEvents(8)=(EventID=8,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_10Seconds')
   DialogEvents(9)=(EventID=9,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_LastShop')
   DialogEvents(10)=(EventID=10,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_LongRun',Priority=1,Cooldown=10.000000)
   DialogEvents(11)=(EventID=11,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_NoArmor',Priority=1)
   DialogEvents(12)=(EventID=12,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_LowArmor',Priority=1)
   DialogEvents(13)=(EventID=13,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_LowAmmo',Priority=1)
   DialogEvents(14)=(EventID=14,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_NoNades',Priority=1)
   DialogEvents(15)=(EventID=15,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_Heal',Priority=1,Cooldown=10.000000,Chance=0.250000)
   DialogEvents(16)=(EventID=16,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_TeamHeal',Priority=1,Cooldown=10.000000,Chance=0.250000)
   DialogEvents(17)=(EventID=17,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_SHOP_RichBastard',Priority=1)
   DialogEvents(18)=(EventID=18,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_GoodHealing',Priority=1)
   DialogEvents(19)=(EventID=19,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_SoleSurv',Priority=1)
   DialogEvents(20)=(EventID=20,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_Died',Priority=1)
   DialogEvents(21)=(EventID=21,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_KillMost',Priority=1)
   DialogEvents(22)=(EventID=22,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_TeamPlayer',Priority=1)
   DialogEvents(23)=(EventID=23,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_SurvRounds',Priority=1)
   DialogEvents(24)=(EventID=24,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_DiedRounds',Priority=1)
   DialogEvents(25)=(EventID=25,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_NooneDied',Priority=1)
   DialogEvents(26)=(EventID=26,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_NoDamage',Priority=1)
   DialogEvents(27)=(EventID=27,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_SomeDied',Priority=1)
   DialogEvents(29)=(EventID=29,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_LotDamage',Priority=1)
   DialogEvents(30)=(EventID=30,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_LotDamLotHeal',Priority=1)
   DialogEvents(31)=(EventID=31,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_MostDosh',Priority=1)
   DialogEvents(32)=(EventID=32,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_KillFP',Priority=1)
   DialogEvents(33)=(EventID=33,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_KillScrake',Priority=1)
   DialogEvents(34)=(EventID=34,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_POST_LowDosh',Priority=1)
   DialogEvents(35)=(EventID=35,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_ClotA',Priority=1)
   DialogEvents(36)=(EventID=36,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_ClotU',Priority=1)
   DialogEvents(37)=(EventID=37,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_ClotS',Priority=1)
   DialogEvents(38)=(EventID=38,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Gore1',Priority=1)
   DialogEvents(39)=(EventID=39,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Gore2',Priority=1)
   DialogEvents(40)=(EventID=40,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Stalk',Priority=1)
   DialogEvents(41)=(EventID=41,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Bloat',Priority=1)
   DialogEvents(42)=(EventID=42,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Scrake',Priority=1)
   DialogEvents(43)=(EventID=43,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_FP',Priority=1)
   DialogEvents(44)=(EventID=44,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Siren',Priority=1)
   DialogEvents(45)=(EventID=45,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Husk',Priority=1)
   DialogEvents(47)=(EventID=47,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Patty',Priority=1)
   DialogEvents(48)=(EventID=48,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Matty',Priority=1)
   DialogEvents(57)=(EventID=57,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_Area',Priority=1)
   DialogEvents(58)=(EventID=58,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_Won',Priority=1)
   DialogEvents(59)=(EventID=59,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_ObjDecl',Priority=1)
   DialogEvents(60)=(EventID=60,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_StartFail',Priority=1)
   DialogEvents(101)=(EventID=101,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_ADVC_Crawler',Priority=1)
   DialogEvents(110)=(EventID=110,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_StartFailX',Priority=1)
   DialogEvents(111)=(EventID=111,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_WonJust',Priority=1)
   DialogEvents(112)=(EventID=112,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_WonGood',Priority=1)
   DialogEvents(113)=(EventID=113,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_DEFA_WonPerfect',Priority=1)
   DialogEvents(155)=(EventID=155,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_COM_FirstWave',Priority=1)
   DialogEvents(156)=(EventID=156,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV1_KillWave1')
   DialogEvents(157)=(EventID=157,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV2_KillWave1')
   DialogEvents(158)=(EventID=158,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV3_KillWave1')
   DialogEvents(159)=(EventID=159,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV4_KillWave1')
   DialogEvents(160)=(EventID=160,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV5_KillWave1')
   DialogEvents(161)=(EventID=161,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV6_KillWave1')
   DialogEvents(162)=(EventID=162,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV7_KillWave1')
   DialogEvents(163)=(EventID=163,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV8_KillWave1')
   DialogEvents(164)=(EventID=164,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV9_KillWave1')
   DialogEvents(165)=(EventID=165,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV10_KillWave1')
   DialogEvents(166)=(EventID=166,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV11_KillWave1')
   DialogEvents(167)=(EventID=167,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV12_KillWave1')
   DialogEvents(168)=(EventID=168,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV13_KillWave1')
   DialogEvents(169)=(EventID=169,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV14_KillWave1')
   DialogEvents(170)=(EventID=170,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV15_KillWave1')
   DialogEvents(171)=(EventID=171,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV16_KillWave1')
   DialogEvents(172)=(EventID=172,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV17_KillWave1')
   DialogEvents(173)=(EventID=173,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV18_KillWave1')
   DialogEvents(174)=(EventID=174,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV19_KillWave1')
   DialogEvents(175)=(EventID=175,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV20_KillWave1')
   DialogEvents(176)=(EventID=176,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV21_KillWave1')
   DialogEvents(177)=(EventID=177,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV22_KillWave1')
   DialogEvents(178)=(EventID=178,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV23_KillWave1')
   DialogEvents(179)=(EventID=179,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV24_KillWave1')
   DialogEvents(180)=(EventID=180,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV25_KillWave1')
   DialogEvents(181)=(EventID=181,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV26_KillWave1')
   DialogEvents(182)=(EventID=182,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV27_KillWave1')
   DialogEvents(183)=(EventID=183,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV28_KillWave1')
   DialogEvents(184)=(EventID=184,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV29_KillWave1')
   DialogEvents(185)=(EventID=185,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV30_KillWave1')
   DialogEvents(186)=(EventID=186,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV31_KillWave1')
   DialogEvents(187)=(EventID=187,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV32_KillWave1')
   DialogEvents(188)=(EventID=188,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV33_KillWave1')
   DialogEvents(189)=(EventID=189,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV34_KillWave1')
   DialogEvents(190)=(EventID=190,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV35_KillWave1')
   DialogEvents(191)=(EventID=191,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV36_KillWave1')
   DialogEvents(192)=(EventID=192,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV37_KillWave1')
   DialogEvents(193)=(EventID=193,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV38_KillWave1')
   DialogEvents(194)=(EventID=194,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV39_KillWave1')
   DialogEvents(195)=(EventID=195,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV40_KillWave1')
   DialogEvents(196)=(EventID=196,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV41_KillWave1')
   DialogEvents(197)=(EventID=197,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV42_KillWave1')
   DialogEvents(198)=(EventID=198,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV43_KillWave1')
   DialogEvents(199)=(EventID=199,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV44_KillWave1')
   DialogEvents(200)=(EventID=200,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV45_KillWave1')
   DialogEvents(201)=(EventID=201,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV46_KillWave1')
   DialogEvents(202)=(EventID=202,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV47_KillWave1')
   DialogEvents(203)=(EventID=203,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV48_KillWave1')
   DialogEvents(204)=(EventID=204,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV49_KillWave1')
   DialogEvents(205)=(EventID=205,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV50_KillWave1')
   DialogEvents(206)=(EventID=206,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV51_KillWave1')
   DialogEvents(207)=(EventID=207,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV52_KillWave1')
   DialogEvents(208)=(EventID=208,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV53_KillWave1')
   DialogEvents(209)=(EventID=209,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV54_KillWave1')
   DialogEvents(210)=(EventID=210,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV55_KillWave1')
   DialogEvents(211)=(EventID=211,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV56_KillWave1')
   DialogEvents(212)=(EventID=212,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV57_KillWave1')
   DialogEvents(213)=(EventID=213,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV58_KillWave1')
   DialogEvents(214)=(EventID=214,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV59_KillWave1')
   DialogEvents(215)=(EventID=215,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV60_KillWave1')
   DialogEvents(216)=(EventID=216,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV61_KillWave1')
   DialogEvents(217)=(EventID=217,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV62_KillWave1')
   DialogEvents(218)=(EventID=218,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV63_KillWave1')
   DialogEvents(219)=(EventID=219,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV64_KillWave1')
   DialogEvents(220)=(EventID=220,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV65_KillWave1')
   DialogEvents(221)=(EventID=221,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV66_KillWave1')
   DialogEvents(222)=(EventID=222,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV67_KillWave1')
   DialogEvents(223)=(EventID=223,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV68_KillWave1')
   DialogEvents(224)=(EventID=224,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV69_KillWave1')
   DialogEvents(225)=(EventID=225,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV70_KillWave1')
   DialogEvents(226)=(EventID=226,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV71_KillWave1')
   DialogEvents(227)=(EventID=227,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV72_KillWave1')
   DialogEvents(228)=(EventID=228,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV73_KillWave1')
   DialogEvents(229)=(EventID=229,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV74_KillWave1')
   DialogEvents(230)=(EventID=230,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV75_KillWave1')
   DialogEvents(231)=(EventID=231,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV76_KillWave1')
   DialogEvents(232)=(EventID=232,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV77_KillWave1')
   DialogEvents(233)=(EventID=233,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV78_KillWave1')
   DialogEvents(234)=(EventID=234,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV79_KillWave1')
   DialogEvents(235)=(EventID=235,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV80_KillWave1')
   DialogEvents(236)=(EventID=236,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV81_KillWave1')
   DialogEvents(237)=(EventID=237,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV82_KillWave1')
   DialogEvents(238)=(EventID=238,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV83_KillWave1')
   DialogEvents(239)=(EventID=239,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV84_KillWave1')
   DialogEvents(240)=(EventID=240,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV85_KillWave1')
   DialogEvents(241)=(EventID=241,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV86_KillWave1')
   DialogEvents(242)=(EventID=242,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV87_KillWave1')
   DialogEvents(243)=(EventID=243,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV88_KillWave1')
   DialogEvents(244)=(EventID=244,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV89_KillWave1')
   DialogEvents(245)=(EventID=245,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV90_KillWave1')
   DialogEvents(246)=(EventID=246,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV91_KillWave1')
   DialogEvents(247)=(EventID=247,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV92_KillWave1')
   DialogEvents(248)=(EventID=248,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV93_KillWave1')
   DialogEvents(249)=(EventID=249,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV94_KillWave1')
   DialogEvents(250)=(EventID=250,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV95_KillWave1')
   DialogEvents(251)=(EventID=251,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV96_KillWave1')
   DialogEvents(252)=(EventID=252,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV97_KillWave1')
   DialogEvents(253)=(EventID=253,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV98_KillWave1')
   DialogEvents(254)=(EventID=254,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV99_KillWave1')
   DialogEvents(255)=(EventID=255,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV100_KillWave1')
   DialogEvents(256)=(EventID=256,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_WAV_Over_100')
   DialogEvents(257)=(EventID=257,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS1_KillBoss1')
   DialogEvents(258)=(EventID=258,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS2_KillBoss1')
   DialogEvents(259)=(EventID=259,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS3_KillBoss1')
   DialogEvents(260)=(EventID=260,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS4_KillBoss1')
   DialogEvents(261)=(EventID=261,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS5_KillBoss1')
   DialogEvents(262)=(EventID=262,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS6_KillBoss1')
   DialogEvents(263)=(EventID=263,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS7_KillBoss1')
   DialogEvents(264)=(EventID=264,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS8_KillBoss1')
   DialogEvents(265)=(EventID=265,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS9_KillBoss1')
   DialogEvents(266)=(EventID=266,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS10_KillBoss1')
   DialogEvents(267)=(EventID=267,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS11_KillBoss1')
   DialogEvents(268)=(EventID=268,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS12_KillBoss1')
   DialogEvents(269)=(EventID=269,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS13_KillBoss1')
   DialogEvents(270)=(EventID=270,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS14_KillBoss1')
   DialogEvents(271)=(EventID=271,AudioCue=AkEvent'WW_VOX_NPC_Hans_Trader.Play_Hans_BOS15_KillBoss1')
   Name="Default__KFTraderVoiceGroup_Hans"
   ObjectArchetype=KFTraderVoiceGroupBase'KFGame.Default__KFTraderVoiceGroupBase'
}
