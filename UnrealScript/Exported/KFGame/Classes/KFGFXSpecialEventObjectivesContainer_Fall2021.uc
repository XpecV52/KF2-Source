class KFGFXSpecialEventObjectivesContainer_Fall2021 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Horrific Manifestations",DescriptionString="Kill 15 Bosses on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Cult",DescriptionString="Complete the Weekly on Netherhold")
   SpecialEventObjectiveInfoList(2)=(TitleString="I’m hearing heartbeats",DescriptionString="Find the nether heart")
   SpecialEventObjectiveInfoList(3)=(TitleString="Purple Miasma",DescriptionString="Unlock the chapel and the dining hall doors")
   SpecialEventObjectiveInfoList(4)=(TitleString="Eternal Punishment",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Netherhold")
   ObjectiveIconURLs(0)="Xmas_UI.UI_Objectives_Xmas_BossKill02"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="halloween2021_ui.UI_Objective_Halloween_2021_Im_hearing_heartbeats"
   ObjectiveIconURLs(3)="halloween2021_ui.UI_Objective_Halloween_2021_Purple_Miasma"
   ObjectiveIconURLs(4)="halloween2021_ui.UI_Objective_Halloween_2021_Eternal_Punishment"
   AllCompleteRewardIconURL="CHR_CosmeticSet_Halloween_05_Item_TEX.muertos_companion.diadelosmuertoscompanion_precious"
   AllCompleteRewardDescriptionString="DoZ | Companion | Precious"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Halloween Ticket"
   ChanceDropDescriptionStrings(1)="Halloween Golden Ticket"
   IconURL="Halloween2021_UI.KF2_Halloween_DayOfTheZED_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=()
   UsesProgressList(3)=()
   UsesProgressList(4)=()
   Name="Default__KFGFXSpecialEventObjectivesContainer_Fall2021"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
