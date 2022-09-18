/*******************************************************************************
 * KFUnlockManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFUnlockManager extends Object
    abstract
    native;

enum ESharedContentUnlock
{
    SCU_None,
    SCU_Zweihander,
    SCU_ChainBat,
    SCU_ChiappaRhino,
    SCU_IonThruster,
    SCU_MosinNagant,
    SCU_G18RiotShield,
    SCU_CompoundBow,
    SCU_G18C,
    SCU_Blunderbuss,
    SCU_Minigun,
    SCU_MineReconstructor,
    SCU_FrostFang,
    SCU_GravityImploder,
    SCU_FAMAS,
    SCU_Thermite,
    SCU_BladedPistol,
    SCU_ParasiteImplanter,
    SCU_Doshinegun,
    SCU_MAX
};

enum EPlatformRestriction
{
    PR_All,
    PR_XboxOne,
    PR_PC,
    PR_PS4,
    PR_Console,
    PR_MAX
};

struct native SharedContent
{
    var name Name;
    var string IconPath;
    var int Id;

    structdefaultproperties
    {
        Name=None
        IconPath=""
        Id=0
    }
};

var array<SharedContent> SharedContentList;
var array<OnlineCrossTitleContent> CrossTitleContent;
var OnlineSubsystem MyOnlineSubsystem;
var const bool bDebugUnlocks;

// Export UKFUnlockManager::execInitSharedUnlocksFor(FFrame&, void* const)
native static function InitSharedUnlocksFor(KFPlayerReplicationInfo PRI, const optional out array<OnlineCrossTitleContent> InCrossTitleContent);

// Export UKFUnlockManager::execIsSharedContentUnlocked(FFrame&, void* const)
native static function bool IsSharedContentUnlocked(int UnlockId);

// Export UKFUnlockManager::execGetObjectiveItemGranted(FFrame&, void* const)
native static function bool GetObjectiveItemGranted(int UnlockId);

// Export UKFUnlockManager::execGetSharedContentPlayerList(FFrame&, void* const)
native static function GetSharedContentPlayerList(int UnlockId, out array<PlayerReplicationInfo> out_PRIArray);

// Export UKFUnlockManager::execIsPlatformRestricted(FFrame&, void* const)
native static function bool IsPlatformRestricted(KFUnlockManager.EPlatformRestriction PlatformRestrictionType);

// Export UKFUnlockManager::execGetIDAvailable(FFrame&, void* const)
private native static final function bool GetIDAvailable(int Id);

static function bool GetWeaponSkinAvailable(int Id)
{
    return GetIDAvailable(Id);
}

static event bool GetEmoteAvailable(int Id)
{
    return GetIDAvailable(Id);
}

static final event bool GetHeadShotEffectAvailable(int Id)
{
    return GetIDAvailable(Id);
}

static event bool GetAvailableCharacterArchetype(KFCharacterInfo_Human Archetype)
{
    return GetAvailable((Archetype));
}

static function bool GetAvailable(KFUnlockableAsset Asset)
{
    if(!Class'GameEngine'.static.IsGameFullyInstalled() && string(Asset.Name) != "CHR_MrFoster_archetype")
    {
        return false;
    }
    return GetIDAvailable(Asset.GetAssetId());
}

static function bool GetAvailableSkin(const out SkinVariant Asset)
{
    return GetIDAvailable(Asset.UnlockAssetID);
}

static function bool GetAvailableOutfit(const out OutfitVariants Asset)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < Asset.SkinVariations.Length)
    {
        if(GetIDAvailable(Asset.SkinVariations[I].UnlockAssetID))
        {
            return true;
        }
        ++ I;
        goto J0x0B;
    }
    return false;
}

static function bool GetAvailableAttachment(const out AttachmentVariants Asset)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < Asset.AttachmentItem.SkinVariations.Length)
    {
        if(GetIDAvailable(Asset.AttachmentItem.SkinVariations[I].UnlockAssetID))
        {
            return true;
        }
        ++ I;
        goto J0x0B;
    }
    return false;
}

private static final event bool CheckCustomizationOwnership(KFPlayerReplicationInfo PRI)
{
    local KFCharacterInfo_Human CharArch;
    local OutfitVariants Outfit;
    local SkinVariant Skin;
    local AttachmentVariants Attachment;
    local int I;

    CharArch = PRI.CharacterArchetypes[PRI.RepCustomizationInfo.CharacterIndex];
    if(CharArch != none)
    {
        Outfit = CharArch.BodyVariants[PRI.RepCustomizationInfo.BodyMeshIndex];
        Skin = Outfit.SkinVariations[PRI.RepCustomizationInfo.BodySkinIndex];
        if(!GetIDAvailable(Skin.UnlockAssetID))
        {
            ClearCharacterCustomization(PRI);
            return false;
        }
        Outfit = CharArch.HeadVariants[PRI.RepCustomizationInfo.HeadMeshIndex];
        Skin = Outfit.SkinVariations[PRI.RepCustomizationInfo.HeadSkinIndex];
        if(!GetIDAvailable(Skin.UnlockAssetID))
        {
            ClearCharacterCustomization(PRI);
            return false;
        }
        I = 0;
        J0x258:

        if(I < 3)
        {
            if(((I == 2) && PRI.WorldInfo.GRI.IsA('KFGameReplicationInfo_WeeklySurvival')) && Class'KFGameEngine'.static.GetWeeklyEventIndexMod() == 12)
            {                
            }
            else
            {
                if(PRI.RepCustomizationInfo.AttachmentSkinIndices[I] == -1)
                {                    
                }
                else
                {
                    Attachment = CharArch.CosmeticVariants[PRI.RepCustomizationInfo.AttachmentMeshIndices[I]];
                    if(Attachment.AttachmentItem == none)
                    {
                        return false;
                    }
                    Skin = Attachment.AttachmentItem.SkinVariations[PRI.RepCustomizationInfo.AttachmentSkinIndices[I]];
                    if(!GetIDAvailable(Skin.UnlockAssetID))
                    {
                        ClearCharacterCustomization(PRI);
                        return false;
                    }
                }
            }
            ++ I;
            goto J0x258;
        }
    }
    return true;
}

// Export UKFUnlockManager::execClearCharacterCustomization(FFrame&, void* const)
private native static final function ClearCharacterCustomization(KFPlayerReplicationInfo PRI);

// Export UKFUnlockManager::execTestSteamAPI(FFrame&, void* const)
native static function TestSteamAPI(PlayerReplicationInfo PRI, byte CallFlags);

defaultproperties
{
    SharedContentList(0)=(Name=None,IconPath="",Id=0)
    SharedContentList(1)=(Name=KFWeap_Edged_Zweihander,IconPath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander",Id=219640)
    SharedContentList(2)=(Name=KFWeap_Blunt_ChainBat,IconPath="Wep_UI_ChainBat_TEX.UI_WeaponSelect_RRChainbat",Id=300380)
    SharedContentList(3)=(Name=KFWeap_Pistol_ChiappaRhino,IconPath="Wep_UI_ChiappaRhino_TEX.UI_WeaponSelect_ChiappaRhinos",Id=7704)
    SharedContentList(4)=(Name=KFWeap_Edged_IonThruster,IconPath="WEP_UI_Ion_Sword_TEX.UI_WeaponSelect_IonSword",Id=7715)
    SharedContentList(5)=(Name=KFWeap_Rifle_MosinNagant,IconPath="wep_ui_mosin_tex.UI_WeaponSelect_MosinNagant",Id=7856)
    SharedContentList(6)=(Name=KFWeap_SMG_G18,IconPath="WEP_UI_RiotShield_TEX.UI_WeaponSelect_RiotShield",Id=7850)
    SharedContentList(7)=(Name=KFWeap_Bow_CompoundBow,IconPath="WEP_UI_CompoundBow_TEX.UI_WeaponSelect_Compound_Bow",Id=8169)
    SharedContentList(8)=(Name=KFWeap_Pistol_G18C,IconPath="wep_ui_g18c_tex.UI_WeaponSelect_G18C",Id=8293)
    SharedContentList(9)=(Name=KFWeap_Pistol_Blunderbuss,IconPath="WEP_UI_Blunderbuss_TEX.UI_WeaponSelect_BlunderBluss",Id=8299)
    SharedContentList(10)=(Name=KFWeap_Minigun,IconPath="WEP_UI_Minigun_TEX.UI_WeaponSelect_Minigun",Id=8478)
    SharedContentList(11)=(Name=KFWeap_Mine_Reconstructor,IconPath="WEP_UI_Mine_Reconstructor_TEX.UI_WeaponSelect_HMTechMineReconstructor",Id=8472)
    SharedContentList(12)=(Name=KFWeap_Rifle_FrostShotgunAxe,IconPath="WEP_UI_Frost_Shotgun_Axe_TEX.UI_WeaponSelect_FrostGun",Id=8609)
    SharedContentList(13)=(Name=KFWeap_GravityImploder,IconPath="WEP_UI_Gravity_Imploder_TEX.UI_WeaponSelect_Gravity_Imploder",Id=8778)
    SharedContentList(14)=(Name=KFWeap_AssaultRifle_FAMAS,IconPath="WEP_UI_Famas_TEX.UI_WeaponSelect_Famas",Id=8934)
    SharedContentList(15)=(Name=KFWeap_RocketLauncher_ThermiteBore,IconPath="WEP_UI_Thermite_TEX.UI_WeaponSelect_Thermite",Id=8940)
    SharedContentList(16)=(Name=KFWeap_Pistol_Bladed,IconPath="WEP_UI_BladedPistol_TEX.UI_WeaponSelect_BladedPistol",Id=9126)
    SharedContentList(17)=(Name=KFWeap_Rifle_ParasiteImplanter,IconPath="WEP_UI_ParasiteImplanter_TEX.UI_WeaponSelect_ParasiteImplanter",Id=9132)
    SharedContentList(18)=(Name=KFWeap_AssaultRifle_Doshinegun,IconPath="WEP_UI_Doshinegun_TEX.UI_Weapon_Select_Doshinegun",Id=9275)
}