//=============================================================================
// KFGFxTraderContainer_Store
//=============================================================================
// This class holds all of the functions and variables corresponding to the
// traders inventory list ( Items you can buy ). This class will perform a
// single call to actionscript to pass the "ItemDataArray" to the flash file.
// This array contains all the weapon names, prices, and descriptions.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 8/13/2013
//=============================================================================

class KFGFxTraderContainer_Store extends KFGFxObject_Container
	DependsOn(KFGFxObject_TraderItems);

var KFGFxMenu_Trader MyTraderMenu; // Reference to the movie player that owns us

var array< STraderItem > SlotsItemList;	// The Trader Item Info for each Item slot

var localized string TraderString;

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	MyTraderMenu = KFGFxMenu_Trader( NewParentMenu );
	SetString("shopHeaderName", TraderString);
	GetPC().SetTimer(0.1f, false,'DelayedRefresh', self);
}

//@todo Hack to get around AS clearing the weapon list once it's populated
function DelayedRefresh()
{
	MyTraderMenu.RefreshShopItemList(MyTraderMenu.CurrentTab, MyTraderMenu.CurrentFilterIndex);	
	SetSelectedIndex(0);
}

/** called each time trader UI is opened after initial */
function OnTraderReopened()
{
}

//==============================================================
// Update Item List
//==============================================================
function SetSelectedIndex( int SelectedIndex )
{
	SetInt( "selectedIndex", SelectedIndex );
}

// Grab the list of perk weapons that we do not already own and set their information
function RefreshWeaponListByPerk(byte FilterIndex, out array<STraderItem> ItemList)
{
 	local int i, SlotIndex;
	local GFxObject ItemDataArray; // This array of information is sent to ActionScript to update the Item data
	local array<STraderItem> FullItemList;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if (KFPC != none)
	{
		SlotIndex = 0;
	    ItemList.length = 0;	    
	    ItemDataArray = CreateArray();

		FullItemList = MyTraderMenu.TraderItems.SaleItems;

		for (i = 0; i < FullItemList.Length; i++)
		{
			if ( IsItemFiltered(FullItemList[i]) )
			{
				continue; // Skip this item if it's in our inventory
			}
			else if ( FullItemList[i].AssociatedPerkClass != None 
				&& (FilterIndex >= KFPC.PerkList.Length || FullItemList[i].AssociatedPerkClass != KFPC.PerkList[FilterIndex].PerkClass) )
			{
				continue; // filtered by perk
			}
			else
			{
				ItemList.AddItem( FullItemList[i] );
				SetItemInfo(ItemDataArray, FullItemList[i], SlotIndex);
				SlotIndex++;
			}
		}

		SetObject("shopData", ItemDataArray);
	}
}

function RefreshItemsByType(byte FilterIndex, out array<STraderItem> ItemList)
{
 	local int i, SlotIndex;
	local GFxObject ItemDataArray; // This array of information is sent to ActionScript to update the Item data
	local array<STraderItem> FullItemList;

    SlotIndex = 0;
    ItemList.length = 0;
	
    ItemDataArray = CreateArray();
    FullItemList = MyTraderMenu.TraderItems.SaleItems;

	for (i = 0; i < FullItemList.Length; i++)
	{
		if ( IsItemFiltered(FullItemList[i]) || FilterIndex != FullItemList[i].TraderFilter )
		{
			continue; // Skip this item if it's in our inventory
		}
		else
		{
			ItemList.AddItem( FullItemList[i] );
			SetItemInfo(ItemDataArray, FullItemList[i], SlotIndex);
			SlotIndex++;
		}
	}

	SetObject("shopData", ItemDataArray);
}

// Grab the list of perk weapons that we do not already own and set their information
function RefreshFavoriteItems(out array<STraderItem> ItemList)
{
 	local int i, SlotIndex;
	local GFxObject ItemDataArray; // This array of information is sent to ActionScript to update the Item data
	local array<STraderItem> FullItemList;

    SlotIndex = 0;
    ItemList.length = 0;

    ItemDataArray = CreateArray();
	FullItemList = MyTraderMenu.TraderItems.SaleItems;

	for (i = 0; i < FullItemList.Length; i++)
	{
		if ( IsItemFiltered(FullItemList[i]) || !MyTraderMenu.GetIsFavorite(FullItemList[i].ClassName) )
		{
			continue; // Skip this item if it's in our inventory
		}
		else
		{
			ItemList.AddItem( FullItemList[i] );
			SetItemInfo(ItemDataArray, FullItemList[i], SlotIndex);
			SlotIndex++;
		}
	}

	SetObject("shopData", ItemDataArray);
}

// Grab the list of perk weapons that we do not already own and set their information
function RefreshAllItems(out array<STraderItem> ItemList)
{
 	local int i, SlotIndex;
	local GFxObject ItemDataArray; // This array of information is sent to ActionScript to update the Item data
	local array<STraderItem> FullItemList;

    SlotIndex = 0;
    ItemList.length = 0;
	
    ItemDataArray = CreateArray();
    FullItemList = MyTraderMenu.TraderItems.SaleItems;

	for (i = 0; i < FullItemList.Length; i++)
	{
		if ( IsItemFiltered(FullItemList[i]) )
		{
			continue; // Skip this item if it's in our inventory
		}
		else
		{
			ItemList.AddItem( FullItemList[i] );
			SetItemInfo(ItemDataArray, FullItemList[i], SlotIndex);
			SlotIndex++;
		}
	}

	SetObject("shopData", ItemDataArray);
}

function SetItemInfo(out GFxObject ItemDataArray, out STraderItem TraderItem, int SlotIndex)
{
	local GFxObject SlotObject;
	local string ItemTexPath;
	local string IconPath;
	local bool bCanAfford, bCanCarry;
	local int AdjustedBuyPrice;

	SlotObject = CreateObject( "Object" );

	ItemTexPath = "img://"$TraderItem.WeaponDef.static.GetImagePath();
	if( TraderItem.AssociatedPerkClass != none )
	{
		IconPath = "img://"$TraderItem.AssociatedPerkClass.static.GetPerkIconPath();
	}
	else
	{
		IconPath = "img://"$class'KFGFxObject_TraderItems'.default.OffPerkIconPath;
	}

	SlotObject.SetString( "weaponSource", ItemTexPath );
	SlotObject.SetString( "perkIconSource", IconPath );

	SlotObject.SetString( "weaponName", TraderItem.WeaponDef.static.GetItemName() );
	SlotObject.SetString( "weaponType", TraderItem.WeaponDef.static.GetItemCategory() );
	SlotObject.SetInt( "weaponWeight", MyTraderMenu.GetDisplayedBlocksRequiredFor(TraderItem) );

	AdjustedBuyPrice = MyTraderMenu.GetAdjustedBuyPriceFor(TraderItem);

	SlotObject.SetInt( "weaponCost",  AdjustedBuyPrice );

	bCanAfford = GetCanAfford(AdjustedBuyPrice);
	bCanCarry = CanCarry( TraderItem );

	SlotObject.SetBool("bCanAfford", bCanAfford);
	SlotObject.SetBool("bCanCarry", bCanCarry);
	
	ItemDataArray.SetElementObject( SlotIndex, SlotObject );
}

/** returns true if this item should not be displayed */
function bool IsItemFiltered(const out STraderItem Item)
{
	if ( MyTraderMenu.IsInOwnedItemList(Item.ClassName) )
		return true;
	if ( MyTraderMenu.IsInOwnedItemList(Item.DualClassName) )
		return true;
	if ( !MyTraderMenu.IsSellable(Item) )
		return true;
	if ( Item.WeaponDef.default.SharedUnlockId != SCU_None && !class'KFUnlockManager'.static.IsSharedContentUnlocked(Item.WeaponDef.default.SharedUnlockId) )
     	 	return true;

   	return false;
}

// Checks if we can have enough dosh to buy this item
function bool GetCanAfford(int BuyPrice)
{
	if (BuyPrice > MyTraderMenu.TotalDosh)
	{
		return false;
	}
	return true;
}

// Checks if we can have enough blocks to hold this item
function bool CanCarry( const out STraderItem Item )
{
	if (MyTraderMenu.TotalBlocks + MyTraderMenu.GetDisplayedBlocksRequiredFor(Item) > MyTraderMenu.MaxBlocks)
	{
    	return false;
	}
	return true;
}

defaultproperties
{
   TraderString="PURCHASE GEAR"
   Name="Default__KFGFxTraderContainer_Store"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
