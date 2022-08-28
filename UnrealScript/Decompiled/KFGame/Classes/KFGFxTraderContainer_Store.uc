/*******************************************************************************
 * KFGFxTraderContainer_Store generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxTraderContainer_Store extends KFGFxObject_Container within GFxMoviePlayer;

var KFGFxMenu_Trader MyTraderMenu;
var array<STraderItem> SlotsItemList;
var const localized string TraderString;
var KFPlayerController KFPC;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    KFPC = KFPlayerController(Outer.GetPC());
    MyTraderMenu = KFGFxMenu_Trader(NewParentMenu);
    SetString("shopHeaderName", TraderString);
    LocalizeContainer();
    Outer.GetPC().SetTimer(0.1, false, 'DelayedRefresh', self);
}

function LocalizeContainer()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("buyPrompt", Localize("KFGFxTraderContainer_ItemDetails", "BuyString", "KFGame"));
    SetObject("localizeStrings", LocalizedObject);
}

function DelayedRefresh()
{
    MyTraderMenu.RefreshShopItemList(MyTraderMenu.CurrentTab, byte(MyTraderMenu.CurrentFilterIndex));
    SetSelectedIndex(0);
}

function OnTraderReopened();

function SetSelectedIndex(int SelectedIndex)
{
    SetInt("selectedIndex", SelectedIndex);
}

function RefreshWeaponListByPerk(byte FilterIndex, const out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;
    local array<STraderItem> OnPerkWeapons, SecondaryWeapons, OffPerkWeapons;
    local class<KFPerk> TargetPerkClass;

    if((FilterIndex == 255) || FilterIndex == -1)
    {
        return;
    }
    if(KFPC != none)
    {
        if(FilterIndex < KFPC.PerkList.Length)
        {
            TargetPerkClass = KFPC.PerkList[FilterIndex].PerkClass;            
        }
        else
        {
            TargetPerkClass = none;
        }
        SlotIndex = 0;
        ItemDataArray = Outer.CreateArray();
        I = 0;
        J0xFF:

        if(I < ItemList.Length)
        {
            if(IsItemFiltered(ItemList[I]))
            {
                goto J0x38D;                
            }
            else
            {
                if((((ItemList[I].AssociatedPerkClasses.Length > 0) && ItemList[I].AssociatedPerkClasses[0] != none) && TargetPerkClass != Class'KFPerk_Survivalist') && (FilterIndex >= KFPC.PerkList.Length) || ItemList[I].AssociatedPerkClasses.Find(TargetPerkClass == -1)
                {
                    goto J0x38D;                    
                }
                else
                {
                    if(ItemList[I].AssociatedPerkClasses.Length > 0)
                    {
                        switch(ItemList[I].AssociatedPerkClasses.Find(TargetPerkClass)
                        {
                            case 0:
                                if((OnPerkWeapons.Length == 0) && MyTraderMenu.SelectedList == 0)
                                {
                                    if(GetInt("currentSelectedIndex") == 0)
                                    {
                                        MyTraderMenu.SetTraderItemDetails(I);
                                    }
                                }
                                OnPerkWeapons.AddItem(ItemList[I];
                                break;
                            case 1:
                                SecondaryWeapons.AddItem(ItemList[I];
                                break;
                            default:
                                OffPerkWeapons.AddItem(ItemList[I];
                                break;
                                break;
                        }
                    }
                }
            }
            J0x38D:

            ++ I;
            goto J0xFF;
        }
        I = 0;
        J0x3A6:

        if(I < OnPerkWeapons.Length)
        {
            SetItemInfo(ItemDataArray, OnPerkWeapons[I], SlotIndex);
            ++ SlotIndex;
            ++ I;
            goto J0x3A6;
        }
        I = 0;
        J0x411:

        if(I < SecondaryWeapons.Length)
        {
            SetItemInfo(ItemDataArray, SecondaryWeapons[I], SlotIndex);
            ++ SlotIndex;
            ++ I;
            goto J0x411;
        }
        I = 0;
        J0x47C:

        if(I < OffPerkWeapons.Length)
        {
            SetItemInfo(ItemDataArray, OffPerkWeapons[I], SlotIndex);
            ++ SlotIndex;
            ++ I;
            goto J0x47C;
        }
        SetObject("shopData", ItemDataArray);
    }
}

function RefreshItemsByType(byte FilterIndex, const out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;

    SlotIndex = 0;
    ItemDataArray = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < ItemList.Length)
    {
        if((IsItemFiltered(ItemList[I])) || !(FilterIndex == ItemList[I].TraderFilter) || FilterIndex == ItemList[I].AltTraderFilter)
        {
            goto J0x12D;            
        }
        else
        {
            SetItemInfo(ItemDataArray, ItemList[I], SlotIndex);
            ++ SlotIndex;
        }
        J0x12D:

        ++ I;
        goto J0x3F;
    }
    SetObject("shopData", ItemDataArray);
}

function RefreshFavoriteItems(const out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;

    SlotIndex = 0;
    ItemDataArray = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < ItemList.Length)
    {
        if((IsItemFiltered(ItemList[I])) || !MyTraderMenu.GetIsFavorite(ItemList[I].ClassName))
        {
            goto J0x103;            
        }
        else
        {
            SetItemInfo(ItemDataArray, ItemList[I], SlotIndex);
            ++ SlotIndex;
        }
        J0x103:

        ++ I;
        goto J0x3F;
    }
    SetObject("shopData", ItemDataArray);
}

function RefreshAllItems(out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;

    SlotIndex = 0;
    ItemDataArray = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < ItemList.Length)
    {
        if(IsItemFiltered(ItemList[I]))
        {
            goto J0xB7;            
        }
        else
        {
            SetItemInfo(ItemDataArray, ItemList[I], SlotIndex);
            ++ SlotIndex;
        }
        J0xB7:

        ++ I;
        goto J0x3F;
    }
    SetObject("shopData", ItemDataArray);
}

function SetItemInfo(out GFxObject ItemDataArray, STraderItem TraderItem, int SlotIndex)
{
    local GFxObject SlotObject;
    local string ItemTexPath, IconPath, SecondaryIconPath;
    local bool bCanAfford, bCanCarry;
    local int AdjustedBuyPrice, ItemUpgradeLevel;

    SlotObject = Outer.CreateObject("Object");
    ItemTexPath = "img://" $ TraderItem.WeaponDef.static.GetImagePath();
    if((TraderItem.AssociatedPerkClasses.Length > 0) && TraderItem.AssociatedPerkClasses[0] != none)
    {
        IconPath = "img://" $ TraderItem.AssociatedPerkClasses[0].static.GetPerkIconPath();
        if(TraderItem.AssociatedPerkClasses.Length > 1)
        {
            SecondaryIconPath = "img://" $ TraderItem.AssociatedPerkClasses[1].static.GetPerkIconPath();
        }        
    }
    else
    {
        IconPath = "img://" $ Class'KFGFxObject_TraderItems'.default.OffPerkIconPath;
    }
    SlotObject.SetString("buyText", Localize("KFGFxTraderContainer_ItemDetails", "BuyString", "KFGame"));
    SlotObject.SetInt("itemID", TraderItem.ItemId);
    SlotObject.SetString("weaponSource", ItemTexPath);
    SlotObject.SetString("perkIconSource", IconPath);
    SlotObject.SetString("perkSecondaryIconSource", SecondaryIconPath);
    SlotObject.SetString("weaponName", TraderItem.WeaponDef.static.GetItemName());
    SlotObject.SetString("weaponType", TraderItem.WeaponDef.static.GetItemCategory());
    ItemUpgradeLevel = ((TraderItem.SingleClassName != 'None') ? KFPC.GetPurchaseHelper().GetItemUpgradeLevelByClassName(TraderItem.SingleClassName) : -1);
    SlotObject.SetInt("weaponWeight", MyTraderMenu.GetDisplayedBlocksRequiredFor(TraderItem, ItemUpgradeLevel));
    AdjustedBuyPrice = KFPC.GetPurchaseHelper().GetAdjustedBuyPriceFor(TraderItem);
    SlotObject.SetInt("weaponCost", AdjustedBuyPrice);
    bCanAfford = KFPC.GetPurchaseHelper().GetCanAfford(AdjustedBuyPrice);
    bCanCarry = KFPC.GetPurchaseHelper().CanCarry(TraderItem, ItemUpgradeLevel);
    SlotObject.SetBool("bCanAfford", bCanAfford);
    SlotObject.SetBool("bCanCarry", bCanCarry);
    ItemDataArray.SetElementObject(SlotIndex, SlotObject);
}

function bool IsItemFiltered(STraderItem Item)
{
    if(KFPC.GetPurchaseHelper().IsInOwnedItemList(Item.ClassName))
    {
        return true;
    }
    if(KFPC.GetPurchaseHelper().IsInOwnedItemList(Item.DualClassName))
    {
        return true;
    }
    if(!KFPC.GetPurchaseHelper().IsSellable(Item))
    {
        return true;
    }
    if((Item.WeaponDef.default.SharedUnlockId != 0) && !Class'KFUnlockManager'.static.IsSharedContentUnlocked(Item.WeaponDef.default.SharedUnlockId))
    {
        return true;
    }
    if((Item.WeaponDef.default.PlatformRestriction != 0) && Class'KFUnlockManager'.static.IsPlatformRestricted(Item.WeaponDef.default.PlatformRestriction))
    {
        return true;
    }
    return false;
}

defaultproperties
{
    TraderString="PURCHASE GEAR"
}