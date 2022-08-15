//=============================================================================
// KFWeap_Shotgun_Nailgun
//=============================================================================
// A makeshift shotgun that shoots nails
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_Nailgun extends KFWeap_ShotgunBase;

/** Animations to play when the weapon is alt fired when sighted */
var(Animations) const editconst	array<name>	AltFireSightedAnims;
/** Animation to play when the weapon is alt fired */
var(Animations) const editconst	name		AltFireAnim;

/** How much to scale recoil when alt firing */
var(Recoil) float AltFireRecoilModifier;

/*********************************************************************************************
 * State WeaponAltFiring
 * Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponAltFiring extends WeaponSingleFiring
{
    /** Overrideen to include the DoubleFireRecoilModifier*/
    simulated function ModifyRecoil( out float CurrentRecoilModifier )
	{
		super.ModifyRecoil( CurrentRecoilModifier );
	    CurrentRecoilModifier *= AltFireRecoilModifier;
	}

	/** Initialize the weapon as being active and ready to go. */
	simulated function BeginState( Name PreviousStateName )
	{
        super.BeginState(PreviousStateName);

		// Initialize recoil blend out settings
		if( RecoilRate > 0 && RecoilBlendOutRatio > 0 )
		{
			RecoilYawBlendOutRate = ((maxRecoilYaw*AltFireRecoilModifier)/RecoilRate) * RecoilBlendOutRatio;
			RecoilPitchBlendOutRate = ((maxRecoilPitch*AltFireRecoilModifier)/RecoilRate) * RecoilBlendOutRatio;
		}
    }
}

/**
 * @see Weapon::ConsumeAmmo
 */
simulated function ConsumeAmmo( byte FireModeNum )
{
    local int AmountToConsume;








	// If AmmoCount is being replicated, don't allow the client to modify it here
	if ( Role == ROLE_Authority || bAllowClientAmmoTracking )
	{
		// Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
		if (MagazineCapacity[GetAmmoType(FireModeNum)] > 0 && AmmoCount[GetAmmoType(FireModeNum)] > 0)
		{
			// Only consume up to the number of nails left
            AmountToConsume = Min( NumPellets[CurrentFireMode], AmmoCount[GetAmmoType(FireModeNum)] );
            AmmoCount[GetAmmoType(FireModeNum)]-=AmountToConsume;
		}
	}
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return Min( NumPellets[CurrentFireMode], AmmoCount[GetAmmoType(CurrentFireMode)] );
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    if( FireModeNum == DEFAULT_FIREMODE )
    {
        return super.GetWeaponFireAnim(FireModeNum);
    }

	// ironsights animations
	if ( bUsingSights )
	{
        return AltFireSightedAnims[Rand(AltFireSightedAnims.Length)];
	}
	else
	{
        return AltFireAnim;
	}
}

defaultproperties
{
   AltFireSightedAnims(0)="Shoot_Iron_Single"
   AltFireAnim="Shoot_Single"
   AltFireRecoilModifier=0.500000
   NumPellets(1)=1
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_NailsBurst'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Nail'
   InventorySize=6
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=False
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=2.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=12.000000,Y=0.000000,Z=0.000000)
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_NailShotgun'
   MagazineCapacity(0)=42
   MaxSpareAmmo(0)=336
   InitialSpareMags(0)=4
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Nailgun.Play_WEP_SA_Nailgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Nailgun.Play_WEP_SA_Nailgun_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Nailgun.Play_WEP_SA_Nailgun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Nailgun.Play_WEP_SA_Nailgun_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Nailgun.Play_WEP_SA_Nailgun_Dryfire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Nailgun.Play_WEP_SA_Nailgun_Dryfire'
   PlayerViewOffset=(X=10.000000,Y=8.000000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Nail_Shotgun_ARCH.Wep_Nail_Shotgun_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_Nailgun:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Nail_Shotgun_ARCH.Wep_Nail_Shotgun_MuzzleFlash'
   maxRecoilPitch=550
   minRecoilPitch=450
   maxRecoilYaw=250
   minRecoilYaw=-250
   RecoilRate=0.085000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=250
   RecoilISMinPitchLimit=65485
   FallingRecoilModifier=1.500000
   AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponAltFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Nail_Nailgun'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Nail_Nailgun'
   FireInterval(0)=0.400000
   FireInterval(1)=0.400000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.185000
   Spread(1)=0.020000
   InstantHitDamage(0)=30.000000
   InstantHitDamage(1)=30.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_NailShotgun'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_NailShotgun'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_NailShotgun'
   FireOffset=(X=30.000000,Y=5.000000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Nail_Shotgun_MESH.Wep_1stP_Nail_ShotGun_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Nail_Shotgun_ANIM.Wep_1stP_Nail_Shotgun_Anim'
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
   ItemName="VLAD-1000 Nailgun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_NailShotgun_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_Nailgun"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
