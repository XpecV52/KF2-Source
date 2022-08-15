//=============================================================================
// KFLaserSightAttachment
//=============================================================================
// Attach and manage laser sight to a weapon in 1st person
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Sakib Saikia
//=============================================================================

class KFLaserSightAttachment extends Object
	hidecategories(Object)
	native(Effect);

/** Distance at which we should start scaling the dot size and depth bias (5m) */
`define LaserDotLerpStartDistance 	500.f 
/** Distance at which we should stop scaling the dot size and depth bias (60m) */
`define LaserDotLerpEndDistance 	6000.f
/** Max scale is clamped at 20x */
`define LaserDotMaxScale			10.f

/*********************************************************************************************
 * @name	Attachments
 ********************************************************************************************* */

/** Static Mesh */
var() StaticMesh LaserDotMesh;
var transient StaticMeshComponent LaserDotMeshComp;

/** Laser Mesh */
var()		  SkeletalMesh				LaserBeamMesh;
var transient KFSkeletalMeshComponent	LaserBeamMeshComp;

/** Socket to attach the LaserSight to */
var() name LaserSightSocketName;
var() float LaserSightRange;

/** Specifies how much animation to blend in for the laser dot. 
	If 0, the dot will match the aim direction perfectly.
	If 1, the dot will be completely controlled by animation
	NOTE: First person only.
 */
var float AnimWeight;

/** Specifies blending rate between aim and animation */
var float AnimBlendRate;

/** How strongly the laser sight should adhere to the aim direction.
	Used to blend in and out of the weapon's active state
 */
var transient 			float 			   LaserSightAimStrength;
var transient 			bool 			   LaserAimBlendIn;
var transient 			bool 			   LaserAimBlendOut;

/** Update weapon attachment on an interval. OPTIMIZATION */
var 					float 			   WeapAttachmentSkipTickInterval;
var transient 			float 			   LastWeapAttachmentUpdateTime;

/** Create/Attach lasersight components */
function AttachLaserSight(SkeletalMeshComponent OwnerMesh, bool bFirstPerson, optional name SocketNameOverride)
{
	if ( OwnerMesh == None )
	{
		`log("Invalid mesh for laser sight " @self);
		return;
	}

	// Allow code to override attachment socket
	if ( SocketNameOverride != '' )
	{
		LaserSightSocketName = SocketNameOverride;
	}

	if ( LaserDotMesh != None && bFirstPerson )
	{
		LaserDotMeshComp.SetStaticMesh(LaserDotMesh);
		OwnerMesh.AttachComponentToSocket(LaserDotMeshComp, LaserSightSocketName);
	}

	if ( LaserBeamMesh != None )
	{
		LaserBeamMeshComp.SetSkeletalMesh(LaserBeamMesh);
		OwnerMesh.AttachComponentToSocket(LaserBeamMeshComp, LaserSightSocketName);

		if( bFirstPerson )
		{
			LaserBeamMeshComp.SetDepthPriorityGroup(SDPG_Foreground);
		}

		// If attaching to a mesh with a custom FOV
		if (OwnerMesh.IsA('KFSkeletalMeshComponent'))
		{
			LaserBeamMeshComp.SetFOV( KFSkeletalMeshComponent(OwnerMesh).FOV );
		}
	}
}

/** Set aim blending state - called from weapon */
simulated function SetAimBlendState(bool bBlendIn, bool bBlendOut)
{
	LaserAimBlendIn = bBlendIn;
	LaserAimBlendOut = bBlendOut;
}

/** Update function called from weapon */
simulated function Update(float DeltaTime, KFWeapon OwningWeapon)
{
	local vector TraceStart, TraceEnd;
	local vector InstantTraceHitLocation, InstantTraceHitNormal;
	local vector HitLocation, HitNormal;
	local vector TraceAimDir;
	local vector SocketSpaceNewTraceDir, WorldSpaceNewTraceDir;
	local vector SocketSpaceAimLocation, SocketSpaceAimDir;
	local Actor	HitActor;
	local TraceHitInfo HitInfo;
	local rotator SocketRotation;
	local matrix SocketToWorldTransform;
	local float MaxAimStrength;
	local vector DirA, DirB;
	local Quat Q;

	if( OwningWeapon != None && 
		OwningWeapon.Instigator != None && 
		OwningWeapon.Instigator.IsFirstPerson() )
	{
		MaxAimStrength = 1.f - AnimWeight;

		// Handle blending of the aim strength when entering in and out of states
		// The LaserSightAimStrength determines how closely the laser sight should
		// match the aim of the weapon. We want it to match the aim when the weapon
		// is in idle "aim" position, but want to let it move with the weapon when
		// reloading, sprinting, etc.
		if( LaserAimBlendIn && LaserSightAimStrength < MaxAimStrength )
		{
			LaserSightAimStrength = FMin(LaserSightAimStrength + AnimBlendRate * DeltaTime, MaxAimStrength);
		}
		else if( LaserAimBlendOut && LaserSightAimStrength > 0.f )
		{
			LaserSightAimStrength = FMax(LaserSightAimStrength - AnimBlendRate * DeltaTime, 0.f);
		}
		else
		{
			// Done blending in or out
			LaserAimBlendIn = false;
			LaserAimBlendOut = false;
		}

		// Do aim calculations only when weapon is in active state
		if( OwningWeapon.IsInState('Active') )
		{
			// This is where we would start an instant trace
			TraceStart = OwningWeapon.Instigator.GetWeaponStartTraceLocation();
			TraceAimDir = Vector(OwningWeapon.Instigator.GetAdjustedAimFor( OwningWeapon, TraceStart ));

			// Simulate an instant trace where weapon is aiming, Get hit info.
			// Take minimal part of CalcWeaponFire()
			TraceEnd = TraceStart + TraceAimDir * LaserSightRange;
			HitActor = OwningWeapon.GetTraceOwner().Trace(InstantTraceHitLocation, InstantTraceHitNormal, TraceEnd, TraceStart, TRUE,, HitInfo, 1);

			//OwningWeapon.DrawDebugLine(InstantTraceHitLocation, InstantTraceHitLocation + 50*Normal(InstantTraceHitNormal), 0, 0, 255, FALSE);

			if( HitActor != None )
			{
				// If aim strength is not 100%, then blend in animation
				if( LaserSightAimStrength < 1.f )
				{
					if( OwningWeapon.MySkelMesh != None &&
						OwningWeapon.MySkelMesh.GetSocketWorldLocationAndRotation(LaserSightSocketName,  TraceStart,  SocketRotation) )
					{

						//OwningWeapon.DrawDebugLine(TraceStart, TraceStart + 1000*Vector(SocketRotation), 0, 255, 255, FALSE);

						SocketToWorldTransform = OwningWeapon.MySkelMesh.GetSocketMatrix(LaserSightSocketName);
						SocketSpaceAimLocation = InverseTransformVector(SocketToWorldTransform, InstantTraceHitLocation);

						// Basically SocketSpaceAimLocation - (0,0,0)
						SocketSpaceAimDir = Normal(SocketSpaceAimLocation);

						// Clamp the maximum aim adjustment for the AimDir so you don't get weird
						// cases where the aim dir is rotated away from the location where you
						// are aiming. This can happen if you are really close to an object.
						// Note : DirB is the socket face dir
						DirB = vect(1,0,0);
						DirA = SocketSpaceAimDir;

						if ( (DirA dot DirB) < class'KFWeapon'.const.MaxAimAdjust_Cos )
						{
							Q = QuatFromAxisAndAngle(Normal(DirB cross DirA), class'KFWeapon'.const.MaxAimAdjust_Angle );
							SocketSpaceAimDir = QuatRotateVector(Q,DirB);
						}

						// Apply relative rotation to aim along desired direction
						SocketSpaceNewTraceDir = LaserSightAimStrength * SocketSpaceAimDir + (1.f - LaserSightAimStrength) * DirB;

						// Transform the direction to world space. Convert direction vector  in socket space to point 
						// in world space and subtract the socket location to get direction vector in world space
						WorldSpaceNewTraceDir = TransformVector(SocketToWorldTransform, SocketSpaceNewTraceDir) - TraceStart;

						// Trace from socket along new trace direction
						TraceEnd = TraceStart + Normal(WorldSpaceNewTraceDir) * LaserSightRange;
						HitActor = OwningWeapon.GetTraceOwner().Trace(HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,, HitInfo, 1);

						if( HitActor != None )
						{
							// Unhide the dot mesh and make it point at given hit location
							// Note: SetHidden() checks for previous visibility state before reattaching
							LaserDotMeshComp.SetHidden(false);
							AimAt(HitLocation, HitNormal, OwningWeapon.MySkelMesh);
							//OwningWeapon.DrawDebugLine(HitLocation, HitLocation + 50*Normal(HitNormal), 0, 255, 0, FALSE);
						}
						else
						{
							// Hide the dot mesh if it didn't hit anything
							LaserDotMeshComp.SetHidden(true);
						}
					}
				}
				else
				{
					// If aim strength is 100%, then just aim at the instant trace location
					LaserDotMeshComp.SetHidden(false);
					AimAt(InstantTraceHitLocation, InstantTraceHitNormal, OwningWeapon.MySkelMesh);	
				}
			}
			else
			{
				// Hide the dot mesh if it didn't hit anything
				LaserDotMeshComp.SetHidden(true);
			}
		}
		else if( !OwningWeapon.IsInState('Inactive') )
		{
			// Weapon is in "Inactive" state when it is unequipped. Skip these
			// calculations when unequipped
			if( OwningWeapon.MySkelMesh != None &&
				OwningWeapon.MySkelMesh.GetSocketWorldLocationAndRotation(LaserSightSocketName,  TraceStart,  SocketRotation) )
			{
				TraceEnd = TraceStart + vector(SocketRotation) * LaserSightRange;
				HitActor = OwningWeapon.GetTraceOwner().Trace(HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,, HitInfo, 1);
				
				if( HitActor != None )
				{
					// Unhide the dot mesh and make it point at given hit location
					// Note: SetHidden() checks for previous visibility state before reattaching
					LaserDotMeshComp.SetHidden(false);
					AimAt(HitLocation, HitNormal, OwningWeapon.MySkelMesh);
				}
				else
				{
					// Hide the dot mesh if it didn't hit anything
					LaserDotMeshComp.SetHidden(true);
				}
			}
		}
	}
}


/**
 * Draw the laser dot at the given world space location and oriented in the direction of the given hit normal
 */
function AimAt(vector HitLocation, vector HitNormal, SkeletalMeshComponent ParentMesh)
{
	local vector SocketSpaceAimLocation;
	local matrix SocketToWorldTransform;
	local float LaserDotScale;

	SocketToWorldTransform = ParentMesh.GetSocketMatrix(LaserSightSocketName);

	// Transform the aim location to the coordinate system of the laser sight socket
	SocketSpaceAimLocation = InverseTransformVector(SocketToWorldTransform, HitLocation);	
	LaserDotMeshComp.SetTranslation(SocketSpaceAimLocation);

	// Scale laser dot based on distance clamped at 10x at 30m
	LaserDotScale = 1.f + (`LaserDotMaxScale - 1.f) * FMax((SocketSpaceAimLocation.X - `LaserDotLerpStartDistance)/(`LaserDotLerpEndDistance - `LaserDotLerpStartDistance), 0.f);
	LaserDotMeshComp.SetScale(LaserDotScale);

	// START DEBUG
	//`log("Distance = " $ SocketSpaceAimLocation.X @ "Scale = " $ LaserDotScale @ "DepthBias = " $ LaserDotDepthBias);
	//class'WorldInfo'.static.GetWorldInfo().DrawDebugLine(HitLocation, HitLocation + 50*Normal(HitNormal), 0, 0, 255, FALSE);
	// END DEBUG
}

defaultproperties
{
	Begin Object Class=StaticMeshComponent Name=LaserDotStaticMeshComponent_0
		CastShadow=FALSE
		CollideActors=FALSE
		BlockActors=FALSE
		BlockZeroExtent=FALSE
		BlockNonZeroExtent=FALSE
		BlockRigidBody=FALSE
		bAcceptsDecals=FALSE
		TickGroup=TG_PostAsyncWork
		DepthPriorityGroup=SDPG_Foreground // First person only
	End Object
	LaserDotMeshComp=LaserDotStaticMeshComponent_0

	Begin Object Class=KFSkeletalMeshComponent Name=LaserBeamMeshComp_0
		CastShadow=FALSE
	End Object
	LaserBeamMeshComp=LaserBeamMeshComp_0

	LaserSightRange=10000 //100m
	WeapAttachmentSkipTickInterval=0.5

	// Set AnimWeight to 0 as it causes the laser dot to diverge from the 
	// aim location when you the player is right up against an obstace
	AnimWeight=0.f

	AnimBlendRate=12.f
}
