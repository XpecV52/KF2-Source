//=============================================================================
// KFWeap_Blunt_Crovel
//=============================================================================
// A melee survival tool with bludgeoning and slashing damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Blunt_Crovel extends KFWeap_MeleeBase;

defaultproperties
{
	// Content
	PackageKey="Crovel"
	FirstPersonMeshName="WEP_1P_Crovel_MESH.Wep_1stP_Crovel_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Crovel_ANIM.WEP_1P_Crovel_ANIM"
	PickupMeshName="WEP_3P_Crovel_MESH.Wep_Crovel_Pickup"
	AttachmentArchetypeName="WEP_Crovel_ARCH.Wep_Crovel_3P"

	Begin Object Name=MeleeHelper_0
		MaxHitRange=150
		// Override automatic hitbox creation (advanced)
		HitboxChain.Add((BoneOffset=(Y=+3,Z=150)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=130)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=110)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=90)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=70)))
		HitboxChain.Add((BoneOffset=(Y=-3,Z=50)))
		HitboxChain.Add((BoneOffset=(Y=+3,Z=30)))
		HitboxChain.Add((BoneOffset=(Z=10)))
		HitboxChain.Add((BoneOffset=(Z=-10)))
		WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Blunted_melee_impact'
		// modified combo sequences
		MeleeImpactCamShakeScale=0.035f //0.4
		ChainSequence_F=(DIR_Left, DIR_ForwardRight, DIR_ForwardLeft, DIR_ForwardRight, DIR_ForwardLeft)
		ChainSequence_B=(DIR_BackwardLeft, DIR_Left, DIR_Right, DIR_ForwardRight, DIR_Left, DIR_Right, DIR_Left)
		ChainSequence_L=(DIR_Right, DIR_BackwardRight, DIR_ForwardRight, DIR_ForwardLeft, DIR_Right, DIR_Left)
		ChainSequence_R=(DIR_Left, DIR_BackwardLeft, DIR_ForwardLeft, DIR_ForwardRight, DIR_Left, DIR_Right)
	End Object

    // Inventory
	GroupPriority=25
	InventorySize=4
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Crovel'

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(DEFAULT_FIREMODE)=49
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Slashing_Crovel'

	FireModeIconPaths(HEAVY_ATK_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	InstantHitDamage(HEAVY_ATK_FIREMODE)=86
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE)=class'KFDT_Bludgeon_Crovel'

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_CrovelBash'
	InstantHitDamage(BASH_FIREMODE)=15

	AssociatedPerkClasses(0)=class'KFPerk_Berserker'

	// Block Sounds
	BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
	ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
	
	ParryStrength=3
	ParryDamageMitigationPercent=0.50
	BlockDamageMitigation=0.60

	// Weapon Upgrade stat boosts
	//WeaponUpgrades[1]=(IncrementDamage=1.2f,IncrementWeight=1)
	//WeaponUpgrades[2]=(IncrementDamage=1.45f,IncrementWeight=2)
	//WeaponUpgrades[3]=(IncrementDamage=1.65f,IncrementWeight=3)
	//WeaponUpgrades[4]=(IncrementDamage=1.85f,IncrementWeight=4)

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Damage1, Scale=1.2f), (Stat=EWUS_Damage2, Scale=1.2f), (Stat=EWUS_Weight, Add=1)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.45f), (Stat=EWUS_Damage1, Scale=1.45f), (Stat=EWUS_Damage2, Scale=1.45f), (Stat=EWUS_Weight, Add=2)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.65f), (Stat=EWUS_Damage1, Scale=1.65f), (Stat=EWUS_Damage2, Scale=1.65f), (Stat=EWUS_Weight, Add=3)))
	WeaponUpgrades[4]=(Stats=((Stat=EWUS_Damage0, Scale=1.85f), (Stat=EWUS_Damage1, Scale=1.85f), (Stat=EWUS_Damage2, Scale=1.85f), (Stat=EWUS_Weight, Add=4)))
}


