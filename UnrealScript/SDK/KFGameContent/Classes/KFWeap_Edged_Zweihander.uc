//=============================================================================
// KFWeap_Edged_Zweihander
//=============================================================================
// A two-handed sword primarily of the Renaissance. It is a true two-handed
// sword because it requires two hands to wield, unlike other large swords
// that are wielded with two hands but can also be wielded with one.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFWeap_Edged_Zweihander extends KFWeap_MeleeBase;

defaultproperties
{
	// Zooming/Position
	PlayerViewOffset=(X=2,Y=0,Z=0)

	AttachmentArchetype=KFWeaponAttachment'WEP_Zweihander_ARCH.Wep_Zweihander_3P'

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_Zweihander_MESH.Wep_1stP_Zweihander_Rig'
		AnimSets(0)=AnimSet'WEP_1P_Zweihander_ANIM.Wep_1stP_Zweihander_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Zweihander_MESH.Wep_Zweihander_Pickup'
	End Object

	Begin Object Name=MeleeHelper_0
		MaxHitRange=400    //330
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(X=+3,Z=190)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=170)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(X=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(X=+3,Z=30)))
		HitboxChain.Add((BoneOffset=(Z=10)))
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
		// modified combo sequences
		ChainSequence_F=(DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardLeft, DIR_BackwardRight, DIR_BackwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right, DIR_Left)
		ChainSequence_L=(DIR_Right, DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
		ChainSequence_R=(DIR_Left, DIR_Right, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
	End Object

	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_Zweihander'
	InstantHitMomentum(DEFAULT_FIREMODE)=30000.f
	InstantHitDamage(DEFAULT_FIREMODE)=90   //70

	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Slashing_ZweihanderHeavy'
	InstantHitMomentum(HEAVY_ATK_FIREMODE)=30000.f
	InstantHitDamage(HEAVY_ATK_FIREMODE)=290     //200

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Piercing_ZweihanderStab'
	InstantHitDamage(BASH_FIREMODE)=120

	// Inventory
	GroupPriority=85
	InventorySize=6
	UITexture=Texture2D'WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander'
	FilterTypeUI=FT_Melee
	AssociatedPerkClass=class'KFPerk_Berserker'
	SharedUnlockId=SCU_Zweihander

	// Trader
    EffectiveRange=3

	// Block Sounds
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'

	ParryStrength=5
}


