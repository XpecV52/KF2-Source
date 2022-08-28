//=============================================================================
// KFWeap_Minigun_Patriarch
//=============================================================================
// Patriarch's minigun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Minigun_Patriarch extends KFWeap_RifleBase;

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

/** Overridden. Patriarch does not consume ammo */
simulated function ConsumeAmmo( byte FireModeNum )
{
}

/** Overridden, sprint is controlled by AI */
simulated function StopPawnSprint(bool bClearPlayerInput)
{
}

simulated state Active
{
	simulated function GotoWeaponSprinting()
	{
	}
}

/** Overridden to give the minigun more vertical spread */
simulated function rotator AddSpread(rotator BaseAim)
{
	local vector X, Y, Z;
	local float CurrentSpread, RandY, RandZ;

	CurrentSpread = Spread[CurrentFireMode];

	// Add in any spread.
	GetAxes(BaseAim, X, Y, Z);
	RandY = fRand() < 0.5f ? -fRand() : fRand();
	RandZ = fRand() < 0.5f ? -fRand() : fRand();
	return rotator( X + (RandY * CurrentSpread * Y) + (RandZ * CurrentSpread * Z) );
}

defaultproperties
{
   WeaponContentLoaded=True
   bHasIronSights=True
   bUseAnimLenEquipTime=False
   SingleFireSoundIndex=1
   InventorySize=6
   MagazineCapacity(0)=60
   MeshFOV=75.000000
   MeshIronSightFOV=33.000000
   PlayerIronSightFOV=70.000000
   GroupPriority=50.000000
   SpareAmmoCapacity(0)=270
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_LP',FirstPersonCue=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_LP')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_Tail',FirstPersonCue=AkEvent'WW_ZED_Patriarch.Play_Mini_Gun_Tail')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   PlayerViewOffset=(X=2.000000,Y=8.000000,Z=-3.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Patriarch_ARCH.Wep_Patriarch_Minigun_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Minigun_Patriarch:MeleeHelper_0'
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
   Spread(0)=0.070000
   InstantHitDamage(0)=8.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_PatMinigun'
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
   Name="Default__KFWeap_Minigun_Patriarch"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
