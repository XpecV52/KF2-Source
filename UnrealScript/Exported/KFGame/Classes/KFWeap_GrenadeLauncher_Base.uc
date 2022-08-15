//=============================================================================
// KFWeap_GrenadeLauncher_Base
//=============================================================================
// Base for grenade launchers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_GrenadeLauncher_Base extends KFWeapon;

/** How long the to wait after firing to force zoom out */
var(IronSight)	float		ForceZoomOutTime;

/** How long the to wait after firing to force zoom out */
var()			float		ForceReloadTime;

/**
 * FireAmmunition: Perform all logic associated with firing a shot
 * - Fires ammunition (instant hit or spawn projectile)
 * - Consumes ammunition
 * - Plays any associated effects (fire sound and whatnot)
 *
 * Network: LocalPlayer and Server
 */
simulated state WeaponSingleFiring
{
	simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
	{
		Super.PlayFireEffects( FireModeNum, HitLocation );

		if ( Instigator.IsLocallyControlled() )
		{
			// Reload after every shot, assuming there is ammo available
			SetTimer(ForceReloadTime, false, nameof( ForceReload ) );
		}
	}
}

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
    {
        return true;
    }

    return false;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( AmmoCount[0] > 0 )
	{
		// Disable half-reloads for now.  This can happen if server gets out
		// of sync, but choosing the wrong animation will just make it worse!
		WarnInternal("Grenade launcher reloading with non-empty mag");
	}

	return ReloadEmptyMagAnim;
}

defaultproperties
{
   ForceReloadTime=0.300000
   EffectiveRange=30
   bAllowClientAmmoTracking=False
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_GrenadeLauncher_Base"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
