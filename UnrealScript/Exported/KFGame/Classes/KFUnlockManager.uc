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
	SCU_ChainBat,
	SCU_AbominationAxe
};


enum EPlatformRestriction
{
	PR_All,
	PR_XboxOne,
	PR_PC,
	PR_PS4,
	PR_Console,
};


struct native SharedContent
{
	var name Name;
	var string IconPath;
	var int ID;
};

/** contains ids (app or microtrans) to unlock this content */
var array<SharedContent> SharedContentList;

/** contains owned title information (will be empty on PC) */
var array<OnlineCrossTitleContent> CrossTitleContent;

/** Cache a copy of the online subsystem (save to class default)*/
var OnlineSubsystem MyOnlineSubsystem;

/** Unlock cosmetics in dev build */
var const bool bDebugUnlocks;

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
// (cpptext)
// (cpptext)
// (cpptext)

/****************************************************************************************
* Shared Weapon Unlocks
*****************************************************************************************/

/**
 * Called once per PRI to set up shared weapon content
 * Network: Local Player
 */
static native function 		InitSharedUnlocksFor(KFPlayerReplicationInfo PRI, optional const out array<OnlineCrossTitleContent> InCrossTitleContent);

/**
 * returns TRUE if any player on this server has this unlock
 * Network: All
 */
static native function bool IsSharedContentUnlocked(ESharedContentUnlock UnlockId);

/**
*Returns TRUE if a player has event weapon skin
*/
static native function bool GetObjectiveItemGranted(ESharedContentUnlock UnlockId);

/**
 * returns a list of all available (aka connected ) players with a given unlock
 * Network: All
 */
static native function 		GetSharedContentPlayerList(ESharedContentUnlock UnlockId, out array<PlayerReplicationInfo> out_PRIArray);



/****************************************************************************************
* Platform Restrictions
*****************************************************************************************/

/**
 * returns TRUE if the content is restricted for the current platform
 * Network: All
 */
static native function bool IsPlatformRestricted( EPlatformRestriction PlatformRestrictionType );


/****************************************************************************************
* Character Unlocks
*****************************************************************************************/

/** Returns whether a unique numeric ID is unlocked. Zero is always unlocked. */
static native private function bool GetIDAvailable(INT ID);

static function bool GetWeaponSkinAvailable(INT ID)
{
	return GetIDAvailable(ID);
}

static event bool GetEmoteAvailable( INT ID )
{
	return GetIDAvailable( ID );
}

static final event bool GetHeadShotEffectAvailable(INT ID)
{
	return GetIDAvailable(ID);
}

//@HSL_BEGIN - JRO - 5/12/2016 - Need a native accessor method. Can't make GetAvailable an event due to the KFUnlockableAsset being a non-native interface
static event bool GetAvailableCharacterArchetype(KFCharacterInfo_Human archetype)
{
	return GetAvailable(archetype);
}
//@HSL_END

/** Returns whether a UObject asset is unlocked and available for use */
static function bool GetAvailable(KFUnlockableAsset Asset)
{
	//@HSL_BEGIN - JRO - 5/12/2016 - Disable non-starter characters while installing
	if ( !class'GameEngine'.static.IsGameFullyInstalled() &&
		String(Asset.Name) != "CHR_MrFoster_archetype" &&
		String(Asset.Name) != "CHR_Ana_Archetype")
	{
		return false;
	}
	//@HSL_END
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

	for( i = 0; i < Asset.AttachmentItem.SkinVariations.Length; ++i)
	{
		// unlock if it has at least one available skin
		if ( GetIDAvailable(Asset.AttachmentItem.SkinVariations[i].UnlockAssetId) )
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
		for( i=0; i < 3; i++ )
		{
			if (PRI.RepCustomizationInfo.AttachmentSkinIndices[i] == INDEX_NONE)
			{
				continue;
			}
			
			Attachment = CharArch.CosmeticVariants[PRI.RepCustomizationInfo.AttachmentMeshIndices[i]];
			if (Attachment.AttachmentItem == None)
			{
				return FALSE;
			}
				
			Skin = Attachment.AttachmentItem.SkinVariations[PRI.RepCustomizationInfo.AttachmentSkinIndices[i]];
				
			if( !GetIDAvailable(Skin.UnlockAssetID) )
			{	
 				ClearCharacterCustomization(PRI);
 				return FALSE;
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
   SharedContentList(1)=(Name="KFWeap_Edged_Zweihander",IconPath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander",Id=219640)
   SharedContentList(2)=(Name="KFWeap_Blunt_ChainBat",IconPath="Wep_UI_ChainBat_TEX.UI_WeaponSelect_RRChainbat",Id=300380)
   SharedContentList(3)=(Name="KFWeap_Edged_AbominationAxe",IconPath="WEP_UI_KrampusAxe_TEX.UI_WeaponSelect_KrampusAxe",Id=5378)
   Name="Default__KFUnlockManager"
   ObjectArchetype=Object'Core.Default__Object'
}
