//=============================================================================
// KFWeap_AssaultRifle_FNFal
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 20177 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_FNFal extends KFWeap_ScopedBase;

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
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_FNFAL_MAT.WEP_1P_FNFAL_Scope_MAT'
   ScopedSensitivityMod=8.000000
   PackageKey="FNFAL"
   FirstPersonMeshName="WEP_1P_FNFAL_MESH.WEP_1stP_FNFAL_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_FNFAL_ANIM.Wep_1stP_FNFAL_Anim"
   PickupMeshName="WEP_3P_FNFAL_MESH.WEP_3rdP_FNFAL_Pickup"
   AttachmentArchetypeName="WEP_FNFAL_ARCH.Wep_FNFAL_3P"
   MuzzleFlashTemplateName="WEP_FNFAL_ARCH.Wep_FNFAL_MuzzleFlash"
   bUseAltFireMode=True
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=8
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=2.000000
   MeshFOV=55.000000
   MeshIronSightFOV=20.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=15.000000,Y=0.000000,Z=0.000000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL'
   MagazineCapacity(0)=20
   SpareAmmoCapacity(0)=160
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_DryFire'
   PlayerViewOffset=(X=22.000000,Y=11.000000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_FNFal:MeleeHelper_0'
   maxRecoilPitch=200
   minRecoilPitch=165
   maxRecoilYaw=190
   minRecoilYaw=-165
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=150
   RecoilISMinYawLimit=65385
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Sharpshooter'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Commando'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.099000
   FireInterval(1)=0.220000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.007000
   Spread(1)=0.007000
   InstantHitDamage(0)=70.000000
   InstantHitDamage(1)=70.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_FNFal'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_FNFal'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_FNFal'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
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
   ItemName="FN FAL ACOG"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=SceneCapture2DComponent0
   Name="Default__KFWeap_AssaultRifle_FNFal"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
