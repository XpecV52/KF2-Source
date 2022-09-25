//=============================================================================
// KFWeap_AssaultRifle_G36C
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_G36C extends KFWeap_SMGBase;

simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
{
    super.ZoomIn(bAnimateTransition, ZoomTimeToGo);

    if (LaserSight != none)
    {
		LaserSight.ChangeVisibility(false);
    }
}

simulated function ZoomOut( bool bAnimateTransition, float ZoomTimeToGo )
{
	super.ZoomOut( bAnimateTransition, ZoomTimeToGo );

    if (LaserSight != none)
    {
		LaserSight.ChangeVisibility(true);
	}
}

simulated function AttachLaserSight()
{
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
        return;
	}

	super.AttachLaserSight();

	if (LaserSight != none)
	{
		LaserSight.bForceDotToMatch = true;
	}
}

defaultproperties
{
   PackageKey="G36C"
   FirstPersonMeshName="WEP_1P_G36C_MESH.Wep_1stP_G36C_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_G36C_ANIM.Wep_1stP_G36C_Anim"
   PickupMeshName="WEP_3P_G36C_MESH.Wep_G36C_Pickup"
   AttachmentArchetypeName="WEP_G36C_ARCH.Wep_G36C_3P"
   MuzzleFlashTemplateName="WEP_G36C_ARCH.Wep_G36C_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   bHasLaserSight=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=7
   PenetrationPower(0)=4.000000
   PenetrationPower(1)=4.000000
   MeshFOV=70.000000
   MeshIronSightFOV=20.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=40.000000,Y=0.100000,Z=-4.570000)
   DOF_FG_FocalRadius=150.000000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'wep_ui_g36c_tex.UI_WeaponSelect_G36C'
   MagazineCapacity(0)=30
   SpareAmmoCapacity(0)=450
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(1)="RW_Charging_Handle"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_G36C.Play_WEP_G36C_3P_Shoot_LP',FirstPersonCue=AkEvent'WW_WEP_G36C.Play_WEP_G36C_1P_Shoot_LP')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_G36C.Play_WEP_G36C_3P_Shoot_Single',FirstPersonCue=AkEvent'WW_WEP_G36C.Play_WEP_G36C_1P_Shoot_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_G36C.Play_WEP_G36C_3P_End_LP',FirstPersonCue=AkEvent'WW_WEP_G36C.Play_WEP_G36C_1P_End_LP')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   PlayerViewOffset=(X=14.000000,Y=11.000000,Z=-5.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_G36C:MeleeHelper_0'
   LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'
   maxRecoilPitch=50
   minRecoilPitch=40
   maxRecoilYaw=70
   minRecoilYaw=-70
   RecoilRate=0.085000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=100
   RecoilISMinYawLimit=65460
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=6.000000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.080000
   FireInterval(1)=0.080000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   Spread(1)=0.005000
   InstantHitDamage(0)=45.000000
   InstantHitDamage(1)=45.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_G36C'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_G36C'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_G36C'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="G36C Assault Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_G36C"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
