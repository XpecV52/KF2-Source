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

var localized string NewReleasesString;
var localized string CartString;
var localized string ToolsString;
var localized string WeaponSkinsString;
var localized string CharactersString;
var KFGFxMenu_Store StoreMenu;

enum EStore_Filter
{
	EStore_All,
	EStore_WeaponSkins,
	EStore_Cosmetics,
	EStore_Consumables,
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

	LocalizedObject.SetString("newReleases",	class'KFGFxMenu_Inventory'.default.AllString);
	LocalizedObject.SetString("characters",		class'KFGFxMenu_Inventory'.default.CosmeticString);
	LocalizedObject.SetString("weaponSkins",	WeaponSkinsString);
	LocalizedObject.SetString("tools",			class'KFGFxMenu_Inventory'.default.ItemString);
	LocalizedObject.SetString("cart",			CartString);
	
	SetObject("localizedText", LocalizedObject);
}

function UpdateFilter(EStore_Filter NewFilter, const out Array<ItemProperties> StoreItemArray)
{
	if(CurrentStoreFilter != NewFilter)
	{
		CurrentStoreFilter = NewFilter;
		SendItems(StoreItemArray);
	}
}



function SendItems(const out Array<ItemProperties> StoreItemArray)
{
	local int i, ItemCount;
	local GFxObject DataProvider, DataObject;

	ItemCount = 0;
	DataProvider = CreateArray();

	for (i = 0; i < StoreItemArray.Length; i++)
	{
		if(StoreItemArray[i].Price != "" && (IsFilterSame(StoreItemArray[i].Type, CurrentStoreFilter) || CurrentStoreFilter == EStore_All ))
		{
			DataObject = CreateObject( "Object" );
				
			DataObject.SetString("label", StoreItemArray[i].Name);
			DataObject.SetString("description", StoreItemArray[i].Description);
			DataObject.SetString("price", StoreItemArray[i].Price);
			DataObject.SetString("imageURL", "img://"$StoreItemArray[i].IconURL);
			DataObject.SetString("imageURLLarge", "img://"$StoreItemArray[i].IconURLLarge);
			DataObject.SetInt("SKU", StoreItemArray[i].Definition);

			DataProvider.SetElementObject(ItemCount, DataObject);
			ItemCount++;
			
		}
	}

	SetObject("storeItemData", DataProvider);
}

function bool IsFilterSame(ItemType FirstType, EStore_Filter SecondType)
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
   Name="Default__KFGFxStoreContainer_Main"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
