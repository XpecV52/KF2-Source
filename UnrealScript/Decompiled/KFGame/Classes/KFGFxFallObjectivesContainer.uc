/*******************************************************************************
 * KFGFxFallObjectivesContainer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxFallObjectivesContainer extends KFGFxSpecialEventObjectivesContainer within GFxMoviePlayer;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
}

defaultproperties
{
    CurrentSpecialEventString="Complete the objectives in Monster Ball to earn rewards!"
    SpecialEventObjectiveInfoList(0)=(TitleString="Trick or Trap!",DescriptionString="Use traps to kill 25 Zeds in one game session",TierEventRewardName="")
    SpecialEventObjectiveInfoList(1)=(TitleString="Dead Men Tell No Tales",DescriptionString="Bust 10 glowing skull collectibles",TierEventRewardName="")
    SpecialEventObjectiveInfoList(2)=(TitleString="Monster Mash",DescriptionString="Kill 2500 Zeds",TierEventRewardName="")
    SpecialEventObjectiveInfoList(3)=(TitleString="Party All Night Long",DescriptionString="Complete wave 25 on Endless Hard or higher difficulty",TierEventRewardName="")
    SpecialEventObjectiveInfoList(4)=(TitleString="Lord of the Castle",DescriptionString="Defeat Count Hans on Survival Hard or higher difficulty",TierEventRewardName="")
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
    UsesProgressList(0)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(1)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(2)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(3)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    UsesProgressList(4)=
/* Exception thrown while deserializing UsesProgressList
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
}