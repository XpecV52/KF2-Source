//=============================================================================
// KFWeap_HRG_Revolver_DualBuckshot
//=============================================================================
// A Smith & Wesson .500 "Bone Collector"
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_HRG_Revolver_DualBuckshot extends KFWeap_Revolver_DualSW500;

var(Animations) const editconst array<name> FireSightedAnims_Alt;

/*********************************************************************************************
 Firing / Projectile - Below projectile spawning code copied from KFWeap_ShotgunBase
********************************************************************************************* */

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnAllProjectiles(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local KFPerk InstigatorPerk;

	if (CurrentFireMode == GRENADE_FIREMODE)
	{
		return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
	}

	InstigatorPerk = GetPerk();
	if (InstigatorPerk != none)
	{
		Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
	}

	return super.SpawnAllProjectiles(KFProjClass, RealStartLoc, AimDir);
}

/* ********************************************************************************************* */

/** Get name of the animation to play for PlayFireEffects
  *
  * Overridden to allow for left weapon anims and multiple FireSightedAnim_Alts
  */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

	bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if (bFireFromRightWeapon && bUsingSights && !bPlayFireLast)
	{
		return bUseAltFireMode ? FireSightedAnims_Alt[Rand(FireSightedAnims_Alt.Length)] : FireSightedAnims[Rand(LeftFireSightedAnims.Length)];
	}

	return super.GetWeaponFireAnim(FireModeNum);
}

defaultproperties
{
   FireSightedAnims_Alt(0)="HRG_Shoot_Iron_RW"
   FireSightedAnims_Alt(1)="HRG_Shoot_Iron2_RW"
   FireSightedAnims_Alt(2)="HRG_Shoot_Iron3_RW"
   LeftFireAnim="HRG_Shoot_LW"
   LeftFireSightedAnims(0)="HRG_Shoot_IronOG_LW"
   SingleClass=Class'kfgamecontent.KFWeap_HRG_Revolver_Buckshot'
   LeftFireSightedAnim_Alt="HRG_Shoot_Iron_LW"
   LeftFireLastAnim="HRG_Shoot_LW_Last"
   LeftFireLastSightedAnim="HRG_Shoot_IronOG_LW_Last"
   FireLastSightedAnim_Alt="HRG_Shoot_Iron_RW_Last"
   LeftFireLastSightedAnim_Alt="HRG_Shoot_Iron_LW_Last"
   UnusedBulletMeshTemplate=SkeletalMesh'wep_3p_hrg_sw_500_mesh.Wep_3rdP_HRG_SW_500_Bullet'
   UsedBulletMeshTemplate=SkeletalMesh'wep_3p_hrg_sw_500_mesh.Wep_3rdP_HRG_SW_500_EmptyShell'
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp0'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp0'
   End Object
   BulletMeshComponents(0)=BulletMeshComp0
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0_L Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp0_L'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0_L"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp0_L'
   End Object
   BulletMeshComponents(1)=BulletMeshComp0_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp1'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp1'
   End Object
   BulletMeshComponents(2)=BulletMeshComp1
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1_L Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp1_L'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1_L"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp1_L'
   End Object
   BulletMeshComponents(3)=BulletMeshComp1_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp2'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp2'
   End Object
   BulletMeshComponents(4)=BulletMeshComp2
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2_L Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp2_L'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2_L"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp2_L'
   End Object
   BulletMeshComponents(5)=BulletMeshComp2_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp3'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp3'
   End Object
   BulletMeshComponents(6)=BulletMeshComp3
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3_L Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp3_L'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3_L"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp3_L'
   End Object
   BulletMeshComponents(7)=BulletMeshComp3_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp4'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp4'
   End Object
   BulletMeshComponents(8)=BulletMeshComp4
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4_L Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp4_L'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4_L"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:BulletMeshComp4_L'
   End Object
   BulletMeshComponents(9)=BulletMeshComp4_L
   PackageKey="Dual_HRG_SW_500"
   FirstPersonMeshName="wep_1p_dual_hrg_sw_500_mesh.Wep_1st_Dual_HRG_SW_500_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_dual_hrg_sw_500_anim.Wep_1stP_Dual_HRG_SW_500_Anim"
   PickupMeshName="WEP_3P_HRG_SW_500_MESH.Wep_3rdP_HRG_SW_500_Pickup"
   AttachmentArchetypeName="WEP_Dual_HRG_SW_500_ARCH.Wep_Dual_HRG_SW_500_3P"
   MuzzleFlashTemplateName="WEP_Dual_HRG_SW_500_ARCH.Wep_Dual_HRG_SW_500_MuzzleFlash"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=4
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=2.000000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Dual_HRG_SW_500_TEX.UI_WeaponSelect_HRG_DualSW500'
   SpareAmmoCapacity(0)=80
   FireAnim="HRG_Shoot_RW"
   FireLastAnim="HRG_Shoot_RW_Last"
   FireSightedAnims(0)="HRG_Shoot_IronOG_RW"
   FireSightedAnims(1)="HRG_Shoot_IronOG2_RW"
   FireSightedAnims(2)="HRG_Shoot_IronOG3_RW"
   FireLastSightedAnim="HRG_Shoot_IronOG_RW_Last"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_DryFire'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_DualSW500:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_DualSW500:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Revolver_DualBuckshot:MeleeHelper_0'
   NumPellets(0)=5
   NumPellets(1)=5
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=1000
   minRecoilPitch=900
   maxRecoilYaw=300
   minRecoilYaw=-300
   RecoilBlendOutRatio=0.350000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(0)=(Stats=)
   WeaponUpgrades(1)=()
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Stat=EWUS_Damage1,Scale=1.300000),(Add=4)))
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   Spread(0)=0.150000
   Spread(1)=0.150000
   InstantHitDamage(0)=28.000000
   InstantHitDamage(1)=28.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGBuckshot'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGBuckshot'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGBuckshot'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dual HRG Buckshots"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Revolver_DualSW500:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=BulletMeshComp0
   Components(1)=BulletMeshComp0_L
   Components(2)=BulletMeshComp1
   Components(3)=BulletMeshComp1_L
   Components(4)=BulletMeshComp2
   Components(5)=BulletMeshComp2_L
   Components(6)=BulletMeshComp3
   Components(7)=BulletMeshComp3_L
   Components(8)=BulletMeshComp4
   Components(9)=BulletMeshComp4_L
   Name="Default__KFWeap_HRG_Revolver_DualBuckshot"
   ObjectArchetype=KFWeap_Revolver_DualSW500'kfgamecontent.Default__KFWeap_Revolver_DualSW500'
}
