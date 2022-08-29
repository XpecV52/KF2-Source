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
var localized string ThankYouString;
var localized string FeaturedString;
var localized string MarketSFXString;

var array<int> FeaturedItemIDs;
var array<int> ConsoleFeaturedItemIDs;

var int MaxFeaturedItems;

var KFGFxMenu_Store StoreMenu;

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
	
	LocalizedObject.SetString("back", 				Class'KFCommon_LocalizedStrings'.default.BackString); 
	LocalizedObject.SetString("featured",			FeaturedString);
	LocalizedObject.SetString("all",				class'KFGFxMenu_Inventory'.default.AllString);
	LocalizedObject.SetString("weaponSkin",			WeaponSkinsRotationString);
	LocalizedObject.SetString("cosmetics",			class'KFGFxMenu_Inventory'.default.CosmeticString);
	LocalizedObject.SetString("emotes",				Class'KFGFxMenu_Inventory'.default.EmotesString);
	LocalizedObject.SetString("items",				class'KFGFxMenu_Inventory'.default.ItemString);
	LocalizedObject.SetString("marketWeaponSkins",	WeaponSkinsString);
	LocalizedObject.SetString("marketCosmetics",	MarketCosmeticsString);
	LocalizedObject.SetString("marketEmotes",		MarketEmotesString);
	LocalizedObject.SetString("marketConsumables",	MarketConsumablesString);
	LocalizedObject.SetString("sfx",				Class'KFCommon_LocalizedStrings'.default.SpecialEffectsString);
	LocalizedObject.SetString("marketSFX",			MarketSFXString);
	
	LocalizedObject.SetString("thankYouString",		ThankYouString);
	
	SetObject("localizedText", LocalizedObject);
}

function UpdateFilter(int NewFilterIndex)
{
	local EStore_Filter NewFilter;

	switch (NewFilterIndex)
	{
		case 0:
			NewFilter = EStore_Featured;
			break;
		case 1:
			NewFilter = EStore_All;
			break;
		case 2:
			NewFilter = EStore_WeaponSkins;
			break;
		case 3:
			NewFilter = EStore_Cosmetics;
			break;
		case 4:
			NewFilter = EStore_Consumables;
			break;
		case 5:
			NewFilter = EStore_Emotes;
			break;
		case 6:
			NewFilter = EStore_SFX;
			break;
		case 7:
			NewFilter = EStore_Market_WeaponSkins;
			break;	
		case 8:
			NewFilter = EStore_Market_Cosmetics;
			break;
		case 9:
			NewFilter = EStore_Market_Consumables;
			break;
		case 10:
			NewFilter = EStore_Market_Emotes;
			break;
		case 11:
			NewFilter = EStore_Market_SFX;
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
	local int i, ItemCount, j;
	local GFxObject DataProvider;
	local Array<ItemProperties> FilteredItemsArray;
	local ItemProperties TempItemProps; //since we can't push elements of an array

	ItemCount = 0;
	DataProvider = CreateArray();
	
	for (i = 0; i < StoreItemArray.Length; i++)
	{
		// Hide console items
		if(StoreItemArray[i].ProductId != "" && StoreItemArray[i].SignedOfferId == "" && CurrentStoreFilter != EStore_Featured)
		{
			LogInternal("Skipping console store item"@StoreItemArray[i].Definition@"since it has no store offer ID");
			continue;
		}

		if(CurrentStoreFilter < EStore_Market_WeaponSkins || CurrentStoreFilter == EStore_All)
		{
			if(StoreItemArray[i].Price != "" && IsFilterSame(StoreItemArray[i].Type, CurrentStoreFilter))
			{
				TempItemProps = StoreItemArray[i];
				FilteredItemsArray[ItemCount]=TempItemProps;
				ItemCount++;
			}
		}
		else if (CurrentStoreFilter == EStore_Featured)
		{
			if (class'WorldInfo'.static.IsConsoleBuild())
			{
				for (j = 0; j < ConsoleFeaturedItemIDs.length; j++)
				{
					if (StoreItemArray[i].Definition == ConsoleFeaturedItemIDs[j])
					{
						TempItemProps = StoreItemArray[i];
						FilteredItemsArray[ItemCount] = TempItemProps;
						ItemCount++;
					}
				}
			}
			else
			{
				for (j = 0; j < FeaturedItemIDs.length; j++)
				{
					if (StoreItemArray[i].Definition == FeaturedItemIDs[j])
					{
						TempItemProps = StoreItemArray[i];
						FilteredItemsArray[ItemCount] = TempItemProps;
						ItemCount++;
					}
				}
			}
		}
		else
		{
			if(StoreItemArray[i].Price == "" && IsFilterSame(StoreItemArray[i].Type, CurrentStoreFilter) && StoreItemArray[i].Marketable)
			{
				TempItemProps = StoreItemArray[i];
				FilteredItemsArray[ItemCount] = TempItemProps;
				ItemCount++;
			}
		}		
	}

	ItemCount = 0;

	if (FilteredItemsArray.length > 0)
	{
		//too slow to sort all
		if (CurrentStoreFilter == EStore_All)
		{
			//filter by price high to low
			FilteredItemsArray.Sort(SortItemsByType);
		}
		else
		{
			//filter by price high to low
			FilteredItemsArray.Sort(SortItemsByPrice);
		}

		if (CurrentStoreFilter == EStore_Featured)
		{
			ShuffleFeaturedItems(FilteredItemsArray);
			for (i = 0; i < MaxFeaturedItems; i++)
			{
				DataProvider.SetElementObject(ItemCount, CreateStoreItem(FilteredItemsArray[i]));
				ItemCount++;
			}
		}
		else
		{
			for (i = 0; i < FilteredItemsArray.Length; i++)
			{
				DataProvider.SetElementObject(ItemCount, CreateStoreItem(FilteredItemsArray[i]));
				ItemCount++;
			}
		}
		
	}

	if (CurrentStoreFilter == EStore_Featured)
	{
		SetObject("storeItemFeaturedData", DataProvider);
	}
	else
	{
		SetObject("storeItemData", DataProvider);
	}
}

function ShuffleFeaturedItems(out Array<ItemProperties> FeaturedItemArray)
{
	local int CurrentIndex;
	local int RandomIndex;
	local ItemProperties TempValue;
	CurrentIndex = FeaturedItemArray.length;

	while (0 != CurrentIndex)
	{
		RandomIndex = Rand(FeaturedItemArray.length);
		CurrentIndex -= 1;

		TempValue = FeaturedItemArray[CurrentIndex];
		FeaturedItemArray[CurrentIndex] = FeaturedItemArray[RandomIndex];
		FeaturedItemArray[RandomIndex] = TempValue;
	}
}

delegate int SortItemsByType(ItemProperties A, ItemProperties B)
{
	return A.Type > B.Type? -1 : 0;
}

delegate int SortItemsByPrice(ItemProperties A, ItemProperties B)
{
	local string AString, BString;
	
	AString = Mid(A.Price, 1);
	BString = Mid(B.Price, 1);	
	return Int(AString) < Int(BString) ? -1 : 0;
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
	if (SecondType == EStore_All)
	{
		return true;
	}

	if(SecondType < EStore_Market_WeaponSkins)
	{
		return int(FirstType) == int(SecondType);
	}
	else
	{
		return int(FirstType) == ( SecondType - EStore_Market_WeaponSkins );	
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
   FeaturedItemIDs(0)=7041
   FeaturedItemIDs(1)=7130
   FeaturedItemIDs(2)=7139
   FeaturedItemIDs(3)=7142
   FeaturedItemIDs(4)=7047
   ConsoleFeaturedItemIDs(0)=7041
   ConsoleFeaturedItemIDs(1)=7153
   ConsoleFeaturedItemIDs(2)=7134
   ConsoleFeaturedItemIDs(3)=7135
   ConsoleFeaturedItemIDs(4)=7047
   MaxFeaturedItems=5
   CurrentStoreFilter=EStore_Featured
   Name="Default__KFGFxStoreContainer_Main"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
