//=============================================================================
// KFGFxObject_TraderItems
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 8/14/2013
//=============================================================================

class KFGFxObject_TraderItems extends Object
	native(UI)
	DependsOn(KFPlayerReplicationInfo, KFUnlockManager);

enum TraderWeaponStat
{
	TWS_Damage,
	TWS_RateOfFire,
	TWS_Range,
	TWS_Penetration,

	TWS_Block,
	TWS_Parry,

	TWS_MagazineSize,
	TWS_AmmoCapacity,

	TWS_HealAmount,
	TWS_RechargeTime
};

struct native STraderItemWeaponStats
{
	/** Enum for stat type so we can do a simple look up */
	var TraderWeaponStat StatType;
	/** Calculated value of stat */
	var float StatValue;
};

struct native STraderItem
{
	/** Set to true if the item is not tied to a specific weapon class like grenades or armor */
	var editconst bool bHasNoClass;
	/** This value is set based on the weapons "bCanThrow" property */
	var editconst bool bSellable;
	/** This value is set based on the function "UsesAmmo" */
	var editconst bool bUsesAmmo;
	/** This value is set based on the function "UsesSecondaryAmmo" */
	var editconst bool bUsesSecondaryAmmo;

	/** The path to the item */
	var() editconst name PathName;
	/** The path to the single variant of the item, if applicable */
	var edithide name SingleClassPathName;

	/** The weapon class we want to make available for purchase */
	var() editoronly class<KFWeapon>  ItemClass<EditCondition=!bHasNoClass>;

	/** The cost of this weapon ( Sold for .75 this amount ) */
	var() int BuyPrice<EditCondition=bSellable>;
	/** Price per magazine */
	var() int AmmoPricePerMagazine<EditCondition=bUsesAmmo>;

	/** How much ammo you will receive for buying a mag of secondary ammo */
	var() int SecondaryAmmoMagSize<EditCondition=bUsesSecondaryAmmo>;
	/** Price to fill the secondary ammo */
	var() int SecondaryAmmoMagPrice<EditCondition=bUsesSecondaryAmmo>;

	/** The location of the weapon texture */
	var() editconst string TextureLocation;
	/** The location of the weapon texture */
	var() editconst string SecondaryAmmoTexturePath<EditCondition=bUsesSecondaryAmmo>;

	var() bool bHideStats;

	/** The items class name */
	var editconst name	ClassName;
	/** The name of the item's single variant, if applicable */
	var edithide name SingleClassName;
	/** The name of the item's dual variant, if applicable */
	var edithide name DualClassName;
	var editconst byte	FilterType;

	/** The perk this weapon is tied to */
	var editconst class<KFPerk> AssociatedPerkClass;

    var editconst string PerkIconString;
	var editconst int MagazineCapacity, InitialSpareMags, MaxSpareAmmo;
	var editconst int MaxSecondaryAmmoCount;
    var editconst byte BlocksRequired;

	/** The group that this weapon belongs to */
	var editconst byte InventoryGroup;
	/** The priority of the weapon within this group */
	var editconst float GroupPriority;
		
	/** The damage per shot */
	var editconst byte Power;
	/** The RPM of the weapon */
	var editconst int  FireRate;
	/** How many objects it can penetrate a shot can go through */
	var editconst byte Penetration;
	/** How accurate a weapon is */
	var editconst byte Accuracy;

	/** Dynamic array of stats to display. Each weapon has the opportunity to set its own stats. */
	var() editconst array<STraderItemWeaponStats> WeaponStats;

	/** Unlock Id for shared unlock items */
	var() editconst ESharedContentUnlock SharedUnlockId;

	structdefaultproperties
	{
    	bSellable=true
	}
};

var() STraderItem ArmorItem;

struct native SPerkTraderList
{
	/** The perk that this item list is tied to*/
    var() class<KFPerk> PerkClass;
    var() STraderItem GrenadeItem;
	var() array<STraderItem> ItemList;

	StructDefaultProperties
	{
		PerkClass=Class'KFPerk_Commando';
	}
};

var() array<SPerkTraderList> TraderItemList;
var() array<STraderItem> OffPerkItems;
var() string OffPerkIconPath;

var() string ArmorClassName;
var() string ArmorTextureLocation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function SetItemsInfo( out array<STraderItem> ItemArray, optional bool bIsOffPerk );
native function SetGrenadeInfo( out SPerkTraderList TraderList );

function GetItemInfo( class<KFPerk> PerkClass, string PathName, out string WeaponName, out string WeaponSource)
{
	local array<STraderItem> MyWeaponList;
	local array<string> TempStringArray;
	local int i;

	MyWeaponList = GetWeaponListByPerk( PerkClass );
	for ( i = 0; i< MyWeaponList.Length; i++)
	{
  		if (String(MyWeaponList[i].PathName) == PathName)
  		{
			WeaponSource = MyWeaponList[i].TextureLocation;
			ParseStringIntoArray(PathName, TempStringArray, ".", true);
			WeaponName = Localize(TempStringArray[TempStringArray.length -1], "ItemName", "KFGameContent" );
			return;
		}
	}

	//if item is not found, look in the off perk items
	GetOffPerkItem(PathName, WeaponName, WeaponSource);
	
}

function GetOffPerkItem(string PathName, out string WeaponName, out string WeaponSource)
{
	local int i;
	local array<string> TempStringArray;
	for (i = 0; i < OffPerkItems.length; i++)
	{
		if (String(OffPerkItems[i].PathName) == PathName)
  		{
			WeaponSource = OffPerkItems[i].TextureLocation;
			ParseStringIntoArray(PathName, TempStringArray, ".", true);
			WeaponName = Localize(TempStringArray[TempStringArray.length -1], "ItemName", "KFGameContent" );
			return;
		}
	}
}

function GetGrenadeItemInfo(class<KFPerk> PerkClass, string PathName, out string WeaponName, out string WeaponSource)
{
	local STraderItem GrenadeItem;
	local array<string> TempStringArray;

	GrenadeItem = GetGrenadeByPerk(PerkClass);

	WeaponSource = GrenadeItem.TextureLocation;
	ParseStringIntoArray(PathName, TempStringArray, ".", true);
	WeaponName = Localize(TempStringArray[TempStringArray.length -1], "ItemName", "KFGameContent" );
}

function STraderItem GetGrenadeByPerk(class<KFPerk> PerkClass)
{
	local byte i;	

	for (i = 0; i < TraderItemList.Length; i++)
	{
		if (TraderItemList[i].PerkClass == PerkClass)
		{
			return TraderItemList[i].GrenadeItem;
		}
	}
	return TraderItemList[0].GrenadeItem;
}

// Pass in the index of the selected filter and grab all the weapons of that type
function array< STraderItem > GetWeaponListByPerk(class<KFPerk> PerkClass)
{
	local byte i;	
	for (i = 0; i < TraderItemList.Length; i++)
	{
		if (TraderItemList[i].PerkClass == PerkClass)
		{
			return TraderItemList[i].ItemList;
		}
	}
 	return TraderItemList[0].ItemList;
}

/** Get the list and item index for this particular weapon from the weapon calss name */
final function bool GetItemIndicesFromArche( out byte ListIndex, out byte ItemIndex, name WeaponClassName, class<KFPerk> PerkClass )
{
	local byte i;

	// Only check perk lists if we have an associated perk class
	if( PerkClass != none )
	{
		for (i = 0; i < TraderItemList.Length; i++)
		{
			if (TraderItemList[i].PerkClass == PerkClass)
			{
				ListIndex = i;
				break;
			}
		}
	 
	 	// Get the weapon from our perk list
	 	if( ListIndex < TraderItemList.Length )
	 	{
			for (i = 0; i < TraderItemList[ListIndex].ItemList.Length; i++)
			{
		    	if( WeaponClassName == TraderItemList[ListIndex].ItemList[i].ClassName )
		    	{
		    		ItemIndex = i;
		        	return true;
		    	}
		    }
		}
	}

	// If the weapon was not found in the Trader Item List, it must be offperk
	ListIndex = 255;
	for (i = 0; i < OffPerkItems.Length; i++)
	{
    	if( WeaponClassName == OffPerkItems[i].ClassName )
    	{
        	ItemIndex = i;
    		return true;
    	}
    }
    return false;
}

defaultproperties
{
   ArmorItem=(bSellable=True)
   OffPerkIconPath="UI_TraderMenu_TEX.UI_WeaponSelect_Trader_Perk"
   ArmorClassName="Armor"
   ArmorTextureLocation="UI_TraderMenu_TEX.UI_WeaponSelect_Armor"
   Name="Default__KFGFxObject_TraderItems"
   ObjectArchetype=Object'Core.Default__Object'
}
