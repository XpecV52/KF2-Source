//=============================================================================
// KFWeap_AssaultRifle_Microwave
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_Microwave extends KFWeap_RifleBase;

/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdAnim;

// Iron Sights
/** Animation to play when the weapon is fired in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdSightedAnim;

var int BurstAmountBegin;

simulated state WeaponBurstFiring
{
	simulated event BeginState(Name PreviousStateName)
	{
		BurstAmountBegin = GetBurstAmount();
		Super.BeginState(PreviousStateName);
	}

	simulated function name GetWeaponFireAnim(byte FireModeNum)
	{
		// only do one burst animation instead of a burst animation per shot
		// since burst amount gets reduced after each shot, this will only play the one animation based on the number of shots in the burst fire
		if (BurstAmount == BurstAmountBegin)
		{
			if (BurstAmount == 3)
			{
				if (bUsingSights)
				{
					return BurstFire3RdSightedAnim;
				}
				return BurstFire3RdAnim;
			}
			else if (BurstAmount == 2)
			{
				if (bUsingSights)
				{
					return BurstFire2RdSightedAnim;
				}
				return BurstFire2RdAnim;
			}
			else
			{
				return super.GetWeaponFireAnim(FireModeNum);
			}
		}

		// will not play any animation
		return '';
	}
}

defaultproperties
{
   BurstFire2RdAnim="Shoot_Burst2"
   BurstFire3RdAnim="Shoot_Burst"
   BurstFire2RdSightedAnim="Shoot_Burst2_Iron"
   BurstFire3RdSightedAnim="Shoot_Burst_Iron"
   PackageKey="Microwave_Assault"
   FirstPersonMeshName="WEP_1P_Microwave_Assault_MESH.Wep_1stP_Microwave_Assault_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Microwave_Assault_ANIM.WEP_1P_Microwave_Assault_ANIM"
   PickupMeshName="WEP_3P_Microwave_Assault_MESH.Wep_3rdP_Microwave_Assault_Pickup"
   AttachmentArchetypeName="WEP_Microwave_Assault_ARCH.Microwave_Assault_3rdP"
   MuzzleFlashTemplateName="WEP_Microwave_Assault_ARCH.Wep_Microwave_Gun_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   SingleFireSoundIndex=1
   BurstAmount=3
   InventorySize=8
   MagazineCapacity(0)=40
   PenetrationPower(0)=5.000000
   PenetrationPower(1)=5.000000
   MeshFOV=70.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=10.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Microwave_Assault_TEX.UI_WeaponSelect_Microwave_Assault'
   SpareAmmoCapacity(0)=280
   InitialSpareMags(0)=2
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Helios.Play_WEP_Helios_Shoot_FullAuto_LP_3P',FirstPersonCue=AkEvent'WW_WEP_Helios.Play_WEP_Helios_Shoot_FullAuto_LP_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Helios.Play_WEP_Helios_Shoot_Single_3P',FirstPersonCue=AkEvent'WW_WEP_Helios.Play_WEP_Helios_Shoot_Single_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Helios.Play_WEP_Helios_Shoot_FullAuto_LP_End_3P',FirstPersonCue=AkEvent'WW_WEP_Helios.Play_WEP_Helios_Shoot_FullAuto_LP_End_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'
   PlayerViewOffset=(X=30.000000,Y=10.000000,Z=-2.500000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_Microwave:MeleeHelper_0'
   maxRecoilPitch=125
   minRecoilPitch=100
   maxRecoilYaw=120
   minRecoilYaw=-100
   RecoilRate=0.085000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=4.000000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Firebug'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000),(Add=1)))
   FiringStatesArray(1)="WeaponBurstFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_MicrowaveRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_MicrowaveRifle'
   FireInterval(0)=0.100000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   Spread(1)=0.008500
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=50.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_MicrowaveRifle'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_MicrowaveRifle'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_MicrowaveRifle'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Helios Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_Microwave"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
