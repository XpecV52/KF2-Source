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
    EStore_MAX
};

var const localized string NewReleasesString;
var const localized string CartString;
var const localized string ToolsString;
var const localized string WeaponSkinsString;
var const localized string CharactersString;
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
    LocalizedObject.SetString("newReleases", Class'KFGFxMenu_Inventory'.default.AllString);
    LocalizedObject.SetString("characters", Class'KFGFxMenu_Inventory'.default.CosmeticString);
    LocalizedObject.SetString("weaponSkins", WeaponSkinsString);
    LocalizedObject.SetString("tools", Class'KFGFxMenu_Inventory'.default.ItemString);
    LocalizedObject.SetString("cart", CartString);
    SetObject("localizedText", LocalizedObject);
}

function UpdateFilter(KFGFxStoreContainer_Main.EStore_Filter NewFilter, const out array<ItemProperties> StoreItemArray)
{
    if(CurrentStoreFilter != NewFilter)
    {
        CurrentStoreFilter = NewFilter;
        SendItems(StoreItemArray);
    }
}

function SendItems(const out array<ItemProperties> StoreItemArray)
{
    local int I, ItemCount;
    local GFxObject DataProvider, DataObject;

    ItemCount = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3F:

    if(I < StoreItemArray.Length)
    {
        if((StoreItemArray[I].Price != "") && (IsFilterSame(StoreItemArray[I].Type, CurrentStoreFilter)) || CurrentStoreFilter == 0)
        {
            DataObject = Outer.CreateObject("Object");
            DataObject.SetString("label", StoreItemArray[I].Name);
            DataObject.SetString("description", StoreItemArray[I].Description);
            DataObject.SetString("price", StoreItemArray[I].Price);
            DataObject.SetString("imageURL", "img://" $ StoreItemArray[I].IconURL);
            DataObject.SetString("imageURLLarge", "img://" $ StoreItemArray[I].IconURLLarge);
            DataObject.SetInt("SKU", StoreItemArray[I].Definition);
            DataProvider.SetElementObject(ItemCount, DataObject);
            ++ ItemCount;
        }
        ++ I;
        goto J0x3F;
    }
    SetObject("storeItemData", DataProvider);
}

function bool IsFilterSame(Engine.OnlineSubsystem.ItemType FirstType, KFGFxStoreContainer_Main.EStore_Filter SecondType)
{
    return (FirstType + 1) == SecondType;
}

defaultproperties
{
    NewReleasesString="New Releases"
    CartString="Cart"
    ToolsString="Tools"
    WeaponSkinsString="Weapon Skins"
    CharactersString="Characters"
}