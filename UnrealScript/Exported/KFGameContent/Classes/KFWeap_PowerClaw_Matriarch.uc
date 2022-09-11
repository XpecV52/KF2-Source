//=============================================================================
// KFWeap_PowerClaw_Matriarch
//=============================================================================
// Matriarch's Power Claw / Tesla Beam Shooter
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_PowerClaw_Matriarch extends KFWeap_RifleBase;

var float ChainMaxDist;
var array<ImpactInfo> Impacts;

simulated function StartFire(byte FireModeNum)
{
	Impacts.Length = 0;
	super.StartFire(FireModeNum);
}

simulated function Projectile ProjectileFire()
{
	InstantFireClient();
	return none;
}

simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum)
{
	local KFPawn HitPawn, NearbyPawn;
	local float DistSqToNearbyPawn, MaxDistSq;
	local vector StartTrace, EndTrace, TraceNormal, HitPawnBoneLocation, NearbyPawnBoneLocation;
	local array<KFPawn> SourcePawns, TargetPawns, HitPawns, NewHitPawns;
	local int i;
	local KFProj_Bullet_MatriarchTeslaBlast MatProj;

	if (Role == ROLE_Authority)
	{
		HitPawn = KFPawn(Impact.HitActor);
		if (HitPawn == none)
		{
			return;
		}

		HitPawns.AddItem(HitPawn);
		NewHitPawns.AddItem(HitPawn);
		SourcePawns.AddItem(KFPawn(Owner));
		TargetPawns.AddItem(HitPawn);
		Impacts.AddItem(Impact);

		MaxDistSq = ChainMaxDist * ChainMaxDist;

		while (NewHitPawns.Length > 0)
		{
			HitPawn = NewHitPawns[0];
			NewHitPawns.Remove(0, 1);

			foreach WorldInfo.AllPawns(class'KFPawn', NearbyPawn)
			{
				if (NearbyPawn == Owner)
				{
					continue;
				}

				if (HitPawns.Find(NearbyPawn) != INDEX_NONE)
				{
					continue;
				}

				HitPawnBoneLocation = HitPawn.Mesh.GetBoneLocation(class'KFPawn_ZedMatriarch'.default.GunTargetBoneName);
				NearbyPawnBoneLocation = NearbyPawn.Mesh.GetBoneLocation(class'KFPawn_ZedMatriarch'.default.GunTargetBoneName);

				DistSqToNearbyPawn = VSizeSq(NearbyPawnBoneLocation - HitPawnBoneLocation);
				if (DistSqToNearbyPawn < MaxDistSq)
				{
					TraceNormal = Normal(NearbyPawnBoneLocation - HitPawnBoneLocation);
					StartTrace = HitPawnBoneLocation + TraceNormal * HitPawn.GetCollisionRadius();
					EndTrace = NearbyPawnBoneLocation + TraceNormal * NearbyPawn.GetCollisionRadius();
					Impact = CalcWeaponFire(StartTrace, EndTrace);
					if (Impact.HitActor == NearbyPawn)
					{
						HitPawns.AddItem(NearbyPawn);
						NewHitPawns.AddItem(NearbyPawn);
						SourcePawns.AddItem(HitPawn);
						TargetPawns.AddItem(NearbyPawn);
						Impacts.AddItem(Impact);
					}
				}
			}
		}

		for (i = 0; i < Impacts.Length; ++i)
		{
			super.ProcessInstantHitEx(FiringMode, Impacts[i], NumHits, out_PenetrationVal);
			MatProj = Spawn(
				class'KFProj_Bullet_MatriarchTeslaBlast',
				self,,
				Impacts[i].StartTrace,
				rotator(Impacts[i].RayDir),,
				true);

			MatProj.SourcePawn = SourcePawns[i];
			MatProj.TargetPawn = TargetPawns[i];
			MatProj.bSyncToOriginalLocation = (i == 0);
			MatProj.Init(Impacts[i].RayDir);
			MatProj.bForceNetUpdate = true;
			if (WorldInfo.NetMode != NM_DedicatedServer)
			{
				MatProj.ActivateVFX();
			}
			MatProj.Shutdown();
		}
	}
}

/** Overridden. Matriarch does not consume ammo */
simulated function ConsumeAmmo(byte FireModeNum);

/** Overridden, sprint is controlled by AI */
simulated function StopPawnSprint(bool bClearPlayerInput);

simulated state Active
{
	simulated function GotoWeaponSprinting();
}

defaultproperties
{
   ChainMaxDist=650.000000
   bHasIronSights=True
   bUseAnimLenEquipTime=False
   SingleFireSoundIndex=1
   InventorySize=6
   MeshFOV=75.000000
   MeshIronSightFOV=33.000000
   PlayerIronSightFOV=70.000000
   GroupPriority=50.000000
   MagazineCapacity(0)=60
   SpareAmmoCapacity(0)=270
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=False
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_ZED_Matriarch.Play_Matriarch_Tesla_Blast_Attack_01',FirstPersonCue=AkEvent'WW_ZED_Matriarch.Play_Matriarch_Tesla_Blast_Attack_01')
   WeaponDryFireSnd(0)=AkEvent'WW_ZED_Matriarch.Play_Matriarch_SFX_Attack_Gun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_ZED_Matriarch.Play_Matriarch_SFX_Attack_Gun_DryFire'
   PlayerViewOffset=(X=2.000000,Y=8.000000,Z=-3.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Matriarch_ARCH.Wep_Matriarch_PowerClaw_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_PowerClaw_Matriarch:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'ZED_Matriarch_ARCH.Tesla_Blast_MuzzleFlash_Arch'
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
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_MatriarchTeslaBlast'
   FireInterval(0)=0.060000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.000000
   InstantHitDamage(0)=65.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_EMP_MatriarchTeslaBlast'
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
   Name="Default__KFWeap_PowerClaw_Matriarch"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
