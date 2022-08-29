class KFGFxChristmasObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items."
   SpecialEventObjectiveInfoList(0)=(TitleString="The Perfect Gift",DescriptionString="End all Escort objectives with cart at full health on Survival Hard or higher difficulty")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Specials",DescriptionString="Complete the Weekly on Shopping Spree")
   SpecialEventObjectiveInfoList(2)=(TitleString="Slay Ride",DescriptionString="Kill 2500 Zeds")
   SpecialEventObjectiveInfoList(3)=(TitleString="Roast Their Chestnuts",DescriptionString="Kill 25 Bosses")
   SpecialEventObjectiveInfoList(4)=(TitleString="Workshop Rumble",DescriptionString="Defeat Krampus on Santa's Workshop Survival Hard or higher difficulty")
   ObjectiveIconURLs(0)="Xmas_UI.UI_Objectives_Xmas_CartHP"
   ObjectiveIconURLs(1)="Xmas_UI.UI_Objectives_Xmas_ShoppingSpree"
   ObjectiveIconURLs(2)="Xmas_UI.UI_Objectives_Xmas_2kZEDs"
   ObjectiveIconURLs(3)="Xmas_UI.UI_Objectives_Xmas_25Bosses"
   ObjectiveIconURLs(4)="Xmas_UI.UI_Objectives_Xmas_SantasLair"
   AllCompleteRewardIconURL="WEP_SkinSet_Christmas_Item_TEX.BattleAxe_ChristmasPrecious_Mint"
   AllCompleteRewardDescriptionString="Battleaxe + Christmas Skin"
   ChanceDropIconURLs(0)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
   ChanceDropIconURLs(1)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
   ChanceDropDescriptionStrings(0)="Prize Ticket"
   ChanceDropDescriptionStrings(1)="Gold Ticket"
   IconURL="Xmas_UI.KF2_TwistedChristmas_Logo_Small"
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxChristmasObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
