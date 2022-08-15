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
    SCU_MAX
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

// Export UKFUnlockManager::execTestSteamAPI(FFrame&, void* const)
native static function TestSteamAPI(PlayerReplicationInfo PRI, byte CallFlags);

// Export UKFUnlockManager::execInitSharedUnlocksFor(FFrame&, void* const)
native static function InitSharedUnlocksFor(KFPlayerReplicationInfo PRI);

// Export UKFUnlockManager::execIsSharedContentUnlocked(FFrame&, void* const)
native static function bool IsSharedContentUnlocked(KFUnlockManager.ESharedContentUnlock UnlockId);

// Export UKFUnlockManager::execGetSharedContentPlayerList(FFrame&, void* const)
native static function GetSharedContentPlayerList(KFUnlockManager.ESharedContentUnlock UnlockId, out array<PlayerReplicationInfo> out_PRIArray);

// Export UKFUnlockManager::execGetIDAvailable(FFrame&, void* const)
private native static final function bool GetIDAvailable(int Id);

static function bool GetAvailable(KFUnlockableAsset Asset)
{
    return GetIDAvailable(Asset.GetAssetId());
}

static function bool GetAvailableSkin(const out SkinVariant Asset)
{
    return GetIDAvailable(Asset.UnlockAssetID);
}

static function bool GetAvailableOutfit(const out OutfitVariants Asset)
{
    return GetIDAvailable(Asset.UnlockAssetID);
}

static function bool GetAvailableAttachment(const out AttachmentVariants Asset)
{
    return GetIDAvailable(Asset.UnlockAssetID);
}

defaultproperties
{
    SharedContentList(0)=(Name=None,IconPath="",Id=0)
    SharedContentList(1)=(Name=KFWeap_Edged_Zweihander,IconPath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander",Id=219640)
}