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
    SCU_MKB,
    SCU_ChainBat,
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
var OnlineSubsystem MyOnlineSubsystem;
var const bool bDebugUnlocks;

// Export UKFUnlockManager::execInitSharedUnlocksFor(FFrame&, void* const)
native static function InitSharedUnlocksFor(KFPlayerReplicationInfo PRI);

// Export UKFUnlockManager::execIsSharedContentUnlocked(FFrame&, void* const)
native static function bool IsSharedContentUnlocked(KFUnlockManager.ESharedContentUnlock UnlockId);

// Export UKFUnlockManager::execGetObjectiveItemGranted(FFrame&, void* const)
native static function bool GetObjectiveItemGranted(KFUnlockManager.ESharedContentUnlock UnlockId);

// Export UKFUnlockManager::execGetSharedContentPlayerList(FFrame&, void* const)
native static function GetSharedContentPlayerList(KFUnlockManager.ESharedContentUnlock UnlockId, out array<PlayerReplicationInfo> out_PRIArray);

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

static event bool GetHeadShotEffectAvailable(int Id)
{
    return GetIDAvailable(Id);
}

static event bool GetAvailableCharacterArchetype(KFCharacterInfo_Human Archetype)
{
    return GetAvailable((Archetype));
}

static function bool GetAvailable(KFUnlockableAsset Asset)
{
    if((!Class'GameEngine'.static.IsGameFullyInstalled() && string(Asset.Name) != "CHR_MrFoster_archetype") && string(Asset.Name) != "CHR_Ana_Archetype")
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
    SharedContentList(2)=(Name=KFWeap_AssaultRifle_MKB42,IconPath="WEP_UI_MKB42_TEX.UI_WeaponSelect_MKB42",Id=6456)
    SharedContentList(3)=(Name=KFWeap_Blunt_ChainBat,IconPath="Wep_UI_ChainBat_TEX.UI_WeaponSelect_RRChainbat",Id=300380)
}