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
const KEYBOARD_STATE = "keyboard";
const CONTROLLER_STATE = "controller";
var string CurrentState;
var bool bChangingWeapons;
var localized string			PrimaryString;
var localized string			EquiptmentString;
var localized string			MeleeString;
var localized string			SecondaryString;

function InitializeObject()
{
	SetWeaponCategories();
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

	for (i = 0; i < WeaponList.length; i++)
	{
	    TempObj = CreateObject( "Object" );
	    TempObj.SetString( "weaponName", WeaponList[i].ItemName );
	    TempObj.SetString( "texturePath",  "img://"$WeaponList[i].UITexture.GetPackageName()$"."$WeaponList[i].UITexture.Name);
		// TODO: Add in secondary ammo here
		TempObj.SetInt( "ammoCount", WeaponList[i].AmmoCount[0]);
		TempObj.SetInt( "spareAmmoCount", WeaponList[i].SpareAmmoCount[0]);

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

function UpdateIndex()
{
	ActionScriptVoid("updateIndex");
	bChangingWeapons = false;
}

function SetState( string StrState )
{
	if(CurrentState != StrState)
	{
		CurrentState = StrState;
		ActionScriptVoid("setState");
	}
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
	local bool bIsUsingGamePad;
	bIsUsingGamePad = class'KFPlayerInput'.static.GetUsingGamePad(GetPC());
	if(bIsUsingGamePad)
	{
		SetState(CONTROLLER_STATE);
	}
	else
	{
		SetState(KEYBOARD_STATE);
	}
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

function SetWeaponSwitchStayOpen(bool bStayOpen)
{
	SetBool("bStayOpen", bStayOpen);
}

function FadeOut()
{
	bChangingWeapons = false;
}
