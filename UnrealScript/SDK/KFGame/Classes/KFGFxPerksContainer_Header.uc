//=============================================================================
// KFGFxPerksContainer_Header
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/1/2013
//=============================================================================

class KFGFxPerksContainer_Header extends KFGFxPerksContainer;

var GFxObject PerkTextField, LevelTextField;
var localized string ExperienceString;


function Initialize( KFGFxObject_Menu NewParentMenu )
{
	local KFPlayerController KFPC;

	super.Initialize( NewParentMenu );
	KFPC = KFPlayerController(GetPC());
	UpdatePerkHeader( KFPC.PerkList[KFPC.SavedPerkIndex].PerkClass );
}


//@todo: change to grab data from PC.CurrentPerk
function UpdatePerkHeader( class<KFPerk> PerkClass)
{
	local GFxObject PerkDataProvider;
	local KFPlayerController KFPC;
	local int NextEXP, CurrentEXP;
	local float EXPPercent;
	local byte 	PerkLevel;

	KFPC = KFPlayerController(GetPC());

	EXPPercent = KFPC.GetPerkLevelProgressPercentage(PerkClass, CurrentEXP, NextEXP);
	PerkLevel = KFPC.GetPerkLevelFromPerkList(PerkClass);

	PerkDataProvider = CreateObject( "Object" );
    PerkDataProvider.SetString( "perkTitle", PerkClass.default.PerkName );
    PerkDataProvider.SetString( "perkLevel", LevelString@PerkLevel);
    PerkDataProvider.SetString( "iconSource", "img://"$PerkClass.static.GetPerkIconPath() );
    PerkDataProvider.SetString( "xpString",  CurrentEXP $"/" $NextEXP );
    PerkDataProvider.SetFloat( "xpPercent", EXPPercent / 100 );
	SetObject( "perkData", PerkDataProvider );
}


