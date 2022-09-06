/*******************************************************************************
 * KFGFxTraderContainer_ItemDetails generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxTraderContainer_ItemDetails extends KFGFxObject_Container within GFxMoviePlayer;

const WeaponStatMax_Damage = 820.f;
const WeaponStatMax_FireRate = 800.f;
const WeaponStatMax_Penetration = 4.f;
const WeaponStatMax_Range = 100.f;
const WeaponStatMax_Block = 1.f;
const WeaponStatMax_Parry = 10.f;
const WeaponStatMax_HealAmount = 50.f;
const WeaponStatMax_HealRechargeSpeed = 10.f;

var const float MAX_RPM;
var const float MAX_PENETRATION;
var KFGFxMenu_Trader MyTraderMenu;
var const localized string DamageTitle;
var const localized string FireRateTitle;
var const localized string RangeTitle;
var const localized string PenetrationTitle;
var const localized string BlockTitle;
var const localized string ParryTitle;
var const localized string AccuracyTitle;
var const localized string CapacityTitle;
var const localized string MagTitle;
var const localized string HealAmountTitle;
var const localized string HealRechargeTitle;
var const localized string BuyString;
var const localized string SellString;
var const localized string CannotSellString;
var const localized string CannotBuyString;
var const localized string FavoriteString;
var const localized string UnfavoriteString;
var const localized string UpgradeCostString;
var const localized string UpgradeString;
var GFxObject DetailsContainer;
var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    MyTraderMenu = KFGFxMenu_Trader(NewParentMenu);
    DetailsContainer = GetObject("detailedStats");
    KFPC = KFPlayerController(Outer.GetPC());
    LocalizeContainer();
}

function LocalizeContainer()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("damageTitle", DamageTitle);
    LocalizedObject.SetString("fireRateTitle", FireRateTitle);
    LocalizedObject.SetString("penetrationTitle", PenetrationTitle);
    LocalizedObject.SetString("accuracyTitle", AccuracyTitle);
    LocalizedObject.SetString("capacityTitle", CapacityTitle);
    LocalizedObject.SetString("magTitle", MagTitle);
    LocalizedObject.SetString("upgradeCost", UpgradeCostString);
    LocalizedObject.SetString("favorite", UpgradeString);
    LocalizedObject.SetString("unfavorite", UnfavoriteString);
    SetObject("localizeContainer", LocalizedObject);
}

function SetDetailsVisible(string DetailName, bool bVisible)
{
    if(DetailsContainer != none)
    {
        DetailsContainer.GetObject(DetailName $ "Title").SetVisible(bVisible);
        DetailsContainer.GetObject(DetailName $ "Bar").SetVisible(bVisible);
        DetailsContainer.GetObject(DetailName $ "Value").SetVisible(false);
    }
}

function SetDetailsText(string DetailName, string NewName)
{
    if(DetailsContainer != none)
    {
        DetailsContainer.GetObject(DetailName $ "Title").SetString("text", NewName);
    }
}

function SetShopItemDetails(out STraderItem TraderItem, int ItemPrice, bool bCanCarry, bool bCanBuy)
{
    local GFxObject ItemData;

    ItemData = Outer.CreateObject("Object");
    ItemData.SetInt("price", ItemPrice);
    ItemData.SetBool("bUsingBuyLabel", true);
    ItemData.SetString("buyOrSellLabel", BuyString);
    ItemData.SetString("cannotBuyOrSellLabel", CannotBuyString);
    ItemData.SetBool("bCanCarry", bCanCarry);
    ItemData.SetBool("bCanBuyOrSell", bCanBuy);
    ItemData.SetBool("bCanFavorite", true);
    ItemData.SetBool("bCanUpgrade", false);
    SetGenericItemDetails(TraderItem, ItemData);
}

function SetPlayerItemDetails(out STraderItem TraderItem, int ItemPrice, optional int UpgradeLevel)
{
    local GFxObject ItemData;
    local int CanAffordIndex, CanCarryIndex;

    UpgradeLevel = -1;
    KFPC.GetPurchaseHelper().CanUpgrade(TraderItem, CanCarryIndex, CanAffordIndex);
    ItemData = Outer.CreateObject("Object");
    ItemData.SetInt("price", ItemPrice);
    ItemData.SetBool("bUsingBuyLabel", false);
    ItemData.SetString("buyOrSellLabel", SellString);
    ItemData.SetString("cannotBuyOrSellLabel", CannotSellString);
    ItemData.SetBool("bCanUpgrade", true);
    ItemData.SetBool("bCanBuyUpgrade", CanAffordIndex > 0);
    ItemData.SetBool("bCanCarryUpgrade", CanCarryIndex > 0);
    if(UpgradeLevel > -1)
    {
        if(TraderItem.WeaponDef.static.GetUpgradePrice(UpgradeLevel) == -1)
        {
            ItemData.SetInt("upgradePrice", 0);
            ItemData.SetInt("upgradeWeight", 0);
            ItemData.SetBool("bCanUpgrade", false);            
        }
        else
        {
            ItemData.SetInt("upgradePrice", TraderItem.WeaponDef.static.GetUpgradePrice(UpgradeLevel));
            ItemData.SetInt("upgradeWeight", TraderItem.WeaponUpgradeWeight[UpgradeLevel + 1] - TraderItem.WeaponUpgradeWeight[UpgradeLevel]);
        }        
    }
    else
    {
        ItemData.SetInt("upgradePrice", 0);
        ItemData.SetInt("upgradeWeight", 0);
    }
    ItemData.SetInt("weaponTier", UpgradeLevel);
    ItemData.SetBool("bCanCarry", true);
    ItemData.SetBool("bCanBuyOrSell", KFPC.GetPurchaseHelper().IsSellable(TraderItem));
    ItemData.SetBool("bHideStats", TraderItem.WeaponStats.Length == 0);
    ItemData.SetBool("bCanFavorite", true);
    SetGenericItemDetails(TraderItem, ItemData, UpgradeLevel);
}

function string GetLocalizedStatString(KFGFxObject_TraderItems.TraderWeaponStat Stat)
{
    switch(Stat)
    {
        case 0:
            return DamageTitle;
        case 3:
            return FireRateTitle;
        case 1:
            return RangeTitle;
        case 2:
            return PenetrationTitle;
        case 4:
            return BlockTitle;
        case 5:
            return ParryTitle;
        case 6:
            return MagTitle;
        case 7:
            return CapacityTitle;
        case 8:
            return HealAmountTitle;
        case 9:
            return HealRechargeTitle;
        default:
            return "";
            break;
    }
}

function float GetStatMax(KFGFxObject_TraderItems.TraderWeaponStat Stat)
{
    switch(Stat)
    {
        case 0:
            return 820;
        case 3:
            return 800;
        case 1:
            return 100;
        case 2:
            return 4;
        case 4:
            return 1;
        case 5:
            return 10;
        case 8:
            return 50;
        case 9:
            return 10;
        default:
            return 1;
            break;
    }
}

function SetGenericItemDetails(const out STraderItem TraderItem, out GFxObject ItemData, optional int UpgradeLevel)
{
    local KFPerk CurrentPerk;
    local int FinalMaxSpareAmmoCount;
    local byte FinalMagazineCapacity;
    local float DamageValue, NextDamageValue;

    UpgradeLevel = -1;
    if((TraderItem.WeaponStats.Length >= 0) && TraderItem.WeaponStats.Length > 0)
    {
        DamageValue = TraderItem.WeaponStats[0].StatValue * ((UpgradeLevel > -1) ? TraderItem.WeaponUpgradeDmgMultiplier[UpgradeLevel] : 1);
        SetDetailsVisible("damage", true);
        SetDetailsText("damage", GetLocalizedStatString(TraderItem.WeaponStats[0].StatType));
        ItemData.SetInt("damageValue", int(DamageValue));
        ItemData.SetInt("damagePercent", int((FMin(DamageValue / (GetStatMax(TraderItem.WeaponStats[0].StatType)), 1) ** 0.5) * 100));
        if((UpgradeLevel + 1) < 6)
        {
            NextDamageValue = TraderItem.WeaponStats[0].StatValue * TraderItem.WeaponUpgradeDmgMultiplier[UpgradeLevel + 1];
            ItemData.SetInt("damageUpgradePercent", int((FMin(NextDamageValue / (GetStatMax(TraderItem.WeaponStats[0].StatType)), 1) ** 0.5) * 100));            
        }
        else
        {
            NextDamageValue = DamageValue;
            ItemData.SetInt("damageUpgradePercent", int((FMin(DamageValue / (GetStatMax(TraderItem.WeaponStats[0].StatType)), 1) ** 0.5) * 100));
        }        
    }
    else
    {
        SetDetailsVisible("damage", false);
    }
    if(TraderItem.WeaponStats.Length >= 2)
    {
        SetDetailsVisible("penetration", true);
        SetDetailsText("penetration", GetLocalizedStatString(TraderItem.WeaponStats[2].StatType));
        if(TraderItem.TraderFilter != 8)
        {
            ItemData.SetInt("penetrationValue", int(TraderItem.WeaponStats[2].StatValue));
            ItemData.SetInt("penetrationPercent", int((FMin(TraderItem.WeaponStats[2].StatValue / (GetStatMax(TraderItem.WeaponStats[2].StatType)), 1) ** 0.5) * 100));            
        }
        else
        {
            SetDetailsVisible("penetration", false);
        }        
    }
    else
    {
        SetDetailsVisible("penetration", false);
    }
    if(TraderItem.WeaponStats.Length >= 3)
    {
        SetDetailsVisible("fireRate", true);
        SetDetailsText("fireRate", GetLocalizedStatString(TraderItem.WeaponStats[3].StatType));
        if(TraderItem.TraderFilter != 8)
        {
            ItemData.SetInt("fireRateValue", int(TraderItem.WeaponStats[3].StatValue));
            ItemData.SetInt("fireRatePercent", int(FMin(TraderItem.WeaponStats[3].StatValue / (GetStatMax(TraderItem.WeaponStats[3].StatType)), 1) * 100));            
        }
        else
        {
            SetDetailsVisible("fireRate", false);
        }        
    }
    else
    {
        SetDetailsVisible("fireRate", false);
    }
    if(TraderItem.WeaponStats.Length >= 1)
    {
        SetDetailsVisible("accuracy", true);
        SetDetailsText("accuracy", GetLocalizedStatString(TraderItem.WeaponStats[1].StatType));
        ItemData.SetInt("accuracyValue", int(TraderItem.WeaponStats[1].StatValue));
        ItemData.SetInt("accuracyPercent", int(FMin(TraderItem.WeaponStats[1].StatValue / (GetStatMax(TraderItem.WeaponStats[1].StatType)), 1) * 100));        
    }
    else
    {
        SetDetailsVisible("accuracy", false);
    }
    ItemData.SetString("type", TraderItem.WeaponDef.static.GetItemName());
    ItemData.SetString("name", TraderItem.WeaponDef.static.GetItemCategory());
    ItemData.SetString("description", TraderItem.WeaponDef.static.GetItemDescription());
    CurrentPerk = KFPlayerController(Outer.GetPC()).CurrentPerk;
    if(CurrentPerk != none)
    {
        FinalMaxSpareAmmoCount = TraderItem.MaxSpareAmmo;
        FinalMagazineCapacity = TraderItem.MagazineCapacity;
        CurrentPerk.ModifyMagSizeAndNumber(none, FinalMagazineCapacity, TraderItem.AssociatedPerkClasses,, TraderItem.ClassName);
        CurrentPerk.ModifyMaxSpareAmmoAmount(none, FinalMaxSpareAmmoCount, TraderItem);
        FinalMaxSpareAmmoCount += FinalMagazineCapacity;        
    }
    else
    {
        FinalMaxSpareAmmoCount = TraderItem.MaxSpareAmmo;
        FinalMagazineCapacity = TraderItem.MagazineCapacity;
    }
    ItemData.SetInt("ammoCapacity", FinalMaxSpareAmmoCount);
    ItemData.SetInt("magSizeValue", FinalMagazineCapacity);
    ItemData.SetInt("weight", MyTraderMenu.GetDisplayedBlocksRequiredFor(TraderItem));
    ItemData.SetBool("bIsFavorite", MyTraderMenu.GetIsFavorite(TraderItem.ClassName));
    ItemData.SetString("texturePath", "img://" $ TraderItem.WeaponDef.static.GetImagePath());
    if((TraderItem.AssociatedPerkClasses.Length > 0) && TraderItem.AssociatedPerkClasses[0] != none)
    {
        ItemData.SetString("perkIconPath", "img://" $ TraderItem.AssociatedPerkClasses[0].static.GetPerkIconPath());
        if(TraderItem.AssociatedPerkClasses.Length > 1)
        {
            ItemData.SetString("perkIconPathSecondary", "img://" $ TraderItem.AssociatedPerkClasses[1].static.GetPerkIconPath());
        }        
    }
    else
    {
        ItemData.SetString("perkIconPath", "img://" $ Class'KFGFxObject_TraderItems'.default.OffPerkIconPath);
    }
    SetObject("itemData", ItemData);
}

defaultproperties
{
    MAX_RPM=1000
    MAX_PENETRATION=5
    DamageTitle="DAMAGE"
    FireRateTitle="FIRE RATE"
    RangeTitle="RANGE"
    PenetrationTitle="PENETRATION"
    BlockTitle="BLOCK"
    ParryTitle="PARRY"
    AccuracyTitle="ACCURACY"
    CapacityTitle="AMMO CAPACITY"
    MagTitle="MAGAZINE SIZE"
    HealAmountTitle="HEAL AMOUNT"
    HealRechargeTitle="RECHARGE TIME"
    BuyString="BUY"
    SellString="SELL"
    CannotSellString="CANNOT SELL"
    CannotBuyString="CANNOT BUY"
    FavoriteString="FAVORITE"
    UnfavoriteString="UNFAVORITE"
    UpgradeCostString="UPGRADE COST"
    UpgradeString="UPGRADE"
}