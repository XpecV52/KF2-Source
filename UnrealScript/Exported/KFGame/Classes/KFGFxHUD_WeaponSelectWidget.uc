//=============================================================================
// KFGFxHUD_WeaponSelectWidget
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 5/20/2014
//=============================================================================


class KFGFxHUD_WeaponSelectWidget extends GFxObject;

const MAX_WEAPON_GROUPS = 4;
var bool bChangingWeapons;
var localized string			PrimaryString;
var localized string			EquiptmentString;
var localized string			MeleeString;
var localized string			SecondaryString;
var localized string 			ThrowString;

/** How many weapons were in the inventory last time we counted */
var byte LastRefreshInvCount;

function InitializeObject()
{
	SetWeaponCategories();
	SetString("throwString", ThrowString);
}

simulated function RefreshWeaponSelect()
{
	local byte i;	
	for (i = 0; i < MAX_WEAPON_GROUPS; i++)
	{
		UpdateWeaponGroupOnHUD(i);
	}
}

simulated function UpdateWeaponGroupOnHUD( byte GroupIndex )
{
   	local Inventory Inv;
   	local KFWeapon KFW;
	local array<KFWeapon> WeaponGroup;

	if ( GetPC().Pawn == none || GetPC().Pawn.InvManager == none )
	{
		return;
	}

	for ( Inv = GetPC().Pawn.InvManager.InventoryChain; Inv != none; Inv = Inv.Inventory )
	{
		KFW = KFWeapon( Inv );
		if ( KFW != none && KFW.InventoryGroup == GroupIndex )
		{
			WeaponGroup.AddItem(KFW);
		}
	}

	SetWeaponGroupList(WeaponGroup, GroupIndex);
}

simulated function SetWeaponGroupList(out array<KFWeapon> WeaponList, byte GroupIndex)
{
	local byte i;
	local GFxObject DataProvider;
	local GFxObject TempObj;
	local bool bUsesAmmo;

	DataProvider = CreateArray();
	if ( DataProvider == None )
	{
		return; // gfx has been shut down
	}

	for (i = 0; i < WeaponList.length; i++)
	{
	    TempObj = CreateObject( "Object" );
	    TempObj.SetString( "weaponName", WeaponList[i].ItemName );
	    TempObj.SetString( "texturePath",  "img://"$PathName(WeaponList[i].WeaponSelectTexture));
		// TODO: Add in secondary ammo here
		TempObj.SetInt( "ammoCount", WeaponList[i].AmmoCount[0]);
		TempObj.SetInt( "spareAmmoCount", WeaponList[i].SpareAmmoCount[0]);
		TempObj.SetBool( "throwable", WeaponList[i].CanThrow());

		bUsesAmmo = (WeaponList[i].static.UsesAmmo());
		TempObj.SetBool( "bUsesAmmo", bUsesAmmo);
	    DataProvider.SetElementObject( i, TempObj );
	}

	SetWeaponList(DataProvider, GroupIndex);
}

simulated function SetWeaponList( GFxObject WeaponList, int GroupIndex )
{
	ActionScriptVoid("setWeaponList");
}

function SetSelectedWeapon( int GroupIndex, int SelectedIndex)
{
	if (!KFPlayerInput(GetPC().PlayerInput).bQuickWeaponSelect && !bChangingWeapons)
	{
		bChangingWeapons = true; 
	}

	SendWeaponIndex(GroupIndex, SelectedIndex);
}

/** Find KFWeapon instance from highlight */
function Weapon GetSelectedWeapon()
{
	return GetPC().Pawn.InvManager.PendingWeapon;
}

function UpdateIndex()
{
	ActionScriptVoid("updateIndex");
	bChangingWeapons = false;
}

function Hide()
{
	SetWeaponSwitchStayOpen(false);
    Fadeout();
}

function SetWeaponCategories( )
{
	local GFxObject CategoriesObj;

	CategoriesObj = CreateObject( "Object" );

	CategoriesObj.SetString( "Primary", PrimaryString );
	CategoriesObj.SetString( "Backup",  SecondaryString );
	CategoriesObj.SetString( "Melee",  MeleeString );
	CategoriesObj.SetString( "Equipment",  EquiptmentString );

	SetObject("weaponCategories", CategoriesObj);
}

function SendWeaponIndex( int GroupIndex, int SelectedIndex )
{
	ActionScriptVoid("setSelectedIndex");
}

function ShowOnlyHUDGroup( byte GroupIndex )
{
	ActionScriptVoid("showOnlyHUDGroup");
}

function ShowAllHUDGroups()
{
	ActionScriptVoid("showAllHUDGroups");
}

/** 
 * Timer to catch inventory changes while menu is open.  Can't rely on
 * events since the InventoryChain doesn't have a replicated event 
 */
function RefreshTimer()
{
	local Inventory Inv;
	local int InvCount;

	for ( Inv = GetPC().Pawn.InvManager.InventoryChain; Inv != none; Inv = Inv.Inventory )
	{
		InvCount++;
	}

	// RefreshWeaponSelect is not cheap, so only update if we gained or lost a weapon
	if ( InvCount != LastRefreshInvCount )
	{
		RefreshWeaponSelect();
	}
	LastRefreshInvCount = InvCount;
}

function SetWeaponSwitchStayOpen(bool bStayOpen)
{
	local Inventory Inv;

	if ( bStayOpen )
	{
		LastRefreshInvCount = 0;
		for ( Inv = GetPC().Pawn.InvManager.InventoryChain; Inv != none; Inv = Inv.Inventory )
		{
			LastRefreshInvCount++;
		}
		GetPC().SetTimer(0.33f, true, nameof(RefreshTimer), self);
	}
	else
	{
		GetPC().ClearTimer(nameof(RefreshTimer), self);
	}

	SetBool("bStayOpen", bStayOpen);
}

function FadeOut()
{
	bChangingWeapons = false;
}

defaultproperties
{
   PrimaryString="PRIMARY"
   EquiptmentString="EQUIPMENT"
   MeleeString="MELEE"
   SecondaryString="SECONDARY"
   ThrowString="THROW WEAPON"
   Name="Default__KFGFxHUD_WeaponSelectWidget"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
