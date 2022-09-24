class KFGFXSpecialEventObjectivesContainer_Fall2022 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Creatures of Darkness",DescriptionString="Kill 15 Bosses on any map or mode")
   SpecialEventObjectiveInfoList(1)=(TitleString="Weekly Witchcraft",DescriptionString="Complete the Weekly on Barmwich Town")
   SpecialEventObjectiveInfoList(2)=(TitleString="Elemental Medallions",DescriptionString="Open the Weapon Room")
   SpecialEventObjectiveInfoList(3)=(TitleString="Zeds On Fire",DescriptionString="Make 50 Zeds to pass through the bonfires of Barmwich Town")
   SpecialEventObjectiveInfoList(4)=(TitleString="Long Night of Witches",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Barmwich Town")
   ObjectiveIconURLs(0)="Halloween2022_UI.UI_Objectives_Halloween2022_CreaturesInDarkness"
   ObjectiveIconURLs(1)="Spring_UI.UI_Objectives_Spring_Weekly"
   ObjectiveIconURLs(2)="Halloween2022_UI.UI_Objetives_Halloween2022_ElementalMedallions"
   ObjectiveIconURLs(3)="Halloween2022_UI.UI_Objectives_Halloween2022_ZedOnFire"
   ObjectiveIconURLs(4)="Halloween2022_UI.UI_Objetives_Halloween2022_LongNightofWitches"
   AllCompleteRewardIconURL="CHR_PlagueDoctorUniform_Item_TEX.potionbackpack.plaguedoctorbackpack_precious_large"
   AllCompleteRewardDescriptionString="Plague Doctor | Backpack | Precious"
   ChanceDropIconURLs(0)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket"
   ChanceDropIconURLs(1)="CHR_CosmeticSet14_Item_TEX.Tickets.CyberPunk_ticket_golden"
   ChanceDropDescriptionStrings(0)="Halloween Ticket"
   ChanceDropDescriptionStrings(1)="Halloween Golden Ticket"
   IconURL="halloween2022_ui.KF2_Halloween_BloodandBonfires_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=()
   UsesProgressList(2)=()
   UsesProgressList(3)=True
   UsesProgressList(4)=()
   Name="Default__KFGFXSpecialEventObjectivesContainer_Fall2022"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
