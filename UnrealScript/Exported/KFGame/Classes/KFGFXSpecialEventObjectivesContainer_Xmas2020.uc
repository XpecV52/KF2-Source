class KFGFXSpecialEventObjectivesContainer_Xmas2020 extends KFGFxSpecialEventObjectivesContainer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
   CurrentSpecialEventString="A time-limited special event with exclusive items"
   SpecialEventObjectiveInfoList(0)=(TitleString="Frozen Roses",DescriptionString="Collect 3 roses in Elysium")
   SpecialEventObjectiveInfoList(1)=(TitleString="Four Different Tales",DescriptionString="Collect 4 tomes in Elysium")
   SpecialEventObjectiveInfoList(2)=(TitleString="Under the Mistletoe",DescriptionString="Complete one wave in Elysium's Botanica arena")
   SpecialEventObjectiveInfoList(3)=(TitleString="A Christmas Carol",DescriptionString="Complete one wave in Elysium's Loremaster Sanctum arena")
   SpecialEventObjectiveInfoList(4)=(TitleString="Everlasting Winter",DescriptionString="Complete wave 15 on Endless Hard or higher difficulty on Elysium")
   ObjectiveIconURLs(0)="Xmas_UI.UI_Objectives_Christmas2020_FrozenRoses"
   ObjectiveIconURLs(1)="Xmas_UI.UI_Objectives_Christmas2020_FourDifferentTales"
   ObjectiveIconURLs(2)="Xmas_UI.UI_Objectives_Christmas2020_UnderTheMistletoe"
   ObjectiveIconURLs(3)="Xmas_UI.UI_Objectives_Christmas2020_AChristmasCarol"
   ObjectiveIconURLs(4)="Xmas_UI.UI_Objectives_Christmas2020_EverlastingWinter"
   AllCompleteRewardIconURL="CHR_CosmeticSet_XMAS_04_Item_TEX.tacticalelfpack.tacticalelfpack_precious_large"
   AllCompleteRewardDescriptionString="Christmas | Tactical Elf-pack"
   ChanceDropIconURLs(0)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket"
   ChanceDropIconURLs(1)="CHR_Cosmetic_XMAS_Item_TEX.Tickets.Krampus_Ticket_Golden"
   ChanceDropDescriptionStrings(0)="Krampus Ticket"
   ChanceDropDescriptionStrings(1)="Krampus Golden Ticket"
   IconURL="Xmas_UI.KF2_Christmas_ChristmasCrackdown_SmallLogo"
   UsesProgressList(0)=True
   UsesProgressList(1)=True
   UsesProgressList(2)=()
   UsesProgressList(3)=()
   UsesProgressList(4)=()
   Name="Default__KFGFXSpecialEventObjectivesContainer_Xmas2020"
   ObjectArchetype=KFGFxSpecialEventObjectivesContainer'KFGame.Default__KFGFxSpecialEventObjectivesContainer'
}
