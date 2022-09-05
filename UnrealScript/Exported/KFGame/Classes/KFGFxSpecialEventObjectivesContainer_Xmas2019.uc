class KFGFxSpecialEventObjectivesContainer_Xmas2019 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Black Seas of Infinity",DescriptionString="Defeat any boss on Survival Hard or Higher difficulty on Sanitarium")
   SpecialEventObjectiveInfoList(1)=(TitleString="Extravagant Imagination",DescriptionString="Use the Tentacle Whip trap to kill 20 Zeds on Sanitarium")
   SpecialEventObjectiveInfoList(2)=(TitleString="Eldritch Contradictions",DescriptionString="Use the Suction Trap to kill 20 Zeds on Sanitarium")
   SpecialEventObjectiveInfoList(3)=(TitleString="Maternal Instincts",DescriptionString="Kill the Matriarch 10 times on any map or game mode")
   SpecialEventObjectiveInfoList(4)=(TitleString="Settling a Family Affair",DescriptionString="Complete Biotics Lab on Objective Hard or higher difficulty")
   ObjectiveIconURLs(0)="Xmas_UI.UI_Objectives_Xmas_BossKill02"
   ObjectiveIconURLs(1)="Xmas_UI.UI_Objectives_Xmas_TentacleWhip"
   ObjectiveIconURLs(2)="Xmas_UI.UI_Objectives_Xmas_SuctionTrap"
   ObjectiveIconURLs(3)="Xmas_UI.UI_Objectives_Xmas_Matriarch"
   ObjectiveIconURLs(4)="Xmas_UI.UI_Objectives_Xmas_BioticsObj"
   AllCompleteRewardIconURL="WEP_SkinSet27_Item_TEX.fnfal_dynamic.FNFAL_JaegerDynamic_Mint_large"
   AllCompleteRewardDescriptionString="FN FAL | Jaeger | Dynamic"
   ChanceDropIconURLs(0)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
   ChanceDropIconURLs(1)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
   ChanceDropDescriptionStrings(0)="Krampus Ticket"
   ChanceDropDescriptionStrings(1)="Krampus Golden Ticket"
   IconURL="Xmas_UI.KF2_Xmas_YuletideHorror_Logo_Small"
   UsesProgressList(1)=True
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxSpecialEventObjectivesContainer_Xmas2019"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
