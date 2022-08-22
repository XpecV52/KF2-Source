//=============================================================================
// KFGFxComponent_TraderFilter
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 8/12/2013
//=============================================================================

class KFGFxTraderContainer_Filter extends KFGFxObject_Container;

var localized array<string> TabsArray;
var localized array<string> WeaponTypeStrings;
var localized string OffPerkString;

var array<string> TabIconPaths;
var array<string> WeaponTypePath;

function ClearFilters()
{
	SetString("filterText", "");
	SetBool("filterVisibliity", false);
}

function SetPerkFilterData(byte FilterIndex)
{
 	local int i;
	local GFxObject DataProvider;
	local GFxObject FilterObject;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo KFPRI;

	SetBool("filterVisibliity", true);

    KFPC = KFPlayerController( GetPC() );
	if ( KFPC != none )
	{
		KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
		if ( KFPRI != none )
		{
			SetInt("selectedIndex", KFPRI.NetPerkIndex);

			// Set the title of this filter based on either the perk or the off perk string
			if( FilterIndex < KFPC.PerkList.Length )
			{
				SetString("filterText", KFPC.PerkList[FilterIndex].PerkClass.default.PerkName);
			}
			else
			{
				SetString("filterText", OffPerkString);
			}

		   	DataProvider = CreateArray();
			for (i = 0; i < KFPC.PerkList.Length; i++)
			{
				FilterObject = CreateObject( "Object" );
				FilterObject.SetString("source",  "img://"$KFPC.PerkList[i].PerkClass.static.GetPerkIconPath());
				FilterObject.SetBool("isMyPerk",  KFPC.PerkList[i].PerkClass == KFPC.CurrentPerk.class);
			    DataProvider.SetElementObject( i, FilterObject );
			}

			FilterObject = CreateObject( "Object" );
			FilterObject.SetString("source",  "img://"$class'KFGFxObject_TraderItems'.default.OffPerkIconPath);
			DataProvider.SetElementObject( i, FilterObject );

			SetObject( "filterSource", DataProvider );
    	}
    }
}

function SetTypeFilterData(byte FilterIndex)
{
 	local int i;
	local GFxObject DataProvider;
	local GFxObject FilterObject;

	SetBool("filterVisibliity", true);
	SetString("filterText", WeaponTypeStrings[FilterIndex]);

   	DataProvider = CreateArray();
	for (i = 0; i < WeaponTypePath.Length; i++)
	{
		FilterObject = CreateObject( "Object" );
		FilterObject.SetString("source",  "img://"$WeaponTypePath[i]);
	    DataProvider.SetElementObject( i, FilterObject );
	}

	SetObject( "filterSource", DataProvider );
}

function SetTabsData()
{
 	local int i;
	local GFxObject DataProvider;
	local GFxObject FilterObject;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo KFPRI;

    KFPC = KFPlayerController( GetPC() );
	if (KFPC != none)
	{
		KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
		if (KFPRI != none)
		{
		   	DataProvider = CreateArray();
			for (i = 0; i < TabsArray.Length; i++)
			{
				FilterObject = CreateObject( "Object" );
				FilterObject.SetString("label", TabsArray[i]);
				FilterObject.SetString("source",  "img://"$TabIconPaths[i]);
			    DataProvider.SetElementObject( i, FilterObject );
			}

			SetObject("tabInfo", DataProvider);
    	}
    }
}

defaultproperties
{
   TabsArray(0)="PERKS"
   TabsArray(1)="TYPE"
   TabsArray(2)="FAVORITES"
   TabsArray(3)="ALL"
   WeaponTypeStrings(0)="Pistols"
   WeaponTypeStrings(1)="Shotguns"
   WeaponTypeStrings(2)="Rifles"
   WeaponTypeStrings(3)="Projectiles"
   WeaponTypeStrings(4)="Flame Weapons"
   WeaponTypeStrings(5)="Electric Weapons"
   WeaponTypeStrings(6)="Explosives"
   WeaponTypeStrings(7)="Assault Rifles"
   WeaponTypeStrings(8)="Melee Weapons"
   WeaponTypeStrings(9)="SMGs"
   OffPerkString="Off Perk"
   TabIconPaths(0)="UI_TraderMenu_TEX.UI_WeaponSelect_Trader_Perk"
   TabIconPaths(1)="UI_TraderMenu_TEX.UI_WeaponSelect_Trader_Type"
   TabIconPaths(2)="UI_TraderMenu_TEX.UI_WeaponSelect_Trader_Favorites"
   TabIconPaths(3)="UI_TraderMenu_TEX.UI_WeaponSelect_Trader_All"
   WeaponTypePath(0)="UI_WeaponType_TEX.UI_WeaponType_Pistol"
   WeaponTypePath(1)="UI_WeaponType_TEX.UI_WeaponType_Shotgun"
   WeaponTypePath(2)="UI_WeaponType_TEX.UI_WeaponType_Rifle"
   WeaponTypePath(3)="UI_WeaponType_TEX.UI_WeaponType_Projectile"
   WeaponTypePath(4)="UI_WeaponType_TEX.UI_WeaponType_Flame"
   WeaponTypePath(5)="UI_WeaponType_TEX.UI_WeaponType_Electric"
   WeaponTypePath(6)="UI_WeaponType_TEX.UI_WeaponType_Explosive"
   WeaponTypePath(7)="UI_WeaponType_TEX.UI_WeaponType_Assault"
   WeaponTypePath(8)="UI_WeaponType_TEX.UI_WeaponType_Melee"
   WeaponTypePath(9)="UI_WeaponType_TEX.UI_WeaponType_SMG"
   Name="Default__KFGFxTraderContainer_Filter"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
