/*******************************************************************************
 * KFPerk_SWAT generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPerk_SWAT extends KFPerk
    config(Game)
    hidecategories(Navigation,Movement,Collision);

defaultproperties
{
    ProgressStatID=90
    PerkBuildStatID=91
    PerkName="SWAT"
    PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_SWAT'
    PrimaryWeaponClassName="KFGameContent.KFWeap_SMG_P90"
    MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Commando"
}