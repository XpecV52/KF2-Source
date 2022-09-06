class KFGFxSpecialEventObjectivesContainer_Summer2020 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Shiver Me Timbers!",DescriptionString="Kill 15 Bosses on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Ahoy",DescriptionString="Complete the Weekly on Desolation")
   SpecialEventObjectiveInfoList(2)=(TitleString="Yarr! Light It Up!",DescriptionString="Activate the power generator on Desolation")
   SpecialEventObjectiveInfoList(3)=(TitleString="Full of Doubloons",DescriptionString="Earn 75,000 Dosh through kills, rewards and healing on Desolation")
   SpecialEventObjectiveInfoList(4)=(TitleString="Endless Plunder",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Desolation")
   ObjectiveIconURLs(0)="Texture2D'Xmas_UI.UI_Objectives_Xmas_25Bosses'"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="Summer2020_UI.UI_Objectives_Sumer2020_LightUp"
   ObjectiveIconURLs(3)="Summer2020_UI.UI_Objectives_Summer2020_FullDoublons"
   ObjectiveIconURLs(4)="Summer2020_UI.UI_Objectives_Summer20_EndlessPlunder"
   AllCompleteRewardIconURL="CHR_CosmeticSet24_Item_TEX.spacepiratespacemonkeybackpack.SpacePirateSpaceMonkeyBackPack_Precious_large"
   AllCompleteRewardDescriptionString="Space Pirate | Space Monkey Backpack"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Summer Ticket"
   ChanceDropDescriptionStrings(1)="Summer Golden Ticket"
   IconURL="Summer2020_UI.KF2_Summer_PerilousPlunder_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=()
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFxSpecialEventObjectivesContainer_Summer2020"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
