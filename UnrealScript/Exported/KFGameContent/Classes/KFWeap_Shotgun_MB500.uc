//=============================================================================
// KFWeap_Shotgun_MB500
//=============================================================================
// A Mossberg 500 Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_MB500 extends KFWeap_ShotgunBase;

defaultproperties
{
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FilterTypeUI=FT_Shotgun
   InventorySize=5
   EffectiveRange=20
   bHasIronSights=True
   bCanBeReloaded=True
   bHasFlashlight=True
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=9.500000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=95.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Mossberg'
   MagazineCapacity(0)=8
   MaxSpareAmmo(0)=40
   InitialSpareMags(0)=2
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M',FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M',FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
   PlayerViewOffset=(X=8.000000,Y=8.000000,Z=-3.500000)
   AttachmentArchetype=KFWeaponAttachment'WEP_MB500_ARCH.Wep_MB500_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Shotgun_MB500:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_MB500_ARCH.Wep_MB500_MuzzleFlash'
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
   AssociatedPerkClass=Class'KFGame.KFPerk_Support'
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
   WeaponProjectiles(0)=Class'KFGameContent.KFProj_Bullet_Pellet'
   FireInterval(0)=0.770000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(0)=20.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'KFGameContent.KFDT_Ballistic_MB500'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'KFGameContent.KFDT_Bludgeon_MB500'
   FireOffset=(X=30.000000,Y=3.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_MB500_MESH.Wep_1stP_MB500_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_MB500_ANIM.Wep_1st_MB500_Anim_New'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="SG 500 Pump-Action"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_MB500_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_MB500"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
