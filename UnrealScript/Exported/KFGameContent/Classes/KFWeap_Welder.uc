//=============================================================================
// KFWeap_Healer_Syringe
//=============================================================================
// Weapon class used for the healer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFWeap_Welder extends KFWeapon
	hidedropdown;

/*********************************************************************************************
 @name Firing
********************************************************************************************* */

/** Maximum range to find Door */
var() float WeldingRange;
/** How many points to add to a door's weld integrity per use (use rate determined by FireInterval) */
var() float FastenRate;
/** How many points to subtract from a door's weld integrity per use (use rate determined by FireInterval) */
var() float UnFastenRate;

/** Give the welder extra range when it has a WeldTarget to avoid the ready animation 
activating / deactivating on door that is is currently being damaged */
var const float ExtraWeldingRange;

/** How much ammo each use consumes (use rate determined by FireInterval) */
var() float AmmoCost;
/** How long (in seconds) it takes to recharge ammo by 1 unit */
var() float AmmoRechargeRate;

/*********************************************************************************************
 @name Animations
********************************************************************************************* */

/** animation names */
var name IdleWeldAnim;
var name WeldOpenAnim;
var name WeldCloseAnim;

/** Reference to the door we're pointing at */
var KFDoorActor WeldTarget;

/** Store last update to we can prevent idle->ready->idle to quickly */
var float LastTraceHitTime;

/*********************************************************************************************
 @name Screen
********************************************************************************************* */
var class<KFGFxWorld_WelderScreen> ScreenUIClass;
var KFGFxWorld_WelderScreen ScreenUI;

/** Turn on the UI screen when we equip the healer */
simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{
	super.AttachWeaponTo( MeshCpnt, SocketName );

	if( Instigator != none && Instigator.IsLocallyControlled() )
	{
		// Create the screen's UI piece
		if (ScreenUI == none)
		{
			ScreenUI = new( self ) ScreenUIClass;
			ScreenUI.Init();
			ScreenUI.Start(true);
		}

		if ( ScreenUI != none)
		{
			ScreenUI.SetPause(false);
			ScreenUI.SetCharge( AmmoCount[0] );
			ScreenUI.SetIntegrity( 255 );
		}
	}
}

/** Turn off the UI screen when we unequip the healer */
simulated function DetachWeapon()
{
	super.DetachWeapon();
	if ( Instigator != none && Instigator.IsLocallyControlled() && ScreenUI != none )
	{
		ScreenUI.SetPause();
	}
}

/** @see Weapon::Tick */
simulated event Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);

	UpdateScreenUI();
}

simulated event Destroyed()
{
	if ( Instigator != none && Instigator.IsLocallyControlled() && ScreenUI != none)
	{
		ScreenUI.Close();
	}
	super.Destroyed();
}

/** Only update the screen screen if we have the welder equipped and it's screen values have changed */
simulated function UpdateScreenUI()
{
	local byte WeldPercentage;

	if ( Instigator != none && Instigator.IsLocallyControlled() && Instigator.Weapon == self )
	{
		if ( ScreenUI != none )
		{
			// Check if our current ammo reading has changed
			if ( ScreenUI.CurrentCharge != AmmoCount[0] )
			{
				ScreenUI.SetCharge( AmmoCount[0] );
			}

			if ( WeldTarget != none )
			{
				WeldPercentage = ( float(WeldTarget.WeldIntegrity) / float(WeldTarget.MaxWeldIntegrity) ) * 100;
				// Check if our weld integrity has changed
				if ( WeldPercentage != ScreenUI.IntegrityPercentage )
				{
		        	ScreenUI.SetIntegrity( WeldPercentage );
		     	}
			}
			// Remove our weld value
			else if ( ScreenUI.IntegrityPercentage != 255 )
			{
		    	ScreenUI.SetIntegrity( 255 );
			}
		}
	}
}

/*********************************************************************************************
 * @name Ammunition
 *********************************************************************************************/

simulated function bool HasAnyAmmo()
{
	return true;
}

simulated function bool HasAmmo( byte FireModeNum, optional int Amount=1 )
{
	if ( FireModeNum == DEFAULT_FIREMODE || FireModeNum == ALTFIRE_FIREMODE )
	{
		if ( AmmoCount[0] - AmmoCost > 0 )
		{
			// Requires a valid WeldTarget (see ServerSetWeldTarget)
			return WeldTarget != None;
		}
		return false;
	}

	return Super.HasAmmo(FireModeNum, Amount);
}

/** Returns true if weapon should be auto-reloaded */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	return false;
}

/*********************************************************************************************
 @name Firing / Projectile
********************************************************************************************* */

/** Instead of switch fire mode use as immediate alt fire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	// StartFire - StopFire called from KFPlayerInput
	StartFire(ALTFIRE_FIREMODE);
}

/**
 * @see Weapon::StartFire
 */
simulated function StartFire(byte FireModeNum)
{
	// Notify server of the weld target we plan to use
	if ( FireModeNum == DEFAULT_FIREMODE || FireModeNum == ALTFIRE_FIREMODE )
	{
		if ( Role < ROLE_Authority )
		{
			ServerSetWeldTarget(WeldTarget, false);
		}
	}

	Super.StartFire(FireModeNum);
}

/**
 * If the weapon isn't an instant hit, or a simple projectile, it should use the type EWFT_Custom.  In those cases
 * this function will be called.  It should be subclassed by the custom weapon.
 */
simulated function CustomFire()
{
	local float CurrentFastenRate, CurrentUnfastenRate;

	WeldTarget = TraceDoorActors();
	// Fasten/Unfasten the door
	if ( Role == ROLE_Authority && WeldTarget != None )
	{
		CurrentFastenRate = FastenRate;
		CurrentUnfastenRate = UnFastenRate;

		GetPerk().ModifyWeldingRate(CurrentFastenRate, CurrentUnfastenRate);
		SetTimer(AmmoRechargeRate, true, nameof(RechargeAmmo));

		if ( CurrentFireMode == DEFAULT_FIREMODE )
		{
			WeldTarget.FastenDoor(CurrentFastenRate, KFPawn(Instigator));
		}
		else
		{
			WeldTarget.FastenDoor(CurrentUnfastenRate, KFPawn(Instigator));
		}
	}

	// On the local player check to see if we should stop firing
	// It makes sense to do this in ShouldRefire(), but there is no guarantee
	// that it will sync on server/client.  So, use StopFire() instead.
	if ( Instigator.IsLocallyControlled() )
	{
		if ( WeldTarget == none || !CanWeldTarget() )
		{
			// TargetDoor is no longer valid
			StopFire(CurrentFireMode);
		}
	}
}

simulated function bool CanWeldTarget()
{
	if ( CurrentFireMode == DEFAULT_FIREMODE &&
		 WeldTarget.WeldIntegrity >= WeldTarget.MaxWeldIntegrity )
	{
		return false;
	}
	else if ( CurrentFireMode == ALTFIRE_FIREMODE &&
				WeldTarget.WeldIntegrity <= 0 )
	{
		return false;
	}
	return true;
}

/** Ammo regen timer */
function RechargeAmmo()
{
	if ( AmmoCount[0] < MagazineCapacity[0] )
	{
		AmmoCount[0]++;

		// If we are holding down the mouse when we regen enough ammo, fire again
		if ( AmmoCount[0] == AmmoCost )
		{
		 	Refire();
			if ( !Instigator.IsLocallyControlled() )
			{
				ClientRefire();
			}
		}
	}
	else
	{
	 	ClearTimer(nameof(RechargeAmmo));
	}
}

/**	If we are holding down the mouse when we regen enough ammo, fire again */
simulated function Refire()
{
	local byte i;
    // if either of the fire modes are pending, perform them
	for( i=0; i<=ALTFIRE_FIREMODE; i++ )
	{
		if( PendingFire(i) )
		{
			SendToFiringState(i);
			break;
		}
	}
}

/** RechargeAmmo is called on authority only. When we have enough ammo to fire again
*	we want to make sure that the client plays his animations and fire effects */
reliable client function ClientRefire()
{
 	Refire();
}

/** @see KFWeapon::ConsumeAmmo */
simulated function ConsumeAmmo( byte FireModeNum )
{
	if ( Role == ROLE_Authority )
	{
		// Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
		if (MagazineCapacity[0] > 0 && AmmoCount[0] > 0)
		{
			AmmoCount[0] = Max(AmmoCount[0] - AmmoCost, 0);
		}
	}
}

/** If we recieve a valid door target after the fire key was already pressed down */
simulated function CheckDelayedStartFire()
{
	local bool bNotifyServer;

	if ( WeldTarget != None )
	{
		if( PendingFire(DEFAULT_FIREMODE) )
		{
			BeginFire(DEFAULT_FIREMODE);
			bNotifyServer = true;
		}
		else if( PendingFire(ALTFIRE_FIREMODE) )
		{
			BeginFire(ALTFIRE_FIREMODE);
			bNotifyServer = true;
		}

		if ( bNotifyServer && Role < ROLE_Authority )
		{
			ServerSetWeldTarget(WeldTarget, true);
		}
	}
}

/*********************************************************************************************
 @name Animation
********************************************************************************************* */

/*********************************************************************************************
 @name WeldTarget
********************************************************************************************* */

/**
 * Find doors within welding range
 * Network: Local Player
 */
simulated function bool TickWeldTarget()
{
	local KFDoorActor PreviousTarget;

	// prevent state from changing too often (also a optimization)
	if ( (WorldInfo.TimeSeconds - LastTraceHitTime) < 0.2f )
	{
		return false;
	}

	PreviousTarget = WeldTarget;
	WeldTarget = TraceDoorActors();

	// refresh idle anim if TargetDoor has changed
	if ( PreviousTarget != WeldTarget )
	{
		return PlayReadyTransition(PreviousTarget);
	}

	return false;
}

simulated function KFDoorActor TraceDoorActors()
{
	local KFDoorActor Door;
	local vector HitLoc, HitNorm, StartTrace, EndTrace, AdjustedAim;

	// define range to use for CalcWeaponFire()
	StartTrace = Instigator.GetWeaponStartTraceLocation();
	AdjustedAim = vector(GetAdjustedAim(StartTrace));
	EndTrace = StartTrace + AdjustedAim * WeldingRange;

	// Give the welder extra range when it has a WeldTarget to avoid the ready animation 
	// activating / deactivating on door that is is currently being damaged 
	if( WeldTarget != none )
	{
		EndTrace += AdjustedAim * ExtraWeldingRange;
	}

	// find door actor
	foreach GetTraceOwner().TraceActors(class'KFDoorActor', Door, HitLoc, HitNorm, StartTrace, EndTrace)
	{
		if ( !Door.bIsDestroyed )
		{
			LastTraceHitTime = WorldInfo.TimeSeconds;
			return Door;
		}
	}

	return None;
}

/** Notify server of new WeldTarget for 'HasAmmo' */
reliable server private function ServerSetWeldTarget(KFDoorActor NewTarget, bool bDelayedStart)
{
	WeldTarget = NewTarget;

	if ( bDelayedStart )
	{
		CheckDelayedStartFire();
	}
}

/** Play a transition animation between idle ready states */
simulated function bool PlayReadyTransition(KFDoorActor PreviousTarget)
{
	local name AnimName;
	local float Duration;

	if( WeldTarget != None )
	{
		AnimName = WeldOpenAnim;
		// set timer to begin firing if PendingFire is already set
		if ( PreviousTarget == None )
		{
			Duration = MySkelMesh.GetAnimLength(AnimName);
			SetTimer(FMax(Duration - 0.2f, 0.01f), false, nameof(CheckDelayedStartFire));
		}
	}
	else if( PreviousTarget != None )
	{
		AnimName = WeldCloseAnim;
	}

	if ( AnimName != '' )
	{
		PlayAnimation(AnimName);
		return true;
	}

	return false;
}

/*********************************************************************************************
 * state Inactive
 * This state is the default state.  It needs to make sure Zooming is reset when entering/leaving
 *********************************************************************************************/

auto state Inactive
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		WeldTarget = none;
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
	/** Event called when weapon enters this state */
	simulated event BeginState(Name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
	}

	simulated event Tick(float DeltaTime)
	{
		// Caution - Super will skip our global, but global will skip super's state function!
		Global.Tick(DeltaTime);

		// local player - find nearbydoors
		TickWeldTarget();	// will trace each call, but it's decently fast (zero-extent)
		UpdateScreenUI();
	}

	simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
	{
		local bool bPlayingAnim;

		if ( Instigator != none && Instigator.IsLocallyControlled() )
		{
			// Update target immediately and enable tick (first time)
			bPlayingAnim = TickWeldTarget();

			// if animation didn't play in UpdateWeldTarget, play idle normally
			if ( !bPlayingAnim )
			{
				PlayIdleAnim();
			}
		}
	}

	simulated function PlayIdleAnim()
	{
		local int IdleIndex;

		if ( Instigator != none && Instigator.IsLocallyControlled() )
		{
			if( WeldTarget != None )
			{
				PlayAnimation(IdleWeldAnim, 0.0, true, 0.2);
			}
			else
			{
				IdleIndex = Rand(IdleAnims.Length);
				PlayAnimation(IdleAnims[IdleIndex], 0.0, true, 0.2);
			}
		}
	}
}

/*********************************************************************************************
 * state WeaponWelding
 * This is the default Firing State.  It's performed on both the client and the server.
 *********************************************************************************************/

simulated state WeaponWelding extends WeaponFiring
{
	simulated function byte GetWeaponStateId()
	{
		return WEP_Weld;
	}

	simulated function BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);
		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);
		NotifyEndState();
	}
}

defaultproperties
{
   WeldingRange=100.000000
   FastenRate=68.000000
   UnfastenRate=-110.000000
   ExtraWeldingRange=10.000000
   AmmoCost=7.000000
   AmmoRechargeRate=0.080000
   IdleWeldAnim="Idle_Weld"
   WeldOpenAnim="Weld_On"
   WeldCloseAnim="Weld_Off"
   ScreenUIClass=Class'KFGame.KFGFxWorld_WelderScreen'
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   InventoryGroup=IG_Equipment
   bInfiniteSpareAmmo=True
   bAllowClientAmmoTracking=False
   GroupPriority=5.000000
   UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Welder'
   MagazineCapacity(0)=100
   bLoopingFireAnim(0)=True
   bLoopingFireAnim(1)=True
   bLoopingFireSnd(0)=True
   bLoopingFireSnd(1)=True
   FireTweenTime=0.200000
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Welder.Play_WEP_SA_Welder_Fire_Loop_M',FirstPersonCue=AkEvent'WW_WEP_SA_Welder.Play_WEP_SA_Welder_Fire_Loop_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Welder.Play_WEP_SA_Welder_Fire_Loop_M',FirstPersonCue=AkEvent'WW_WEP_SA_Welder.Play_WEP_SA_Welder_Fire_Loop_S')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Welder.Stop_WEP_SA_Welder_Fire_Loop_M',FirstPersonCue=AkEvent'WW_WEP_SA_Welder.Stop_WEP_SA_Welder_Fire_Loop_S')
   PlayerViewOffset=(X=20.000000,Y=10.000000,Z=-10.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Welder_ARCH.Welder_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Welder:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Welder_ARCH.Wep_Welder_MuzzleFlash'
   FiringStatesArray(0)="WeaponWelding"
   FiringStatesArray(1)="WeaponWelding"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   FireInterval(0)=0.200000
   FireInterval(1)=0.200000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'KFGameContent.KFDT_Bludgeon_Welder'
   bCanThrow=False
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Welder_MESH.Wep_1stP_Welder_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Welder_ANIM.Wep_1st_Welder_Anim'
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
   ItemName="Welder"
   bDropOnDeath=False
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Welder"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
