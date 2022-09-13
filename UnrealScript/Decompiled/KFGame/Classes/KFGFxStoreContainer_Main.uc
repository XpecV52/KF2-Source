/*******************************************************************************
 * KFGFxStoreContainer_Main generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxStoreContainer_Main extends KFGFxObject_Container within GFxMoviePlayer;

enum EStore_Filter
{
    EStore_WeaponBundles,
    EStore_CharactersBundles,
    EStore_OutfitBundles,
    EStore_TicketCratesUSBBundles,
    EStore_CosmeticBundles,
    EStore_WeaponSkinBundles,
    EStore_HeadshotFXBundles,
    EStore_SelectWeaponSkins,
    EStore_SelectCosmetics,
    EStore_SelectEmotes,
    EStore_SelectKeysAndTickets,
    EStore_MarketWeaponSkins,
    EStore_MarketCosmetics,
    EStore_MarketEmotes,
    EStore_MarketCratesAndUSB,
    EStore_Featured,
    EStore_All,
    EStore_Max
};

var const localized string WeaponSkinsRotationString;
var const localized string WeaponSkinsString;
var const localized string MarketConsumablesString;
var const localized string MarketCosmeticsString;
var const localized string MarketEmotesString;
var const localized string LookUpOnMarketString;
var const localized string ThankYouString;
var const localized string FeaturedString;
var const localized string MarketSFXString;
var const localized string WeaponBundlesString;
var const localized string CharacterBundlesString;
var const localized string OutfitBundlesString;
var const localized string TicketCratesUSBBundlesString;
var const localized string CosmeticBundlesString;
var const localized string WeaponSkinBundlesString;
var const localized string HeadshotFxBundlesString;
var const localized string SelectWeaponSkinsString;
var const localized string SelectCosmeticsString;
var const localized string SelectEmotesString;
var const localized string SelectKeysAndTicketsString;
var array<int> FilterIndexConversion;
var array<int> ItemTypeIndexConversion;
var array<int> MarketItemTypeIndexConversion;
var array<string> XboxFilterExceptions;
var array<int> FeaturedItemIDs;
var array<int> ConsoleFeaturedItemIDs;
var int MaxFeaturedItems;
var KFGFxMenu_Store StoreMenu;
var KFGFxStoreContainer_Main.EStore_Filter CurrentStoreFilter;
var delegate<SortItemsByType> __SortItemsByType__Delegate;
var delegate<SortItemsByPrice> __SortItemsByPrice__Delegate;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    StoreMenu = KFGFxMenu_Store(NewParentMenu);
    LocalizeText();
    TweakFiltersVisibility();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("back", Class'KFCommon_LocalizedStrings'.default.BackString);
    LocalizedObject.SetString("featured", FeaturedString);
    LocalizedObject.SetString("all", Class'KFGFxMenu_Inventory'.default.AllString);
    LocalizedObject.SetString("weaponBundles", WeaponBundlesString);
    LocalizedObject.SetString("characterBundles", CharacterBundlesString);
    LocalizedObject.SetString("outfitBundles", OutfitBundlesString);
    LocalizedObject.SetString("ticketCratesUSBBundles", TicketCratesUSBBundlesString);
    LocalizedObject.SetString("cosmeticBundles", CosmeticBundlesString);
    LocalizedObject.SetString("weaponSkinBundles", WeaponSkinBundlesString);
    LocalizedObject.SetString("headshotFxBundles", HeadshotFxBundlesString);
    LocalizedObject.SetString("selectWeaponSkins", SelectWeaponSkinsString);
    LocalizedObject.SetString("selectCosmetics", SelectCosmeticsString);
    LocalizedObject.SetString("selectEmotes", SelectEmotesString);
    LocalizedObject.SetString("selectKeysAndTickets", SelectKeysAndTicketsString);
    LocalizedObject.SetString("marketWeaponSkins", WeaponSkinsString);
    LocalizedObject.SetString("marketCosmetics", MarketCosmeticsString);
    LocalizedObject.SetString("marketEmotes", MarketEmotesString);
    LocalizedObject.SetString("marketCratesAndUSBSs", MarketConsumablesString);
    LocalizedObject.SetString("thankYouString", ThankYouString);
    SetObject("localizedText", LocalizedObject);
}

function TweakFiltersVisibility()
{
    if(Class'WorldInfo'.static.IsEOSBuild())
    {
        GetObject("selectWeaponSkinsButton").SetVisible(false);
        GetObject("selectCosmeticsButton").SetVisible(false);
        GetObject("selectEmotesButton").SetVisible(false);
        GetObject("selectKeysAndTicketsButton").SetVisible(false);
        GetObject("marketWeaponSkinsButton").SetVisible(false);
        GetObject("marketCosmeticsButton").SetVisible(false);
        GetObject("marketEmotesButton").SetVisible(false);
        GetObject("marketCratesAndUSBsButton").SetVisible(false);
    }
}

function UpdateFilter(int NewFilterIndex)
{
    local KFGFxStoreContainer_Main.EStore_Filter NewFilter;

    switch(NewFilterIndex)
    {
        case 0:
            NewFilter = 15;
            break;
        case 1:
            NewFilter = 16;
            break;
        case 2:
            NewFilter = 0;
            break;
        case 3:
            NewFilter = 1;
            break;
        case 4:
            NewFilter = 2;
            break;
        case 5:
            NewFilter = 3;
            break;
        case 6:
            NewFilter = 4;
            break;
        case 7:
            NewFilter = 5;
            break;
        case 8:
            NewFilter = 6;
            break;
        case 9:
            NewFilter = 7;
            break;
        case 10:
            NewFilter = 8;
            break;
        case 11:
            NewFilter = 9;
            break;
        case 12:
            NewFilter = 10;
            break;
        case 13:
            NewFilter = 11;
            break;
        case 14:
            NewFilter = 12;
            break;
        case 15:
            NewFilter = 13;
            break;
        case 16:
            NewFilter = 14;
            break;
        default:
            break;
    }
    if(CurrentStoreFilter != NewFilter)
    {
        CurrentStoreFilter = NewFilter;
        SendItems(StoreMenu.OnlineSub.ItemPropertiesList);
    }
}

function SendItems(const out array<ItemProperties> StoreItemArray)
{
    local int I, ItemCount, J;
    local GFxObject DataProvider;
    local array<ItemProperties> FilteredItemsArray;
    local ItemProperties TempItemProps;
    local bool AlreadyFiltered;

    ItemCount = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < StoreItemArray.Length)
    {
        if(((StoreItemArray[I].ProductID != "") && StoreItemArray[I].SignedOfferId == "") && CurrentStoreFilter != 15)
        {            
        }
        else
        {
            if(!IsItemValidForThisPlatform(StoreItemArray[I].Name))
            {                
            }
            else
            {
                if(((CurrentStoreFilter > 6) && CurrentStoreFilter < 11) || CurrentStoreFilter == 16)
                {
                    if((StoreItemArray[I].Price != "") && IsItemTypeIndexSame(StoreItemArray[I].Type, CurrentStoreFilter))
                    {
                        TempItemProps = StoreItemArray[I];
                        FilteredItemsArray[ItemCount] = TempItemProps;
                        ++ ItemCount;
                    }                    
                }
                else
                {
                    if(CurrentStoreFilter == 15)
                    {
                        if(Class'WorldInfo'.static.IsConsoleBuild())
                        {
                            J = 0;
                            J0x239:

                            if(J < ConsoleFeaturedItemIDs.Length)
                            {
                                if(StoreItemArray[I].Definition == ConsoleFeaturedItemIDs[J])
                                {
                                    TempItemProps = StoreItemArray[I];
                                    FilteredItemsArray[ItemCount] = TempItemProps;
                                    ++ ItemCount;
                                }
                                ++ J;
                                goto J0x239;
                            }                            
                        }
                        else
                        {
                            J = 0;
                            J0x2F0:

                            if(J < FeaturedItemIDs.Length)
                            {
                                if(StoreItemArray[I].Definition == FeaturedItemIDs[J])
                                {
                                    TempItemProps = StoreItemArray[I];
                                    FilteredItemsArray[ItemCount] = TempItemProps;
                                    ++ ItemCount;
                                }
                                ++ J;
                                goto J0x2F0;
                            }
                        }                        
                    }
                    else
                    {
                        AlreadyFiltered = false;
                        if((StoreItemArray[I].FilterIdIndex > 0) && IsFilterIndexSame(StoreItemArray[I].FilterIdIndex, CurrentStoreFilter))
                        {
                            TempItemProps = StoreItemArray[I];
                            FilteredItemsArray[ItemCount] = TempItemProps;
                            ++ ItemCount;
                            AlreadyFiltered = true;
                        }
                        if(((!AlreadyFiltered && StoreItemArray[I].Price == "") && IsMarketItemTypeIndexSame(StoreItemArray[I].Type, CurrentStoreFilter)) && StoreItemArray[I].Marketable)
                        {
                            TempItemProps = StoreItemArray[I];
                            FilteredItemsArray[ItemCount] = TempItemProps;
                            ++ ItemCount;
                        }
                    }
                }
            }
        }
        ++ I;
        goto J0x3F;
    }
    ItemCount = 0;
    if(FilteredItemsArray.Length > 0)
    {
        if(CurrentStoreFilter == 16)
        {            
            FilteredItemsArray.Sort(SortItemsByType;            
        }
        else
        {            
            FilteredItemsArray.Sort(SortItemsByPrice;
        }
        if(CurrentStoreFilter == 15)
        {
            ShuffleFeaturedItems(FilteredItemsArray);
            I = 0;
            J0x610:

            if(I < Min(MaxFeaturedItems, FilteredItemsArray.Length))
            {
                DataProvider.SetElementObject(ItemCount, CreateStoreItem(FilteredItemsArray[I]));
                ++ ItemCount;
                ++ I;
                goto J0x610;
            }            
        }
        else
        {
            I = 0;
            J0x69F:

            if(I < FilteredItemsArray.Length)
            {
                DataProvider.SetElementObject(ItemCount, CreateStoreItem(FilteredItemsArray[I]));
                ++ ItemCount;
                ++ I;
                goto J0x69F;
            }
        }
    }
    if(CurrentStoreFilter == 15)
    {
        SetObject("storeItemFeaturedData", DataProvider);        
    }
    else
    {
        SetObject("storeItemData", DataProvider);
    }
}

function ShuffleFeaturedItems(out array<ItemProperties> FeaturedItemArray)
{
    local int CurrentIndex, RandomIndex;
    local ItemProperties TempValue;

    CurrentIndex = FeaturedItemArray.Length;
    J0x14:

    if(0 != CurrentIndex)
    {
        RandomIndex = Rand(FeaturedItemArray.Length);
        CurrentIndex -= 1;
        TempValue = FeaturedItemArray[CurrentIndex];
        FeaturedItemArray[CurrentIndex] = FeaturedItemArray[RandomIndex];
        FeaturedItemArray[RandomIndex] = TempValue;
        goto J0x14;
    }
}

delegate int SortItemsByType(ItemProperties A, ItemProperties B)
{
    return ((A.Type > B.Type) ? -1 : 0);
}

delegate int SortItemsByPrice(ItemProperties A, ItemProperties B)
{
    local string AString, BString;

    AString = Mid(A.Price, 1);
    BString = Mid(B.Price, 1);
    return ((int(AString) < int(BString)) ? -1 : 0);
}

function GFxObject CreateStoreItem(ItemProperties StoreItem)
{
    local GFxObject DataObject;

    DataObject = Outer.CreateObject("Object");
    DataObject.SetString("label", StoreItem.Name);
    DataObject.SetString("description", StoreItem.Description);
    if(StoreItem.ItemOnSale && StoreItem.BasePrice != StoreItem.Price)
    {
        DataObject.SetString("itemOnSale", ((StoreItem.ItemOnSale) ? "1" : "0"));
        DataObject.SetString("itemPriceBase", StoreItem.BasePrice);
        if((StoreItem.DiscountRate != "") && StoreItem.DiscountRate != "0")
        {
            DataObject.SetString("discountRate", StoreItem.DiscountRate);
        }
    }
    DataObject.SetString("price", ((Class'WorldInfo'.static.IsConsoleBuild()) ? "" : StoreItem.Price));
    DataObject.SetString("imageURL", "img://" $ StoreItem.IconURL);
    DataObject.SetString("imageURLLarge", "img://" $ StoreItem.IconURLLarge);
    DataObject.SetInt("SKU", StoreItem.Definition);
    return DataObject;
}

function bool IsItemTypeIndexSame(Engine.OnlineSubsystem.ItemType FirstType, KFGFxStoreContainer_Main.EStore_Filter SecondType)
{
    if(SecondType == 16)
    {
        return true;
    }
    return ItemTypeIndexConversion[FirstType] == SecondType;
}

function bool IsMarketItemTypeIndexSame(Engine.OnlineSubsystem.ItemType FirstType, KFGFxStoreContainer_Main.EStore_Filter SecondType)
{
    if(SecondType == 16)
    {
        return true;
    }
    return MarketItemTypeIndexConversion[FirstType] == SecondType;
}

function bool IsFilterIndexSame(int FilterIndexId, KFGFxStoreContainer_Main.EStore_Filter SecondType)
{
    if(SecondType == 16)
    {
        return true;
    }
    return FilterIndexConversion[FilterIndexId] == SecondType;
}

function bool IsItemValidForThisPlatform(string ItemName)
{
    local int Index;

    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        Index = 0;
        J0x2F:

        if(Index < XboxFilterExceptions.Length)
        {
            if(XboxFilterExceptions[Index] == ItemName)
            {
                return false;
            }
            ++ Index;
            goto J0x2F;
        }
    }
    return true;
}

defaultproperties
{
    WeaponSkinsRotationString="Weapon Skins"
    WeaponSkinsString="Market Weapon Skins"
    MarketConsumablesString="Market Crates/USBs"
    MarketCosmeticsString="Market Cosmetics"
    MarketEmotesString="Market Emotes"
    ThankYouString="Thank you for your purchase! It will help us in developing new items, maps, weapons, zeds, and game modes for future updates."
    FeaturedString="Featured"
    MarketSFXString="Market SFX"
    WeaponBundlesString="Weapon Bundles"
    CharacterBundlesString="Character Bundles"
    OutfitBundlesString="Outfit Bundles"
    TicketCratesUSBBundlesString="Ticket/Crates/USB Bundles"
    CosmeticBundlesString="Cosmetic Bundles"
    WeaponSkinBundlesString="Weapon Skin Bundles"
    HeadshotFxBundlesString="Headshot FX Bundles"
    SelectWeaponSkinsString="Select Weapon Skins"
    SelectCosmeticsString="Select Cosmetics"
    SelectEmotesString="Select Emotes"
    SelectKeysAndTicketsString="Select Keys and Tickets"
    FilterIndexConversion(0)=-1
    FilterIndexConversion(1)=0
    FilterIndexConversion(2)=1
    FilterIndexConversion(3)=2
    FilterIndexConversion(4)=3
    FilterIndexConversion(5)=5
    FilterIndexConversion(6)=6
    FilterIndexConversion(7)=4
    ItemTypeIndexConversion(0)=7
    ItemTypeIndexConversion(1)=8
    ItemTypeIndexConversion(2)=10
    ItemTypeIndexConversion(3)=-1
    ItemTypeIndexConversion(4)=-1
    ItemTypeIndexConversion(5)=9
    ItemTypeIndexConversion(6)=-1
    ItemTypeIndexConversion(7)=-1
    MarketItemTypeIndexConversion(0)=11
    MarketItemTypeIndexConversion(1)=12
    MarketItemTypeIndexConversion(2)=-1
    MarketItemTypeIndexConversion(3)=-1
    MarketItemTypeIndexConversion(4)=14
    MarketItemTypeIndexConversion(5)=13
    MarketItemTypeIndexConversion(6)=-1
    MarketItemTypeIndexConversion(7)=-1
    XboxFilterExceptions(0)="Wasteland Bundle"
    FeaturedItemIDs(0)=7619
    FeaturedItemIDs(1)=9119
    FeaturedItemIDs(2)=9120
    FeaturedItemIDs(3)=9121
    FeaturedItemIDs(4)=9122
    FeaturedItemIDs(5)=9123
    FeaturedItemIDs(6)=9124
    ConsoleFeaturedItemIDs(0)=7783
    ConsoleFeaturedItemIDs(1)=9119
    ConsoleFeaturedItemIDs(2)=9120
    ConsoleFeaturedItemIDs(3)=9121
    ConsoleFeaturedItemIDs(4)=9122
    ConsoleFeaturedItemIDs(5)=9123
    ConsoleFeaturedItemIDs(6)=9124
    MaxFeaturedItems=5
    CurrentStoreFilter=EStore_Filter.EStore_Featured
}