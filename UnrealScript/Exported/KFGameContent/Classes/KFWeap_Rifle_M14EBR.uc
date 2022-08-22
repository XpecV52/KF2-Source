//=============================================================================
// KFWeap_Rifle_M14EBR
//=============================================================================
// An M14 EBR
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Rifle_M14EBR extends KFWeap_ScopedBase;

defaultproperties
{
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
      FieldOfView=12.500000
      NearPlane=10.000000
      FarPlane=0.000000
      bUpdateMatrices=False
      bEnabled=False
      bEnableFog=True
      ViewMode=SceneCapView_Lit
      FrameRate=60.000000
      Name="SceneCapture2DComponent0"
      ObjectArchetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
   End Object
   SceneCapture=SceneCapture2DComponent0
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_M14EBR_MAT_TWO.WEP_1P_M14EBR_Scope_MAT'
   ScopedSensitivityMod=8.000000
   InventorySize=7
   MagazineCapacity(0)=20
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasLaserSight=True
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshFOV=70.000000
   MeshIronSightFOV=27.000000
   PlayerIronSightFOV=70.000000
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR'
   SpareAmmoCapacity(0)=120
   InitialSpareMags(0)=2
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Handling_DryFire'
   PlayerViewOffset=(X=15.000000,Y=11.500000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_M14EBR_ARCH.Wep_M14EBR_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_M14EBR:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_M14EBR_ARCH.Wep_M14EBR_MuzzleFlash'
   LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'
   maxRecoilPitch=225
   minRecoilPitch=200
   maxRecoilYaw=200
   minRecoilYaw=-200
   RecoilRate=0.080000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=150
   RecoilISMinYawLimit=65385
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   AssociatedPerkClass=Class'KFGame.KFPerk_Sharpshooter'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_M14EBR'
   FireInterval(0)=0.220000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.006000
   InstantHitDamage(0)=90.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=27.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_M14EBR'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_M14EBR'
   FireOffset=(X=30.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_M14EBR_MESH.WEP_1stP_M14_EBR'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_M14EBR_ANIM.Wep_1stP_M14_EBR_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="M14 EBR"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_M14EBR_MESH.Wep_M14EBR_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=SceneCapture2DComponent0
   Name="Default__KFWeap_Rifle_M14EBR"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
