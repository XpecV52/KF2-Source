class KFGFxChristmasObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

DefaultProperties
{
	ObjectiveIconURLs[0]="Xmas_UI.UI_Objectives_Xmas_Krampus"
    ObjectiveIconURLs[1]="Xmas_UI.UI_Objectives_Xmas_DeadElf"
    ObjectiveIconURLs[2]="Objectives_UI.UI_Objectives_Xmas_DefendObj"
    ObjectiveIconURLs[3]="Xmas_UI.UI_Objectives_Xmas_Snowglobe"
    ObjectiveIconURLs[4]="Xmas_UI.UI_Objectives_Xmas_Santa"
    //defaults
    AllCompleteRewardIconURL="CHR_Pajama_Item_TEX.Uniform_PajamaObjective"
    ChanceDropIconURLs[0]="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
    ChanceDropIconURLs[1]="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
	IconURL="Xmas_UI.KF2_KrampusChristmas_UILogo_Small"
}