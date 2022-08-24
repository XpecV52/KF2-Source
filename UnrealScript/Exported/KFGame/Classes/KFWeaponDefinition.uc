//=============================================================================
// KFWeaponDefinition
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeaponDefinition extends Object
	abstract
	native;

/** weapon class path for DLO */
var string WeaponClassPath;

//used to load in the 3rd person attachment preview
var string AttachmentArchtypePath;

/** Path to the UI thumbnail texture */
var protected string ImagePath;

/** The cost of this weapon ( Sold for .75 this amount ) */
var(Trader) int BuyPrice;
/** Price per magazine */
var(Trader) int AmmoPricePerMag;

/** How much ammo you will receive for buying a "mag" (or making one purchase) of secondary ammo */
var(Trader) int SecondaryAmmoMagSize;
/** Price to fill the secondary ammo */
var(Trader) int SecondaryAmmoMagPrice;

/** Id for shared unlock if applicable */
var(Trader) ESharedContentUnlock SharedUnlockId;

/** The platform restriction for the weapon */
var(Trader) EPlatformRestriction PlatformRestriction;

/** Theoretical maximum effective range for a weapon. Range is 0-100. */
var() byte EffectiveRange;

/** Returns Gfx image path for this item def */
static function string GetImagePath()
{
	return default.ImagePath;
}

static function string GetItemName()
{
	return GetItemLocalization("ItemName");
}

static function string GetItemCategory()
{
	return GetItemLocalization("ItemCategory");
}

static function string GetItemDescription()
{
	return GetItemLocalization("ItemDescription");
}

static function string GetItemLocalization(string KeyName)
{
	local array<string> Strings;
	ParseStringIntoArray(default.WeaponClassPath, Strings, ".", true);
	return Localize(Strings[1], KeyName, Strings[0]);	
}

static function bool UsesAmmo()
{
	return default.AmmoPricePerMag > 0;
}

static function bool UsesSecondaryAmmo()
{
	return default.SecondaryAmmoMagPrice > 0;	
}

defaultproperties
{
   Name="Default__KFWeaponDefinition"
   ObjectArchetype=Object'Core.Default__Object'
}
