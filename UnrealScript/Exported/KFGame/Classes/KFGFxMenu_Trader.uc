//=============================================================================
// KFGFxMenu_Trader
//=============================================================================
// This is the manager class for the trader menu and has access to all the
// different KFGFxTraderComp_ classes. It receives all the calls from
// actionscript and tells the components accordingly. The array, "OwnedItemList"
// is a local list of all the ammo and items that our player has bought, sold
// or already owend. Upon closing the menu, this class will tell the server
// to update the player with the final items
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 8/6/2013
//=============================================================================

class KFGFxMenu_Trader extends KFGFxObject_Menu
	config(Game)
	DependsOn(KFGFxObject_TraderItems)
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
#linenumber 21

enum EItemType
{
  	EIT_Weapon,
  	EIT_Armor,
  	EIT_NonSellable,
  	EIT_Grenade,
};

struct native SItemInformation
{
	/** True if this item is being used to hold secondary ammo info */
	var bool bIsSecondaryAmmo;
    /** Holds the final values for the owned item */
	var int SpareAmmoCount, MaxSpareAmmo, MaxSecondaryAmmo, SellPrice, SecondaryAmmoCount;
	var byte MagazineCapacity;
	/** The dosh built up during an autofill for this item */
	var int AutoFillDosh, AmmoPricePerMagazine;
	/** Holds trader and default weapon information such as prices and stats */
	var STraderItem DefaultItem;

	var int ItemUpgradeLevel;

	StructDefaultProperties
	{
		ItemUpgradeLevel=0;
	}
};

var KFPlayerController MyKFPC;
var KFPlayerReplicationInfo MyKFPRI;
var KFInventoryManager MyKFIM;

var KFGFxTraderContainer_GameInfo GameInfoContainer; 	// Controls the timer, wave count and close button
var KFGFxTraderContainer_Filter FilterContainer;  // The filter list
var KFGFxTraderContainer_Store ShopContainer; // Items to buy
var KFGFxTraderContainer_PlayerInventory PlayerInventoryContainer; // Items you own
var KFGFxTraderContainer_PlayerInfo PlayerInfoContainer; // Your character info
var KFGFxTraderContainer_ItemDetails ItemDetails; // The center pane with weapon info
var KFGFxTraderContainer_ErrorMessage ErrorMessageContainer;

var bool bGenericItemSelected; //used to keep track of the state of the details menu in between opening and closing menu
var STraderItem LastDefaultItemInfo;
var SItemInformation LastItemInfo;

var localized string ExitMenuString;

var int PrevArmor;

// This exists to tell us whether our selected index is for the shop or the players inventory
enum TraderList
{
    TL_Shop,
    TL_Player
};

enum TabIndices
{
    TI_Perks,
    TI_Type,
    TI_Favorites,
    TI_All,
};

var TabIndices CurrentTab;

var int CurrentFilterIndex;

/** The selected list determines if we are buying or selling a currently selected item */
var byte SelectedList;
/** An items index ine either our inventory or the shopps the list*/
var byte SelectedItemIndex;

/** Stores the class name of every item we've favorited into kfgame.ini */
var array<name> FavoritedItems;

/** This tells us if we are able to buy or sell the currently selected item */
var bool bCanBuyOrSellItem;

var KFPerk LastPerkClass;

var array<SItemInformation> OwnedItemList;

//==============================================================
// Initialization
//==============================================================
function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);

	SetString("exitMenuString", ExitMenuString);
	SetString("exitPromptString", ExitMenuString);
	SetString("backPromptString",Localize("KFGFxWidget_ButtonPrompt","CancelString","KFGame"));
	LocalizeText();
}

function OnR3Pressed()
{
	//do nothing (handled via AS3)
}

function LocalizeText()
{
	local GFxObject TextObject;

	TextObject = CreateObject("Object");

	TextObject.SetString("favoriteString"	, 	Class'KFGFxTraderContainer_ItemDetails'.default.FavoriteString);
	TextObject.SetString("unFavoriteString"	, 	Class'KFGFxTraderContainer_ItemDetails'.default.UnfavoriteString);
	TextObject.SetString("changePerkString"	, 	Class'KFGFxTraderContainer_PlayerInventory'.default.ChangePerkString);
	//TextObject.SetString("autoTradeString"	, 	Omelette Du Fromage); //not used at the moment
	TextObject.SetString("selectString"		, 	Class'KFGFxWidget_ButtonPrompt'.default.ConfirmString);
	TextObject.SetString("autoFillString"		, 	Class'KFGFxTraderContainer_PlayerInventory'.default.AutoFillString);
	TextObject.SetString("upgradeString"	,	Class'KFGFxTraderContainer_ItemDetails'.default.UpgradeString);

	SetObject("localizeCentralPrompts", TextObject);
}

function OnOpen()
{
	local int i;
	local name weaponName;

	MyKFPC = KFPlayerController ( GetPC() );

	if (MyKFPC == none)
	{
		return;
	}

	MyKFPC.GetPurchaseHelper().Initialize();

	MyKFPRI = KFPlayerReplicationInfo( GetPC().PlayerReplicationInfo );
    MyKFIM = KFInventoryManager( GetPC().Pawn.InvManager );

    CurrentTab = TI_Perks;
    CurrentFilterIndex = GetPerkIndex();

	FavoritedItems.Remove(0, FavoritedItems.Length);
	for(i = 0; i < MyKFPC.MyGFxManager.CachedProfile.FavoriteWeapons.Length; ++i)
	{
		weaponName  = name(MyKFPC.MyGFxManager.CachedProfile.FavoriteWeapons[i]);
		FavoritedItems.AddItem( weaponName );
	}

	if( MyKFPC.Pawn != none || MyKFPC.PlayerReplicationInfo != none )
	{
		MyKFPC.CloseTraderMenu();
	}

	RefreshItemComponents(true);

	if( PlayerInventoryContainer != none )
	{
		PlayerInventoryContainer.UpdateLock();
	}

	if ( ShopContainer != None )
	{
		ShopContainer.OnTraderReopened();
	}

	MyKFPC.bClientTraderMenuOpen = true;
	UpdatePlayerInfo();
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	// `log("Trader Widget: " @WidgetName @" : " @WidgetPath);

	switch(WidgetName)
	{
		case ('gameInfoContainer'):
			if( GameInfoContainer == none )
			{
			    GameInfoContainer = KFGFxTraderContainer_GameInfo( Widget );
			    GameInfoContainer.Initialize( self );
	  			GameInfoContainer.SetDosh(MyKFPC.GetPurchaseHelper().TotalDosh);
	  			GameInfoContainer.SetCurrentWeight(MyKFPC.GetPurchaseHelper().TotalBlocks, MyKFPC.GetPurchaseHelper().MaxBlocks);
		    }
   		break;
		case ('filterContainer'):
			if( FilterContainer == none )
			{
			    FilterContainer = KFGFxTraderContainer_Filter( Widget );
			    FilterContainer.SetTabsData();
		    }
        break;
		case ('shopContainer'):
			if( ShopContainer == none )
			{
			    ShopContainer = KFGFxTraderContainer_Store( Widget );
			    ShopContainer.Initialize( self );
			    CurrentTab = TI_Perks;
			    CurrentFilterIndex = GetPerkIndex();
				RefreshShopItemList( TI_Perks,  CurrentFilterIndex );
		    }
		break;
		case ('playerInventoryContainer'):
			if( PlayerInventoryContainer == none )
			{
			    PlayerInventoryContainer = KFGFxTraderContainer_PlayerInventory( Widget );
   			    PlayerInventoryContainer.Initialize( self );
			    PlayerInventoryContainer.RefreshPlayerInventory();
		    }
		break;
		case ('playerInfoContainer'):
			if( PlayerInfoContainer == none )
			{
				PlayerInfoContainer = KFGFxTraderContainer_PlayerInfo( Widget );
   			    PlayerInfoContainer.Initialize( self );
			}
		break;
		case ('itemDetailsContainer'):
			if( ItemDetails == none )
			{
			    ItemDetails = KFGFxTraderContainer_ItemDetails( Widget );
			    ItemDetails.Initialize( self );
		    }
		break;
		case ('errorMessage'):
			if (ErrorMessageContainer == none)
			{
				ErrorMessageContainer = KFGFxTraderContainer_ErrorMessage(Widget);
				ErrorMessageContainer.Initialize(self);
			}
		break;
	}

	return true;
}

function int GetPerkIndex()
{
	return MyKFPC.PerkList.Find('PerkClass', MyKFPC.CurrentPerk.Class);
}

//==============================================================
// Closing
//==============================================================

event OnClose()
{
	MyKFIM.ServerCloseTraderMenu();
	if(MyKFPC.MyGFxHUD.WeaponSelectWidget != none)
	{
		MyKFPC.MyGFxHUD.WeaponSelectWidget.RefreshWeaponSelect();
	}

    OwnedItemList.length = 0;
	MyKFPC.GetPurchaseHelper().TotalDosh = 0;
	super.OnClose();

	MyKFPC.bClientTraderMenuOpen = false;
}

//==============================================================
// Trader Functions
//==============================================================
function OneSecondLoop()
{
	local KFPawn_Human KFP;

	if( GameInfoContainer != none )
	{
	 	GameInfoContainer.UpdateTraderTimer();
	}

	// update armor amount if pawn gains armor while in trader (e.g. from medic heal skills)
	KFP = KFPawn_Human( MyKFPC.Pawn );
	if( KFP != none && PrevArmor != KFP.Armor )
	{
		MyKFPC.GetPurchaseHelper().ArmorItem.SpareAmmoCount = KFP.Armor;
		PrevArmor = KFP.Armor;

		RefreshItemComponents();
	}
}

function UpdatePlayerInfo()
{
	if( MyKFPC != none && PlayerInfoContainer != none )
	{
		PlayerInfoContainer.SetPerkInfo();
		PlayerInfoContainer.SetPerkList();
		if(LastPerkClass != MyKFPC.CurrentPerk)
		{
			LastPerkClass = MyKFPC.CurrentPerk;
			OnPerkChanged(GetPerkIndex());
		}

		RefreshItemComponents();
	}
}

/** Called when we have been given a weapon while in the trader menu */
function GiveExternalWeapon(KFWeapon KFW)
{
	local int i;

	// Check if we own this weapon
	for ( i = 0; i < OwnedItemList.Length; i++ )
	{
		if( OwnedItemList[i].DefaultItem.ClassName == KFW.class.name )
		{
			return;
		}
	}

	// Only add the item to our owned list if we have the capacity to carry it
	if( MyKFPC.GetPurchaseHelper().TotalBlocks + KFW.GetModifiedWeightValue() > MyKFPC.GetPurchaseHelper().MaxBlocks )
	{
		if( MyKFPC.Pawn != none )
		{
			// Throw it if we can't carry
			MyKFPC.Pawn.TossInventory(KFW);
		}
	}
	else
	{
		MyKFPC.GetPurchaseHelper().AddBlocks(KFW.GetModifiedWeightValue());
		MyKFPC.GetPurchaseHelper().SetWeaponInformation(KFW);
		RefreshItemComponents();
	}
}

//==============================================================
// Item details updates
//==============================================================

function SetTraderItemDetails(int ItemIndex)
{
	local STraderItem SelectedItem;
	local bool bCanAfford, bCanBuyItem, bCanCarry;
	SelectedList = TL_Shop;
    if (ItemDetails != none && ShopContainer != none)
    {
    	if (MyKFPC.GetPurchaseHelper().TraderItems.SaleItems.length >= 0 && ItemIndex < MyKFPC.GetPurchaseHelper().TraderItems.SaleItems.length)
    	{
			SelectedItemIndex = ItemIndex;
			SelectedItem = MyKFPC.GetPurchaseHelper().TraderItems.SaleItems[ItemIndex];

			bCanAfford = MyKFPC.GetPurchaseHelper().GetCanAfford( MyKFPC.GetPurchaseHelper().GetAdjustedBuyPriceFor(SelectedItem) );
			bCanCarry = MyKFPC.GetPurchaseHelper().CanCarry( SelectedItem );

			if (!bCanAfford || !bCanCarry)
			{
				
				bCanBuyItem = false;
			}
			else
			{
				bCanBuyItem = true;
			}

			PurchaseError(!bCanAfford, !bCanCarry);

			ItemDetails.SetShopItemDetails(SelectedItem, MyKFPC.GetPurchaseHelper().GetAdjustedBuyPriceFor(SelectedItem), bCanCarry, bCanBuyItem);
			bCanBuyOrSellItem = bCanBuyItem;
		}
		else
		{
			ItemDetails.SetVisible(false);
		}
	}
}

function SetPlayerItemDetails(int ItemIndex)
{
	local STraderItem SelectedItem;

	SelectedList = TL_Player;
    if( ItemDetails != none && ItemIndex < OwnedItemList.length)
    {
    	bGenericItemSelected = false;
		SelectedItemIndex = ItemIndex;
		SelectedItem = OwnedItemList[ItemIndex].DefaultItem;
		ItemDetails.SetPlayerItemDetails(SelectedItem, OwnedItemList[ItemIndex].SellPrice, OwnedItemList[ItemIndex].ItemUpgradeLevel);
		bCanBuyOrSellItem = MyKFPC.GetPurchaseHelper().IsSellable(SelectedItem);
		PurchaseError(false, false);//clear it
	}
}

function SetGenericItemDetails(out STraderItem DefaultItemInfo, out SItemInformation ItemInfo)
{
	SelectedList = TL_Player;
    if( ItemDetails != none )
    {
    	LastItemInfo = ItemInfo;
    	LastDefaultItemInfo = DefaultItemInfo;
    	bGenericItemSelected = true;
		//SelectedItemIndex = ItemIndex;
		ItemDetails.SetPlayerItemDetails(DefaultItemInfo, ItemInfo.SellPrice, INDEX_NONE);
		bCanBuyOrSellItem = MyKFPC.GetPurchaseHelper().IsSellable(DefaultItemInfo);
	}
}

/** Decrement the SelectedItemIndex if we bought or sold the last item in its list */
function SetNewSelectedIndex(int ListLength)
{
	if (SelectedItemIndex >= ListLength)
	{
		if (SelectedItemIndex != 0)
		{
    		SelectedItemIndex--;
		}
	}
}

//==============================================================
// Inventory Update Functions - Buying Weapons and Ammo
//==============================================================
function OnPerkChanged(int PerkIndex)
{
	if(CurrentTab == TI_Perks)
	{
		CurrentFilterIndex = PerkIndex;
		RefreshShopItemList(CurrentTab, CurrentFilterIndex);
	}
}

function RefreshItemComponents(optional bool bInitOwnedItems=false)
{
    if( PlayerInventoryContainer != none && PlayerInfoContainer != none )
    {
    	if(bInitOwnedItems)
    	{
    		MyKFPC.GetPurchaseHelper().InitializeOwnedItemList();
    	}
    	OwnedItemList = MyKFPC.GetPurchaseHelper().OwnedItemList;
	    PlayerInventoryContainer.RefreshPlayerInventory();
	    RefreshShopItemList(CurrentTab, CurrentFilterIndex);
	  	GameInfoContainer.UpdateGameInfo();
	  	GameInfoContainer.SetDosh(MyKFPC.GetPurchaseHelper().TotalDosh);
	  	GameInfoContainer.SetCurrentWeight(MyKFPC.GetPurchaseHelper().TotalBlocks, MyKFPC.GetPurchaseHelper().MaxBlocks);

	  	if(SelectedList == TL_Shop)
	  	{
	  		SetTraderItemDetails(SelectedItemIndex);
	  	}
	  	else if(bGenericItemSelected)
	  	{
	  		SetGenericItemDetails(LastDefaultItemInfo, LastItemInfo);
	  	}
	  	else
	  	{
	  		SetPlayerItemDetails(SelectedItemIndex);
	  	}
	}
}

/** TODO add different filters to this function */
function RefreshShopItemList( TabIndices TabIndex, byte FilterIndex )
{
	if (ShopContainer != none && FilterContainer != none)
	{
		switch (TabIndex)
		{
			case (TI_Perks):
				ShopContainer.RefreshWeaponListByPerk(FilterIndex, MyKFPC.GetPurchaseHelper().TraderItems.SaleItems);
				FilterContainer.SetPerkFilterData(FilterIndex);
			break;
			case (TI_Type):
				ShopContainer.RefreshItemsByType(FilterIndex, MyKFPC.GetPurchaseHelper().TraderItems.SaleItems);
				FilterContainer.SetTypeFilterData(FilterIndex);
			break;
			case (TI_Favorites):
				ShopContainer.RefreshFavoriteItems(MyKFPC.GetPurchaseHelper().TraderItems.SaleItems);
				FilterContainer.ClearFilters();
			break;
			case (TI_All):
				ShopContainer.RefreshAllItems(MyKFPC.GetPurchaseHelper().TraderItems.SaleItems);
				FilterContainer.ClearFilters();
			break;
		}
		FilterContainer.SetInt("selectedTab", TabIndex);
		FilterContainer.SetInt("selectedFilter", FilterIndex);

		if(SelectedList == TL_Shop)
		{
			if( SelectedItemIndex >= MyKFPC.GetPurchaseHelper().TraderItems.SaleItems.length )
			{
				SelectedItemIndex = MyKFPC.GetPurchaseHelper().TraderItems.SaleItems.length - 1;
			}

			SetTraderItemDetails(SelectedItemIndex);
			ShopContainer.SetSelectedIndex(SelectedItemIndex);
		}
  	}
}

function bool GetIsFavorite(name ClassName)
{
	local byte i;
	for (i = 0; i < FavoritedItems.length; i++)
	{
		if (ClassName == FavoritedItems[i])
		{
			return true;
		}
	}
	return false;
}

/** Add or remove the current selected item from the favorites list */
function ToggleFavorite(name ClassName)
{
	local byte i;
	local bool bUnfavoriteItem;
	for (i = 0; i < FavoritedItems.length; i++)
	{
		if (ClassName == FavoritedItems[i])
		{
			FavoritedItems.Remove(i, 1);
			bUnfavoriteItem = true;
			Manager.CachedProfile.UnFavoriteWeapon(ClassName);
			break;
		}
	}

	if (!bUnfavoriteItem)
	{
		FavoritedItems.AddItem(ClassName);
		Manager.CachedProfile.FavoriteWeapon(ClassName);
	}

	SaveConfig();
}

/** Modifies blocks required for the UI (e.g. in the case of dualies) */
simulated function int GetDisplayedBlocksRequiredFor( const out STraderItem Item, optional int OverrideLevelValue = INDEX_NONE)
{
	return MyKFIM.GetDisplayedBlocksRequiredFor( Item, OverrideLevelValue );
}

simulated function PurchaseError(bool bCannotAfford, bool bCannotCarry)
{
	if (ErrorMessageContainer != none) {
		if (bCannotAfford)
		{
			ErrorMessageContainer.SetWarningMessage(ErrorMessageContainer.CannotAffordString);
		}
		else if (bCannotCarry)
		{
			ErrorMessageContainer.SetWarningMessage(ErrorMessageContainer.CannotCarryString);
		}
		else
		{
			//clear it
			ErrorMessageContainer.SetWarningMessage("");
		}
		
	}
}

//==============================================================
// ActionScript Callbacks - Trader and Player Inventory
//==============================================================

function Callback_BuyOrSellItem()
{
	local STraderItem ShopItem;
	local SItemInformation ItemInfo;
	
	if (bCanBuyOrSellItem)
	{
		if (SelectedList == TL_Shop)
		{
			ShopItem = MyKFPC.GetPurchaseHelper().TraderItems.SaleItems[SelectedItemIndex];

			MyKFPC.GetPurchaseHelper().PurchaseWeapon(ShopItem);
			SetNewSelectedIndex(MyKFPC.GetPurchaseHelper().TraderItems.SaleItems.length);
	    	SetTraderItemDetails(SelectedItemIndex);
	    	ShopContainer.ActionScriptVoid("itemBought");
		}
		else
		{
			if (MyKFIM.bLogInventory) LogInternal("Callback_BuyOrSellItem: SelectedItemIndex="$SelectedItemIndex);
			ItemInfo = OwnedItemList[SelectedItemIndex];
			if (MyKFIM.bLogInventory) LogInternal("Callback_BuyOrSellItem: ItemInfo="$ItemInfo.DefaultItem.ClassName);
			MyKFPC.GetPurchaseHelper().SellWeapon(ItemInfo, SelectedItemIndex);

	   	    SetNewSelectedIndex(OwnedItemList.length);
			SetPlayerItemDetails(SelectedItemIndex);
			PlayerInventoryContainer.ActionScriptVoid("itemSold");
		}
	}
	else if( SelectedList == TL_Shop )
	{
		ShopItem = MyKFPC.GetPurchaseHelper().TraderItems.SaleItems[SelectedItemIndex];

		MyKFPC.PlayTraderSelectItemDialog( !MyKFPC.GetPurchaseHelper().GetCanAfford( MyKFPC.GetPurchaseHelper().GetAdjustedBuyPriceFor(ShopItem) ), !MyKFPC.GetPurchaseHelper().CanCarry( ShopItem ) );
	}
	RefreshItemComponents();
}

function Callback_FavoriteItem()
{
	if (SelectedList == TL_Shop)
	{
		ToggleFavorite(MyKFPC.GetPurchaseHelper().TraderItems.SaleItems[SelectedItemIndex].ClassName);
		if (CurrentTab == TI_Favorites)
		{
			SetNewSelectedIndex(MyKFPC.GetPurchaseHelper().TraderItems.SaleItems.length);
		}
		SetTraderItemDetails(SelectedItemIndex);
	}
	else
	{
		ToggleFavorite(OwnedItemList[SelectedItemIndex].DefaultItem.ClassName);
		SetPlayerItemDetails(SelectedItemIndex);
	}
	RefreshItemComponents();
}
//==============================================================
// ActionScript Callbacks - Trader Inventory
//==============================================================
function Callback_FilterChanged(int FilterIndex)
{
    CurrentFilterIndex = FilterIndex;
	RefreshShopItemList(CurrentTab, CurrentFilterIndex);
}

function Callback_TabChanged(int TabIndex)
{
	CurrentTab = TabIndices(TabIndex);
	if(CurrentTab == TI_Perks && MyKFPRI != none)
	{
		CurrentFilterIndex = GetPerkIndex();
	}
	else
	{
		CurrentFilterIndex = 0;
	}
	RefreshShopItemList(CurrentTab, CurrentFilterIndex);
}

//==============================================================
// ActionScript Callbacks - Player Inventory
//==============================================================
function Callback_UpgradeItem()
{
	local SItemInformation ItemInfo;
	//only relevant in the player inventory
	if (SelectedList == TL_Player)
	{
		if (MyKFPC.GetPurchaseHelper().UpgradeWeapon(SelectedItemIndex))
		{
			ItemInfo = OwnedItemList[SelectedItemIndex];
			ItemInfo.ItemUpgradeLevel++;
			MyKFPC.GetPurchaseHelper().OwnedItemList[SelectedItemIndex] = ItemInfo;			
			RefreshItemComponents();
			ShopContainer.ActionScriptVoid("itemBought");
			class'KFMusicStingerHelper'.static.PlayWeaponUpgradeStinger(MyKFPC);
		}
		
		//@TODO: change this to work with the weight system
		//ShopContainer.ActionScriptVoid("itemBought");
		//SetPlayerItemDetails(SelectedItemIndex);
	}
}

function Callback_BuyGrenade()
{
	if( PlayerInventoryContainer != none )
    {
		MyKFPC.GetPurchaseHelper().BuyGrenade();
		RefreshItemComponents();
	}
}

function Callback_FillGrenades()
{
	if (PlayerInventoryContainer != none)
    {
		MyKFPC.GetPurchaseHelper().FillAmmo(MyKFPC.GetPurchaseHelper().GrenadeItem, true);
		RefreshItemComponents();
	}
}

function Callback_FillArmor()
{
	if (PlayerInventoryContainer != none)
    {
		MyKFPC.GetPurchaseHelper().FillArmor();
		RefreshItemComponents();
	}
}

function Callback_FillAmmo(int ItemIndex)
{
	local SItemInformation ItemInfo;

	ItemInfo = OwnedItemList[ItemIndex];
	MyKFPC.GetPurchaseHelper().FillAmmo(ItemInfo);
	MyKFPC.GetPurchaseHelper().OwnedItemList[ItemIndex] = ItemInfo;
	RefreshItemComponents();
}

function Callback_BuyMagazine(int ItemIndex)
{
    MyKFPC.GetPurchaseHelper().BuyMagazine(ItemIndex);
	RefreshItemComponents();
}

function Callback_AutoFill(int ItemIndex)
{
    MyKFPC.GetPurchaseHelper().StartAutoFill();
    RefreshItemComponents();
}

//==============================================================
// ActionScript Callbacks - Weapon Details
//==============================================================

function Callback_ShopItemSelected(int ItemIndex)
{
	SetTraderItemDetails(ItemIndex);
}

function Callback_PlayerItemSelected(int ItemIndex)
{
	SetPlayerItemDetails(ItemIndex);
}

function Callback_ArmorItemSelected()
{
	SetGenericItemDetails(MyKFPC.GetPurchaseHelper().ArmorItem.DefaultItem, MyKFPC.GetPurchaseHelper().ArmorItem);
}

function Callback_GrenadeItemSelected()
{
	SetGenericItemDetails(MyKFPC.GetPurchaseHelper().GrenadeItem.DefaultItem, MyKFPC.GetPurchaseHelper().GrenadeItem);
}

//==============================================================
// Player Info
//==============================================================

function Callback_PerkChanged(int PerkIndex)
{
	if( MyKFPRI.NetPerkIndex != PerkIndex )
	{
		MyKFPC.RequestPerkChange(PerkIndex);

		if( MyKFPC.CanUpdatePerkInfo() )
		{
			MyKFPC.SetHaveUpdatePerk(true);

			// re-initialize and refresh to reflect current carry weight (can change by perk)
			MyKFPC.GetPurchaseHelper().Initialize();
			RefreshItemComponents();
		}

		Manager.CachedProfile.SetProfileSettingValueInt(KFID_SavedPerkIndex, PerkIndex);
	}

	if( PlayerInventoryContainer != none )
	{
		PlayerInventoryContainer.UpdateLock();
	}
	UpdatePlayerInfo();

	// Refresht he UI
	RefreshItemComponents();
}

//==============================================================
// ActionScript Callbacks - Header
//==============================================================
function Callback_Close()
{
	Manager.CloseMenus();
}

defaultproperties
{
   LastDefaultItemInfo=(AltTraderFilter=FT_None,ItemId=-1)
   LastItemInfo=(DefaultItem=(AltTraderFilter=FT_None,ItemId=-1))
   ExitMenuString="EXIT MENU"
   SubWidgetBindings(0)=(WidgetName="GameInfoContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_GameInfo')
   SubWidgetBindings(1)=(WidgetName="FilterContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_Filter')
   SubWidgetBindings(2)=(WidgetName="ShopContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_Store')
   SubWidgetBindings(3)=(WidgetName="PlayerInfoContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_PlayerInfo')
   SubWidgetBindings(4)=(WidgetName="PlayerInventoryContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_PlayerInventory')
   SubWidgetBindings(5)=(WidgetName="ItemDetailsContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_ItemDetails')
   SubWidgetBindings(6)=(WidgetName="ErrorMessage",WidgetClass=Class'KFGame.KFGFxTraderContainer_ErrorMessage')
   Name="Default__KFGFxMenu_Trader"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
