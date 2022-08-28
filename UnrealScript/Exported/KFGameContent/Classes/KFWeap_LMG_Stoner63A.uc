//=============================================================================
// KFWeap_LMG_Stoner63A
//=============================================================================
// The Stoner63A rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Matt "Squirrlz" Farber
//=============================================================================
class KFWeap_LMG_Stoner63A extends KFWeap_RifleBase;

/** Alternate reload anims (when below the bullet belt threshold */
const ReloadLowAmmoAnim = 'Reload_Empty_Half';
const ReloadLowAmmoEliteAnim = 'Reload_Empty_Half_Elite';

/** Array of bone names corresponding to bullets in the ammo belt */
var protected const string AmmoBeltBulletBonePrefix;

/** Number of bullets in the ammo belt */
var protected const int NumAmmoBeltBullets;

/** How much ammo we had the last time we updated the ammo belt */
var transient protected int LastAmmoCount;

/** TRUE when set for the first time */
var transient protected bool bAmmoBeltInitialized;

/** Just in case we spawned in with an ammo count that's lower than the threshold */
simulated event ReplicatedEvent( name VarName )
{
	super.ReplicatedEvent( VarName );

	if( !bAmmoBeltInitialized )
	{
		UpdateAmmoBeltBullets();
	}
}

/** Just in case we spawned in with an ammo count that's lower than the threshold */
simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if( !bAmmoBeltInitialized && Role == ROLE_Authority )
	{
		UpdateAmmoBeltBullets();
	}
}

/** Update ammo belt */
simulated function ConsumeAmmo( byte FireModeNum )
{
	super.ConsumeAmmo( FireModeNum );

	UpdateAmmoBeltBullets();
}

/** Update ammo belt */
simulated function PerformReload( optional byte FireModeNum )
{
	super.PerformReload( FireModeNum );

	UpdateAmmoBeltBullets();
}

/** Notify triggered by reload animations, when ammo belt is grabbed offscreen */
simulated function ANIMNOTIFY_RestoreAmmoBelt()
{
	local int AmmoType, PendingAmmoCount;

	AmmoType = GetAmmoType(0);

	// This value will sync with the amount actually reloaded in PerformReload()
	PendingAmmoCount = Min( AmmoCount[AmmoType] + SpareAmmoCount[AmmoType], MagazineCapacity[AmmoType] );
	if( PendingAmmoCount < NumAmmoBeltBullets )
	{
		UpdateAmmoBeltBullets( PendingAmmoCount );
	}
	else
	{
		UpdateAmmoBeltBullets( , true );
	}
}

/** Hides/shows bones on the weapon to simulate reaching the end of the ammo belt */
simulated function UpdateAmmoBeltBullets( optional int ForcedBulletCount=INDEX_NONE, optional bool bShowAll=false )
{
	local Name BulletBoneName;
	local int NumAmmo, i;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	// Don't do any bone alterations until the bone array has been filled out
	if( MySkelMesh.LocalAtoms.Length == 0 )
	{
		// Check on the next frame to see if we can init our ammo belt
		if( !IsTimerActive(nameOf(Timer_AttemptAmmoBeltUpdate)) )
		{
			SetTimer( 0.01f, false, nameOf(Timer_AttemptAmmoBeltUpdate) );
		}
		return;
	}

	// So we don't do this in PostInitAnimTree() or again in Timer_AttemptAmmoBeltUpdate() if we don't have to
	bAmmoBeltInitialized = true;

	// Don't do anything if ammo hasn't changed
	NumAmmo = ForcedBulletCount != INDEX_NONE ? ForcedBulletCount : int(AmmoCount[GetAmmoType(0)]);
	if( !bShowAll && (LastAmmoCount == NumAmmo || (LastAmmoCount >= NumAmmoBeltBullets && NumAmmo >= NumAmmoBeltBullets)) )
	{
		return;
	}

	// Hide or unhide depending on place in array
	for( i = 0; i < NumAmmoBeltBullets; ++i )
	{
		BulletBoneName = Name( AmmoBeltBulletBonePrefix $ (i+1) );

		// Unhide all bullets if our ammo count is higher than the number of bullets
		if( bShowAll || NumAmmo >= NumAmmoBeltBullets )
		{
			MySkelMesh.UnHideBoneByName( BulletBoneName );
			continue;
		}

		if( i > NumAmmo-1 )
		{
			MySkelMesh.HideBoneByName( BulletBoneName, PBO_None );
		}
		else
		{
			MySkelMesh.UnHideBoneByName( BulletBoneName );
		}
	}

	LastAmmoCount = NumAmmo;
}

simulated function Timer_AttemptAmmoBeltUpdate()
{
	if( !bAmmoBeltInitialized )
	{
		UpdateAmmoBeltBullets();
	}
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if( AmmoCount[0] > 0 && AmmoCount[0] < NumAmmoBeltBullets )
	{
		// If we are below the threshold, play our low ammo reload
		return bTacticalReload ? ReloadLowAmmoEliteAnim : ReloadLowAmmoAnim;
	}
	else
	{
		return super.GetReloadAnimName( bTacticalReload );
	}
}

/**
 * State WeaponEquipping
 * The Weapon is in this state while transitioning from Inactive to Active state.
 * Typically, the weapon will remain in this state while its selection animation is being played.
 * While in this state, the weapon cannot be fired.
 */
simulated state WeaponEquipping
{
	simulated event BeginState( Name PreviousStateName )
	{
		super.BeginState( PreviousStateName );

		// Just in case a reload was interrupted after ANIMNOTIFY_RestoreAmmoBelt() was called,
		// set the ammo belt to the current amount of bullets in the magazine on equip
		UpdateAmmoBeltBullets();
	}
}

defaultproperties
{
   AmmoBeltBulletBonePrefix="RW_Bullets"
   NumAmmoBeltBullets=14
   PackageKey="Stoner63a"
   FirstPersonMeshName="WEP_1P_Stoner63A_MESH.Wep_1stP_Stoner63A_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Stoner63A_ANIM.Wep_1stP_Stoner63A_Anim"
   PickupMeshName="WEP_3P_Stoner63A_MESH.Wep_Stoner63A_Pickup"
   AttachmentArchetypeName="WEP_Stoner63A_ARCH.Wep_Stoner63A_3P"
   MuzzleFlashTemplateName="WEP_Stoner63A_ARCH.Wep_Stoner63A_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   SingleFireSoundIndex=1
   InventorySize=9
   MagazineCapacity(0)=75
   MeshFOV=75.000000
   MeshIronSightFOV=35.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=8.500000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'wep_ui_stoner63a_tex.UI_WeaponSelect_Stoner'
   SpareAmmoCapacity(0)=500
   InitialSpareMags(0)=1
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Stoner.Play_WEP_Stoner_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_Stoner.Play_WEP_Stoner_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Stoner.Play_WEP_Stoner_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_Stoner.Play_WEP_Stoner_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Stoner.Play_WEP_Stoner_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_Stoner.Play_WEP_Stoner_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
   PlayerViewOffset=(X=4.000000,Y=8.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_LMG_Stoner63A:MeleeHelper_0'
   EjectedShellForegroundDuration=0.800000
   maxRecoilPitch=120
   minRecoilPitch=70
   maxRecoilYaw=130
   minRecoilYaw=-130
   RecoilRate=0.080000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=2.300000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   WeaponUpgrades(1)=(IncrementDamage=1.270000)
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.066000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   InstantHitDamage(0)=30.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Stoner63A'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Stoner63A'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
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
   ItemName="Stoner 63A LMG"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_LMG_Stoner63A"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
