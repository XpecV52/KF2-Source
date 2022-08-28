//=============================================================================
// KFWeap_GrenadeLauncher_M79
//=============================================================================
// An M79 Grenade Launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_GrenadeLauncher_M79 extends KFWeap_GrenadeLauncher_Base;

defaultproperties
{
   PackageKey="M79"
   FirstPersonMeshName="WEP_1P_M79_MESH.Wep_1stP_M79_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_M79_ANIM.WEP_1P_M79_ANIM"
   PickupMeshName="WEP_3P_M79_MESH.Wep_m79_Pickup"
   AttachmentArchetypeName="WEP_M79_ARCH.Wep_M79_3P"
   MuzzleFlashTemplateName="WEP_M79_ARCH.Wep_M79_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
   FireModeIconPaths(1)=()
   InventorySize=6
   MagazineCapacity(0)=1
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=73.000000
   FastZoomOutTime=0.200000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_M79_TEX.UI_WeaponSelect_M79'
   SpareAmmoCapacity(0)=26
   InitialSpareMags(0)=9
   AmmoPickupScale(0)=2.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_M',FirstPersonCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_S')
   WeaponDryFireSnd(0)=None
   PlayerViewOffset=(X=13.000000,Y=13.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_GrenadeLauncher_M79:MeleeHelper_0'
   maxRecoilPitch=900
   minRecoilPitch=775
   maxRecoilYaw=500
   minRecoilYaw=-500
   RecoilRate=0.085000
   RecoilBlendOutRatio=0.350000
   RecoilViewRotationScale=0.800000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.250000
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Demolitionist'
   WeaponUpgrades(1)=(IncrementDamage=1.120000)
   WeaponUpgrades(2)=(IncrementWeight=2,IncrementDamage=1.300000)
   WeaponUpgrades(3)=(IncrementWeight=3,IncrementDamage=1.550000)
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_HighExplosive_M79'
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=150.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_M79Impact'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_M79'
   FireOffset=(X=23.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="M79 Grenade Launcher"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_GrenadeLauncher_M79"
   ObjectArchetype=KFWeap_GrenadeLauncher_Base'KFGame.Default__KFWeap_GrenadeLauncher_Base'
}
