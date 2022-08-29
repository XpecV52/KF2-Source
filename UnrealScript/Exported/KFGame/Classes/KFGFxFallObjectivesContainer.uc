class KFGFxFallObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="Complete the objectives in Monster Ball to earn rewards!"
   SpecialEventObjectiveInfoList(0)=(TitleString="Trick or Trap!",DescriptionString="Use traps to kill 25 Zeds in one game session")
   SpecialEventObjectiveInfoList(1)=(TitleString="Dead Men Tell No Tales",DescriptionString="Bust 10 glowing skull collectibles")
   SpecialEventObjectiveInfoList(2)=(TitleString="Monster Mash",DescriptionString="Kill 2500 Zeds")
   SpecialEventObjectiveInfoList(3)=(TitleString="Party All Night Long",DescriptionString="Complete wave 25 on Endless Hard or higher difficulty")
   SpecialEventObjectiveInfoList(4)=(TitleString="Lord of the Castle",DescriptionString="Defeat Count Hans on Survival Hard or higher difficulty")
   ObjectiveIconURLs(0)="Halloween_UI.UI_Objectives_Halloween_Trap"
   ObjectiveIconURLs(1)="Halloween_UI.UI_Objectives_Halloween_Collectible"
   ObjectiveIconURLs(2)="Halloween_UI.UI_Objectives_Halloween_500ZEDs"
   ObjectiveIconURLs(3)="Halloween_UI.UI_Objectives_Halloween_Wave25"
   ObjectiveIconURLs(4)="Halloween_UI.UI_Objectives_Halloween_HansKill"
   AllCompleteRewardIconURL="WEP_SkinSet_Halloween_Item_TEX.hans_mkb42h.MKB42_HalloweenPrecious_Mint"
   AllCompleteRewardDescriptionString="Hans' MKB: Weapon + Halloween Skin"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_Halloween_01_Item_TEX.hllwn_treat_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_Halloween_01_Item_TEX.hllwn_treat_ticket_precious"
   ChanceDropDescriptionStrings(0)="Prize Ticket"
   ChanceDropDescriptionStrings(1)="Gold Ticket"
   IconURL="Halloween_UI.KF2_HalloweenHorrors2018_Logo_UIBanner"
   UsesProgressList(2)=True
   UsesProgressList(3)=()
   UsesProgressList(4)=()
   Name="Default__KFGFxFallObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
