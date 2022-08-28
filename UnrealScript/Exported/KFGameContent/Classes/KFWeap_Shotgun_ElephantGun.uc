//=============================================================================
// KFWeap_Shotgun_ElephantGun
// This is the Doomstick
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_ElephantGun extends KFWeap_ShotgunBase;

/** How much to scale recoil when firing in double barrel fire. */
var(Recoil) float QuadFireRecoilModifier;

/** Shoot animation to play when shooting both barrels from the hip */
var(Animations) const editconst	name	FireQuadAnim;

/** How much momentum to apply when fired in double barrel */
var(Recoil) float DoubleBarrelKickMomentum;

/** How much to reduce shoot momentum when falling */
var(Recoil) float FallingMomentumReduction;

simulated function AltFireMode()
{
	// LocalPlayer Only
	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	if (AmmoCount[0] <= 1)
	{
		StartFire(DEFAULT_FIREMODE);
	}
	else
	{
		AmmoCost[ALTFIRE_FIREMODE] = Max(1, AmmoCount[0]);
		StartFire(ALTFIRE_FIREMODE);
	}
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	local Float MagPercentFull;
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		MagPercentFull = Float(AmmoCount[0]) / float(default.AmmoCost[ALTFIRE_FIREMODE]);
		return NumPellets[FireModeNum] * MagPercentFull;
	}

	return NumPellets[CurrentFireMode];
}

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if (bUsingSights)
	{
		return FireSightedAnims[FireModeNum];
	}
	else
	{
		if (FireModeNum == ALTFIRE_FIREMODE)
		{
			return FireQuadAnim;
		}
		else
		{
			return FireAnim;
		}
	}
}

/*********************************************************************************************
* State WeaponSingleFiring
* Fire must be released between every shot.
*********************************************************************************************/

simulated state WeaponQuadBarrelFiring extends WeaponSingleFiring
{
	/** Overrideen to include the DoubleFireRecoilModifier*/
	simulated function ModifyRecoil(out float CurrentRecoilModifier)
	{
		super.ModifyRecoil(CurrentRecoilModifier);
		CurrentRecoilModifier *= QuadFireRecoilModifier;
	}

	simulated function BeginState(name PreviousStateName)
	{
		local vector UsedKickMomentum;
		Super.BeginState(PreviousStateName);

		// Push the player back when they fire both barrels
		if (Instigator != none)
		{
			UsedKickMomentum.X = -DoubleBarrelKickMomentum;

			if (Instigator.Physics == PHYS_Falling)
			{
				UsedKickMomentum = UsedKickMomentum >> Instigator.GetViewRotation();
				UsedKickMomentum *= FallingMomentumReduction;
			}
			else
			{
				UsedKickMomentum = UsedKickMomentum >> Instigator.Rotation;
				UsedKickMomentum.Z = 0;
			}

			Instigator.AddVelocity(UsedKickMomentum,Instigator.Location,none);
		}
	}
}

simulated function BeginState(name PreviousStateName)
{
	local vector UsedKickMomentum;
	Super.BeginState(PreviousStateName);

	// Push the player back when they fire both barrels
	if (Instigator != none)
	{
		UsedKickMomentum.X = -DoubleBarrelKickMomentum;

		if (Instigator.Physics == PHYS_Falling)
		{
			UsedKickMomentum = UsedKickMomentum >> Instigator.GetViewRotation();
			UsedKickMomentum *= FallingMomentumReduction;
		}
		else
		{
			UsedKickMomentum = UsedKickMomentum >> Instigator.Rotation;
			UsedKickMomentum.Z = 0;
		}

		Instigator.AddVelocity(UsedKickMomentum,Instigator.Location,none);
	}
}

defaultproperties
{
   QuadFireRecoilModifier=2.000000
   FireQuadAnim="Shoot_Double"
   DoubleBarrelKickMomentum=1000.000000
   FallingMomentumReduction=0.500000
   NumPellets(0)=6
   NumPellets(1)=24
   PackageKey="Quad_Barrel"
   FirstPersonMeshName="wep_1p_quad_barrel_mesh.Wep_1stP_Quad_Barrel"
   FirstPersonAnimSetNames(0)="wep_1p_quad_barrel_anim.Wep_1stP_Quad_Barrel_Anim"
   PickupMeshName="WEP_3P_Quad_Barrel_MESH.Wep_3rdP_Quad_Barrel_Pickup"
   AttachmentArchetypeName="WEP_Quad_Barrel_ARCH.Wep_Quad_Barrel_3P"
   MuzzleFlashTemplateName="WEP_Quad_Barrel_ARCH.Wep_Quad_Barrel_MuzzleFlash"
   bHasIronSights=True
   bNoMagazine=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
   InventorySize=11
   MagazineCapacity(0)=4
   PenetrationPower(0)=4.000000
   PenetrationPower(1)=4.000000
   MeshFOV=60.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=3.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=65.000000
   GroupPriority=110.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Quad_Barrel_TEX.UI_WeaponSelect_QuadBarrel'
   AmmoCost(1)=4
   SpareAmmoCapacity(0)=40
   InitialSpareMags(0)=3
   AmmoPickupScale(0)=2.000000
   ForceReloadTimeOnEmpty=0.300000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   FireAnim="Shoot_Single"
   FireSightedAnims(0)="Shoot_Iron_Single"
   FireSightedAnims(1)="Shoot_Iron_Double"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_1P_Single')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_3P_AltFire',FirstPersonCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_1P_AltFire')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_DryFire'
   PlayerViewOffset=(X=15.000000,Y=8.000000,Z=-4.500000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_ElephantGun:MeleeHelper_0'
   maxRecoilPitch=1200
   minRecoilPitch=775
   maxRecoilYaw=800
   minRecoilYaw=-500
   RecoilRate=0.085000
   RecoilBlendOutRatio=1.100000
   RecoilViewRotationScale=0.800000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.100000
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(1)=(IncrementDamage=1.100000)
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponQuadBarrelFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   FireInterval(0)=0.250000
   FireInterval(1)=0.250000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.190000
   Spread(1)=0.190000
   InstantHitDamage(0)=36.000000
   InstantHitDamage(1)=36.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=27.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_ElephantGun'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_ElephantGun'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_ElephantGun'
   FireOffset=(X=25.000000,Y=3.500000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Doomstick"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_ElephantGun"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
