//=============================================================================
// KFGFxPerksContainer_Details
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 12/10/2013
//=============================================================================

class KFGFxPerksContainer_Details extends KFGFxPerksContainer;

var localized string ExperienceString, ObjectivesString, PerkBonusesString, BasicLoadoutString;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	LocalizeContainer();
}

function  LocalizeContainer()
{
	GetObject("objectivesTitleTextField").SetString("text", ObjectivesString);
	GetObject("perkBonusTextField").SetString("text", PerkBonusesString);
	GetObject("basicLoadoutTextField").SetString("text", BasicLoadoutString);
}

function UpdateDetails( class<KFPerk> PerkClass)
{
	local GFxObject DetailsProvider;
	local KFPlayerController KFPC;
	local KFGameReplicationInfo KFGRI;
	local array<string> WeaponNames;
	local array<string> WeaponSources;
	local string WeaponNameStringHolder;
	local string WeaponSourceStringHolder;
	local int i;

	DetailsProvider = CreateObject( "Object" );

	KFPC = KFPlayerController( GetPC() );  

	if ( KFPC != none)
	{
		KFGRI = KFGameReplicationInfo(KFPC.WorldInfo.GRI);
		
		if(KFPC != none)
		{
			DetailsProvider.SetString( "ExperienceMessage", ExperienceString @ KFPC.GetPerkXP(PerkClass) );
		}

		if(KFGRI != none)
		{
			if(PerkClass.default.PrimaryWeaponClassName != "")
			{
				KFGRI.TraderItems.GetItemInfo( PerkClass, PerkClass.default.PrimaryWeaponClassName, WeaponNameStringHolder, WeaponSourceStringHolder );
				AddWeaponInfo(WeaponNames, WeaponSources, WeaponNameStringHolder, WeaponSourceStringHolder);
			}
			if(class'KFPerk'.default.SecondaryWeaponClassName != "")
			{
				KFGRI.TraderItems.GetItemInfo( PerkClass, PerkClass.default.SecondaryWeaponClassName, WeaponNameStringHolder, WeaponSourceStringHolder );
				AddWeaponInfo(WeaponNames, WeaponSources, WeaponNameStringHolder, WeaponSourceStringHolder);
			}
			if(PerkClass.default.MeleeWeaponClassName != "")
			{
				KFGRI.TraderItems.GetItemInfo( PerkClass, PerkClass.default.MeleeWeaponClassName, WeaponNameStringHolder, WeaponSourceStringHolder );
				AddWeaponInfo(WeaponNames, WeaponSources, WeaponNameStringHolder, WeaponSourceStringHolder);
			}
			if(PerkClass.default.GrenadeClassName != "")
			{
				KFGRI.TraderItems.GetGrenadeItemInfo( PerkClass, PerkClass.default.GrenadeClassName, WeaponNameStringHolder, WeaponSourceStringHolder );				
				AddWeaponInfo(WeaponNames, WeaponSources, WeaponNameStringHolder, WeaponSourceStringHolder );
			}
		}

		for (i = 0; i < WeaponNames.length; i++)
		{
			DetailsProvider.SetString( "WeaponName" $ i, WeaponNames[i] );		
			DetailsProvider.SetString( "WeaponImage" $ i, "img://"$WeaponSources[i] );			
		}

		DetailsProvider.SetString( "EXPAction1", PerkClass.default.EXPAction1 );
		DetailsProvider.SetString( "EXPAction2", PerkClass.default.EXPAction2 );		

		SetObject( "detailsData", DetailsProvider );
	}
}

function AddWeaponInfo(out array<string> WeaponNames, out array<string> WeaponSources, string WeaponName, string WeaponSource)
{
	WeaponNames.AddItem(WeaponName);
	WeaponSources.AddItem(WeaponSource);
}


function UpdatePassives(Class<KFPerk> PerkClass)
{
	local GFxObject PassivesProvider;
	local GFxObject PassiveObject;
	local KFPlayerController KFPC;
	local array<string> PassiveValues, Increments;
	local byte i;
	KFPC = KFPlayerController( GetPC() );

  	if ( KFPC != none )
  	{
		PerkClass.static.GetPassiveStrings( PassiveValues, Increments, KFPC.GetPerkLevelFromPerkList(PerkClass));

		PassivesProvider = CreateArray();
		for ( i = 0; i < PassiveValues.length; i++ )
	   	{
            PassiveObject = CreateObject( "Object" );
		    PassiveObject.SetString( "PassiveTitle", PerkClass.default.Passives[i].Title );
		    PassiveObject.SetString( "PerkBonusModifier", Increments[i]); 
		    PassiveObject.SetString( "PerkBonusAmount", PassiveValues[i] );
		    PassivesProvider.SetElementObject( i, PassiveObject );
	    }
    }

    SetObject( "passivesData", PassivesProvider );
}


