class KFGFxSpecialEventObjectivesContainer_Summer2022 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Not the best tourists",DescriptionString="Kill 1500 Zeds on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Splashdown",DescriptionString="Complete the Weekly on Rig")
   SpecialEventObjectiveInfoList(2)=(TitleString="Top Surfer",DescriptionString="Complete 100 waves on Rig")
   SpecialEventObjectiveInfoList(3)=(TitleString="Overboard!",DescriptionString="Throw 50 Zeds to the sea on Rig")
   SpecialEventObjectiveInfoList(4)=(TitleString="Wide wide sea",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Rig")
   ObjectiveIconURLs(0)="Summer2022_UI.UI_Objectives_Summer2022_Not_the_best_tourists"
   ObjectiveIconURLs(1)="Summer2022_UI.UI_Objectives_Summer2022_Splashdown"
   ObjectiveIconURLs(2)="Summer2022_UI.UI_Objectives_Summer2022_Top_Surfer"
   ObjectiveIconURLs(3)="Summer2022_UI.UI_Objectives_Summer2022_Overboard"
   ObjectiveIconURLs(4)="Summer2022_UI.UI_Objectives_Summer2022_Wide_wide_sea"
   AllCompleteRewardIconURL="CHR_DeepSeaUniform_Item_TEX.trident.deepseatrident_precious"
   AllCompleteRewardDescriptionString="Deep Sea | Trident | Precious"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_SS_01_ItemTex.Sideshow_Prize_Ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_SS_01_ItemTex.SideshowGoldenTicket_Small"
   ChanceDropDescriptionStrings(0)="Summer Ticket"
   ChanceDropDescriptionStrings(1)="Summer Golden Ticket"
   IconURL="Summer2022_UI.KF2_Summer_2022_Tidal_Terror"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxSpecialEventObjectivesContainer_Summer2022"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
