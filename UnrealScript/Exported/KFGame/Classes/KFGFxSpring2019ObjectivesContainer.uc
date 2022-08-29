class KFGFxSpring2019ObjectivesContainer extends KFGFxSpecialEventObjectivesContainer;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
}

defaultproperties
{
   CurrentSpecialEventString="A time limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Boss Rush",DescriptionString="Kill 15 bosses on any map")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Spillway",DescriptionString="Complete the Weekly on Spillway")
   SpecialEventObjectiveInfoList(2)=(TitleString="Exterminator",DescriptionString="Kill 1500 Zeds on any map")
   SpecialEventObjectiveInfoList(3)=(TitleString="Endless Spillway",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Spillway")
   SpecialEventObjectiveInfoList(4)=(TitleString="Spilling Blood",DescriptionString="Defeat any boss on Survival Hard or higher difficulty on Spillway")
   ObjectiveIconURLs(0)="Xmas_UI.UI_Objectives_Xmas_25Bosses"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="Spring_UI.UI_Objectives_Spring_1500ZEDs"
   ObjectiveIconURLs(3)="Spring_UI.UI_Objectives_Spring_SpillwayEndless"
   ObjectiveIconURLs(4)="Spring_UI.UI_Objectives_Spring_SpillwayBoss"
   AllCompleteRewardIconURL="CHR_Cyberpunk_Item_TEX.Uniform_Cyberpunk"
   AllCompleteRewardDescriptionString="Male and Female Cyberpunk Outfits"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Prize Ticket"
   ChanceDropDescriptionStrings(1)="Gold Ticket"
   IconURL="Spring_UI.KF2_CyberRevolt_Logo_Small"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=()
   UsesProgressList(4)=()
   Name="Default__KFGFxSpring2019ObjectivesContainer"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
