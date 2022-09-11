//=============================================================================
// KFWeap_RocketLauncher_SealSqueal
//=============================================================================
// The Seal Squeal rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFWeap_RocketLauncher_SealSqueal extends KFWeap_GrenadeLauncher_Base;

var(Animations) const editconst name DetonateAnim;
var(Animations) const editconst name DetonateAnimLast;
var(Animations) const editconst name DetonateAnimIron;
var(Animations) const editconst name DetonateAnimIronLast;

/** List of spawned harpoons (will be detonated oldest to youngest) */
var array<KFProj_Rocket_SealSqueal> DeployedHarpoons;

/** Same as DeployedHarpoons.Length, but replicated because harpoons are only tracked on server */
var int NumDeployedHarpoons;

/** Reduction for the amount of damage dealt to the weapon owner (including damage by the explosion) */
var float SelfDamageReductionValue;

/** Camera shake when detonating the harpoons */
var	CameraAnim	DetonateCameraAnim;
var float DetonateCameraAnimPlayRate;
var float DetonateCameraAnimScale;

replication
{
	if( bNetDirty )
		NumDeployedHarpoons;
}

/**
 * Toggle between DEFAULT and ALTFIRE
 */
simulated function AltFireMode()
{
	// skip super

	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/** Overridded to add spawned charge to list of spawned charges */
simulated function Projectile ProjectileFire()
{
	local Projectile P;
	local KFProj_Rocket_SealSqueal Harpoon;

	P = super.ProjectileFire();

	Harpoon = KFProj_Rocket_SealSqueal(P);
	if (Harpoon != none)
	{
		DeployedHarpoons.AddItem(Harpoon);
		NumDeployedHarpoons = DeployedHarpoons.Length;
		bForceNetUpdate = true;
	}

	return P;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName(bool bTacticalReload)
{
	// magazine relaod
	if (AmmoCount[0] > 0)
	{
		return (bTacticalReload) ? ReloadNonEmptyMagEliteAnim : ReloadNonEmptyMagAnim;
	}
	else
	{
		return (bTacticalReload) ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
	}
}

function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
	super.AdjustDamage(InDamage, DamageType, DamageCauser);

	if (Instigator != none && DamageCauser != none && DamageCauser.Instigator == Instigator)
	{
		InDamage *= SelfDamageReductionValue;
	}
}

/*********************************************************************************************
 * State WeaponDetonating
 * The weapon is in this state while detonating a charge
*********************************************************************************************/

simulated function GotoActiveState();

simulated state WeaponDetonating
{
	ignores AllowSprinting;

	simulated event BeginState( name PreviousStateName )
	{
		PrepareAndDetonate();
	}

	simulated function GotoActiveState()
	{
		GotoState('Active');
	}
}

// GrenadeLaunchers determine ShouldPlayFireLast based on the spare ammo
// overriding to use the base KFWeapon version since that uses the current ammo in the mag
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
	return Super(KFWeapon).ShouldPlayFireLast(FireModeNum);
}

simulated function PrepareAndDetonate()
{
	local name SelectedAnim;
	local float AnimDuration;
	local bool bInSprintState;

	// choose the detonate animation based on whether it is in ironsights and whether it is the last harpoon
	if (bUsingSights)
	{
		SelectedAnim = ShouldPlayFireLast(DEFAULT_FIREMODE) ? DetonateAnimIronLast : DetonateAnimIron;
	}
	else
	{
		SelectedAnim = ShouldPlayFireLast(DEFAULT_FIREMODE) ? DetonateAnimLast : DetonateAnim;
	}

	AnimDuration = MySkelMesh.GetAnimLength(SelectedAnim);
	bInSprintState = IsInState('WeaponSprinting');

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (NumDeployedHarpoons > 0)
		{
			PlayCameraAnim(DetonateCameraAnim, DetonateCameraAnimScale, DetonateCameraAnimPlayRate, 0.2f, 0.2f);
			//PlaySoundBase( DetonateAkEvent, true );
		}
		else
		{
			//PlaySoundBase( DryFireAkEvent, true );
		}

		if (bInSprintState)
		{
			AnimDuration *= 0.25f;
			PlayAnimation(SelectedAnim, AnimDuration);
		}
		else
		{	
			PlayAnimation(SelectedAnim);
		}
	}

	if (Role == ROLE_Authority)
	{
		Detonate();
	}

	// Don't want to play muzzle effects or shoot animation on detonate in 3p
	//IncrementFlashCount();

	//AnimDuration value here representes the ALTFIRE FireInterval
	AnimDuration = 0.75f; //1.f;
	if (bInSprintState)
	{
		SetTimer(AnimDuration * 0.8f, false, nameof(PlaySprintStart));
	}
	else
	{
		SetTimer(AnimDuration * 0.5f, false, nameof(GotoActiveState));
	}
}

/** Detonates all the harpoons */
simulated function Detonate()
{
	local int i;

	// auto switch weapon when out of ammo and after detonating the last deployed charge
	if (Role == ROLE_Authority)
	{
		for (i = DeployedHarpoons.Length - 1; i >= 0; i--)
		{
			DeployedHarpoons[i].Detonate();
		}

		if (!HasAnyAmmo() && NumDeployedHarpoons == 0)
		{
			if (CanSwitchWeapons())
			{
	            Instigator.Controller.ClientSwitchToBestWeapon(false);
			}
		}
	}
}

/** Removes a charge from the list using either an index or an actor and updates NumDeployedHarpoons */
function RemoveDeployedHarpoon(optional int HarpoonIndex = INDEX_NONE, optional Actor HarpoonActor)
{
	if (HarpoonIndex == INDEX_NONE)
	{
		if (HarpoonActor != none)
		{
			HarpoonIndex = DeployedHarpoons.Find(HarpoonActor);
		}
	}

	if (HarpoonIndex != INDEX_NONE)
	{
		DeployedHarpoons.Remove(HarpoonIndex, 1);
		NumDeployedHarpoons = DeployedHarpoons.Length;
		bForceNetUpdate = true;
	}
}

/** Allow reloads for primary weapon to be interupted by firing secondary weapon. */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return true;
	}

	return Super.CanOverrideMagReload(FireModeNum);
}

defaultproperties
{
   DetonateAnim="Alt_Fire"
   DetonateAnimLast="Alt_Fire_Last"
   DetonateAnimIron="Alt_Fire_Iron"
   DetonateAnimIronLast="Alt_Fire_Iron_Last"
   SelfDamageReductionValue=0.250000
   DetonateCameraAnim=CameraAnim'WEP_1P_Seal_Squeal_ANIM.Shoot_MB500'
   DetonateCameraAnimPlayRate=2.000000
   DetonateCameraAnimScale=0.400000
   PackageKey="Seal_Squeal"
   FirstPersonMeshName="wep_1p_seal_squeal_mesh.WEP_1stP_Seal_Squeal_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_seal_squeal_anim.Wep_1stP_Seal_Squeal_Anim"
   PickupMeshName="wep_3p_seal_squeal_mesh.WEP_3rdP_Seal_Squeal_Pickup"
   AttachmentArchetypeName="wep_seal_squeal_arch.Wep_Seal_Squeal_3P"
   MuzzleFlashTemplateName="WEP_Seal_Squeal_ARCH.Wep_Seal_Squeal_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=7
   MeshFOV=75.000000
   MeshIronSightFOV=40.000000
   PlayerIronSightFOV=65.000000
   IronSightPosition=(X=10.000000,Y=0.000000,Z=0.000000)
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Seal_Squeal_TEX.UI_WeaponSelect_SealSqueal'
   MagazineCapacity(0)=5
   AmmoCost(1)=0
   SpareAmmoCapacity(0)=30
   InitialSpareMags(0)=1
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_BoltAssembly1"
   BonesToLockOnEmpty(1)="RW_BoltAssembly2"
   BonesToLockOnEmpty(2)="RW_BoltAssembly3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_DryFire'
   PlayerViewOffset=(X=11.000000,Y=8.000000,Z=-2.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_RocketLauncher_SealSqueal:MeleeHelper_0'
   EjectedShellForegroundDuration=1.500000
   maxRecoilPitch=500
   minRecoilPitch=400
   maxRecoilYaw=150
   minRecoilYaw=-150
   RecoilRate=0.080000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=1250
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Demolitionist'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Add=2)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponDetonating"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Rocket_SealSqueal'
   FireInterval(0)=0.500000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.000000
   InstantHitDamage(0)=125.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_SealSquealImpact'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_SealSqueal'
   FireOffset=(X=25.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Seal Squeal"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_RocketLauncher_SealSqueal"
   ObjectArchetype=KFWeap_GrenadeLauncher_Base'KFGame.Default__KFWeap_GrenadeLauncher_Base'
}
