class KFGFxSummerSideShowObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

DefaultProperties
{
	ObjectiveIconURLs[0]="SummerSideShow_UI.UI_Objectives_SS_Generator"
    ObjectiveIconURLs[1]="SummerSideShow_UI.UI_Objectives_SS_PoptheClot"
    ObjectiveIconURLs[2]="SummerSideShow_UI.UI_Objectives_SS_DunktheBloat"
    ObjectiveIconURLs[3]="SummerSideShow_UI.UI_Objectives_SS_DoshToss"
    ObjectiveIconURLs[4]="SummerSideShow_UI.UI_Objectives_SS_LevelComplete"
    //defaults
    AllCompleteRewardIconURL="CHR_CosmeticSet_SS_01_ItemTex.SideshowHazmatPrize"
    ChanceDropIconURLs[0]="CHR_CosmeticSet_SS_01_ItemTex.Sideshow_Prize_Ticket"
    ChanceDropIconURLs[1]="CHR_CosmeticSet_SS_01_ItemTex.SideshowGoldenTicket_Small"
	IconURL="SummerSideShow_UI.KF2_SummerSideshow_Logo_Small"
}