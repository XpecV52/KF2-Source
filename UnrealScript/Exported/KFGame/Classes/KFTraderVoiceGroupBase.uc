class KFTraderVoiceGroupBase extends Object;









































































































































































































































































































































































	




	




	




	














	




	














	




















































#linenumber 3

struct TraderDialogEventInfo
{
    var int     EventID;
    var AkEvent AudioCue;
    var byte    Priority;
    var float   CoolDown;
};

var TraderDialogEventInfo   DialogEvents[154];
var name                    EventNames[154];

defaultproperties
{
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
