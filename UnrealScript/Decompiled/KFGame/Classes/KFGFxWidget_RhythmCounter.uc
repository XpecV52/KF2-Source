/*******************************************************************************
 * KFGFxWidget_RhythmCounter generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxWidget_RhythmCounter extends GFxObject within GFxMoviePlayer;

function SetCount(int Count)
{
    SetInt("count", Count);
    SetBonusPercentage(float(Count) / float(Class'KFPerk_Gunslinger'.static.GetMaxHeadShotsValue()));
}

function SetBonusPercentage(float NewValue)
{
    SetFloat("bonusPercentage", NewValue);
}
