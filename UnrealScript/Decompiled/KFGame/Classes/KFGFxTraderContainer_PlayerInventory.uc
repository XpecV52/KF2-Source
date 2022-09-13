/*******************************************************************************
 * KFGFxTraderContainer_PlayerInventory generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxTraderContainer_PlayerInventory extends KFGFxObject_Container within GFxMoviePlayer;

enum EButtonStates
{
    BS_Enabled,
    BS_MaxCapacity,
    BS_CantAfford,
    BS_MAX
};

var KFGFxMenu_Trader MyTraderMenu;
var const localized string FillString;
var const localized string MagString;
var const localized string AutoFillString;
var const localized string BuyGrenadeString;
var const localized string ChangePerkString;
var const localized string ArmorString;
var KFPlayerController KFPC;
var float LowAmmoPercentThreshold;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    KFPC = KFPlayerController(Outer.GetPC());
    MyTraderMenu = KFGFxMenu_Trader(NewParentMenu);
    LocalizeContainer();
    UpdateLock();
}

function LocalizeContainer()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("autoFill", AutoFillString);
    LocalizedObject.SetString("armorLabel", FillString);
    LocalizedObject.SetString("fillLabel", FillString);
    LocalizedObject.SetString("magLabel", MagString);
    LocalizedObject.SetString("changePerk", ChangePerkString);
    LocalizedObject.SetString("grenadeLabel", BuyGrenadeString);
    LocalizedObject.SetString("armorBuyLabel", string(Class'KFAutoPurchaseHelper'.default.ArmorMagSize) $ "X");
    LocalizedObject.SetString("sellPrompt", Localize("KFGFxTraderContainer_ItemDetails", "SellString", "KFGame"));
    LocalizedObject.SetString("perkPrompt", Localize("KFGFxTraderContainer_PlayerInventory", "PerkPrompt", "KFGameConsole"));
    SetObject("localizeStrings", LocalizedObject);
}

function UpdateLock()
{
    if(KFPC != none)
    {
        SetBool("perkChangeLocked", !KFPC.CanUpdatePerkInfo());
    }
}

function RefreshPlayerInventory()
{
    local byte MagSize, SlotIndex;
    local float PricePerRound;
    local int AmmoCount, MaxAmmoCount, PricePerMag, FillAmmoCost, BlocksRequired, AutoFillCost;

    local string TextureLocation;
    local GFxObject InfoSlot, MagSlot, FillSlot, SellSlot, InfoDataProvider, FillDataProvider,
	    MagDataProvider, SellDataProvider;

    local SItemInformation ItemInfo;

    InfoDataProvider = Outer.CreateArray();
    FillDataProvider = Outer.CreateArray();
    MagDataProvider = Outer.CreateArray();
    SellDataProvider = Outer.CreateArray();
    SetArmorInfo(KFPC.GetPurchaseHelper().ArmorItem, AutoFillCost);
    SetGrenadeInfo(KFPC.GetPurchaseHelper().GrenadeItem, AutoFillCost);
    SlotIndex = 0;
    J0x140:

    if(SlotIndex < MyTraderMenu.OwnedItemList.Length)
    {
        InfoSlot = Outer.CreateObject("Object");
        MagSlot = Outer.CreateObject("Object");
        FillSlot = Outer.CreateObject("Object");
        SellSlot = Outer.CreateObject("Object");
        ItemInfo = MyTraderMenu.OwnedItemList[SlotIndex];
        FillAmmoCost = KFPC.GetPurchaseHelper().GetFillAmmoCost(ItemInfo);
        if(ItemInfo.bIsSecondaryAmmo)
        {
            TextureLocation = ItemInfo.DefaultItem.SecondaryAmmoImagePath;
            AmmoCount = ItemInfo.SecondaryAmmoCount;
            MaxAmmoCount = ItemInfo.MaxSecondaryAmmo;
            MagSize = byte(ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize);
            PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
            PricePerRound = ((MagSize > 0) ? float(PricePerMag) / float(MagSize) : 0);
            BlocksRequired = -1;
            SetItemInfo(InfoSlot, ItemInfo.DefaultItem.WeaponDef, "SecondaryAmmo", TextureLocation, AmmoCount, MaxAmmoCount, BlocksRequired, true);
            SetMagInfo(MagSlot, AmmoCount, MaxAmmoCount, MagSize, PricePerMag, PricePerRound, FillAmmoCost);
            SetFillInfo(FillSlot, AmmoCount, MaxAmmoCount, PricePerRound, FillAmmoCost, AutoFillCost);            
        }
        else
        {
            TextureLocation = ItemInfo.DefaultItem.WeaponDef.static.GetImagePath();
            AmmoCount = ItemInfo.SpareAmmoCount;
            MaxAmmoCount = ItemInfo.MaxSpareAmmo;
            MagSize = byte(ItemInfo.MagazineCapacity);
            PricePerMag = ItemInfo.AmmoPricePerMagazine;
            PricePerRound = ((MagSize > 0) ? float(PricePerMag) / float(MagSize) : 0);
            BlocksRequired = MyTraderMenu.GetDisplayedBlocksRequiredFor(ItemInfo.DefaultItem, ItemInfo.ItemUpgradeLevel);
            SetItemInfo(InfoSlot, ItemInfo.DefaultItem.WeaponDef, "ItemName", TextureLocation, AmmoCount, MaxAmmoCount, BlocksRequired, false, KFPC.GetPurchaseHelper().GetItemUpgradeLevelByClassName(ItemInfo.DefaultItem.ClassName));
            SetMagInfo(MagSlot, AmmoCount, MaxAmmoCount, MagSize, PricePerMag, PricePerRound, FillAmmoCost);
            SetFillInfo(FillSlot, AmmoCount, MaxAmmoCount, PricePerRound, FillAmmoCost, AutoFillCost);
        }
        SetSellInfo(SellSlot, ItemInfo.SellPrice, ItemInfo.SellPrice > 0);
        InfoDataProvider.SetElementObject(SlotIndex, InfoSlot);
        MagDataProvider.SetElementObject(SlotIndex, MagSlot);
        FillDataProvider.SetElementObject(SlotIndex, FillSlot);
        SellDataProvider.SetElementObject(SlotIndex, SellSlot);
        ++ SlotIndex;
        goto J0x140;
    }
    SetAutoFill(AutoFillCost);
    SetObject("itemData", InfoDataProvider);
    SetObject("magData", MagDataProvider);
    SetObject("fillData", FillDataProvider);
    SetObject("sellData", SellDataProvider);
}

function SetArmorInfo(out SItemInformation ArmorInfo, out int AutoFillCost)
{
    local GFxObject SlotObject;
    local int FillCost, ChunkCost, ButtonState;

    FillCost = KFPC.GetPurchaseHelper().GetFillArmorCost();
    ChunkCost = KFPC.GetPurchaseHelper().GetChunkArmorCost();
    SlotObject = Outer.CreateObject("Object");
    SlotObject.SetInt("magCost", ChunkCost);
    SlotObject.SetInt("cost", FillCost);
    SlotObject.SetString("itemName", ArmorString);
    SlotObject.SetString("itemSource", "img://" $ ArmorInfo.DefaultItem.WeaponDef.static.GetImagePath());
    SlotObject.SetString("itemAmmo", (string(ArmorInfo.SpareAmmoCount) $ "/") $ string(ArmorInfo.MaxSpareAmmo));
    SlotObject.SetBool("lowAmmo", ((ArmorInfo.MaxSpareAmmo > 0) ? (float(ArmorInfo.SpareAmmoCount) / float(ArmorInfo.MaxSpareAmmo)) <= LowAmmoPercentThreshold : false));
    ButtonState = GetButtonState(float(ArmorInfo.AmmoPricePerMagazine), ArmorInfo.SpareAmmoCount, ArmorInfo.MaxSpareAmmo);
    SlotObject.SetInt("buttonState", ButtonState);
    SlotObject.SetInt("magButtonState", ButtonState);
    SetObject("armorInfo", SlotObject);
    AutoFillCost += FillCost;
}

function SetGrenadeInfo(out SItemInformation GrenadeInfo, out int AutoFillCost)
{
    local GFxObject SlotObject;
    local int FillCost, MagCost, ButtonState, AmmoPricePerMagazine;

    AmmoPricePerMagazine = GrenadeInfo.AmmoPricePerMagazine;
    SlotObject = Outer.CreateObject("Object");
    SlotObject.SetString("itemSource", "img://" $ GrenadeInfo.DefaultItem.WeaponDef.static.GetImagePath());
    SlotObject.SetString("itemName", GrenadeInfo.DefaultItem.WeaponDef.static.GetItemName());
    FillCost = KFPC.GetPurchaseHelper().GetFillGrenadeCost();
    MagCost = ((GrenadeInfo.SpareAmmoCount != GrenadeInfo.MaxSpareAmmo) ? GrenadeInfo.AmmoPricePerMagazine : 0);
    SlotObject.SetInt("magCost", MagCost);
    SlotObject.SetInt("fillCost", FillCost);
    SlotObject.SetBool("lowAmmo", ((GrenadeInfo.MaxSpareAmmo > 0) ? (float(GrenadeInfo.SpareAmmoCount) / float(GrenadeInfo.MaxSpareAmmo)) <= LowAmmoPercentThreshold : false));
    SlotObject.SetString("itemAmmo", (string(GrenadeInfo.SpareAmmoCount) $ "/") $ string(GrenadeInfo.MaxSpareAmmo));
    ButtonState = GetButtonState(float(AmmoPricePerMagazine), GrenadeInfo.SpareAmmoCount, GrenadeInfo.MaxSpareAmmo);
    SlotObject.SetInt("magButtonState", ButtonState);
    SlotObject.SetInt("fillButtonState", ButtonState);
    SetObject("grenadeInfo", SlotObject);
    AutoFillCost += FillCost;
}

function SetItemInfo(out GFxObject InfoSlot, class<KFWeaponDefinition> WeaponDef, string ItemKeyString, string TextureLocation, int AmmoCount, int MaxAmmoCount, int BlocksRequired, optional bool bSecondaryAmmo, optional int UpgradeLevel)
{
    local string ItemTexPath;

    InfoSlot.SetString("itemName", WeaponDef.static.GetItemLocalization(ItemKeyString));
    InfoSlot.SetString("itemAmmo", (string(AmmoCount) $ "/") $ string(MaxAmmoCount));
    InfoSlot.SetInt("itemWeight", BlocksRequired);
    InfoSlot.SetInt("weaponTier", UpgradeLevel);
    InfoSlot.SetBool("lowAmmo", ((MaxAmmoCount > 0) ? (float(AmmoCount) / float(MaxAmmoCount)) <= LowAmmoPercentThreshold : false));
    InfoSlot.SetBool("isSubAmmo", bSecondaryAmmo);
    ItemTexPath = "img://" $ TextureLocation;
    InfoSlot.SetString("itemSource", ItemTexPath);
}

function SetMagInfo(out GFxObject MagSlot, int AmmoCount, int MaxAmmoCount, byte AmmoMagSize, int PricePerMag, float PricePerRound, int FillAmmoCost)
{
    local int MagCost;
    local bool bBuyPartialMag;

    bBuyPartialMag = (AmmoCount + AmmoMagSize) > MaxAmmoCount;
    MagCost = ((bBuyPartialMag) ? FillAmmoCost : PricePerMag);
    MagSlot.SetString("label", MagString);
    MagSlot.SetInt("buttonValue", MagCost);
    MagSlot.SetInt("buttonState", GetButtonState(PricePerRound, AmmoCount, MaxAmmoCount));
}

function SetFillInfo(out GFxObject FillSlot, int AmmoCount, int MaxAmmoCount, float PricePerRound, int FillAmmoCost, out int AutoFillCost)
{
    FillSlot.SetString("label", FillString);
    FillSlot.SetInt("buttonValue", FillAmmoCost);
    FillSlot.SetInt("buttonState", GetButtonState(PricePerRound, AmmoCount, MaxAmmoCount));
    AutoFillCost += FillAmmoCost;
}

function SetSellInfo(out GFxObject SellSlot, int SellPrice, bool bCanSell)
{
    SellSlot.SetString("label", Localize("KFGFxTraderContainer_ItemDetails", "SellString", "KFGame"));
    SellSlot.SetInt("buttonValue", SellPrice);
    SellSlot.SetBool("buttonState", bCanSell);
}

function SetAutoFill(int AutoFillCost)
{
    local GFxObject AutoFillObject;

    AutoFillObject = Outer.CreateObject("Object");
    AutoFillObject.SetInt("buttonValue", AutoFillCost);
    AutoFillObject.SetInt("buttonState", GetButtonState(0, 0, AutoFillCost));
    SetObject("autoFillCost", AutoFillObject);
}

function int GetButtonState(float Price, int SpareAmmoCount, int MaxSpareAmmoCount)
{
    if(SpareAmmoCount >= MaxSpareAmmoCount)
    {
        return 1;        
    }
    else
    {
        if(float(KFPC.GetPurchaseHelper().TotalDosh) < Price)
        {
            return 2;
        }
    }
    return 0;
}

defaultproperties
{
    FillString="FILL"
    MagString="MAG"
    AutoFillString="AUTO FILL"
    BuyGrenadeString="1X"
    ChangePerkString="CHANGE PERK"
    ArmorString="Combat Armor"
    LowAmmoPercentThreshold=0.5
}