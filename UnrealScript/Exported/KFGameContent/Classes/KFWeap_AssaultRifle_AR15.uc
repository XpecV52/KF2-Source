//=============================================================================
// KFWeap_AssaultRifle_AR15
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 8/8/2013
//=============================================================================

class KFWeap_AssaultRifle_AR15 extends KFWeap_RifleBase;

/** Number of shots already fired in this burst. */
var int BurstCount;
/** Number of shots to fire per burst. */
var() int BurstAmount;

/*********************************************************************************************
 * State WeaponBurstFiring
 * Fires a burst of bullets. Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponBurstFiring extends WeaponFiring
{
	simulated function BeginState(Name PrevStateName)
	{
        // Reset the BurstCount when we start firing again
        BurstCount=0;

        // Don't let us fire more shots than we have ammo for
        BurstAmount=Min(default.BurstAmount, AmmoCount[GetAmmoType(CurrentFireMode)]);

		super.BeginState(PrevStateName);
	}

	simulated function bool ShouldRefire()
	{
		// Stop firing when we hit the burst amount
        if( BurstCount >= BurstAmount )
		{
            return false;
		}
    	// if doesn't have ammo to keep on firing, then stop
    	else if( !HasAmmo( CurrentFireMode ) )
    	{
    		return false;
    	}
		else
		{
            return true;
		}
	}

    /**
     * FireAmmunition: Perform all logic associated with firing a shot
     * - Fires ammunition (instant hit or spawn projectile)
     * - Consumes ammunition
     * - Plays any associated effects (fire sound and whatnot)
     * Overridden to increment the BurstCount
     *
     * Network: LocalPlayer and Server
     */
    simulated function FireAmmunition()
    {
        super.FireAmmunition();
        BurstCount++;
    }

	simulated event EndState( Name NextStateName )
	{
		Super.EndState(NextStateName);
		EndFire(CurrentFireMode);
	}
}

defaultproperties
{
   BurstAmount=3
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   InventorySize=4
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=7.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=75.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   MagazineCapacity(0)=20
   MaxSpareAmmo(0)=240
   InitialSpareMags(0)=6
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'
   PlayerViewOffset=(X=9.000000,Y=10.000000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_AR15_9mm_ARCH.Wep_AR15_9mm_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_AR15:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_AR15_9mm_ARCH.Wep_AR15_9MM_MuzzleFlash'
   maxRecoilPitch=225
   minRecoilPitch=150
   maxRecoilYaw=150
   minRecoilYaw=-150
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=195
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClass=Class'KFGame.KFPerk_Commando'
   FiringStatesArray(0)="WeaponBurstFiring"
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
   Spread(0)=0.010000
   Spread(1)=0.010000
   InstantHitDamage(0)=20.000000
   InstantHitDamage(1)=20.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_AR15'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_AR15'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_AR15'
   FireOffset=(X=30.000000,Y=4.500000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_AR15_9mm_MESH.Wep_1stP_AR15_9mm_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_AR15_9mm_ANIM.Wep_1stP_AR15_9mm_Anim'
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
   ItemName="AR-15 Varmint Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AR15_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_AR15"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
