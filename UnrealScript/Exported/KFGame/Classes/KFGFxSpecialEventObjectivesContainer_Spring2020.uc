class KFGFxSpecialEventObjectivesContainer_Spring2020 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Failed Experiments",DescriptionString="Kill 1500 Zeds on any map")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Lapse",DescriptionString="Complete the Weekly on Biolapse")
   SpecialEventObjectiveInfoList(2)=(TitleString="Blender Blunder",DescriptionString="Use the blood blender to kill 20 Zeds on Biolapse")
   SpecialEventObjectiveInfoList(3)=(TitleString="It's a Trap!",DescriptionString="Use the trap doors to kill 20 Zeds on Biolapse")
   SpecialEventObjectiveInfoList(4)=(TitleString="Deadly Relapse",DescriptionString="Defeat any boss on Survival Hard or higher difficulty on Biolapse")
   ObjectiveIconURLs(0)="Spring_UI.UI_Objectives_Spring_1500ZEDs"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="Spring_UI.UI_Objectives_Spring_BloodBlender"
   ObjectiveIconURLs(3)="Spring_UI.UI_Objectives_Spring_TrapDoor"
   ObjectiveIconURLs(4)="Spring_UI.UI_Objectives_Spring_BiolapseBoss"
   AllCompleteRewardIconURL="WEP_SkinSet28_Item_TEX.dynamic_aa12.AA12_JaegerDynamic_Mint_large"
   AllCompleteRewardDescriptionString="AA12 Dynamic Double Bundle Skins"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Cyberpunk Ticket"
   ChanceDropDescriptionStrings(1)="Cyperpunk Golden Ticket"
   IconURL="Spring_UI.KF2_Spring_NeonNightmares_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxSpecialEventObjectivesContainer_Spring2020"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
