//=============================================================================
// KFAutoPurchaseHeler
//=============================================================================
// Hold logic for auto purchase
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================

class KFAutoPurchaseHelper extends Object within KFPlayerController
dependson(KFGFxMenu_Trader)
native(UI);

var KFPlayerReplicationInfo MyKFPRI;
var KFInventoryManager MyKFIM;

var KFGFxObject_TraderItems TraderItems;

var array<SItemInformation> OwnedItemList;
var SItemInformation GrenadeItem;
var SItemInformation ArmorItem;

var int TotalDosh; // The total amount of dosh we have
var bool bPendingDoshUpdate; // Set this to true if we spent money but haven't received acknowledgement from the server
var int TotalBlocks; // The total amount of blocks that our inventory takes up, plus any transactions
var byte MaxBlocks;  // The maximum number of blocks available

var int PrevArmor;

var int CostPerAutofillCycle;
var int DoshBuffer;

function Initialize()
{
	if( Pawn != none && PlayerReplicationInfo != none )
	{
		MyKFPRI = KFPlayerReplicationInfo( PlayerReplicationInfo );
		MyKFIM = KFInventoryManager( Pawn.InvManager );

		if( MyKFPRI != none && MyKFIM != none )
		{
			// Grab the weapons in our inventory and add them to a stored array called OwnedItemList
			InitializeOwnedItemList();
			TotalBlocks = MyKFIM.CurrentCarryBlocks;
			TotalDosh = MyKFPRI.Score;
			MaxBlocks = MyKFIM.MaxCarryBlocks;
		}
	}
}

/*************************
@Name - Auto purchase 
**************************/
function DoAutoPurchase()
{
	local int PotentialDosh, i;
	local Array <STraderItem> OnPerkWeapons;
	local STraderItem TopTierWeapon;
	local int ItemIndex;
	local bool bSecondaryWeaponPurchased;
	local bool bUpgradeSuccess;
	local bool bAutoFillPurchasedItem;
	local string AutoFillMessageString;

	GetTraderItems();

	if(CurrentPerk.AutoBuyLoadOutPath.length == 0)
	{
		`log("!!!Autobuy load out path not set!!!");
		return;
	}

	for (i = 0; i < CurrentPerk.AutoBuyLoadOutPath.length; i++)
	{
		ItemIndex = TraderItems.SaleItems.Find('WeaponDef', CurrentPerk.AutoBuyLoadOutPath[i]);
		if(ItemIndex != INDEX_NONE)
		{
			OnPerkWeapons.AddItem(TraderItems.SaleItems[ItemIndex]);
		}
	}

	SellOffPerkWeapons();

	TopTierWeapon = GetTopTierWeapon(OnPerkWeapons);
	//can I afford my top teir without selling my current weapon?
	if(!DoIOwnThisWeapon(TopTierWeapon) && GetCanAfford( GetAdjustedBuyPriceFor(TopTierWeapon) + DoshBuffer ) && CanCarry( TopTierWeapon ) )
	{
		bUpgradeSuccess = AttemptUpgrade(TotalDosh, OnPerkWeapons, true);
	}
	else
	{
		PotentialDosh = GetPotentialDosh();
		bUpgradeSuccess = AttemptUpgrade(PotentialDosh+TotalDosh, OnPerkWeapons);
	}
	
	bAutoFillPurchasedItem = StartAutoFill();
	if(DoIOwnThisWeapon(TopTierWeapon))
	{
		while(AttemptToPurchaseNextLowerTier(TotalDosh, OnPerkWeapons))
		{
			bSecondaryWeaponPurchased = true;
			AttemptToPurchaseNextLowerTier(TotalDosh, OnPerkWeapons);
		}	
	}

	MyKFIM.ServerCloseTraderMenu();

	if(bUpgradeSuccess)
	{
		AutoFillMessageString = class'KFCommon_LocalizedStrings'.default.WeaponUpgradeComepleteString;
	}
	else if(bSecondaryWeaponPurchased)
	{
		AutoFillMessageString = class'KFCommon_LocalizedStrings'.default.SecondaryWeaponPurchasedString;
	}
	else if(bAutoFillPurchasedItem)
	{
		AutoFillMessageString = class'KFCommon_LocalizedStrings'.default.AutoFillCompleteString;
	}
	else 
	{
		AutoFillMessageString = class'KFCommon_LocalizedStrings'.default.NoItemsPurchasedString;
	}
	

	if(MyGFxHUD != none)
	{
		MyGFxHUD.ShowNonCriticalMessage( class'KFCommon_LocalizedStrings'.default.AutoTradeCompleteString$AutoFillMessageString );
	}
}

function bool AttemptToPurchaseNextLowerTier(int UseableDosh, const out Array <STraderItem>OnPerkWeapons)
{
	local int LastAfforableItemIndex;
	local STraderItem TempTraderItem;

	LastAfforableItemIndex = GetLastAffordableItemIndex(UseableDosh, OnPerkWeapons);
	if(LastAfforableItemIndex != INDEX_NONE)
	{
		TempTraderItem = OnPerkWeapons[LastAfforableItemIndex];
		PurchaseWeapon(TempTraderItem);		

		StartAutoFill();
		return true;
	}
	return false;
}

function STraderItem GetTopTierWeapon(const out Array <STraderItem>OnPerkWeapons)
{
	local STraderItem HighestValuedWeapon;

	HighestValuedWeapon = GetHighValuedOnPerkWeapon(OnPerkWeapons);

	return HighestValuedWeapon;	
}

function bool AttemptUpgrade(int UseableDosh, const out Array<STraderItem> OnPerkWeapons, optional bool bHaveTopTier)
{
	local STraderItem TempTraderItem;
	local bool bUpgradeSuccess;
	local int LastAfforableItemIndex;
	local SItemInformation MyHighestValuedWeapon;

	MyHighestValuedWeapon = GetHighValuedWeapon(OwnedItemList);
	
	LastAfforableItemIndex = GetLastAffordableItemIndex(UseableDosh, OnPerkWeapons, MyHighestValuedWeapon);

	if(LastAfforableItemIndex != INDEX_NONE)
	{
		TempTraderItem = OnPerkWeapons[LastAfforableItemIndex];
		
		if(MyHighestValuedWeapon.DefaultItem.WeaponDef.default.BuyPrice < TempTraderItem.WeaponDef.default.BuyPrice)
		{
			//Sell on perk weapons
			if(!bHaveTopTier)
			{
				SellOnPerkWeapons();
			}
			PurchaseWeapon(TempTraderItem);
			bUpgradeSuccess = true;
		}
	}	
	return bUpgradeSuccess;
}

function int GetLastAffordableItemIndex(int UseableDosh, const out Array <STraderItem>OnPerkWeapons, optional SItemInformation TradeInItem)
{
	local int LastAfforableItemIndex, i;
	local STraderItem TempTraderItem;
	local int TradeInItemWeight;
	TradeInItemWeight = MyKFIM.GetDisplayedBlocksRequiredFor(TradeInItem.DefaultItem);
	LastAfforableItemIndex = INDEX_NONE;

	//figure out which weapon we can afford
	for (i = 0; i < OnPerkWeapons.length; i++)
	{
		TempTraderItem = OnPerkWeapons[i];
		if(UseableDosh > GetAdjustedBuyPriceFor(TempTraderItem) + DoshBuffer )
		{
			if(!DoIOwnThisWeapon(TempTraderItem) && !( (TotalBlocks - TradeInItemWeight + MyKFIM.GetDisplayedBlocksRequiredFor(TempTraderItem)) > MaxBlocks) && !IsInOwnedItemList(TempTraderItem.DualClassName))
			{
				LastAfforableItemIndex = i;
			}
		}	
		else
		{
			break;
		}
	}
	return LastAfforableItemIndex;	
}

function STraderItem GetHighValuedOnPerkWeapon(const out array<STraderItem> ItemList)
{
	local STraderItem HighestValuedWeapon;
	local int i;

	for (i = 0; i < ItemList.length; i++)
	{
		if( HighestValuedWeapon.WeaponDef == none || ItemList[i].WeaponDef.default.BuyPrice > HighestValuedWeapon.WeaponDef.default.BuyPrice)
		{
			HighestValuedWeapon = ItemList[i];
		}
	}

	return HighestValuedWeapon;
}

function SItemInformation GetHighValuedWeapon(const out array<SItemInformation> ItemList)
{
	local SItemInformation HighestValuedWeapon;
	local int i;

	for (i = 0; i < ItemList.length; i++)
	{
		if(ItemList[i].DefaultItem.BlocksRequired == -1)
		{
			continue;
		}

		if( HighestValuedWeapon.DefaultItem.WeaponDef == none || ItemList[i].DefaultItem.WeaponDef.default.BuyPrice > HighestValuedWeapon.DefaultItem.WeaponDef.default.BuyPrice)
		{
			HighestValuedWeapon = ItemList[i];
		}
	}

	return HighestValuedWeapon;
}

function SellOnPerkWeapons()
{
	local int i;
	
	for (i = 0; i < OwnedItemList.length; i++)
	{
		if( OwnedItemList[i].DefaultItem.AssociatedPerkClasses.length > 0 && OwnedItemList[i].DefaultItem.AssociatedPerkClasses[0] == CurrentPerk.Class && OwnedItemList[i].DefaultItem.BlocksRequired != -1)
		{
			SellWeapon(OwnedItemList[i], i);
			i=-1;
		}
	}
}

function SellOffPerkWeapons()
{
	local int i;
	
	for (i = 0; i < OwnedItemList.length; i++)
	{
		if( OwnedItemList[i].DefaultItem.AssociatedPerkClasses[0] != CurrentPerk.Class && OwnedItemList[i].DefaultItem.BlocksRequired != -1 && OwnedItemList[i].SellPrice != 0 )
		{
			if(CurrentPerk.AutoBuyLoadOutPath.Find(OwnedItemList[i].DefaultItem.WeaponDef) == INDEX_NONE)
			{
				SellWeapon(OwnedItemList[i], i);
				i=-1;
			}
		}
	}
}

function bool DoIOwnThisWeapon(const out STraderItem TraderItem)
{
	return OwnedItemList.Find('DefaultItem', TraderItem) != INDEX_NONE;
}

function int GetPotentialDosh()
{
	local int PotentialDosh, i;

	for (i = 0; i <OwnedItemList.length; i++)
	{
		if(OwnedItemList[i].SellPrice != 0)
		{
			PotentialDosh += OwnedItemList[i].SellPrice;
		}
	}

	return PotentialDosh;
}
/******************
@Name - Trader Items
*******************/
function bool bCanPurchase(STraderItem SelectedItem)
{
	local bool bCanAfford, bCanCarry;

	bCanAfford = GetCanAfford( GetAdjustedBuyPriceFor(SelectedItem) );
	bCanCarry = CanCarry( SelectedItem );

	return bCanCarry && bCanAfford;
}

// Checks if we can have enough dosh to buy this item
function bool GetCanAfford(int BuyPrice)
{
	if (BuyPrice > TotalDosh)
	{
		return false;
	}
	return true;
}

// Checks if we can have enough blocks to hold this item
function bool CanCarry( const out STraderItem Item )
{
	if (TotalBlocks + MyKFIM.GetDisplayedBlocksRequiredFor(Item) > MaxBlocks)
	{
    	return false;
	}
	return true;
}

function PurchaseWeapon(STraderItem ShopItem)
{
	if(!bCanPurchase(ShopItem))
	{		
		return;
	}

	AddDosh(-GetAdjustedBuyPriceFor(ShopItem));
	AddBlocks( ShopItem.BlocksRequired );

	AddWeaponToOwnedItemList(ShopItem);
}

function SellWeapon(SItemInformation ItemInfo, optional int SelectedItemIndex = -1)
{
	AddDosh(ItemInfo.SellPrice);
   	AddBlocks( -ItemInfo.DefaultItem.BlocksRequired );

   	if(SelectedItemIndex != INDEX_NONE)
   	{
   		RemoveWeaponFromOwnedItemList( SelectedItemIndex );
   	}
}

/******************
@Name - Player Inventory
*******************/
function int GetFillArmorCost()
{
	local float ArmorPercentage, FillCost, ArmorPricePerPercent;

	ArmorPercentage = (float(ArmorItem.MaxSpareAmmo - ArmorItem.SpareAmmoCount) / float(ArmorItem.MaxSpareAmmo)) * 100.f;
	ArmorPricePerPercent = ArmorItem.AmmoPricePerMagazine;
	FillCost = FCeil( ArmorPercentage * ArmorPricePerPercent );

	return FillCost;
}

function int FillArmor( )
{
	local float ArmorPricePerPercent, FillCost;
	local float PercentBoughtUnit, PercentArmorBought;
	local int ActualArmorPointsAvailable;
	
	FillCost = GetFillArmorCost();
	ActualArmorPointsAvailable = ArmorItem.MaxSpareAmmo - ArmorItem.SpareAmmoCount;

	PercentBoughtUnit = float(ActualArmorPointsAvailable) / float(ArmorItem.MaxSpareAmmo);
	PercentArmorBought = PercentBoughtUnit * 100.f;

	// Buy as much armor as we possibly can
    if (FillCost > TotalDosh)
    {
   		ArmorPricePerPercent = ArmorItem.AmmoPricePerMagazine;

        // Because we are using ints this will round down and we can get how much we actually spent
    	PercentArmorBought = TotalDosh / ArmorPricePerPercent;
    	PercentBoughtUnit = PercentArmorBought / 100.f;
		FillCost = ArmorPricePerPercent * PercentArmorBought;
    }

    PercentArmorBought = (PercentArmorBought > 0.f && PercentArmorBought < 1.f) ? 1.f : PercentArmorBought;
    ArmorItem.SpareAmmoCount = FMin( float(ArmorItem.SpareAmmoCount) + (PercentBoughtUnit * float(ArmorItem.MaxSpareAmmo)), float(ArmorItem.MaxSpareAmmo) );
	
	BoughtAmmo(PercentArmorBought, FillCost, EIT_Armor);
	return FillCost;
}

function bool AttemptBuyArmorChunk( out int InAutoFillDosh )
{
	local float ArmorPricePerPercent, ChunkCost;
	local int PercentArmorBought;

	ArmorPricePerPercent = ArmorItem.AmmoPricePerMagazine;
	PercentArmorBought = 0;
	if( ArmorItem.SpareAmmoCount < ArmorItem.MaxSpareAmmo )
	{
	    // Because we are using int's this will round down and we can get how much we actually spent
		PercentArmorBought = CostPerAutofillCycle / ArmorPricePerPercent;
		ChunkCost = ArmorPricePerPercent * PercentArmorBought;
		if( InAutoFillDosh < ChunkCost )
		{
			PercentArmorBought = InAutoFillDosh / ArmorPricePerPercent;
			ChunkCost = ArmorPricePerPercent * PercentArmorBought;
		}

		InAutoFillDosh -= ChunkCost;

	    ArmorItem.SpareAmmoCount = FMin(ArmorItem.SpareAmmoCount + PercentArmorBought, ArmorItem.MaxSpareAmmo);
		BoughtAmmo(PercentArmorBought, ChunkCost, EIT_Armor);
	}
	return (PercentArmorBought > 0);
}

//grenade

function int GetFillGrenadeCost( )
{
	local int AmmoCount, MaxAmmoCount;
    local float MissingAmmo, PricePerMag;

	AmmoCount = GrenadeItem.SpareAmmoCount;
	MaxAmmoCount = GrenadeItem.MaxSpareAmmo;
	PricePerMag = GrenadeItem.AmmoPricePerMagazine;

	MissingAmmo = MaxAmmoCount - AmmoCount;
	// Use FCeil so you can never buy ammo for 0 Do$h on an int conversion
    return FCeil(MissingAmmo * PricePerMag);
}

function int BuyGrenade( )
{
	local int MagAmmoCost;
	MagAmmoCost = 0;
    if( (GrenadeItem.MaxSpareAmmo - GrenadeItem.SpareAmmoCount) > 0 )
    {
        MagAmmoCost = GrenadeItem.AmmoPricePerMagazine;

        GrenadeItem.SpareAmmoCount += 1;

		BoughtAmmo(1, MagAmmoCost, EIT_Grenade);
    }
    return MagAmmoCost;
}

// Ammo
//@todo give item information rather than index
function int BuySecondaryAmmoMag( out SItemInformation ItemInfo  )
{
	local int MagAmmoCost;
	local int MagSpaceAvailable;
	local int AddedAmmo;

	MagAmmoCost = 0;
    MagSpaceAvailable = ItemInfo.MaxSecondaryAmmo - ItemInfo.SecondaryAmmoCount;
    if( MagSpaceAvailable > 0 )
    {
        MagAmmoCost = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;

        // Don't charge them full price if they don't buy a full mag's worth of ammo
        // or we can only afford part of a magazine
        if( (MagSpaceAvailable < ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize) || (TotalDosh < MagAmmoCost) )
        {
            return FillAmmo( ItemInfo );
        }

        AddedAmmo = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;

        ItemInfo.SecondaryAmmoCount += AddedAmmo;
        ItemInfo.SecondaryAmmoCount = Min( ItemInfo.MaxSecondaryAmmo, ItemInfo.SecondaryAmmoCount );

		BoughtAmmo(AddedAmmo, MagAmmoCost, EIT_Weapon, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }

    return MagAmmoCost;
}

function int BuyMagazine( int ItemSlotIndex  )
{
	local SItemInformation ItemInfo;
	local int MagCost;

    ItemInfo = OwnedItemList[ ItemSlotIndex ];
    
	if( ItemInfo.bIsSecondaryAmmo ) 
	{
		MagCost = BuySecondaryAmmoMag( ItemInfo );
	}
	else
	{
		MagCost = BuyItemMagazine( ItemInfo );
	} 

	OwnedItemList[ ItemSlotIndex ] = ItemInfo;
	return MagCost;
}

function int BuyItemMagazine( out SItemInformation ItemInfo )
{
	local int MagAmmoCost;
	local int MagSpaceAvailable;

	MagAmmoCost = 0;
    MagSpaceAvailable = ItemInfo.MaxSpareAmmo - ItemInfo.SpareAmmoCount;

    if( MagSpaceAvailable > 0 )
    {
        MagAmmoCost = ItemInfo.AmmoPricePerMagazine;

        // Don't charge them full price if they don't buy a full mag's worth of ammo
        // or we can only afford part of a magazine
        if( (MagSpaceAvailable < ItemInfo.DefaultItem.MagazineCapacity) || (TotalDosh < MagAmmoCost) )
        {
        	return FillAmmo( ItemInfo );
        }


        ItemInfo.SpareAmmoCount += ItemInfo.DefaultItem.MagazineCapacity;
        ItemInfo.SpareAmmoCount = Min( ItemInfo.MaxSpareAmmo, ItemInfo.SpareAmmoCount );

		BoughtAmmo(ItemInfo.DefaultItem.MagazineCapacity, MagAmmoCost, EIT_Weapon, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }

    return MagAmmoCost;
}

function float FillAmmo( out SItemInformation ItemInfo, optional bool bIsGrenade )
{
	local float MissingAmmo, MagSize;
	local float FillAmmoCost, PricePerMag;
    local float PricePerRound;

    if( ItemInfo.bIsSecondaryAmmo )
    {
		MagSize = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;
		PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
		MissingAmmo = ItemInfo.MaxSecondaryAmmo - ItemInfo.SecondaryAmmoCount;
		FillAmmoCost = GetFillAmmoCost(ItemInfo);
    }
    else
    {
		MagSize = ItemInfo.DefaultItem.MagazineCapacity;
		PricePerMag = ItemInfo.AmmoPricePerMagazine;
		MissingAmmo = ItemInfo.MaxSpareAmmo - ItemInfo.SpareAmmoCount;
    	FillAmmoCost = ( bIsGrenade ) ? GetFillGrenadeCost() : GetFillAmmoCost(ItemInfo);
    }
	
	// If we cannot fill all our ammo, fill as much as possible
	if ( FillAmmoCost > TotalDosh )
	{
	    PricePerRound = ( bIsGrenade ) ? PricePerMag : PricePerMag / MagSize;
	    MissingAmmo = FFloor(TotalDosh / PricePerRound);
	    FillAmmoCost = FCeil(MissingAmmo * PricePerRound);
	}

	if( ItemInfo.bIsSecondaryAmmo )
    {
    	ItemInfo.SecondaryAmmoCount += MissingAmmo;
	}
	else
	{
		ItemInfo.SpareAmmoCount += MissingAmmo;
	}

	if( bIsGrenade )
    {
		BoughtAmmo(MissingAmmo, FillAmmoCost, EIT_Grenade);
    }
    else
    {
		BoughtAmmo(MissingAmmo, FillAmmoCost, EIT_Weapon, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }

    return FillAmmoCost;
}


//Refresh player inventory
/** Returns the cost to refill this items ammo */
function int GetFillAmmoCost( out SItemInformation ItemInfo )
{
	local int AmmoCount, MaxAmmoCount;
    local float MissingAmmo, PricePerMag, MagSize, PricePerRound;

    if( ItemInfo.bIsSecondaryAmmo )
    {
    	AmmoCount = ItemInfo.SecondaryAmmoCount;
    	MaxAmmoCount = ItemInfo.MaxSecondaryAmmo;
    	PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
    	MagSize = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;
    }
    else
    {
    	AmmoCount = ItemInfo.SpareAmmoCount;
    	MaxAmmoCount = ItemInfo.MaxSpareAmmo;
    	PricePerMag = ItemInfo.AmmoPricePerMagazine;
    	MagSize = ItemInfo.DefaultItem.MagazineCapacity;
    }

    if( MagSize <= 0 )
    {
        return 0;
    }

	MissingAmmo = MaxAmmoCount - AmmoCount;
    PricePerRound = PricePerMag / MagSize;

	// Use FCeil so you can never buy ammo for 0 Do$h on an int conversion
    return FCeil(MissingAmmo * PricePerRound);
}

// auto fill
// Change the look of the button dependant on if we can afford it, or are at max capacity
function bool AttemptAutoFillOnItem( out SItemInformation ItemInfo, out int InAutoFillDosh, int Price )
{
	local int DoshSpent;

	DoshSpent = Min(InAutoFillDosh, CostPerAutofillCycle);
    InAutoFillDosh -= DoshSpent;
    ItemInfo.AutoFillDosh += DoshSpent;
    return ( ItemInfo.AutoFillDosh >= Price );
}


/** Take all dosh out of current weapons and pool it back into AutoFillDosh for the final cycle */
function RePoolAutoFillDosh( out int AutoFillDosh )
{
	local byte i;
	// If we could not buy anything else, clear all cached dosh and buy whatevers possible
	for (i = 0; i < OwnedItemList.Length; i++)
	{
		AutoFillDosh += OwnedItemList[ i ].AutoFillDosh;
		OwnedItemList[ i ].AutoFillDosh = 0;
	}
	AutoFillDosh += ArmorItem.AutoFillDosh;
	ArmorItem.AutoFillDosh = 0;

	AutoFillDosh += GrenadeItem.AutoFillDosh;
	GrenadeItem.AutoFillDosh = 0;
}

/** Empty out any cached dosh in weapons once we've finished autofilling */
function ClearAutoFillDosh()
{
	local byte i;
	// If we could not buy anything else, clear all cached dosh and buy whatevers possible
	for (i = 0; i < OwnedItemList.Length; i++)
	{
		OwnedItemList[ i ].AutoFillDosh = 0;
	}
	ArmorItem.AutoFillDosh = 0;
	GrenadeItem.AutoFillDosh = 0;
}


function bool AutoFillOwnedItems( out int AutoFillDosh, bool bLastCycle )
{
	local int i, PricePerMag, AmmoCount, MaxAmmoCount;
	local SItemInformation ItemInfo;
	
	for (i = 0; i < OwnedItemList.Length; i++)
	{
		ItemInfo = OwnedItemList[ i ];
	    if( ItemInfo.bIsSecondaryAmmo )
	    {
			PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
	    	AmmoCount = ItemInfo.SecondaryAmmoCount;
	    	MaxAmmoCount = ItemInfo.MaxSecondaryAmmo;
	    }
	    else
	    {
	   		PricePerMag = ItemInfo.AmmoPricePerMagazine;
	    	AmmoCount = ItemInfo.SpareAmmoCount;
	    	MaxAmmoCount = ItemInfo.MaxSpareAmmo;
	    }

	    // Only buy ammo if we are missing any
	    if ( AmmoCount < MaxAmmoCount )
		{
			if( bLastCycle )
			{
				AutoFillDosh -= FillAmmo( ItemInfo );
			}
	  	 	else if( AttemptAutoFillOnItem(ItemInfo, AutoFillDosh, PricePerMag) )
			{
				ItemInfo.AutoFillDosh -= BuyMagazine(i);
				OwnedItemList[ i ].AutoFillDosh = ItemInfo.AutoFillDosh;
				return true;
			}
			OwnedItemList[ i ] = ItemInfo;
		}
	}
	return false;
}

function bool StartAutoFill()
{
	local int AutoFillDosh;
	local bool bBoughtSomething;
	local bool bLastCycle;
	local bool bAutoFillPurchasedItem;

	bLastCycle = false;
	AutoFillDosh = TotalDosh;
	// try and buy items until we cannot afford anything else or we've bought everything
	while( true )
	{
		// Tries to buy ammo for the highest priority weapon with missing ammo, unless we're on the last cycle in which case buy for all weapons
		bBoughtSomething = AutoFillOwnedItems(AutoFillDosh, bLastCycle);
		
		// Fill armor
		if( ArmorItem.SpareAmmoCount < ArmorItem.MaxSpareAmmo )
		{
			if( bLastCycle )
			{
				AutoFillDosh -= FillArmor();
			}
			else if( AttemptBuyArmorChunk( AutoFillDosh ) )
			{
				bBoughtSomething = true;
			}
		}

		// Fill grenades
		if( GrenadeItem.SpareAmmoCount < GrenadeItem.MaxSpareAmmo )
		{
			if( bLastCycle )
			{
				AutoFillDosh -= FillAmmo(GrenadeItem, true);
			}
		    else if( AttemptAutoFillOnItem(GrenadeItem, AutoFillDosh, GrenadeItem.AmmoPricePerMagazine) )
			{
				GrenadeItem.AutoFillDosh -= BuyGrenade();
				bBoughtSomething = true;
			}
		}

		if( bLastCycle )
		{
			break;
		}
		else if( !bBoughtSomething )
		{
			// buy whatever we can with our last cycle
			if( !bLastCycle )
			{
				// Return all accumulated dosh from weapons to AutoFillDosh
				RePoolAutoFillDosh(AutoFillDosh);
				bLastCycle = true;
			}
		}
		if(	!bAutoFillPurchasedItem )
		{
			bAutoFillPurchasedItem = bBoughtSomething;
		}
		bBoughtSomething = false;
	}	

	ClearAutoFillDosh();
	return bAutoFillPurchasedItem;
}

//This is for external use of the UI.  DO NOT use this in the menu. -ZG
function Int GetAutoFillCost()
{
	local byte SlotIndex;
	local int FillAmmoCost, AutoFillCost;
   	local SItemInformation ItemInfo;	

	AutoFillCost += GetFillArmorCost();
	AutoFillCost += GetFillGrenadeCost();

	// Iterate through all the items to get the auto fill cost, and update the items
	// for the page we are currently on
   	for ( SlotIndex = 0; SlotIndex < OwnedItemList.Length; SlotIndex++ )
	{
		ItemInfo = OwnedItemList[SlotIndex];
		FillAmmoCost = GetFillAmmoCost(ItemInfo);
		AutoFillCost += FillAmmoCost;		
	}

	return AutoFillCost;
}

/******************
@Name - General 
*******************/

function InitializeOwnedItemList()
{
   	local Inventory Inv;
   	local KFWeapon KFW;
	local KFPawn_Human KFP;

    OwnedItemList.length = 0;

	TraderItems = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;

	KFP = KFPawn_Human( Pawn );
    if( KFP != none )
    {
		// init armor purchase values
		ArmorItem.SpareAmmoCount = KFP.Armor;
		ArmorItem.MaxSpareAmmo = KFP.GetMaxArmor();
	   	ArmorItem.AmmoPricePerMagazine = TraderItems.ArmorPrice * CurrentPerk.GetArmorDiscountMod();
	   	ArmorItem.DefaultItem.WeaponDef = TraderItems.ArmorDef;

		// init grenade purchase values
		GrenadeItem.SpareAmmoCount = MyKFIM.GrenadeCount;
		GrenadeItem.MaxSpareAmmo = KFP.GetPerk().MaxGrenadeCount;
	   	GrenadeItem.AmmoPricePerMagazine = TraderItems.GrenadePrice;
	   	GrenadeItem.DefaultItem.WeaponDef = CurrentPerk.GetGrenadeWeaponDef();

		// @temp: fill in stuff that is normally serialized in the archetype
		GrenadeItem.DefaultItem.AssociatedPerkClasses[0] = CurrentPerk.Class;

		for ( Inv = MyKFIM.InventoryChain; Inv != none; Inv = Inv.Inventory )
		{
			KFW = KFWeapon( Inv );
			if( KFW != none )
			{
				// Set the weapon information and add it to the OwnedItemList
				SetWeaponInformation( KFW );
	     	}
		}

		if(MyGfxManager != none && MyGfxManager.TraderMenu != none)
		{
			MyGfxManager.TraderMenu.OwnedItemList = OwnedItemList;	
		}
	}
}


/** returns true if item can be bought/sold at trader */
function bool IsSellable(const out STraderItem TraderItem)
{
	return (TraderItem.WeaponDef != None && TraderItem.WeaponDef.default.BuyPrice > 0);
}


/** Called from KFGFxTraderContainer_Store */
simulated function int GetAdjustedBuyPriceFor( const out STraderItem ShopItem )
{
	return MyKFIM.GetAdjustedBuyPriceFor( ShopItem, OwnedItemList );
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
			`warn("Owned item with Class NAME_None");
			continue;
		}
     	else if ( OwnedItemClassName == ItemName )
     	{
     	 	return true;
     	}
   	}

   	return false;
}

function AddDosh( int AddedDosh )
{
	TotalDosh = Max( TotalDosh + AddedDosh, 0 );

	if(Role < ROLE_Authority)
	{
		bPendingDoshUpdate = true;
		// If we have not heard anything back form the server, update the clients dosh value
		SetTimer(2.0f, false, nameof(UpdateCurrentDosh), self);
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
	if(MyGfxManager != none && MyGfxManager.TraderMenu != none)
	{
		MyGfxManager.TraderMenu.RefreshItemComponents();
	}
	
	bPendingDoshUpdate = false;
	ClearTimer(nameof(UpdateCurrentDosh), self);
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
	WeaponInfo.SpareAmmoCount = KFW.GetTotalAmmoAmount(0);
	// Max spare ammo already includes perk modifications and magazine capacity
	WeaponInfo.MaxSpareAmmo = KFW.GetMaxAmmoAmount(0);
	WeaponInfo.MagazineCapacity = KFW.MagazineCapacity[0];
	WeaponInfo.SecondaryAmmoCount = KFW.GetTotalAmmoAmount(1);
	WeaponInfo.MaxSecondaryAmmo = KFW.GetMaxAmmoAmount(1);
	WeaponInfo.DefaultItem = DefaultItem;

	WeaponInfo.AmmoPricePerMagazine = DefaultItem.WeaponDef.default.AmmoPricePerMag;
	WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor( DefaultItem, KFW );

    AddItemByPriority( WeaponInfo );

   	// if adding a dual, remove the related single
   	if( DefaultItem.SingleClassName != '' )
   	{
   		RemoveWeaponFromOwnedItemList( , DefaultItem.SingleClassName, true );
   	}
}


// We've bought a new item, add its information to our owned item list
function int AddWeaponToOwnedItemList( STraderItem DefaultItem, optional bool bDoNotBuy )
{
	local SItemInformation WeaponInfo;
	local byte ItemIndex;
	local int  AddedWeaponIndex, OwnedSingleIdx, SingleDualAmmoDiff;
	local bool bAddingDual;

	// Magazine capacity affects both spare ammo and max spare ammo. modify this first
   	WeaponInfo.MagazineCapacity = DefaultItem.MagazineCapacity;
	CurrentPerk.ModifyMagSizeAndNumber( none, WeaponInfo.MagazineCapacity, DefaultItem.AssociatedPerkClasses,, DefaultItem.ClassName );
	
	// Newly bought weapons need to have their default values modified by the current perk
	WeaponInfo.MaxSpareAmmo = DefaultItem.MaxSpareAmmo;
	CurrentPerk.ModifyMaxSpareAmmoAmount(none, WeaponInfo.MaxSpareAmmo, DefaultItem);
	WeaponInfo.MaxSpareAmmo +=  WeaponInfo.MagazineCapacity;
	
	WeaponInfo.SpareAmmoCount = DefaultItem.InitialSpareMags * DefaultItem.MagazineCapacity;
	CurrentPerk.ModifySpareAmmoAmount(none, WeaponInfo.SpareAmmoCount, DefaultItem);
	WeaponInfo.SpareAmmoCount += WeaponInfo.MagazineCapacity;
		
	// if adding a dual, adjust the displayed ammo count to reflect ammo of single
	bAddingDual = DefaultItem.SingleClassName != '';
	if( bAddingDual )
	{
		for( OwnedSingleIdx = 0; OwnedSingleIdx < OwnedItemList.Length; ++OwnedSingleIdx )
		{
			if( OwnedItemList[OwnedSingleIdx].DefaultItem.ClassName == DefaultItem.SingleClassName )
			{
				SingleDualAmmoDiff = OwnedItemList[OwnedSingleIdx].SpareAmmoCount - WeaponInfo.SpareAmmoCount;
				if( OwnedItemList[OwnedSingleIdx].SpareAmmoCount >= WeaponInfo.SpareAmmoCount )
				{
					WeaponInfo.SpareAmmoCount = OwnedItemList[OwnedSingleIdx].SpareAmmoCount /*+ WeaponInfo.MagazineCapacity/2*/; // can't add mag/2 ammo here because it makes buying two singles better than buying a dual
				}
				break;
			}
		}
	}

	// allow perk to set spare ammo to max (uses different params than ModifySpareAmmoAmount)
	// mostly just used for firebug
	CurrentPerk.MaximizeSpareAmmoAmount( DefaultItem.AssociatedPerkClasses, WeaponInfo.SpareAmmoCount, DefaultItem.MaxSpareAmmo + DefaultItem.MagazineCapacity );

	WeaponInfo.SecondaryAmmoCount = DefaultItem.InitialSecondaryAmmo;
	CurrentPerk.ModifyMagSizeAndNumber( none, WeaponInfo.MagazineCapacity, DefaultItem.AssociatedPerkClasses, true, DefaultItem.ClassName );
	CurrentPerk.ModifySpareAmmoAmount( none, WeaponInfo.SecondaryAmmoCount, DefaultItem, true );

	WeaponInfo.MaxSecondaryAmmo = DefaultItem.MaxSecondaryAmmo;
	CurrentPerk.ModifyMaxSpareAmmoAmount( none, WeaponInfo.MaxSecondaryAmmo, DefaultItem, true );

	WeaponInfo.AmmoPricePerMagazine = DefaultItem.WeaponDef.default.AmmoPricePerMag;
   	WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor( DefaultItem );

	WeaponInfo.DefaultItem = DefaultItem;

   	AddedWeaponIndex = AddItemByPriority( WeaponInfo );

   	if( !bDoNotBuy )
   	{
	    // Tell the server to buy the weapon using its trader archetype info
		TraderItems.GetItemIndicesFromArche( ItemIndex, DefaultItem.ClassName );
		MyKFIM.ServerBuyWeapon(ItemIndex);
	}
	else
	{
		// Tell the server to add the weapon (without buying) using its trader archetype info
		TraderItems.GetItemIndicesFromArche( ItemIndex, DefaultItem.ClassName );

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
		TraderItems.GetItemIndicesFromArche( ItemIndex, ItemInfo.DefaultItem.ClassName );
		MyKFIM.ServerSellWeapon(ItemIndex);
	}
	else
	{
		// Remove the weapon from our inventory immediately (without selling)
		TraderItems.GetItemIndicesFromArche( ItemIndex, ItemInfo.DefaultItem.ClassName );
		MyKFIM.ServerRemoveTransactionItem( ItemIndex );
		AddBlocks( -ItemInfo.DefaultItem.BlocksRequired );
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
	else if( OwnedItemList[OwnedListIdx].DefaultItem.WeaponDef.static.UsesSecondaryAmmo() )
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
		// When removing a dual, always add a single to the owned list so that it shows up in the player inventory UI. 
		// If we don't own the single, then also buy it (add it to the transaction list).

		if( TraderItems.GetItemIndicesFromArche( ItemIndex, ItemInfo.DefaultItem.SingleClassName) )
		{
			SingleOwnedIndex = AddWeaponToOwnedItemList( TraderItems.SaleItems[ItemIndex], true );

			// modify default single ammo based on how much ammo dual had when sold
			AddTransactionAmmo( ItemIndex, ItemInfo.SpareAmmoCount, false );

			// update the values in the trader UI
			OwnedItemList[SingleOwnedIndex].SpareAmmoCount = ItemInfo.SpareAmmoCount;
		}
	}

	if(MyGfxManager != none && MyGfxManager.TraderMenu != none)
	{
		MyGfxManager.TraderMenu.OwnedItemList = OwnedItemList;	
	}
}

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
				WeaponInfo.DefaultItem.AssociatedPerkClasses.Find(CurrentPerk.Class) != INDEX_NONE )
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
	if( WeaponInfo.DefaultItem.WeaponDef.static.UsesSecondaryAmmo() )
   	{
   		WeaponInfo.bIsSecondaryAmmo = true;
		WeaponInfo.SellPrice = 0;
		OwnedItemList.InsertItem( BestIndex + 1, WeaponInfo );
   	}

	if( MyGfxManager != none && MyGfxManager.TraderMenu != none )
	{
		MyGfxManager.TraderMenu.OwnedItemList = OwnedItemList;	
	}

   	return BestIndex;
}

function AddBlocks( int AddedBlocks )
{
	TotalBlocks = Max( TotalBlocks + AddedBlocks, 0 );
}

function GetTraderItems()
{
	TraderItems = KFGameReplicationInfo( WorldInfo.GRI ).TraderItems;	
	Initialize();
}

native private final function AddTransactionAmmo( byte ItemIndex, int Amount, bool bSecondaryAmmo );

DefaultProperties
{
	//defaults
	CostPerAutofillCycle=10
	DoshBuffer=150
}