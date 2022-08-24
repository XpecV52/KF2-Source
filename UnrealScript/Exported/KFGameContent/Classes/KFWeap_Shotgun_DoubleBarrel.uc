//=============================================================================
// KFWeap_Shotgun_DoubleBarrel
//=============================================================================
// A Double Barrel Sawed Off Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeap_Shotgun_DoubleBarrel extends KFWeap_ShotgunBase;

/** How much to scale recoil when firing in double barrel fire. */
var(Recoil) float DoubleFireRecoilModifier;

/** Shoot animation to play when shooting both barrels from the hip */
var(Animations) const editconst	name	FireDoubleAnim;

/** How long the to wait after firing to force zoom out */
var()	float		ForceReloadTime;

/** How much momentum to apply when fired in double barrel */
var(Recoil) float DoubleBarrelKickMomentum;

/** How much to reduce shoot momentum when falling */
var(Recoil) float FallingMomentumReduction;

/**
 * Toggle between DEFAULT and ALTFIRE
 */
simulated function AltFireMode()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

    if (AmmoCount[0] < 2)
    {
        StartFire(DEFAULT_FIREMODE);
    }
    else
    {
        StartFire(ALTFIRE_FIREMODE);
    }	
}

/**
 * Send weapon to proper firing state
 */
simulated function SendToFiringState(byte FireModeNum)
{
	if( FireModeNum == ALTFIRE_FIREMODE && AmmoCount[0] < 2 )
    {
		// not enough ammo for altfire
		Super.SendToFiringState(DEFAULT_FIREMODE);
	}
	else
	{
		Super.SendToFiringState(FireModeNum);
	}
}

/*********************************************************************************************
 * State WeaponSingleFiring
 * Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponDoubleBarrelFiring extends WeaponSingleFiring
{
    /** Overrideen to include the DoubleFireRecoilModifier*/
    simulated function ModifyRecoil( out float CurrentRecoilModifier )
	{
		super.ModifyRecoil( CurrentRecoilModifier );
	    CurrentRecoilModifier *= DoubleFireRecoilModifier;
	}

	simulated function BeginState(name PreviousStateName)
    {
   	    local vector UsedKickMomentum;
       	Super.BeginState(PreviousStateName);

    	// Push the player back when they fire both barrels
        if (Instigator != none )
    	{
            UsedKickMomentum.X = -DoubleBarrelKickMomentum;

            if( Instigator.Physics == PHYS_Falling  )
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

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if ( bUsingSights )
	{
        return FireSightedAnims[FireModeNum];
	}
	else
	{
    	if ( FireModeNum == ALTFIRE_FIREMODE )
    	{
            return FireDoubleAnim;
    	}
    	else
    	{
            return FireAnim;
        }
	}
}

/**
 * PlayFireEffects Is the root function that handles all of the effects associated with
 * a weapon.  This function creates the 1st person effects.  It should only be called
 * on a locally controlled player.
 */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
    Super.PlayFireEffects( FireModeNum, HitLocation );

	if( Instigator != none && Instigator.IsLocallyControlled() && AmmoCount[0] == 0 )
	{
        SetTimer(ForceReloadTime, false, nameof( ForceReload ) );
	}
}

/**
 * Causes the muzzle flash to turn on and setup a time to
 * turn it back off again.
 */
simulated function CauseMuzzleFlash(byte FireModeNum)
{
	// Alternate barrels
    if( FireModeNum == DEFAULT_FIREMODE )
	{
        if( AmmoCount[0] == 1 )
        {
            super.CauseMuzzleFlash(DEFAULT_FIREMODE);
        }
        else
        {
            super.CauseMuzzleFlash(ALTFIRE_FIREMODE);
        }
	}
	// Fire both barrels
	else
	{
        super.CauseMuzzleFlash(DEFAULT_FIREMODE);
        super.CauseMuzzleFlash(ALTFIRE_FIREMODE);
	}
}

defaultproperties
{
   DoubleFireRecoilModifier=2.200000
   FireDoubleAnim="Shoot_Double"
   ForceReloadTime=0.300000
   DoubleBarrelKickMomentum=1000.000000
   FallingMomentumReduction=0.500000
   NumPellets(0)=12
   NumPellets(1)=24
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
   InventorySize=4
   MagazineCapacity(0)=2
   bHasIronSights=True
   bNoMagazine=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=False
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=2.000000
   MeshFOV=75.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=3.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=65.000000
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_DBShotgun'
   AmmoCost(1)=2
   SpareAmmoCapacity(0)=46
   InitialSpareMags(0)=11
   AmmoPickupScale(0)=3.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   FireAnim="Shoot_Single"
   FireSightedAnims(0)="Shoot_Iron_Single"
   FireSightedAnims(1)="Shoot_Iron_Double"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Shotgun.Play_SA_WEP_DoubleBarrel_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Shotgun.Play_SA_WEP_DoubleBarrel_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Shotgun.Play_SA_WEP_DoubleBarrel_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Shotgun.Play_SA_WEP_DoubleBarrel_Alt_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Shotgun.Play_SA_WEP_DoubleBarrel_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Shotgun.Play_SA_WEP_DoubleBarrel_Handling_DryFire'
   PlayerViewOffset=(X=4.000000,Y=7.000000,Z=-5.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Shotgun_DoubleBarrel_ARCH.Wep_Shotgun_DoubleBarrel_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Shotgun_DoubleBarrel_ARCH.Wep_Shotgun_DoubleBarrel_MuzzleFlash'
   maxRecoilPitch=900
   minRecoilPitch=775
   maxRecoilYaw=500
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
   HippedRecoilModifier=1.250000
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Support'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponDoubleBarrelFiring"
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
   Spread(0)=0.250000
   Spread(1)=0.250000
   InstantHitDamage(0)=25.000000
   InstantHitDamage(1)=25.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_DBShotgun'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_DBShotgun'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_DBShotgun'
   FireOffset=(X=25.000000,Y=3.500000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'wep_1p_double_barrel_mesh.Wep_1stP_Double_Barrel'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Double_Barrel_ANIM.Wep_1stP_Double_Barrel_Anim'
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
   ItemName="Double-barrel Boomstick"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Double_Barrel_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_DoubleBarrel"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
