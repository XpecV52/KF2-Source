class KFGFxSummerSideShowObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items."
   SpecialEventObjectiveInfoList(0)=(TitleString="Power Up",DescriptionString="Power up the Generator In The Tragic Kingdom")
   SpecialEventObjectiveInfoList(1)=(TitleString="Pop the Clot",DescriptionString="Pop the Clot in The Tragic Kingdom")
   SpecialEventObjectiveInfoList(2)=(TitleString="Dunk the Bloat",DescriptionString="Dunk the Bloat in The Tragic Kingdom")
   SpecialEventObjectiveInfoList(3)=(TitleString="Dosh Toss",DescriptionString="Dosh Toss in The Tragic Kingdom")
   SpecialEventObjectiveInfoList(4)=(TitleString="Carnevil",DescriptionString="Win a match on Hard or higher In The Tragic Kingdom")
   ObjectiveIconURLs(0)="SummerSideShow_UI.UI_Objectives_SS_Generator"
   ObjectiveIconURLs(1)="SummerSideShow_UI.UI_Objectives_SS_PoptheClot"
   ObjectiveIconURLs(2)="SummerSideShow_UI.UI_Objectives_SS_DunktheBloat"
   ObjectiveIconURLs(3)="SummerSideShow_UI.UI_Objectives_SS_DoshToss"
   ObjectiveIconURLs(4)="SummerSideShow_UI.UI_Objectives_SS_LevelComplete"
   AllCompleteRewardIconURL="CHR_CosmeticSet_SS_01_ItemTex.SideshowHazmatPrize"
   AllCompleteRewardDescriptionString="Sideshow Hazmat Suit"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_SS_01_ItemTex.Sideshow_Prize_Ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_SS_01_ItemTex.SideshowGoldenTicket_Small"
   ChanceDropDescriptionStrings(0)="Sideshow Prize Ticket"
   ChanceDropDescriptionStrings(1)="Sideshow Golden Ticket"
   IconURL="SummerSideShow_UI.KF2_SummerSideshow_Logo_Small"
   Name="Default__KFGFxSummerSideShowObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
