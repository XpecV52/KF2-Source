//=============================================================================
// KFGFxMenu_Inventory
//=============================================================================
// This menu is used to show the player's inventory and crafting.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Zane Gholson -  09/30/2015
//=============================================================================

class KFGFxMenu_Inventory extends KFGFxObject_Menu;

var localized string RecycleOneString;
var localized string RecycleDuplicatesString;

var localized string InventoryString;
var localized string EquipString;
var localized string UnequipString;
var localized string UseString;
var localized string RecycleString;
var localized string CraftString;

var localized string AllString;
var localized string WeaponSkinString;
var localized string CosmeticString;
var localized string CraftingMatsString;
var localized string ItemString;
var localized string FiltersString;
var localized string CraftWeaponString;
var localized string CraftCosmeticString;
var localized string CraftItemString;
var localized string ConfirmCraftItemString;
var localized string RecycleWarningString;
var localized string RecycleItemString;
var localized array<string> CraftWeaponStrings;
var localized array<string> CraftCosmeticStrings;


var localized string FailedToExchangeString;
var localized string MoreItemsString;

var localized string FailedToCraftItemString;
var localized string CraftRequirementString;

var localized string CraftCosmeticDescriptionString;
var localized string CraftWeaponDescriptionString;
var localized string RequiresString;

var localized string PurchaseKeyString;
var localized string LookUpOnMarketString;

var GFxObject CraftingSubMenu;
var GFxObject ItemListContainer;
var GFxObject ItemDetailsContainer;
var GFxObject EquipButton; //item deatils container
var GFxObject CraftWeaponButton;
var GFxObject CraftCosmeticButton;


var OnlineSubsystem OnlineSub;
var KFPawn_Customization KFPH;
var bool bInitialInventoryPassComplete;
var int TempItemIdHolder; //used to cache id when crafting / recycling (pop ups)

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

enum EINventory_Filter
{
	EInv_All,
	EInv_WeaponSkins,
	EInv_Cosmetics,
	EInv_Consumables,
	EInv_CraftingMats,
};

struct InventoryHelper
{
	var int ItemDefinition;
	var int ItemIndex;
	var int ItemCount;
	var GFxObject GfxItemObject;
};

var EINventory_Filter CurrentInventoryFilter;

var ExchangeRuleSets RuleToExchange;


function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu( InManager );
	LocalizeText();

	KFPC = KFPlayerController(GetPC());

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);

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
			CraftWeaponButton.SetBool("enabled", class'WorldInfo'.static.IsMenuLevel());
		}
		CraftCosmeticButton = ItemListContainer.GetObject("craftCosmeticsButton");
		if(CraftCosmeticButton != none)
		{
			CraftCosmeticButton.SetBool("enabled", class'WorldInfo'.static.IsMenuLevel());
		}
	}
}

function OnOpen()
{
	if(OnlineSub != none)
	{
		OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
	}
	
	InitInventory();
	if ( class'WorldInfo'.static.IsMenuLevel() )
	{
		Manager.ManagerObject.SetBool("backgroundVisible", false);
	}

	KFPC.ConsoleCommand("CE Idle");
}

function OnClose()
{
	ClearMatinee();

	if(OnlineSub != none)
	{
		OnlineSub.ClearOnInventoryReadCompleteDelegate(OnInventoryReadComplete);
	}
		
	if ( class'WorldInfo'.static.IsMenuLevel() )
	{
		Manager.ManagerObject.SetBool("backgroundVisible", true);
	}
}

function InitInventory()
{
	local int i, ItemIndex, HelperIndex;
	local ItemProperties TempItemDetailsHolder;
	local GFxObject ItemArray, ItemObject;
	local bool bActiveItem;
	local array<InventoryHelper> ActiveItems;
	local InventoryHelper HelperItem;
	local array<ExchangeRuleSets> ExchangeRules;
	
	ItemArray = CreateArray();

	if(OnlineSub == none)
	{
		// If there is no OnlineSubsystem just send an empty array.  HSL_BB
		SetObject("inventoryList", ItemArray);
		return;
	}

	for (i = 0; i < OnlineSub.CurrentInventory.length; i++)
	{
		//look item up to get info on it.
		ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', OnlineSub.CurrentInventory[i].Definition);

		if(ItemIndex != INDEX_NONE)
		{
			TempItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
			if(CurrentInventoryFilter == EInv_All || int(CurrentInventoryFilter) == int(TempItemDetailsHolder.Type) + 1 || bool(OnlineSub.CurrentInventory[i].NewlyAdded)) //offset
			{
				ItemObject = CreateObject("Object");
				HelperIndex = ActiveItems.Find('ItemDefinition', onlineSub.CurrentInventory[i].Definition);

				if(HelperIndex == INDEX_NONE)
				{
					HelperItem.ItemDefinition = onlineSub.CurrentInventory[i].Definition;
					HelperItem.ItemCount = onlineSub.CurrentInventory[i].Quantity;
					ActiveItems.AddItem(HelperItem);
					HelperIndex = ActiveItems.length - 1;
				}
				else
				{
					ActiveItems[HelperIndex].ItemCount += onlineSub.CurrentInventory[i].Quantity;
				}

				OnlineSub.IsExchangeable(onlineSub.CurrentInventory[i].Definition, ExchangeRules);
				
				ItemObject.SetInt("count", ActiveItems[HelperIndex].ItemCount);
				ItemObject.SetString("label", TempItemDetailsHolder.Name);
				ItemObject.SetString("price", TempItemDetailsHolder.price);
				ItemObject.Setstring("typeRarity", TempItemDetailsHolder.ShortDescription);
				ItemObject.SetInt("type", TempItemDetailsHolder.Type);
				ItemObject.SetBool("exchangeable", ExchangeRules.length > 0 && (TempItemDetailsHolder.Type == ITP_KeyCrate) && class'WorldInfo'.static.IsMenuLevel() );
				ItemObject.SetBool("recyclable", IsItemRecyclable(TempItemDetailsHolder, ExchangeRules) && class'WorldInfo'.static.IsMenuLevel());
				bActiveItem = IsItemActive(onlineSub.CurrentInventory[i].Definition);
				ItemObject.SetBool("active", bActiveItem );
				ItemObject.SetInt("rarity", TempItemDetailsHolder.Rarity);
				ItemObject.SetString("description", TempItemDetailsHolder.Description);
				ItemObject.SetString("iconURLSmall", "img://"$TempItemDetailsHolder.IconURL);
				ItemObject.SetString("iconURLLarge", "img://"$TempItemDetailsHolder.IconURLLarge);
				ItemObject.SetInt("definition", TempItemDetailsHolder.Definition);
				
				ActiveItems[HelperIndex].GfxItemObject = ItemObject;

				if(bool(OnlineSub.CurrentInventory[i].NewlyAdded) && bInitialInventoryPassComplete)
				{
					SetMatineeColor(TempItemDetailsHolder.Rarity);
					KFPC.ConsoleCommand("CE gotitem");
					SetObject("details", ItemObject);
				}
			}
		}
	}

	OnlineSub.ClearNewlyAdded();

	for (i = 0; i < ActiveItems.length; i++)
	{
		ItemArray.SetElementObject(i, ActiveItems[i].GfxItemObject);
	}

	SetObject("inventoryList", ItemArray);

	bInitialInventoryPassComplete = true;
}

function FinishCraft()
{
	SetVisible(true);
}

function SetMatineeColor(int ItemRarity)
{
	switch (ItemRarity)
	{
		case ITR_Common:
			KFPC.ConsoleCommand("CE rarityCommon");
			break;
	
		case ITR_Uncommon:
			KFPC.ConsoleCommand("CE rarityUncommon");
			break;
		case ITR_Rare:
			KFPC.ConsoleCommand("CE rarityRare");
			break;		
		case ITR_Legendary:
			KFPC.ConsoleCommand("CE rarityMasterCrafted");
			break;		
		case ITR_ExceedinglyRare:
			KFPC.ConsoleCommand("CE rarityPrecious");
			break;		
		case ITR_Mythical:
			KFPC.ConsoleCommand("CE rarityExceptional");
			break;		
		default:
			KFPC.ConsoleCommand("CE rarityCommon");
	}
}

function ClearMatinee()
{
	KFPC.ConsoleCommand("CE Abort");
	KFPC.ResetCustomizationCamera();
}

function OnInventoryReadComplete()
{
	InitInventory();
}

function bool IsItemRecyclable( ItemProperties ItemDetailsHolder, out const array<ExchangeRuleSets> ExchangeRules )
{
	return (ExchangeRules.length > 0 && (ItemDetailsHolder.Type == ITP_WeaponSkin || ItemDetailsHolder.Type == ITP_CharacterSkin) );
}

function bool IsItemActive(int ItemDefinition)
{
	local class<KFWeaponDefinition> WeaponDef;
	local int ItemIndex;

	ItemIndex = class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition);

	if(ItemIndex == INDEX_NONE)
	{
		return false;
	}

	WeaponDef = class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;

	if(WeaponDef != none)
	{
		return class'KFWeaponSkinList'.Static.IsSkinEquip(WeaponDef, ItemDefinition);
	}


	return false;
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	
	LocalizedObject.SetString("inventory", 					InventoryString); 
	LocalizedObject.SetString("back", 						Class'KFCommon_LocalizedStrings'.default.BackString); 
	LocalizedObject.SetString("ok", 						Class'KFCommon_LocalizedStrings'.default.OKString); 
	LocalizedObject.SetString("equip", 						EquipString); 
	LocalizedObject.SetString("unequip", 					UnequipString); 
	LocalizedObject.SetString("useString", 					UseString); 
	LocalizedObject.SetString("recycle", 					RecycleString); 

	LocalizedObject.SetString("all", 						AllString); 
	LocalizedObject.SetString("weaponSkins", 				WeaponSkinString); 
	LocalizedObject.SetString("cosmetics", 					CosmeticString); 
	LocalizedObject.SetString("craftingMats", 				CraftingMatsString); 
	LocalizedObject.SetString("items", 						ItemString); 
	LocalizedObject.SetString("filters", 					FiltersString); 

	LocalizedObject.SetString("craftWeapon", 				CraftWeaponString); 
	LocalizedObject.SetString("craftCosmetic", 				CraftCosmeticString); 	

	SetObject("localizedText", LocalizedObject);
}

function SetWeaponCraftDetails()
{
	local GFxObject CraftOptionsObject;
	local ItemProperties CommonItemDetailsHolder, RareItemDetailsHolder, ExceptionalItemDetailsHolder, MasterItemDetailsHolder;
	local int ItemIndex, i;
	local array<ItemProperties> ItemArray;

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', UncommonWeaponID);
	if(ItemIndex != INDEX_NONE)
	{
		CommonItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(CommonItemDetailsHolder);
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', RareWeaponID);
	if(ItemIndex != INDEX_NONE)
	{
		RareItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(RareItemDetailsHolder);
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', ExceptionalWeaponID);
	if(ItemIndex != INDEX_NONE)
	{
		ExceptionalItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(ExceptionalItemDetailsHolder);
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', MasterWeaponID);
	if(ItemIndex != INDEX_NONE)
	{
		MasterItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(MasterItemDetailsHolder);
	}

	CraftOptionsObject = CreateObject("Object");
	CraftOptionsObject.SetString("title", 				CraftWeaponString); 
	CraftOptionsObject.SetString("description", 		CraftWeaponDescriptionString); 		
	CraftOptionsObject.SetString("craft", 				CraftString);

	for (i = 0; i < ItemArray.length; i++)
	{
		CraftOptionsObject.SetString("label_"$i, 			CraftWeaponStrings[i]); 
		CraftOptionsObject.SetString("requirement_"$i,		RequiresString$"10"@ItemArray[i].Name); 
		CraftOptionsObject.SetInt("itemCount_"$i, 			GetCountOfItem(ItemArray[i].Definition)); 	
		CraftOptionsObject.SetString("itemImage_"$i, 		"img://"$ItemArray[i].IconURL); 	
		CraftOptionsObject.SetInt("itemID_"$i, 				ItemArray[i].Definition); 	
	}

	SetObject("craftOptions", CraftOptionsObject);
}

function SetCosmeticCraftDetails()
{

	local GFxObject CraftOptionsObject;
	local ItemProperties CommonItemDetailsHolder, RareItemDetailsHolder, ExceptionalItemDetailsHolder, MasterItemDetailsHolder;
	local int ItemIndex, i;
	local array<ItemProperties> ItemArray;

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', UncommonCosmeticID);
	if(ItemIndex != INDEX_NONE)
	{
		CommonItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(CommonItemDetailsHolder);
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', RareCosmeticID);
	if(ItemIndex != INDEX_NONE)
	{
		RareItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(RareItemDetailsHolder);
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', ExceptionalCosmeticID);
	if(ItemIndex != INDEX_NONE)
	{
		ExceptionalItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(ExceptionalItemDetailsHolder);
	}

	ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', MasterCosmeticID);
	if(ItemIndex != INDEX_NONE)
	{
		MasterItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
		ItemArray.AddItem(MasterItemDetailsHolder);
	}

	CraftOptionsObject = CreateObject("Object");
	CraftOptionsObject.SetString("title", 				CraftCosmeticString); 	
	CraftOptionsObject.SetString("description", 		CraftCosmeticDescriptionString); 	
	CraftOptionsObject.SetString("craft", 				CraftString);

	for (i = 0; i < ItemArray.length; i++)
	{
		CraftOptionsObject.SetString("label_"$i, 			CraftCosmeticStrings[i]); 
		CraftOptionsObject.SetString("requirement_"$i,		RequiresString$"10"@ItemArray[i].Name); 
		CraftOptionsObject.SetInt("itemCount_"$i, 			GetCountOfItem(ItemArray[i].Definition)); 	
		CraftOptionsObject.SetString("itemImage_"$i, 		"img://"$ItemArray[i].IconURL); 	
		CraftOptionsObject.SetInt("itemID_"$i, 				ItemArray[i].Definition); 	
	}

	SetObject("craftOptions", CraftOptionsObject);
}

function int GetCountOfItem(int ItemDefinition)
{
	local int i;
	local int Count;

	for (i = 0; i < onlineSub.CurrentInventory.length; i++)
	{
		if( onlineSub.CurrentInventory[i].Definition == ItemDefinition)
		{
			count += onlineSub.CurrentInventory[i].Quantity;
		}
	}

	return count;
}

function ConfirmRecycle()
{
	local array<ExchangeRuleSets> ExchangeRules;

	OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);

	if(OnlineSub.ExchangeReady(ExchangeRules[0]))
	{
		OnlineSub.ClearInFlight();

		SetVisible(false);
		OnlineSub.Exchange(ExchangeRules[0]);
		KFPC.ConsoleCommand("CE Recycle_Start");
	}
	else
	{
		LogInternal("FAILED TO RECYCLE!!!");
	}
}

function ExchangeDuplicatesEx()
{
	if ( OnlineSub.ExchangeDuplicates(RuleToExchange, 10) > 0 )
	{
		KFPC.SetTimer( 0.1, false, nameof(ExchangeDuplicatesEx), self );
	}
}

function ConfirmDuplicatesRecycle()
{
	local array<ExchangeRuleSets> ExchangeRules;

	OnlineSub.IsExchangeable( TempItemIdHolder, ExchangeRules );

	if( OnlineSub.ExchangeReady(ExchangeRules[0]) )
	{
		OnlineSub.ClearInFlight();

		RuleToExchange = ExchangeRules[0];
		SetVisible(false);

		KFPC.SetTimer( 0.1, false, nameof(ExchangeDuplicatesEx), self );

		KFPC.ConsoleCommand("CE Recycle_Start");
	}
	else
	{
		LogInternal("FAILED TO RECYCLE!!! DUPLICATES");
	}
}

function CancelRecycle()
{
	TempItemIdHolder=INDEX_NONE;
}

function ConfirmCraft()
{
	local array<ExchangeRuleSets> ExchangeRules;
	local int RuleIndex;
	
	OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);

	for (RuleIndex = 0; RuleIndex < ExchangeRules.length; RuleIndex++)
	{
		if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]))
		{
			OnlineSub.Exchange( ExchangeRules[RuleIndex] );
			SetVisible(false);
			KFPC.ConsoleCommand("CE Craft_Start");
			return;
		}
	}

	LogInternal("CRAFTING == SAD");
}

//Only do this on one item, this is too expensive to do in a loop
function int GetItemCount(int ItemDefinition)
{
	local int i, ItemCount;
	
	if(OnlineSub == none)
	{
		// If there is no OnlineSubsystem just send an empty array.  HSL_BB
		return 0;
	}

	for (i = 0; i < OnlineSub.CurrentInventory.length; i++)
	{
		//look item up to get info on it.
		if(OnlineSub.CurrentInventory[i].Definition != ItemDefinition)
		{
			continue;
		}

		ItemCount += onlineSub.CurrentInventory[i].Quantity;
	}

	return ItemCount;
}

function Callback_CrateOpenComplete(int Rarity)
{
	local name EventName;

	switch (Rarity)
	{
		case ITR_Common:
				EventName=SoundEvent_Common;
			break;
		case ITR_Uncommon:
				EventName=SoundEvent_Uncommon;
			break;
		case ITR_Rare:
				EventName=SoundEvent_Rare;
			break;
		case ITR_Legendary:
				EventName=SoundEvent_Legendary;
			break;
		case ITR_ExceedinglyRare:
				EventName=SoundEvent_ExceedinglyRare;
			break;
		case ITR_Mythical:
				EventName=SoundEvent_Mythical;
			break;
	
		default:
			EventName=SoundEvent_Common;
	}

	Manager.PlaySoundFromTheme(EventName, SoundThemeName);
}

function Callback_RequestInitialnventory()
{
	InitInventory();
}

function Callback_InventoryFilter( int FilterIndex )
{
	local EINventory_Filter NewFilter;

	switch (FilterIndex)
	{
		case 0:
			NewFilter = EInv_All;
			break;
		case 1:
			NewFilter = EInv_WeaponSkins;
			break;
		case 2:
			NewFilter = EInv_Cosmetics;
			break;
		case 3:
			NewFilter = EInv_Consumables;
			break;	
		case 4:
			NewFilter = EInv_CraftingMats;
			break;
	}

	if(NewFilter != CurrentInventoryFilter)
	{
		CurrentInventoryFilter = NewFilter;
		InitInventory();
	}
}

function Callback_Equip( int ItemDefinition )
{
	local class<KFWeaponDefinition> WeaponDef;
	local int ItemIndex;

	ItemIndex = class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition);

	if(ItemIndex == INDEX_NONE)
	{
		return;
	}

	WeaponDef = class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;

	if(WeaponDef != none)
	{
		if(IsItemActive(ItemDefinition))
		{
			class'KFWeaponSkinList'.Static.SaveWeaponSkin(WeaponDef, 0);
		}
		else
		{
			class'KFWeaponSkinList'.Static.SaveWeaponSkin(WeaponDef, ItemDefinition);
		}
		
	}

	//refresh inventory
	InitInventory();
}

function CallBack_ItemDetailsClicked(int ItemDefinition)
{
	//get the item and then set the use button label based on if the exchange rule is ready
	local array<ExchangeRuleSets> ExchangeRules;
	local ItemProperties NeededItem;
	local Int NeededItemID;

	OnlineSub.IsExchangeable(ItemDefinition, ExchangeRules);

	if(ExchangeRules.length <= 0)
	{
		LogInternal("NO RULES EXIST FOR THIS ITEM!" @ItemDefinition);
		return;
	}

	if(!OnlineSub.ExchangeReady(ExchangeRules[0]))
	{
		///get needed item from rule set
		if(ExchangeRules[0].Sources[0].Definition == ItemDefinition)
		{
			NeededItemID = ExchangeRules[0].Sources[1].Definition;
		}
		else
		{
			NeededItemID = ExchangeRules[0].Sources[0].Definition;
		}
		NeededItem = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', NeededItemID)];
		if(NeededItem.Price == "")
		{
			EquipButton.SetString("label", LookUpOnMarketString);
		}
		else
		{
			EquipButton.SetString("label", PurchaseKeyString$NeededItem.Price);
		}
	}
}

function Callback_UseItem( int ItemDefinition )
{
	local array<ExchangeRuleSets> ExchangeRules;
	local string ItemSeriesCommand;
	local ItemProperties NeededItem;
	local Int NeededItemID;

	OnlineSub.IsExchangeable(ItemDefinition, ExchangeRules);

	if(OnlineSub.ExchangeReady(ExchangeRules[0]))
	{
		OnlineSub.Exchange(ExchangeRules[0]);
		SetVisible(false);
		ItemSeriesCommand = "CE open_"$class'KFInventoryCatalog'.static.GetItemSeries(ItemDefinition);
		KFPC.ConsoleCommand(ItemSeriesCommand);
	}
	else
	{
		///get needed item from rule set
		if(ExchangeRules[0].Sources[0].Definition == ItemDefinition)
		{
			NeededItemID = ExchangeRules[0].Sources[1].Definition;
		}
		else
		{
			NeededItemID = ExchangeRules[0].Sources[0].Definition;
		}
		NeededItem = OnlineSub.ItemPropertiesList[OnlineSub.ItemPropertiesList.Find('Definition', NeededItemID)];
		if(NeededItem.Price == "")
		{
			//open market place item
			if(OnlineSub != none)
			{
				OnlineSub.OpenMarketPlaceSearch(NeededItem);
			}
		}
		else
		{
			//open key purchase 	
			if(OnlineSub != none)
			{
				OnlineSub.OpenItemPurchaseOverlay(NeededItemID);
			}
		}
	}
}

function Callback_CharacterSkin( int ItemDefinition )
{
	
}

function Callback_RecycleItem( int ItemDefinition )
{
	local int MatchingItemCount;

	TempItemIdHolder = ItemDefinition;
	//Get how man we have.  
	MatchingItemCount = GetItemCount(ItemDefinition);
	//If we have more than X number, 
	if(MatchingItemCount >= ValueToPromptDuplicateRecycle)
	{
		//give a third choice to recycle duplicates
		Manager.OpenPopup(EConfirmation, RecycleItemString, RecycleWarningString, RecycleDuplicatesString, class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmDuplicatesRecycle, CancelRecycle, RecycleOneString, ConfirmRecycle );
	}
	else
	{
		//else give standard recycle pop up
		Manager.OpenPopup(EConfirmation, RecycleItemString, RecycleWarningString, class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmRecycle );	
	}
}

function Callback_CraftOption(int ItemDefinition)
{
	local array<ExchangeRuleSets> ExchangeRules;
	local int RuleIndex;
	TempItemIdHolder = ItemDefinition;
		
	
	OnlineSub.IsExchangeable(TempItemIdHolder, ExchangeRules);

	for (RuleIndex = 0; RuleIndex < ExchangeRules.length; RuleIndex++)
	{
		if(OnlineSub.ExchangeReady(ExchangeRules[RuleIndex]))
		{
			Manager.OpenPopup(EConfirmation, CraftItemString, ConfirmCraftItemString, class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, ConfirmCraft );	
			return;
		}
	}

	Manager.OpenPopup(ENotification, FailedToCraftItemString, CraftRequirementString, class'KFCommon_LocalizedStrings'.default.OKString);	
}

function CallBack_RequestCosmeticCraftInfo()
{
	SetCosmeticCraftDetails();
}

function CallBack_RequestWeaponCraftInfo()
{
	SetWeaponCraftDetails();
}

function Callback_PreviewItem( int ItemDefinition )
{
	if(KFPH != none)
	{
		//KFPH.AttachWeaponByItemDefinition(ItemDefinition);
	}
}

defaultproperties
{
   RecycleOneString="Recycle One"
   RecycleDuplicatesString="Recycle Duplicates"
   InventoryString="INVENTORY"
   EquipString="EQUIP"
   UnequipString="UNEQUIP"
   UseString="USE"
   RecycleString="RECYCLE"
   CraftString="CRAFT"
   AllString="All"
   WeaponSkinString="Weapon Skins"
   CosmeticString="Cosmetics"
   CraftingMatsString="Crafting"
   ItemString="Items"
   FiltersString="FILTERS"
   CraftWeaponString="CRAFT WEAPON SKIN"
   CraftCosmeticString="CRAFT COSMETIC"
   CraftItemString="Confirm Craft Item?"
   ConfirmCraftItemString="Crafting this item will use resources and cannot be undone"
   RecycleWarningString="Warning, this cannot be undone. This will destroy the selected item and replace it with a crafting material item"
   RecycleItemString="Recycle Item?"
   CraftWeaponStrings(0)="Uncommon\nWeapon Skin"
   CraftWeaponStrings(1)="Rare\nWeapon Skin"
   CraftWeaponStrings(2)="Exceptional\nWeapon Skin"
   CraftWeaponStrings(3)="Master Crafted\nWeapon Skin"
   CraftCosmeticStrings(0)="Uncommon\nCosmetic"
   CraftCosmeticStrings(1)="Rare\nCosmetic"
   CraftCosmeticStrings(2)="Exceptional\nCosmetic"
   CraftCosmeticStrings(3)="Master Crafted\nCosmetic"
   FailedToExchangeString="CANNOT OPEN CRATE"
   MoreItemsString="You require a matching key and crate. You can purchase a key from the in game store."
   FailedToCraftItemString="Failed to Craft Item"
   CraftRequirementString="Insufficient quantity of required crafting materials"
   CraftCosmeticDescriptionString="You can craft new cosmetic items from this menu out of cosmetic material. You can obtain cosmetic material by recycling existing cosmetic items. To recycle, select an item and press recycle"
   CraftWeaponDescriptionString="You can craft new weapon skin items from this menu out of weapon skin material. You can obtain weapon skin material by recycling existing weapon skin items. To recycle, select an item and press recycle"
   RequiresString="Requires: "
   PurchaseKeyString="BUY KEY: "
   LookUpOnMarketString="Lookup on Market"
   UncommonCosmeticID=3708
   RareCosmeticID=3709
   ExceptionalCosmeticID=3710
   MasterCosmeticID=3711
   UncommonWeaponID=3712
   RareWeaponID=3713
   ExceptionalWeaponID=3714
   MasterWeaponID=3715
   SoundEvent_Common="Crate_End_Common"
   SoundEvent_Uncommon="Crate_End_Uncommon"
   SoundEvent_Rare="Crate_End_Rare"
   SoundEvent_Legendary="Crate_End_Lengendary"
   SoundEvent_ExceedinglyRare="Crate_End_ExeedinglyRare"
   SoundEvent_Mythical="Crate_End_Mythical"
   SoundThemeName="SoundTheme_Crate"
   ValueToPromptDuplicateRecycle=3
   Name="Default__KFGFxMenu_Inventory"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
