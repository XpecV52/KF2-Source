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

var localized string InventoryString;
var localized string EquipString;
var localized string UnequipString;
var localized string UseString;

var localized string AllString;
var localized string WeaponSkinString;
var localized string CosmeticString;
var localized string ItemString;
var localized string FiltersString;

var localized string FailedToExchangeString;
var localized string MoreItemsString;

var OnlineSubsystem OnlineSub;
var KFPawn_Customization KFPH;
var bool bInitialInventoryPassComplete;

enum EINventory_Filter
{
	EInv_All,
	EInv_WeaponSkins,
	EInv_Cosmetics,
	EInv_Consumables,
};

struct InventoryHelper
{
	var int ItemDefinition;
	var int ItemIndex;
	var int ItemCount;
	var GFxObject GfxItemObject;
};

var EINventory_Filter CurrentInventoryFilter;


function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu( InManager );
	LocalizeText();

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	OnlineSub.AddOnInventoryReadCompleteDelegate(OnInventoryReadComplete);

	KFPH = KFPawn_Customization(GetPC().Pawn);
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
}

function OnClose()
{
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

	if(OnlineSub == none)
	{
		return;
	}

	ItemArray = CreateArray();

	for (i = 0; i < OnlineSub.CurrentInventory.length; i++)
	{
		//look item up to get info on it.
		ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', OnlineSub.CurrentInventory[i].Definition);

		if(ItemIndex != INDEX_NONE)
		{
			TempItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
			if(CurrentInventoryFilter == EInv_All || int(CurrentInventoryFilter) == int(TempItemDetailsHolder.Type) + 1) //offset
			{
				ItemObject = CreateObject("Object");
				HelperIndex = ActiveItems.Find('ItemDefinition', onlineSub.CurrentInventory[i].Definition);

				if(HelperIndex == INDEX_NONE)
				{
					HelperItem.ItemDefinition = onlineSub.CurrentInventory[i].Definition;
					HelperItem.ItemCount = 1;
					ActiveItems.AddItem(HelperItem);
					HelperIndex = ActiveItems.length - 1;
				}
				else
				{
					ActiveItems[HelperIndex].ItemCount++;
				}

				OnlineSub.IsExchangeable(onlineSub.CurrentInventory[i].Definition, ExchangeRules);
				

				ItemObject.SetInt("count", ActiveItems[HelperIndex].ItemCount);
				ItemObject.SetString("label", TempItemDetailsHolder.Name);
				ItemObject.SetString("price", TempItemDetailsHolder.price);
				ItemObject.Setstring("typeRarity", TempItemDetailsHolder.ShortDescription);
				ItemObject.SetInt("type", TempItemDetailsHolder.Type);
				ItemObject.SetBool("exchangeable", ExchangeRules.length > 0);
				bActiveItem = IsItemActive(onlineSub.CurrentInventory[i].Definition);
				ItemObject.SetBool("active", bActiveItem );

				ItemObject.SetString("description", TempItemDetailsHolder.Description);
				ItemObject.SetString("iconURLSmall", "img://"$TempItemDetailsHolder.IconURL);
				ItemObject.SetString("iconURLLarge", "img://"$TempItemDetailsHolder.IconURLLarge);
				ItemObject.SetInt("definition", TempItemDetailsHolder.Definition);
				
				ActiveItems[HelperIndex].GfxItemObject = ItemObject;

				if(bool(OnlineSub.CurrentInventory[i].NewlyAdded) && bInitialInventoryPassComplete)
				{
					SetObject("crateOpen", ItemObject);
				}

				OnlineSub.CurrentInventory[i].NewlyAdded = 0;
			}
		}
	}

	for (i = 0; i < ActiveItems.length; i++)
	{
		ItemArray.SetElementObject(i, ActiveItems[i].GfxItemObject);
	}

	SetObject("inventoryList", ItemArray);

	bInitialInventoryPassComplete = true;

}

function OnInventoryReadComplete()
{
	InitInventory();
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

	LocalizedObject.SetString("all", 						AllString); 
	LocalizedObject.SetString("weaponSkins", 				WeaponSkinString); 
	LocalizedObject.SetString("cosmetics", 					CosmeticString); 
	LocalizedObject.SetString("items", 						ItemString); 
	LocalizedObject.SetString("filters", 					FiltersString); 

	SetObject("localizedText", LocalizedObject);
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

function Callback_UseItem( int ItemDefinition )
{
	local array<ExchangeRuleSets> ExchangeRules;

	OnlineSub.IsExchangeable(ItemDefinition, ExchangeRules);

	if(OnlineSub.ExchangeReady(ExchangeRules[0]))
	{
		OnlineSub.Exchange(ExchangeRules[0]);
		ActionScriptVoid("onItemUsed");
	}
	else
	{
		Manager.OpenPopup(ENotification, FailedToExchangeString, MoreItemsString, class'KFCommon_LocalizedStrings'.default.OKString);	
	}
}

function Callback_CharacterSkin( int ItemDefinition )
{
	
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
   InventoryString="INVENTORY"
   EquipString="EQUIP"
   UnequipString="UNEQUIP"
   UseString="USE"
   AllString="All"
   WeaponSkinString="Weapon Skins"
   CosmeticString="Cosmetics"
   ItemString="Items"
   FiltersString="Filters"
   FailedToExchangeString="CANNOT OPEN CRATE"
   MoreItemsString="You require a matching key and crate. You can purchase a key from the in game store."
   Name="Default__KFGFxMenu_Inventory"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
