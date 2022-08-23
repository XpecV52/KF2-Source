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
    EStore_All,
    EStore_WeaponSkins,
    EStore_Cosmetics,
    EStore_Consumables,
    EStore_Emotes,
    EStore_Market_WeaponSkins,
    EStore_Market_Cosmetics,
    EStore_Market_Consumables,
    EStore_Market_Emotes,
    EStore_Max
};

var const localized string WeaponSkinsRotationString;
var const localized string WeaponSkinsString;
var const localized string MarketConsumablesString;
var const localized string MarketCosmeticsString;
var const localized string MarketEmotesString;
var const localized string LookUpOnMarketString;
var KFGFxMenu_Store StoreMenu;
var KFGFxStoreContainer_Main.EStore_Filter CurrentStoreFilter;

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
    LocalizedObject.SetString("all", Class'KFGFxMenu_Inventory'.default.AllString);
    LocalizedObject.SetString("weaponSkin", WeaponSkinsRotationString);
    LocalizedObject.SetString("cosmetics", Class'KFGFxMenu_Inventory'.default.CosmeticString);
    LocalizedObject.SetString("emotes", Class'KFGFxMenu_Inventory'.default.EmotesString);
    LocalizedObject.SetString("items", Class'KFGFxMenu_Inventory'.default.ItemString);
    LocalizedObject.SetString("marketWeaponSkins", WeaponSkinsString);
    LocalizedObject.SetString("marketCosmetics", MarketCosmeticsString);
    LocalizedObject.SetString("marketEmotes", MarketEmotesString);
    LocalizedObject.SetString("marketConsumables", MarketConsumablesString);
    SetObject("localizedText", LocalizedObject);
}

function UpdateFilter(int NewFilterIndex)
{
    local KFGFxStoreContainer_Main.EStore_Filter NewFilter;

    switch(NewFilterIndex)
    {
        case 0:
            NewFilter = 0;
            break;
        case 1:
            NewFilter = 1;
            break;
        case 2:
            NewFilter = 2;
            break;
        case 3:
            NewFilter = 3;
            break;
        case 4:
            NewFilter = 4;
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
    local int I, ItemCount;
    local GFxObject DataProvider;

    ItemCount = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < StoreItemArray.Length)
    {
        if((StoreItemArray[I].ProductID != "") && StoreItemArray[I].SignedOfferId == "")
        {
            LogInternal(("Skipping PSN store item" @ string(StoreItemArray[I].Definition)) @ "since it has no store offer ID");            
        }
        else
        {
            if(CurrentStoreFilter < 5)
            {
                if((StoreItemArray[I].Price != "") && (IsFilterSame(StoreItemArray[I].Type, CurrentStoreFilter)) || CurrentStoreFilter == 0)
                {
                    DataProvider.SetElementObject(ItemCount, CreateStoreItem(StoreItemArray[I]));
                    ++ ItemCount;
                }                
            }
            else
            {
                if((StoreItemArray[I].Price == "") && IsFilterSame(StoreItemArray[I].Type, CurrentStoreFilter))
                {
                    DataProvider.SetElementObject(ItemCount, CreateStoreItem(StoreItemArray[I]));
                    ++ ItemCount;
                }
            }
        }
        ++ I;
        goto J0x3F;
    }
    SetObject("storeItemData", DataProvider);
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
    if(SecondType < 5)
    {
        return (FirstType + 1) == SecondType;        
    }
    else
    {
        return (FirstType + 1) == (SecondType - 4);
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
}