//=============================================================================
// KFWeap_HRG_Revolver_Buckshot
//=============================================================================
// A Smith & Wesson .500 "Bone Collector"
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_HRG_Revolver_Buckshot extends KFWeap_Revolver_SW500;

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

defaultproperties
{
   UnusedBulletMeshTemplate=SkeletalMesh'wep_3p_hrg_sw_500_mesh.Wep_3rdP_HRG_SW_500_Bullet'
   UsedBulletMeshTemplate=SkeletalMesh'wep_3p_hrg_sw_500_mesh.Wep_3rdP_HRG_SW_500_EmptyShell'
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp0'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp0'
   End Object
   BulletMeshComponents(0)=BulletMeshComp0
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp1'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp1'
   End Object
   BulletMeshComponents(1)=BulletMeshComp1
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp2'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp2'
   End Object
   BulletMeshComponents(2)=BulletMeshComp2
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp3'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp3'
   End Object
   BulletMeshComponents(3)=BulletMeshComp3
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4 Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp4'
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:BulletMeshComp4'
   End Object
   BulletMeshComponents(4)=BulletMeshComp4
   PackageKey="HRG_SW_500"
   FirstPersonMeshName="WEP_1P_HRG_SW_500_MESH.Wep_1stP_HRG_SW_500_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_SW_500_ANIM.WEP_1stP_HRG_SW_500_Anim"
   PickupMeshName="WEP_3P_HRG_SW_500_MESH.Wep_3rdP_HRG_SW_500_Pickup"
   AttachmentArchetypeName="WEP_HRG_SW_500_ARCH.Wep_HRG_SW_500_3P"
   MuzzleFlashTemplateName="WEP_HRG_SW_500_ARCH.Wep_HRG_SW_500_MuzzleFlash"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=()
   InventorySize=2
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_SW_500_TEX.UI_WeaponSelect_HRG_SW500'
   DualClass=Class'kfgamecontent.KFWeap_HRG_Revolver_DualBuckshot'
   SpareAmmoCapacity(0)=85
   FireAnim="HRG_Shoot"
   FireLastAnim="HRG_Shoot_Last"
   FireSightedAnims(0)="HRG_Shoot_Iron"
   FireSightedAnims(1)="HRG_Shoot_Iron2"
   FireSightedAnims(2)="HRG_Shoot_Iron3"
   FireLastSightedAnim="HRG_Shoot_Iron_Last"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_HRG_Buckshot_Fire_DryFire'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_SW500:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_SW500:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Revolver_Buckshot:MeleeHelper_0'
   NumPellets(0)=5
   NumPellets(1)=()
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=750
   minRecoilPitch=675
   maxRecoilYaw=300
   minRecoilYaw=-300
   RecoilBlendOutRatio=0.350000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Add=2)))
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   Spread(0)=0.150000
   InstantHitDamage(0)=32.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGBuckshot'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGBuckshot'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGBuckshot'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Buckshot"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Revolver_SW500:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=BulletMeshComp0
   Components(1)=BulletMeshComp1
   Components(2)=BulletMeshComp2
   Components(3)=BulletMeshComp3
   Components(4)=BulletMeshComp4
   Name="Default__KFWeap_HRG_Revolver_Buckshot"
   ObjectArchetype=KFWeap_Revolver_SW500'kfgamecontent.Default__KFWeap_Revolver_SW500'
}
