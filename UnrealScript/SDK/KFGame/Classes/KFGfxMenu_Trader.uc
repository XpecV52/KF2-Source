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
	DependsOn(KFGFxObject_TraderItems);

enum EItemType
{
  	IT_Weapon,
  	IT_Armor,
  	IT_NonSellable,
  	IT_Grenade,
};

struct SItemInformation
{
	/** True if this item is being used to hold secondary ammo info */
	var bool bIsSecondaryAmmo;
    /** Holds the final values for the owned item */
	var int SpareAmmoCount, MaxSpareAmmo, MagazineCapacity, SecondaryAmmoCount, MaxSecondaryAmmoCount, SellPrice;
	/** The dosh built up during an autofill for this item */
	var int AutoFillDosh, AmmoPricePerMagazine;
	/** Holds trader and default weapon information such as prices and stats */
	var STraderItem DefaultItem;
};
// The list of weapons that we know that we own; it gets updated as items are bought and sold
var array<SItemInformation> OwnedItemList;
var SItemInformation GrenadeItem;
var SItemInformation ArmorItem;

var KFGFxObject_TraderItems TraderItems;

var array< STraderItem > ShopWeaponList;	// The Trader Item Info for each Item slot

var KFPlayerController MyKFPC;
var KFPlayerReplicationInfo MyKFPRI;
var KFInventoryManager MyKFIM;

var KFGFxTraderContainer_GameInfo GameInfoContainer; 	// Controls the timer, wave count and close button
var KFGFxTraderContainer_Filter FilterContainer;  // The filter list
var KFGFxTraderContainer_Store ShopContainer; // Items to buy
var KFGFxTraderContainer_PlayerInventory PlayerInventoryContainer; // Items you own
var KFGFxTraderContainer_PlayerInfo PlayerInfoContainer; // Your character info
var KFGFxTraderContainer_ItemDetails ItemDetails; // The center pane with weapon info

var int CurrentFilterIndex;
var int TotalDosh; // The total amount of dosh we have
var bool bPendingDoshUpdate; // Set this to true if we spent money but haven't received acknowledgement from the server
var int TotalBlocks; // The total amount of blocks that our inventory takes up, plus any transactions
var byte MaxBlocks;  // The maximum number of blocks available

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

/** The selected list determines if we are buying or selling a currently selected item */
var byte SelectedList;
/** An items index ine either our inventory or the shopps the list*/
var byte SelectedItemIndex;

/** Stores the class name of every item we've favorited into kfgame.ini */
var config array<name> FavoritedItems;

/** This tells us if we are able to buy or sell the currently selected item */
var bool bCanBuyOrSellItem;

var KFPerk LastPerkClass;

//==============================================================
// Initialization
//==============================================================
function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu(InManager);
	MyKFPC = KFPlayerController ( GetPC() );
	SetString("exitMenuString", ExitMenuString);
}

function OnOpen()
{
	if (MyKFPC == none)
	{
		return;
	}

	if( MyKFPC.Pawn != none && MyKFPC.PlayerReplicationInfo != none )
	{
		MyKFPRI = KFPlayerReplicationInfo( GetPC().PlayerReplicationInfo );
		MyKFIM = KFInventoryManager( GetPC().Pawn.InvManager );

		if( MyKFPRI != none && MyKFIM != none )
		{
			// Grab the weapons in our inventory and add them to a stored array called OwnedItemList
			InitializeOwnedItemList();
			TotalBlocks = MyKFIM.CurrentCarryBlocks;
			TotalDosh = MyKFPRI.Score;
			MaxBlocks = MyKFIM.MaxCarryBlocks;
		 	CurrentFilterIndex = MyKFPRI.NetPerkIndex;
		 	UpdatePlayerInfo();
		}
		else
		{
			MyKFPC.CloseTraderMenu();
		}
	}
	else
	{
	 	MyKFPC.CloseTraderMenu();
	}

	RefreshItemComponents();

	if( PlayerInventoryContainer != none )
	{
		PlayerInventoryContainer.UpdateLock();
	}

	if ( ShopContainer != None )
	{
		ShopContainer.OnTraderReopened();
	}

	MyKFPC.bClientTraderMenuOpen = true;
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
	  			GameInfoContainer.SetDosh(TotalDosh);
	  			GameInfoContainer.SetCurrentWeight(TotalBlocks, MaxBlocks);
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
				RefreshShopItemList( TI_Perks, CurrentFilterIndex );
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
	}

	return true;
}

//==============================================================
// Closing
//==============================================================

event OnClose()
{
	MyKFIM.ServerCloseTraderMenu();
	MyKFPC.MyGFxHUD.WeaponSelectWidget.RefreshWeaponSelect();

    OwnedItemList.length = 0;
	TotalDosh = 0;
	super.OnClose();

	MyKFPC.bClientTraderMenuOpen = false;
}

//==============================================================
// Trader Functions
//==============================================================
function AddDosh( int AddedDosh )
{
	TotalDosh = Max( TotalDosh + AddedDosh, 0 );

	if(GetPC().Role < ROLE_Authority)
	{
		bPendingDoshUpdate = true;
		// If we have not heard anything back form the server, update the clients dosh value
		GetPC().SetTimer(2.0f, false, nameof(UpdateCurrentDosh), self);
	}
}

simulated function NotifyDoshChanged()
{
    // If we've spent dosh just prior to receiving an update, keep our client value and wait for the next server update
	if( bPendingDoshUpdate )
	{
		bPendingDoshUpdate = false;
		if(MyKFPRI.Score != TotalDosh)
		{
			return;	
		}		
	}

	UpdateCurrentDosh();
}

simulated function UpdateCurrentDosh()
{
	// If we receive dosh outside of the menu update our TotalDosh and refresh the menus
	TotalDosh = Max( MyKFPRI.Score, 0 );
	RefreshItemComponents();
	bPendingDoshUpdate = false;
	GetPC().ClearTimer(nameof(UpdateCurrentDosh), self);
}

function AddBlocks( int AddedBlocks )
{
	TotalBlocks = Max( TotalBlocks + AddedBlocks, 0 );
}

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
		ArmorItem.SpareAmmoCount = KFP.Armor;
		PrevArmor = KFP.Armor;

		RefreshItemComponents();
	}

 	UpdatePlayerInfo();
}

function UpdatePlayerInfo()
{
	local STraderItem TraderItem;

	if( MyKFPC != none && PlayerInfoContainer != none )
	{
		if(MyKFPC.CurrentPerk != LastPerkClass)
		{
			PlayerInfoContainer.SetPerkInfo();
			PlayerInfoContainer.SetPerkList();
			LastPerkClass = MyKFPC.CurrentPerk;

			// Update the grenade item for the new perk
			TraderItem = TraderItems.GetGrenadeByPerk(MyKFPC.CurrentPerk.Class);
			GrenadeItem.DefaultItem = TraderItem;
			GrenadeItem.DefaultItem.TextureLocation = TraderItem.TextureLocation;

			// Refresht he UI
			RefreshItemComponents();
		}
	}
}

//==============================================================
// Inventory Initilization
// - All items we own or buy will be added to the array OwnedItemList and used to
//   populate the PlayerInventoryList
//==============================================================
// Create a list of all the weapons we own with their current spare ammo and trader info
function InitializeOwnedItemList()
{
   	local Inventory Inv;
   	local KFWeapon KFW;
	local KFPawn_Human KFP;

    OwnedItemList.length = 0;

	TraderItems = KFGameReplicationInfo( MyKFPC.WorldInfo.GRI ).TraderItems;

	KFP = KFPawn_Human( MyKFPC.Pawn );
    if( KFP != none )
    {
		// Always create a slot for armor and grenades in the player inventory
		AddDefaultInventory( ArmorItem, TraderItems.ArmorItem, KFP.Armor, KFP.GetMaxArmor());
		ArmorItem.AmmoPricePerMagazine *= MyKFPC.CurrentPerk.GetArmorDiscountMod();

		AddDefaultInventory( GrenadeItem, TraderItems.GetGrenadeByPerk(MyKFPC.CurrentPerk.Class), MyKFIM.GrenadeCount, KFP.GetPerk().MaxGrenadeCount );

		for ( Inv = MyKFIM.InventoryChain; Inv != none; Inv = Inv.Inventory )
		{
			KFW = KFWeapon( Inv );
			if( KFW != none )
			{
				// Set the weapon information and add it to the OwnedItemList
				SetWeaponInformation( KFW );
	     	}
		}
	}
}

/** Adds default objects like grenades and armor */
function AddDefaultInventory( out SItemInformation ItemInfo, STraderItem TraderItem, int SpareAmmo, int MaxSpareAmmo )
{
	ItemInfo.DefaultItem = TraderItem;
	ItemInfo.SpareAmmoCount = SpareAmmo;
	ItemInfo.MaxSpareAmmo = MaxSpareAmmo;

	ItemInfo.MagazineCapacity = TraderItem.MagazineCapacity;
   	ItemInfo.AmmoPricePerMagazine = TraderItem.AmmoPricePerMagazine;
	ItemInfo.DefaultItem.TextureLocation = TraderItem.TextureLocation;
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
	if( TotalBlocks + KFW.InventorySize > MaxBlocks )
	{
		if( MyKFPC.Pawn != none )
		{
			// Throw it if we can't carry
			MyKFPC.Pawn.TossInventory(KFW);
		}
	}
	else
	{
		AddBlocks(KFW.InventorySize);
		SetWeaponInformation(KFW);
		RefreshItemComponents();
	}
}

function SetWeaponInformation( KFWeapon KFW )
{
	local int i;
	local array< STraderItem > PerksWeaponList;

	PerksWeaponList = TraderItems.GetWeaponListByPerk(KFW.AssociatedPerkClass);
	for (i = 0; i < PerksWeaponList.Length; i++)
	{
    	if( KFW.Class.name == PerksWeaponList[i].ClassName )
    	{
        	SetWeaponInfo(KFW, PerksWeaponList[i]);
        	return;
    	}
    }

    // If the weapon can't be found in a perk list, it must be an offperk item
	for (i = 0; i < TraderItems.OffPerkItems.Length; i++)
	{
    	if( KFW.Class.name == TraderItems.OffPerkItems[i].ClassName )
    	{
    		SetWeaponInfo(KFW, TraderItems.OffPerkItems[i]);
    		return;
    	}
    }
}

/** Add a currently owned item to the "OwnedItemList" on initialization */
function SetWeaponInfo(out KFWeapon KFW, STraderItem DefaultItem)
{
   	local SItemInformation WeaponInfo;

   	// Include current magazine ammo in spare ammo count
	WeaponInfo.SpareAmmoCount = KFW.SpareAmmoCount[0] + KFW.AmmoCount[0];
	// Max spare ammo already includes perk modifications and magazine capacity
	WeaponInfo.MaxSpareAmmo = KFW.MaxSpareAmmo[0];
	WeaponInfo.MagazineCapacity = KFW.MagazineCapacity[0];
	WeaponInfo.SecondaryAmmoCount = KFW.AmmoCount[1];
	WeaponInfo.MaxSecondaryAmmoCount = KFW.MagazineCapacity[1];
	WeaponInfo.DefaultItem =	DefaultItem;
	
	WeaponInfo.AmmoPricePerMagazine = DefaultItem.AmmoPricePerMagazine;

	WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor( DefaultItem, KFW );

    OwnedItemList.AddItem(WeaponInfo);

   	if( DefaultItem.bUsesSecondaryAmmo )
   	{
   		WeaponInfo.bIsSecondaryAmmo = true;
		OwnedItemList.AddItem( WeaponInfo );
   	}
}

//==============================================================
// Item details updates
//==============================================================

// We've bought a new item, add its information to our owned item list
function AddWeaponToOwnedItemList( STraderItem DefaultItem, optional bool bDoNotBuy )
{
	local SItemInformation WeaponInfo;
	local KFPerk CurrentPerk;
	local byte ListIndex, ItemIndex;
	local KFWeapon SingleWeapon;
	local int DefaultMagazineCapacity;
	local bool bShouldMagSizeModifySpareAmmo;

	CurrentPerk = MyKFPC.CurrentPerk;

	// Magazine capacity affects both spare ammo and max spare ammo. modify this first
   	WeaponInfo.MagazineCapacity = DefaultItem.MagazineCapacity;
   	DefaultMagazineCapacity = WeaponInfo.MagazineCapacity;
	CurrentPerk.ModifyMagSizeAndNumber( none, WeaponInfo.MagazineCapacity, DefaultItem.AssociatedPerkClass );
	bShouldMagSizeModifySpareAmmo = CurrentPerk.ShouldMagSizeModifySpareAmmo( none, DefaultItem.AssociatedPerkClass );

	// Newly bought weapons need to have their default values modified by the current perk
	WeaponInfo.MaxSpareAmmo = DefaultItem.MaxSpareAmmo + ( bShouldMagSizeModifySpareAmmo ? WeaponInfo.MagazineCapacity : DefaultMagazineCapacity );
	CurrentPerk.ModifyMaxSpareAmmoAmount(none, WeaponInfo.MaxSpareAmmo, DefaultItem);

	WeaponInfo.SpareAmmoCount = DefaultItem.InitialSpareMags * DefaultItem.MagazineCapacity;
	CurrentPerk.ModifySpareAmmoAmount(none, WeaponInfo.SpareAmmoCount, DefaultItem);
	WeaponInfo.SpareAmmoCount += bShouldMagSizeModifySpareAmmo ? WeaponInfo.MagazineCapacity : DefaultMagazineCapacity;

	// allow perk to set spare ammo to max (uses different params than ModifySpareAmmoAmount)
	// mostly just used for firebug
	CurrentPerk.MaximizeSpareAmmoAmount( DefaultItem.AssociatedPerkClass, WeaponInfo.SpareAmmoCount, DefaultItem.MaxSpareAmmo + DefaultItem.MagazineCapacity );

	WeaponInfo.SecondaryAmmoCount = DefaultItem.MaxSecondaryAmmoCount;
	CurrentPerk.ModifyMagSizeAndNumber( none, WeaponInfo.SecondaryAmmoCount, DefaultItem.AssociatedPerkClass );

	WeaponInfo.MaxSecondaryAmmoCount = DefaultItem.MaxSecondaryAmmoCount;
	CurrentPerk.ModifyMaxSpareAmmoAmount( none, WeaponInfo.MaxSecondaryAmmoCount, DefaultItem );

	WeaponInfo.AmmoPricePerMagazine = DefaultItem.AmmoPricePerMagazine;

   	WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor( DefaultItem );

	WeaponInfo.DefaultItem = DefaultItem;

   	AddItemByPriority( WeaponInfo );

   	if( !bDoNotBuy )
   	{
	    // Tell the server to buy the weapon using its trader archetype info
		TraderItems.GetItemIndicesFromArche( ListIndex, ItemIndex, DefaultItem.ClassName, DefaultItem.AssociatedPerkClass );
		MyKFIM.ServerBuyWeapon(ListIndex, ItemIndex);
	}

	// if adding a dual, removed owned single
   	if( DefaultItem.SingleClassName != '' )
   	{
   		MyKFIM.GetWeaponFromClass( SingleWeapon, DefaultItem.SingleClassName );
   		if( SingleWeapon != none )
   		{
   			MyKFIM.RemoveFromInventory( SingleWeapon );
   		}

   		MyKFIM.RemoveItemFromTransaction( DefaultItem.SingleClassName );
   		RemoveWeaponFromOwnedItemList( , DefaultItem.SingleClassName, true );
   	}
}

/** Removes item from owned list and sells it, if applicable */
function RemoveWeaponFromOwnedItemList( optional int OwnedListIdx = INDEX_NONE, optional name ClassName, optional bool bDoNotSell )
{
	local SItemInformation ItemInfo;
	local byte ListIndex, ItemIndex;

	if( OwnedListIdx == INDEX_NONE && ClassName != '' )
	{
		for( OwnedListIdx = 0; OwnedListIdx < OwnedItemList.length; ++OwnedListIdx )
		{
			if( OwnedItemList[OwnedListIdx].DefaultItem.ClassName == ClassName )
			{
				break;
			}
		}
	}

	if( OwnedListIdx >= OwnedItemList.length )
	{
		return;
	}

	ItemInfo = OwnedItemList[OwnedListIdx];

	if( !bDoNotSell )
	{
		// Sell the weapon from our inventory immediately
		TraderItems.GetItemIndicesFromArche( ListIndex, ItemIndex, ItemInfo.DefaultItem.ClassName, ItemInfo.DefaultItem.AssociatedPerkClass );
		MyKFIM.ServerSellWeapon(ListIndex, ItemIndex);
	}

	// If we try to sell a weapons secondary ammo slot
	if( OwnedItemList[OwnedListIdx].bIsSecondaryAmmo )
	{
		OwnedItemList.Remove( OwnedListIdx, 1 );
		if( OwnedListIdx - 1 >= 0 )
    	{
    		OwnedItemList.Remove( OwnedListIdx - 1, 1 );
    	}
	}
	// If the weapon we're selling uses secondary ammo, remove the secondary ammo listing also
	else if( OwnedItemList[OwnedListIdx].DefaultItem.bUsesSecondaryAmmo )
	{
    	if( OwnedListIdx + 1 < OwnedItemList.Length )
    	{
    		OwnedItemList.Remove( OwnedListIdx + 1, 1 );
			OwnedItemList.Remove( OwnedListIdx, 1 );
    	}
	}
	else
	{
		OwnedItemList.Remove( OwnedListIdx, 1 );
	}

	// add a single to owned items when removing a dual
	if( ItemInfo.DefaultItem.SingleClassName != '' )
	{
		if( !MyKFIM.GetIsOwned(ItemInfo.DefaultItem.SingleClassName) )
		{
			// assumes singles and duals belong to same perk
			if( TraderItems.GetItemIndicesFromArche( ListIndex, ItemIndex, ItemInfo.DefaultItem.SingleClassName, ItemInfo.DefaultItem.AssociatedPerkClass) )
			{
				if( ListIndex == 255 ) // why use a byte? now we have to use 255 instead of something like INDEX_NONE
				{
					AddWeaponToOwnedItemList( TraderItems.OffPerkItems[ItemIndex] );
				}
				else
				{
					AddWeaponToOwnedItemList( TraderItems.TraderItemList[ListIndex].ItemList[ItemIndex] );
				}
			}
		}
	}
}

function AddItemByPriority( out SItemInformation WeaponInfo )
{
	local byte i;
	local byte WeaponGroup, WeaponPriority;
	local byte BestIndex;

	BestIndex = 0;
	WeaponGroup = WeaponInfo.DefaultItem.InventoryGroup;
	WeaponPriority = WeaponInfo.DefaultItem.GroupPriority;

	for( i = 0; i < OwnedItemList.length; i++ )
	{
		// If the weapon belongs in the group prior to the current weapon, we've found the spot
		if( WeaponGroup < OwnedItemList[i].DefaultItem.InventoryGroup )
		{
			BestIndex = i;
			break;
		}
		else if( WeaponGroup == OwnedItemList[i].DefaultItem.InventoryGroup )
		{
			if( WeaponPriority > OwnedItemList[i].DefaultItem.GroupPriority )
			{
				// if the weapon is in the same group but has a higher priority, we've found the spot
				BestIndex = i;
				break;
			}
			else if( WeaponPriority == OwnedItemList[i].DefaultItem.GroupPriority && 
				MyKFPC.CurrentPerk.Class == WeaponInfo.DefaultItem.AssociatedPerkClass )
			{
				// if the weapons have the same priority give the slot to the on perk weapon
				BestIndex = i;
				break;
			}
		}
		else
		{
			// Covers the case if this weapon is the only item in the last group
			BestIndex = i + 1;
		}
	}

	OwnedItemList.InsertItem( BestIndex, WeaponInfo );
	// Add secondary ammo immediately after the main weapon
	if( WeaponInfo.DefaultItem.bUsesSecondaryAmmo )
   	{
   		WeaponInfo.bIsSecondaryAmmo = true;
		OwnedItemList.InsertItem( BestIndex + 1, WeaponInfo );
   	}
}

function SetTraderItemDetails(int ItemIndex)
{
	local STraderItem SelectedItem;
	local bool bCanAfford, bCanBuyItem, bCanCarry;
	SelectedList = TL_Shop;
    if (ItemDetails != none && ShopContainer != none)
    {
    	if (ShopWeaponList.length >= 0 && ItemIndex < ShopWeaponList.length)
    	{
			SelectedItemIndex = ItemIndex;
			SelectedItem = ShopWeaponList[ItemIndex];

			bCanAfford = ShopContainer.GetCanAfford( MyKFIM.GetAdjustedBuyPriceFor(SelectedItem) );
			bCanCarry = ShopContainer.CanCarry(SelectedItem.BlocksRequired);

			if (!bCanAfford || !bCanCarry)
			{
				bCanBuyItem = false;
			}
			else
			{
				bCanBuyItem = true;
			}

			ItemDetails.SetShopItemDetails(SelectedItem, MyKFIM.GetAdjustedBuyPriceFor(SelectedItem), bCanCarry, bCanBuyItem);
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
		ItemDetails.SetPlayerItemDetails(SelectedItem, OwnedItemList[ItemIndex].SellPrice);
		bCanBuyOrSellItem = SelectedItem.bSellable;
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
		ItemDetails.SetPlayerItemDetails(DefaultItemInfo, ItemInfo.SellPrice);
		bCanBuyOrSellItem = DefaultItemInfo.bSellable;
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

function BoughtAmmo(int AmountPurchased, int Price, EItemType ItemType, optional name ClassName, optional class<KFPerk> PerkClass, optional bool bIsSecondaryAmmo)
{
	local byte ListIndex, ItemIndex;
    AddDosh( -Price );

    if( ItemType == IT_Weapon )
    {
        // Get the proper weapon prices from the servers trader archetype
    	TraderItems.GetItemIndicesFromArche(ListIndex, ItemIndex, ClassName, PerkClass);
    }

	MyKFIM.BuyAmmo( AmountPurchased, ItemType, ListIndex, ItemIndex, bIsSecondaryAmmo );
}

//==============================================================
// Inventory Update Functions - Buying Weapons and Ammo
//==============================================================
function RefreshItemComponents()
{
    if( PlayerInventoryContainer != none && PlayerInfoContainer != none )
    {
	    PlayerInventoryContainer.RefreshPlayerInventory();
	    RefreshShopItemList(CurrentTab, CurrentFilterIndex);
	  	GameInfoContainer.UpdateGameInfo();
	  	GameInfoContainer.SetDosh(TotalDosh);
	  	GameInfoContainer.SetCurrentWeight(TotalBlocks, MaxBlocks);

	  	if(SelectedList == TL_Shop)
	  	{
	  		SetTraderItemDetails(SelectedItemIndex);
	  	}
	  	else if(bGenericItemSelected)
	  	{
	  		SetGenericItemDetails( LastDefaultItemInfo, LastItemInfo);
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
				ShopContainer.RefreshWeaponListByPerk(FilterIndex, ShopWeaponList);
				FilterContainer.SetPerkFilterData(FilterIndex);
			break;
			case (TI_Type):
				ShopContainer.RefreshItemsByType(FilterIndex, ShopWeaponList);
				FilterContainer.SetTypeFilterData(FilterIndex);
			break;
			case (TI_Favorites):
				ShopContainer.RefreshFavoriteItems(ShopWeaponList);
				FilterContainer.ClearFilters();
			break;
			case (TI_All):
				ShopContainer.RefreshAllItems(ShopWeaponList);
				FilterContainer.ClearFilters();
			break;
		}
		FilterContainer.SetInt("selectedTab", TabIndex);
		FilterContainer.SetInt("selectedFilter", FilterIndex);

		if(SelectedList == TL_Shop)
		{
			if( SelectedItemIndex >= ShopWeaponList.length )
			{
				SelectedItemIndex = ShopWeaponList.length - 1;
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
			break;
		}
	}

	if (!bUnfavoriteItem)
	{
		FavoritedItems.AddItem(ClassName);
	}

	SaveConfig();
}

/** Called from KFGFxTraderContainer_Store */
simulated function int GetAdjustedBuyPriceFor( const out STraderItem ShopItem )
{
	return MyKFIM.GetAdjustedBuyPriceFor( ShopItem );
}

//==============================================================
// ActionScript Callbacks - Trader and Player Inventory
//==============================================================

function Callback_BuyOrSellItem()
{
	local STraderItem ShopItem;
	local SItemInformation ItemInfo;
	local bool bCanAfford, bCanCarry;

	if (bCanBuyOrSellItem)
	{
		if (SelectedList == TL_Shop)
		{
			ShopItem = ShopWeaponList[SelectedItemIndex];

			AddDosh(-MyKFIM.GetAdjustedBuyPriceFor(ShopItem));
			AddBlocks(ShopItem.BlocksRequired);

			AddWeaponToOwnedItemList(ShopItem);

			RefreshItemComponents();
			SetNewSelectedIndex(ShopWeaponList.length);
	    	SetTraderItemDetails(SelectedItemIndex);
	    	ShopContainer.ActionScriptVoid("itemBought");
		}
		else
		{
			ItemInfo = OwnedItemList[SelectedItemIndex];

		    AddDosh(ItemInfo.SellPrice);
		   	AddBlocks(-ItemInfo.DefaultItem.BlocksRequired);

			RemoveWeaponFromOwnedItemList( SelectedItemIndex );

	   	    RefreshItemComponents();
	   	    SetNewSelectedIndex(OwnedItemList.length);
			SetPlayerItemDetails(SelectedItemIndex);
			PlayerInventoryContainer.ActionScriptVoid("itemSold");
		}
	}
	else if( SelectedList == TL_Shop )
	{
		ShopItem = ShopWeaponList[SelectedItemIndex];

		bCanAfford = ShopContainer.GetCanAfford( MyKFIM.GetAdjustedBuyPriceFor(ShopItem) );
		bCanCarry = ShopContainer.CanCarry( ShopItem.BlocksRequired );

		MyKFPC.PlayTraderSelectItemDialog( !bCanAfford, !bCanCarry );
	}
}

function Callback_FavoriteItem()
{
	if (SelectedList == TL_Shop)
	{
		ToggleFavorite(ShopWeaponList[SelectedItemIndex].ClassName);
		if (CurrentTab == TI_Favorites)
		{
			RefreshItemComponents();
			SetNewSelectedIndex(ShopWeaponList.length);
		}
		SetTraderItemDetails(SelectedItemIndex);
	}
	else
	{
		ToggleFavorite(OwnedItemList[SelectedItemIndex].DefaultItem.ClassName);
		SetPlayerItemDetails(SelectedItemIndex);
	}
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
	CurrentFilterIndex = 0;
	CurrentTab = TabIndices(TabIndex);
	RefreshShopItemList(CurrentTab, CurrentFilterIndex);
}

//==============================================================
// ActionScript Callbacks - Player Inventory
//==============================================================
function Callback_BuyGrenade()
{
	if( PlayerInventoryContainer != none )
    {
		PlayerInventoryContainer.BuyGrenade(GrenadeItem);
		RefreshItemComponents();
	}
}

function Callback_FillGrenades()
{
	if (PlayerInventoryContainer != none)
    {
		PlayerInventoryContainer.FillAmmo(GrenadeItem, true);
		RefreshItemComponents();
	}
}

function Callback_FillArmor()
{
	if (PlayerInventoryContainer != none)
    {
		PlayerInventoryContainer.FillArmor(ArmorItem);
		RefreshItemComponents();
	}
}

function Callback_FillAmmo(int ItemIndex)
{
	local SItemInformation ItemInfo;
    if (PlayerInventoryContainer != none)
    {
    	ItemInfo = OwnedItemList[ItemIndex];
		PlayerInventoryContainer.FillAmmo(ItemInfo);
		OwnedItemList[ItemIndex] = ItemInfo;
		RefreshItemComponents();
	}
}

function Callback_BuyMagazine(int ItemIndex)
{
    if (PlayerInventoryContainer != none)
    {
	    PlayerInventoryContainer.BuyMagazine(ItemIndex);
		RefreshItemComponents();
	}
}

function Callback_AutoFill(int ItemIndex)
{
    if (PlayerInventoryContainer != none)
    {
	    PlayerInventoryContainer.StartAutoFill();
	}
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
	SetGenericItemDetails(TraderItems.ArmorItem, ArmorItem);
}

function Callback_GrenadeItemSelected()
{
	SetGenericItemDetails(GrenadeItem.DefaultItem, GrenadeItem);
}

//==============================================================
// Player Info
//==============================================================

function Callback_PerkChanged(int PerkIndex)
{
	MyKFPC.RequestPerkChange(PerkIndex);
	MyKFPC.SetHaveUpdatePerk(true);
	
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
	SubWidgetBindings.Add((WidgetName="gameInfoContainer",WidgetClass=class'KFGFxTraderContainer_GameInfo'))
	SubWidgetBindings.Add((WidgetName="filterContainer",WidgetClass=class'KFGFxTraderContainer_Filter'))
	SubWidgetBindings.Add((WidgetName="shopContainer",WidgetClass=class'KFGFxTraderContainer_Store'))
	SubWidgetBindings.Add((WidgetName="playerInfoContainer",WidgetClass=class'KFGFxTraderContainer_PlayerInfo'))
	SubWidgetBindings.Add((WidgetName="playerInventoryContainer",WidgetClass=class'KFGFxTraderContainer_PlayerInventory'))
	SubWidgetBindings.Add((WidgetName="itemDetailsContainer",WidgetClass=class'KFGFxTraderContainer_ItemDetails'))
}
