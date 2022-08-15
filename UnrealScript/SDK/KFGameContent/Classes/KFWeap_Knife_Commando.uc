//=============================================================================
// KFWeap_CommandoKnife
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/14/2014
//=============================================================================

class KFWeap_Knife_Commando extends KFWeap_Edged_Knife;

defaultproperties
{
	// Zooming/Position
	PlayerViewOffset=(X=10,Y=10,Z=0)

	AttachmentArchetype=KFWeaponAttachment'WEP_CommandoKnife_ARCH.Wep_CommandoKnife_3P'

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_CommandoKnife_MESH.Wep_1stP_CommKnife_Rig'
		AnimSets(0)=AnimSet'WEP_1P_CommandoKnife_ANIM.Wep_1stP_CommKnife_Anim'
	End Object

	// Inventory
	FilterTypeUI=FT_Melee
	AssociatedPerkClass=class'KFPerk_Commando'
	UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Knife'
}
