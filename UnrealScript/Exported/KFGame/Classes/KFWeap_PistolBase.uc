//=============================================================================
// KFWeap_PistolBase
//=============================================================================
// Generic pistol class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================
class KFWeap_PistolBase extends KFWeapon
	native;

/*********************************************************************************************
 * @name	Revolver vars
********************************************************************************************* */

// Whether this weapon is a revolver. Enables revolver functionality like rotating cylinder and noticeably-used shells
var bool bRevolver;

// Meshes to indicate which rounds have been fired or not
var SkeletalMesh UnusedBulletMeshTemplate;
var SkeletalMesh UsedBulletMeshTemplate;
var array<name> BulletFXSocketNames;
var array<KFSkeletalMeshComponent> BulletMeshComponents;

const CYLINDERSTATE_READY = 0;
const CYLINDERSTATE_PENDING = 1;
const CYLINDERSTATE_ROTATING = 2;

// variables used to rotate cylinder
struct native CylinderRotationInfo
{
	// how many degrees to rotate the cylinder by each shot
	var float Inc;
	// rotation starting point
	var transient float PrevDegrees;
	// rotation goal
	var transient float NextDegrees;
	// how quickly to rotate
	var float Time;
	// timer to keep track of rotation time
	var transient float Timer;
	// the skelcontrol that controls the cylinder (cached)
	var transient SkelControlSingleBone Control;

	// tracks cylinder state (before fire, after fire but before rotating, rotating)
	var transient int State;
};
var CylinderRotationInfo CylinderRotInfo;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Called immediately before gameplay begins.
 */
simulated event PreBeginPlay()
{
	local int i;

	super.PreBeginPlay();

	if( bRevolver )
	{
		// attach bullet meshes to correct sockets
		for( i = 0; i < BulletMeshComponents.Length; ++i )
		{
			BulletMeshComponents[i].SetHidden( false );
			MySkelMesh.AttachComponentToSocket( BulletMeshComponents[i], BulletFXSocketNames[i] );
		}
	}
}

/** Cache Anim Nodes from the tree
* 	@note: skipped on server because AttachComponent/AttachWeaponTo is not called
*/
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree( SkelComp );

	if( bRevolver )
	{
		PostInitAnimTreeRevolver( SkelComp );
	}
}

/*********************************************************************************************
 * @name	Ammo
********************************************************************************************* */

// /**
//  * @see Weapon::ConsumeAmmo
//  */
simulated function ConsumeAmmo( byte FireModeNum )
{
	local int BulletIndex;

	BulletIndex = MagazineCapacity[DEFAULT_FIREMODE] - AmmoCount[DEFAULT_FIREMODE];

	super.ConsumeAmmo( FireModeNum );

	// update bullet mesh
	if( BulletIndex < BulletMeshComponents.Length )
	{
		BulletMeshComponents[BulletIndex].SetSkeletalMesh( UsedBulletMeshTemplate );
	}

	// do revovler ammo before actually consuming ammo
	if( bRevolver && Instigator != none && Instigator.IsLocallyControlled() )
	{
		ConsumeAmmoRevolver();
	}
}

/**
 * State Reloading
 * State the weapon is in when it is being reloaded (current magazine replaced with a new one, related animations and effects played).
 */
simulated state Reloading
{
	ignores ForceReload, ShouldAutoReload, AllowSprinting;

	simulated function BeginState( name PreviousStateName )
	{
		super.BeginState( PreviousStateName );

		if( bRevolver )
		{
			ResetCylinder();
		}
	}
}

/*********************************************************************************************
 * @name	Revolver
********************************************************************************************* */

simulated event PostInitAnimTreeRevolver( SkeletalMeshComponent SkelComp )
{
	CylinderRotInfo.Control = SkelControlSingleBone( SkelComp.FindSkelControl('CylinderControl') );
	if( CylinderRotInfo.Control != none )
	{
		CylinderRotInfo.Control.SetSkelControlActive( true );
	}
}

simulated function ConsumeAmmoRevolver()
{
	CheckCylinderRotation( CylinderRotInfo );
	CylinderRotInfo.State = CYLINDERSTATE_PENDING;
}

simulated function CheckCylinderRotation( out CylinderRotationInfo RotInfo, optional bool bResetState )
{
	if( RotInfo.State != CYLINDERSTATE_READY )
	{
		RotateCylinder( RotInfo, true );

		if( bResetState )
		{
			RotInfo.State = CYLINDERSTATE_READY;
		}
	}
}

/** Initiate cylinder rotation (rotation occurs in tickspecial in native) */
simulated function ANIMNOTIFY_RotateCylinder()
{
	RotateCylinder( CylinderRotInfo );
}

/** Initiates cylinder rotation process */
simulated function RotateCylinder( out CylinderRotationInfo RotInfo, optional bool bInstant )
{
	if( bInstant )
	{
		// don't use timer, just set rotation

		if( RotInfo.State == CYLINDERSTATE_PENDING )
		{
			// if we're pending, we don't have an updated rotation yet, so get a rotation
			IncrementCylinderRotation( RotInfo );
		}
		else
		{
			// if we're rotating already, we're going to go to a pending state after forcing rotation
			RotInfo.State = CYLINDERSTATE_PENDING;
		}

		SetCylinderRotation( RotInfo, RotInfo.NextDegrees );
		RotInfo.Timer = 0.f;
	}
	else
	{
		// use timer, rotate over time in native tickspecial

		RotInfo.State = CYLINDERSTATE_ROTATING;
		IncrementCylinderRotation( RotInfo );
		RotInfo.Timer = RotInfo.Time;
	}
}

simulated function IncrementCylinderRotation( out CylinderRotationInfo RotInfo )
{
	RotInfo.PrevDegrees = RotInfo.NextDegrees;
	RotInfo.NextDegrees += RotInfo.Inc;
}

simulated function ResetCylinderInfo( out CylinderRotationInfo RotInfo )
{
	RotInfo.PrevDegrees = 0;
	RotInfo.NextDegrees = 0;
	RotInfo.State = CYLINDERSTATE_READY;
}

simulated event OnCylinderRotationFinished( out CylinderRotationInfo RotInfo )
{
	RotInfo.State = CYLINDERSTATE_READY;
}

// directly sets cylinder rotation, instead of allowing tickspecial to increment rotation
native simulated function SetCylinderRotation( out CylinderRotationInfo RotInfo, float Degrees );

simulated function InitializeReload()
{
	super.InitializeReload();
	CheckCylinderRotation( CylinderRotInfo, true );
}

simulated function ANIMNOTIFY_ResetBulletMeshes()
{
	ResetBulletMeshes();
}

/** Resets cylinder orientation to initial state and repositions bullet meshes to line up with their pre-reset locations */
simulated function ResetCylinder()
{
	local int i, UsedStartIdx, UsedEndIdx;

	// reset cylinder rotation (skel control needs to be reset to initial state while bullet casings are not on screen)
	SetCylinderRotation( CylinderRotInfo, 0 );
	ResetCylinderInfo( CylinderRotInfo );

	// now, we need to make sure the used bullets are still in the correct positions

	// if we fired all our ammo, it doesn't matter where the bullets are, because they're all the same (used)
	if( AmmoCount[DEFAULT_FIREMODE] == 0 )
	{
		return;
	}

	// after cylinder reset, top-most bullet will be unused
	BulletMeshComponents[0].SetSkeletalMesh( UnusedBulletMeshTemplate );

	// find the range of bullets that have been used
	UsedStartIdx = BulletMeshComponents.Length - 1;
	UsedEndIdx = UsedStartIdx - (MagazineCapacity[DEFAULT_FIREMODE] - AmmoCount[DEFAULT_FIREMODE]);

	// set used bullets to used mesh
	for( i = UsedStartIdx; i > UsedEndIdx; --i )
	{
		BulletMeshComponents[i].SetSkeletalMesh( UsedBulletMeshTemplate );
	}

	// set the rest of the bullets to unused
	for( i = UsedEndIdx; i > 0; --i )
	{
		BulletMeshComponents[i].SetSkeletalMesh( UnusedBulletMeshTemplate );
	}
}

/** Sets all bullet casing meshes back to unused state */
simulated function ResetBulletMeshes()
{
	local int i;

	for( i = 0; i < BulletMeshComponents.Length; ++i )
	{
		BulletMeshComponents[i].SetSkeletalMesh( UnusedBulletMeshTemplate );
	}
}

/*********************************************************************************************
 * State WeaponPuttingDown
 * Putting down weapon in favor of a new one.
 * Weapon is transitioning to the Inactive state.
*********************************************************************************************/

simulated state WeaponPuttingDown
{
	simulated function EndState(Name NextStateName)
	{
		super.EndState( NextStateName );
		CheckCylinderRotation( CylinderRotInfo, true );
	}
}

/*********************************************************************************************
 * @name	Firing / Projectile
********************************************************************************************* */
/**
 * See Pawn.ProcessInstantHit
 * @param DamageReduction: Custom KF parameter to handle penetration damage reduction
 */
simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum )
{
	local KFPerk InstigatorPerk;

	InstigatorPerk = GetPerk();
	if( InstigatorPerk != none )
	{
		InstigatorPerk.UpdatePerkHeadShots( Impact, InstantHitDamageTypes[FiringMode], ImpactNum );
	}
	
	super.ProcessInstantHit( FiringMode, Impact, NumHits );
}

/**
 * @brief Checks if weapon should be auto-reloaded - overwritten to allow gunslinger insta switch
 * 
 * @param FireModeNum Current fire mode
 * @return auto reload or not
 */
simulated function bool ShouldAutoReload( byte FireModeNum )
{
	return ShouldAutoReloadGunslinger( FireModeNum );
}

/*********************************************************************************************
 * @name	Iron Sights / Zoom
 *********************************************************************************************/

/**
 * Adjust the FOV for the first person weapon and arms.
 */
simulated event SetFOV( float NewFOV )
{
	local int i;

	super.SetFOV( NewFOV );

	for( i = 0; i < BulletMeshComponents.Length; ++i )
	{
		BulletMeshComponents[i].SetFOV( NewFOV );
	}
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Pistol;
}

defaultproperties
{
   InventoryGroup=IG_Secondary
   AimCorrectionSize=40.000000
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   InstantHitDamage(3)=10.000000
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
   Name="Default__KFWeap_PistolBase"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
