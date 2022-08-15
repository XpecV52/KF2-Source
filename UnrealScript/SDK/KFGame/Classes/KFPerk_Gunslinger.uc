//=============================================================================
// KFPerk_Gunslinger
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 9/19/2013
//=============================================================================

class KFPerk_Gunslinger extends KFPerk;

`include(KFOnlineStats.uci)

DefaultProperties
{	
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Gunslinger'

	MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Commando"

	ProgressStatID=`STATID_Guns_Progress
   	PerkBuildStatID=`STATID_Guns_Build
}
