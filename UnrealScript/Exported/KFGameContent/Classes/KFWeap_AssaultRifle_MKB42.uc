//=============================================================================
// KFWeap_AssaultRifle_MKB42
//=============================================================================
// An MKB42 Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_MKB42 extends KFWeap_RifleBase;

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
   PackageKey="MKB42"
   FirstPersonMeshName="wep_1p_mkb42_mesh.Wep_1stP_MKB42_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_mkb42_anim.wep_1p_mkb42_anim"
   PickupMeshName="WEP_3P_MKB42_MESH.Wep_3rdP_MKB42_Pickup"
   AttachmentArchetypeName="WEP_MKB42_ARCH.Wep_MKB42_3P"
   MuzzleFlashTemplateName="WEP_MKB42_ARCH.Wep_MKB42_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=7
   MeshFOV=75.000000
   MeshIronSightFOV=33.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=15.000000,Y=0.000000,Z=0.000000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_MKB42_TEX.UI_WeaponSelect_MKB42'
   MagazineCapacity(0)=30
   SpareAmmoCapacity(0)=270
   InitialSpareMags(0)=3
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MKB42.Play_WEP_MKB42_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_MKB42.Play_WEP_MKB42_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_MKB42.Play_WEP_MKB42_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_MKB42.Play_WEP_MKB42_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_MKB42.Play_WEP_MKB42_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_MKB42.Play_WEP_MKB42_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AK12.Play_WEP_SA_AK12_Handling_DryFire'
   PlayerViewOffset=(X=20.000000,Y=8.000000,Z=-2.500000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_MKB42:MeleeHelper_0'
   maxRecoilPitch=150
   minRecoilPitch=100
   maxRecoilYaw=224
   minRecoilYaw=-224
   RecoilRate=0.110000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Stat=EWUS_Damage1,Scale=1.400000),(Add=2)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.120000
   FireInterval(1)=0.120000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   Spread(1)=0.008500
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=50.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_MKB42'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_MKB42'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_MKB42'
   FireOffset=(X=32.000000,Y=4.000000,Z=-5.000000)
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
   ItemName="MKb.42(H) Carbine Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_MKB42"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
