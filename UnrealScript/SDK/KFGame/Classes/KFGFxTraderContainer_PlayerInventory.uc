//=============================================================================
// KFGFxTraderContainer_PlayerInventory
//=============================================================================
// This class holds all of the functions and variables corresponding to the
// players inventory list ( What you currently own ). This class will add
// and remove local item references to the array "OwnedItemList." The player
// will not receive any changed values to his inventory until the menu is
// closed and the the server is told to update the new purchases
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 8/14/2013
//=============================================================================

class KFGFxTraderContainer_PlayerInventory extends KFGFxObject_Container
	DependsOn(KFGFxObject_TraderItems)
	DependsOn(KFGFxMenu_Trader);

enum EButtonStates
{
  	BS_Enabled,
  	BS_MaxCapacity,
  	BS_CantAfford
};

var KFGFxMenu_Trader MyTraderMenu; // Reference to the movie player that owns us

/** The price for trying to autofill an item in a single cycle */
var int CostPerAutofillCycle;

var localized string FillString, MagString, AutoFillString, BuyGrenadeString, ChangePerkString;
var localized string ArmorString;

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );

	MyTraderMenu = KFGFxMenu_Trader( NewParentMenu );
	LocalizeContainer();
	UpdateLock();
}

function LocalizeContainer()
{
	local GFxOBject LocalizedObject;

 	LocalizedObject = CreateObject("Object");

 	LocalizedObject.SetString("autoFill", AutoFillString);
 	LocalizedObject.SetString("armorLabel", FillString);
 	LocalizedObject.SetString("fillLabel", FillString);
 	LocalizedObject.SetString("magLabel", MagString);
 	LocalizedObject.SetString("changePerk", ChangePerkString);
 	LocalizedObject.SetString("grenadeLabel", BuyGrenadeString);

 	SetObject("localizeStrings", LocalizedObject);
}

//Updates the ablility to change the perk 
function UpdateLock()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if (KFPC != none)
	{
		SetBool("perkChangeLocked", KFPC.bPlayerUsedUpdatePerk);
	}
}

//==============================================================
// Update Item List
//==============================================================
// Grab all the items currently in our inventory chain, and add them to the inventory list
function RefreshPlayerInventory()
{
	local byte SlotIndex;
	local float PricePerRound;
	local int AmmoCount, MaxAmmoCount, MagSize, PricePerMag;
	local int FillAmmoCost, BlocksRequired, AutoFillCost;
	local string TextureLocation;
	local GFxObject InfoSlot, MagSlot, FillSlot;
	local GFxObject InfoDataProvider, FillDataProvider, MagDataProvider;	// This array of information is sent to ActionScript to update the item data
   	local SItemInformation ItemInfo;	

	InfoDataProvider = CreateArray();
	FillDataProvider = CreateArray();
	MagDataProvider = CreateArray();

	SetArmorInfo(MyTraderMenu.ArmorItem, AutoFillCost);
	SetGrenadeInfo(MyTraderMenu.GrenadeItem, AutoFillCost);

	// Iterate through all the items to get the auto fill cost, and update the items
	// for the page we are currently on
   	for ( SlotIndex = 0; SlotIndex < MyTraderMenu.OwnedItemList.Length; SlotIndex++ )
	{
		InfoSlot = CreateObject("Object");
		MagSlot = CreateObject("Object");
		FillSlot = CreateObject("Object");

		ItemInfo = MyTraderMenu.OwnedItemList[SlotIndex];
		FillAmmoCost = GetFillAmmoCost(ItemInfo);

	    if( !ItemInfo.bIsSecondaryAmmo )
		{
			// @temp: Use LastPerkClass to determine correct knife image
			TextureLocation = ItemInfo.DefaultItem.WeaponDef.static.GetImagePath();
			AmmoCount = ItemInfo.SpareAmmoCount;
			MaxAmmoCount = ItemInfo.MaxSpareAmmo;
			MagSize = ItemInfo.MagazineCapacity;
			PricePerMag = ItemInfo.AmmoPricePerMagazine;
			PricePerRound = ( MagSize > 0 ) ? float(PricePerMag) / float(MagSize) : 0.f;
			BlocksRequired = ItemInfo.DefaultItem.BlocksRequired;

			SetItemInfo( InfoSlot, ItemInfo.DefaultItem.WeaponDef, "ItemName", TextureLocation, AmmoCount, MaxAmmoCount, BlocksRequired );
			SetMagInfo( MagSlot, AmmoCount, MaxAmmoCount, MagSize, PricePerMag, PricePerRound, FillAmmoCost );
			SetFillInfo( FillSlot, AmmoCount, MaxAmmoCount, PricePerRound, FillAmmoCost, AutoFillCost );
		}
		else
		{
			TextureLocation = ItemInfo.DefaultItem.SecondaryAmmoImagePath;
			AmmoCount = ItemInfo.SecondaryAmmoCount;
			MaxAmmoCount = ItemInfo.MaxSecondaryAmmoCount;
			MagSize = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;
			PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
			PricePerRound = ( MagSize > 0 ) ? float(PricePerMag) / float(MagSize) : 0.f;
			BlocksRequired = -1; // This will hide the weight and 

			SetItemInfo( InfoSlot, ItemInfo.DefaultItem.WeaponDef, "SecondaryAmmo", TextureLocation, AmmoCount, MaxAmmoCount, BlocksRequired );
			SetMagInfo( MagSlot, AmmoCount, MaxAmmoCount, MagSize, PricePerMag, PricePerRound, FillAmmoCost );
			SetFillInfo( FillSlot, AmmoCount, MaxAmmoCount, PricePerRound, FillAmmoCost, AutoFillCost );
		}

		InfoDataProvider.SetElementObject( SlotIndex, InfoSlot );
		MagDataProvider.SetElementObject( SlotIndex, MagSlot );
		FillDataProvider.SetElementObject( SlotIndex, FillSlot );
	}

	SetAutoFill(AutoFillCost);

	SetObject("itemData", InfoDataProvider);
	SetObject("magData", MagDataProvider);
	SetObject("fillData", FillDataProvider);
}

function SetArmorInfo(out SItemInformation ArmorInfo, out int AutoFillCost)
{
	local GFxObject SlotObject;
	local int FillCost;	

	FillCost = GetFillArmorCost(ArmorInfo);

	SlotObject = CreateObject( "Object" );
	SlotObject.SetInt("cost", FillCost);    

	SlotObject.SetString("itemName", ArmorString);
	SlotObject.SetString("itemSource", "img://"$ArmorInfo.DefaultItem.WeaponDef.static.GetImagePath());	
	SlotObject.SetString("itemAmmo",  ArmorInfo.SpareAmmoCount$"/"$ArmorInfo.MaxSpareAmmo);
	SlotObject.Setint("buttonState", GetButtonState( ArmorInfo.AmmoPricePerMagazine, ArmorInfo.SpareAmmoCount, ArmorInfo.MaxSpareAmmo ));

	SetObject("armorInfo", SlotObject);
	AutoFillCost += FillCost;
}

function SetGrenadeInfo(out SItemInformation GrenadeInfo, out int AutoFillCost)
{
	local GFxObject SlotObject;
	local int FillCost;
	local int MagCost;
	local int ButtonState;
	local int AmmoPricePerMagazine;

    AmmoPricePerMagazine = GrenadeInfo.AmmoPricePerMagazine;

	SlotObject = CreateObject("Object");	
	SlotObject.SetString("itemSource", "img://"$GrenadeInfo.DefaultItem.WeaponDef.static.GetImagePath());
	SlotObject.SetString("itemName", GrenadeInfo.DefaultItem.WeaponDef.static.GetItemName());

	FillCost = GetFillGrenadeCost(GrenadeInfo);
	MagCost = (GrenadeInfo.SpareAmmoCount != GrenadeInfo.MaxSpareAmmo) ? GrenadeInfo.AmmoPricePerMagazine : 0;
	SlotObject.SetInt("magCost", MagCost);   
	SlotObject.SetInt("fillCost", FillCost); 
	SlotObject.SetString("itemAmmo", GrenadeInfo.SpareAmmoCount $"/"$GrenadeInfo.MaxSpareAmmo);
	ButtonState = GetButtonState(AmmoPricePerMagazine, GrenadeInfo.SpareAmmoCount, GrenadeInfo.MaxSpareAmmo);

	SlotObject.Setint("magButtonState", ButtonState);
	SlotObject.Setint("fillButtonState", ButtonState);	

	SetObject("grenadeInfo", SlotObject);
	AutoFillCost += FillCost;
}

function SetItemInfo(out GFxObject InfoSlot, class<KFWeaponDefinition> WeaponDef, string ItemKeyString, string TextureLocation, int AmmoCount, int MaxAmmoCount, int BlocksRequired )
{
	local string ItemTexPath;

    InfoSlot.SetString( "itemName", WeaponDef.static.GetItemLocalization(ItemKeyString) );
    InfoSlot.SetString( "itemAmmo", AmmoCount $"/" $MaxAmmoCount);
    InfoSlot.Setint( "itemWeight", BlocksRequired );

    ItemTexPath = "img://"$TextureLocation;
    InfoSlot.SetString( "itemSource", ItemTexPath );
}

function SetMagInfo(out GFxObject MagSlot, int AmmoCount, int MaxAmmoCount, int AmmoMagSize, int PricePerMag, float PricePerRound, int FillAmmoCost)
{
	local int MagCost;
	local bool bBuyPartialMag;

	bBuyPartialMag = AmmoCount + AmmoMagSize > MaxAmmoCount;
    MagCost = ( bBuyPartialMag ) ? FillAmmoCost : PricePerMag;

   	MagSlot.SetString("label", MagString);
	MagSlot.SetInt("buttonValue", MagCost);
    MagSlot.SetInt("buttonState", GetButtonState( PricePerRound, AmmoCount, MaxAmmoCount));
}

function SetFillInfo(out GFxObject FillSlot, int AmmoCount, int MaxAmmoCount, float PricePerRound, int FillAmmoCost, out int AutoFillCost)
{
    FillSlot.SetString("label", FillString);
	FillSlot.SetInt("buttonValue", FillAmmoCost);
	FillSlot.SetInt("buttonState", GetButtonState( PricePerRound, AmmoCount, MaxAmmoCount ));

    AutoFillCost += FillAmmoCost;
}

function SetAutoFill(int AutoFillCost)
{
	local GFxObject AutoFillObject;

    AutoFillObject = CreateObject("Object");

	AutoFillObject.SetInt("buttonValue", AutoFillCost);
	// Only disable this button if we have all the ammo
	AutoFillObject.SetInt("buttonState", GetButtonState(0, 0, AutoFillCost));

	SetObject("autoFillCost", AutoFillObject);
}

/** Returns the cost to refill this items ammo */
function int GetFillAmmoCost( out SItemInformation ItemInfo )
{
	local int AmmoCount, MaxAmmoCount;
    local float MissingAmmo, PricePerMag, MagSize, PricePerRound;

    if( ItemInfo.bIsSecondaryAmmo )
    {
    	AmmoCount = ItemInfo.SecondaryAmmoCount;
    	MaxAmmoCount = ItemInfo.MaxSecondaryAmmoCount;
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

function int GetFillGrenadeCost( out SItemInformation ItemInfo )
{
	local int AmmoCount, MaxAmmoCount;
    local float MissingAmmo, PricePerMag;

	AmmoCount = ItemInfo.SpareAmmoCount;
	MaxAmmoCount = ItemInfo.MaxSpareAmmo;
	PricePerMag = ItemInfo.AmmoPricePerMagazine;

	MissingAmmo = MaxAmmoCount - AmmoCount;
	// Use FCeil so you can never buy ammo for 0 Do$h on an int conversion
    return FCeil(MissingAmmo * PricePerMag);
}

function int GetFillArmorCost( out SItemInformation ArmorInfo )
{
	local float ArmorPercentage, FillCost, ArmorPricePerPercent;

	ArmorPercentage = ArmorInfo.MaxSpareAmmo - ArmorInfo.SpareAmmoCount;
	ArmorPricePerPercent = ArmorInfo.AmmoPricePerMagazine;
	FillCost = FCeil(ArmorPercentage * ArmorPricePerPercent);

	return FillCost;
}

// Change the look of the button dependant on if we can afford it, or are at max capacity
function int GetButtonState( float Price, int SpareAmmoCount, int MaxSpareAmmoCount )
{
	if ( SpareAmmoCount >= MaxSpareAmmoCount )
	{
	 	return BS_MaxCapacity;
	}
	else if ( MyTraderMenu.TotalDosh < Price )
	{
	 	return BS_CantAfford;
	}

	return BS_Enabled;
}

//==============================================================
// Slot Actions
//==============================================================

function float FillAmmo( out SItemInformation ItemInfo, optional bool bIsGrenade )
{
	local float MissingAmmo, MagSize;
	local float FillAmmoCost, PricePerMag;
    local float PricePerRound;

    if( ItemInfo.bIsSecondaryAmmo )
    {
		MagSize = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;
    	PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
		MissingAmmo = ItemInfo.DefaultItem.MaxSecondaryAmmoCount - ItemInfo.SecondaryAmmoCount;
		FillAmmoCost = GetFillAmmoCost(ItemInfo);
    }
    else
    {
		MagSize = ItemInfo.DefaultItem.MagazineCapacity;
		PricePerMag = ItemInfo.AmmoPricePerMagazine;
		MissingAmmo = ItemInfo.MaxSpareAmmo - ItemInfo.SpareAmmoCount;
    	FillAmmoCost = ( bIsGrenade ) ? GetFillGrenadeCost(ItemInfo) : GetFillAmmoCost(ItemInfo);
    }
	
	// If we cannot fill all our ammo, fill as much as possible
	if ( FillAmmoCost > MyTraderMenu.TotalDosh )
	{
	    PricePerRound = PricePerMag / MagSize;
	    MissingAmmo = FFloor(MyTraderMenu.TotalDosh / PricePerRound);
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
		MyTraderMenu.BoughtAmmo(MissingAmmo, FillAmmoCost, IT_Grenade);
    }
    else
    {
		MyTraderMenu.BoughtAmmo(MissingAmmo, FillAmmoCost, IT_Weapon, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }

    return FillAmmoCost;
}

function int FillArmor( out SItemInformation ArmorInfo )
{
	local float ArmorPricePerPercent, FillCost;
	local int PercentArmorBought;

	FillCost = GetFillArmorCost(ArmorInfo);
	PercentArmorBought = ArmorInfo.MaxSpareAmmo - ArmorInfo.SpareAmmoCount;

	// Buy as much armor as we possibly can
    if (FillCost > MyTraderMenu.TotalDosh)
    {
   		ArmorPricePerPercent = ArmorInfo.AmmoPricePerMagazine;

        // Because we are using int's this will round down and we can get how much we actually spent
    	PercentArmorBought = MyTraderMenu.TotalDosh / ArmorPricePerPercent;
		FillCost = ArmorPricePerPercent * PercentArmorBought;
    }

    ArmorInfo.SpareAmmoCount = FMin(ArmorInfo.SpareAmmoCount + PercentArmorBought, ArmorInfo.MaxSpareAmmo);
	MyTraderMenu.BoughtAmmo(PercentArmorBought, FillCost, IT_Armor);

	return FillCost;
}

//@todo give item information rather than index
function int BuyMagazine( int ItemSlotIndex  )
{
	local SItemInformation ItemInfo;
	local int MagCost;

    ItemInfo = MyTraderMenu.OwnedItemList[ ItemSlotIndex ];
    
	if( ItemInfo.bIsSecondaryAmmo ) 
	{
		MagCost = BuySecondaryAmmoMag( ItemInfo );
	}
	else
	{
		MagCost = BuyItemMagazine( ItemInfo );
	} 

	MyTraderMenu.OwnedItemList[ ItemSlotIndex ] = ItemInfo;
	return MagCost;
}

function int BuyGrenade( out SItemInformation ItemInfo  )
{
	local int MagAmmoCost;

	MagAmmoCost = 0;
    if( (ItemInfo.MaxSpareAmmo - ItemInfo.SpareAmmoCount) > 0 )
    {
        MagAmmoCost = ItemInfo.AmmoPricePerMagazine;

        ItemInfo.SpareAmmoCount += 1;

		MyTraderMenu.BoughtAmmo(1, MagAmmoCost, IT_Grenade);
    }
    return MagAmmoCost;
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
        if( (MagSpaceAvailable < ItemInfo.DefaultItem.MagazineCapacity) || (MyTraderMenu.TotalDosh < MagAmmoCost) )
        {
        	return FillAmmo( ItemInfo );
        }


        ItemInfo.SpareAmmoCount += ItemInfo.DefaultItem.MagazineCapacity;
        ItemInfo.SpareAmmoCount = Min( ItemInfo.MaxSpareAmmo, ItemInfo.SpareAmmoCount );

		MyTraderMenu.BoughtAmmo(ItemInfo.DefaultItem.MagazineCapacity, MagAmmoCost, IT_Weapon, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }

    return MagAmmoCost;
}

function int BuySecondaryAmmoMag( out SItemInformation ItemInfo  )
{
	local int MagAmmoCost;
	local int MagSpaceAvailable;
	local int AddedAmmo;

	MagAmmoCost = 0;
    MagSpaceAvailable = ItemInfo.MaxSecondaryAmmoCount - ItemInfo.SecondaryAmmoCount;
    if( MagSpaceAvailable > 0 )
    {
        MagAmmoCost = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;

        // Don't charge them full price if they don't buy a full mag's worth of ammo
        // or we can only afford part of a magazine
        if( (MagSpaceAvailable < ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize) || (MyTraderMenu.TotalDosh < MagAmmoCost) )
        {
            return FillAmmo( ItemInfo );
        }

        AddedAmmo = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;

        ItemInfo.SecondaryAmmoCount += AddedAmmo;
        ItemInfo.SecondaryAmmoCount = Min( ItemInfo.MaxSecondaryAmmoCount, ItemInfo.SecondaryAmmoCount );

		MyTraderMenu.BoughtAmmo(AddedAmmo, MagAmmoCost, IT_Weapon, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }

    return MagAmmoCost;
}

function StartAutoFill()
{
	local int AutoFillDosh;
	local bool bBoughtSomething;
	local bool bLastCycle;

	bLastCycle = false;
	AutoFillDosh = MyTraderMenu.TotalDosh;
	// try and buy items until we cannot afford anything else or we've bought everything
	while( true )
	{
		// Tries to buy ammo for the highest priority weapon with missing ammo, unless we're on the last cycle in which case buy for all weapons
		bBoughtSomething = AutoFillOwnedItems(AutoFillDosh, bLastCycle);

		// Fill armor
		if( MyTraderMenu.ArmorItem.SpareAmmoCount < MyTraderMenu.ArmorItem.MaxSpareAmmo )
		{
			if( bLastCycle )
			{
				AutoFillDosh -= FillArmor(MyTraderMenu.ArmorItem);
			}
			else if( AttemptBuyArmorChunk(MyTraderMenu.ArmorItem, AutoFillDosh ) )
			{
				bBoughtSomething = true;
			}
		}

		// Fill grenades
		if( MyTraderMenu.GrenadeItem.SpareAmmoCount < MyTraderMenu.GrenadeItem.MaxSpareAmmo )
		{
			if( bLastCycle )
			{
				AutoFillDosh -= FillAmmo(MyTraderMenu.GrenadeItem, true);
			}
		    else if( AttemptAutoFillOnItem(MyTraderMenu.GrenadeItem, AutoFillDosh, MyTraderMenu.GrenadeItem.AmmoPricePerMagazine) )
			{
				MyTraderMenu.GrenadeItem.AutoFillDosh -= BuyGrenade(MyTraderMenu.GrenadeItem);
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

		bBoughtSomething = false;
	}	

	ClearAutoFillDosh();
	MyTraderMenu.RefreshItemComponents();
}

function bool AutoFillOwnedItems( out int AutoFillDosh, bool bLastCycle )
{
	local int i, PricePerMag, AmmoCount, MaxAmmoCount;
	local SItemInformation ItemInfo;

	for (i = 0; i < MyTraderMenu.OwnedItemList.Length; i++)
	{
		ItemInfo = MyTraderMenu.OwnedItemList[ i ];
	    if( ItemInfo.bIsSecondaryAmmo )
	    {
			PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
	    	AmmoCount = ItemInfo.SecondaryAmmoCount;
	    	MaxAmmoCount = ItemInfo.MaxSecondaryAmmoCount;
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
				MyTraderMenu.OwnedItemList[ i ].AutoFillDosh = ItemInfo.AutoFillDosh;
				return true;
			}
			MyTraderMenu.OwnedItemList[ i ] = ItemInfo;
		}
	}
	return false;
}

// Change the look of the button dependant on if we can afford it, or are at max capacity
function bool AttemptAutoFillOnItem( out SItemInformation ItemInfo, out int InAutoFillDosh, int Price )
{
	local int DoshSpent;

	DoshSpent = Min(InAutoFillDosh, CostPerAutofillCycle);
    InAutoFillDosh -= DoshSpent;
    ItemInfo.AutoFillDosh += DoshSpent;
    return ( ItemInfo.AutoFillDosh >= Price );
}

function bool AttemptBuyArmorChunk( out SItemInformation ArmorInfo, out int InAutoFillDosh )
{
	local float ArmorPricePerPercent, ChunkCost;
	local int PercentArmorBought;

	ArmorPricePerPercent = ArmorInfo.AmmoPricePerMagazine;
	PercentArmorBought = 0;
	if( ArmorInfo.SpareAmmoCount < ArmorInfo.MaxSpareAmmo )
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

	    ArmorInfo.SpareAmmoCount = FMin(ArmorInfo.SpareAmmoCount + PercentArmorBought, ArmorInfo.MaxSpareAmmo);
		MyTraderMenu.BoughtAmmo(PercentArmorBought, ChunkCost, IT_Armor);
	}
	return (PercentArmorBought > 0);
}

/** Take all dosh out of current weapons and pool it back into AutoFillDosh for the final cycle */
function RePoolAutoFillDosh( out int AutoFillDosh )
{
	local byte i;
	// If we could not buy anything else, clear all cached dosh and buy whatevers possible
	for (i = 0; i < MyTraderMenu.OwnedItemList.Length; i++)
	{
		AutoFillDosh += MyTraderMenu.OwnedItemList[ i ].AutoFillDosh;
		MyTraderMenu.OwnedItemList[ i ].AutoFillDosh = 0;
	}
	AutoFillDosh += MyTraderMenu.ArmorItem.AutoFillDosh;
	MyTraderMenu.ArmorItem.AutoFillDosh = 0;

	AutoFillDosh += MyTraderMenu.GrenadeItem.AutoFillDosh;
	MyTraderMenu.GrenadeItem.AutoFillDosh = 0;
}

/** Empty out any cached dosh in weapons once we've finished autofilling */
function ClearAutoFillDosh()
{
	local byte i;
	// If we could not buy anything else, clear all cached dosh and buy whatevers possible
	for (i = 0; i < MyTraderMenu.OwnedItemList.Length; i++)
	{
		MyTraderMenu.OwnedItemList[ i ].AutoFillDosh = 0;
	}
	MyTraderMenu.ArmorItem.AutoFillDosh = 0;
	MyTraderMenu.GrenadeItem.AutoFillDosh = 0;
}

DefaultProperties
{
	CostPerAutofillCycle=10
}