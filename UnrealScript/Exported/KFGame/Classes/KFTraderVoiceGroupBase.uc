class KFTraderVoiceGroupBase extends Object;







































































































































































































































































































































































































































































































































































































































































#linenumber 3

struct TraderDialogEventInfo
{
    var int     EventID;
    var AkEvent AudioCue;
    var byte    Priority;
    var float   CoolDown;
	var float	Chance;

	structdefaultproperties
	{
		Chance=1.f
	}
};

var TraderDialogEventInfo   DialogEvents[275];
var name                    EventNames[275];

defaultproperties
{
   DialogEvents(0)=(Chance=1.000000)
   DialogEvents(1)=(Chance=1.000000)
   DialogEvents(2)=(Chance=1.000000)
   DialogEvents(3)=(Chance=1.000000)
   DialogEvents(4)=(Chance=1.000000)
   DialogEvents(5)=(Chance=1.000000)
   DialogEvents(6)=(Chance=1.000000)
   DialogEvents(7)=(Chance=1.000000)
   DialogEvents(8)=(Chance=1.000000)
   DialogEvents(9)=(Chance=1.000000)
   DialogEvents(10)=(Chance=1.000000)
   DialogEvents(11)=(Chance=1.000000)
   DialogEvents(12)=(Chance=1.000000)
   DialogEvents(13)=(Chance=1.000000)
   DialogEvents(14)=(Chance=1.000000)
   DialogEvents(15)=(Chance=1.000000)
   DialogEvents(16)=(Chance=1.000000)
   DialogEvents(17)=(Chance=1.000000)
   DialogEvents(18)=(Chance=1.000000)
   DialogEvents(19)=(Chance=1.000000)
   DialogEvents(20)=(Chance=1.000000)
   DialogEvents(21)=(Chance=1.000000)
   DialogEvents(22)=(Chance=1.000000)
   DialogEvents(23)=(Chance=1.000000)
   DialogEvents(24)=(Chance=1.000000)
   DialogEvents(25)=(Chance=1.000000)
   DialogEvents(26)=(Chance=1.000000)
   DialogEvents(27)=(Chance=1.000000)
   DialogEvents(28)=(Chance=1.000000)
   DialogEvents(29)=(Chance=1.000000)
   DialogEvents(30)=(Chance=1.000000)
   DialogEvents(31)=(Chance=1.000000)
   DialogEvents(32)=(Chance=1.000000)
   DialogEvents(33)=(Chance=1.000000)
   DialogEvents(34)=(Chance=1.000000)
   DialogEvents(35)=(Chance=1.000000)
   DialogEvents(36)=(Chance=1.000000)
   DialogEvents(37)=(Chance=1.000000)
   DialogEvents(38)=(Chance=1.000000)
   DialogEvents(39)=(Chance=1.000000)
   DialogEvents(40)=(Chance=1.000000)
   DialogEvents(41)=(Chance=1.000000)
   DialogEvents(42)=(Chance=1.000000)
   DialogEvents(43)=(Chance=1.000000)
   DialogEvents(44)=(Chance=1.000000)
   DialogEvents(45)=(Chance=1.000000)
   DialogEvents(46)=(Chance=1.000000)
   DialogEvents(47)=(Chance=1.000000)
   DialogEvents(48)=(Chance=1.000000)
   DialogEvents(49)=(Chance=1.000000)
   DialogEvents(50)=(Chance=1.000000)
   DialogEvents(51)=(Chance=1.000000)
   DialogEvents(52)=(Chance=1.000000)
   DialogEvents(53)=(Chance=1.000000)
   DialogEvents(54)=(Chance=1.000000)
   DialogEvents(55)=(Chance=1.000000)
   DialogEvents(56)=(Chance=1.000000)
   DialogEvents(57)=(Chance=1.000000)
   DialogEvents(58)=(Chance=1.000000)
   DialogEvents(59)=(Chance=1.000000)
   DialogEvents(60)=(Chance=1.000000)
   DialogEvents(61)=(Chance=1.000000)
   DialogEvents(62)=(Chance=1.000000)
   DialogEvents(63)=(Chance=1.000000)
   DialogEvents(64)=(Chance=1.000000)
   DialogEvents(65)=(Chance=1.000000)
   DialogEvents(66)=(Chance=1.000000)
   DialogEvents(67)=(Chance=1.000000)
   DialogEvents(68)=(Chance=1.000000)
   DialogEvents(69)=(Chance=1.000000)
   DialogEvents(70)=(Chance=1.000000)
   DialogEvents(71)=(Chance=1.000000)
   DialogEvents(72)=(Chance=1.000000)
   DialogEvents(73)=(Chance=1.000000)
   DialogEvents(74)=(Chance=1.000000)
   DialogEvents(75)=(Chance=1.000000)
   DialogEvents(76)=(Chance=1.000000)
   DialogEvents(77)=(Chance=1.000000)
   DialogEvents(78)=(Chance=1.000000)
   DialogEvents(79)=(Chance=1.000000)
   DialogEvents(80)=(Chance=1.000000)
   DialogEvents(81)=(Chance=1.000000)
   DialogEvents(82)=(Chance=1.000000)
   DialogEvents(83)=(Chance=1.000000)
   DialogEvents(84)=(Chance=1.000000)
   DialogEvents(85)=(Chance=1.000000)
   DialogEvents(86)=(Chance=1.000000)
   DialogEvents(87)=(Chance=1.000000)
   DialogEvents(88)=(Chance=1.000000)
   DialogEvents(89)=(Chance=1.000000)
   DialogEvents(90)=(Chance=1.000000)
   DialogEvents(91)=(Chance=1.000000)
   DialogEvents(92)=(Chance=1.000000)
   DialogEvents(93)=(Chance=1.000000)
   DialogEvents(94)=(Chance=1.000000)
   DialogEvents(95)=(Chance=1.000000)
   DialogEvents(96)=(Chance=1.000000)
   DialogEvents(97)=(Chance=1.000000)
   DialogEvents(98)=(Chance=1.000000)
   DialogEvents(99)=(Chance=1.000000)
   DialogEvents(100)=(Chance=1.000000)
   DialogEvents(101)=(Chance=1.000000)
   DialogEvents(102)=(Chance=1.000000)
   DialogEvents(103)=(Chance=1.000000)
   DialogEvents(104)=(Chance=1.000000)
   DialogEvents(105)=(Chance=1.000000)
   DialogEvents(106)=(Chance=1.000000)
   DialogEvents(107)=(Chance=1.000000)
   DialogEvents(108)=(Chance=1.000000)
   DialogEvents(109)=(Chance=1.000000)
   DialogEvents(110)=(Chance=1.000000)
   DialogEvents(111)=(Chance=1.000000)
   DialogEvents(112)=(Chance=1.000000)
   DialogEvents(113)=(Chance=1.000000)
   DialogEvents(114)=(Chance=1.000000)
   DialogEvents(115)=(Chance=1.000000)
   DialogEvents(116)=(Chance=1.000000)
   DialogEvents(117)=(Chance=1.000000)
   DialogEvents(118)=(Chance=1.000000)
   DialogEvents(119)=(Chance=1.000000)
   DialogEvents(120)=(Chance=1.000000)
   DialogEvents(121)=(Chance=1.000000)
   DialogEvents(122)=(Chance=1.000000)
   DialogEvents(123)=(Chance=1.000000)
   DialogEvents(124)=(Chance=1.000000)
   DialogEvents(125)=(Chance=1.000000)
   DialogEvents(126)=(Chance=1.000000)
   DialogEvents(127)=(Chance=1.000000)
   DialogEvents(128)=(Chance=1.000000)
   DialogEvents(129)=(Chance=1.000000)
   DialogEvents(130)=(Chance=1.000000)
   DialogEvents(131)=(Chance=1.000000)
   DialogEvents(132)=(Chance=1.000000)
   DialogEvents(133)=(Chance=1.000000)
   DialogEvents(134)=(Chance=1.000000)
   DialogEvents(135)=(Chance=1.000000)
   DialogEvents(136)=(Chance=1.000000)
   DialogEvents(137)=(Chance=1.000000)
   DialogEvents(138)=(Chance=1.000000)
   DialogEvents(139)=(Chance=1.000000)
   DialogEvents(140)=(Chance=1.000000)
   DialogEvents(141)=(Chance=1.000000)
   DialogEvents(142)=(Chance=1.000000)
   DialogEvents(143)=(Chance=1.000000)
   DialogEvents(144)=(Chance=1.000000)
   DialogEvents(145)=(Chance=1.000000)
   DialogEvents(146)=(Chance=1.000000)
   DialogEvents(147)=(Chance=1.000000)
   DialogEvents(148)=(Chance=1.000000)
   DialogEvents(149)=(Chance=1.000000)
   DialogEvents(150)=(Chance=1.000000)
   DialogEvents(151)=(Chance=1.000000)
   DialogEvents(152)=(Chance=1.000000)
   DialogEvents(153)=(Chance=1.000000)
   DialogEvents(154)=(Chance=1.000000)
   DialogEvents(155)=(Chance=1.000000)
   DialogEvents(156)=(Chance=1.000000)
   DialogEvents(157)=(Chance=1.000000)
   DialogEvents(158)=(Chance=1.000000)
   DialogEvents(159)=(Chance=1.000000)
   DialogEvents(160)=(Chance=1.000000)
   DialogEvents(161)=(Chance=1.000000)
   DialogEvents(162)=(Chance=1.000000)
   DialogEvents(163)=(Chance=1.000000)
   DialogEvents(164)=(Chance=1.000000)
   DialogEvents(165)=(Chance=1.000000)
   DialogEvents(166)=(Chance=1.000000)
   DialogEvents(167)=(Chance=1.000000)
   DialogEvents(168)=(Chance=1.000000)
   DialogEvents(169)=(Chance=1.000000)
   DialogEvents(170)=(Chance=1.000000)
   DialogEvents(171)=(Chance=1.000000)
   DialogEvents(172)=(Chance=1.000000)
   DialogEvents(173)=(Chance=1.000000)
   DialogEvents(174)=(Chance=1.000000)
   DialogEvents(175)=(Chance=1.000000)
   DialogEvents(176)=(Chance=1.000000)
   DialogEvents(177)=(Chance=1.000000)
   DialogEvents(178)=(Chance=1.000000)
   DialogEvents(179)=(Chance=1.000000)
   DialogEvents(180)=(Chance=1.000000)
   DialogEvents(181)=(Chance=1.000000)
   DialogEvents(182)=(Chance=1.000000)
   DialogEvents(183)=(Chance=1.000000)
   DialogEvents(184)=(Chance=1.000000)
   DialogEvents(185)=(Chance=1.000000)
   DialogEvents(186)=(Chance=1.000000)
   DialogEvents(187)=(Chance=1.000000)
   DialogEvents(188)=(Chance=1.000000)
   DialogEvents(189)=(Chance=1.000000)
   DialogEvents(190)=(Chance=1.000000)
   DialogEvents(191)=(Chance=1.000000)
   DialogEvents(192)=(Chance=1.000000)
   DialogEvents(193)=(Chance=1.000000)
   DialogEvents(194)=(Chance=1.000000)
   DialogEvents(195)=(Chance=1.000000)
   DialogEvents(196)=(Chance=1.000000)
   DialogEvents(197)=(Chance=1.000000)
   DialogEvents(198)=(Chance=1.000000)
   DialogEvents(199)=(Chance=1.000000)
   DialogEvents(200)=(Chance=1.000000)
   DialogEvents(201)=(Chance=1.000000)
   DialogEvents(202)=(Chance=1.000000)
   DialogEvents(203)=(Chance=1.000000)
   DialogEvents(204)=(Chance=1.000000)
   DialogEvents(205)=(Chance=1.000000)
   DialogEvents(206)=(Chance=1.000000)
   DialogEvents(207)=(Chance=1.000000)
   DialogEvents(208)=(Chance=1.000000)
   DialogEvents(209)=(Chance=1.000000)
   DialogEvents(210)=(Chance=1.000000)
   DialogEvents(211)=(Chance=1.000000)
   DialogEvents(212)=(Chance=1.000000)
   DialogEvents(213)=(Chance=1.000000)
   DialogEvents(214)=(Chance=1.000000)
   DialogEvents(215)=(Chance=1.000000)
   DialogEvents(216)=(Chance=1.000000)
   DialogEvents(217)=(Chance=1.000000)
   DialogEvents(218)=(Chance=1.000000)
   DialogEvents(219)=(Chance=1.000000)
   DialogEvents(220)=(Chance=1.000000)
   DialogEvents(221)=(Chance=1.000000)
   DialogEvents(222)=(Chance=1.000000)
   DialogEvents(223)=(Chance=1.000000)
   DialogEvents(224)=(Chance=1.000000)
   DialogEvents(225)=(Chance=1.000000)
   DialogEvents(226)=(Chance=1.000000)
   DialogEvents(227)=(Chance=1.000000)
   DialogEvents(228)=(Chance=1.000000)
   DialogEvents(229)=(Chance=1.000000)
   DialogEvents(230)=(Chance=1.000000)
   DialogEvents(231)=(Chance=1.000000)
   DialogEvents(232)=(Chance=1.000000)
   DialogEvents(233)=(Chance=1.000000)
   DialogEvents(234)=(Chance=1.000000)
   DialogEvents(235)=(Chance=1.000000)
   DialogEvents(236)=(Chance=1.000000)
   DialogEvents(237)=(Chance=1.000000)
   DialogEvents(238)=(Chance=1.000000)
   DialogEvents(239)=(Chance=1.000000)
   DialogEvents(240)=(Chance=1.000000)
   DialogEvents(241)=(Chance=1.000000)
   DialogEvents(242)=(Chance=1.000000)
   DialogEvents(243)=(Chance=1.000000)
   DialogEvents(244)=(Chance=1.000000)
   DialogEvents(245)=(Chance=1.000000)
   DialogEvents(246)=(Chance=1.000000)
   DialogEvents(247)=(Chance=1.000000)
   DialogEvents(248)=(Chance=1.000000)
   DialogEvents(249)=(Chance=1.000000)
   DialogEvents(250)=(Chance=1.000000)
   DialogEvents(251)=(Chance=1.000000)
   DialogEvents(252)=(Chance=1.000000)
   DialogEvents(253)=(Chance=1.000000)
   DialogEvents(254)=(Chance=1.000000)
   DialogEvents(255)=(Chance=1.000000)
   DialogEvents(256)=(Chance=1.000000)
   DialogEvents(257)=(Chance=1.000000)
   DialogEvents(258)=(Chance=1.000000)
   DialogEvents(259)=(Chance=1.000000)
   DialogEvents(260)=(Chance=1.000000)
   DialogEvents(261)=(Chance=1.000000)
   DialogEvents(262)=(Chance=1.000000)
   DialogEvents(263)=(Chance=1.000000)
   DialogEvents(264)=(Chance=1.000000)
   DialogEvents(265)=(Chance=1.000000)
   DialogEvents(266)=(Chance=1.000000)
   DialogEvents(267)=(Chance=1.000000)
   DialogEvents(268)=(Chance=1.000000)
   DialogEvents(269)=(Chance=1.000000)
   DialogEvents(270)=(Chance=1.000000)
   DialogEvents(271)=(Chance=1.000000)
   DialogEvents(272)=(Chance=1.000000)
   DialogEvents(273)=(Chance=1.000000)
   DialogEvents(274)=(Chance=1.000000)
   EventNames(0)="TRAD_Wave20pctDead"
   EventNames(1)="TRAD_Wave80pctDead"
   EventNames(2)="TRAD_WaveLastZedDies"
   EventNames(3)="TRAD_Close"
   EventNames(4)="TRAD_PlayerArrive"
   EventNames(5)="TRAD_ClickTooExpensive"
   EventNames(6)="TRAD_ClickTooHeavy"
   EventNames(7)="TRAD_30SecLeft"
   EventNames(8)="TRAD_10SecLeft"
   EventNames(9)="TRAD_FinalShopWave"
   EventNames(10)="TRAD_PlayerFarAway"
   EventNames(11)="TRAD_NoArmor"
   EventNames(12)="TRAD_LowArmor"
   EventNames(13)="TRAD_LowAmmo"
   EventNames(14)="TRAD_NoNades"
   EventNames(15)="TRAD_NeedToHeal"
   EventNames(16)="TRAD_TeamNeedsHeal"
   EventNames(17)="TRAD_ShareDosh"
   EventNames(18)="TRAD_GoodJobHeal"
   EventNames(19)="TRAD_OnlySurvivor"
   EventNames(20)="TRAD_DiedLastWave"
   EventNames(21)="TRAD_KilledMost"
   EventNames(22)="TRAD_BestTeamPlayer"
   EventNames(23)="TRAD_SurviveMultWaves"
   EventNames(24)="TRAD_KeepDying"
   EventNames(25)="TRAD_NoOneDies"
   EventNames(26)="TRAD_NoDamage"
   EventNames(27)="TRAD_SomeDie"
   EventNames(28)="TRAD_LT50pctDamTaken"
   EventNames(29)="TRAD_HighDmgSurvivor"
   EventNames(30)="TRAD_HighDmgHighHeal"
   EventNames(31)="TRAD_EarnMostDosh"
   EventNames(32)="TRAD_KilledFleshpound"
   EventNames(33)="TRAD_KilledScrake"
   EventNames(34)="TRAD_LittleDosh"
   EventNames(35)="TRAD_AdviceClotA"
   EventNames(36)="TRAD_AdviceClotU"
   EventNames(37)="TRAD_AdviceClotS"
   EventNames(38)="TRAD_AdviceGorefast"
   EventNames(39)="TRAD_AdviceGorefast2"
   EventNames(40)="TRAD_AdviceStalker"
   EventNames(41)="TRAD_AdviceBloat"
   EventNames(42)="TRAD_AdviceScrake"
   EventNames(43)="TRAD_AdviceFleshpound"
   EventNames(44)="TRAD_AdviceSiren"
   EventNames(45)="TRAD_AdviceHusk"
   EventNames(46)="TRAD_AdvicePatriarch"
   EventNames(47)="TRAD_AdviceHans"
   EventNames(48)="TRAD_AdviceMatriarch"
   EventNames(49)="TRAD_ObjDefendT"
   EventNames(50)="TRAD_ObjDefendTWon"
   EventNames(51)="TRAD_ObjDefendTDeclined"
   EventNames(52)="TRAD_ObjDefendTFailed"
   EventNames(53)="TRAD_ObjDefendTs"
   EventNames(54)="TRAD_ObjDefendTsWon"
   EventNames(55)="TRAD_ObjDefendTsDeclined"
   EventNames(56)="TRAD_ObjDefendTsFailed"
   EventNames(57)="TRAD_ObjDefendA"
   EventNames(58)="TRAD_ObjDefendAWon"
   EventNames(59)="TRAD_ObjDefendADeclined"
   EventNames(60)="TRAD_ObjDefendAFailed"
   EventNames(61)="TRAD_ObjDefendAs"
   EventNames(62)="TRAD_ObjDefendAsWon"
   EventNames(63)="TRAD_ObjDefendAsDeclined"
   EventNames(64)="TRAD_ObjDefendAsFailed"
   EventNames(65)="TRAD_ObjHackTerm"
   EventNames(66)="TRAD_ObjHackTermWon"
   EventNames(67)="TRAD_ObjHackTermDeclined"
   EventNames(68)="TRAD_ObjHackTermFailed"
   EventNames(69)="TRAD_ObjHackTerms"
   EventNames(70)="TRAD_ObjHackTermsWon"
   EventNames(71)="TRAD_ObjHackTermsDeclined"
   EventNames(72)="TRAD_ObjHackTermsFailed"
   EventNames(73)="TRAD_ObjDownload"
   EventNames(74)="TRAD_ObjDownloadWon"
   EventNames(75)="TRAD_ObjDownloadDeclined"
   EventNames(76)="TRAD_ObjDownloadFailed"
   EventNames(77)="TRAD_ObjRepairT"
   EventNames(78)="TRAD_ObjRepairTWon"
   EventNames(79)="TRAD_ObjRepairTDeclined"
   EventNames(80)="TRAD_ObjRepairTFailed"
   EventNames(81)="TRAD_ObjRepairTs"
   EventNames(82)="TRAD_ObjRepairTsWon"
   EventNames(83)="TRAD_ObjRepairTsDeclined"
   EventNames(84)="TRAD_ObjRepairTsFailed"
   EventNames(85)="TRAD_ObjEscVIP"
   EventNames(86)="TRAD_ObjEscVIPWon"
   EventNames(87)="TRAD_ObjEscVIPDeclined"
   EventNames(88)="TRAD_ObjEscVIPFailed"
   EventNames(89)="TRAD_ObjEscVIPs"
   EventNames(90)="TRAD_ObjEscVIPsWon"
   EventNames(91)="TRAD_ObjEscVIPsDeclined"
   EventNames(92)="TRAD_ObjEscVIPsFailed"
   EventNames(93)="TRAD_ObjCollItem"
   EventNames(94)="TRAD_ObjCollItemWon"
   EventNames(95)="TRAD_ObjCollItemDeclined"
   EventNames(96)="TRAD_ObjCollItemFailed"
   EventNames(97)="TRAD_ObjCollItems"
   EventNames(98)="TRAD_ObjCollItemsWon"
   EventNames(99)="TRAD_ObjCollItemsDeclined"
   EventNames(100)="TRAD_ObjCollItemsFailed"
   Name="Default__KFTraderVoiceGroupBase"
   ObjectArchetype=Object'Core.Default__Object'
}
