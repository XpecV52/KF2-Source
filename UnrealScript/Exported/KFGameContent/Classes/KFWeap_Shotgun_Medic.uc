//=============================================================================
// KFWeap_Shotgun_Medic
//=============================================================================
// A Medic Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeap_Shotgun_Medic extends KFWeap_MedicBase;

/*********************************************************************************************
 Firing / Projectile - Below projectile spawning code copied from KFWeap_ShotgunBase
********************************************************************************************* */

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnAllProjectiles( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local KFPerk InstigatorPerk;

    if( CurrentFireMode == GRENADE_FIREMODE )
    {
        return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }

    InstigatorPerk = GetPerk();
    if( InstigatorPerk != none )
    {
    	Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
    }

	return super.SpawnAllProjectiles(KFProjClass, RealStartLoc, AimDir);
}

/** Disable normal bullet spread */
simulated function rotator AddSpread(rotator BaseAim)
{
	return BaseAim; // do nothing
}

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Shotgun;
}

defaultproperties
{
   HealingDartDamageType=Class'kfgamecontent.KFDT_Dart_Healing'
   HealFullRechargeSeconds=12.000000
   HealImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Heal'
   HurtImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Hurt'
   DartFireSnd=(DefaultCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Fire_1P')
   HealingDartWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Default_Recoil'
   LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Locked_1P'
   LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Lost_1P'
   LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Alert_Locking_1P'
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
   PackageKey="Medic_Shotgun"
   FirstPersonMeshName="WEP_1P_Medic_Shotgun_MESH.Wep_1stP_Medic_Shotgun_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Medic_Shotgun_ANIM.WEP_1P_Medic_Shotgun_ANIM"
   PickupMeshName="wep_3p_medic_shotgun_mesh.Wep_Medic_Shotgun_Pickup"
   AttachmentArchetypeName="WEP_Medic_Shotgun_ARCH.Wep_Medic_Shotgun_3P"
   MuzzleFlashTemplateName="WEP_Medic_Shotgun_ARCH.Wep_Medic_Shotgun_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
   InventorySize=6
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=12.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=95.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicShotgun'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   MagazineCapacity(0)=10
   AmmoCost(1)=40
   SpareAmmoCapacity(0)=90
   InitialSpareMags(0)=3
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicShotgun.Play_SA_MedicShotgun_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=14.000000,Y=6.500000,Z=-3.500000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MedicBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MedicBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_Medic:MeleeHelper_0'
   NumPellets(0)=6
   NumPellets(1)=()
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=400
   minRecoilPitch=375
   maxRecoilYaw=250
   minRecoilYaw=-250
   RecoilRate=0.075000
   RecoilBlendOutRatio=0.250000
   RecoilViewRotationScale=0.700000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.500000
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1),(Stat=EWUS_HealFullRecharge,Scale=0.800000)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Add=2),(Stat=EWUS_HealFullRecharge,Scale=0.600000)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_HealingDart_MedicBase'
   FireInterval(0)=0.200000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.070000
   Spread(1)=()
   InstantHitDamage(0)=25.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Shotgun_Medic'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Dart_Toxic'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Shotgun_Medic'
   FireOffset=(X=30.000000,Y=3.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MedicBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MedicBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HMTech-301 Shotgun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MedicBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MedicBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_Medic"
   ObjectArchetype=KFWeap_MedicBase'KFGame.Default__KFWeap_MedicBase'
}
