//=============================================================================
// KFWeap_ShrinkRayGun
//=============================================================================
// Matheson would like this.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeap_ShrinkRayGun extends KFWeap_FlameBase;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	BarrelHeat = FlameSprayArchetype.default.MaterialHeatRange.X;
	ChangeMaterial();
	LastBarrelHeat = BarrelHeat;
}

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Electric;
}

/** Disable normal bullet spread */
simulated function rotator AddSpread( rotator BaseAim )
{
	return BaseAim; // do nothing
}

simulated protected function TurnOffPilot()
{
	// Undo the invert of the pilot, so it does really deactivate

	bInvertPilot = false;

    Super.TurnOffPilot();

	bInvertPilot = true;
}

defaultproperties
{
   bInvertPilot=True
   bWarnAIWhenFiring=True
   FlameSprayArchetype=SprayActor_Flame'WEP_ShrinkRay_Gun_ARCH.WEP_ShrinkRay_Gun_SprayFire'
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   CooldownBarrelModifier=2.500000
   PilotLights(0)=(Light=PilotPointLight0,LightAttachBone="MuzzleFlash",FlickerIntensity=25.000000,FlickerInterpSpeed=50.000000)
   PilotLights(1)=(Light=PilotPointLight1,LightAttachBone="MuzzleFlash",FlickerIntensity=15.000000,FlickerInterpSpeed=50.000000)
   Begin Object Class=KFParticleSystemComponent Name=FlameEndSpray0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   MinAmmoConsumed=3
   PackageKey="ShrinkRay_Gun"
   FirstPersonMeshName="WEP_1P_ShrinkRay_Gun_MESH.Wep_1stP_ShrinkRay_Gun_Rig"
   FirstPersonAnimSetNames(0)="WEP_1p_ShrinkRay_Gun_ANIM.WEP_1stp_shrinkray_gun_anim"
   PickupMeshName="WEP_3P_ShrinkRay_Gun_MESH.Wep_ShrinkRay_Gun_Pickup"
   AttachmentArchetypeName="WEP_ShrinkRay_Gun_ARCH.Microwave_Gun_3P"
   MuzzleFlashTemplateName="WEP_ShrinkRay_Gun_ARCH.Wep_Microwave_Gun_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   FireModeIconPaths(1)=()
   InventorySize=5
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-5.000000,Y=-0.050000,Z=1.000000)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   MaxAIWarningDistSQ=2250000.000000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_ShrinkRay_Gun_TEX.UI_Weapon_Select_Shrink_Ray_Gun'
   MagazineCapacity(0)=100
   SpareAmmoCapacity(0)=600
   InitialSpareMags(0)=1
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(0)="Shoot"
   FireSightedAnims(1)="Shoot_Heavy_Iron"
   BonesToLockOnEmpty(0)="RW_Handle1"
   BonesToLockOnEmpty(1)="RW_BatteryCylinder1"
   BonesToLockOnEmpty(2)="RW_BatteryCylinder2"
   BonesToLockOnEmpty(3)="RW_LeftArmSpinner"
   BonesToLockOnEmpty(4)="RW_RightArmSpinner"
   BonesToLockOnEmpty(5)="RW_LockEngager2"
   BonesToLockOnEmpty(6)="RW_LockEngager1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'ww_wep_shrink_ray_gun.Play_WEP_ShrinkRay_Gun_Shoot_Loop_3P',FirstPersonCue=AkEvent'ww_wep_shrink_ray_gun.Play_WEP_ShrinkRay_Gun_Shoot_Loop_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'ww_wep_shrink_ray_gun.Play_WEP_ShrinkRay_Gun_Shoot_Loop_End_3P',FirstPersonCue=AkEvent'ww_wep_shrink_ray_gun.Play_WEP_ShrinkRay_Gun_Shoot_Loop_End_1P')
   WeaponDryFireSnd(0)=AkEvent'ww_wep_shrink_ray_gun.Play_WEP_ShrinkRay_Gun_Dry_Fire'
   WeaponDryFireSnd(1)=AkEvent'ww_wep_shrink_ray_gun.Play_WEP_ShrinkRay_Gun_Dry_Fire'
   PlayerViewOffset=(X=0.000000,Y=14.000000,Z=-1.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_ShrinkRayGun:MeleeHelper_0'
   maxRecoilPitch=50
   minRecoilPitch=50
   maxRecoilYaw=115
   minRecoilYaw=-115
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Survivalist'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.350000),(Stat=EWUS_Damage1,Scale=1.350000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.700000),(Stat=EWUS_Damage1,Scale=1.700000),(Add=2)))
   FiringStatesArray(0)="SprayingFire"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   FireInterval(0)=0.080000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.120000
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_ShrinkRay'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Reducto Ray"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_ShrinkRayGun"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
