//=============================================================================
// KFGFxStoreContainer_Main
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 9/18/2015
//=============================================================================

class KFGFxStoreContainer_Main extends KFGFxObject_Container;

var localized string WeaponSkinsRotationString;
var localized string WeaponSkinsString;
var localized string MarketConsumablesString;
var localized string MarketCosmeticsString;
var localized string MarketEmotesString;
var localized string LookUpOnMarketString;

var KFGFxMenu_Store StoreMenu;

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

var EStore_Filter CurrentStoreFilter;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	StoreMenu = KFGFxMenu_Store(NewParentMenu);
	LocalizeText();
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	
	LocalizedObject.SetString("back", 					Class'KFCommon_LocalizedStrings'.default.BackString); 

	LocalizedObject.SetString("all",				class'KFGFxMenu_Inventory'.default.AllString);
	LocalizedObject.SetString("weaponSkin",			WeaponSkinsRotationString);
	LocalizedObject.SetString("cosmetics",			class'KFGFxMenu_Inventory'.default.CosmeticString);
	LocalizedObject.SetString("emotes",				Class'KFGFxMenu_Inventory'.default.EmotesString);
	LocalizedObject.SetString("items",				class'KFGFxMenu_Inventory'.default.ItemString);
	LocalizedObject.SetString("marketWeaponSkins",	WeaponSkinsString);
	LocalizedObject.SetString("marketCosmetics",	MarketCosmeticsString);
	LocalizedObject.SetString("marketEmotes",		MarketEmotesString);
	LocalizedObject.SetString("marketConsumables",	MarketConsumablesString);
	
	SetObject("localizedText", LocalizedObject);
}

function UpdateFilter(int NewFilterIndex)
{
	local EStore_Filter NewFilter;

	switch (NewFilterIndex)
	{
		case 0:
			NewFilter = EStore_All;
			break;
		case 1:
			NewFilter = EStore_WeaponSkins;
			break;
		case 2:
			NewFilter = EStore_Cosmetics;
			break;
		case 3:
			NewFilter = EStore_Consumables;
			break;
		case 4:
			NewFilter = EStore_Emotes;
			break;
		case 5:
			NewFilter = EStore_Market_WeaponSkins;
			break;	
		case 6:
			NewFilter = EStore_Market_Cosmetics;
			break;
		case 7:
			NewFilter = EStore_Market_Consumables;
			break;
		case 8:
			NewFilter = EStore_Market_Emotes;
			break;
	}

	if(CurrentStoreFilter != NewFilter)
	{
		CurrentStoreFilter = NewFilter;
		SendItems(StoreMenu.OnlineSub.ItemPropertiesList);
	}
}

function SendItems(const out Array<ItemProperties> StoreItemArray)
{
	local int i, ItemCount;
	local GFxObject DataProvider;

	ItemCount = 0;
	DataProvider = CreateArray();

	for (i = 0; i < StoreItemArray.Length; i++)
	{
		// Hide console items
		if( StoreItemArray[i].ProductId != "" && StoreItemArray[i].SignedOfferId == "" )
		{
			LogInternal("Skipping console store item"@StoreItemArray[i].Definition@"since it has no store offer ID");
			continue;
		}

		if(CurrentStoreFilter < EStore_Market_WeaponSkins)
		{
			if(StoreItemArray[i].Price != "" && (IsFilterSame(StoreItemArray[i].Type, CurrentStoreFilter) || CurrentStoreFilter == EStore_All ))
			{
				DataProvider.SetElementObject(ItemCount, CreateStoreItem(StoreItemArray[i]));
				ItemCount++;
			}
		}
		else
		{
			if(StoreItemArray[i].Price == "" && IsFilterSame(StoreItemArray[i].Type, CurrentStoreFilter) && StoreItemArray[i].Marketable)
			{
				DataProvider.SetElementObject(ItemCount, CreateStoreItem(StoreItemArray[i]));
				ItemCount++;
			}
		}
	}

	SetObject("storeItemData", DataProvider);
}

function GFxObject CreateStoreItem(ItemProperties StoreItem)
{
	local GFxObject DataObject;

	DataObject = CreateObject( "Object" );
				
	DataObject.SetString("label", StoreItem.Name);
	DataObject.SetString("description", StoreItem.Description);
	DataObject.SetString("price", class'WorldInfo'.static.IsConsoleBuild() ? "" : StoreItem.Price);
	DataObject.SetString("imageURL", "img://"$StoreItem.IconURL);
	DataObject.SetString("imageURLLarge", "img://"$StoreItem.IconURLLarge);
	DataObject.SetInt("SKU", StoreItem.Definition);

	return DataObject;
}

function bool IsFilterSame(ItemType FirstType, EStore_Filter SecondType)
{
	if( (CurrentStoreFilter == EStore_Emotes || CurrentStoreFilter == EStore_Market_Emotes) && FirstType == ITP_Emote)
	{
		return true;
	}
	
	if(SecondType < EStore_Market_WeaponSkins)
	{
		return (FirstType + 1) == int(SecondType);
	}
	else
	{
		return (FirstType + 1) == ( SecondType - 4 );	
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
   Name="Default__KFGFxStoreContainer_Main"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
