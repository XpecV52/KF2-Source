class KFGFxSummer2019ObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="We Have Lift Off!",DescriptionString="Complete Steam Fortress on Objective Hard or higher difficulty")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Checkup",DescriptionString="Complete the Weekly on Steam Fortress")
   SpecialEventObjectiveInfoList(2)=(TitleString="Everlasting Steam",DescriptionString="Complete Steam Fortress wave 15 on Endless Hard or higher difficulty")
   SpecialEventObjectiveInfoList(3)=(TitleString="Deadly Round Trip",DescriptionString="Complete Zed Landing on Objective Hard or higher difficulty")
   SpecialEventObjectiveInfoList(4)=(TitleString="Cold Return",DescriptionString="Complete Outpost on Objective Hard or higher difficulty")
   ObjectiveIconURLs(0)="SummerSideShow_UI.UI_Objectives_Summer_SteamFObj"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="SummerSideShow_UI.UI_Objectives_Summer_SteamFEndless"
   ObjectiveIconURLs(3)="SummerSideShow_UI.UI_Objectives_Summer_ZedLObj"
   ObjectiveIconURLs(4)="SummerSideShow_UI.UI_Objectives_Summer_OutpostObj"
   AllCompleteRewardIconURL="wep_skinset25_item_tex.m99_royal.M99_SteampunkPrecious_Mint"
   AllCompleteRewardDescriptionString="Steampunk Outfits + M99 AMR skin"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_SS_01_ItemTex.Sideshow_Prize_Ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_SS_01_ItemTex.SideshowGoldenTicket_Small"
   ChanceDropDescriptionStrings(0)="Prize Ticket"
   ChanceDropDescriptionStrings(1)="Gold Ticket"
   IconURL="SummerSideShow_UI.KF2_KickingBrass_Logo_Small"
   Name="Default__KFGFxSummer2019ObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
