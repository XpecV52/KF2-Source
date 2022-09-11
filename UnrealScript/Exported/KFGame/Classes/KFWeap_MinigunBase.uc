//=============================================================================
// KFWeap_MinigunBase
//=============================================================================
// Minigun base
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_MinigunBase extends KFWeapon
	abstract
	native
	nativereplication;

/* The minigun is winded up and ready to fire */
var bool bWindUpReady;

/* The zoom is active, keeps track of the current status of the zoom */
var bool bZoomActive;

/* Time used to wind up the weapon (also acts as the cooldown) */
var float WindUpActivationTime;

/* Control variable to check the current state of the wind up */
var transient float WindUpControlTime;

/* Rotation speed of the barrel when fully warmed up*/
var float WindUpRotationSpeed;

/* Rotation info of the barrel, controls the rotation for the selected bone via c++ */
var CylinderRotationInfo CylinderRotInfo;

/* The weapon is winding up */
var repnotify bool bWindUpModeActive;

/* The system stores the status of the winding up in case some animation interrupts the process */
var repnotify bool bStoredWindUpMode;

/* The weapon is firing and the barrels should be rotating */
var repnotify bool bFiringModeActive;

/* Replicated status of the rotation of the barrels */
var bool bReplicatedFiringModeActive;

/* Replicated rotation speed of the barrel when fully warmed up */
var repnotify float ReplicatedWindUpControlTime;

/* Rotation speed used in the player controller when the weapon is winding up but no firing */
var float WindUpViewRotationSpeed;

/* Pawn movement speed used when the weapon is winding up but no firing */
var float WindUpPawnMovementSpeed;

/* Rotation speed used in the player controller when the weapon is firing */
var float FiringViewRotationSpeed;

/* Pawn movement speed used when the weapon is firing */
var float FiringPawnMovementSpeed;

simulated event ReplicatedEvent(name VarName)
{
	switch (VarName)
	{
		case nameof(bWindUpModeActive):
			bReplicatedFiringModeActive = bWindUpModeActive || bFiringModeActive;
			NotifyRotationState();
		break;
		case nameof(bStoredWindUpMode):
			NotifyRotationState();
		break;
		case nameof(bFiringModeActive):
			bReplicatedFiringModeActive = bWindUpModeActive || bFiringModeActive;
			NotifyRotationState();
		break;
		case nameof(ReplicatedWindUpControlTime):
			if( Instigator == none || !Instigator.IsLocallyControlled() )
			{
				WindUpControlTime = ReplicatedWindUpControlTime;
			}
		break;
	}
}

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		bWindUpModeActive, bStoredWindUpMode, bFiringModeActive, ReplicatedWindUpControlTime;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Cache Anim Nodes from the tree
* 	@note: skipped on server because AttachComponent/AttachWeaponTo is not called
*/
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree( SkelComp );
	PostInitAnimTreeMinigun( SkelComp );
}

simulated event PostInitAnimTreeMinigun( SkeletalMeshComponent SkelComp )
{
	CylinderRotInfo.Control = SkelControlSingleBone( SkelComp.FindSkelControl('CylinderControl') );
	if( CylinderRotInfo.Control != none )
	{
		CylinderRotInfo.Control.SetSkelControlActive( true );
	}
}

/* updates the cylinder rotation in Tick Special */
native simulated function UpdateCylinderRotation( out CylinderRotationInfo RotInfo, float Degrees );

/* function called from C++ to access perk time modifier when winding up */
simulated event float GetPerkFireRateModifier()
{
	local KFPerk_Commando Perk;

	Perk = KFPerk_Commando(GetPerk());
	if( WorldInfo.TimeDilation < 1 && Perk != none )
	{
		return Perk.GetZedTimeModifierForWindUp();
	}

	return 0;
}

simulated function Activate()
{
	Local KFPlayerController KFPC;
	Local KFPlayerInput KFPI;

	super.Activate();
	
	if (!WeaponContentLoaded || Instigator == none)
	{
		return;
	}

	KFPC = KFPlayerController(Instigator.Controller);
	if(KFPC != none && KFPC.PlayerInput != none)
	{
		KFPI = KFPlayerInput(KFPC.PlayerInput);
		if(KFPI != none && KFPI.bIronsightsActive)
		{
			SetIronSights(true);
		}
	}
}

simulated event vector GetMuzzleLoc()
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

         return Instigator.GetPawnViewLocation() + (FireOffset >> ViewRotation);
	}

	return Location;
}

simulated function BeginFire(Byte FireModeNum)
{
	if(FireModeNum == DEFAULT_FIREMODE)
	{
		bFiringModeActive = true;
		bForceNetUpdate = true;
	}
	Super.BeginFire(FireModeNum);
}

simulated function EndFire(byte FireModeNum)
{
	if(FireModeNum == DEFAULT_FIREMODE)
	{
		bFiringModeActive = false;
		bForceNetUpdate = true;
	}
	Super.EndFire(FireModeNum);
}

/** If TRUE, Instigator/Owner moves at walking speed when this weapon is equipped */
simulated function bool ShouldOwnerWalk()
{
	return IsFiring();
}

/** Disable the rotation of the barrels when sprinting */
simulated function SetWeaponSprint(bool bNewSprintStatus)
{
	if(bNewSprintStatus && bWindUpModeActive)
	{
		WindUp(false);
		UpdateZoom();
	}
	Super.SetWeaponSprint(bNewSprintStatus);
}

/** Force iron sights as the default configuration is set to false */
simulated function bool AllowIronSights()
{
	return true;
}

/** Used in KFPlayerInput to change the behaviour of the iron sight */
simulated function bool IsUsingSights()
{
	return bWindUpModeActive;
}

/**
 * Network: LocalPlayer
 * Changes the functionality of the Iron sight
 */
simulated function SetIronSights(bool bNewIronSights)
{
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	ServerSetIronSights(bNewIronSights);

	bStoredWindUpMode = bNewIronSights;

	if(GetStateName() == 'Reloading' || GetStateName() == 'WeaponSprinting')
	{
		WindUp(false);
		UpdateZoom();
		return;
	}
	
	PlayIdleAnim();

	WindUp(bNewIronSights);
	UpdateZoom();
	bForceNetUpdate = true;
}

reliable server function ServerSetIronSights(bool bNewIronSights)
{
	bStoredWindUpMode = bNewIronSights;

	if(GetStateName() == 'Reloading' || GetStateName() == 'WeaponSprinting')
	{
		WindUp(false);
		UpdateZoom();
		return;
	}
	
	WindUp(bNewIronSights);
	UpdateZoom();
}

simulated function WindUp(bool bWindUpActive)
{
	bWindUpModeActive = bWindUpActive;
	NotifyRotationState();
}

/** Updates the rotation in the 3rd person character */
simulated function NotifyRotationState()
{
	local KFPawn KFPawn;
	local KFWeapAttach_Minigun KFWeapAttach;

	KFPawn = KFPawn(Instigator);
	KFWeapAttach = KFWeapAttach_Minigun(KFPawn.WeaponAttachment);

	if(KFWeapAttach != none)
	{
		KFWeapAttach.UpdateWindUp(bReplicatedFiringModeActive || bWindUpModeActive || IsFiring());
	}
}

/** Updates the zoom status (active when firing or winding up) */
simulated function UpdateZoom()
{
	local bool bNewZoomStatus;

	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	bNewZoomStatus = bWindUpModeActive || IsFiring();

	if(bZoomActive == bNewZoomStatus)
	{
		return;
	}

	bZoomActive = bNewZoomStatus;
	PerformZoom(bZoomActive);
}

simulated event OnZoomInFinished(){ }
simulated event OnZoomOutFinished(){ }

simulated event Tick( float DeltaTime )
{
	local KFPawn_Human OwnerHuman;
	local KFPlayerController OwnerController;

	local float NewMovementSpeedMod;
	local float NewRotationSpeedLimit;

	Super.Tick(DeltaTime);
	
	// Replicate WindUp time to simulated clients
	if ( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.NetMode == NM_ListenServer )
	{
		ReplicatedWindUpControlTime = WindUpControlTime;
	}

	if( Role == Role_Authority )
	{
		OwnerHuman = KFPawn_Human(Instigator);
		if (OwnerHuman != None)
		{
			OwnerController = KFPlayerController(OwnerHuman.Controller);
			if (OwnerController != none)
			{
				NewMovementSpeedMod = MovementSpeedMod;
				NewRotationSpeedLimit = OwnerController.RotationSpeedLimit;

				if ( IsFiring() )
				{
					NewMovementSpeedMod = FiringPawnMovementSpeed;
					NewRotationSpeedLimit = FiringViewRotationSpeed;
				}
				else if( bWindUpModeActive )
				{
					NewMovementSpeedMod = WindUpPawnMovementSpeed;
					NewRotationSpeedLimit = WindUpViewRotationSpeed;
				}
				else
				{
					NewMovementSpeedMod = 1;
					NewRotationSpeedLimit = 2000.0f;
				}
				
				if( NewMovementSpeedMod != MovementSpeedMod || NewRotationSpeedLimit != OwnerController.RotationSpeedLimit)
				{
					MovementSpeedMod = NewMovementSpeedMod;
					OwnerController.RotationSpeedLimit = NewRotationSpeedLimit;
					OwnerHuman.UpdateGroundSpeed();
				}
			}
		}
	}
}

simulated function NotifyBeginState()
{
	Super.NotifyBeginState();
	NotifyRotationState();
}

simulated function NotifyEndState()
{
	Super.NotifyEndState();
	NotifyRotationState();
}

/*********************************************************************************************
 * State WeaponWindingUp
 * The weapon is in this state to wind up and prepare for firing
*********************************************************************************************/

simulated state WeaponWindingUp
{
	simulated event bool IsFiring()
	{
		return true;
	}

	simulated function BeginState(Name PrevStateName)
	{
		local KFPerk InstigatorPerk;
		local int IdleIndex;

		NotifyBeginState();
		
		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifierForWindUp() );
		}

		UpdateZoom();

		if ( Instigator.IsLocallyControlled() )
		{
			if ( IdleAnims.Length > 0 )
			{
				IdleIndex = Rand(IdleAnims.Length);
				PlayAnimation(IdleAnims[IdleIndex], 0.0, true, 0.2);
			}

			StartIdleFidgetTimer();
			ToggleAdditiveBobAnim(!bUsingSights);
		}

		if( bWindUpReady )
		{
			GoToState('WeaponFiring');
		}
	}

	simulated function EndState(Name NextStateName)
	{
		NotifyEndState();
	}
	
	simulated event Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);

        // Stop the looping fire sound if we're in zed time and want to play single fire sounds
        if( bPlayingLoopingFireSnd && ShouldForceSingleFireSound() )
        {
    		StopLoopingFireSound(CurrentFireMode);
        }

		if(bWindUpReady)
		{
			GoToState('WeaponFiring');
		}
		else if(!bFiringModeActive)
		{
			HandleFinishedFiring();
		}
	}
}

/*********************************************************************************************
 * State WeaponFiring
 * The weapon is in this state while holding fire button
*********************************************************************************************/

simulated state WeaponFiring
{	
	simulated event BeginState(Name PreviousStateName)
	{
		local KFPerk InstigatorPerk;

		Super.BeginState(PreviousStateName);

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifierForWindUp() );
		}
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		UpdateZoom();
	}
}

/*********************************************************************************************
 * State MeleeAttackBasic
 * We are doing a melee attack
*********************************************************************************************/

simulated state MeleeAttackBasic
{
	ignores AllowSprinting, AllowIronSights;

	simulated function BeginState(Name PreviousStateName)
	{
		local KFPerk InstigatorPerk;

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}

		TimeWeaponFiring(CurrentFireMode);
		NotifyBeginState();
	}
}

/*********************************************************************************************
 * State Active
 * The weapon idle state (not firing, not reloading, ...)
*********************************************************************************************/

simulated state Active
{
	/** Initialize the weapon as being active and ready to go. */
	simulated event BeginState(Name PreviousStateName)
	{
		local KFPerk InstigatorPerk;

		WindUp(bStoredWindUpMode);
		UpdateZoom();

		Super.BeginState(PreviousStateName);

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifierForWindUp() );
		}
	}
}

/*********************************************************************************************
 * State GrenadeFiring
 * Handles firing grenades.
 *********************************************************************************************/

simulated state GrenadeFiring
{
	simulated event bool IsFiring()
	{
		return false;
	}
}

/** Called on local player when reload starts and replicated to server */
simulated function InitializeReload()
{
	WindUp(false);
	bZoomActive = false;
	Super.InitializeReload();
}

reliable server function ServerSendToReload(byte ClientReloadAmount)
{
	Super.ServerSendToReload(ClientReloadAmount);
	WindUp(false);
	bZoomActive = false;
}

defaultproperties
{
   WindUpActivationTime=1.500000
   WindUpRotationSpeed=200.000000
   WindUpViewRotationSpeed=2000.000000
   WindUpPawnMovementSpeed=1.000000
   FiringViewRotationSpeed=2000.000000
   FiringPawnMovementSpeed=0.750000
   bKeepIronSightsOnJump=True
   bSkipZoomInRotation=True
   FireSightedAnims(0)="Shoot"
   FireLoopSightedAnim="ShootLoop"
   FireLastSightedAnim="Shoot_Last"
   IdleSightedAnims(0)="Idle"
   FireLoopStartSightedAnim="ShootLoop_Start"
   FireLoopEndSightedAnim="ShootLoop_End"
   FireLoopEndLastSightedAnim="ShootLoop_End_Last"
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MinigunBase:MeleeHelper_0'
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
   bOnlyRelevantToOwner=False
   bAlwaysRelevant=True
   Name="Default__KFWeap_MinigunBase"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}