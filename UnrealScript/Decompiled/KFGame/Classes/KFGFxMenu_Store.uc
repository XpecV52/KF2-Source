/*******************************************************************************
 * KFGFxMenu_Store generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_Store extends KFGFxObject_Menu within GFxMoviePlayer;

struct StoreItem
{
    var int SKU;
    var string ItemName;
    var string ItemDesciption;
    var string IconLocation;
    var float ItemPrice;
    var name ItemType;

    structdefaultproperties
    {
        SKU=0
        ItemName=""
        ItemDesciption=""
        IconLocation=""
        ItemPrice=0
        ItemType=None
    }
};

var const localized string ExitKF2;
var OnlineSubsystem OnlineSub;
var KFGFxStoreContainer_Main MainContainer;
var KFGFxStoreContainer_Details DetailsContainer;
var KFGFxStoreContainer_Cart CartContainer;
var array<ItemProperties> CharacterItems;
var array<StoreItem> WeaponSkinItems;
var array<StoreItem> ToolItems;
var string AllString;
var string NewReleasesKey;
var string CharactersKey;
var string WeaponsKey;
var string ToolsKey;
var const localized string StoreString;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeText();
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
}

function OnOpen()
{
    if(OnlineSub != none)
    {
        OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
    }
    RefreshItemList();
}

function OnClose()
{
    if(OnlineSub != none)
    {
        OnlineSub.ClearOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
    }
}

function OnInventoryReadComplete()
{
    RefreshItemList();
}

function RefreshItemList()
{
    if(MainContainer != none)
    {
        MainContainer.SendItems(OnlineSub.ItemPropertiesList);
    }
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("store", StoreString);
    SetObject("localizedText", LocalizedObject);
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'storeMainContainer':
            if(MainContainer == none)
            {
                MainContainer = KFGFxStoreContainer_Main(Widget);
                MainContainer.Initialize(self);
                MainContainer.SendItems(OnlineSub.ItemPropertiesList);
            }
            break;
        case 'storeCart':
            if(CartContainer == none)
            {
                CartContainer = KFGFxStoreContainer_Cart(Widget);
                CartContainer.Initialize(self);
            }
            break;
        case 'ItemDetails':
            if(DetailsContainer == none)
            {
                DetailsContainer = KFGFxStoreContainer_Details(Widget);
                DetailsContainer.Initialize(self);
            }
            break;
        default:
            break;
    }
    return true;
}

function Callback_StoreSectionChanged(string SectionName)
{
    switch(SectionName)
    {
        case NewReleasesKey:
            MainContainer.UpdateFilter(0, OnlineSub.ItemPropertiesList);
            break;
        case CharactersKey:
            MainContainer.UpdateFilter(2, OnlineSub.ItemPropertiesList);
            break;
        case WeaponsKey:
            MainContainer.UpdateFilter(1, OnlineSub.ItemPropertiesList);
            break;
        case ToolsKey:
            MainContainer.UpdateFilter(3, OnlineSub.ItemPropertiesList);
            break;
        default:
            break;
    }
}

function Callback_AddToCartClicked(int ItemSKU)
{
    if(OnlineSub != none)
    {
        OnlineSub.OpenItemPurchaseOverlay(ItemSKU);
    }
}

defaultproperties
{
    NewReleasesKey="New Releases"
    CharactersKey="Characters"
    WeaponsKey="Weapons"
    ToolsKey="Tools"
    StoreString="STORE"
    SubWidgetBindings=/* Array type was not detected. */
}