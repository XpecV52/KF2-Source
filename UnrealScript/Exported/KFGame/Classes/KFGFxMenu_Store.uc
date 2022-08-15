//=============================================================================
// KFGFxMenu_Store
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Zane Gholson -  09/17/2015
//=============================================================================

class KFGFxMenu_Store extends KFGFxObject_Menu;

var localized string ExitKF2;

/** Caches a local reference to the online subsystem */
var OnlineSubsystem				OnlineSub;

var KFGFxStoreContainer_Main 	MainContainer;
var KFGFxStoreContainer_Details DetailsContainer;
var KFGFxStoreContainer_Cart	CartContainer;

struct StoreItem
{
	var int 	SKU;
	var string 	ItemName;
	var string 	ItemDesciption;
	var string 	IconLocation;
	var float 	ItemPrice;
	var name 	ItemType;
};

var Array<ItemProperties> CharacterItems;
var Array<StoreItem> WeaponSkinItems;
var Array<StoreItem> ToolItems;

var string AllString;
var string NewReleasesKey;
var string CharactersKey;
var string WeaponsKey;
var string ToolsKey;

var localized string StoreString;

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu( InManager );

	LocalizeText();
	OnlineSub =  Class'GameEngine'.static.GetOnlineSubsystem();

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

	LocalizedObject = CreateObject( "Object" );
	
	LocalizedObject.SetString("store", 					StoreString); 

	SetObject("localizedText", LocalizedObject);
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{

	switch(WidgetName)
	{		
		case ('storeMainContainer'):
			if ( MainContainer == none )
			{
			    MainContainer = KFGFxStoreContainer_Main(Widget);
				MainContainer.Initialize( self );
				MainContainer.SendItems(OnlineSub.ItemPropertiesList);
		    }
         break;
        case ('storeCart'):
			if ( CartContainer == none )
			{
			    CartContainer = KFGFxStoreContainer_Cart(Widget);
				CartContainer.Initialize( self );
		    }
         break;
        case ('itemDetails'):
			if ( DetailsContainer == none )
			{
			    DetailsContainer = KFGFxStoreContainer_Details(Widget);
				DetailsContainer.Initialize( self );
		    }
         break;
    }

    return true;
}

function Callback_StoreSectionChanged(string SectionName)
{
	switch (SectionName)
	{
		case NewReleasesKey:
			MainContainer.UpdateFilter(EStore_All, OnlineSub.ItemPropertiesList);
			break;
		case CharactersKey:
			MainContainer.UpdateFilter(EStore_Cosmetics, OnlineSub.ItemPropertiesList);
			break;
		case WeaponsKey:
			MainContainer.UpdateFilter(EStore_WeaponSkins, OnlineSub.ItemPropertiesList);
			break;
		case ToolsKey:
			MainContainer.UpdateFilter(EStore_Consumables, OnlineSub.ItemPropertiesList);
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
   SubWidgetBindings(0)=(WidgetName="ItemDetails",WidgetClass=Class'KFGame.KFGFxStoreContainer_Details')
   SubWidgetBindings(1)=(WidgetName="storeCart",WidgetClass=Class'KFGame.KFGFxStoreContainer_Cart')
   SubWidgetBindings(2)=(WidgetName="storeMainContainer",WidgetClass=Class'KFGame.KFGFxStoreContainer_Main')
   Name="Default__KFGFxMenu_Store"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
