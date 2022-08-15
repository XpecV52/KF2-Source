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

/** Cache a copy of the online subsystem (save to class default)*/
var OnlineSubsystem MyOnlineSubsystem;

/** Unlock cosmetics in dev build */
var const bool bDebugUnlocks;

/** Pseudo-appid that, if an asset is set to unlock by this appid, will unlock the asset when the user is a member
    of the Killing Floor 2 steam group */
var const int SteamGroupAppId;

cpptext
{
	/** Checks if a Steam AppID is owned by the logged-in player */
	UBOOL GetAppIDAvailable(INT ID);

	/** Check if a Steam inventory item is owned by the logged-in player */
	UBOOL GetInventoryIDAvailable(INT ID);

	/** TRUE if this PRI is valid for shared content unlock */
	UBOOL CanShareContent(APlayerReplicationInfo* PRI);
	/** return TRUE if the UnlockId bit is set for a given set of flags */
	UBOOL CheckSharedUnlock(BYTE UnlockFlags, BYTE UnlockId);

	/** Steam Id of the Killing Floor 2 group */
	static const FUniqueNetId KF2Group;
}

/****************************************************************************************
* Shared Weapon Unlocks
*****************************************************************************************/

/** 
 * Called once per PRI to set up shared weapon content 
 * Network: Local Player
 */
static native function 		InitSharedUnlocksFor(KFPlayerReplicationInfo PRI);

/** 
 * returns TRUE if any player on this server has this unlock 
 * Network: All
 */
static native function bool IsSharedContentUnlocked(ESharedContentUnlock UnlockId);

/** 
 * returns a list of all available (aka connected ) players with a given unlock 
 * Network: All
 */
static native function 		GetSharedContentPlayerList(ESharedContentUnlock UnlockId, out array<PlayerReplicationInfo> out_PRIArray);

/****************************************************************************************
* Character Unlocks
*****************************************************************************************/

/** Returns whether a unique numeric ID is unlocked. Zero is always unlocked. */
static native private function bool GetIDAvailable(INT ID);

static function bool GetWeaponSkinAvailable(INT ID)
{
	return GetIDAvailable(ID);
}

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
	local int i;

	for( i = 0; i < Asset.SkinVariations.Length; ++i)
	{
		// unlock if it has at least one available skin
		if ( GetIDAvailable(Asset.SkinVariations[i].UnlockAssetId) )
		{
			return TRUE;
		}
	}

	return false;
}

/** Returns whether a character accessory or head variant is unlocked and available for use */
static function bool GetAvailableAttachment(const out AttachmentVariants Asset)
{
	local int i;

	for( i = 0; i < Asset.SkinVariations.Length; ++i)
	{
		// unlock if it has at least one available skin
		if ( GetIDAvailable(Asset.SkinVariations[i].UnlockAssetId) )
		{
			return TRUE;
		}
	}

	return false;
}

/** Checks to see that all cosmetic items for this character are owned */
static private event bool CheckCustomizationOwnership(KFPlayerReplicationInfo PRI)
{
	local KFCharacterInfo_Human CharArch;
	local OutfitVariants Outfit;
	local SkinVariant Skin;
	local AttachmentVariants Attachment;
	local int i;

	CharArch = PRI.CharacterArchetypes[PRI.RepCustomizationInfo.CharacterIndex];

	if ( CharArch != None )
	{
		// body
		Outfit = CharArch.BodyVariants[PRI.RepCustomizationInfo.BodyMeshIndex];
		Skin = Outfit.SkinVariations[PRI.RepCustomizationInfo.BodySkinIndex];
 		/*if( !GetIDAvailable(Outfit.UnlockAssetID) )
 		{
 			ClearCharacterCustomization(PRI);
 			return FALSE;
 		}
 		else*/ if( !GetIDAvailable(Skin.UnlockAssetID)  )
 		{
 			ClearCharacterCustomization(PRI);
 			return FALSE;
 		}

 		// head
 		Outfit = CharArch.HeadVariants[PRI.RepCustomizationInfo.HeadMeshIndex];
		Skin = Outfit.SkinVariations[PRI.RepCustomizationInfo.HeadSkinIndex];
 		/*if( !GetIDAvailable(Outfit.UnlockAssetID) )
 		{
 			ClearCharacterCustomization(PRI);
 			return FALSE;
 		}
 		else*/ if( !GetIDAvailable(Skin.UnlockAssetID) )
 		{
 			ClearCharacterCustomization(PRI);
 			return FALSE;
 		}

 		// accessory
		for( i=0; i < `MAX_COSMETIC_ATTACHMENTS; i++ )
		{
			if ( PRI.RepCustomizationInfo.AttachmentMeshIndices[i] != `CLEARED_ATTACHMENT_INDEX )
			{
				Attachment = CharArch.CosmeticVariants[PRI.RepCustomizationInfo.AttachmentMeshIndices[i]];
				Skin = Attachment.SkinVariations[PRI.RepCustomizationInfo.AttachmentSkinIndices[i]];
				if( !GetIDAvailable(Skin.UnlockAssetID) )
				{
 					ClearCharacterCustomization(PRI);
 					return FALSE;
				}				
			}
		}
	}

	return TRUE;
}

static native private function ClearCharacterCustomization(KFPlayerReplicationInfo PRI);

/****************************************************************************************
* Debugging
*****************************************************************************************/

static native function TestSteamAPI(PlayerReplicationInfo PRI, byte CallFlags);

defaultproperties
{
	SharedContentList(SCU_Zweihander)=(Name=KFWeap_Edged_Zweihander,IconPath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander",ID=219640)
	SteamGroupAppId=1
}