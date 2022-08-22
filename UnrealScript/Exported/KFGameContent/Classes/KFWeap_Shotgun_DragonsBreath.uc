//=============================================================================
// KFWeap_Shotgun_DragonsBreath
//=============================================================================
// A trench shotgun with incendiary rounds Dragons Breath!
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeap_Shotgun_DragonsBreath extends KFWeap_ShotgunBase;

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Flame;
}

defaultproperties
{
   NumPellets(0)=10
   NumPellets(1)=()
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=5
   MagazineCapacity(0)=6
   bHasIronSights=True
   bCanBeReloaded=True
   PenetrationPower(0)=3.000000
   PenetrationPower(1)=()
   MeshFOV=75.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=7.000000,Y=0.000000,Z=-0.000000)
   DOF_FG_FocalRadius=95.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_DragonsBreath.UI_WeaponSelect_DragonsBreath'
   SpareAmmoCapacity(0)=45
   InitialSpareMags(0)=3
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
   PlayerViewOffset=(X=10.000000,Y=7.500000,Z=-4.500000)
   AttachmentArchetype=KFWeaponAttachment'WEP_DragonsBreath_ARCH.Wep_DragonsBreath_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_DragonsBreath:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_DragonsBreath_ARCH.Wep_DragonsBreath_MuzzleFlash_3P'
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
   AssociatedPerkClass=Class'KFGame.KFPerk_Firebug'
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
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_DragonsBreath'
   FireInterval(0)=0.770000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.100000
   Spread(1)=()
   InstantHitDamage(0)=15.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_DragonsBreath'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_DragonsBreath'
   FireOffset=(X=30.000000,Y=3.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_DragonsBreath_MESH.Wep_1stP_DragonsBreath_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_DragonsBreath_ANIM.WEP_1P_DragonsBreath_ANIM'
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
   ItemName="Incendiary Trench Gun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_DragonsBreath_MESH.Wep_DragonsBreath_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_DragonsBreath"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
