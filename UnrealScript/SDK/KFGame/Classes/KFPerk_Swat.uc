//=============================================================================
// KFPerk_SWAT
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 9/19/2013
//=============================================================================

class KFPerk_SWAT extends KFPerk;

`include(KFOnlineStats.uci)

DefaultProperties
{	
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_SWAT'

	PrimaryWeaponClassName="KFGameContent.KFWeap_SMG_P90"
	MeleeWeaponClassName="KFGameContent.KFWeap_Knife_Commando"

	ProgressStatID=`STATID_Swat_Progress
   	PerkBuildStatID=`STATID_Swat_Build
}
