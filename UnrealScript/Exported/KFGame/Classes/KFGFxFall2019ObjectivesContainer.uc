class KFGFxFall2019ObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Asylum Assault",DescriptionString="Defeat any boss on Survival Hard or higher difficulty on Ashwood Asylum")
   SpecialEventObjectiveInfoList(1)=(TitleString="Long-term Treatment",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Ashwood Asylum")
   SpecialEventObjectiveInfoList(2)=(TitleString="Weekly Checkup",DescriptionString="Complete the Weekly on Ashwood Asylum")
   SpecialEventObjectiveInfoList(3)=(TitleString="Cleaning the Wards",DescriptionString="Kill 1500 Zeds on Ashwood Asylum")
   SpecialEventObjectiveInfoList(4)=(TitleString="Bombs Away!",DescriptionString="Complete Nuked on Objective Hard or higher difficulty")
   ObjectiveIconURLs(0)="Halloween_UI.UI_Objectives_Halloween_BossKill"
   ObjectiveIconURLs(1)="Halloween_UI.UI_Objectives_Halloween_AsylumEndless"
   ObjectiveIconURLs(2)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(3)="Halloween_UI.UI_Objectives_Halloween_1500ZEDs"
   ObjectiveIconURLs(4)="Halloween_UI.UI_Objectives_Halloween_NukedObj"
   AllCompleteRewardIconURL="WEP_SkinSet26_Item_TEX.kriss_spaceelite.Kriss_BeyondHorizonPrecious_Mint"
   AllCompleteRewardDescriptionString="Kriss | Beyond Horizon | Space Elite"
   ChanceDropIconURLs(0)="CHR_CosmeticSet_Halloween_01_Item_TEX.hllwn_treat_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet_Halloween_01_Item_TEX.hllwn_treat_ticket_precious"
   ChanceDropDescriptionStrings(0)="Treat Ticket"
   ChanceDropDescriptionStrings(1)="Golden Treat Ticket"
   IconURL="Halloween_UI.KF2_Halloween_GrimTreatments_Logo_Small"
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxFall2019ObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
