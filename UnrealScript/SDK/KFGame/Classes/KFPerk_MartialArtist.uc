//=============================================================================
// KFPerk_MartialArtist
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 9/19/2013
//=============================================================================

class KFPerk_MartialArtist extends KFPerk;

`include(KFOnlineStats.uci)

DefaultProperties
{	
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_MartialArtist'
		
	MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Commando"
	ProgressStatID=`STATID_Ninja_Progress
   	PerkBuildStatID=`STATID_Ninja_Build
}
