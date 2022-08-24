class KFGFxChristmasObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items."
   SpecialEventObjectiveInfoList(0)=(TitleString="Breaking and Entering",DescriptionString="Break Krampus's trinkets in Krampus Lair")
   SpecialEventObjectiveInfoList(1)=(TitleString="Mincemeat",DescriptionString="Kill a Zed using the wood chipper in Krampus Lair")
   SpecialEventObjectiveInfoList(2)=(TitleString="Stand Fast",DescriptionString="Complete the Stand Your Ground objective in Krampus Lair")
   SpecialEventObjectiveInfoList(3)=(TitleString="Snow Prisons",DescriptionString="Find ten of the collectibles in Krampus Lair")
   SpecialEventObjectiveInfoList(4)=(TitleString="And to All a Good Night",DescriptionString="Kill Krampus on Hard or higher Difficulty in Krampus Lair")
   ObjectiveIconURLs(0)="Xmas_UI.UI_Objectives_Xmas_Krampus"
   ObjectiveIconURLs(1)="Xmas_UI.UI_Objectives_Xmas_DeadElf"
   ObjectiveIconURLs(2)="Objectives_UI.UI_Objectives_Xmas_DefendObj"
   ObjectiveIconURLs(3)="Xmas_UI.UI_Objectives_Xmas_Snowglobe"
   ObjectiveIconURLs(4)="Xmas_UI.UI_Objectives_Xmas_Santa"
   AllCompleteRewardIconURL="CHR_Pajama_Item_TEX.Uniform_PajamaObjective"
   AllCompleteRewardDescriptionString="Pajama Suit"
   ChanceDropIconURLs(0)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
   ChanceDropIconURLs(1)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
   ChanceDropDescriptionStrings(0)="Prize Ticket"
   ChanceDropDescriptionStrings(1)="Gold Ticket"
   IconURL="Xmas_UI.KF2_KrampusChristmas_UILogo_Small"
   Name="Default__KFGFxChristmasObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
