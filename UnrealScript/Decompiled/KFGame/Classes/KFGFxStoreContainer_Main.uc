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
    EStore_WeaponSkins,
    EStore_Cosmetics,
    EStore_Consumables,
    EStore_Items,
    EStore_CraftingMats,
    EStore_Emotes,
    EStore_SFX,
    EStore_Market_WeaponSkins,
    EStore_Market_Cosmetics,
    EStore_Market_Items,
    EStore_Market_CraftingMats,
    EStore_Market_Consumables,
    EStore_Market_Emotes,
    EStore_Market_SFX,
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
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("back", Class'KFCommon_LocalizedStrings'.default.BackString);
    LocalizedObject.SetString("featured", FeaturedString);
    LocalizedObject.SetString("all", Class'KFGFxMenu_Inventory'.default.AllString);
    LocalizedObject.SetString("weaponSkin", WeaponSkinsRotationString);
    LocalizedObject.SetString("cosmetics", Class'KFGFxMenu_Inventory'.default.CosmeticString);
    LocalizedObject.SetString("emotes", Class'KFGFxMenu_Inventory'.default.EmotesString);
    LocalizedObject.SetString("items", Class'KFGFxMenu_Inventory'.default.ItemString);
    LocalizedObject.SetString("marketWeaponSkins", WeaponSkinsString);
    LocalizedObject.SetString("marketCosmetics", MarketCosmeticsString);
    LocalizedObject.SetString("marketEmotes", MarketEmotesString);
    LocalizedObject.SetString("marketConsumables", MarketConsumablesString);
    LocalizedObject.SetString("sfx", Class'KFCommon_LocalizedStrings'.default.SpecialEffectsString);
    LocalizedObject.SetString("marketSFX", MarketSFXString);
    LocalizedObject.SetString("thankYouString", ThankYouString);
    SetObject("localizedText", LocalizedObject);
}

function UpdateFilter(int NewFilterIndex)
{
    local KFGFxStoreContainer_Main.EStore_Filter NewFilter;

    switch(NewFilterIndex)
    {
        case 0:
            NewFilter = 14;
            break;
        case 1:
            NewFilter = 15;
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
            NewFilter = 5;
            break;
        case 6:
            NewFilter = 6;
            break;
        case 7:
            NewFilter = 7;
            break;
        case 8:
            NewFilter = 8;
            break;
        case 9:
            NewFilter = 11;
            break;
        case 10:
            NewFilter = 12;
            break;
        case 11:
            NewFilter = 13;
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

    ItemCount = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < StoreItemArray.Length)
    {
        if(((StoreItemArray[I].ProductID != "") && StoreItemArray[I].SignedOfferId == "") && CurrentStoreFilter != 14)
        {
            LogInternal(("Skipping console store item" @ string(StoreItemArray[I].Definition)) @ "since it has no store offer ID");            
        }
        else
        {
            if((CurrentStoreFilter < 7) || CurrentStoreFilter == 15)
            {
                if((StoreItemArray[I].Price != "") && IsFilterSame(StoreItemArray[I].Type, CurrentStoreFilter))
                {
                    TempItemProps = StoreItemArray[I];
                    FilteredItemsArray[ItemCount] = TempItemProps;
                    ++ ItemCount;
                }                
            }
            else
            {
                if(CurrentStoreFilter == 14)
                {
                    if(Class'WorldInfo'.static.IsConsoleBuild())
                    {
                        J = 0;
                        J0x257:

                        if(J < ConsoleFeaturedItemIDs.Length)
                        {
                            if(StoreItemArray[I].Definition == ConsoleFeaturedItemIDs[J])
                            {
                                TempItemProps = StoreItemArray[I];
                                FilteredItemsArray[ItemCount] = TempItemProps;
                                ++ ItemCount;
                            }
                            ++ J;
                            goto J0x257;
                        }                        
                    }
                    else
                    {
                        J = 0;
                        J0x30E:

                        if(J < FeaturedItemIDs.Length)
                        {
                            if(StoreItemArray[I].Definition == FeaturedItemIDs[J])
                            {
                                TempItemProps = StoreItemArray[I];
                                FilteredItemsArray[ItemCount] = TempItemProps;
                                ++ ItemCount;
                            }
                            ++ J;
                            goto J0x30E;
                        }
                    }                    
                }
                else
                {
                    if(((StoreItemArray[I].Price == "") && IsFilterSame(StoreItemArray[I].Type, CurrentStoreFilter)) && StoreItemArray[I].Marketable)
                    {
                        TempItemProps = StoreItemArray[I];
                        FilteredItemsArray[ItemCount] = TempItemProps;
                        ++ ItemCount;
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
        if(CurrentStoreFilter == 15)
        {            
            FilteredItemsArray.Sort(SortItemsByType;            
        }
        else
        {            
            FilteredItemsArray.Sort(SortItemsByPrice;
        }
        if(CurrentStoreFilter == 14)
        {
            ShuffleFeaturedItems(FilteredItemsArray);
            I = 0;
            J0x556:

            if(I < MaxFeaturedItems)
            {
                DataProvider.SetElementObject(ItemCount, CreateStoreItem(FilteredItemsArray[I]));
                ++ ItemCount;
                ++ I;
                goto J0x556;
            }            
        }
        else
        {
            I = 0;
            J0x5D9:

            if(I < FilteredItemsArray.Length)
            {
                DataProvider.SetElementObject(ItemCount, CreateStoreItem(FilteredItemsArray[I]));
                ++ ItemCount;
                ++ I;
                goto J0x5D9;
            }
        }
    }
    if(CurrentStoreFilter == 14)
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
    DataObject.SetString("price", ((Class'WorldInfo'.static.IsConsoleBuild()) ? "" : StoreItem.Price));
    DataObject.SetString("imageURL", "img://" $ StoreItem.IconURL);
    DataObject.SetString("imageURLLarge", "img://" $ StoreItem.IconURLLarge);
    DataObject.SetInt("SKU", StoreItem.Definition);
    return DataObject;
}

function bool IsFilterSame(Engine.OnlineSubsystem.ItemType FirstType, KFGFxStoreContainer_Main.EStore_Filter SecondType)
{
    if(SecondType == 15)
    {
        return true;
    }
    if(SecondType < 7)
    {
        return FirstType == SecondType;        
    }
    else
    {
        return FirstType == (SecondType - 7);
    }
    return false;
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
    FeaturedItemIDs(0)=6670
    FeaturedItemIDs(1)=5286
    FeaturedItemIDs(2)=5787
    FeaturedItemIDs(3)=6185
    FeaturedItemIDs(4)=6455
    ConsoleFeaturedItemIDs(0)=6670
    ConsoleFeaturedItemIDs(1)=6713
    ConsoleFeaturedItemIDs(2)=6280
    ConsoleFeaturedItemIDs(3)=6283
    ConsoleFeaturedItemIDs(4)=6716
    MaxFeaturedItems=5
    CurrentStoreFilter=EStore_Filter.EStore_Featured
}