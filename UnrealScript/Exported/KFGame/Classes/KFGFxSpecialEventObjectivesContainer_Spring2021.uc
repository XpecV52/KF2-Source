class KFGFxSpecialEventObjectivesContainer_Spring2021 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Cyber Threat",DescriptionString="Kill 15 Bosses on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Hack",DescriptionString="Complete the Weekly on Dystopia 2029")
   SpecialEventObjectiveInfoList(2)=(TitleString="AI out of control",DescriptionString="Kill 50 E.D.A.R.s on Dystopia 2029")
   SpecialEventObjectiveInfoList(3)=(TitleString="Not a Simulation",DescriptionString="Complete a wave without taking any damage 10 times on Dystopia 2029")
   SpecialEventObjectiveInfoList(4)=(TitleString="Brave Zed World",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Dystopia 2029")
   ObjectiveIconURLs(0)="Spring2021_UI.UI_Objectives_Spring2021_Cyber_Threat"
   ObjectiveIconURLs(1)="Spring2021_UI.UI_Objectives_Spring2021_Weekly_Hack"
   ObjectiveIconURLs(2)="Spring2021_UI.UI_Objectives_Spring2021_AI_Out_of_Control"
   ObjectiveIconURLs(3)="Spring2021_UI.UI_Objectives_Spring2021_Not_a_Simulation"
   ObjectiveIconURLs(4)="Spring2021_UI.UI_Objectives_Spring2021_Zed_World"
   AllCompleteRewardIconURL="CHR_CosmeticSet_Spring_01_Item_TEX.cyborg_companionbackpack.cyborgcompanionbackpack_precious"
   AllCompleteRewardDescriptionString="Cyborg | Companion Backpack | Precious"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Spring Ticket"
   ChanceDropDescriptionStrings(1)="Spring Golden Ticket"
   IconURL="Spring2021_UI.KF2_Spring_DystopianDevastation_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxSpecialEventObjectivesContainer_Spring2021"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
