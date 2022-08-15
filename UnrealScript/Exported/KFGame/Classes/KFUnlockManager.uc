//=============================================================================
// KFUnlockManager
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFUnlockManager extends Object
	abstract
    native
    dependson(KFCharacterInfo_Human);

enum ESharedContentUnlock
{
	SCU_None,
	SCU_Zweihander,
};

struct native SharedContent
{
	var name Name;
	var string IconPath;
	var int ID;
};

/** contains ids (app or microtrans) to unlock this content */
var array<SharedContent> SharedContentList;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Debugging */
static native function TestSteamAPI(PlayerReplicationInfo PRI, byte CallFlags);

/** Called once per PRI to set up shared weapon content */
static native function 		InitSharedUnlocksFor(KFPlayerReplicationInfo PRI);
/** returns TRUE if any player on this server has this unlock */
static native function bool IsSharedContentUnlocked(ESharedContentUnlock UnlockId);
/** returns a list of all available (aka connected ) players with a given unlock */
static native function 		GetSharedContentPlayerList(ESharedContentUnlock UnlockId, out array<PlayerReplicationInfo> out_PRIArray);

/** Returns whether a unique numeric ID is unlocked. Zero is always unlocked. */
static native private function bool GetIDAvailable(INT ID);

/** Returns whether a UObject asset is unlocked and available for use */
static function bool GetAvailable(KFUnlockableAsset Asset)
{
	return GetIDAvailable(Asset.GetAssetId());
}

/** Returns whether a character skin variant is unlocked and available for use */
static function bool GetAvailableSkin(const out SkinVariant Asset)
{
	return GetIDAvailable(Asset.UnlockAssetID);
}

/** Returns whether a character outfit variant is unlocked and available for use */
static function bool GetAvailableOutfit(const out OutfitVariants Asset)
{
	return GetIDAvailable(Asset.UnlockAssetID);
}

/** Returns whether a character accessory or head variant is unlocked and available for use */
static function bool GetAvailableAttachment(const out AttachmentVariants Asset)
{
	return GetIDAvailable(Asset.UnlockAssetID);
}

defaultproperties
{
   SharedContentList(1)=(Name="KFWeap_Edged_Zweihander",IconPath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander",Id=219640)
   Name="Default__KFUnlockManager"
   ObjectArchetype=Object'Core.Default__Object'
}
