//=============================================================================
// KFGFxMenu_Store
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Zane Gholson -  09/17/2015
//=============================================================================

class KFGFxMenu_Store extends KFGFxObject_Menu
	native(UI);









const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157; 
const KFID_HideBossHealthBar = 158; 
const KFID_AntiMotionSickness = 159; 
const KFID_ShowWelderInInventory = 160; 
const KFID_AutoTurnOff = 161;			
const KFID_ReduceHightPitchSounds = 162; 
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID= 171;
const KFID_ToggleToRun=172;
const KFID_ClassicPlayerInfo=173;
const KFID_VOIPMicVolumeMultiplier = 174;
const KFID_GamepadDeadzoneScale = 175;
const KFID_GamepadAccelerationJumpScale = 176;
const KFID_HasTabbedToStore = 177;
#linenumber 14

var localized string ExitKF2;

/** Caches a local reference to the online subsystem */
var OnlineSubsystem				OnlineSub;

var KFGFxStoreContainer_Main 	MainContainer;
var KFGFxStoreContainer_Details DetailsContainer;
var KFGFxStoreContainer_Cart	CartContainer;

var GFxObject AddCartButton;

struct StoreItem
{
	var int 	SKU;
	var string 	ItemDesciption;
	var string 	IconLocation;
	var string 	ItemName;
	var float 	ItemPrice;
	var name 	ItemType;
};

var localized string StoreString;

enum ETitleStoreIconLocation
{
	ETSIL_BottomLeft,
	ETSIL_BottomCenter,
	ETSIL_BottomRight
};

native function bool ShowSystemStoreIcon(ETitleStoreIconLocation location);
native function bool HideSystemStoreIcon();

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu( InManager );

	LocalizeText();
	OnlineSub =  Class'GameEngine'.static.GetOnlineSubsystem();

	if( class'WorldInfo'.static.IsConsoleBuild() || class'WorldInfo'.static.IsEOSBuild() )
	{
		class'GameEngine'.static.GetPlayfabInterface().AddInventoryReadCompleteDelegate( OnReadPlayfabInventoryComplete );
	}
	else if( OnlineSub != none )
	{
		OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
	}
}

function OnOpen()
{
	local KFProfileSettings ProfileSettings;
	local bool bHasTabbedToStore;

	if( class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Orbis ) )
	{
		CheckForEmptyStore();
	}

	if( class'WorldInfo'.static.IsConsoleBuild() || class'WorldInfo'.static.IsEOSBuild() )
	{
		class'GameEngine'.static.GetPlayfabInterface().AddInventoryReadCompleteDelegate( OnReadPlayfabInventoryComplete );
	}
	else if( OnlineSub != none )
	{
		OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
	}
	
	ProfileSettings = Manager.CachedProfile;
	bHasTabbedToStore = ProfileSettings != none ? ProfileSettings.GetProfileInt(KFID_HasTabbedToStore) != 0 : false;
	if( Class'KFGameEngine'.static.IsSalesEventActive() && ProfileSettings != none && !bHasTabbedToStore )
	{
		ProfileSettings.SetProfileSettingValueInt(KFID_HasTabbedToStore, 1);
	}
	else if( !Class'KFGameEngine'.static.IsSalesEventActive() && Class'KFGameEngine'.static.IsSalesEventChecked() && ProfileSettings != none )
	{
		ProfileSettings.SetProfileSettingValueInt(KFID_HasTabbedToStore, 0);
	}

	RefreshItemList();

//	ShowSystemStoreIcon(ETSIL_BottomCenter);
}

function OnClose()
{
	if( class'WorldInfo'.static.IsConsoleBuild() || class'WorldInfo'.static.IsEOSBuild() )
	{
		class'GameEngine'.static.GetPlayfabInterface().ClearInventoryReadCompleteDelegate( OnReadPlayfabInventoryComplete );
	}
	else if( OnlineSub != none )
	{
		OnlineSub.ClearOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
	}

//	HideSystemStoreIcon();
}

function OnInventoryReadComplete()
{
	RefreshItemList();
}

function OnReadPlayfabInventoryComplete( bool bSuccess )
{
	if( bSuccess )
	{
		RefreshItemList();
	}
	else
	{
		Manager.DelayedOpenPopup(ENotification, EDPPID_Misc, class'KFCommon_LocalizedStrings'.default.NoticeString, class'KFCommon_LocalizedStrings'.default.FailedToReachInventoryServerString, class'KFCommon_LocalizedStrings'.default.OKString);
	}
}

function RefreshItemList()
{
	if(MainContainer != none)
	{
		MainContainer.SendItems(OnlineSub.ItemPropertiesList);
	}
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	
	LocalizedObject.SetString("store", class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango) ? ConsoleLocalize("StoreStringXB1") : StoreString); 

	SetObject("localizedText", LocalizedObject);
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{

	switch(WidgetName)
	{		
		case ('storeMainContainer'):
			if ( MainContainer == none )
			{
			    MainContainer = KFGFxStoreContainer_Main(Widget);
				MainContainer.Initialize( self );
				MainContainer.SendItems(OnlineSub.ItemPropertiesList);
		    }
         break;
        case ('storeCart'):
			if ( CartContainer == none )
			{
			    CartContainer = KFGFxStoreContainer_Cart(Widget);
				CartContainer.Initialize( self );
		    }
         break;
        case ('itemDetails'):
			if ( DetailsContainer == none )
			{
			    DetailsContainer = KFGFxStoreContainer_Details(Widget);
				DetailsContainer.Initialize( self );
				AddCartButton = DetailsContainer.GetObject("addCartButton");
		    }
         break;
    }

    return true;
}

function Callback_StoreSectionChanged(int FilterIndex)
{
	MainContainer.UpdateFilter(FilterIndex); 
}

function Callback_AddToCartClicked(int ItemSKU)
{
	local ItemProperties StoreItemDetails;

	if (OnlineSub != none)
	{
		StoreItemDetails = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', ItemSKU)];

		if (class'WorldInfo'.static.IsConsoleBuild())
		{
			if (StoreItemDetails.SignedOfferId != "")
			{
				if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango))
				{
					OnlineSub.PlayerInterfaceEx.ShowProductDetailsUI(GetLP().ControllerId, StoreItemDetails.ProductID);
				}
				else
				{
					OnlineSub.OpenMarketPlaceSearch(StoreItemDetails);
				}
			}
		}
		else if (StoreItemDetails.Price == "")
		{
			OnlineSub.OpenMarketPlaceSearch(StoreItemDetails);
		}
		else
		{
			OnlineSub.OpenItemPurchaseOverlay(ItemSKU);
		}
	}
}


function CallBack_ItemDetailsClicked(int ItemDefinition)
{
	local ItemProperties StoreItemDetails;
	
	StoreItemDetails = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', ItemDefinition)];
	if(StoreItemDetails.Price == "")
	{
		AddCartButton.SetString("label", class'KFGFxStoreContainer_Details'.default.LookUpOnMarketString);
	}
	else
	{
		AddCartButton.SetString("label", class'KFGFxStoreContainer_Details'.default.AddToCartString@StoreItemDetails.Price );
	}
	SetObject("storeItemDetails", CreateStoreItem(StoreItemDetails));

	//@SABER_EGS_BEGIN
	if ( class'WorldInfo'.static.IsEOSBuild())
	{
		// Ownded durable items marked with special price "double space" or empty price		
		AddCartButton.SetVisible(StoreItemDetails.Price != "  " && StoreItemDetails.Price != "");
	}
	//@SABER_EGS_END

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		if (StoreItemDetails.Price != "")
		{
			AddCartButton.SetString("label", class'KFGFxStoreContainer_Details'.default.AddToCartString);
			AddCartButton.SetVisible(true);
		}
		else
		{
			AddCartButton.SetString("label", "");
			AddCartButton.SetVisible(false);
		}
	}
}

function GFxObject CreateStoreItem(ItemProperties DesiredStoreItem)
{
	local GFxObject DataObject;

	DataObject = CreateObject( "Object" );
				
	DataObject.SetString("label", DesiredStoreItem.Name);
	DataObject.SetString("description", DesiredStoreItem.Description);
	DataObject.SetString("price", class'WorldInfo'.static.IsConsoleBuild() ? "" : DesiredStoreItem.Price);
	DataObject.SetString("imageURL", "img://"$DesiredStoreItem.IconURL);
	DataObject.SetString("imageURLLarge", "img://"$DesiredStoreItem.IconURLLarge);
	DataObject.SetInt("SKU", DesiredStoreItem.Definition);

	return DataObject;
}


function CheckForEmptyStore()
{
	local int i;

	// Check existing inventory for at least one PSN item. If none exist, throw up empty store dialog
	for( i = 0; i < OnlineSub.ItemPropertiesList.Length; i++ )
	{
		if( OnlineSub.ItemPropertiesList[i].SignedOfferId != "" )
		{
			return;
		}
	}

	// Only show this message if the player is logged in
	if( OnlineSub.PlayerInterface.GetLoginStatus(0) == LS_LoggedIn )
	{
		// 0 is code for SCE_MSG_DIALOG_SYSMSG_TYPE_TRC_EMPTY_STORE
		OnlineSub.PlayerInterfaceEx.ShowCustomErrorUI(0);
	}
}

defaultproperties
{
   StoreString="STORE"
   SubWidgetBindings(0)=(WidgetName="ItemDetails",WidgetClass=Class'KFGame.KFGFxStoreContainer_Details')
   SubWidgetBindings(1)=(WidgetName="storeCart",WidgetClass=Class'KFGame.KFGFxStoreContainer_Cart')
   SubWidgetBindings(2)=(WidgetName="storeMainContainer",WidgetClass=Class'KFGame.KFGFxStoreContainer_Main')
   Name="Default__KFGFxMenu_Store"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
