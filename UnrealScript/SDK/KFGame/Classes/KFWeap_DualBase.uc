//=============================================================================
// KFWeap_DualBase
//=============================================================================
// Dual weapon base class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_DualBase extends KFWeapon
	native; // trader needs this to be native for now (6/10/15) so we can access SingleClass

/** Animations to play when the weapon is fired */
var(Animations) const editconst name    	LeftFireAnim;

/** Animation to play when the weapon is fired */
var(Animations) const editconst	array<name>	LeftFireSightedAnims;

/** A muzzle flash instance for left weapon */
var KFMuzzleFlash LeftMuzzleFlash;

/** A reference to the left muzzle flash template */
var(Attachments) const KFMuzzleFlash LeftMuzzleFlashTemplate;

/** Holds an offest for spawning protectile effects for left weapon */
var() vector LeftFireOffset;

/** Whether we should fire from the right-side weapon (alternates right and left fire) */
var transient bool bFireFromRightWeapon;

/** class of the single variant of this weapon */
var class<KFWeapon> SingleClass;

/*********************************************************************************************
 * @name	Animations (Using const anim names to reduce instanced data cost)
********************************************************************************************* */

/** Cached anim nodes */
var AnimNodeBlendPerBone		EmptyMagBlendNode_L;

var(Animations) const editconst name IdleToIronSightAnim;
var(Animations) const editconst name IronSightToIdleAnim;

const ReloadEmptyHalfAnim = 'Reload_Empty_Half';
const ReloadEmptyHalfEliteAnim = 'Reload_Empty_Half_Elite';

/** Cache Anim Nodes from the tree
* 	@note: skipped on server because AttachComponent/AttachWeaponTo is not called
*/
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree( SkelComp );

	EmptyMagBlendNode_L = AnimNodeBlendPerBone(SkelComp.FindAnimNode('EmptyMagBlend_L'));
}

/**
 * Called on a client, this function Attaches the WeaponAttachment
 * to the Mesh.
 *
 * Overridden to attach LeftMuzzleFlash
 */
simulated function AttachMuzzleFlash()
{
	super.AttachMuzzleFlash();

	if ( MySkelMesh != none )
	{
		if (MuzzleFlashTemplate != None)
		{
			LeftMuzzleFlash = new(self) Class'KFMuzzleFlash'(LeftMuzzleFlashTemplate);
			LeftMuzzleFlash.AttachMuzzleFlash(MySkelMesh);
		}
	}
}

/*********************************************************************************************
 * State Active
 * A Weapon this is being held by a pawn should be in the active state.  In this state,
 * a weapon should loop any number of idle animations, as well as check the PendingFire flags
 * to see if a shot has been fired.
 *********************************************************************************************/
simulated state Active
{
	simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
	{
		GotoState('ActiveIronSights');
	}
}

/*********************************************************************************************
 * State ActiveIronSights
 * Only duals play an animation when transitioning to or from iron sights, but this animation
 * should only be played in the "Active" state. This state allows us to encapsulate this
 * functionality.
 *********************************************************************************************/
simulated state ActiveIronSights extends Active
{
	simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
	{
		ZoomTimeToGo = MySkelMesh.GetAnimLength(IronSightToIdleAnim);

		Global.ZoomOut( true, ZoomTimeToGo );

		PlayAnimation( IronSightToIdleAnim, ZoomTime, false );

		GotoState('Active');
	}

	simulated function BeginState( Name PreviousStateName )
	{
		local float ZoomTimeToGo;

		ZoomTimeToGo = MySkelMesh.GetAnimLength(IdleToIronSightAnim);

		Global.ZoomIn( true, ZoomTimeToGo );

		PlayAnimation( IdleToIronSightAnim, ZoomTime, false );
	}
}

/*********************************************************************************************
 * State WeaponSingleFiring
 * Fire must be released between every shot.
 *
 * Overridden to alternate between right and left fire before calculated muzzle positions, etc.
 *********************************************************************************************/
simulated state WeaponSingleFiring
{
	simulated function FireAmmunition()
    {
    	bFireFromRightWeapon = !bFireFromRightWeapon;
        Super.FireAmmunition();
	}
}

/*********************************************************************************************
 * State Reloading
 * This is the default Reloading State.  It's performed on both the client and the server.
 *
 * Overridden to reset our alternating weapon fire
 *********************************************************************************************/
simulated state Reloading
{
	simulated function BeginState(name PreviousStateName)
	{
		super.BeginState( PreviousStateName );
		bFireFromRightWeapon = false;
	}
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if( AmmoCount[0] == 1 )
	{
		// if one gun is empty (always the right), play our half empty reload
		return bTacticalReload ? ReloadEmptyHalfEliteAnim : ReloadEmptyHalfAnim;
	}
	else
	{
		return super.GetReloadAnimName( bTacticalReload );
	}
}

/**
 * Increment Pawn's FlashCount variable.
 * This is used to play weapon fire effects on remote clients.
 * Call this on the server and local player.
 *
 * Network: Server and Local Player
 *
 * COMPLETELY OVERRIDDEN to set FlashCount to an even number for left fire.
 * Also copies implementation of Pawn::IncrementFlashCount (usually called from super)
 */
simulated function IncrementFlashCount()
{
	if( Instigator != none )
	{
		if( Instigator.FlashCount > 0 || bFireFromRightWeapon )
		{
			Instigator.FlashCount += 1;
		}
		else
		{
			Instigator.FlashCount += 2;
		}

		//// BEGIN PAWN.INCREMENTFLASHCOUNT
		Instigator.SetFiringMode( Self, CurrentFireMode );

		// This weapon has fired.
		Instigator.FlashCountUpdated( Self, Instigator.FlashCount, FALSE );
		//// END PAWN.INCREMENTFLASHCOUNT
	}
}

/** Get name of the animation to play for PlayFireEffects 
  * 
  * Overridden to allow for left weapon anims
  */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if( bFireFromRightWeapon )
	{
		return super.GetWeaponFireAnim(FireModeNum);
	}
	else
	{
		return GetLeftWeaponFireAnim(FireModeNum);
	}
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLeftWeaponFireAnim(byte FireModeNum)
{
	// ironsights animations
	if ( bUsingSights )
	{
		return LeftFireSightedAnims[Rand(LeftFireSightedAnims.Length)];
	}
	else
	{
		return LeftFireAnim;
	}
}

/**
 * This function returns the world location for spawning the visual effects
 *
 * Overridden to allow for left weapon location
 */
simulated event vector GetMuzzleLoc()
{
	if( bFireFromRightWeapon )
	{
		return super.GetMuzzleLoc();
	}
	else
	{
		return GetLeftMuzzleLoc();
	}
}

/**
 * This function returns the world location for spawning the visual effects.
 * Uses both X and Y position of LeftFireOffset.
 */
simulated event vector GetLeftMuzzleLoc()
{
    local Rotator ViewRotation;

	if( Instigator != none )
	{
		ViewRotation = Instigator.GetViewRotation();

    	// Add in the free-aim rotation
    	if ( KFPlayerController(Instigator.Controller) != None )
    	{
    		ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
    	}

        if( bUsingSights )
        {
            return Instigator.GetWeaponStartTraceLocation() + (LeftFireOffset >> ViewRotation);
		}
		else
		{
            return Instigator.GetPawnViewLocation() + (LeftFireOffset >> ViewRotation);
		}

	}

	return Location;
}

/**
 * Causes the muzzle flash to turn on and setup a time to
 * turn it back off again.
 * 
 * Overridden to cause left weapon flash
 */
simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if( MuzzleFlash == None || LeftMuzzleFlash == None )
	{
		AttachMuzzleFlash();
	}

	if( bFireFromRightWeapon )
	{
		if (MuzzleFlash != None )
		{
			MuzzleFlash.CauseMuzzleFlash(FireModeNum);
			if ( MuzzleFlash.bAutoActivateShellEject )
			{
				MuzzleFlash.CauseShellEject();
			}
		}
	}
	else
	{
		if( LeftMuzzleFlash != None )
		{
			LeftMuzzleFlash.CauseMuzzleFlash( FireModeNum );
			if( LeftMuzzleFlash.bAutoActivateShellEject )
			{
				LeftMuzzleFlash.CauseShellEject();
			}
		}
	}
}

/**
 * Remove/Detach the muzzle flash components
 */
simulated function DetachMuzzleFlash()
{
	super.DetachMuzzleFlash();

	if (MySkelMesh != none && LeftMuzzleFlash != None)
	{
		LeftMuzzleFlash.DetachMuzzleFlash(MySkelMesh);
		LeftMuzzleFlash = None;
	}
}

/**
 * Adjust the FOV for the first person weapon and arms.
 */
simulated event SetFOV( float NewFOV )
{
	super.SetFOV( NewFOV );

	if( LeftMuzzleFlash != none )
	{
		LeftMuzzleFlash.SetFOV( NewFOV );
	}
}

simulated function StopFireEffects(byte FireModeNum)
{
	super.StopFireEffects( FireModeNum );
	
	if (LeftMuzzleFlash != None)
	{
        LeftMuzzleFlash.StopMuzzleFlash();
	}
}

/** Returns ID of muzzle to spawn projectile at / play effects at
  * Overrides super
  */
simulated function byte GetCurrentMuzzleID()
{
	return bFireFromRightWeapon ? 0 : 1;
}

/** Overridden to spawn a single and set the pickup class to single */
function SetupDroppedPickup( out DroppedPickup P, vector StartVelocity )
{
	local KFWeapon NewSingle;

	super.SetupDroppedPickup( P, StartVelocity );
	
	if( Instigator != None && Instigator.InvManager != None )
	{
		NewSingle = KFWeapon( Instigator.InvManager.CreateInventory(SingleClass, true) );
	}
	if( NewSingle != none )
	{
		// divide ammo between make sure we don't lose a round due to truncation.

		NewSingle.AmmoCount[0] = (AmmoCount[0] & 1) == 0 ? (AmmoCount[0] / 2) : (AmmoCount[0] / 2) + 1;
		AmmoCount[0] /= 2;
		NewSingle.SpareAmmoCount[0] = (SpareAmmoCount[0] & 1) == 0 ? (SpareAmmoCount[0] / 2) : (SpareAmmoCount[0] / 2) + 1;
		SpareAmmoCount[0] /= 2;

		// tell client about our modification
		NewSingle.ClientForceAmmoUpdate(NewSingle.AmmoCount[0],NewSingle.SpareAmmoCount[0]);
		NewSingle.ClientForceSecondaryAmmoUpdate(NewSingle.AmmoCount[1]);

		Instigator.InvManager.SetCurrentWeapon( NewSingle );
	}

	P.InventoryClass = SingleClass;
}

/** Overridden to play anim and use anim length */
simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
{
	ZoomTimeToGo = MySkelMesh.GetAnimLength(IronSightToIdleAnim);

	super.ZoomOut( bAnimateTransition, ZoomTimeToGo );

	if( bAnimateTransition )
	{
		PlayAnimation( IronSightToIdleAnim, ZoomTime, false );
	}
}

/** Locks the bolt bone in place to the open position (Called by animnotify) 
  * Completely overrides super to pick which bolt to lock back
  */
simulated function ANIMNOTIFY_LockBolt()
{
	UpdateOutOfAmmoEffects(0.f);
}

/** Unlocks the bolt bone (Called by animnotify) */
simulated function ANIMNOTIFY_UnLockBolt()
{
	super.ANIMNOTIFY_UnLockBolt();
	EmptyMagBlendNode_L.SetBlendTarget(0, 0);
}

/** Check AmmoCount and update anim tree nodes if needed */
simulated function UpdateOutOfAmmoEffects(float BlendTime)
{
	if ( WorldInfo.NetMode == NM_DedicatedServer )
		return;

	if( EmptyMagBlendNode != None )
	{
		// Differentiate Left/Right
		if ( bAllowClientAmmoTracking && AmmoCount[0] <= 1 )
		{
			EmptyMagBlendNode.SetBlendTarget(1, 0);
			if ( AmmoCount[0] == 0 )
			{
				EmptyMagBlendNode_L.SetBlendTarget(1,0);
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own range for display in trader.
  * Overridden to use single class range.
  */
static simulated function float CalculateTraderWeaponStatRange()
{
	return default.SingleClass.default.EffectiveRange;
}

defaultproperties
{
	Begin Object Name=FirstPersonMesh
		AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
	End Object

	// Custom animations
	FireAnim=Shoot_RW
	LeftFireAnim=Shoot_LW

	//@todo: re-add additional anims when they work
	FireSightedAnims=(Shoot_Iron_RW)//, Shoot_Iron2_RW, Shoot_Iron3_RW)
	LeftFireSightedAnims=(Shoot_Iron_LW)//, Shoot_Iron2_LW, Shoot_Iron3_LW)

	bSkipZoomInRotation=true

	IdleToIronSightAnim=Idle_To_Iron
	IronSightToIdleAnim=Iron_To_Idle
}

