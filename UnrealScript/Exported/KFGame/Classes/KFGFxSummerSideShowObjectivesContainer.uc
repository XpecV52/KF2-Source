class KFGFxSummerSideShowObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items."
   SpecialEventObjectiveInfoList(0)=(TitleString="Repair in the Air",DescriptionString="Repair the broken pipes in Airship")
   SpecialEventObjectiveInfoList(1)=(TitleString="Top Decking Success",DescriptionString="Defend the top deck in Airship")
   SpecialEventObjectiveInfoList(2)=(TitleString="Power Up!",DescriptionString="Repair the electric breaker boxes in Airship")
   SpecialEventObjectiveInfoList(3)=(TitleString="Flush Rush",DescriptionString="Transfer water to the steam engine in Airship")
   SpecialEventObjectiveInfoList(4)=(TitleString="A Fine Vessel",DescriptionString="Win a match on Hard or higher in Airship")
   ObjectiveIconURLs(0)="SummerSideShow_UI.UI_Objectives_SS_Steampunk_RepairEngine"
   ObjectiveIconURLs(1)="Objectives_UI.UI_Objectives_Xmas_DefendObj"
   ObjectiveIconURLs(2)="SummerSideShow_UI.UI_Objectives_SS_Generator"
   ObjectiveIconURLs(3)="SummerSideShow_UI.UI_Objectives_SS_Steampunk_Water"
   ObjectiveIconURLs(4)="SummerSideShow_UI.UI_Objectives_SS_Steampunk_Difficulty"
   AllCompleteRewardIconURL="CHR_Steampunk_Item_TEX.UniformBundle_Steampunk"
   AllCompleteRewardDescriptionString="Steampunk Outfit Bundle"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_SS_01_ItemTex.Sideshow_Prize_Ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_SS_01_ItemTex.SideshowGoldenTicket_Small"
   ChanceDropDescriptionStrings(0)="Prize Ticket"
   ChanceDropDescriptionStrings(1)="Gold Ticket"
   IconURL="SummerSideShow_UI.KF2_SummerSideshow_Logo_Small"
   Name="Default__KFGFxSummerSideShowObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
