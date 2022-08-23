/*******************************************************************************
 * KFGFxMenu_Inventory generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_Inventory extends KFGFxObject_Menu within GFxMoviePlayer;

enum EINventory_Filter
{
    EInv_All,
    EInv_WeaponSkins,
    EInv_Cosmetics,
    EInv_Consumables,
    EInv_Items,
    EInv_CraftingMats,
    EInv_Emotes,
    EInv_MAX
};

struct InventoryHelper
{
    var int ItemDefinition;
    var int ItemIndex;
    var int ItemCount;
    var GFxObject GfxItemObject;

    structdefaultproperties
    {
        ItemDefinition=0
        ItemIndex=0
        ItemCount=0
        GfxItemObject=none
    }
};

var const localized string RecycleOneString;
var const localized string RecycleDuplicatesString;
var const localized string NoItemsString;
var const localized string InventoryPopulatingString;
var const localized string InventoryString;
var const localized string EquipString;
var const localized string UnequipString;
var const localized string UseString;
var const localized string RecycleString;
var const localized string CraftString;
var const localized string AllString;
var const localized string WeaponSkinString;
var const localized string CosmeticString;
var const localized string EmotesString;
var const localized string CraftingMatsString;
var const localized string ItemString;
var const localized string FiltersString;
var const localized string CraftWeaponString;
var const localized string CraftCosmeticString;
var const localized string CraftItemString;
var const localized string ConfirmCraftItemString;
var const localized string RecycleWarningString;
var const localized string RecycleItemString;
var const localized array<localized string> CraftWeaponStrings;
var const localized array<localized string> CraftCosmeticStrings;
var const localized string FailedToExchangeString;
var const localized string MoreItemsString;
var const localized string ItemExchangeTimeOutString;
var const localized string TryAgainString;
var const localized string FailedToCraftItemString;
var const localized string CraftRequirementString;
var const localized string CraftCosmeticDescriptionString;
var const localized string CraftWeaponDescriptionString;
var const localized string RequiresString;
var const localized string PurchaseKeyString;
var const localized string LookUpOnMarketString;
var GFxObject CraftingSubMenu;
var GFxObject ItemListContainer;
var GFxObject ItemDetailsContainer;
var GFxObject EquipButton;
var GFxObject CraftWeaponButton;
var GFxObject CraftCosmeticButton;
var OnlineSubsystem OnlineSub;
var PlayfabInterface PlayfabInter;
var KFPawn_Customization KFPH;
var bool bInitialInventoryPassComplete;
var int TempItemIdHolder;
var int UncommonCosmeticID;
var int RareCosmeticID;
var int ExceptionalCosmeticID;
var int MasterCosmeticID;
var int UncommonWeaponID;
var int RareWeaponID;
var int ExceptionalWeaponID;
var int MasterWeaponID;
var name SoundEvent_Common;
var name SoundEvent_Uncommon;
var name SoundEvent_Rare;
var name SoundEvent_Legendary;
var name SoundEvent_ExceedinglyRare;
var name SoundEvent_Mythical;
var name SoundThemeName;
var KFPlayerController KFPC;
var int ValueToPromptDuplicateRecycle;
var KFGFxMenu_Inventory.EINventory_Filter CurrentInventoryFilter;
var ExchangeRuleSets RuleToExchange;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeText();
    KFPC = KFPlayerController(Outer.GetPC());
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    PlayfabInter = Class'GameEngine'.static.GetPlayfabInterface();
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        PlayfabInter.AddInventoryReadCompleteDelegate(OnReadPlayfabInventoryComplete);        
    }
    else
    {
        OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
    }
    KFPH = KFPawn_Customization(KFPC.Pawn);
    CraftingSubMenu = GetObject("craftingPanelContainer");
    ItemDetailsContainer = GetObject("itemDetailsContainer");
    EquipButton = ItemDetailsContainer.GetObject("equipButton");
    UpdateCraftButtons();
}

function UpdateCraftButtons()
{
    ItemListContainer = GetObject("inventoryListContainer");
    if(ItemListContainer != none)
    {
        CraftWeaponButton = ItemListContainer.GetObject("craftWeaponsButton");
        if(CraftWeaponButton != none)
        {
            CraftWeaponButton.SetBool("enabled", Class'WorldInfo'.static.IsMenuLevel());
        }
        CraftCosmeticButton = ItemListContainer.GetObject("craftCosmeticsButton");
        if(CraftCosmeticButton != none)
        {
            CraftCosmeticButton.SetBool("enabled", Class'WorldInfo'.static.IsMenuLevel());
        }
    }
}

function OnOpen()
{
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        PlayfabInter.AddInventoryReadCompleteDelegate(OnReadPlayfabInventoryComplete);        
    }
    else
    {
        if(OnlineSub != none)
        {
            OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
        }
    }
    InitInventory();
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        Manager.ManagerObject.SetBool("backgroundVisible", false);
    }    
    KFPC.ConsoleCommand("CE Idle");
}

function OnClose()
{
    ClearMatinee();
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        PlayfabInter.ClearInventoryReadCompleteDelegate(OnReadPlayfabInventoryComplete);        
    }
    else
    {
        if(OnlineSub != none)
        {
            OnlineSub.ClearOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
        }
    }
    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        Manager.ManagerObject.SetBool("backgroundVisible", true);
    }
}

function InitInventory()
{
    local int I, ItemIndex, HelperIndex;
    local ItemProperties TempItemDetailsHolder;
    local GFxObject ItemArray, ItemObject;
    local bool bActiveItem;
    local array<InventoryHelper> ActiveItems;
    local InventoryHelper HelperItem;
    local array<ExchangeRuleSets> ExchangeRules;

    ItemArray = Outer.CreateArray();
    if(OnlineSub == none)
    {
        SetObject("inventoryList", ItemArray);
        return;
    }
    I = 0;
    J0x67:

    if(I < OnlineSub.CurrentInventory.Length)
    {
        ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', OnlineSub.CurrentInventory[I].Definition;
        if((ItemIndex != -1) && OnlineSub.CurrentInventory[I].Definition != 0)
        {
            TempItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
            if(((CurrentInventoryFilter == 0) || CurrentInventoryFilter == (TempItemDetailsHolder.Type + 1)) || bool(OnlineSub.CurrentInventory[I].NewlyAdded))
            {
                ItemObject = Outer.CreateObject("Object");
                HelperIndex = ActiveItems.Find('ItemDefinition', OnlineSub.CurrentInventory[I].Definition;
                if(HelperIndex == -1)
                {
                    HelperItem.ItemDefinition = OnlineSub.CurrentInventory[I].Definition;
                    HelperItem.ItemCount = OnlineSub.CurrentInventory[I].Quantity;
                    ActiveItems.AddItem(HelperItem;
                    HelperIndex = ActiveItems.Length - 1;                    
                }
                else
                {
                    ActiveItems[HelperIndex].ItemCount += OnlineSub.CurrentInventory[I].Quantity;
                }
                OnlineSub.IsExchangeable(OnlineSub.CurrentInventory[I].Definition, ExchangeRules);
                ItemObject.SetInt("count", ActiveItems[HelperIndex].ItemCount);
                ItemObject.SetString("label", TempItemDetailsHolder.Name);
                ItemObject.SetString("price", TempItemDetailsHolder.Price);
                ItemObject.SetString("typeRarity", TempItemDetailsHolder.ShortDescription);
                ItemObject.SetInt("type", TempItemDetailsHolder.Type);
                ItemObject.SetBool("exchangeable", (IsItemExchangeable(TempItemDetailsHolder, ExchangeRules)) && Class'WorldInfo'.static.IsMenuLevel());
                ItemObject.SetBool("recyclable", (IsItemRecyclable(TempItemDetailsHolder, ExchangeRules)) && Class'WorldInfo'.static.IsMenuLevel());
                bActiveItem = IsItemActive(OnlineSub.CurrentInventory[I].Definition);
                ItemObject.SetBool("active", bActiveItem);
                ItemObject.SetInt("rarity", TempItemDetailsHolder.Rarity);
                ItemObject.SetString("description", TempItemDetailsHolder.Description);
                ItemObject.SetString("iconURLSmall", "img://" $ TempItemDetailsHolder.IconURL);
                ItemObject.SetString("iconURLLarge", "img://" $ TempItemDetailsHolder.IconURLLarge);
                ItemObject.SetInt("definition", TempItemDetailsHolder.Definition);
                ItemObject.SetBool("newlyAdded", bool(OnlineSub.CurrentInventory[I].NewlyAdded));
                ActiveItems[HelperIndex].GfxItemObject = ItemObject;
                if(bool(OnlineSub.CurrentInventory[I].NewlyAdded) && bInitialInventoryPassComplete)
                {
                    SetMatineeColor(TempItemDetailsHolder.Rarity);                    
                    KFPC.ConsoleCommand("CE gotitem");
                    SetObject("details", ItemObject);
                }
            }
        }
        ++ I;
        goto J0x67;
    }
    OnlineSub.ClearNewlyAdded();
    I = 0;
    J0xA2C:

    if(I < ActiveItems.Length)
    {
        ItemArray.SetElementObject(I, ActiveItems[I].GfxItemObject);
        ++ I;
        goto J0xA2C;
    }
    SetObject("inventoryList", ItemArray);
    bInitialInventoryPassComplete = true;
}

function OnItemExhangeTimeOut()
{
    if(!Class'WorldInfo'.static.IsConsoleBuild())
    {
        Manager.DelayedOpenPopup(2, 0, ItemExchangeTimeOutString, TryAgainString, Class'KFCommon_LocalizedStrings'.default.OKString);
        SetVisible(true);
    }
}

function FinishCraft()
{
    SetVisible(true);
}

function SetMatineeColor(int ItemRarity)
{
    switch(ItemRarity)
    {
        case 0:            
            KFPC.ConsoleCommand("CE rarityCommon");
            break;
        case 1:            
            KFPC.ConsoleCommand("CE rarityUncommon");
            break;
        case 2:            
            KFPC.ConsoleCommand("CE rarityRare");
            break;
        case 4:            
            KFPC.ConsoleCommand("CE rarityMasterCrafted");
            break;
        case 5:            
            KFPC.ConsoleCommand("CE rarityPrecious");
            break;
        case 3:            
            KFPC.ConsoleCommand("CE rarityExceptional");
            break;
        default:            
            KFPC.ConsoleCommand("CE rarityCommon");
            break;
    }
}

function ClearMatinee()
{
    KFPC.ConsoleCommand("CE Abort");
    KFPC.ResetCustomizationCamera();
}

function OnReadPlayfabInventoryComplete(bool bSuccess)
{
    if(bSuccess)
    {
        LocalizeText();
        InitInventory();
    }
}

function OnInventoryReadComplete()
{
    InitInventory();
}

function bool IsItemRecyclable(ItemProperties ItemDetailsHolder, const out array<ExchangeRuleSets> ExchangeRules)
{
    local int RequireRulesToRecycle;

    RequireRulesToRecycle = ((Class'WorldInfo'.static.IsConsoleBuild()) ? 1 : 2);
    return ((ExchangeRules.Length > 0) && ((ItemDetailsHolder.Type == 0) || ItemDetailsHolder.Type == 1) || ItemDetailsHolder.Type == 5) || (ItemDetailsHolder.Type == 2) && ExchangeRules.Length == RequireRulesToRecycle;
}

function bool IsItemExchangeable(out ItemProperties ItemDetailsHolder, const out array<ExchangeRuleSets> ExchangeRules)
{
    return ((ExchangeRules.Length > 0) || ItemDetailsHolder.RequiredKeyId != "") && ItemDetailsHolder.Type == 2;
}

function bool IsItemActive(int ItemDefinition)
{
    local class<KFWeaponDefinition> WeaponDef;
    local int ItemIndex;

    ItemIndex = Class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition;
    if(ItemIndex == -1)
    {
        return false;
    }
    WeaponDef = Class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;
    if(WeaponDef != none)
    {
        return Class'KFWeaponSkinList'.static.IsSkinEquip(WeaponDef, ItemDefinition);
    }
    return false;
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("noItems", ((KFGameEngine(Class'Engine'.static.GetEngine()).bReadingPlayfabStoreData) ? InventoryPopulatingString : NoItemsString));
    LocalizedObject.SetString("inventory", InventoryString);
    LocalizedObject.SetString("back", Class'KFCommon_LocalizedStrings'.default.BackString);
    LocalizedObject.SetString("ok", Class'KFCommon_LocalizedStrings'.default.OKString);
    LocalizedObject.SetString("equip", EquipString);
    LocalizedObject.SetString("unequip", UnequipString);
    LocalizedObject.SetString("useString", UseString);
    LocalizedObject.SetString("recycle", RecycleString);
    LocalizedObject.SetString("all", AllString);
    LocalizedObject.SetString("weaponSkins", WeaponSkinString);
    LocalizedObject.SetString("cosmetics", CosmeticString);
    LocalizedObject.SetString("emotes", EmotesString);
    LocalizedObject.SetString("craftingMats", CraftingMatsString);
    LocalizedObject.SetString("items", ItemString);
    LocalizedObject.SetString("filters", FiltersString);
    LocalizedObject.SetString("craftWeapon", CraftWeaponString);
    LocalizedObject.SetString("craftCosmetic", CraftCosmeticString);
    SetObject("localizedText", LocalizedObject);
}

function SetWeaponCraftDetails()
{
    local GFxObject CraftOptionsObject;
    local ItemProperties CommonItemDetailsHolder, RareItemDetailsHolder, ExceptionalItemDetailsHolder, MasterItemDetailsHolder;
    local int ItemIndex, I;
    local array<ItemProperties> ItemArray;

    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', UncommonWeaponID;
    if(ItemIndex != -1)
    {
        CommonItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(CommonItemDetailsHolder;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', RareWeaponID;
    if(ItemIndex != -1)
    {
        RareItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(RareItemDetailsHolder;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', ExceptionalWeaponID;
    if(ItemIndex != -1)
    {
        ExceptionalItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(ExceptionalItemDetailsHolder;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', MasterWeaponID;
    if(ItemIndex != -1)
    {
        MasterItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(MasterItemDetailsHolder;
    }
    CraftOptionsObject = Outer.CreateObject("Object");
    CraftOptionsObject.SetString("title", CraftWeaponString);
    CraftOptionsObject.SetString("description", CraftWeaponDescriptionString);
    CraftOptionsObject.SetString("craft", CraftString);
    I = 0;
    J0x338:

    if(I < ItemArray.Length)
    {
        CraftOptionsObject.SetString("label_" $ string(I), CraftWeaponStrings[I]);
        CraftOptionsObject.SetString("requirement_" $ string(I), (RequiresString $ "10") @ ItemArray[I].Name);
        CraftOptionsObject.SetInt("itemCount_" $ string(I), GetCountOfItem(ItemArray[I].Definition));
        CraftOptionsObject.SetString("itemImage_" $ string(I), "img://" $ ItemArray[I].IconURL);
        CraftOptionsObject.SetInt("itemID_" $ string(I), ItemArray[I].Definition);
        ++ I;
        goto J0x338;
    }
    SetObject("craftOptions", CraftOptionsObject);
}

function SetCosmeticCraftDetails()
{
    local GFxObject CraftOptionsObject;
    local ItemProperties CommonItemDetailsHolder, RareItemDetailsHolder, ExceptionalItemDetailsHolder, MasterItemDetailsHolder;
    local int ItemIndex, I;
    local array<ItemProperties> ItemArray;

    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', UncommonCosmeticID;
    if(ItemIndex != -1)
    {
        CommonItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(CommonItemDetailsHolder;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', RareCosmeticID;
    if(ItemIndex != -1)
    {
        RareItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(RareItemDetailsHolder;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', ExceptionalCosmeticID;
    if(ItemIndex != -1)
    {
        ExceptionalItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(ExceptionalItemDetailsHolder;
    }
    ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', MasterCosmeticID;
    if(ItemIndex != -1)
    {
        MasterItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
        ItemArray.AddItem(MasterItemDetailsHolder;
    }
    CraftOptionsObject = Outer.CreateObject("Object");
    CraftOptionsObject.SetString("title", CraftCosmeticString);
    CraftOptionsObject.SetString("description", CraftCosmeticDescriptionString);
    CraftOptionsObject.SetString("craft", CraftString);
    I = 0;
    J0x338:

    if(I < ItemArray.Length)
    {
        CraftOptionsObject.SetString("label_" $ string(I), CraftCosmeticStrings[I]);
        CraftOptionsObject.SetString("requirement_" $ string(I), (RequiresString $ "10") @ ItemArray[I].Name);
        CraftOptionsObject.SetInt("itemCount_" $ string(I), GetCountOfItem(ItemArray[I].Definition));
        CraftOptionsObject.SetString("itemImage_" $ string(I), "img://" $ ItemArray[I].IconURL);
        CraftOptionsObject.SetInt("itemID_" $ string(I), ItemArray[I].Definition);
        ++ I;
        goto J0x338;
    }
    SetObject("craftOptions", CraftOptionsObject);
}

function int GetCountOfItem(int ItemDefinition)
{
    local int I, Count;

    I = 0;
    J0x0B:

    if(I < OnlineSub.CurrentInventory.Length)
    {
        if(OnlineSub.CurrentInventory[I].Definition == ItemDefinition)
        {
            Count += OnlineSub.CurrentInventory[I].Quantity;
        }
        ++ I;
        goto J0x0B;
    }
    return Count;
}

function OnPlayfabExchangeComplete(bool bWasSuccessful, string FunctionName, JsonObject FunctionResult)
{
    if(FunctionName == "ExchangeItems")
    {
        if(bWasSuccessful)
        {
            PlayfabInter.ReadInventory();            
        }
        else
        {
            Manager.DelayedOpenPopup(2, 0, ItemExchangeTimeOutString, TryAgainString, Class'KFCommon_LocalizedStrings'.default.OKString);
            SetVisible(true);
        }
    }
    PlayfabInter.ClearOnCloudScriptExecutionCompleteDelegate(OnPlayfabExchangeComplete);
}

function PerformExchange(ExchangeRuleSets ForRuleset, optional int NumBatches)
{
    local JsonObject Parms, ItemObj, ItemsObj;
    local int I;

    NumBatches = 1;
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        Parms = new Class'JsonObject';
        Parms.SetStringValue("RequestedItem", string(ForRuleset.Target));
        ItemsObj = new Class'JsonObject';
        Parms.SetObject("ExchangeData", ItemsObj);
        Parms.SetIntValue("NumBatches", NumBatches);
        I = 0;
        J0x119:

        if(I < ForRuleset.Sources.Length)
        {
            ItemObj = new Class'JsonObject';
            ItemObj.SetStringValue("ItemID", string(ForRuleset.Sources[I].Definition));
            ItemObj.SetIntValue("Count", ForRuleset.Sources[I].Quantity);
            ItemsObj.ObjectArray.AddItem(ItemObj;
            ++ I;
            goto J0x119;
        }
        PlayfabInter.AddOnCloudScriptExecutionCompleteDelegate(OnPlayfabExchangeComplete);
        PlayfabInter.ExecuteCloudScript("ExchangeItems", Parms);        
    }
    else
    {
        OnlineSub.Exchange(ForRuleset);
    }
}

function ConfirmRecycle()
{
    local array<ExchangeRuleSets> ExchangeRules;
    local int RuleIndex;

    OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);
    RuleIndex = 0;
    J0x3C:

    if(RuleIndex < ExchangeRules.Length)
    {
        if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]) && ExchangeRules[RuleIndex].Sources.Length == 1)
        {
            OnlineSub.ClearInFlight();
            PerformExchange(ExchangeRules[RuleIndex]);
            SetVisible(false);            
            KFPC.ConsoleCommand("CE Recycle_Start");
            return;
        }
        ++ RuleIndex;
        goto J0x3C;
    }
}

function ExchangeDuplicatesEx()
{
    if(OnlineSub.ExchangeDuplicates(RuleToExchange, 10) > 0)
    {
        KFPC.SetTimer(0.1, false, 'ExchangeDuplicatesEx', self);
    }
}

function ConfirmDuplicatesRecycle()
{
    local array<ExchangeRuleSets> ExchangeRules;
    local int RuleIndex;

    OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);
    RuleIndex = 0;
    J0x3C:

    if(RuleIndex < ExchangeRules.Length)
    {
        if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]) && ExchangeRules[RuleIndex].Sources.Length == 1)
        {
            RuleToExchange = ExchangeRules[RuleIndex];
            OnlineSub.ClearInFlight();
            if(Class'WorldInfo'.static.IsConsoleBuild())
            {
                PerformExchange(RuleToExchange, 10);                
            }
            else
            {
                KFPC.SetTimer(0.1, false, 'ExchangeDuplicatesEx', self);
            }
            SetVisible(false);            
            KFPC.ConsoleCommand("CE Recycle_Start");
            return;
        }
        ++ RuleIndex;
        goto J0x3C;
    }
}

function CancelRecycle()
{
    TempItemIdHolder = -1;
}

function ConfirmCraft()
{
    local array<ExchangeRuleSets> ExchangeRules;
    local int RuleIndex;

    OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);
    RuleIndex = 0;
    J0x3C:

    if(RuleIndex < ExchangeRules.Length)
    {
        if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]))
        {
            PerformExchange(ExchangeRules[RuleIndex]);
            SetVisible(false);            
            KFPC.ConsoleCommand("CE Craft_Start");
            return;
        }
        ++ RuleIndex;
        goto J0x3C;
    }
    LogInternal("CRAFTING == SAD");
}

function int GetItemCount(int ItemDefinition)
{
    local int I, ItemCount;

    if(OnlineSub == none)
    {
        return 0;
    }
    I = 0;
    J0x1C:

    if(I < OnlineSub.CurrentInventory.Length)
    {
        if(OnlineSub.CurrentInventory[I].Definition != ItemDefinition)
        {            
        }
        else
        {
            ItemCount += OnlineSub.CurrentInventory[I].Quantity;
        }
        ++ I;
        goto J0x1C;
    }
    return ItemCount;
}

function Callback_CrateOpenComplete(int Rarity)
{
    local name EventName;

    switch(Rarity)
    {
        case 0:
            EventName = SoundEvent_Common;
            break;
        case 1:
            EventName = SoundEvent_Uncommon;
            break;
        case 2:
            EventName = SoundEvent_Rare;
            break;
        case 4:
            EventName = SoundEvent_Legendary;
            break;
        case 5:
            EventName = SoundEvent_ExceedinglyRare;
            break;
        case 3:
            EventName = SoundEvent_Mythical;
            break;
        default:
            EventName = SoundEvent_Common;
            break;
    }
    Manager.PlaySoundFromTheme(EventName, SoundThemeName);
}

function Callback_RequestInitialnventory()
{
    InitInventory();
}

function Callback_InventoryFilter(int FilterIndex)
{
    local KFGFxMenu_Inventory.EINventory_Filter NewFilter;

    switch(FilterIndex)
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
            NewFilter = 6;
            break;
        case 5:
            NewFilter = 5;
            break;
        default:
            break;
    }
    if(NewFilter != CurrentInventoryFilter)
    {
        CurrentInventoryFilter = NewFilter;
        InitInventory();
    }
}

function Callback_Equip(int ItemDefinition)
{
    local class<KFWeaponDefinition> WeaponDef;
    local int ItemIndex;

    ItemIndex = Class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition;
    if(ItemIndex == -1)
    {
        return;
    }
    WeaponDef = Class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;
    if(WeaponDef != none)
    {
        if(IsItemActive(ItemDefinition))
        {
            Class'KFWeaponSkinList'.static.SaveWeaponSkin(WeaponDef, 0);
            if(Class'WorldInfo'.static.IsConsoleBuild())
            {
                Manager.CachedProfile.ClearWeaponSkin(WeaponDef.default.WeaponClassPath);
            }            
        }
        else
        {
            Class'KFWeaponSkinList'.static.SaveWeaponSkin(WeaponDef, ItemDefinition);
            if(Class'WorldInfo'.static.IsConsoleBuild())
            {
                Manager.CachedProfile.SaveWeaponSkin(WeaponDef.default.WeaponClassPath, ItemDefinition);
            }
        }
    }
    InitInventory();
}

function CallBack_ItemDetailsClicked(int ItemDefinition)
{
    local array<ExchangeRuleSets> ExchangeRules;
    local ItemProperties NeededItem, CurrItem;
    local int NeededItemID;

    CurrItem = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', ItemDefinition];
    if(CurrItem.RequiredKeyId != "")
    {
        OnlineSub.HasKeyForItem(ItemDefinition, NeededItemID);        
    }
    else
    {
        OnlineSub.IsExchangeable(ItemDefinition, ExchangeRules);
        if(ExchangeRules.Length <= 0)
        {
            LogInternal("NO RULES EXIST FOR THIS ITEM!" @ string(ItemDefinition));
            return;
        }
        if(!OnlineSub.ExchangeReady(ExchangeRules[0]))
        {
            if(ExchangeRules[0].Sources[0].Definition == ItemDefinition)
            {
                NeededItemID = ExchangeRules[0].Sources[1].Definition;                
            }
            else
            {
                NeededItemID = ExchangeRules[0].Sources[0].Definition;
            }
        }
    }
    if(NeededItemID > 0)
    {
        NeededItem = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', NeededItemID];
        if(NeededItem.Price == "")
        {
            EquipButton.SetString("label", LookUpOnMarketString);            
        }
        else
        {
            EquipButton.SetString("label", PurchaseKeyString @ ((Class'WorldInfo'.static.IsConsoleBuild()) ? "" : ":" @ NeededItem.Price));
        }
    }
}

function Callback_UseItem(int ItemDefinition)
{
    local array<ExchangeRuleSets> ExchangeRules;
    local string ItemSeriesCommand;
    local ItemProperties NeededItem, CurrItem;
    local int NeededItemID;
    local bool bExchangeFound;
    local int RuleIndex;

    TempItemIdHolder = ItemDefinition;
    CurrItem = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', ItemDefinition];
    if(CurrItem.RequiredKeyId != "")
    {
        if(OnlineSub.HasKeyForItem(ItemDefinition, NeededItemID))
        {
            PlayfabInter.UnlockContainer(string(ItemDefinition));
            SetVisible(false);
            ItemSeriesCommand = "CE open_" $ string(Class'KFInventoryCatalog'.static.GetItemSeries(ItemDefinition));            
            KFPC.ConsoleCommand(ItemSeriesCommand);
        }        
    }
    else
    {
        OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);
        RuleIndex = 0;
        J0x1AD:

        if(RuleIndex < ExchangeRules.Length)
        {
            if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]) && ExchangeRules[RuleIndex].Sources.Length == 2)
            {
                PerformExchange(ExchangeRules[RuleIndex]);
                SetVisible(false);
                ItemSeriesCommand = "CE open_" $ string(Class'KFInventoryCatalog'.static.GetItemSeries(ItemDefinition));                
                KFPC.ConsoleCommand(ItemSeriesCommand);
                bExchangeFound = true;
            }
            ++ RuleIndex;
            goto J0x1AD;
        }
        if(!bExchangeFound)
        {
            RuleIndex = 0;
            J0x2F9:

            if(RuleIndex < ExchangeRules.Length)
            {
                if(ExchangeRules[RuleIndex].Sources.Length == 2)
                {
                    if(ExchangeRules[RuleIndex].Sources[0].Definition == ItemDefinition)
                    {
                        NeededItemID = ExchangeRules[RuleIndex].Sources[1].Definition;                        
                    }
                    else
                    {
                        NeededItemID = ExchangeRules[RuleIndex].Sources[0].Definition;
                    }
                    goto J0x426;
                }
                ++ RuleIndex;
                goto J0x2F9;
            }
        }
    }
    J0x426:

    if(NeededItemID > 0)
    {
        NeededItem = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', NeededItemID];
        if((NeededItem.Price == "") || NeededItem.SignedOfferId != "")
        {
            if(Class'WorldInfo'.static.IsConsoleBuild(9))
            {
                OnlineSub.PlayerInterfaceEx.ShowProductDetailsUI(byte(Outer.GetLP().ControllerId), NeededItem.ProductID);                
            }
            else
            {
                OnlineSub.OpenMarketPlaceSearch(NeededItem);
            }            
        }
        else
        {
            OnlineSub.OpenItemPurchaseOverlay(NeededItemID);
        }
    }
}

function Callback_CharacterSkin(int ItemDefinition);

function Callback_RecycleItem(int ItemDefinition)
{
    local int MatchingItemCount;

    TempItemIdHolder = ItemDefinition;
    MatchingItemCount = GetItemCount(ItemDefinition);
    if(MatchingItemCount >= ValueToPromptDuplicateRecycle)
    {
        Manager.DelayedOpenPopup(0, 0, RecycleItemString, RecycleWarningString, RecycleDuplicatesString, Class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmDuplicatesRecycle, CancelRecycle, RecycleOneString, ConfirmRecycle);        
    }
    else
    {
        Manager.DelayedOpenPopup(0, 0, RecycleItemString, RecycleWarningString, Class'KFCommon_LocalizedStrings'.default.ConfirmString, Class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmRecycle);
    }
}

function Callback_CraftOption(int ItemDefinition)
{
    local array<ExchangeRuleSets> ExchangeRules;
    local int RuleIndex;

    TempItemIdHolder = ItemDefinition;
    OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);
    RuleIndex = 0;
    J0x4F:

    if(RuleIndex < ExchangeRules.Length)
    {
        if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]))
        {
            Manager.DelayedOpenPopup(0, 0, CraftItemString, ConfirmCraftItemString, Class'KFCommon_LocalizedStrings'.default.ConfirmString, Class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmCraft);
            return;
        }
        ++ RuleIndex;
        goto J0x4F;
    }
    Manager.DelayedOpenPopup(2, 0, FailedToCraftItemString, CraftRequirementString, Class'KFCommon_LocalizedStrings'.default.OKString);
}

function CallBack_RequestCosmeticCraftInfo()
{
    SetCosmeticCraftDetails();
}

function CallBack_RequestWeaponCraftInfo()
{
    SetWeaponCraftDetails();
}

function Callback_PreviewItem(int ItemDefinition)
{
    if(KFPH != none)
    {
    }
}

defaultproperties
{
    RecycleOneString="RECYCLE ONE"
    RecycleDuplicatesString="RECYCLE DUPLICATES"
    NoItemsString="You have no Inventory items within the currently selected filter."
    InventoryPopulatingString="Please wait. Inventory is populating."
    InventoryString="INVENTORY"
    EquipString="EQUIP"
    UnequipString="UNEQUIP"
    UseString="USE"
    RecycleString="RECYCLE"
    CraftString="CRAFT"
    AllString="All"
    WeaponSkinString="Weapon Skins"
    CosmeticString="Cosmetics"
    EmotesString="Emotes"
    CraftingMatsString="Crafting"
    ItemString="Items"
    FiltersString="FILTERS"
    CraftWeaponString="CRAFT WEAPON SKIN"
    CraftCosmeticString="CRAFT COSMETIC"
    CraftItemString="Confirm Craft Item?"
    ConfirmCraftItemString="Crafting this item will use resources and cannot be undone."
    RecycleWarningString="Warning, this cannot be undone. This will destroy the selected item and replace it with a crafting material item."
    RecycleItemString="Recycle Item?"
    CraftWeaponStrings(0)="Uncommon
Weapon Skin"
    CraftWeaponStrings(1)="Rare
Weapon Skin"
    CraftWeaponStrings(2)="Exceptional
Weapon Skin"
    CraftWeaponStrings(3)="Master Crafted
Weapon Skin"
    CraftCosmeticStrings(0)="Uncommon
Cosmetic"
    CraftCosmeticStrings(1)="Rare
Cosmetic"
    CraftCosmeticStrings(2)="Exceptional
Cosmetic"
    CraftCosmeticStrings(3)="Master Crafted
Cosmetic"
    FailedToExchangeString="CANNOT OPEN CRATE"
    MoreItemsString="You require a matching key and crate. You can purchase a key from the in game store."
    ItemExchangeTimeOutString="Failed to Reach Item Server"
    TryAgainString="Client failed to exchange item. Please try again later. If this issue persists, contact support."
    FailedToCraftItemString="Failed to Craft Item"
    CraftRequirementString="Insufficient quantity of required crafting materials"
    CraftCosmeticDescriptionString="You can craft new cosmetic items from this menu out of cosmetic material. You can obtain cosmetic material by recycling existing cosmetic items. To recycle, select an item and press recycle."
    CraftWeaponDescriptionString="You can craft new weapon skin items from this menu out of weapon skin material. You can obtain weapon skin material by recycling existing weapon skin items. To recycle, select an item and press recycle."
    RequiresString="Requires: "
    PurchaseKeyString="BUY KEY"
    LookUpOnMarketString="Lookup on Market"
    UncommonCosmeticID=3708
    RareCosmeticID=3709
    ExceptionalCosmeticID=3710
    MasterCosmeticID=3711
    UncommonWeaponID=3712
    RareWeaponID=3713
    ExceptionalWeaponID=3714
    MasterWeaponID=3715
    SoundEvent_Common=Crate_End_Common
    SoundEvent_Uncommon=Crate_End_Uncommon
    SoundEvent_Rare=Crate_End_Rare
    SoundEvent_Legendary=Crate_End_Lengendary
    SoundEvent_ExceedinglyRare=Crate_End_ExeedinglyRare
    SoundEvent_Mythical=Crate_End_Mythical
    SoundThemeName=SoundTheme_Crate
    ValueToPromptDuplicateRecycle=3
}