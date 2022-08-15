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

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    MyTraderMenu = KFGFxMenu_Trader(NewParentMenu);
    SetString("shopHeaderName", TraderString);
    SetString("cancelPromptName", Class'KFCommon_LocalizedStrings'.default.CancelString);
    Outer.GetPC().SetTimer(0.1, false, 'DelayedRefresh', self);
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

function RefreshWeaponListByPerk(byte FilterIndex, out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;
    local array<STraderItem> FullItemList;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        SlotIndex = 0;
        ItemList.Length = 0;
        ItemDataArray = Outer.CreateArray();
        FullItemList = MyTraderMenu.TraderItems.SaleItems;
        I = 0;
        J0xC9:

        if(I < FullItemList.Length)
        {
            if(IsItemFiltered(FullItemList[I]))
            {
                goto J0x22E;                
            }
            else
            {
                if((FullItemList[I].AssociatedPerkClass != none) && (FilterIndex >= KFPC.PerkList.Length) || FullItemList[I].AssociatedPerkClass != KFPC.PerkList[FilterIndex].PerkClass)
                {
                    goto J0x22E;                    
                }
                else
                {
                    ItemList.AddItem(FullItemList[I];
                    SetItemInfo(ItemDataArray, FullItemList[I], SlotIndex);
                    ++ SlotIndex;
                }
            }
            J0x22E:

            ++ I;
            goto J0xC9;
        }
        SetObject("shopData", ItemDataArray);
    }
}

function RefreshItemsByType(byte FilterIndex, out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;
    local array<STraderItem> FullItemList;

    SlotIndex = 0;
    ItemList.Length = 0;
    ItemDataArray = Outer.CreateArray();
    FullItemList = MyTraderMenu.TraderItems.SaleItems;
    I = 0;
    J0x88:

    if(I < FullItemList.Length)
    {
        if((IsItemFiltered(FullItemList[I])) || FilterIndex != FullItemList[I].TraderFilter)
        {
            goto J0x15A;            
        }
        else
        {
            ItemList.AddItem(FullItemList[I];
            SetItemInfo(ItemDataArray, FullItemList[I], SlotIndex);
            ++ SlotIndex;
        }
        J0x15A:

        ++ I;
        goto J0x88;
    }
    SetObject("shopData", ItemDataArray);
}

function RefreshFavoriteItems(out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;
    local array<STraderItem> FullItemList;

    SlotIndex = 0;
    ItemList.Length = 0;
    ItemDataArray = Outer.CreateArray();
    FullItemList = MyTraderMenu.TraderItems.SaleItems;
    I = 0;
    J0x88:

    if(I < FullItemList.Length)
    {
        if((IsItemFiltered(FullItemList[I])) || !MyTraderMenu.GetIsFavorite(FullItemList[I].ClassName))
        {
            goto J0x16C;            
        }
        else
        {
            ItemList.AddItem(FullItemList[I];
            SetItemInfo(ItemDataArray, FullItemList[I], SlotIndex);
            ++ SlotIndex;
        }
        J0x16C:

        ++ I;
        goto J0x88;
    }
    SetObject("shopData", ItemDataArray);
}

function RefreshAllItems(out array<STraderItem> ItemList)
{
    local int I, SlotIndex;
    local GFxObject ItemDataArray;
    local array<STraderItem> FullItemList;

    SlotIndex = 0;
    ItemList.Length = 0;
    ItemDataArray = Outer.CreateArray();
    FullItemList = MyTraderMenu.TraderItems.SaleItems;
    I = 0;
    J0x88:

    if(I < FullItemList.Length)
    {
        if(IsItemFiltered(FullItemList[I]))
        {
            goto J0x120;            
        }
        else
        {
            ItemList.AddItem(FullItemList[I];
            SetItemInfo(ItemDataArray, FullItemList[I], SlotIndex);
            ++ SlotIndex;
        }
        J0x120:

        ++ I;
        goto J0x88;
    }
    SetObject("shopData", ItemDataArray);
}

function SetItemInfo(out GFxObject ItemDataArray, out STraderItem TraderItem, int SlotIndex)
{
    local GFxObject SlotObject;
    local string ItemTexPath, IconPath;
    local bool bCanAfford, bCanCarry;
    local int AdjustedBuyPrice;

    SlotObject = Outer.CreateObject("Object");
    ItemTexPath = "img://" $ TraderItem.WeaponDef.static.GetImagePath();
    if(TraderItem.AssociatedPerkClass != none)
    {
        IconPath = "img://" $ TraderItem.AssociatedPerkClass.static.GetPerkIconPath();        
    }
    else
    {
        IconPath = "img://" $ Class'KFGFxObject_TraderItems'.default.OffPerkIconPath;
    }
    SlotObject.SetString("weaponSource", ItemTexPath);
    SlotObject.SetString("perkIconSource", IconPath);
    SlotObject.SetString("weaponName", TraderItem.WeaponDef.static.GetItemName());
    SlotObject.SetString("weaponType", TraderItem.WeaponDef.static.GetItemCategory());
    SlotObject.SetInt("weaponWeight", MyTraderMenu.GetDisplayedBlocksRequiredFor(TraderItem));
    AdjustedBuyPrice = MyTraderMenu.GetAdjustedBuyPriceFor(TraderItem);
    SlotObject.SetInt("weaponCost", AdjustedBuyPrice);
    bCanAfford = GetCanAfford(AdjustedBuyPrice);
    bCanCarry = CanCarry(TraderItem);
    SlotObject.SetBool("bCanAfford", bCanAfford);
    SlotObject.SetBool("bCanCarry", bCanCarry);
    ItemDataArray.SetElementObject(SlotIndex, SlotObject);
}

function bool IsItemFiltered(const out STraderItem Item)
{
    if(MyTraderMenu.IsInOwnedItemList(Item.ClassName))
    {
        return true;
    }
    if(MyTraderMenu.IsInOwnedItemList(Item.DualClassName))
    {
        return true;
    }
    if(!MyTraderMenu.IsSellable(Item))
    {
        return true;
    }
    if((Item.WeaponDef.default.SharedUnlockId != 0) && !Class'KFUnlockManager'.static.IsSharedContentUnlocked(Item.WeaponDef.default.SharedUnlockId))
    {
        return true;
    }
    return false;
}

function bool GetCanAfford(int BuyPrice)
{
    if(BuyPrice > MyTraderMenu.TotalDosh)
    {
        return false;
    }
    return true;
}

function bool CanCarry(const out STraderItem Item)
{
    if((MyTraderMenu.TotalBlocks + MyTraderMenu.GetDisplayedBlocksRequiredFor(Item)) > MyTraderMenu.MaxBlocks)
    {
        return false;
    }
    return true;
}

defaultproperties
{
    TraderString="PURCHASE GEAR"
}