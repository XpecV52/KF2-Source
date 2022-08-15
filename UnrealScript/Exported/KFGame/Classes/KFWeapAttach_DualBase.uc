//=============================================================================
// KFWeapAttach_DualBase
//=============================================================================
// Attachment with a second set of meshes/FX for dual weapons
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapAttach_DualBase extends KFWeaponAttachment;

/*********************************************************************************************
 * Left-hand weapon components
********************************************************************************************* */

/** Left hand skeletal mesh. If none is specified, the right hand skeletal mesh will be duplicated. */
var() const SkeletalMesh 						LeftHandSkelMesh;
/** Anim set to use for 3rd person weapon anims */
var() AnimSet 									LeftWeaponAnimSet;
var protected transient SkeletalMeshComponent	LeftWeapMesh;
var protected transient KFMuzzleFlash			LeftMuzzleFlash;
/** A reference to the left muzzle flash template (to specify left shell eject socket) */
var() protected const KFMuzzleFlash 			LeftMuzzleFlashTemplate;
var protected transient AnimNodeSequence		LeftWeapAnimNode;

/** Toggled when switching from right to left hand weapons */
var transient bool bPlayFXOnSecondWeapon;
/** Last world time bPlayFXOnSecondWeapon was set */
var transient float LastChooseWeaponTime;

/** Additive shoot anims */
const ShootLeftAnim		= 'ADD_Shoot_LW';
const ShootRightAnim	= 'ADD_Shoot_RW';

const LeftWeaponSocket	= 'LW_Weapon';

event PreBeginPlay()
{
	// set up left hand skel mesh just like we do the right in super
	if ( LeftWeapMesh != None && !bWeapMeshIsPawnMesh )
	{
		if ( LeftWeaponAnimSet != None )
		{
			LeftWeapMesh.AnimSets[0] = LeftWeaponAnimSet;
		}
		else if( WeaponAnimSet != None )
		{
			// default to right weapon anim set
			LeftWeapMesh.AnimSets[0] = WeaponAnimSet;
		}

		if ( LeftHandSkelMesh != none )
		{
			// set the skeletal mesh from our archetype to the WeaponAttachment
			LeftWeapMesh.SkeletalMesh = LeftHandSkelMesh;
		}

		LeftWeapAnimNode = AnimNodeSequence(LeftWeapMesh.Animations);
	}

 	super.PreBeginPlay();
}

/*********************************************************************************************
 * Attach / Detach
********************************************************************************************* */

/** Added second weapon */
simulated function AttachTo(KFPawn P)
{
	Super.AttachTo(P);

	if ( bWeapMeshIsPawnMesh )
	{
		LeftWeapMesh = P.Mesh;
	}
	else if ( LeftWeapMesh != None )
	{
		if( LeftHandSkelMesh == none )
		{
			// Create a duplicate of the right-hand weapn mesh
			LeftWeapMesh = new(self) Class'SkeletalMeshComponent'(WeapMesh);
		}

		// Attach Weapon mesh to player skel mesh
		LeftWeapMesh.SetShadowParent(P.Mesh);
		P.Mesh.AttachComponent(LeftWeapMesh, LeftWeaponSocket);
	}
}

/** Added second weapon */
simulated function DetachFrom(KFPawn P)
{
	Super.DetachFrom(P);

	// first, detach FX
	if ( LeftMuzzleFlash != None )
	{
        LeftMuzzleFlash.DetachMuzzleFlash(LeftWeapMesh);
	}

	// detach weapon mesh from player skelmesh
	if ( bWeapMeshIsPawnMesh )
	{
		LeftWeapMesh = None;
	}
	else if ( LeftWeapMesh != None )
	{
		LeftWeapMesh.SetShadowParent(None);
		P.Mesh.DetachComponent(LeftWeapMesh);
	}
}

/** Added second weapon */
simulated function AttachMuzzleFlash()
{
	Super.AttachMuzzleFlash();

	if ( WeapMesh != none && LeftMuzzleFlash == None )
	{
		LeftMuzzleFlash = new(self) Class'KFMuzzleFlash'(LeftMuzzleFlashTemplate);
        LeftMuzzleFlash.AttachMuzzleFlash(LeftWeapMesh);
	}
}

/*********************************************************************************************
* Fire Effects
********************************************************************************************* */

/** Updates bPlayFXOnSecondWeapon each time weapon is fired */
function bool ChooseActiveWeapon(byte FlashCount)
{	
	// If this was already called in this frame do nothing.  See GetProjectileStartLoc() for details.
	if ( LastChooseWeaponTime == WorldInfo.TimeSeconds )
	{
		return bPlayFXOnSecondWeapon;
	}

	if ( FlashCount > 0 )
	{
		// If we have a flash count (e.g. projectile) use that to synchronize with 1st P
		bPlayFXOnSecondWeapon = (FlashCount & 1) == 0;
	}
	else
	{
		// Otherwise just toggle it
		bPlayFXOnSecondWeapon = !bPlayFXOnSecondWeapon;
	}

	LastChooseWeaponTime = WorldInfo.TimeSeconds;
	return bPlayFXOnSecondWeapon;
}

/** Added second weapon */
simulated function bool ThirdPersonFireEffects(vector HitLocation, KFPawn P)
{
	ChooseActiveWeapon(P.FlashCount);
    SpawnTracer(GetMuzzleLocation((bPlayFXOnSecondWeapon) ? 1 : 0), HitLocation);

	// Effects below this point are culled based on visibility and distance
	if ( !ActorEffectIsRelevant(P, false, MaxFireEffectDistance) )
	{
		return false;
	}

	// Additive character shoot anims
	if ( !P.IsDoingSpecialMove() )
	{
		if ( bPlayFXOnSecondWeapon )
		{
			P.PlayBodyAnim(ShootLeftAnim, EAS_FullBody, 1.f, ShootBlendInTime, ShootBlendOutTime);
		}
		else
		{
			P.PlayBodyAnim(ShootRightAnim, EAS_FullBody, 1.f, ShootBlendInTime, ShootBlendOutTime);
		}
	}

	CauseMuzzleFlash(P.FiringMode);
	return true;
}

/** Added second weapon */
simulated function CauseMuzzleFlash(byte FiringMode)
{	
	// Can use the same weapon that was used by ThirdPersonFireEffects
	if ( bPlayFXOnSecondWeapon )
	{
		if (LeftMuzzleFlash == None && MuzzleFlashTemplate != None)
		{
			AttachMuzzleFlash();
		}

		if (LeftMuzzleFlash != None )
		{
			LeftMuzzleFlash.CauseMuzzleFlash(FiringMode);
			if ( LeftMuzzleFlash.bAutoActivateShellEject )
			{
				LeftMuzzleFlash.CauseShellEject();
			}
		}
	}
	else
	{
		Super.CauseMuzzleFlash(FiringMode);
	}
}

/** Added second weapon */
simulated function vector GetMuzzleLocation(optional byte MuzzleID)
{
	local vector SocketLocation;

	if ( MuzzleID >= 1 )
	{
		if (LeftMuzzleFlash == None && MuzzleFlashTemplate != None)
		{
			AttachMuzzleFlash();
		}

		if( LeftMuzzleFlash != none )
		{
	        LeftWeapMesh.GetSocketWorldLocationAndRotation(LeftMuzzleFlash.GetAltSocketName(), SocketLocation);
			return SocketLocation;
		}
	}

	return Super.GetMuzzleLocation(MuzzleID);
}

/** Overrides super to play anim on both meshes. Used for reloads at the moment (will this mess up other possible anims?) */
simulated function PlayWeaponMeshAnim(name AnimName, AnimNodeSlot SyncNode, bool bLoop)
{
	super.PlayWeaponMeshAnim( AnimName, SyncNode, bLoop );	
	LeftWeapMesh.PlayAnim(AnimName, 0.f, bLoop);
}

defaultproperties
{
   Name="Default__KFWeapAttach_DualBase"
   ObjectArchetype=KFWeaponAttachment'KFGame.Default__KFWeaponAttachment'
}
