//=============================================================================
// KFPickupFactory
//=============================================================================
// Base KF2 PickupFactory
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPickupFactory extends PickupFactory
	abstract
	placeable
	native;

cpptext
{
#if WITH_EDITOR
	virtual UBOOL CanConnectTo(ANavigationPoint* Nav, UBOOL bCheckDistance);
	virtual void CheckForErrors();
#endif //WITH_EDITOR
}

/** Set to true if we've chosen this pickup factory to respawn */
var bool bToBeActivated;

/** Pick a weapon from 'ItemPickups' and enable it in the world */
function Reset()
{
	bToBeActivated = false;
	GotoState('Pickup');
}

/** Hide and stop collision on the pickup */
function StartSleeping()
{
 	super.StartSleeping();
 	// Clear reset if StartSleeping is called at the beginninf of a wave
 	ClearTimer( nameof(Reset) );
}

/** Do not try to respawn this pickup on its own */
function bool DelayRespawn()
{
 	return true;
}

/** Determine what kind of pickup is visible. Used for dialog. */
function bool CurrentPickupIsWeapon()
{
	return false;
}
function bool CurrentPickupIsArmor()
{
	return false;
}
function bool CurrentPickupIsAmmo()
{
	return false;
}

/** 
  * Make pickup mesh and associated effects hidden.
  */
simulated function SetPickupHidden()
{
	Super.SetPickupHidden();
	if ( PickupMesh != None )
	{
		PickupMesh.SetBlockRigidBody(FALSE);
	}
}

/** 
  * Make pickup mesh and associated effects visible.
  */
simulated function SetPickupVisible()
{
	Super.SetPickupVisible();
	if ( PickupMesh != None )
	{
		PickupMesh.SetBlockRigidBody(TRUE);
	}
}

DefaultProperties
{
	// because we call SetRBCollidesWithChannel in SetPickupVisible/Hidden, we can't be in the asynch tickgroup
	TickGroup=TG_PostAsyncWork

	bAllowPathConnections=false
	bNoAutoConnect=true
	bMovable=false
}

