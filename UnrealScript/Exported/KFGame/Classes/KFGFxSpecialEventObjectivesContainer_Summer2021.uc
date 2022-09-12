class KFGFxSpecialEventObjectivesContainer_Summer2021 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Kicked!",DescriptionString="Stomp on 50 Zeds")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Lunar",DescriptionString="Complete the Weekly on Moonbase")
   SpecialEventObjectiveInfoList(2)=(TitleString="Shocking Moonlight",DescriptionString="Use the laser trap to kill 20 Zeds on Moonbase")
   SpecialEventObjectiveInfoList(3)=(TitleString="Weightlessness Skills",DescriptionString="Kill 300 Zeds while jumping in the air on Moonbase")
   SpecialEventObjectiveInfoList(4)=(TitleString="Infinite Void",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Moonbase")
   ObjectiveIconURLs(0)="Summer2021_UI.UI_Objective_Summer2021_Kicked"
   ObjectiveIconURLs(1)="Spring2021_UI.UI_Objectives_Spring2021_Weekly_Hack"
   ObjectiveIconURLs(2)="Summer2021_UI.UI_Objective_Summer2021_ShckingMoonlight"
   ObjectiveIconURLs(3)="Summer2021_UI.UI_Objective_Summer2021_WeightlessSklls"
   ObjectiveIconURLs(4)="Summer2021_UI.UI_Objective_Summer2021_InfiniteVoid"
   AllCompleteRewardIconURL="CHR_CosmeticSet_SS_02_ItemTex.astronaut_companionbackpack.astronautcompanionbackpack_precious"
   AllCompleteRewardDescriptionString="Astronaut | Companion Backpack | Precious"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_SS_01_ItemTex.SideshowPremiumTicket_Small"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_SS_01_ItemTex.SideshowGoldenTicket_Small"
   ChanceDropDescriptionStrings(0)="Summer Ticket"
   ChanceDropDescriptionStrings(1)="Summer Golden Ticket"
   IconURL="Summer2021_UI.KF2_Summer_InterstellarInsanity_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxSpecialEventObjectivesContainer_Summer2021"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
