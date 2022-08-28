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
	TWS_Range,
	TWS_Penetration,
	TWS_RateOfFire,

	TWS_Block,
	TWS_Parry,

	TWS_MagazineSize,
	TWS_AmmoCapacity,

	TWS_HealAmount,
	TWS_RechargeTime
};

enum EFilterTypeUI
{
	FT_Pistol,
	FT_Shotgun,
	FT_Rifle,
	FT_Projectile,
	FT_Flame,
	FT_Electric,
	FT_Explosive,
	FT_Assault,
	FT_Melee,
	FT_SMG,
	FT_None
};

struct native STraderItemWeaponStats
{
	/** Enum for stat type so we can do a simple look up */
	var TraderWeaponStat StatType;
	/** Calculated value of stat */
	var float StatValue;
};

// @todo: migrate these stats to the weapon def class
struct native STraderItem
{
	/** Link to weapon defintion class */
	var() class<KFWeaponDefinition> WeaponDef<AllowAbstract>;

	/** The items class name */
	var name	ClassName;
	/** The name of the item's single variant, if applicable */
	var name 	SingleClassName;
	/** The name of the item's dual variant, if applicable */
	var name 	DualClassName;

	/** The perk this weapon is tied to */
	var array< Class<KFPerk> >	AssociatedPerkClasses;

	var int MaxSpareAmmo;

    /** Trader image for secondary ammo type */
	var string SecondaryAmmoImagePath;

	/** The priority of the weapon within this group */
	var float GroupPriority;

	/** Dynamic array of stats to display. Each weapon has the opportunity to set its own stats. */
	var() editconst array<STraderItemWeaponStats> WeaponStats;

	var int WeaponUpgradeWeight[6];
	var float WeaponUpgradeDmgMultiplier[6];

/** BYTES - For alignment */

	var byte InitialSpareMags;
	var byte MagazineCapacity;
	var byte BlocksRequired;
	var byte InitialSecondaryAmmo;
	var byte MaxSecondaryAmmo;

	/** Determine which group a weapon will show up for the weapon type filter */
	var EFilterTypeUI TraderFilter;
	var EFilterTypeUI AltTraderFilter;
	/** The group that this weapon belongs to */
	var byte InventoryGroup;

	var int ItemID; //used since the list will be sorted.

	StructDefaultProperties
	{
		AltTraderFilter=FT_None
		ItemID=-1
	}
};

var() editoronly transient bool bBuildItemInfo;

/** main list of all items available for purchase at trader */
var() array<STraderItem> SaleItems;

/** Cost per 1 armor point */
var() int ArmorPrice;
/** Cost per 1 grenade */
var() int GrenadePrice;

/** default armor purchase details */
var class<KFWeaponDefinition> ArmorDef;

/** default knife stats for details pane */
var array<STraderItemWeaponStats> KnifeStats;

/** Icon for off-perk item filter */
var string OffPerkIconPath;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function SetItemsInfo( out array<STraderItem> ItemArray );
native function SortItemsInfo(out array<STraderItem> ItemArray);



/** Get the list and item index for this particular weapon from the weapon calss name */
final function bool GetItemIndicesFromArche( out byte ItemIndex, name WeaponClassName )
{
	local byte i;

	for (i = 0; i < SaleItems.Length; i++)
	{
    	if( WeaponClassName == SaleItems[i].ClassName )
    	{
    		ItemIndex = i;
        	return true;
    	}
    }
    return false;
}

defaultproperties
{
   ArmorPrice=3
   GrenadePrice=40
   ArmorDef=Class'KFGame.KFWeapDef_Armor'
   KnifeStats(0)=(StatValue=64.000000)
   KnifeStats(1)=(StatType=TWS_RateOfFire,StatValue=100.000000)
   KnifeStats(2)=(StatType=TWS_Range,StatValue=2.000000)
   OffPerkIconPath="UI_TraderMenu_TEX.UI_WeaponSelect_Trader_Perk"
   Name="Default__KFGFxObject_TraderItems"
   ObjectArchetype=Object'Core.Default__Object'
}
