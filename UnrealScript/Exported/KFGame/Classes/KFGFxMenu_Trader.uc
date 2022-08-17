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
	SetString("cancelPromptName", ExitMenuString);
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
	if(MyKFPC.MyGFxHUD.WeaponSelectWidget != none)
	{
		MyKFPC.MyGFxHUD.WeaponSelectWidget.RefreshWeaponSelect();
	}

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
	if( MyKFPC != none && PlayerInfoContainer != none )
	{
		if(MyKFPC.CurrentPerk != LastPerkClass)
		{
			PlayerInfoContainer.SetPerkInfo();
			PlayerInfoContainer.SetPerkList();
			LastPerkClass = MyKFPC.CurrentPerk;

			RefreshItemComponents();
			OnOpen();
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
		// init armor purchase values
		ArmorItem.SpareAmmoCount = KFP.Armor;
		ArmorItem.MaxSpareAmmo = KFP.GetMaxArmor();
	   	ArmorItem.AmmoPricePerMagazine = TraderItems.ArmorPrice * MyKFPC.CurrentPerk.GetArmorDiscountMod();
	   	ArmorItem.DefaultItem.WeaponDef = TraderItems.ArmorDef;

		// init grenade purchase values
		GrenadeItem.SpareAmmoCount = MyKFIM.GrenadeCount;
		GrenadeItem.MaxSpareAmmo = KFP.GetPerk().MaxGrenadeCount;
	   	GrenadeItem.AmmoPricePerMagazine = TraderItems.GrenadePrice;
	   	GrenadeItem.DefaultItem.WeaponDef = MyKFPC.CurrentPerk.GrenadeWeaponDef;

		// @temp: fill in stuff that is normally serialized in the archetype
		GrenadeItem.DefaultItem.AssociatedPerkClass = MyKFPC.CurrentPerk.Class;

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

	for (i = 0; i < TraderItems.SaleItems.Length; i++)
	{
    	if( KFW.Class.name == TraderItems.SaleItems[i].ClassName )
    	{
    		SetWeaponInfo(KFW, TraderItems.SaleItems[i]);
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
	WeaponInfo.DefaultItem = DefaultItem;

	WeaponInfo.AmmoPricePerMagazine = DefaultItem.WeaponDef.default.AmmoPricePerMag;
	WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor( DefaultItem, KFW );

    AddItemByPriority( WeaponInfo );

   	if( DefaultItem.WeaponDef.static.UsesSecondaryAmmo() )
   	{
   		WeaponInfo.bIsSecondaryAmmo = true;
		if (MyKFIM.bLogInventory) LogInternal("SetWeaponInfo: Adding" @ DefaultItem.ClassName @ "to OwnedItemList");
		OwnedItemList.AddItem( WeaponInfo );
   	}

   	// if adding a dual, remove the related single
   	if( DefaultItem.SingleClassName != '' )
   	{
   		RemoveWeaponFromOwnedItemList( , DefaultItem.SingleClassName, true );
   	}
}

//==============================================================
// Item details updates
//==============================================================

// We've bought a new item, add its information to our owned item list
function int AddWeaponToOwnedItemList( STraderItem DefaultItem, optional bool bDoNotBuy )
{
	local SItemInformation WeaponInfo;
	local KFPerk CurrentPerk;
	local byte ItemIndex;
	local int DefaultMagazineCapacity, AddedWeaponIndex, OwnedSingleIdx, SingleDualAmmoDiff;
	local bool bShouldMagSizeModifySpareAmmo, bAddingDual;

	CurrentPerk = MyKFPC.CurrentPerk;

	if (MyKFIM.bLogInventory) LogInternal("AddWeaponToOwnedItemList: DefaultItem="$DefaultItem.ClassName);

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

	// if adding a dual, adjust the displayed ammo count to reflect ammo of single
	bAddingDual = DefaultItem.SingleClassName != '';
	if( bAddingDual )
	{
		for( OwnedSingleIdx = 0; OwnedSingleIdx < OwnedItemList.Length; ++OwnedSingleIdx )
		{
			if( OwnedItemList[OwnedSingleIdx].DefaultItem.ClassName == DefaultItem.SingleClassName )
			{
				SingleDualAmmoDiff = OwnedItemList[OwnedSingleIdx].SpareAmmoCount - WeaponInfo.SpareAmmoCount;
				WeaponInfo.SpareAmmoCount = OwnedItemList[OwnedSingleIdx].SpareAmmoCount /*+ WeaponInfo.MagazineCapacity/2*/; // can't add mag/2 ammo here because it makes buying two singles better than buying a dual
				break;
			}
		}
	}

	// allow perk to set spare ammo to max (uses different params than ModifySpareAmmoAmount)
	// mostly just used for firebug
	CurrentPerk.MaximizeSpareAmmoAmount( DefaultItem.AssociatedPerkClass, WeaponInfo.SpareAmmoCount, DefaultItem.MaxSpareAmmo + DefaultItem.MagazineCapacity );

	WeaponInfo.SecondaryAmmoCount = DefaultItem.MaxSecondaryAmmoCount;
	CurrentPerk.ModifyMagSizeAndNumber( none, WeaponInfo.SecondaryAmmoCount, DefaultItem.AssociatedPerkClass );

	WeaponInfo.MaxSecondaryAmmoCount = DefaultItem.MaxSecondaryAmmoCount;
	CurrentPerk.ModifyMaxSpareAmmoAmount( none, WeaponInfo.MaxSecondaryAmmoCount, DefaultItem );

	WeaponInfo.AmmoPricePerMagazine = DefaultItem.WeaponDef.default.AmmoPricePerMag;
   	WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor( DefaultItem );

	WeaponInfo.DefaultItem = DefaultItem;

   	AddedWeaponIndex = AddItemByPriority( WeaponInfo );

   	if( !bDoNotBuy )
   	{
		if (MyKFIM.bLogInventory) LogInternal("AddWeaponToOwnedItemList: Calling ServerBuyWeapon on" @ DefaultItem.ClassName);
	    // Tell the server to buy the weapon using its trader archetype info
		TraderItems.GetItemIndicesFromArche( ItemIndex, DefaultItem.ClassName );
		MyKFIM.ServerBuyWeapon(ItemIndex);
	}
	else
	{
		// Tell the server to add the weapon (without buying) using its trader archetype info
		TraderItems.GetItemIndicesFromArche( ItemIndex, DefaultItem.ClassName );
		if (MyKFIM.bLogInventory) LogInternal("AddWeaponToOwnedItemList: Calling ServerAddTransactionItem on" @ DefaultItem.ClassName);
		MyKFIM.ServerAddTransactionItem(ItemIndex);
		AddBlocks( DefaultItem.BlocksRequired );
	}

	// if adding a dual, set its transaction ammo (given at trader close) to reflect the single it's replacing
   	if( bAddingDual )
   	{
   		AddTransactionAmmo( ItemIndex, SingleDualAmmoDiff /*+ WeaponInfo.MagazineCapacity/2*/, false );
   		RemoveWeaponFromOwnedItemList( , DefaultItem.SingleClassName, true );
   	}

   	return AddedWeaponIndex;
}

/** Removes item from owned list and sells it, if applicable */
function RemoveWeaponFromOwnedItemList( optional int OwnedListIdx = INDEX_NONE, optional name ClassName, optional bool bDoNotSell )
{
	local SItemInformation ItemInfo;
	local byte ItemIndex;
	local int SingleOwnedIndex;

	if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: OwnedListIdx="$OwnedListIdx @ "ClassName="$ClassName @ "bDoNotSell="$bDoNotSell);
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
	if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: OwnedItemList.length="$OwnedItemList.length);
	if( OwnedListIdx >= OwnedItemList.length )
	{
		return;
	}

	ItemInfo = OwnedItemList[OwnedListIdx];
	if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: ItemInfo.ClassName="$ItemInfo.DefaultItem.ClassName @ "ItemInfo.SingleClassName="$ItemInfo.DefaultItem.SingleClassName @ "ItemInfo.DualClassName="$ItemInfo.DefaultItem.DualClassName);

	if( !bDoNotSell )
	{
		// Sell the weapon from our inventory immediately
		TraderItems.GetItemIndicesFromArche( ItemIndex, ItemInfo.DefaultItem.ClassName );
		if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Calling ServerSellWeapon on" @ ItemInfo.DefaultItem.ClassName);
		MyKFIM.ServerSellWeapon(ItemIndex);
	}
	else
	{
		// Remove the weapon from our inventory immediately (without selling)
		TraderItems.GetItemIndicesFromArche( ItemIndex, ItemInfo.DefaultItem.ClassName );
		if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Calling ServerRemoveTransactionItem on" @ ItemInfo.DefaultItem.ClassName);
		MyKFIM.ServerRemoveTransactionItem( ItemIndex );
		AddBlocks( -ItemInfo.DefaultItem.BlocksRequired );
	}
	if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: OwnedListIdx="$OwnedListIdx @ "OwnedItemList[OwnedListIdx]="$OwnedItemList[OwnedListIdx].DefaultItem.ClassName);

	// If we try to sell a weapons secondary ammo slot
	if( OwnedItemList[OwnedListIdx].bIsSecondaryAmmo )
	{
		if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Removing" @ OwnedItemList[OwnedListIdx].DefaultItem.ClassName @ "from OwnedItemList");
		OwnedItemList.Remove( OwnedListIdx, 1 );
		if( OwnedListIdx - 1 >= 0 )
    	{
			if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Removing" @ OwnedItemList[OwnedListIdx-1].DefaultItem.ClassName @ "from OwnedItemList");
    		OwnedItemList.Remove( OwnedListIdx - 1, 1 );
    	}
	}
	// If the weapon we're selling uses secondary ammo, remove the secondary ammo listing also
	else if( OwnedItemList[OwnedListIdx].DefaultItem.WeaponDef.static.UsesSecondaryAmmo() )
	{
    	if( OwnedListIdx + 1 < OwnedItemList.Length )
    	{
			if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Removing" @ OwnedItemList[OwnedListIdx+1].DefaultItem.ClassName @ "from OwnedItemList");
    		OwnedItemList.Remove( OwnedListIdx + 1, 1 );
			if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Removing" @ OwnedItemList[OwnedListIdx].DefaultItem.ClassName @ "from OwnedItemList");
			OwnedItemList.Remove( OwnedListIdx, 1 );
    	}
	}
	else
	{
		if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: Removing" @ OwnedItemList[OwnedListIdx].DefaultItem.ClassName @ "from OwnedItemList");
		OwnedItemList.Remove( OwnedListIdx, 1 );
	}

	if (MyKFIM.bLogInventory) LogInternal("RemoveWeaponFromOwnedItemList: ItemInfo.DefaultItem.SingleClassName="$ItemInfo.DefaultItem.SingleClassName);

	// add a single to owned items when removing a dual
	if( ItemInfo.DefaultItem.SingleClassName != '' )
	{
		// When removing a dual, always add a single to the owned list so that it shows up in the player inventory UI. 
		// If we don't own the single, then also buy it (add it to the transaction list).

		if( TraderItems.GetItemIndicesFromArche( ItemIndex, ItemInfo.DefaultItem.SingleClassName) )
		{
			SingleOwnedIndex = AddWeaponToOwnedItemList( TraderItems.SaleItems[ItemIndex], true );

			// modify default single ammo based on how much ammo dual had when sold
			AddTransactionAmmo( ItemIndex, OwnedItemList[OwnedListIdx].SpareAmmoCount - OwnedItemList[SingleOwnedIndex].SpareAmmoCount, false );

			// update the values in the trader UI
			OwnedItemList[SingleOwnedIndex].SpareAmmoCount = OwnedItemList[OwnedListIdx].SpareAmmoCount;
		}
	}
}

/** Adds (or subtracts) ammo from a weapon transaction */
native private final function AddTransactionAmmo( byte ItemIndex, int Amount, bool bSecondaryAmmo );

function int AddItemByPriority( out SItemInformation WeaponInfo )
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

	if (MyKFIM.bLogInventory) LogInternal("AddItemByPriority: Inserting" @ WeaponInfo.DefaultItem.ClassName @ "into OwnedItemList");
	OwnedItemList.InsertItem( BestIndex, WeaponInfo );
	// Add secondary ammo immediately after the main weapon
	if( WeaponInfo.DefaultItem.WeaponDef.static.UsesSecondaryAmmo() )
   	{
   		WeaponInfo.bIsSecondaryAmmo = true;
   	}

   	return BestIndex;
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

			bCanAfford = ShopContainer.GetCanAfford( GetAdjustedBuyPriceFor(SelectedItem) );
			bCanCarry = ShopContainer.CanCarry( SelectedItem );

			if (!bCanAfford || !bCanCarry)
			{
				bCanBuyItem = false;
			}
			else
			{
				bCanBuyItem = true;
			}

			ItemDetails.SetShopItemDetails(SelectedItem, GetAdjustedBuyPriceFor(SelectedItem), bCanCarry, bCanBuyItem);
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
		bCanBuyOrSellItem = IsSellable(SelectedItem);
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
		bCanBuyOrSellItem = IsSellable(DefaultItemInfo);
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

/** returns true if item can be bought/sold at trader */
function bool IsSellable(const out STraderItem TraderItem)
{
	return (TraderItem.WeaponDef != None && TraderItem.WeaponDef.default.BuyPrice > 0);
}

function BoughtAmmo(int AmountPurchased, int Price, EItemType ItemType, optional name ClassName, optional bool bIsSecondaryAmmo)
{
	local byte ItemIndex;
    AddDosh( -Price );

    if( ItemType == EIT_Weapon )
    {
        // Get the proper weapon prices from the servers trader archetype
    	TraderItems.GetItemIndicesFromArche(ItemIndex, ClassName);
    }

	MyKFIM.BuyAmmo( AmountPurchased, ItemType, ItemIndex, bIsSecondaryAmmo );
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
	return MyKFIM.GetAdjustedBuyPriceFor( ShopItem, OwnedItemList );
}

/** Modifies blocks required for the UI (e.g. in the case of dualies) */
simulated function int GetDisplayedBlocksRequiredFor( const out STraderItem Item )
{
	return MyKFIM.GetDisplayedBlocksRequiredFor( Item );
}

function bool IsInOwnedItemList( name ItemName )
{
	local int i;
	local name OwnedItemClassName;

	for (i = 0; i < OwnedItemList.Length; i++)
	{
		OwnedItemClassName = OwnedItemList[i].DefaultItem.ClassName;
		if ( OwnedItemClassName == '' )
		{
			WarnInternal("Owned item with Class NAME_None");
			continue;
		}
     	else if ( OwnedItemClassName == ItemName )
     	{
     	 	return true;
     	}
   	}

   	return false;
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

			AddDosh(-GetAdjustedBuyPriceFor(ShopItem));
			AddBlocks( ShopItem.BlocksRequired );

			if (MyKFIM.bLogInventory) LogInternal("Callback_BuyOrSellItem: ShopItem="$ShopItem.ClassName);
			AddWeaponToOwnedItemList(ShopItem);

			RefreshItemComponents();
			SetNewSelectedIndex(ShopWeaponList.length);
	    	SetTraderItemDetails(SelectedItemIndex);
	    	ShopContainer.ActionScriptVoid("itemBought");
		}
		else
		{
			if (MyKFIM.bLogInventory) LogInternal("Callback_BuyOrSellItem: SelectedItemIndex="$SelectedItemIndex);
			ItemInfo = OwnedItemList[SelectedItemIndex];

			if (MyKFIM.bLogInventory) LogInternal("Callback_BuyOrSellItem: ItemInfo="$ItemInfo.DefaultItem.ClassName);

		    AddDosh(ItemInfo.SellPrice);
		   	AddBlocks( -ItemInfo.DefaultItem.BlocksRequired );

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

		bCanAfford = ShopContainer.GetCanAfford( GetAdjustedBuyPriceFor(ShopItem) );
		bCanCarry = ShopContainer.CanCarry( ShopItem );

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
	CurrentTab = TabIndices(TabIndex);
	if(CurrentTab == TI_Perks && MyKFPRI != none)
	{
		CurrentFilterIndex = MyKFPRI.NetPerkIndex;
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
	SetGenericItemDetails(ArmorItem.DefaultItem, ArmorItem);
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
   ExitMenuString="EXIT MENU"
   SubWidgetBindings(0)=(WidgetName="GameInfoContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_GameInfo')
   SubWidgetBindings(1)=(WidgetName="FilterContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_Filter')
   SubWidgetBindings(2)=(WidgetName="ShopContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_Store')
   SubWidgetBindings(3)=(WidgetName="PlayerInfoContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_PlayerInfo')
   SubWidgetBindings(4)=(WidgetName="PlayerInventoryContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_PlayerInventory')
   SubWidgetBindings(5)=(WidgetName="itemDetailsContainer",WidgetClass=Class'KFGame.KFGFxTraderContainer_ItemDetails')
   Name="Default__KFGFxMenu_Trader"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
