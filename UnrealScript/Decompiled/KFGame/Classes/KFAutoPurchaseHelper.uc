/*******************************************************************************
 * KFAutoPurchaseHelper generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAutoPurchaseHelper extends Object within KFPlayerController
    native(UI);

var KFPlayerReplicationInfo MyKFPRI;
var KFInventoryManager MyKFIM;
var KFGFxObject_TraderItems TraderItems;
var array<SItemInformation> OwnedItemList;
var SItemInformation GrenadeItem;
var SItemInformation ArmorItem;
var int TotalDosh;
var bool bPendingDoshUpdate;
var int TotalBlocks;
var byte MaxBlocks;
var int PrevArmor;
var int CostPerAutofillCycle;
var int DoshBuffer;

function Initialize()
{
    if((Outer.Pawn != none) && Outer.PlayerReplicationInfo != none)
    {
        MyKFPRI = KFPlayerReplicationInfo(Outer.PlayerReplicationInfo);
        MyKFIM = KFInventoryManager(Outer.Pawn.InvManager);
        if((MyKFPRI != none) && MyKFIM != none)
        {
            InitializeOwnedItemList();
            TotalBlocks = MyKFIM.CurrentCarryBlocks;
            TotalDosh = int(MyKFPRI.Score);
            MaxBlocks = MyKFIM.MaxCarryBlocks;
        }
    }
}

function DoAutoPurchase()
{
    local int PotentialDosh, I;
    local array<STraderItem> OnPerkWeapons;
    local STraderItem TopTierWeapon;
    local int ItemIndex;
    local bool bSecondaryWeaponPurchased, bUpgradeSuccess, bAutoFillPurchasedItem;
    local string AutoFillMessageString;

    GetTraderItems();
    if(Outer.CurrentPerk.AutoBuyLoadOutPath.Length == 0)
    {
        LogInternal("!!!Autobuy load out path not set!!!");
        return;
    }
    I = 0;
    J0x79:

    if(I < Outer.CurrentPerk.AutoBuyLoadOutPath.Length)
    {
        ItemIndex = TraderItems.SaleItems.Find('WeaponDef', Outer.CurrentPerk.AutoBuyLoadOutPath[I];
        if(ItemIndex != -1)
        {
            OnPerkWeapons.AddItem(TraderItems.SaleItems[ItemIndex];
        }
        ++ I;
        goto J0x79;
    }
    SellOffPerkWeapons();
    TopTierWeapon = GetTopTierWeapon(OnPerkWeapons);
    if((!DoIOwnThisWeapon(TopTierWeapon) && GetCanAfford((GetAdjustedBuyPriceFor(TopTierWeapon)) + DoshBuffer)) && CanCarry(TopTierWeapon))
    {
        bUpgradeSuccess = AttemptUpgrade(TotalDosh, OnPerkWeapons, true);        
    }
    else
    {
        PotentialDosh = GetPotentialDosh();
        bUpgradeSuccess = AttemptUpgrade(PotentialDosh + TotalDosh, OnPerkWeapons);
    }
    bAutoFillPurchasedItem = StartAutoFill();
    if(DoIOwnThisWeapon(TopTierWeapon))
    {
        J0x2A4:

        if(AttemptToPurchaseNextLowerTier(TotalDosh, OnPerkWeapons))
        {
            bSecondaryWeaponPurchased = true;
            AttemptToPurchaseNextLowerTier(TotalDosh, OnPerkWeapons);
            goto J0x2A4;
        }
    }
    MyKFIM.ServerCloseTraderMenu();
    if(bUpgradeSuccess)
    {
        AutoFillMessageString = Class'KFCommon_LocalizedStrings'.default.WeaponUpgradeComepleteString;        
    }
    else
    {
        if(bSecondaryWeaponPurchased)
        {
            AutoFillMessageString = Class'KFCommon_LocalizedStrings'.default.SecondaryWeaponPurchasedString;            
        }
        else
        {
            if(bAutoFillPurchasedItem)
            {
                AutoFillMessageString = Class'KFCommon_LocalizedStrings'.default.AutoFillCompleteString;                
            }
            else
            {
                AutoFillMessageString = Class'KFCommon_LocalizedStrings'.default.NoItemsPurchasedString;
            }
        }
    }
    if(Outer.MyGFxHUD != none)
    {
        Outer.MyGFxHUD.ShowNonCriticalMessage(Class'KFCommon_LocalizedStrings'.default.AutoTradeCompleteString $ AutoFillMessageString);
    }
}

function bool AttemptToPurchaseNextLowerTier(int UseableDosh, const out array<STraderItem> OnPerkWeapons)
{
    local int LastAfforableItemIndex;
    local STraderItem TempTraderItem;

    LastAfforableItemIndex = GetLastAffordableItemIndex(UseableDosh, OnPerkWeapons);
    if(LastAfforableItemIndex != -1)
    {
        TempTraderItem = OnPerkWeapons[LastAfforableItemIndex];
        PurchaseWeapon(TempTraderItem);
        StartAutoFill();
        return true;
    }
    return false;
}

function STraderItem GetTopTierWeapon(const out array<STraderItem> OnPerkWeapons)
{
    local STraderItem HighestValuedWeapon;

    HighestValuedWeapon = GetHighValuedOnPerkWeapon(OnPerkWeapons);
    return HighestValuedWeapon;
}

function bool AttemptUpgrade(int UseableDosh, const out array<STraderItem> OnPerkWeapons, optional bool bHaveTopTier)
{
    local STraderItem TempTraderItem;
    local bool bUpgradeSuccess;
    local int LastAfforableItemIndex;
    local SItemInformation MyHighestValuedWeapon;

    MyHighestValuedWeapon = GetHighValuedWeapon(OwnedItemList);
    LastAfforableItemIndex = GetLastAffordableItemIndex(UseableDosh, OnPerkWeapons, MyHighestValuedWeapon);
    if(LastAfforableItemIndex != -1)
    {
        TempTraderItem = OnPerkWeapons[LastAfforableItemIndex];
        if(MyHighestValuedWeapon.DefaultItem.WeaponDef.default.BuyPrice < TempTraderItem.WeaponDef.default.BuyPrice)
        {
            if(!bHaveTopTier)
            {
                SellOnPerkWeapons();
            }
            PurchaseWeapon(TempTraderItem);
            bUpgradeSuccess = true;
        }
    }
    return bUpgradeSuccess;
}

function int GetLastAffordableItemIndex(int UseableDosh, const out array<STraderItem> OnPerkWeapons, optional SItemInformation TradeInItem)
{
    local int LastAfforableItemIndex, I;
    local STraderItem TempTraderItem;
    local int TradeInItemWeight;

    TradeInItemWeight = MyKFIM.GetDisplayedBlocksRequiredFor(TradeInItem.DefaultItem);
    LastAfforableItemIndex = -1;
    I = 0;
    J0x60:

    if(I < OnPerkWeapons.Length)
    {
        TempTraderItem = OnPerkWeapons[I];
        if(UseableDosh > ((GetAdjustedBuyPriceFor(TempTraderItem)) + DoshBuffer))
        {
            if((!DoIOwnThisWeapon(TempTraderItem) && !((TotalBlocks - TradeInItemWeight) + MyKFIM.GetDisplayedBlocksRequiredFor(TempTraderItem)) > MaxBlocks) && !IsInOwnedItemList(TempTraderItem.DualClassName))
            {
                LastAfforableItemIndex = I;
            }            
        }
        else
        {
            goto J0x17F;
        }
        ++ I;
        goto J0x60;
    }
    J0x17F:

    return LastAfforableItemIndex;
}

function STraderItem GetHighValuedOnPerkWeapon(const out array<STraderItem> ItemList)
{
    local STraderItem HighestValuedWeapon;
    local int I;

    I = 0;
    J0x0B:

    if(I < ItemList.Length)
    {
        if((HighestValuedWeapon.WeaponDef == none) || ItemList[I].WeaponDef.default.BuyPrice > HighestValuedWeapon.WeaponDef.default.BuyPrice)
        {
            HighestValuedWeapon = ItemList[I];
        }
        ++ I;
        goto J0x0B;
    }
    return HighestValuedWeapon;
}

function SItemInformation GetHighValuedWeapon(const out array<SItemInformation> ItemList)
{
    local SItemInformation HighestValuedWeapon;
    local int I;

    I = 0;
    J0x0B:

    if(I < ItemList.Length)
    {
        if(ItemList[I].DefaultItem.BlocksRequired == 255)
        {            
        }
        else
        {
            if((HighestValuedWeapon.DefaultItem.WeaponDef == none) || ItemList[I].DefaultItem.WeaponDef.default.BuyPrice > HighestValuedWeapon.DefaultItem.WeaponDef.default.BuyPrice)
            {
                HighestValuedWeapon = ItemList[I];
            }
        }
        ++ I;
        goto J0x0B;
    }
    return HighestValuedWeapon;
}

function SellOnPerkWeapons()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < OwnedItemList.Length)
    {
        if(((OwnedItemList[I].DefaultItem.AssociatedPerkClasses.Length > 0) && OwnedItemList[I].DefaultItem.AssociatedPerkClasses[0] == Outer.CurrentPerk.Class) && OwnedItemList[I].DefaultItem.BlocksRequired != 255)
        {
            SellWeapon(OwnedItemList[I], I);
            I = -1;
        }
        ++ I;
        goto J0x0B;
    }
}

function SellOffPerkWeapons()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < OwnedItemList.Length)
    {
        if(((OwnedItemList[I].DefaultItem.AssociatedPerkClasses[0] != Outer.CurrentPerk.Class) && OwnedItemList[I].DefaultItem.BlocksRequired != 255) && OwnedItemList[I].SellPrice != 0)
        {
            if(Outer.CurrentPerk.AutoBuyLoadOutPath.Find(OwnedItemList[I].DefaultItem.WeaponDef == -1)
            {
                SellWeapon(OwnedItemList[I], I);
                I = -1;
            }
        }
        ++ I;
        goto J0x0B;
    }
}

function bool DoIOwnThisWeapon(const out STraderItem TraderItem)
{
    return OwnedItemList.Find('DefaultItem', TraderItem != -1;
}

function int GetPotentialDosh()
{
    local int PotentialDosh, I;

    I = 0;
    J0x0B:

    if(I < OwnedItemList.Length)
    {
        if(OwnedItemList[I].SellPrice != 0)
        {
            PotentialDosh += OwnedItemList[I].SellPrice;
        }
        ++ I;
        goto J0x0B;
    }
    return PotentialDosh;
}

function bool bCanPurchase(STraderItem SelectedItem)
{
    local bool bCanAfford, bCanCarry;

    bCanAfford = GetCanAfford(GetAdjustedBuyPriceFor(SelectedItem));
    bCanCarry = CanCarry(SelectedItem);
    return bCanCarry && bCanAfford;
}

function bool GetCanAfford(int BuyPrice)
{
    if(BuyPrice > TotalDosh)
    {
        return false;
    }
    return true;
}

function bool CanCarry(const out STraderItem Item)
{
    if((TotalBlocks + MyKFIM.GetDisplayedBlocksRequiredFor(Item)) > MaxBlocks)
    {
        return false;
    }
    return true;
}

function PurchaseWeapon(STraderItem ShopItem)
{
    if(!bCanPurchase(ShopItem))
    {
        return;
    }
    AddDosh(-GetAdjustedBuyPriceFor(ShopItem));
    AddBlocks(ShopItem.BlocksRequired);
    AddWeaponToOwnedItemList(ShopItem);
}

function SellWeapon(SItemInformation ItemInfo, optional int SelectedItemIndex)
{
    SelectedItemIndex = -1;
    AddDosh(ItemInfo.SellPrice);
    AddBlocks(-ItemInfo.DefaultItem.BlocksRequired);
    if(SelectedItemIndex != -1)
    {
        RemoveWeaponFromOwnedItemList(SelectedItemIndex);
    }
}

function int GetFillArmorCost()
{
    local float ArmorPercentage, FillCost, ArmorPricePerPercent;

    ArmorPercentage = (float(ArmorItem.MaxSpareAmmo - ArmorItem.SpareAmmoCount) / float(ArmorItem.MaxSpareAmmo)) * 100;
    ArmorPricePerPercent = float(ArmorItem.AmmoPricePerMagazine);
    FillCost = float(FCeil(ArmorPercentage * ArmorPricePerPercent));
    return int(FillCost);
}

function int FillArmor()
{
    local float ArmorPricePerPercent, FillCost, PercentBoughtUnit, PercentArmorBought;
    local int ActualArmorPointsAvailable;

    FillCost = float(GetFillArmorCost());
    ActualArmorPointsAvailable = ArmorItem.MaxSpareAmmo - ArmorItem.SpareAmmoCount;
    PercentBoughtUnit = float(ActualArmorPointsAvailable) / float(ArmorItem.MaxSpareAmmo);
    PercentArmorBought = PercentBoughtUnit * 100;
    if(FillCost > float(TotalDosh))
    {
        ArmorPricePerPercent = float(ArmorItem.AmmoPricePerMagazine);
        PercentArmorBought = float(TotalDosh) / ArmorPricePerPercent;
        PercentBoughtUnit = PercentArmorBought / 100;
        FillCost = ArmorPricePerPercent * PercentArmorBought;
    }
    PercentArmorBought = (((PercentArmorBought > 0) && PercentArmorBought < 1) ? 1 : PercentArmorBought);
    ArmorItem.SpareAmmoCount = int(FMin(float(ArmorItem.SpareAmmoCount) + (PercentBoughtUnit * float(ArmorItem.MaxSpareAmmo)), float(ArmorItem.MaxSpareAmmo)));
    BoughtAmmo(int(PercentArmorBought), int(FillCost), 1);
    return int(FillCost);
}

function bool AttemptBuyArmorChunk(out int InAutoFillDosh)
{
    local float ArmorPricePerPercent, ChunkCost;
    local int PercentArmorBought;

    ArmorPricePerPercent = float(ArmorItem.AmmoPricePerMagazine);
    PercentArmorBought = 0;
    if(ArmorItem.SpareAmmoCount < ArmorItem.MaxSpareAmmo)
    {
        PercentArmorBought = int(float(CostPerAutofillCycle) / ArmorPricePerPercent);
        ChunkCost = ArmorPricePerPercent * float(PercentArmorBought);
        if(float(InAutoFillDosh) < ChunkCost)
        {
            PercentArmorBought = int(float(InAutoFillDosh) / ArmorPricePerPercent);
            ChunkCost = ArmorPricePerPercent * float(PercentArmorBought);
        }
        InAutoFillDosh -= int(ChunkCost);
        ArmorItem.SpareAmmoCount = int(FMin(float(ArmorItem.SpareAmmoCount + PercentArmorBought), float(ArmorItem.MaxSpareAmmo)));
        BoughtAmmo(PercentArmorBought, int(ChunkCost), 1);
    }
    return PercentArmorBought > 0;
}

function int GetFillGrenadeCost()
{
    local int AmmoCount, MaxAmmoCount;
    local float MissingAmmo, PricePerMag;

    AmmoCount = GrenadeItem.SpareAmmoCount;
    MaxAmmoCount = GrenadeItem.MaxSpareAmmo;
    PricePerMag = float(GrenadeItem.AmmoPricePerMagazine);
    MissingAmmo = float(MaxAmmoCount - AmmoCount);
    return FCeil(MissingAmmo * PricePerMag);
}

function int BuyGrenade()
{
    local int MagAmmoCost;

    MagAmmoCost = 0;
    if((GrenadeItem.MaxSpareAmmo - GrenadeItem.SpareAmmoCount) > 0)
    {
        MagAmmoCost = GrenadeItem.AmmoPricePerMagazine;
        GrenadeItem.SpareAmmoCount += 1;
        BoughtAmmo(1, MagAmmoCost, 3);
    }
    return MagAmmoCost;
}

function int BuySecondaryAmmoMag(out SItemInformation ItemInfo)
{
    local int MagAmmoCost, MagSpaceAvailable, AddedAmmo;

    MagAmmoCost = 0;
    MagSpaceAvailable = ItemInfo.MaxSecondaryAmmo - ItemInfo.SecondaryAmmoCount;
    if(MagSpaceAvailable > 0)
    {
        MagAmmoCost = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
        if((MagSpaceAvailable < ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize) || TotalDosh < MagAmmoCost)
        {
            return int(FillAmmo(ItemInfo));
        }
        AddedAmmo = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize;
        ItemInfo.SecondaryAmmoCount += AddedAmmo;
        ItemInfo.SecondaryAmmoCount = Min(ItemInfo.MaxSecondaryAmmo, ItemInfo.SecondaryAmmoCount);
        BoughtAmmo(AddedAmmo, MagAmmoCost, 0, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }
    return MagAmmoCost;
}

function int BuyMagazine(int ItemSlotIndex)
{
    local SItemInformation ItemInfo;
    local int MagCost;

    ItemInfo = OwnedItemList[ItemSlotIndex];
    if(ItemInfo.bIsSecondaryAmmo)
    {
        MagCost = BuySecondaryAmmoMag(ItemInfo);        
    }
    else
    {
        MagCost = BuyItemMagazine(ItemInfo);
    }
    OwnedItemList[ItemSlotIndex] = ItemInfo;
    return MagCost;
}

function int BuyItemMagazine(out SItemInformation ItemInfo)
{
    local int MagAmmoCost, MagSpaceAvailable;

    MagAmmoCost = 0;
    MagSpaceAvailable = ItemInfo.MaxSpareAmmo - ItemInfo.SpareAmmoCount;
    if(MagSpaceAvailable > 0)
    {
        MagAmmoCost = ItemInfo.AmmoPricePerMagazine;
        if((MagSpaceAvailable < ItemInfo.DefaultItem.MagazineCapacity) || TotalDosh < MagAmmoCost)
        {
            return int(FillAmmo(ItemInfo));
        }
        ItemInfo.SpareAmmoCount += ItemInfo.DefaultItem.MagazineCapacity;
        ItemInfo.SpareAmmoCount = Min(ItemInfo.MaxSpareAmmo, ItemInfo.SpareAmmoCount);
        BoughtAmmo(ItemInfo.DefaultItem.MagazineCapacity, MagAmmoCost, 0, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }
    return MagAmmoCost;
}

function float FillAmmo(out SItemInformation ItemInfo, optional bool bIsGrenade)
{
    local float MissingAmmo, MagSize, FillAmmoCost, PricePerMag, PricePerRound;

    if(ItemInfo.bIsSecondaryAmmo)
    {
        MagSize = float(ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize);
        PricePerMag = float(ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice);
        MissingAmmo = float(ItemInfo.MaxSecondaryAmmo - ItemInfo.SecondaryAmmoCount);
        FillAmmoCost = float(GetFillAmmoCost(ItemInfo));        
    }
    else
    {
        MagSize = float(ItemInfo.DefaultItem.MagazineCapacity);
        PricePerMag = float(ItemInfo.AmmoPricePerMagazine);
        MissingAmmo = float(ItemInfo.MaxSpareAmmo - ItemInfo.SpareAmmoCount);
        FillAmmoCost = float(((bIsGrenade) ? GetFillGrenadeCost() : GetFillAmmoCost(ItemInfo)));
    }
    if(FillAmmoCost > float(TotalDosh))
    {
        PricePerRound = ((bIsGrenade) ? PricePerMag : PricePerMag / MagSize);
        MissingAmmo = float(FFloor(float(TotalDosh) / PricePerRound));
        FillAmmoCost = float(FCeil(MissingAmmo * PricePerRound));
    }
    if(ItemInfo.bIsSecondaryAmmo)
    {
        ItemInfo.SecondaryAmmoCount += int(MissingAmmo);        
    }
    else
    {
        ItemInfo.SpareAmmoCount += int(MissingAmmo);
    }
    if(bIsGrenade)
    {
        BoughtAmmo(int(MissingAmmo), int(FillAmmoCost), 3);        
    }
    else
    {
        BoughtAmmo(int(MissingAmmo), int(FillAmmoCost), 0, ItemInfo.DefaultItem.ClassName, ItemInfo.bIsSecondaryAmmo);
    }
    return FillAmmoCost;
}

function int GetFillAmmoCost(out SItemInformation ItemInfo)
{
    local int AmmoCount, MaxAmmoCount;
    local float MissingAmmo, PricePerMag, MagSize, PricePerRound;

    if(ItemInfo.bIsSecondaryAmmo)
    {
        AmmoCount = ItemInfo.SecondaryAmmoCount;
        MaxAmmoCount = ItemInfo.MaxSecondaryAmmo;
        PricePerMag = float(ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice);
        MagSize = float(ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagSize);        
    }
    else
    {
        AmmoCount = ItemInfo.SpareAmmoCount;
        MaxAmmoCount = ItemInfo.MaxSpareAmmo;
        PricePerMag = float(ItemInfo.AmmoPricePerMagazine);
        MagSize = float(ItemInfo.DefaultItem.MagazineCapacity);
    }
    if(MagSize <= float(0))
    {
        return 0;
    }
    MissingAmmo = float(MaxAmmoCount - AmmoCount);
    PricePerRound = PricePerMag / MagSize;
    return FCeil(MissingAmmo * PricePerRound);
}

function bool AttemptAutoFillOnItem(out SItemInformation ItemInfo, out int InAutoFillDosh, int Price)
{
    local int DoshSpent;

    DoshSpent = Min(InAutoFillDosh, CostPerAutofillCycle);
    InAutoFillDosh -= DoshSpent;
    ItemInfo.AutoFillDosh += DoshSpent;
    return ItemInfo.AutoFillDosh >= Price;
}

function RePoolAutoFillDosh(out int AutoFillDosh)
{
    local byte I;

    I = 0;
    J0x0C:

    if(I < OwnedItemList.Length)
    {
        AutoFillDosh += OwnedItemList[I].AutoFillDosh;
        OwnedItemList[I].AutoFillDosh = 0;
        ++ I;
        goto J0x0C;
    }
    AutoFillDosh += ArmorItem.AutoFillDosh;
    ArmorItem.AutoFillDosh = 0;
    AutoFillDosh += GrenadeItem.AutoFillDosh;
    GrenadeItem.AutoFillDosh = 0;
}

function ClearAutoFillDosh()
{
    local byte I;

    I = 0;
    J0x0C:

    if(I < OwnedItemList.Length)
    {
        OwnedItemList[I].AutoFillDosh = 0;
        ++ I;
        goto J0x0C;
    }
    ArmorItem.AutoFillDosh = 0;
    GrenadeItem.AutoFillDosh = 0;
}

function bool AutoFillOwnedItems(out int AutoFillDosh, bool bLastCycle)
{
    local int I, PricePerMag, AmmoCount, MaxAmmoCount;
    local SItemInformation ItemInfo;

    I = 0;
    J0x0B:

    if(I < OwnedItemList.Length)
    {
        ItemInfo = OwnedItemList[I];
        if(ItemInfo.bIsSecondaryAmmo)
        {
            PricePerMag = ItemInfo.DefaultItem.WeaponDef.default.SecondaryAmmoMagPrice;
            AmmoCount = ItemInfo.SecondaryAmmoCount;
            MaxAmmoCount = ItemInfo.MaxSecondaryAmmo;            
        }
        else
        {
            PricePerMag = ItemInfo.AmmoPricePerMagazine;
            AmmoCount = ItemInfo.SpareAmmoCount;
            MaxAmmoCount = ItemInfo.MaxSpareAmmo;
        }
        if(AmmoCount < MaxAmmoCount)
        {
            if(bLastCycle)
            {
                AutoFillDosh -= int(FillAmmo(ItemInfo));                
            }
            else
            {
                if(AttemptAutoFillOnItem(ItemInfo, AutoFillDosh, PricePerMag))
                {
                    ItemInfo.AutoFillDosh -= (BuyMagazine(I));
                    OwnedItemList[I].AutoFillDosh = ItemInfo.AutoFillDosh;
                    return true;
                }
            }
            OwnedItemList[I] = ItemInfo;
        }
        ++ I;
        goto J0x0B;
    }
    return false;
}

function bool StartAutoFill()
{
    local int AutoFillDosh;
    local bool bBoughtSomething, bLastCycle, bAutoFillPurchasedItem;

    bLastCycle = false;
    AutoFillDosh = TotalDosh;
    J0x1F:

    if(true)
    {
        bBoughtSomething = AutoFillOwnedItems(AutoFillDosh, bLastCycle);
        if(ArmorItem.SpareAmmoCount < ArmorItem.MaxSpareAmmo)
        {
            if(bLastCycle)
            {
                AutoFillDosh -= (FillArmor());                
            }
            else
            {
                if(AttemptBuyArmorChunk(AutoFillDosh))
                {
                    bBoughtSomething = true;
                }
            }
        }
        if(GrenadeItem.SpareAmmoCount < GrenadeItem.MaxSpareAmmo)
        {
            if(bLastCycle)
            {
                AutoFillDosh -= int(FillAmmo(GrenadeItem, true));                
            }
            else
            {
                if(AttemptAutoFillOnItem(GrenadeItem, AutoFillDosh, GrenadeItem.AmmoPricePerMagazine))
                {
                    GrenadeItem.AutoFillDosh -= (BuyGrenade());
                    bBoughtSomething = true;
                }
            }
        }
        if(bLastCycle)
        {
            goto J0x22F;            
        }
        else
        {
            if(!bBoughtSomething)
            {
                if(!bLastCycle)
                {
                    RePoolAutoFillDosh(AutoFillDosh);
                    bLastCycle = true;
                }
            }
        }
        if(!bAutoFillPurchasedItem)
        {
            bAutoFillPurchasedItem = bBoughtSomething;
        }
        bBoughtSomething = false;
        goto J0x1F;
    }
    J0x22F:

    ClearAutoFillDosh();
    return bAutoFillPurchasedItem;
}

function int GetAutoFillCost()
{
    local byte SlotIndex;
    local int FillAmmoCost, AutoFillCost;
    local SItemInformation ItemInfo;

    AutoFillCost += (GetFillArmorCost());
    AutoFillCost += (GetFillGrenadeCost());
    SlotIndex = 0;
    J0x36:

    if(SlotIndex < OwnedItemList.Length)
    {
        ItemInfo = OwnedItemList[SlotIndex];
        FillAmmoCost = GetFillAmmoCost(ItemInfo);
        AutoFillCost += FillAmmoCost;
        ++ SlotIndex;
        goto J0x36;
    }
    return AutoFillCost;
}

function InitializeOwnedItemList()
{
    local Inventory Inv;
    local KFWeapon KFW;
    local KFPawn_Human KFP;

    OwnedItemList.Length = 0;
    TraderItems = KFGameReplicationInfo(Outer.WorldInfo.GRI).TraderItems;
    KFP = KFPawn_Human(Outer.Pawn);
    if(KFP != none)
    {
        ArmorItem.SpareAmmoCount = KFP.Armor;
        ArmorItem.MaxSpareAmmo = KFP.GetMaxArmor();
        ArmorItem.AmmoPricePerMagazine = int(float(TraderItems.ArmorPrice) * Outer.CurrentPerk.GetArmorDiscountMod());
        ArmorItem.DefaultItem.WeaponDef = TraderItems.ArmorDef;
        GrenadeItem.SpareAmmoCount = MyKFIM.GrenadeCount;
        GrenadeItem.MaxSpareAmmo = KFP.GetPerk().MaxGrenadeCount;
        GrenadeItem.AmmoPricePerMagazine = TraderItems.GrenadePrice;
        GrenadeItem.DefaultItem.WeaponDef = Outer.CurrentPerk.GetGrenadeWeaponDef();
        GrenadeItem.DefaultItem.AssociatedPerkClasses[0] = Outer.CurrentPerk.Class;
        Inv = MyKFIM.InventoryChain;
        J0x39D:

        if(Inv != none)
        {
            KFW = KFWeapon(Inv);
            if(KFW != none)
            {
                SetWeaponInformation(KFW);
            }
            Inv = Inv.Inventory;
            goto J0x39D;
        }
        if((Outer.MyGFxManager != none) && Outer.MyGFxManager.TraderMenu != none)
        {
            Outer.MyGFxManager.TraderMenu.OwnedItemList = OwnedItemList;
        }
    }
}

function bool IsSellable(const out STraderItem TraderItem)
{
    return (TraderItem.WeaponDef != none) && TraderItem.WeaponDef.default.BuyPrice > 0;
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
        if(OwnedItemClassName == 'None')
        {
            WarnInternal("Owned item with Class NAME_None");
            goto J0xBF;            
        }
        else
        {
            if(OwnedItemClassName == ItemName)
            {
                return true;
            }
        }
        J0xBF:

        ++ I;
        goto J0x0B;
    }
    return false;
}

function AddDosh(int AddedDosh)
{
    TotalDosh = Max(TotalDosh + AddedDosh, 0);
    if(Outer.Role < ROLE_Authority)
    {
        bPendingDoshUpdate = true;
        Outer.SetTimer(2, false, 'UpdateCurrentDosh', self);
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
    if((Outer.MyGFxManager != none) && Outer.MyGFxManager.TraderMenu != none)
    {
        Outer.MyGFxManager.TraderMenu.RefreshItemComponents();
    }
    bPendingDoshUpdate = false;
    Outer.ClearTimer('UpdateCurrentDosh', self);
}

function BoughtAmmo(int AmountPurchased, int Price, KFGFxMenu_Trader.EItemType ItemType, optional name ClassName, optional bool bIsSecondaryAmmo)
{
    local byte ItemIndex;

    AddDosh(-Price);
    if(ItemType == 0)
    {
        TraderItems.GetItemIndicesFromArche(ItemIndex, ClassName);
    }
    MyKFIM.BuyAmmo(AmountPurchased, ItemType, ItemIndex, bIsSecondaryAmmo);
}

function SetWeaponInformation(KFWeapon KFW)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < TraderItems.SaleItems.Length)
    {
        if(KFW.Class.Name == TraderItems.SaleItems[I].ClassName)
        {
            SetWeaponInfo(KFW, TraderItems.SaleItems[I]);
            return;
        }
        ++ I;
        goto J0x0B;
    }
}

function SetWeaponInfo(out KFWeapon KFW, STraderItem DefaultItem)
{
    local SItemInformation WeaponInfo;

    WeaponInfo.SpareAmmoCount = KFW.GetTotalAmmoAmount(0);
    WeaponInfo.MaxSpareAmmo = KFW.GetMaxAmmoAmount(0);
    WeaponInfo.MagazineCapacity = KFW.MagazineCapacity[0];
    WeaponInfo.SecondaryAmmoCount = KFW.GetTotalAmmoAmount(1);
    WeaponInfo.MaxSecondaryAmmo = KFW.GetMaxAmmoAmount(1);
    WeaponInfo.DefaultItem = DefaultItem;
    WeaponInfo.AmmoPricePerMagazine = DefaultItem.WeaponDef.default.AmmoPricePerMag;
    WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor(DefaultItem, KFW);
    AddItemByPriority(WeaponInfo);
    if(DefaultItem.SingleClassName != 'None')
    {
        RemoveWeaponFromOwnedItemList(,, DefaultItem.SingleClassName, true);
    }
}

function int AddWeaponToOwnedItemList(STraderItem DefaultItem, optional bool bDoNotBuy)
{
    local SItemInformation WeaponInfo;
    local byte ItemIndex;
    local int AddedWeaponIndex, OwnedSingleIdx, SingleDualAmmoDiff;
    local bool bAddingDual;

    WeaponInfo.MagazineCapacity = DefaultItem.MagazineCapacity;
    Outer.CurrentPerk.ModifyMagSizeAndNumber(none, WeaponInfo.MagazineCapacity, DefaultItem.AssociatedPerkClasses,, DefaultItem.ClassName);
    WeaponInfo.MaxSpareAmmo = DefaultItem.MaxSpareAmmo;
    Outer.CurrentPerk.ModifyMaxSpareAmmoAmount(none, WeaponInfo.MaxSpareAmmo, DefaultItem);
    WeaponInfo.MaxSpareAmmo += WeaponInfo.MagazineCapacity;
    WeaponInfo.SpareAmmoCount = DefaultItem.InitialSpareMags * DefaultItem.MagazineCapacity;
    Outer.CurrentPerk.ModifySpareAmmoAmount(none, WeaponInfo.SpareAmmoCount, DefaultItem);
    WeaponInfo.SpareAmmoCount += WeaponInfo.MagazineCapacity;
    bAddingDual = DefaultItem.SingleClassName != 'None';
    if(bAddingDual)
    {
        OwnedSingleIdx = 0;
        J0x2D0:

        if(OwnedSingleIdx < OwnedItemList.Length)
        {
            if(OwnedItemList[OwnedSingleIdx].DefaultItem.ClassName == DefaultItem.SingleClassName)
            {
                SingleDualAmmoDiff = OwnedItemList[OwnedSingleIdx].SpareAmmoCount - WeaponInfo.SpareAmmoCount;
                if(OwnedItemList[OwnedSingleIdx].SpareAmmoCount >= WeaponInfo.SpareAmmoCount)
                {
                    WeaponInfo.SpareAmmoCount = OwnedItemList[OwnedSingleIdx].SpareAmmoCount;
                }
                goto J0x42B;
            }
            ++ OwnedSingleIdx;
            goto J0x2D0;
        }
    }
    J0x42B:

    Outer.CurrentPerk.MaximizeSpareAmmoAmount(DefaultItem.AssociatedPerkClasses, WeaponInfo.SpareAmmoCount, DefaultItem.MaxSpareAmmo + DefaultItem.MagazineCapacity);
    WeaponInfo.SecondaryAmmoCount = DefaultItem.InitialSecondaryAmmo;
    Outer.CurrentPerk.ModifyMagSizeAndNumber(none, WeaponInfo.MagazineCapacity, DefaultItem.AssociatedPerkClasses, true, DefaultItem.ClassName);
    Outer.CurrentPerk.ModifySpareAmmoAmount(none, WeaponInfo.SecondaryAmmoCount, DefaultItem, true);
    WeaponInfo.MaxSecondaryAmmo = DefaultItem.MaxSecondaryAmmo;
    Outer.CurrentPerk.ModifyMaxSpareAmmoAmount(none, WeaponInfo.MaxSecondaryAmmo, DefaultItem, true);
    WeaponInfo.AmmoPricePerMagazine = DefaultItem.WeaponDef.default.AmmoPricePerMag;
    WeaponInfo.SellPrice = MyKFIM.GetAdjustedSellPriceFor(DefaultItem);
    WeaponInfo.DefaultItem = DefaultItem;
    AddedWeaponIndex = AddItemByPriority(WeaponInfo);
    if(!bDoNotBuy)
    {
        TraderItems.GetItemIndicesFromArche(ItemIndex, DefaultItem.ClassName);
        MyKFIM.ServerBuyWeapon(ItemIndex);        
    }
    else
    {
        TraderItems.GetItemIndicesFromArche(ItemIndex, DefaultItem.ClassName);
        MyKFIM.ServerAddTransactionItem(ItemIndex);
        AddBlocks(DefaultItem.BlocksRequired);
    }
    if(bAddingDual)
    {
        AddTransactionAmmo(ItemIndex, SingleDualAmmoDiff, false);
        RemoveWeaponFromOwnedItemList(,, DefaultItem.SingleClassName, true);
    }
    return AddedWeaponIndex;
}

function RemoveWeaponFromOwnedItemList(optional int OwnedListIdx, optional name ClassName, optional bool bDoNotSell)
{
    local SItemInformation ItemInfo;
    local byte ItemIndex;
    local int SingleOwnedIndex;

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
        TraderItems.GetItemIndicesFromArche(ItemIndex, ItemInfo.DefaultItem.ClassName);
        MyKFIM.ServerSellWeapon(ItemIndex);        
    }
    else
    {
        TraderItems.GetItemIndicesFromArche(ItemIndex, ItemInfo.DefaultItem.ClassName);
        MyKFIM.ServerRemoveTransactionItem(ItemIndex);
        AddBlocks(-ItemInfo.DefaultItem.BlocksRequired);
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
        if(OwnedItemList[OwnedListIdx].DefaultItem.WeaponDef.static.UsesSecondaryAmmo())
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
        if(TraderItems.GetItemIndicesFromArche(ItemIndex, ItemInfo.DefaultItem.SingleClassName))
        {
            SingleOwnedIndex = AddWeaponToOwnedItemList(TraderItems.SaleItems[ItemIndex], true);
            AddTransactionAmmo(ItemIndex, ItemInfo.SpareAmmoCount, false);
            OwnedItemList[SingleOwnedIndex].SpareAmmoCount = ItemInfo.SpareAmmoCount;
        }
    }
    if((Outer.MyGFxManager != none) && Outer.MyGFxManager.TraderMenu != none)
    {
        Outer.MyGFxManager.TraderMenu.OwnedItemList = OwnedItemList;
    }
}

function int AddItemByPriority(out SItemInformation WeaponInfo)
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
            goto J0x2BE;            
        }
        else
        {
            if(WeaponGroup == OwnedItemList[I].DefaultItem.InventoryGroup)
            {
                if(float(WeaponPriority) > OwnedItemList[I].DefaultItem.GroupPriority)
                {
                    BestIndex = I;
                    goto J0x2BE;                    
                }
                else
                {
                    if((float(WeaponPriority) == OwnedItemList[I].DefaultItem.GroupPriority) && WeaponInfo.DefaultItem.AssociatedPerkClasses.Find(Outer.CurrentPerk.Class != -1)
                    {
                        BestIndex = I;
                        goto J0x2BE;
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
    J0x2BE:

    OwnedItemList.InsertItem(BestIndex, WeaponInfo;
    if(WeaponInfo.DefaultItem.WeaponDef.static.UsesSecondaryAmmo())
    {
        WeaponInfo.bIsSecondaryAmmo = true;
        WeaponInfo.SellPrice = 0;
        OwnedItemList.InsertItem(BestIndex + 1, WeaponInfo;
    }
    if((Outer.MyGFxManager != none) && Outer.MyGFxManager.TraderMenu != none)
    {
        Outer.MyGFxManager.TraderMenu.OwnedItemList = OwnedItemList;
    }
    return BestIndex;
}

function AddBlocks(int AddedBlocks)
{
    TotalBlocks = Max(TotalBlocks + AddedBlocks, 0);
}

function GetTraderItems()
{
    TraderItems = KFGameReplicationInfo(Outer.WorldInfo.GRI).TraderItems;
    Initialize();
}

// Export UKFAutoPurchaseHelper::execAddTransactionAmmo(FFrame&, void* const)
private native final function AddTransactionAmmo(byte ItemIndex, int Amount, bool bSecondaryAmmo);

defaultproperties
{
    GrenadeItem=(bIsSecondaryAmmo=false,SpareAmmoCount=0,MaxSpareAmmo=0,MaxSecondaryAmmo=0,SellPrice=0,SecondaryAmmoCount=0,MagazineCapacity=0,AutoFillDosh=0,AmmoPricePerMagazine=0,DefaultItem=(WeaponDef=none,ClassName=None,SingleClassName=None,DualClassName=None,AssociatedPerkClasses=none,MaxSpareAmmo=0,SecondaryAmmoImagePath="",GroupPriority=0,WeaponStats=none,InitialSpareMags=0,MagazineCapacity=0,BlocksRequired=0,InitialSecondaryAmmo=0,MaxSecondaryAmmo=0,TraderFilter=EFilterTypeUI.FT_Pistol,AltTraderFilter=EFilterTypeUI.FT_None,InventoryGroup=0,ItemId=-1))
    ArmorItem=(bIsSecondaryAmmo=false,SpareAmmoCount=0,MaxSpareAmmo=0,MaxSecondaryAmmo=0,SellPrice=0,SecondaryAmmoCount=0,MagazineCapacity=0,AutoFillDosh=0,AmmoPricePerMagazine=0,DefaultItem=(WeaponDef=none,ClassName=None,SingleClassName=None,DualClassName=None,AssociatedPerkClasses=none,MaxSpareAmmo=0,SecondaryAmmoImagePath="",GroupPriority=0,WeaponStats=none,InitialSpareMags=0,MagazineCapacity=0,BlocksRequired=0,InitialSecondaryAmmo=0,MaxSecondaryAmmo=0,TraderFilter=EFilterTypeUI.FT_Pistol,AltTraderFilter=EFilterTypeUI.FT_None,InventoryGroup=0,ItemId=-1))
    CostPerAutofillCycle=10
    DoshBuffer=150
}