class KFGFXSpecialEventObjectivesContainer_Xmas2021 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Heads on sale!",DescriptionString="Kill 1000 Zeds with headshots on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Black Weekly",DescriptionString="Complete the Weekly on Carillon Hamlet")
   SpecialEventObjectiveInfoList(2)=(TitleString="Filthy Rich",DescriptionString="Earn 75,000 Dosh through kills, rewards and healing on Carillon Hamlet")
   SpecialEventObjectiveInfoList(3)=(TitleString="Painful Payments",DescriptionString="Use the trader to purchase a total of 20 weapons that cost 1500 Dosh or more on Carrion Hamlet")
   SpecialEventObjectiveInfoList(4)=(TitleString="Nonstop Splurge",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Carillon Hamlet")
   ObjectiveIconURLs(0)="Xmas2021_UI.Heads_For_Sale"
   ObjectiveIconURLs(1)="Xmas2021_UI.Black_Weekly"
   ObjectiveIconURLs(2)="Xmas2021_UI.Filthy_Rich"
   ObjectiveIconURLs(3)="Xmas2021_UI.Painful_Payments"
   ObjectiveIconURLs(4)="Xmas2021_UI.Nonstop_Splurge"
   AllCompleteRewardIconURL="CHR_CosmeticSet_XMAS_05_Item_TEX.shopping_companion.holidayshoppingcompanion_precious"
   AllCompleteRewardDescriptionString="Holiday Shopping | Companion | Precious"
   ChanceDropIconURLs(0)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
   ChanceDropIconURLs(1)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
   ChanceDropDescriptionStrings(0)="Krampus Ticket"
   ChanceDropDescriptionStrings(1)="Krampus Golden Ticket"
   IconURL="Xmas2021_UI.KF2_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFXSpecialEventObjectivesContainer_Xmas2021"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
