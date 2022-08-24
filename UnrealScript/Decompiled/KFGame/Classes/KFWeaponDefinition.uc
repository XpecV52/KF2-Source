/*******************************************************************************
 * KFWeaponDefinition generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeaponDefinition extends Object
    abstract
    native;

var string WeaponClassPath;
var string AttachmentArchtypePath;
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
var(Trader) KFUnlockManager.ESharedContentUnlock SharedUnlockId;
/** The platform restriction for the weapon */
var(Trader) KFUnlockManager.EPlatformRestriction PlatformRestriction;
/** Theoretical maximum effective range for a weapon. Range is 0-100. */
var() byte EffectiveRange;

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
