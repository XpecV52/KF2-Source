//=============================================================================
// KFPerk_Sharpshooter
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 8/2/2013
//=============================================================================

class KFPerk_Sharpshooter extends KFPerk;

`include(KFOnlineStats.uci)

DefaultProperties
{	
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Sharpshooter'

	PrimaryWeaponClassName="KFGameContent.KFWeap_Rifle_Winchester1894"
	MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Commando"

	ProgressStatID=`STATID_Shrp_Progress
   	PerkBuildStatID=`STATID_Shrp_Build
}
