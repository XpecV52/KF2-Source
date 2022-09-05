//=============================================================================
// KFWeap_Bow_Crossbow
//=============================================================================
// A crossbow
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Bow_Crossbow extends KFWeap_ScopedBase;

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
    {
        return true;
    }

    return false;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( AmmoCount[0] > 0 )
	{
		// Disable half-reloads for now.  This can happen if server gets out
		// of sync, but choosing the wrong animation will just make it worse!
		WarnInternal("Grenade launcher reloading with non-empty mag");
	}

	return bTacticalReload ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
}

/** Returns trader filter index based on weapon type (copied from riflebase) */
static simulated event EFilterTypeUI GetTraderFilter()
{
    return FT_Projectile;
}

defaultproperties
{
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
      FieldOfView=18.500000
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
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_Crossbow_MAT.WEP_1P_Crossbow_Scope_MAT'
   ScopedSensitivityMod=12.000000
   PackageKey="Crossbow"
   FirstPersonMeshName="WEP_1P_Crossbow_MESH.Wep_1stP_Crossbow_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Crossbow_ANIM.Wep_1stP_Crossbow_Anim"
   PickupMeshName="WEP_3P_Crossbow_MESH.Wep_Crossbow_Pickup"
   AttachmentArchetypeName="WEP_Crossbow_ARCH.Wep_Crossbow_3P"
   MuzzleFlashTemplateName="WEP_Crossbow_ARCH.Wep_Crossbow_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletArrow'
   FireModeIconPaths(1)=()
   InventorySize=6
   MagazineCapacity(0)=1
   PenetrationPower(0)=4.000000
   PenetrationPower(1)=()
   MeshFOV=70.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=-13.000000,Y=0.000000,Z=0.000000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   MaxAIWarningDistSQ=4000000.000000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow'
   SpareAmmoCapacity(0)=34
   InitialSpareMags(0)=13
   AmmoPickupScale(0)=3.000000
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_Cable_Parent"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_DryFire'
   PlayerViewOffset=(X=1.000000,Y=8.000000,Z=-5.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Bow_Crossbow:MeleeHelper_0'
   maxRecoilPitch=200
   minRecoilPitch=150
   maxRecoilYaw=100
   minRecoilYaw=-100
   RecoilRate=0.060000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Add=2)))
   WeaponUpgrades(3)=(Stats=((Stat=EWUS_Damage0,Scale=1.600000),(Add=3)))
   FiringStatesArray(0)="WeaponSingleFireAndReload"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bolt_Crossbow'
   FireInterval(0)=0.300000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.007000
   InstantHitDamage(0)=350.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Piercing_Crossbow'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Crossbow'
   FireOffset=(X=25.000000,Y=3.000000,Z=-4.000000)
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
   ItemName="Crossbow"
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
   Name="Default__KFWeap_Bow_Crossbow"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
