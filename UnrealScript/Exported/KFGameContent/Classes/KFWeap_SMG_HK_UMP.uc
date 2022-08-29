//=============================================================================
// KFWeap_SMG_HK_UMP
//=============================================================================
// Weapon class for Heckler UMP
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_SMG_HK_UMP extends KFWeap_SMGBase;

/** RecoilRate when firing in burst fire. */
var(Recoil) float BurstFireRecoilRate;
/** How much to scale recoil when firing in burst fire. */
var(Recoil) float BurstFireRecoilModifier;

// Standard
/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdAnim;

// Iron Sights
/** Animation to play when the weapon is fired in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdSightedAnim;

/** Sound to play when the weapon is fired in burst mode with 2 rounds left  */
var(Sounds)	WeaponFireSndInfo	WeaponFire2RdSnd;
/** Sound to play when the weapon is fired in burst fire mode for 3 rounds */
var(Sounds)	WeaponFireSndInfo	WeaponFire3RdSnd;
/** Keeps track of whether or not the gun has played fire effects this burst. */
var bool bBurstPlayedFireEffects;

/*********************************************************************************************
* State WeaponBurstFiring
* Fires a burst of bullets. Fire must be released between every shot.
*********************************************************************************************/

simulated state WeaponBurstFiring
{
	simulated function BeginState(Name PrevStateName)
{
	// Modify the recoil for burst fire
	RecoilRate = BurstFireRecoilRate;

	// Initialize recoil blend out settings
	if (RecoilRate > 0 && RecoilBlendOutRatio > 0)
	{
		RecoilYawBlendOutRate = maxRecoilYaw / RecoilRate * RecoilBlendOutRatio;
		RecoilPitchBlendOutRate = maxRecoilPitch / RecoilRate * RecoilBlendOutRatio;
	}

	bBurstPlayedFireEffects = false;

	super.BeginState(PrevStateName);
}


/**
* PlayFireEffects Is the root function that handles all of the effects associated with
* a weapon.  This function creates the 1st person effects.  It should only be called
* on a locally controlled player.
*/
simulated function PlayFireEffects(byte FireModeNum, optional vector HitLocation)
{
	local name WeaponFireAnimName;

	// Only play the burst fire sound on the first shot as the sound includes additional shot sounds baked in
	if (FireModeNum != ALTFIRE_FIREMODE || (FireModeNum == ALTFIRE_FIREMODE &&
		(!bBurstPlayedFireEffects || (self.WorldInfo.TimeDilation < 1.f))) )
		{
		PlayFiringSound(CurrentFireMode);
		}

	if (Instigator != none)
	{
		UpdateWeaponAttachmentAnimRate(GetThirdPersonAnimRate());

		if (Instigator.IsFirstPerson())
		{
			if (!bPlayingLoopingFireAnim && (FireModeNum != ALTFIRE_FIREMODE || (FireModeNum == ALTFIRE_FIREMODE &&
				!bBurstPlayedFireEffects)))
			{
				WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);

				if (WeaponFireAnimName != '')
				{
					PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
				}
			}

			HandleRecoil();

			ShakeView();

			// Start muzzle flash effect
			CauseMuzzleFlash(FireModeNum);
		}
	}

	bBurstPlayedFireEffects = true;
}

/** Overridden to include the BurstFireModifier*/
simulated function ModifyRecoil(out float CurrentRecoilModifier)
{
	super.ModifyRecoil(CurrentRecoilModifier);
	CurrentRecoilModifier *= BurstFireRecoilModifier;
}

/** Get name of the animation to play for PlayFireEffects. Overriden to play the right animation for the number of shots in the burst fire */
simulated function name GetWeaponFireAnim(byte FireModeNum)
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

/**
* Tells the weapon to play a firing sound (uses CurrentFireMode)
*/
simulated function PlayFiringSound(byte FireModeNum)
{
	if (!bPlayingLoopingFireSnd && BurstAmount > 1 && !(self.WorldInfo.TimeDilation < 1.f) )
		{
		MakeNoise(1.0, 'PlayerFiring');
		if (BurstAmount == 3)
		{
			WeaponPlayFireSound(WeaponFire3RdSnd.DefaultCue, WeaponFire3RdSnd.FirstPersonCue);
		}
		else if (BurstAmount == 2)
		{
			WeaponPlayFireSound(WeaponFire2RdSnd.DefaultCue, WeaponFire2RdSnd.FirstPersonCue);
		}
		}
	else
	{
		super.PlayFiringSound(FireModeNum);
	}
}

simulated event EndState(Name NextStateName)
{
	// Set recoil settings back to normal
	RecoilRate = default.RecoilRate;

	// Initialize recoil blend out settings
	if (RecoilRate > 0 && RecoilBlendOutRatio > 0)
	{
		RecoilYawBlendOutRate = maxRecoilYaw / RecoilRate * RecoilBlendOutRatio;
		RecoilPitchBlendOutRate = maxRecoilPitch / RecoilRate * RecoilBlendOutRatio;
	}

	Super.EndState(NextStateName);
}
}

defaultproperties
{
   BurstFireRecoilRate=0.085000
   BurstFireRecoilModifier=1.000000
   BurstFire2RdAnim="Shoot_Burst2"
   BurstFire3RdAnim="Shoot_Burst"
   BurstFire2RdSightedAnim="Shoot_Burst2_Iron"
   BurstFire3RdSightedAnim="Shoot_Burst_Iron"
   WeaponFire2RdSnd=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_2Round',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_2Round')
   WeaponFire3RdSnd=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_3Round',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_3Round')
   PackageKey="HK_UMP"
   FirstPersonMeshName="WEP_1P_HK_UMP_MESH.Wep_1stP_HK_UMP_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HK_UMP_ANIM.WEP_1stP_HK_UMP_Anim"
   PickupMeshName="WEP_3P_HK_UMP_MESH.Wep_3rdP_HK_UMP_Pickup"
   AttachmentArchetypeName="WEP_HK_UMP_ARCH.Wep_HK_UMP_3P"
   MuzzleFlashTemplateName="WEP_HK_UMP_ARCH.Wep_HK_UMP_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   SingleFireSoundIndex=1
   BurstAmount=3
   InventorySize=5
   MagazineCapacity(0)=30
   MeshIronSightFOV=50.000000
   GroupPriority=90.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HK_UMP_TEX.UI_WeaponSelect_UMP'
   SpareAmmoCapacity(0)=290
   InitialSpareMags(0)=2
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_UMP.Play_WEP_UMP_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   PlayerViewOffset=(X=3.000000,Y=10.000000,Z=-2.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_SMG_HK_UMP:MeleeHelper_0'
   maxRecoilPitch=120
   minRecoilPitch=92
   maxRecoilYaw=101
   minRecoilYaw=-101
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.400000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.130000),(Stat=EWUS_Damage1,Scale=1.130000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.240000),(Stat=EWUS_Damage1,Scale=1.240000),(Add=2)))
   FiringStatesArray(1)="WeaponBurstFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.100000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   Spread(1)=0.010000
   InstantHitDamage(0)=45.000000
   InstantHitDamage(1)=45.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HK_UMP'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HK_UMP'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HK_UMP'
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
   ItemName="Heckler & Koch UMP"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_SMG_HK_UMP"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
