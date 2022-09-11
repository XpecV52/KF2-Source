//=============================================================================
// KFWeap_AssaultRifle_DualMKb42_Hans
//=============================================================================
// Dual MKb42 assault rifles for the Hans Boss character
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_AssaultRifle_DualMKb42_Hans extends KFWeap_RifleBase;

simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local KFProjectile	SpawnedProjectile;
	local int ProjDamage;

	// Spawn projectile
	SpawnedProjectile = Spawn( KFProjClass, Self,, RealStartLoc);
	if( SpawnedProjectile != none && !SpawnedProjectile.bDeleteMe )
	{
		// Mirror damage and damage type from weapon. This is set on the server only and
		// these properties are replicated via TakeHitInfo
		if ( InstantHitDamage.Length > CurrentFireMode && InstantHitDamageTypes.Length > CurrentFireMode )
		{
            ProjDamage = InstantHitDamage[CurrentFireMode];
            SpawnedProjectile.Damage = ProjDamage;
            SpawnedProjectile.MyDamageType = InstantHitDamageTypes[CurrentFireMode];
		}

		// Set the penetration power for this projectile
        if( SpawnedProjectile != none )
        {
			SpawnedProjectile.PenetrationPower = GetInitialPenetrationPower(CurrentFireMode);
        }

		SpawnedProjectile.Init( AimDir );
	}

	// return it up the line
	return SpawnedProjectile;
}

/** Overridden. Hans does not consume ammo */
simulated function ConsumeAmmo( byte FireModeNum )
{
}

defaultproperties
{
   bHasIronSights=True
   bUseAnimLenEquipTime=False
   SingleFireSoundIndex=1
   InventorySize=6
   MeshFOV=75.000000
   MeshIronSightFOV=33.000000
   PlayerIronSightFOV=70.000000
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AK12'
   MagazineCapacity(0)=60
   SpareAmmoCapacity(0)=270
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MkB42.Play_WEP_SA_MkB42_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_SA_MkB42.Play_WEP_SA_MkB42_Fire_3P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_MkB42.Play_WEP_SA_MkB42_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_SA_MkB42.Play_WEP_SA_MkB42_Fire_3P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MkB42.Play_WEP_SA_MkB42_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_SA_MkB42.Play_WEP_SA_MkB42_Fire_3P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   PlayerViewOffset=(X=2.000000,Y=8.000000,Z=-3.000000)
   AttachmentArchetype=KFWeapAttach_DualBase'WEP_DualMKB42_ARCH.Wep_DualMKB42_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_DualMKb42_Hans:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash'
   maxRecoilPitch=200
   minRecoilPitch=150
   maxRecoilYaw=175
   minRecoilYaw=-125
   RecoilRate=0.085000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=2.500000
   AssociatedPerkClasses(0)=None
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.060000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.174000
   InstantHitDamage(0)=10.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HansAK12'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=32.000000,Y=4.000000,Z=-5.000000)
   bCanThrow=False
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
   bDropOnDeath=False
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_DualMKb42_Hans"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
