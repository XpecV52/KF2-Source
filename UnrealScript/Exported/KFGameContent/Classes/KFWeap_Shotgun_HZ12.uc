//=============================================================================
// KFWeap_Shotgun_HZ12
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_HZ12 extends KFWeap_ShotgunBase;

/** Keeps track of number of shots fired for the alternate fire animation */
var transient protected int NumShotsFired;

/** Fire interval used for pump shots */
var const protected float PumpFireInterval;

simulated protected function bool IsPumpFire()
{
	return NumShotsFired % 2 == 0;
}

/** Overridden to use a custom fire interval for pump shots */
simulated function float GetFireInterval( byte FireModeNum )
{
	if( IsPumpFire() )
	{
		return PumpFireInterval;
	}

	return super.GetFireInterval( FireModeNum );
}

/** Overridden to add to the number of shots fired */
simulated function ConsumeAmmo( byte FireModeNum )
{
	++NumShotsFired;

	super.ConsumeAmmo( FireModeNum );
}

/** Overridden to reset shot count */
simulated function PerformReload(optional byte FireModeNum)
{
	NumShotsFired = 0;

	super.PerformReload( FireModeNum );
}

/** We need to play a pump every 2 shots, as well as for the last shot to eject any shells remaining before reloading */
simulated function bool ShouldPlayFireLast( byte FireModeNum )
{
	if( IsPumpFire() )
	{
		return true;
	}

	return false;
}

/*********************************************************************************************
 * State WeaponSingleFiring
 * Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponSingleFiring
{
	/**
	 * Timer event, call is set up in Weapon::TimeWeaponFiring().
	 * The weapon is given a chance to evaluate if another shot should be fired.
	 * This event defines the weapon's rate of fire.
	 */
	simulated function RefireCheckTimer()
	{
		super.RefireCheckTimer();

		//@TODO: Try to make timer time dilation work instead of restarting the timer, so we can
		// keep our timer overlaps. It's unlikely it could desynched with a magazine less than
		// 100, but it's still safer this way. -MattF
		/*if( IsTimerActive(nameOf(RefireCheckTimer)) )
		{
			if( IsPumpFire() )
			{
				//`log("numshotsfired:"@numshotsfired@FireInterval[0] / PumpFireInterval);
				ModifyTimerTimeDilation( nameOf(RefireCheckTimer), FireInterval[0] / PumpFireInterval );
			}
			else
			{
				`log("numshotsfired:"@numshotsfired@FireInterval[0]);
				ResetTimerTimeDilation( nameOf(RefireCheckTimer) );
			}
		}*/
	}

	/** Handle fire interval changes */
	simulated function FireAmmunition()
    {
    	super.FireAmmunition();

		// Gotta restart the timer every shot :(
		if( IsTimerActive(nameOf(RefireCheckTimer)) )
		{
			ClearTimer( nameOf(RefireCheckTimer) );
			TimeWeaponFiring( CurrentFireMode );
		}
    }
}

defaultproperties
{
   PumpFireInterval=0.660000
   PackageKey="HZ12"
   FirstPersonMeshName="WEP_1P_HZ12_MESH.Wep_1stP_HZ12_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HZ12_ANIM.Wep_1stP_HZ12_Anim"
   PickupMeshName="WEP_3P_HZ12_MESH.Wep_3rdP_HZ12_Pickup"
   AttachmentArchetypeName="WEP_HZ12_ARCH.Wep_HZ12_3P"
   MuzzleFlashTemplateName="WEP_HZ12_ARCH.Wep_HZ12_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=5
   MagazineCapacity(0)=16
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshFOV=75.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=6.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=95.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=55.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HZ12_TEX.UI_WeaponSelect_HZ12'
   SpareAmmoCapacity(0)=80
   InitialSpareMags(0)=1
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HZ12.Play_WEP_HZ12_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_HZ12.Play_WEP_HZ12_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_HZ12.Play_WEP_HZ12_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_HZ12.Play_WEP_HZ12_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
   PlayerViewOffset=(X=20.000000,Y=7.600000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_HZ12:MeleeHelper_0'
   NumPellets(0)=10
   NumPellets(1)=()
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
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
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.100000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Add=2)))
   WeaponUpgrades(3)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Add=3)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   FireInterval(0)=0.100000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.150000
   Spread(1)=()
   InstantHitDamage(0)=20.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HZ12'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HZ12'
   FireOffset=(X=30.000000,Y=3.000000,Z=-3.000000)
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
   ItemName="HZ12 Multi-Action"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_HZ12"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
