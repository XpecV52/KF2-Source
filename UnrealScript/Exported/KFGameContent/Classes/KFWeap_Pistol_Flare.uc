//=============================================================================
// KFWeap_Pistol_Flare
//=============================================================================
// A pistol that fires napalm rounds
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_Flare extends KFWeap_PistolBase;

static simulated event EFilterTypeUI GetAltTraderFilter()
{
    return FT_Flame;
}

defaultproperties
{
   bRevolver=True
   CylinderRotInfo=(InC=-60.000000,Time=0.017500)
   PackageKey="FlareGun"
   FirstPersonMeshName="WEP_1P_FlareGun_MESH.Wep_1stP_FlareGun_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_FlareGun_ANIM.Wep_1stP_FlareGun_Anim"
   PickupMeshName="WEP_3P_FlareGun_MESH.Wep_FlareGun_Pickup"
   AttachmentArchetypeName="WEP_FlareGun_ARCH.Wep_FlareGun_3P"
   MuzzleFlashTemplateName="WEP_FlareGun_ARCH.Wep_Flaregun_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=2
   MeshFOV=60.000000
   MeshIronSightFOV=55.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=4.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=15.000000
   WeaponSelectTexture=Texture2D'wep_ui_flaregun_tex.UI_WeaponSelect_Flaregun'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_DualFlare'
   MagazineCapacity(0)=6
   SpareAmmoCapacity(0)=186
   InitialSpareMags(0)=15
   AmmoPickupScale(0)=2.000000
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_DryFire'
   PlayerViewOffset=(X=12.000000,Y=14.000000,Z=-6.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Flare:MeleeHelper_0'
   maxRecoilPitch=400
   minRecoilPitch=350
   maxRecoilYaw=125
   minRecoilYaw=-125
   RecoilRate=0.080000
   RecoilBlendOutRatio=0.750000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=400
   RecoilISMinPitchLimit=65485
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Firebug'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Gunslinger'
   AssociatedPerkClasses(2)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.500000),(Add=1)))
   WeaponUpgrades(3)=(Stats=((Stat=EWUS_Damage0,Scale=1.750000),(Add=2)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_FlareGun'
   FireInterval(0)=0.200000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=40.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=22.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Fire_FlareGun'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_FlareGun'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master_Revolver'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Spitfire"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Flare"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
