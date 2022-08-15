/*******************************************************************************
 * KFGFxMenu_Trader generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_Trader extends KFGFxObject_Menu within GFxMoviePlayer
    config(Game);

enum EItemType
{
    IT_Weapon,
    IT_Armor,
    IT_NonSellable,
    IT_Grenade,
    IT_MAX
};

enum TraderList
{
    TL_Shop,
    TL_Player,
    TL_MAX
};

enum TabIndices
{
    TI_Perks,
    TI_Type,
    TI_Favorites,
    TI_All,
    TI_MAX
};

struct SItemInformation
{
    var bool bIsSecondaryAmmo;
    var int SpareAmmoCount;
    var int MaxSpareAmmo;
    var int MagazineCapacity;
    var int SecondaryAmmoCount;
    var int MaxSecondaryAmmoCount;
    var int SellPrice;
    var int AutoFillDosh;
    var int AmmoPricePerMagazine;
    var STraderItem DefaultItem;

    structdefaultproperties
    {
        bIsSecondaryAmmo=false
        SpareAmmoCount=0
        MaxSpareAmmo=0
        MagazineCapacity=0
        SecondaryAmmoCount=0
        MaxSecondaryAmmoCount=0
        SellPrice=0
        AutoFillDosh=0
        AmmoPricePerMagazine=0
        DefaultItem=(bHasNoClass=false,bSellable=true,bUsesAmmo=false,bUsesSecondaryAmmo=false,PathName=None,SingleClassPathName=None,ItemClass=none,BuyPrice=0,AmmoPricePerMagazine=0,SecondaryAmmoMagSize=0,SecondaryAmmoMagPrice=0,TextureLocation="",SecondaryAmmoTexturePath="",bHideStats=false,ClassName=None,SingleClassName=None,DualClassName=None,FilterType=0,AssociatedPerkClass=none,PerkIconString="",MagazineCapacity=0,InitialSpareMags=0,MaxSpareAmmo=0,MaxSecondaryAmmoCount=0,BlocksRequired=0,InventoryGroup=0,GroupPriority=0,Power=0,FireRate=0,Penetration=0,Accuracy=0,WeaponStats=none,SharedUnlockId=ESharedContentUnlock.SCU_None)
    }
};

var array<SItemInformation> OwnedItemList;
var SItemInformation GrenadeItem;
var SItemInformation ArmorItem;
var KFGFxObject_TraderItems TraderItems;
var array<STraderItem> ShopWeaponList;
var KFPlayerController MyKFPC;
var KFPlayerReplicationInfo MyKFPRI;
var KFInventoryManager MyKFIM;
var KFGFxTraderContainer_GameInfo GameInfoContainer;
var KFGFxTraderContainer_Filter FilterContainer;
var KFGFxTraderContainer_Store ShopContainer;
var KFGFxTraderContainer_PlayerInventory PlayerInventoryContainer;
var KFGFxTraderContainer_PlayerInfo PlayerInfoContainer;
var KFGFxTraderContainer_ItemDetails ItemDetails;
var int CurrentFilterIndex;
var int TotalDosh;
var bool bPendingDoshUpdate;
var bool bGenericItemSelected;
var bool bCanBuyOrSellItem;
var int TotalBlocks;
var byte MaxBlocks;
var KFGFxMenu_Trader.TabIndices CurrentTab;
var byte SelectedList;
var byte SelectedItemIndex;
var STraderItem LastDefaultItemInfo;
var SItemInformation LastItemInfo;
var const localized string ExitMenuString;
var int PrevArmor;
var config array<config name> FavoritedItems;
var KFPerk LastPerkClass;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    MyKFPC = KFPlayerController(Outer.GetPC());
    SetString("exitMenuString", ExitMenuString);
}

function OnOpen()
{
    if(MyKFPC == none)
    {
        return;
    }
    if((MyKFPC.Pawn != none) && MyKFPC.PlayerReplicationInfo != none)
    {
        MyKFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
        MyKFIM = KFInventoryManager(Outer.GetPC().Pawn.InvManager);
        if((MyKFPRI != none) && MyKFIM != none)
        {
            InitializeOwnedItemList();
            TotalBlocks = MyKFIM.CurrentCarryBlocks;
            TotalDosh = int(MyKFPRI.Score);
            MaxBlocks = MyKFIM.MaxCarryBlocks;
            CurrentFilterIndex = MyKFPRI.NetPerkIndex;
            UpdatePlayerInfo();            
        }
        else
        {
            MyKFPC.CloseTraderMenu();
        }        
    }
    else
    {
        MyKFPC.CloseTraderMenu();
    }
    RefreshItemComponents();
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.UpdateLock();
    }
    if(ShopContainer != none)
    {
        ShopContainer.OnTraderReopened();
    }
    MyKFPC.bClientTraderMenuOpen = true;
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'GameInfoContainer':
            if(GameInfoContainer == none)
            {
                GameInfoContainer = KFGFxTraderContainer_GameInfo(Widget);
                GameInfoContainer.Initialize(self);
                GameInfoContainer.SetDosh(TotalDosh);
                GameInfoContainer.SetCurrentWeight(TotalBlocks, MaxBlocks);
            }
            break;
        case 'FilterContainer':
            if(FilterContainer == none)
            {
                FilterContainer = KFGFxTraderContainer_Filter(Widget);
                FilterContainer.SetTabsData();
            }
            break;
        case 'ShopContainer':
            if(ShopContainer == none)
            {
                ShopContainer = KFGFxTraderContainer_Store(Widget);
                ShopContainer.Initialize(self);
                RefreshShopItemList(0, byte(CurrentFilterIndex));
            }
            break;
        case 'PlayerInventoryContainer':
            if(PlayerInventoryContainer == none)
            {
                PlayerInventoryContainer = KFGFxTraderContainer_PlayerInventory(Widget);
                PlayerInventoryContainer.Initialize(self);
                PlayerInventoryContainer.RefreshPlayerInventory();
            }
            break;
        case 'PlayerInfoContainer':
            if(PlayerInfoContainer == none)
            {
                PlayerInfoContainer = KFGFxTraderContainer_PlayerInfo(Widget);
                PlayerInfoContainer.Initialize(self);
            }
            break;
        case 'itemDetailsContainer':
            if(ItemDetails == none)
            {
                ItemDetails = KFGFxTraderContainer_ItemDetails(Widget);
                ItemDetails.Initialize(self);
            }
            break;
        default:
            break;
    }
    return true;
}

event OnClose()
{
    MyKFIM.ServerCloseTraderMenu();
    MyKFPC.MyGFxHUD.WeaponSelectWidget.RefreshWeaponSelect();
    OwnedItemList.Length = 0;
    TotalDosh = 0;
    super.OnClose();
    MyKFPC.bClientTraderMenuOpen = false;
}

function AddDosh(int AddedDosh)
{
    TotalDosh = Max(TotalDosh + AddedDosh, 0);
    if(Outer.GetPC().Role < ROLE_Authority)
    {
        bPendingDoshUpdate = true;
        Outer.GetPC().SetTimer(2, false, 'UpdateCurrentDosh', self);
    }
}

simulated function NotifyDoshChanged()
{
    if(bPendingDoshUpdate)
    {
        bPendingDoshUpdate = false;
        if(MyKFPRI.Score != float(TotalDosh))
        {
            return;
        }
    }
    UpdateCurrentDosh();
}

simulated function UpdateCurrentDosh()
{
    TotalDosh = Max(int(MyKFPRI.Score), 0);
    RefreshItemComponents();
    bPendingDoshUpdate = false;
    Outer.GetPC().ClearTimer('UpdateCurrentDosh', self);
}

function AddBlocks(int AddedBlocks)
{
    TotalBlocks = Max(TotalBlocks + AddedBlocks, 0);
}

function OneSecondLoop()
{
    local KFPawn_Human KFP;

    if(GameInfoContainer != none)
    {
        GameInfoContainer.UpdateTraderTimer();
    }
    KFP = KFPawn_Human(MyKFPC.Pawn);
    if((KFP != none) && PrevArmor != KFP.Armor)
    {
        ArmorItem.SpareAmmoCount = KFP.Armor;
        PrevArmor = KFP.Armor;
        RefreshItemComponents();
    }
    UpdatePlayerInfo();
}

function UpdatePlayerInfo()
{
    local STraderItem TraderItem;

    if((MyKFPC != none) && PlayerInfoContainer != none)
    {
        if(MyKFPC.CurrentPerk != LastPerkClass)
        {
            PlayerInfoContainer.SetPerkInfo();
            PlayerInfoContainer.SetPerkList();
            LastPerkClass = MyKFPC.CurrentPerk;
            TraderItem = TraderItems.GetGrenadeByPerk(MyKFPC.CurrentPerk.Class);
            GrenadeItem.DefaultItem = TraderItem;
            GrenadeItem.DefaultItem.TextureLocation = TraderItem.TextureLocation;
            RefreshItemComponents();
        }
    }
}

function InitializeOwnedItemList()
{
    local Inventory Inv;
    local KFWeapon KFW;
    local KFPawn_Human KFP;

    OwnedItemList.Length = 0;
    TraderItems = KFGameReplicationInfo(MyKFPC.WorldInfo.GRI).TraderItems;
    KFP = KFPawn_Human(MyKFPC.Pawn);
    if(KFP != none)
    {
        AddDefaultInventory(ArmorItem, TraderItems.ArmorItem, KFP.Armor, KFP.GetMaxArmor());
        ArmorItem.AmmoPricePerMagazine *= MyKFPC.CurrentPerk.GetArmorDiscountMod();
        AddDefaultInventory(GrenadeItem, TraderItems.GetGrenadeByPerk(MyKFPC.CurrentPerk.Class), MyKFIM.GrenadeCount, KFP.GetPerk().MaxGrenadeCount);
        Inv = MyKFIM.InventoryChain;
        J0x24A:

        if(Inv != none)
        {
            KFW = KFWeapon(Inv);
            if(KFW != none)
            {
                SetWeaponInformation(KFW);
            }
            Inv = Inv.Inventory;
            goto J0x24A;
        }
    }
}

function AddDefaultInventory(out SItemInformation ItemInfo, STraderItem TraderItem, int SpareAmmo, int MaxSpareAmmo)
{
    ItemInfo.DefaultItem = TraderItem;
    ItemInfo.SpareAmmoCount = SpareAmmo;
    ItemInfo.MaxSpareAmmo = MaxSpareAmmo;
    ItemInfo.MagazineCapacity = TraderItem.MagazineCapacity;
    ItemInfo.AmmoPricePerMagazine = TraderItem.AmmoPricePerMagazine;
    ItemInfo.DefaultItem.TextureLocation = TraderItem.TextureLocation;
}

function GiveExternalWeapon(KFWeapon KFW)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < OwnedItemList.Length)
    {
        if(OwnedItemList[I].DefaultItem.ClassName == KFW.Class.Name)
        {
            return;
        }
        ++ I;
        goto J0x0B;
    }
    if((TotalBlocks + KFW.InventorySize) > MaxBlocks)
    {
        if(MyKFPC.Pawn != none)
        {
            MyKFPC.Pawn.TossInventory(KFW);
        }        
    }
    else
    {
        AddBlocks(KFW.InventorySize);
        SetWeaponInformation(KFW);
        RefreshItemComponents();
    }
}

function SetWeaponInformation(KFWeapon KFW)
{
    local int I;
    local array<STraderItem> PerksWeaponList;

    PerksWeaponList = TraderItems.GetWeaponListByPerk(KFW.AssociatedPerkClass);
    I = 0;
    J0x52:

    if(I < PerksWeaponList.Length)
    {
        if(KFW.Class.Name == PerksWeaponList[I].ClassName)
        {
            SetWeaponInfo(KFW, PerksWeaponList[I]);
            return;
        }
        ++ I;
        goto J0x52;
    }
    I = 0;
    J0x109:

    if(I < TraderItems.OffPerkItems.Length)
    {
        if(KFW.Class.Name == TraderItems.OffPerkItems[I].ClassName)
        {
            SetWeaponInfo(KFW, TraderItems.OffPerkItems[I]);
            return;
        }
        ++ I;
        goto J0x109;
    }
}

function SetWeaponInfo(out KFWeapon KFW, STraderItem DefaultItem)
{
    local SItemInformation WeaponInfo;

    WeaponInfo.SpareAmmoCount = KFW.SpareAmmoCount[0] + KFW.AmmoCount[0];
    WeaponInfo.MaxSpareAmmo = KFW.MaxSpareAmmo[0];
    WeaponInfo.MagazineCapacity = KFW.MagazineCapacity[0];
    WeaponInfo.SecondaryAmmoCount = KFW.AmmoCount[1];
    WeaponInfo.MaxSecondaryAmmoCount = KFW.MagazineCapacity[1];
    WeaponInfo.DefaultItem = DefaultItem;
    WeaponInfo.AmmoPricePerMagazine = DefaultItem.AmmoPricePerMagazine;
    WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor(DefaultItem, KFW);
    OwnedItemList.AddItem(WeaponInfo;
    if(DefaultItem.bUsesSecondaryAmmo)
    {
        WeaponInfo.bIsSecondaryAmmo = true;
        OwnedItemList.AddItem(WeaponInfo;
    }
}

function AddWeaponToOwnedItemList(STraderItem DefaultItem, optional bool bDoNotBuy)
{
    local SItemInformation WeaponInfo;
    local KFPerk CurrentPerk;
    local byte ListIndex, ItemIndex;
    local KFWeapon SingleWeapon;
    local int DefaultMagazineCapacity;
    local bool bShouldMagSizeModifySpareAmmo;

    CurrentPerk = MyKFPC.CurrentPerk;
    WeaponInfo.MagazineCapacity = DefaultItem.MagazineCapacity;
    DefaultMagazineCapacity = WeaponInfo.MagazineCapacity;
    CurrentPerk.ModifyMagSizeAndNumber(none, WeaponInfo.MagazineCapacity, DefaultItem.AssociatedPerkClass);
    bShouldMagSizeModifySpareAmmo = CurrentPerk.ShouldMagSizeModifySpareAmmo(none, DefaultItem.AssociatedPerkClass);
    WeaponInfo.MaxSpareAmmo = DefaultItem.MaxSpareAmmo + ((bShouldMagSizeModifySpareAmmo) ? WeaponInfo.MagazineCapacity : DefaultMagazineCapacity);
    CurrentPerk.ModifyMaxSpareAmmoAmount(none, WeaponInfo.MaxSpareAmmo, DefaultItem);
    WeaponInfo.SpareAmmoCount = DefaultItem.InitialSpareMags * DefaultItem.MagazineCapacity;
    CurrentPerk.ModifySpareAmmoAmount(none, WeaponInfo.SpareAmmoCount, DefaultItem);
    WeaponInfo.SpareAmmoCount += ((bShouldMagSizeModifySpareAmmo) ? WeaponInfo.MagazineCapacity : DefaultMagazineCapacity);
    CurrentPerk.MaximizeSpareAmmoAmount(DefaultItem.AssociatedPerkClass, WeaponInfo.SpareAmmoCount, DefaultItem.MaxSpareAmmo + DefaultItem.MagazineCapacity);
    WeaponInfo.SecondaryAmmoCount = DefaultItem.MaxSecondaryAmmoCount;
    CurrentPerk.ModifyMagSizeAndNumber(none, WeaponInfo.SecondaryAmmoCount, DefaultItem.AssociatedPerkClass);
    WeaponInfo.MaxSecondaryAmmoCount = DefaultItem.MaxSecondaryAmmoCount;
    CurrentPerk.ModifyMaxSpareAmmoAmount(none, WeaponInfo.MaxSecondaryAmmoCount, DefaultItem);
    WeaponInfo.AmmoPricePerMagazine = DefaultItem.AmmoPricePerMagazine;
    WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor(DefaultItem);
    WeaponInfo.DefaultItem = DefaultItem;
    AddItemByPriority(WeaponInfo);
    if(!bDoNotBuy)
    {
        TraderItems.GetItemIndicesFromArche(ListIndex, ItemIndex, DefaultItem.ClassName, DefaultItem.AssociatedPerkClass);
        MyKFIM.ServerBuyWeapon(ListIndex, ItemIndex);
    }
    if(DefaultItem.SingleClassName != 'None')
    {
        MyKFIM.GetWeaponFromClass(SingleWeapon, DefaultItem.SingleClassName);
        if(SingleWeapon != none)
        {
            MyKFIM.RemoveFromInventory(SingleWeapon);
        }
        RemoveWeaponFromOwnedItemList(,, DefaultItem.SingleClassName, true);
    }
}

function RemoveWeaponFromOwnedItemList(optional int OwnedListIdx, optional name ClassName, optional bool bDoNotSell)
{
    local SItemInformation ItemInfo;
    local byte ListIndex, ItemIndex;

    OwnedListIdx = -1;        
    if((OwnedListIdx == -1) && ClassName != 'None')
    {
        OwnedListIdx = 0;
        J0x42:

        if(OwnedListIdx < OwnedItemList.Length)
        {
            if(OwnedItemList[OwnedListIdx].DefaultItem.ClassName == ClassName)
            {
                goto J0xB2;
            }
            ++ OwnedListIdx;
            goto J0x42;
        }
    }
    J0xB2:

    if(OwnedListIdx >= OwnedItemList.Length)
    {
        return;
    }
    ItemInfo = OwnedItemList[OwnedListIdx];
    if(!bDoNotSell)
    {
        TraderItems.GetItemIndicesFromArche(ListIndex, ItemIndex, ItemInfo.DefaultItem.ClassName, ItemInfo.DefaultItem.AssociatedPerkClass);
        MyKFIM.ServerSellWeapon(ListIndex, ItemIndex);
    }
    if(OwnedItemList[OwnedListIdx].bIsSecondaryAmmo)
    {
        OwnedItemList.Remove(OwnedListIdx, 1;
        if((OwnedListIdx - 1) >= 0)
        {
            OwnedItemList.Remove(OwnedListIdx - 1, 1;
        }        
    }
    else
    {
        if(OwnedItemList[OwnedListIdx].DefaultItem.bUsesSecondaryAmmo)
        {
            if((OwnedListIdx + 1) < OwnedItemList.Length)
            {
                OwnedItemList.Remove(OwnedListIdx + 1, 1;
                OwnedItemList.Remove(OwnedListIdx, 1;
            }            
        }
        else
        {
            OwnedItemList.Remove(OwnedListIdx, 1;
        }
    }
    if(ItemInfo.DefaultItem.SingleClassName != 'None')
    {
        if(TraderItems.GetItemIndicesFromArche(ListIndex, ItemIndex, ItemInfo.DefaultItem.SingleClassName, ItemInfo.DefaultItem.AssociatedPerkClass))
        {
            if(ListIndex == 255)
            {
                AddWeaponToOwnedItemList(TraderItems.OffPerkItems[ItemIndex], MyKFIM.GetIsOwned(ItemInfo.DefaultItem.SingleClassName));                
            }
            else
            {
                AddWeaponToOwnedItemList(TraderItems.TraderItemList[ListIndex].ItemList[ItemIndex], MyKFIM.GetIsOwned(ItemInfo.DefaultItem.SingleClassName));
            }
        }
    }
}

function AddItemByPriority(out SItemInformation WeaponInfo)
{
    local byte I, WeaponGroup, WeaponPriority, BestIndex;

    BestIndex = 0;
    WeaponGroup = WeaponInfo.DefaultItem.InventoryGroup;
    WeaponPriority = byte(WeaponInfo.DefaultItem.GroupPriority);
    I = 0;
    J0x8C:

    if(I < OwnedItemList.Length)
    {
        if(WeaponGroup < OwnedItemList[I].DefaultItem.InventoryGroup)
        {
            BestIndex = I;
            goto J0x2B5;            
        }
        else
        {
            if(WeaponGroup == OwnedItemList[I].DefaultItem.InventoryGroup)
            {
                if(float(WeaponPriority) > OwnedItemList[I].DefaultItem.GroupPriority)
                {
                    BestIndex = I;
                    goto J0x2B5;                    
                }
                else
                {
                    if((float(WeaponPriority) == OwnedItemList[I].DefaultItem.GroupPriority) && MyKFPC.CurrentPerk.Class == WeaponInfo.DefaultItem.AssociatedPerkClass)
                    {
                        BestIndex = I;
                        goto J0x2B5;
                    }
                }                
            }
            else
            {
                BestIndex = byte(I + 1);
            }
        }
        ++ I;
        goto J0x8C;
    }
    J0x2B5:

    OwnedItemList.InsertItem(BestIndex, WeaponInfo;
    if(WeaponInfo.DefaultItem.bUsesSecondaryAmmo)
    {
        WeaponInfo.bIsSecondaryAmmo = true;
        OwnedItemList.InsertItem(BestIndex + 1, WeaponInfo;
    }
}

function SetTraderItemDetails(int ItemIndex)
{
    local STraderItem SelectedItem;
    local bool bCanAfford, bCanBuyItem, bCanCarry;

    SelectedList = 0;
    if((ItemDetails != none) && ShopContainer != none)
    {
        if((ShopWeaponList.Length >= 0) && ItemIndex < ShopWeaponList.Length)
        {
            SelectedItemIndex = byte(ItemIndex);
            SelectedItem = ShopWeaponList[ItemIndex];
            bCanAfford = ShopContainer.GetCanAfford(GetAdjustedBuyPriceFor(SelectedItem));
            bCanCarry = ShopContainer.CanCarry(SelectedItem.BlocksRequired);
            if(!bCanAfford || !bCanCarry)
            {
                bCanBuyItem = false;                
            }
            else
            {
                bCanBuyItem = true;
            }
            ItemDetails.SetShopItemDetails(SelectedItem, GetAdjustedBuyPriceFor(SelectedItem), bCanCarry, bCanBuyItem);
            bCanBuyOrSellItem = bCanBuyItem;            
        }
        else
        {
            ItemDetails.SetVisible(false);
        }
    }
}

function SetPlayerItemDetails(int ItemIndex)
{
    local STraderItem SelectedItem;

    SelectedList = 1;
    if((ItemDetails != none) && ItemIndex < OwnedItemList.Length)
    {
        bGenericItemSelected = false;
        SelectedItemIndex = byte(ItemIndex);
        SelectedItem = OwnedItemList[ItemIndex].DefaultItem;
        ItemDetails.SetPlayerItemDetails(SelectedItem, OwnedItemList[ItemIndex].SellPrice);
        bCanBuyOrSellItem = SelectedItem.bSellable;
    }
}

function SetGenericItemDetails(out STraderItem DefaultItemInfo, out SItemInformation ItemInfo)
{
    SelectedList = 1;
    if(ItemDetails != none)
    {
        LastItemInfo = ItemInfo;
        LastDefaultItemInfo = DefaultItemInfo;
        bGenericItemSelected = true;
        ItemDetails.SetPlayerItemDetails(DefaultItemInfo, ItemInfo.SellPrice);
        bCanBuyOrSellItem = DefaultItemInfo.bSellable;
    }
}

function SetNewSelectedIndex(int ListLength)
{
    if(SelectedItemIndex >= ListLength)
    {
        if(SelectedItemIndex != 0)
        {
            -- SelectedItemIndex;
        }
    }
}

function BoughtAmmo(int AmountPurchased, int Price, KFGFxMenu_Trader.EItemType ItemType, optional name ClassName, optional class<KFPerk> PerkClass, optional bool bIsSecondaryAmmo)
{
    local byte ListIndex, ItemIndex;

    AddDosh(-Price);
    if(ItemType == 0)
    {
        TraderItems.GetItemIndicesFromArche(ListIndex, ItemIndex, ClassName, PerkClass);
    }
    MyKFIM.BuyAmmo(AmountPurchased, ItemType, ListIndex, ItemIndex, bIsSecondaryAmmo);
}

function RefreshItemComponents()
{
    if((PlayerInventoryContainer != none) && PlayerInfoContainer != none)
    {
        PlayerInventoryContainer.RefreshPlayerInventory();
        RefreshShopItemList(CurrentTab, byte(CurrentFilterIndex));
        GameInfoContainer.UpdateGameInfo();
        GameInfoContainer.SetDosh(TotalDosh);
        GameInfoContainer.SetCurrentWeight(TotalBlocks, MaxBlocks);
        if(SelectedList == 0)
        {
            SetTraderItemDetails(SelectedItemIndex);            
        }
        else
        {
            if(bGenericItemSelected)
            {
                SetGenericItemDetails(LastDefaultItemInfo, LastItemInfo);                
            }
            else
            {
                SetPlayerItemDetails(SelectedItemIndex);
            }
        }
    }
}

function RefreshShopItemList(KFGFxMenu_Trader.TabIndices TabIndex, byte FilterIndex)
{
    if((ShopContainer != none) && FilterContainer != none)
    {
        switch(TabIndex)
        {
            case 0:
                ShopContainer.RefreshWeaponListByPerk(FilterIndex, ShopWeaponList);
                FilterContainer.SetPerkFilterData(FilterIndex);
                break;
            case 1:
                ShopContainer.RefreshItemsByType(FilterIndex, ShopWeaponList);
                FilterContainer.SetTypeFilterData(FilterIndex);
                break;
            case 2:
                ShopContainer.RefreshFavoriteItems(ShopWeaponList);
                FilterContainer.ClearFilters();
                break;
            case 3:
                ShopContainer.RefreshAllItems(ShopWeaponList);
                FilterContainer.ClearFilters();
                break;
            default:
                break;
        }
        FilterContainer.SetInt("selectedTab", TabIndex);
        FilterContainer.SetInt("selectedFilter", FilterIndex);
        if(SelectedList == 0)
        {
            if(SelectedItemIndex >= ShopWeaponList.Length)
            {
                SelectedItemIndex = byte(ShopWeaponList.Length - 1);
            }
            SetTraderItemDetails(SelectedItemIndex);
            ShopContainer.SetSelectedIndex(SelectedItemIndex);
        }
    }
}

function bool GetIsFavorite(name ClassName)
{
    local byte I;

    I = 0;
    J0x0C:

    if(I < FavoritedItems.Length)
    {
        if(ClassName == FavoritedItems[I])
        {
            return true;
        }
        ++ I;
        goto J0x0C;
    }
    return false;
}

function ToggleFavorite(name ClassName)
{
    local byte I;
    local bool bUnfavoriteItem;

    I = 0;
    J0x0C:

    if(I < FavoritedItems.Length)
    {
        if(ClassName == FavoritedItems[I])
        {
            FavoritedItems.Remove(I, 1;
            bUnfavoriteItem = true;
            goto J0x7D;
        }
        ++ I;
        goto J0x0C;
    }
    J0x7D:

    if(!bUnfavoriteItem)
    {
        FavoritedItems.AddItem(ClassName;
    }
    SaveConfig();
}

simulated function int GetAdjustedBuyPriceFor(const out STraderItem ShopItem)
{
    return MyKFIM.GetAdjustedBuyPriceFor(ShopItem, OwnedItemList);
}

function bool IsInOwnedItemList(name ItemName)
{
    local int I;
    local name OwnedItemClassName;

    I = 0;
    J0x0B:

    if(I < OwnedItemList.Length)
    {
        OwnedItemClassName = OwnedItemList[I].DefaultItem.ClassName;
        if(OwnedItemClassName == ItemName)
        {
            return true;
        }
        ++ I;
        goto J0x0B;
    }
    return false;
}

function Callback_BuyOrSellItem()
{
    local STraderItem ShopItem;
    local SItemInformation ItemInfo;
    local bool bCanAfford, bCanCarry;

    if(bCanBuyOrSellItem)
    {
        if(SelectedList == 0)
        {
            ShopItem = ShopWeaponList[SelectedItemIndex];
            AddDosh(-GetAdjustedBuyPriceFor(ShopItem));
            AddBlocks(ShopItem.BlocksRequired);
            AddWeaponToOwnedItemList(ShopItem);
            RefreshItemComponents();
            SetNewSelectedIndex(ShopWeaponList.Length);
            SetTraderItemDetails(SelectedItemIndex);
            ShopContainer.ActionScriptVoid("itemBought");            
        }
        else
        {
            ItemInfo = OwnedItemList[SelectedItemIndex];
            AddDosh(ItemInfo.SellPrice);
            AddBlocks(-ItemInfo.DefaultItem.BlocksRequired);
            RemoveWeaponFromOwnedItemList(SelectedItemIndex);
            RefreshItemComponents();
            SetNewSelectedIndex(OwnedItemList.Length);
            SetPlayerItemDetails(SelectedItemIndex);
            PlayerInventoryContainer.ActionScriptVoid("itemSold");
        }        
    }
    else
    {
        if(SelectedList == 0)
        {
            ShopItem = ShopWeaponList[SelectedItemIndex];
            bCanAfford = ShopContainer.GetCanAfford(GetAdjustedBuyPriceFor(ShopItem));
            bCanCarry = ShopContainer.CanCarry(ShopItem.BlocksRequired);
            MyKFPC.PlayTraderSelectItemDialog(!bCanAfford, !bCanCarry);
        }
    }
}

function Callback_FavoriteItem()
{
    if(SelectedList == 0)
    {
        ToggleFavorite(ShopWeaponList[SelectedItemIndex].ClassName);
        if(CurrentTab == 2)
        {
            RefreshItemComponents();
            SetNewSelectedIndex(ShopWeaponList.Length);
        }
        SetTraderItemDetails(SelectedItemIndex);        
    }
    else
    {
        ToggleFavorite(OwnedItemList[SelectedItemIndex].DefaultItem.ClassName);
        SetPlayerItemDetails(SelectedItemIndex);
    }
}

function Callback_FilterChanged(int FilterIndex)
{
    CurrentFilterIndex = FilterIndex;
    RefreshShopItemList(CurrentTab, byte(CurrentFilterIndex));
}

function Callback_TabChanged(int TabIndex)
{
    CurrentFilterIndex = 0;
    CurrentTab = byte(TabIndex);
    RefreshShopItemList(CurrentTab, byte(CurrentFilterIndex));
}

function Callback_BuyGrenade()
{
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.BuyGrenade(GrenadeItem);
        RefreshItemComponents();
    }
}

function Callback_FillGrenades()
{
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.FillAmmo(GrenadeItem, true);
        RefreshItemComponents();
    }
}

function Callback_FillArmor()
{
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.FillArmor(ArmorItem);
        RefreshItemComponents();
    }
}

function Callback_FillAmmo(int ItemIndex)
{
    local SItemInformation ItemInfo;

    if(PlayerInventoryContainer != none)
    {
        ItemInfo = OwnedItemList[ItemIndex];
        PlayerInventoryContainer.FillAmmo(ItemInfo);
        OwnedItemList[ItemIndex] = ItemInfo;
        RefreshItemComponents();
    }
}

function Callback_BuyMagazine(int ItemIndex)
{
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.BuyMagazine(ItemIndex);
        RefreshItemComponents();
    }
}

function Callback_AutoFill(int ItemIndex)
{
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.StartAutoFill();
    }
}

function Callback_ShopItemSelected(int ItemIndex)
{
    SetTraderItemDetails(ItemIndex);
}

function Callback_PlayerItemSelected(int ItemIndex)
{
    SetPlayerItemDetails(ItemIndex);
}

function Callback_ArmorItemSelected()
{
    SetGenericItemDetails(TraderItems.ArmorItem, ArmorItem);
}

function Callback_GrenadeItemSelected()
{
    SetGenericItemDetails(GrenadeItem.DefaultItem, GrenadeItem);
}

function Callback_PerkChanged(int PerkIndex)
{
    MyKFPC.RequestPerkChange(byte(PerkIndex));
    MyKFPC.SetHaveUpdatePerk(true);
    if(PlayerInventoryContainer != none)
    {
        PlayerInventoryContainer.UpdateLock();
    }
    UpdatePlayerInfo();
    RefreshItemComponents();
}

function Callback_Close()
{
    Manager.CloseMenus();
}

defaultproperties
{
    GrenadeItem=(bIsSecondaryAmmo=false,SpareAmmoCount=0,MaxSpareAmmo=0,MagazineCapacity=0,SecondaryAmmoCount=0,MaxSecondaryAmmoCount=0,SellPrice=0,AutoFillDosh=0,AmmoPricePerMagazine=0,DefaultItem=(bHasNoClass=false,bSellable=true,bUsesAmmo=false,bUsesSecondaryAmmo=false,PathName=None,SingleClassPathName=None,ItemClass=none,BuyPrice=0,AmmoPricePerMagazine=0,SecondaryAmmoMagSize=0,SecondaryAmmoMagPrice=0,TextureLocation="",SecondaryAmmoTexturePath="",bHideStats=false,ClassName=None,SingleClassName=None,DualClassName=None,FilterType=0,AssociatedPerkClass=none,PerkIconString="",MagazineCapacity=0,InitialSpareMags=0,MaxSpareAmmo=0,MaxSecondaryAmmoCount=0,BlocksRequired=0,InventoryGroup=0,GroupPriority=0,Power=0,FireRate=0,Penetration=0,Accuracy=0,WeaponStats=none,SharedUnlockId=ESharedContentUnlock.SCU_None))
    ArmorItem=(bIsSecondaryAmmo=false,SpareAmmoCount=0,MaxSpareAmmo=0,MagazineCapacity=0,SecondaryAmmoCount=0,MaxSecondaryAmmoCount=0,SellPrice=0,AutoFillDosh=0,AmmoPricePerMagazine=0,DefaultItem=(bHasNoClass=false,bSellable=true,bUsesAmmo=false,bUsesSecondaryAmmo=false,PathName=None,SingleClassPathName=None,ItemClass=none,BuyPrice=0,AmmoPricePerMagazine=0,SecondaryAmmoMagSize=0,SecondaryAmmoMagPrice=0,TextureLocation="",SecondaryAmmoTexturePath="",bHideStats=false,ClassName=None,SingleClassName=None,DualClassName=None,FilterType=0,AssociatedPerkClass=none,PerkIconString="",MagazineCapacity=0,InitialSpareMags=0,MaxSpareAmmo=0,MaxSecondaryAmmoCount=0,BlocksRequired=0,InventoryGroup=0,GroupPriority=0,Power=0,FireRate=0,Penetration=0,Accuracy=0,WeaponStats=none,SharedUnlockId=ESharedContentUnlock.SCU_None))
    LastDefaultItemInfo=(bHasNoClass=false,bSellable=true,bUsesAmmo=false,bUsesSecondaryAmmo=false,PathName=None,SingleClassPathName=None,ItemClass=none,BuyPrice=0,AmmoPricePerMagazine=0,SecondaryAmmoMagSize=0,SecondaryAmmoMagPrice=0,TextureLocation="",SecondaryAmmoTexturePath="",bHideStats=false,ClassName=None,SingleClassName=None,DualClassName=None,FilterType=0,AssociatedPerkClass=none,PerkIconString="",MagazineCapacity=0,InitialSpareMags=0,MaxSpareAmmo=0,MaxSecondaryAmmoCount=0,BlocksRequired=0,InventoryGroup=0,GroupPriority=0,Power=0,FireRate=0,Penetration=0,Accuracy=0,WeaponStats=none,SharedUnlockId=ESharedContentUnlock.SCU_None)
    LastItemInfo=(bIsSecondaryAmmo=false,SpareAmmoCount=0,MaxSpareAmmo=0,MagazineCapacity=0,SecondaryAmmoCount=0,MaxSecondaryAmmoCount=0,SellPrice=0,AutoFillDosh=0,AmmoPricePerMagazine=0,DefaultItem=(bHasNoClass=false,bSellable=true,bUsesAmmo=false,bUsesSecondaryAmmo=false,PathName=None,SingleClassPathName=None,ItemClass=none,BuyPrice=0,AmmoPricePerMagazine=0,SecondaryAmmoMagSize=0,SecondaryAmmoMagPrice=0,TextureLocation="",SecondaryAmmoTexturePath="",bHideStats=false,ClassName=None,SingleClassName=None,DualClassName=None,FilterType=0,AssociatedPerkClass=none,PerkIconString="",MagazineCapacity=0,InitialSpareMags=0,MaxSpareAmmo=0,MaxSecondaryAmmoCount=0,BlocksRequired=0,InventoryGroup=0,GroupPriority=0,Power=0,FireRate=0,Penetration=0,Accuracy=0,WeaponStats=none,SharedUnlockId=ESharedContentUnlock.SCU_None))
    ExitMenuString="EXIT MENU"
    SubWidgetBindings=/* Array type was not detected. */
}