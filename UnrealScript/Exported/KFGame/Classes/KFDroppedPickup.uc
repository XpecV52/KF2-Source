//=============================================================================
// KFDroppedPickup
//=============================================================================
// Implements dropped weapon/item pickups
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
// Based on GearDroppedPickup
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class KFDroppedPickup extends DroppedPickup
	native
	nativereplication;

var const RigidBodyState	RBState;
var	const float				AngErrorAccumulator;

/** True if a collision should trigger audio, false otherwise. */
var transient bool			bCollisionSoundsEnabled;

var protectedwrite MeshComponent MyMeshComp;

/** Cache a reference to the cylinder component */
var protectedwrite CylinderComponent MyCylinderComp;

/** (TW) Setup rigid body physics for static meshes components */
var const bool bEnableStaticMeshRBPhys;
/** (TW) If set this pickups passes (and can be picked) through blocking volumes) */
var const bool bIgnoreBlockingVolumes;

/** Skin assigned from dropped weapon */
var private int SkinItemId;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if ( Role == ROLE_Authority )
		RBState;

	if ( bNetInitial )
		SkinItemId;
}

/*********************************************************************************************
 Constructors, Destructors, and Loading
********************************************************************************************* */

/**
 * sets the pickups mesh and makes it the collision component so we can run rigid body physics on it
 */
simulated function SetPickupMesh(PrimitiveComponent NewPickupMesh)
{
	local ActorComponent Comp;
	local SkeletalMeshComponent SkelMC;
	local StaticMeshComponent StaticMC;
	local array<MaterialInterface> SkinMICs;

	if (Role == ROLE_Authority )
	{
		if ( Inventory != None && Inventory.IsA('KFWeapon') )
		{
			SkinItemId = KFWeapon(Inventory).SkinItemId;
		}
		SetTimer(LifeSpan, false, nameof(TryFadeOut));
	}

	if (NewPickupMesh != None)
	{
		if (CollisionComponent == None || CollisionComponent.Class != NewPickupMesh.Class)
		{
			Comp = new(self) NewPickupMesh.Class(NewPickupMesh);
			MyMeshComp = MeshComponent(Comp);
			AttachComponent(Comp);
			MyCylinderComp = CylinderComponent(CollisionComponent);
			AlignMeshToCylinder();

			CollisionComponent = PrimitiveComponent(Comp);
		}
		else
		{
			Comp = CollisionComponent;
		}

		// Set up physics on the cloned component
		CollisionComponent.SetScale3D(NewPickupMesh.Scale3D);

		CollisionComponent.SetBlockRigidBody(TRUE);
		CollisionComponent.SetActorCollision(TRUE,FALSE);
		CollisionComponent.SetRBChannel( RBCC_Pickup );
		CollisionComponent.SetRBCollidesWithChannel( RBCC_Default, TRUE );
		if ( !bIgnoreBlockingVolumes )
		{
			CollisionComponent.SetRBCollidesWithChannel( RBCC_BlockingVolume, TRUE );
		}

		CollisionComponent.SetNotifyRigidBodyCollision( TRUE );
		CollisionComponent.ScriptRigidBodyCollisionThreshold = 100;
		CollisionComponent.WakeRigidBody();

		SkelMC = SkeletalMeshComponent(CollisionComponent);
		if (SkelMC != None)
		{
			SkelMC.bUpdateSkelWhenNotRendered=FALSE;
			SkelMC.bComponentUseFixedSkelBounds=FALSE; // using physics when dropped, can't use fixed bounds

			SkelMC.PhysicsWeight = 1.f;
			SkelMC.SetHasPhysicsAssetInstance(TRUE);
			if (Role == ROLE_Authority)
			{
				SetPhysics(PHYS_RigidBody);
			}

			SkelMC.PhysicsAssetInstance.SetAllBodiesFixed(false);

			bCallRigidBodyWakeEvents = true;
		}
		else
		{
			StaticMC = StaticMeshComponent(CollisionComponent);
			if (StaticMC != none && bEnableStaticMeshRBPhys)
			{
				CollisionComponent.InitRBPhys();
				if (Role == ROLE_Authority && CollisionComponent.BodyInstance != None)
				{
					SetPhysics(PHYS_RigidBody);
				}

				bCallRigidBodyWakeEvents = true;

				// PhysX3 fix - Inherit RB velocity from actor (StaticMesh only)
				MyMeshComp.SetRBLinearVelocity(Velocity);
				Velocity = vect(0,0,0);
			}
		}

		if ( MyMeshComp != None )
		{
			SkinMICs = class'KFWeaponSkinList'.static.GetWeaponSkin(SkinItemId, WST_Pickup);
			if ( SkinMICs.Length > 0 )
			{
				MyMeshComp.SetMaterial(0, SkinMICs[0]);
			}
		}
	}
}

/**
 * returns the display name of the item to be picked up
 */
simulated function String GetDisplayName()
{
	if ( InventoryClass != None )
	{
		return InventoryClass.Default.ItemName;
	}

	return "";
}

/** Moves the mesh to be centered and sized correctly since most of our weapon meshes are way off center */
simulated function AlignMeshToCylinder()
{
	local vector MeshCenterLocal;
	local SkeletalMeshComponent SkelComp;

	// translate mesh so that the bounds origin is at the actor position
	SkelComp = SkeletalMeshComponent(MyMeshComp);
	if (SkelComp != None)
	{
		MeshCenterLocal = (SkelComp.Bounds.Origin - Location) << Rotation;
		SkelComp.SetTranslation(-MeshCenterLocal);
	}
}

/*********************************************************************************************
 PHYS_RigidBody
********************************************************************************************* */

 /** RigidBody went to sleep after being awake - only valid if bCallRigidBodyWakeEvents==TRUE */
event OnSleepRBPhysics()
{
	local SkeletalMeshComponent SkelComp;

	//`log( "turning off RB collision" );
	CollisionComponent.SetNotifyRigidBodyCollision(false);
	ClearTimer( 'CheckForRigidBodySleepState' );
	CollisionComponent.SetBlockRigidBody(false);
	CollisionComponent.SetActorCollision(false, false);

	// Fix in place so nothing can move it.
	SkelComp = SkeletalMeshComponent(CollisionComponent);
	if (SkelComp != None && SkelComp.PhysicsAssetInstance != None)
	{
		SkelComp.PhysicsAssetInstance.SetAllBodiesFixed(true);
		SkelComp.bUpdateKinematicBonesFromAnimation = false;
	}

	if (SkelComp != None)
	{
		SkelComp.bNoSkeletonUpdate = true;
		SkelComp.bUpdateSkelWhenNotRendered = false;
		SkelComp.SetAnimTreeTemplate(None);
	}
	else if ( bEnableStaticMeshRBPhys )
	{
		CollisionComponent.GetRootBodyInstance().SetFixed(true);
	}

	// reduce to dirty replication like DroppedPickup
	bOnlyDirtyReplication = true;
	bNetDirty = true;

	// pretend we were rendered this frame to make sure everything (bounds, physics, etc) gets updated with our final pose
	CollisionComponent.LastRenderTime = WorldInfo.TimeSeconds;

	AlignCollisionCylinder();
}

/** moves the cylinder to be centered and sized correctly since most of our weapon meshes are way off center */
simulated final function AlignCollisionCylinder()
{
	local vector MeshCenter;
	local vector MeshTranslationLocal;

	MeshCenter = (MyMeshComp.Bounds.Origin - Location);
	// Added cylinder CollisionHeight so that cylinder rests on the floor
	MeshTranslationLocal = (MyCylinderComp.default.CollisionHeight * vect(0,0,1) + MeshCenter) << Rotation;

	MyCylinderComp.SetTranslation(MeshTranslationLocal);
}

/** @see GearWeapon.DropFrom  for the ScriptRigidBodyCollisionThreshold value we use **/
event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
						 const out CollisionImpactData RigidCollisionData, int ContactIndex)
{
	PlayCollisionSound();
}

/*********************************************************************************************
 Sound Effects
********************************************************************************************* */

/**
 * Overridden to prevent adding to navigation network.
 */
event Landed(vector HitNormal, actor FloorActor)
{
	bForceNetUpdate = TRUE;
	NetUpdateFrequency = 3;

	PlayCollisionSound();
}

function PlayCollisionSound()
{
	//local SoundCue Cue;
	//local float Duration;

	if (bCollisionSoundsEnabled)
	{
		//Cue = class<KFWeapon>(InventoryClass).default.WeaponDropSound;

		//if (Cue != None)
		//{
		//	Duration = Cue.GetCueDuration();
		//	SetTimer( Duration, FALSE, nameof(ReenableCollisionSounds) );
		//	PlaySound(Cue);
		//	bCollisionSoundsEnabled = FALSE;
		//}
	}
}

function ReenableCollisionSounds()
{
	bCollisionSoundsEnabled = TRUE;
}

/*********************************************************************************************
 Inventory
********************************************************************************************* */

/**
 * Give pickup to player
 */
function GiveTo( Pawn P )
{
	local KFWeapon KFW;
	local class<KFWeapon> KFWInvClass;
	local Inventory NewInventory;
	local KFInventoryManager KFIM;

	KFIM = KFInventoryManager(P.InvManager);
	if ( KFIM != None )
	{
		KFWInvClass = class<KFWeapon>(InventoryClass);
		foreach KFIM.InventoryActors( class'KFWeapon', KFW )
		{
			if ( KFW.Class == InventoryClass )
			{
				// if this isn't a dual-wield class, then we can't carry another
				if( KFW.DualClass == none )
				{
					PlayerController(P.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AlreadyCarryingWeapon );
					return;
				}
				break;
			}
			// if we already have the dual version of this single, then we can't carry another
			else if( KFWInvClass != none && KFW.Class == KFWInvClass.default.DualClass )
			{
				PlayerController(P.Owner).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_AlreadyCarryingWeapon );
				return;
			}
		}
		NewInventory = KFIM.CreateInventory(InventoryClass, true);
		if (NewInventory != none)
		{
			// Added extra check in case we want to pick up a non-weapon based pickup
			KFW = KFWeapon(NewInventory);
			if ( KFW != none)
			{
				KFW.SetOriginalValuesFromPickup( KFWeapon(Inventory) );
			}
			
			Destroy();
		}
	}

	if(Role == ROLE_Authority)
	{
		//refresh weapon hud here
		NotifyHUDofWeapon(P);
	}
}

event Destroyed()
{
	super.Destroyed();
	
	Inventory.Destroy();
	Inventory = none;
}

function NotifyHUDofWeapon( Pawn P )
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(P.Owner);

	if(KFPC != none && KFPC.MyGFxHUD != none)
	{
		KFPC.MyGFxHUD.NotifyHUDofWeapon();
	}
}

/*********************************************************************************************
 * State Pickup
 * Pickup is active
 *********************************************************************************************/

function bool ValidTouch(Pawn Other);

auto state Pickup
{
	/**
	 * Validate touch (if valid return true to let other pick me up and trigger event).
	 * Overridden to remove call to WorldInfo.Game.PickupQuery(Other, InventoryType, self) since we need this to be client side
	 */
	function bool ValidTouch( Pawn Other )
	{
		local Actor HitA;
		local vector HitLocation, HitNormal;
		local bool bHitWall;

		// make sure its a live player
		if (Other == None || !Other.bCanPickupInventory || (Other.DrivenVehicle == None && Other.Controller == None))
		{
			return false;
		}

		// prevent picking up as soon as it's spawned
		if ( Other == Instigator && (WorldInfo.TimeSeconds - CreationTime) < 0.1f )
		{
			return false;
		}

		// make sure not touching through wall
		foreach Other.TraceActors(class'Actor', HitA, HitLocation, HitNormal, MyCylinderComp.GetPosition() + vect(0,0,10), Other.Location/*, vect(1,1,1)*/)
		{
			if ( IsTouchBlockedBy(HitA) )
			{
				if (MyMeshComp == None)
				{
					return false;
				}
				else
				{
					bHitWall = true;
					break;
				}
			}
		}
		if (bHitWall)
		{
			// fail only if wall between both cylinder and mesh center
			foreach Other.TraceActors(class'Actor', HitA, HitLocation, HitNormal, MyMeshComp.Bounds.Origin + vect(0,0,10), Other.Location/*, vect(1,1,1)*/)
			{
				if ( IsTouchBlockedBy(HitA) )
				{
					return false;
				}
			}
		}

		// make sure game will let player pick me up
		if (WorldInfo.Game.PickupQuery(Other, Inventory.class, self))
		{
			return true;
		}
		return false;
	}

	/**
	* Overridden to prevent adding to navigation network.
	*/
	function BeginState(Name PreviousStateName)
	{
		SetTimer(LifeSpan - 1, false);
	}
}

/** helper for ValidTouch */
simulated function bool IsTouchBlockedBy(Actor A)
{
	if (A != self && A.bBlockActors && A.bWorldGeometry)
	{
		if ( BlockingVolume(A) != None )
		{
			return false;
		}

		return true;
	}

	return false;
}

/*********************************************************************************************
 * state FadeOut extends Pickup
 * Pickup is about to disappear
 *********************************************************************************************/

State FadeOut
{
	function Tick(float DeltaTime)
	{
		SetDrawScale(FMax(0.01, DrawScale - Default.DrawScale * DeltaTime));
		Global.Tick(DeltaTime);
	}

	simulated event BeginState(Name PreviousStateName)
	{
		bFadeOut = true;
		RotationRate.Yaw=60000;
		SetPhysics(PHYS_Rotating);
		LifeSpan = 1.0;
	}

	/** disable normal touching. we require input from the player to pick it up */
	event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
	{
	}
}

/** Called on the server, try to find out when item is not close to player */
function TryFadeOut()
{
	local Pawn P;

	// don't fade out yet if a player is nearby
	foreach WorldInfo.AllPawns(class'Pawn', P, Location, 1024.0)
	{
		if (P.IsPlayerOwned())
		{
			SetTimer(5.0, false, nameof(TryFadeOut));
			return;
		}
	}
	GotoState('FadeOut');
}

defaultproperties
{
   bEnableStaticMeshRBPhys=True
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DroppedPickup:Sprite'
      Sprite=Texture2D'EditorResources.S_Inventory'
      SpriteCategoryName="Inventory"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DroppedPickup:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__DroppedPickup:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=75.000000
      ReplacementPrimitive=None
      CollideActors=True
      Translation=(X=0.000000,Y=0.000000,Z=40.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__DroppedPickup:CollisionCylinder'
   End Object
   Components(1)=CollisionCylinder
   bCanStepUpOn=False
   bAlwaysRelevant=True
   bOnlyDirtyReplication=False
   bKillDuringLevelTransition=True
   LifeSpan=300.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFDroppedPickup"
   ObjectArchetype=DroppedPickup'Engine.Default__DroppedPickup'
}
