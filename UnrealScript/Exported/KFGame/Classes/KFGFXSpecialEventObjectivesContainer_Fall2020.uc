class KFGFXSpecialEventObjectivesContainer_Fall2020 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="An Infernal Legion",DescriptionString="Kill 2000 Zeds on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Invasion",DescriptionString="Complete Weekly on Hellmark Station")
   SpecialEventObjectiveInfoList(2)=(TitleString="At Any Cost",DescriptionString="Get the Hellish Rage from a Hellmark Station Obelisk 10 times")
   SpecialEventObjectiveInfoList(3)=(TitleString="Demon Slayer",DescriptionString="Decapitate 600 Zeds on Hellmark Station")
   SpecialEventObjectiveInfoList(4)=(TitleString="Inexhaustible Chaos",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Hellmark Station")
   ObjectiveIconURLs(0)="Halloween_UI.UI_Objectives_Halloween2020_InfernalLegion"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="Halloween_UI.UI_Objectives_Halloween2020_AtAnyCost"
   ObjectiveIconURLs(3)="Halloween_UI.UI_Objectives_Halloween2020_DemonSlayer"
   ObjectiveIconURLs(4)="Halloween_UI.UI_Objectives_Halloween2020_InexhaustibleChaos"
   AllCompleteRewardIconURL="CHR_CosmeticSet_Halloween_04_Item_TEX.halloweenvoodoobackpack.halloweenvoodoobackpack_precious_large"
   AllCompleteRewardDescriptionString="Halloween | Voodoo Backpack"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Halloween Ticket"
   ChanceDropDescriptionStrings(1)="Halloween Golden Ticket"
   IconURL="Halloween_UI.KF2_Halloween_InfernalInsurrection_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=True
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFXSpecialEventObjectivesContainer_Fall2020"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
