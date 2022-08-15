//=============================================================================
// KFPlayerInput
//=============================================================================
// Base Player Input class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPlayerInput extends MobilePlayerInput within KFPlayerController
	config(Input)
	native(Controller);

//The player is required to push to talk
var config bool bRequiresPushToTalk;

/** Used to scale the sensitivity of the mouse based on how zoomed the player is. */
var config float ZoomedSensitivityScalar;

/** Set to false if we want to use KF1 style weapon switching */
var config bool bQuickWeaponSelect;

/** Set to true when we have opened the weapon select menu with a controller */
var bool bGamepadWeaponSelectOpen;

/** Start time when player last pressed jump.  Used by CannotJumpNow() */
var transient float PressedJumpTime;

/*********************************************************************************************
 * @name Gamepad Specific Controls
********************************************************************************************* */

/** Set to true if we want to invert the Y on the controller */
var config bool bInvertController;

/** The amount of time the weapon switch button must be held to perform various actions */
var config float GamepadButtonHoldTime;

/** Amount thumbstick should be pressed to activate sprint */
var config float SprintAnalogThreshold;

/** How long has the stick been under the gamepad sprint threshold **/
var config float TimeBelowThresholdToStopSprint;

/** Doing gamepad sprinting that requires the stick to be held most of the way to the side **/
var transient bool bExtendedSprinting;

/** Used to give a short delay for taking the player out of sprint when using a gamepad and sweeping the stick from one side to the other **/
var transient float SprintTimeBelowThreshold;

/** Time when left-thumbstick was pressed in */
var transient float GamepadSprintPressTime;

/*********************************************************************************************
 * @name Aim assists
********************************************************************************************* */

/** Store previous remainder of aTurn for smoothing slow rotations. */
var() float RemainingaTurn;

/** Store previous remainder of aLookUp for smoothing slow rotations. */
var() float RemainingaLookUp;

/** Multiplier used to scale the sensitivity of turning. */
var() config float HorizontalSensitivityScale;

/** Multiplier used to scale the sensitivity of looking up and down. */
var() config float VerticalSensitivityScale;

/** Whether ViewAcceleration is enabled or not **/
var() config bool bViewAccelerationEnabled;

var config protected bool bDebugViewAcceleration;

/** Threshold above when Yaw Acceleration kicks in*/
var() float ViewAccel_YawThreshold;
var() float ViewAccel_DiagonalThreshold;

/** How fast to start accelerating when the stick is slammed to the edge. It goes to a max of 2.0 over time **/
var() private float ViewAccel_CurrMutliplier;

/** How to handle slamming the stick to the edges **/
/** how long you need to hold at edge before the fast acceleration kicks in **/
var() float ViewAccel_TimeToHoldBeforeFastAcceleration;
var private float ViewAccel_TimeHeld;

/** Whether TargetFriction is enabled or not **/
var() config bool bTargetFrictionEnabled;

/** Enables Target Friction debugging **/
var config protected bool bDebugTargetFriction;

/** Whether or not we actually applied friction.  This is used to make certain we don't then accelerate the view **/
var protected bool bAppliedTargetFriction;

/** Last friction target */
var private Pawn LastFrictionTarget;

/** Last friction target acquire time */
var private float LastFrictionTargetTime;

// Friction/Adhesion debugging vars
var private float LastaTurn, LastaLookUp, LastaForward, LastaStrafe;

/** How fast you ramp up to the max speed**/
var() float ViewAccel_RampSpeed;
/** Max turn speed **/
var() float ViewAccel_MaxTurnSpeed;

/** Interp curve that allows for piece wise functions for the TargetFrictionDistance amount at different ranges **/
var() InterpCurveFloat SensitivityScaleCurve;

/** Where we were aiming at the autotargeted pawn was when we first locked on **/
var vector AutoTargetInitialLocation;
/** The current Pawn we're locked onto for auto targeting **/
var Pawn CurrentAutoTarget;

/** How fast to rotate towards autotarget location**/
var() float AutoTargetRotationRate;

/** Interp curve to scale autotarget angle for different ranges **/
var() InterpCurveFloat AutoTargetAngleCurve;

/** Interp curve to scale Friction angle for different ranges **/
var() InterpCurveFloat FrictionAngleCurve;

/** Interp curve to scale Adhesion angle for different ranges **/
var() InterpCurveFloat AdhesionAngleCurve;

/** Used to track when the aim trigger has been pulled/released incrementally **/
var bool bAimTriggerPulled;

/** Force rotation to within this angle when using the ForceLookAtPawn functionality **/
var() float ForceLookAtPawnMinAngle;

/** How fast to rotate towards ForceLookAtPawn location**/
var() float ForceLookAtPawnRotationRate;

/** How fast to rotate towards ForceLookAtPawn location dampened for closer rotation**/
var() float ForceLookAtPawnDampenedRotationRate;

/*********************************************************************************************
 * @name Flashlight / Night vision
********************************************************************************************* */
var const float DoubleTapDelay;

/*********************************************************************************************
 * @name Debugging
********************************************************************************************* */

var float LastLogPerkTime;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Will return the BindName based on the BindCommand
  * Adds check for gamepad bindings which have _Gamepad appended to them  (for the special cases where a bind was modified to work special on the gamepad.)
  */
native function GetKeyBindFromCommand( out KeyBind MyKeyBind, String BindCommand, optional bool bAlt );

/** Swaps two keys in the .ini so that the first one to be read will be identified as the main bind, and the second will be the alt
*	Called in KFKeyBinding */
native function SwapBind( out KeyBind MainKeyBind, out KeyBind AltKeyBind );

/** Sets the given keybinds command, to command */
native function SetKeyBind( out KeyBind MyKeyBind, string Command );

/** Removes this command from KFInput.ini */
native function RemoveCommandFromBind( out KeyBind MyKeyBind, string CommandToRemove );

/** Returns the index that this key bind was found at */
native function int GetBindingsIndex( out KeyBind MyKeyBind );

/** resets the KFInput.ini */
native static function ResetKeysToDefault();

/** Used to display in-game controls */
native function string GetBindDisplayName(out KeyBind MyKeyBind);

/** Used to display in-game controls */
native function string GetGameBindableAction(const out Name Key);

/*********************************************************************************************
* @name	Debugging
********************************************************************************************* */

// Displays the number of loaded objects for a particular class and its size
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
    if (HUD.ShouldDisplayDebug('input'))
	{
		HUD.Canvas.SetDrawColor(0,255,0);
		HUD.Canvas.DrawText("AXIS: ATurn: "$LastaTurn$" aLookUp: "$LastaLookUp);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
		HUD.Canvas.DrawText("Raw: RawJoyLookRight: "$RawJoyLookRight$" RawJoyLookUp: "$RawJoyLookUp);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
		HUD.Canvas.DrawText("Remaining: RemainingaTurn: "$RemainingaTurn$" RemainingaLookUp: "$RemainingaLookUp);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
		HUD.Canvas.DrawText("AXIS: aForward: "$LastaForward$" aStrafe: "$LastaStrafe);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
		HUD.Canvas.DrawText("Raw: RawJoyRight: "$RawJoyRight$" RawJoyUp: "$RawJoyUp);
		out_YPos += out_YL;
		HUD.Canvas.DrawText("Raw: TotalRawStrafe: "$Abs(RawJoyRight) + Abs(RawJoyUp));
		out_YPos += out_YL;
	}

    if (HUD.ShouldDisplayDebug('accel'))
	{
		HUD.Canvas.SetDrawColor(0,255,0);
		HUD.Canvas.DrawText("ACCEL: ViewAccel_CurrMutliplier: "$ViewAccel_CurrMutliplier$" ViewAccel_TimeHeld: "$ViewAccel_TimeHeld);
		out_YPos += out_YL;
		HUD.Canvas.SetPos(4, out_YPos);
	}
}

function ClientInitInputSystem()
{
	Super.ClientInitInputSystem();

	if(bRequiresPushToTalk)
	{
		ClientStopNetworkedVoice();
	}
	else
	{
		ClientStartNetworkedVoice();
	}
}

function UpdatePushToTalk(bool bValue)
{
	if(bValue != bRequiresPushToTalk)
	{
		if(bValue)
		{
			ClientStopNetworkedVoice();
		}
		else
		{
			ClientStartNetworkedVoice();
		}
		bRequiresPushToTalk = bValue;
		SaveConfig();
	}
}


/*********************************************************************************************
* @name	Aiming/Mouse Sensitivity
********************************************************************************************* */

exec function SetSensitivity(Float F)
{
	MouseSensitivity = F;
	SaveConfig();
}

exec function SetZoomedSensitivity(Float F)
{
	ZoomedSensitivityScalar = F;
	SaveConfig();
}

// Overridden to not double apply FOV scaling
event PlayerInput( float DeltaTime )
{
	local float FOVScale, TimeScale;

	// Save Raw values
	RawJoyUp		= aBaseY;
	RawJoyRight		= aStrafe;
	RawJoyLookRight	= aTurn;
	RawJoyLookUp	= aLookUp;

	// PlayerInput shouldn't take timedilation into account
	DeltaTime /= WorldInfo.TimeDilation;
	if (Outer.bDemoOwner && WorldInfo.NetMode == NM_Client)
	{
		DeltaTime /= WorldInfo.DemoPlayTimeDilation;
	}

	PreProcessInput( DeltaTime );

	// Scale to game speed
	TimeScale = 100.f*DeltaTime;
	aBaseY		*= TimeScale * MoveForwardSpeed;
	aStrafe		*= TimeScale * MoveStrafeSpeed;
	aUp			*= TimeScale * MoveStrafeSpeed;
	aTurn		*= TimeScale * LookRightScale;
	aLookUp		*= TimeScale * LookUpScale;

	PostProcessInput( DeltaTime );

	ProcessInputMatching(DeltaTime);

	// Check for Double click movement.
	CatchDoubleClickInput();

	// Take FOV into account (lower FOV == less sensitivity). Only applicable to
	// mouse, Gamepad handled elsewhere
	FOVScale = 1.0;
	AdjustMouseSensitivity(FOVScale);

	// mouse smoothing
	if ( bEnableMouseSmoothing )
	{
		aMouseX = SmoothMouse(aMouseX, DeltaTime,bXAxis,0);
		aMouseY = SmoothMouse(aMouseY, DeltaTime,bYAxis,1);
	}

	aLookUp			*= FOVScale;
	aTurn			*= FOVScale;

	// Turning and strafing share the same axis.
	if( bStrafe > 0 )
		aStrafe		+= aBaseX + aMouseX;
	else
		aTurn		+= aBaseX + aMouseX;

	// Look up/down.
	aLookup += aMouseY;
	if ( (!GetUsingGamePad(Outer) && bInvertMouse) || (bInvertController && GetUsingGamePad(Outer)) )
	{
		aLookup *= -1.f;
	}

	if (bInvertTurn)
	{
		aTurn *= -1.f;
	}

	// Forward/ backward movement
	aForward		+= aBaseY;

	// Handle walking.
	HandleWalking();

	// check for turn locking
	if (bLockTurnUntilRelease)
	{
		if (RawJoyLookRight != 0)
		{
			aTurn = 0.f;
			if (AutoUnlockTurnTime > 0.f)
			{
				AutoUnlockTurnTime -= DeltaTime;
				if (AutoUnlockTurnTime < 0.f)
				{
					bLockTurnUntilRelease = FALSE;
				}
			}
		}
		else
		{
			bLockTurnUntilRelease = FALSE;
		}
	}

    // Add in float remainders from previous turn and look values so that we
    // can get very smooth and very slow movement if we want it
    if( Abs((Aturn%1) + RemainingaTurn) >= 1.0 )
    {
	   aTurn += RemainingaTurn;
	   RemainingaTurn = 0;
	}

    if( Abs((aLookup%1) + RemainingaLookUp) >= 1.0 )
    {
	   aLookup += RemainingaLookUp;
	   RemainingaLookUp = 0;
	}

	// ignore move input
	// Do not clear RawJoy flags, as we still want to be able to read input.
	if( IsMoveInputIgnored() )
	{
		aForward	= 0.f;
		aStrafe		= 0.f;
		aUp			= 0.f;
	}

	// ignore look input
	// Do not clear RawJoy flags, as we still want to be able to read input.
	if( IsLookInputIgnored() )
	{
		aTurn		= 0.f;
		aLookup		= 0.f;
	}

	// Store for debugging
    LastaTurn = aTurn;
    LastaLookUp = aLookup;
    LastaForward = aForward;
    LastaStrafe = aStrafe;

    // Store float remainders for turn and look values so that we
    // can get very smooth and very slow movement if we want it
    if( aTurn != 0 )
    {
        RemainingaTurn += (Aturn%1);
    }
    else
    {
        RemainingaTurn = 0;
    }

    if( aLookup != 0 )
    {
        RemainingaLookUp += (aLookup%1);
    }
    else
    {
        RemainingaLookUp = 0;
    }
}

// Overridden to do custom FOV scaling, especially for weapons with 3d scopes
function AdjustMouseSensitivity(float FOVScale)
{
	local float UsedFOVAngle;
	local bool bUsingSights;

	// Take FOV into account (lower FOV == less sensitivity).
	if ( bEnableFOVScaling )
	{
        if( Pawn != none && Pawn.Weapon != none )
        {
			bUsingSights = Pawn.bIsWalking;
            UsedFOVAngle = Pawn.Weapon.GetModifiedFOVAngle();
        }
        else
        {
            UsedFOVAngle = GetFOVAngle();
        }

		if( UsedFOVAngle != DefaultFOV && bUsingSights )
            FOVScale = UsedFOVAngle * 0.01333 * ZoomedSensitivityScalar; // 0.01333 = 1 / 75.0 - the default FOV
        else
            FOVScale = 1.0;
	}

	Super.AdjustMouseSensitivity(FOVScale);
}

/*********************************************************************************************
* @name	Keybinding helpers
********************************************************************************************* */

/** Sets and stores a new key binding */
function BindKey(KeyBind NewKeyBind, string BindCommand, bool bIsAlt)
{
	local KeyBind CurrentKeyBind;

	// Set CurrentKeyBind to the first (bIsAlt = false) or second (bIsAlt = true)
	// key bound to a command (commands can never be bound to > 2 keys)
	GetKeyBindFromCommand(CurrentKeyBind, BindCommand, bIsAlt);

	// Clear the previous key bound to this command.  Ensures no more than 2 key binds
	if (CurrentKeyBind.Name != 'None')
	{
        // Set the first or second Key bound to a command and set it to none
		RemoveCommandFromBind(CurrentKeyBind, BindCommand);

		if (NewKeyBind.Name == 'Delete')
	   	{
	   		return;
	   	}
	}

	// Set new key binding to a command.  If no matching key is found creates a new array entry
	SetKeyBind(NewKeyBind, BindCommand);

	// if the main key is higher than the alternate key in Game.ini swap there positions
	SwapPositions(NewKeyBind, BindCommand, bIsAlt);
}


/** Swaps key binding locations of two buttons in KFGame.ini */
function SwapPositions(KeyBind MyKeyBind, string BindCommand, bool bIsAlt)
{
	local KeyBind NewKeyBind;
	//	Get the first item in the ini and set it to NewKeyBind
	GetKeyBindFromCommand(NewKeyBind, BindCommand, false);

	// If we are setting the alternate, and the current binding is the first found binding, swap
	if ( bIsAlt && MyKeyBind.Name == NewKeyBind.Name )
	{
		GetKeyBindFromCommand(NewKeyBind, BindCommand, true);
		SwapBind(MyKeyBind, NewKeyBind);
	}
	// If we are setting the main, and the current binding is not the first binding found, swap
	else if ( !bIsAlt && MyKeyBind.Name != NewKeyBind.Name )
	{
		SwapBind(MyKeyBind, NewKeyBind);
	}
}

static function bool GetUsingGamePad(PlayerController PC)
{
    if ( PC == none || PC.PlayerInput == none )
	{
		return false;
	}
    return PC.PlayerInput.bUsingGamepad;
}

/*********************************************************************************************
* @name	Gamepad sprinting
********************************************************************************************* */

exec function GamepadSprint()
{
	bRun = 0;
	bExtendedSprinting = false;
	GamepadSprintPressTime = WorldInfo.TimeSeconds;

	GamepadSprintTimer();
	if ( bRun == 0 )
	{
		SetTimer(0.05, true, nameof(GamepadSprintTimer), self);
	}
}

/** Keep checking if thumbstick has exceeded sprint threshold */
function GamepadSprintTimer()
{
	if ( IsDirectingJoyStick(0.3) )
	{
		bRun = 1;
		ClearTimer(nameof(GamepadSprintTimer), self);
	}
}

/** On release: Crouch or switch to 'ExtendedSprint' */
exec function GamepadSprintRelease()
{
	if( IsDirectingJoyStick(0.3) )
	{
		// end sprint; begin extended (non-pressed) sprint
		bExtendedSprinting = true;
		SprintTimeBelowThreshold = 0;
	}
	else if ( bRun == 0 && (WorldInfo.TimeSeconds - GamepadSprintPressTime) < GamepadButtonHoldTime )
	{
		ToggleCrouch();
	}

	bRun = 0;
	ClearTimer(nameof(GamepadSprintTimer), self);
}

/*********************************************************************************************
* @name	Crouch/Duck
********************************************************************************************* */

/** Abort/Cancel crouch when jumping */
exec function Jump()
{
	bDuck = 0;
	PressedJumpTime = WorldInfo.TimeSeconds;
	Super.Jump();
}

/** GBA_CrouchHold */
exec function StartCrouch()
{
	if (Pawn != none && Pawn.bCanCrouch)
	{
		bDuck = 1;
	}
}

/** GBA_CrouchHold */
exec function StopCrouch()
{
	if( bDuck == 1 )
	{
		bDuck = 0;
	}
}

/** GBA_CrouchToggle */
exec function ToggleCrouch()
{
	if (Pawn != none && Pawn.bCanCrouch)
	{
		bDuck = (bDuck == 0) ? 1 : 0;
	}
}

/** GBA_GamepadCrouch
 * Tap: Toggle crouch
 * Hold: Hold crouch
 */
exec function GamepadCrouch()
{
	ToggleCrouch();

	if ( bDuck == 1 )
	{
		SetTimer(GamepadButtonHoldTime, false, nameof(GamepadCrouchTimer), self);
	}
}

/** Handle hold functionality for GBA_GamepadCrouch */
exec function GamepadCrouchRelease()
{
	local bool bWasButtonHeld;

	bWasButtonHeld = !IsTimerActive(nameof(GamepadCrouchTimer), self);
	if ( bWasButtonHeld )
	{
		StopCrouch();
	}
}

/** empty function for timer */
function GamepadCrouchTimer();

/*********************************************************************************************
* @name	Ironsights
********************************************************************************************* */

/** GBA_IronsightsToggle, GBA_IronsightsHold
 * @params bHoldButtonMode	If true, use hold mode instead of toggle
 */
simulated exec function IronSights(optional bool bHoldButtonMode)
{
	local KFWeapon KFW;

	if( Pawn != none )
	{
		KFW = KFWeapon(Pawn.Weapon);
		if ( KFW != None )
		{
			KFW.SetIronSights((bHoldButtonMode) ? true : !KFW.bUsingSights);
		}
	}
}

/** GBA_IronsightsToggle, GBA_IronsightsHold
 * @params bHoldButtonMode	If true, use hold mode instead of toggle
 */
simulated exec function IronSightsRelease(optional bool bHoldButtonMode)
{
	local KFWeapon KFW;

	if( Pawn != none )
	{
		KFW = KFWeapon(Pawn.Weapon);
		if ( KFW != None )
		{
			// For weapons that override ironsights (e.g. melee) we always
			// need to register a button release
			if ( !KFW.bHasIronSights || bHoldButtonMode )
			{
				KFW.SetIronSights(false);
			}
		}
	}
}

/*********************************************************************************************
* @name	Flashlight
********************************************************************************************* */

/**
 * Button toggles the weapons flashlight on and off
 */
simulated exec function ToggleFlashlight()
{
	local KFPawn_Human KFP;
	local bool bPerkHasNightVision;

	if( Pawn == none || Pawn.InvManager == none || bGamepadWeaponSelectOpen )
	{
	 	return;
	}

	bPerkHasNightVision = GetPerk().HasNightVision();

	KFP = KFPawn_Human(Pawn);
	if( KFP != None && KFP.MyKFWeapon != None )
	{
			if( bPerkHasNightVision )
			{
				ToggleNightVision( KFP );
				return;
			}
			
			ToggleActualFlashLight( KFP );
	}

	if( KFP != none )
	{
		PlayFlashlightNVSounds( KFP, bPerkHasNightVision );
	}
}

simulated function ToggleNightVIsion( KFPawn_Human KFP )
{
	if( !bNightVisionActive && !KFP.bFlashlightOn )
	{
		if( IsTimerActive( nameOf(NightVisionTimer), self ) )
		{
			ClearTimer( nameOf(NightVisionTimer), self );				
			ToggleActualFlashLight( KFP );
		}
		else
		{				
			SetTimer( DoubleTapDelay, false, nameOf(NightVisionTimer), self );
		}
	}
	else if( bNightVisionActive )
	{
		if( IsTimerActive( nameOf(NightVisionTimer), self ) )
		{
			ClearTimer( nameOf(NightVisionTimer),self );
			SetNightVision( !bNightVisionActive );
			ToggleActualFlashLight( KFP );
		}
		else
		{
			SetTimer( DoubleTapDelay, false, nameOf(NightVisionTimer), self );
		}
	}
	else if( KFP.bFlashlightOn )
	{
		ToggleActualFlashLight( KFP );
	}
}

/**
 * @brief Toggles the flashligh on ort off
 * 
 * @param KFP Our pawn
 */
simulated function ToggleActualFlashLight( KFPawn_Human KFP )
{
	// toggle flashlight
	KFP.MyKFWeapon.bHasFlashlight ? KFP.ToggleFlashlight() : KFInventoryManager(Pawn.InvManager).SwitchToPrimaryFlashLightWeapon();
}

/**
 * @brief Toggles the night vision on or off
 * 
 * @param KFP Our pawn
 */
simulated function NightVisionTimer()
{
	SetNightVision( !bNightVisionActive );	
}

/**
 * @brief Plays flashlight/night vision related sounds
 * @details Moved this out of ToggleFlashlight()
 * 
 * @param KFP Player's pawn
 * @param bPerkHasNightVision Perk has nigh vision or not
 */
simulated function PlayFlashlightNVSounds( KFPawn_Human KFP, bool bPerkHasNightVision )
{
	if( bPerkHasNightVision && !KFP.bFlashlightOn )
	{
		bNightVisionActive ? KFP.PlaySoundBase( NightVisionOnEvent ) : KFP.PlaySoundBase( NightVisionOffEvent );
	}
	else
	{
		KFP.bFlashlightOn ? KFP.PlaySoundBase( FlashlightOnEvent ) : KFP.PlaySoundBase( FlashlightOffEvent );
	}
}

/** 
 * @brief Empty function used for as timer check (night vision double tap to flashlight)
 */
simulated function NighVisionTapDelayTimer();

/*********************************************************************************************
* @name	Special weapon firemodes
********************************************************************************************* */

/** (V/L1) special melee attack for all weapon types */
exec function StartTertiaryFire()
{
	if ( Pawn != None )
	{
		Pawn.StartFire(3);
	}
}

/** (V/L1) special melee attack for all weapon types */
exec function StopTertiaryFire()
{
	if ( Pawn != None )
	{
		Pawn.StopFire(3);
	}
}

/** GBA_Reload */
exec function Reload()
{
	if ( Pawn != None )
	{
		Pawn.StartFire(2);
	}
}

/** GBA_Reload */
exec function ReloadRelease()
{
	if ( Pawn != None )
	{
		Pawn.StopFire(2);
	}
}

/** GBA_Grenade */
exec function Grenade()
{
	if ( Pawn != None )
	{
		Pawn.StartFire(4);
	}
}

/** GBA_Grenade */
exec function GrenadeRelease()
{
	if ( Pawn != None )
	{
		Pawn.StopFire(4);
	}
}

/** GBA_SwitchAltFire */
exec function SwitchFire()
{
	local KFWeapon KFW;

	if( Pawn != none )
	{
		KFW = KFWeapon(Pawn.Weapon);
		if ( KFW != None )
		{
			KFW.AltFireMode();
		}
	}
}

/** GBA_SwitchAltFire
 * Weapons that override AltFireMode (e.g. welder) and call StartFire
 * also need to call StopFire.  For most weapons this is unnecessary.
 */
exec function SwitchFireRelease()
{
	local KFWeapon KFW;

	if( Pawn != none )
	{
		KFW = KFWeapon(Pawn.Weapon);
		if ( KFW != None )
		{
			KFW.AltFireModeRelease();
		}
	}
}

/*********************************************************************************************
* @name	Weapon Select
********************************************************************************************* */

/** Equips the next weapon in the inventory chain */
exec function SelectNextWeapon()
{
	local KFInventoryManager KFIM;
	local KFWeapon KFW;

	if (Pawn != none)
	{
    	// Don't switch weapons if the current weapon prevents it
        KFW = KFWeapon(Pawn.Weapon);
    	if ( KFW != None && !KFW.CanSwitchWeapons())
    	{
    		return;
    	}

		KFIM = KFInventoryManager(Pawn.InvManager);
		if (bQuickWeaponSelect)
		{
			NextWeapon();
		}
		else
		{
			KFIM.HighlightNextWeapon();
		}
		KFIM.ShowAllHUDGroups();
	}
}

/** Equips the previous weapon in the inventory chain */
exec function SelectPrevWeapon()
{
	local KFInventoryManager KFIM;
	local KFWeapon KFW;

	if( Pawn != none )
	{
    	// Don't switch weapons if the current weapon prevents it
        KFW = KFWeapon(Pawn.Weapon);
    	if ( KFW != None && !KFW.CanSwitchWeapons())
    	{
    		return;
    	}

		KFIM = KFInventoryManager( Pawn.InvManager );
		if ( bQuickWeaponSelect )
		{
			PrevWeapon();
		}
		else
		{
			KFIM.HighlightPrevWeapon();
		}
		KFIM.ShowAllHUDGroups();
	}
}

/** Weapon select button for controllers
 * Tap: Equip last weapon
 * Hold: Open gamepad weapon select UI
 */
exec function GamepadWeaponSelect()
{
	local KFWeapon KFW;

	if (Pawn != none)
	{
    	// Don't switch weapons if the current weapon prevents it
        KFW = KFWeapon(Pawn.Weapon);
    	if ( KFW != None && !KFW.CanSwitchWeapons())
    	{
    		return;
    	}

		SetTimer(GamepadButtonHoldTime, false, nameof(GamepadWeaponMenuTimer), self);
	}
}

/** Weapon select button for controllers
 * Tap: Equip last weapon
 * Hold: Open gamepad weapon select UI
 */
exec function ReleaseGamepadWeaponSelect()
{
	local KFInventoryManager KFIM;
	local KFWeapon KFW;

	// close menu
	if ( bGamepadWeaponSelectOpen )
	{
		MyGFxHUD.WeaponSelectWidget.SetWeaponSwitchStayOpen(false);
		bGamepadWeaponSelectOpen = false;
	}

	if (Pawn != none)
	{
    	// Don't switch weapons if the current weapon prevents it
        KFW = KFWeapon(Pawn.Weapon);
    	if ( KFW == None || KFW.CanSwitchWeapons())
		{
		    // On button tap, cycle weapons
		    if (IsTimerActive(nameof(GamepadWeaponMenuTimer), self))
		    {
			    NextWeapon();
			    ClearTimer(nameof(GamepadWeaponMenuTimer), self);
		    }
		    // Switch to selected weapon
		    else
		    {
			    KFIM = KFInventoryManager(Pawn.InvManager);
			    KFIM.SetCurrentWeapon(KFIM.PendingWeapon);
		    }
		}
	}
}

/** Called when 'GamepadWeaponSelect' is held down */
function GamepadWeaponMenuTimer()
{
	local KFWeapon KFW;

	if( MyGFxHUD != none && MyGFxHUD.VoiceCommsWidget != none && MyGFxHUD.VoiceCommsWidget.bActive )
	{
		return;
	}
	if (Pawn != none && bUsingGamepad)
	{
    	// Don't switch weapons if the current weapon prevents it
        KFW = KFWeapon(Pawn.Weapon);
    	if ( KFW != None && !KFW.CanSwitchWeapons())
    	{
    	   return;
    	}

		bGamepadWeaponSelectOpen = true;
		MyGFxHUD.WeaponSelectWidget.SetWeaponSwitchStayOpen(true);
		KFInventoryManager(Pawn.InvManager).HighlightWeapon(Pawn.Weapon);
	}
}

/** Switch to a specific weapon/weapon group
 * Keyboard: 1-4
 * Gamepad: dpad
 */
exec function SwitchWeaponGroup( byte GroupID )
{
	local KFInventoryManager KFIM;
	local KFWeapon NextGroupedWeapon;
	local KFWeapon KFW;

	if ( Pawn == none || Pawn.InvManager == none )
	{
	 	return;
	}

	// Don't switch weapons if the current weapon prevents it
    KFW = KFWeapon(Pawn.Weapon);
	if ( KFW != None && !KFW.CanSwitchWeapons())
	{
		return;
	}

	if( MyGFxHUD != none && MyGFxHUD.VoiceCommsWidget != none && MyGFxHUD.VoiceCommsWidget.bActive )
	{
		return;
	}

	KFIM = KFInventoryManager(Pawn.InvManager);

	if ( KFIM != none )
	{
		NextGroupedWeapon = KFIM.GetNextGroupedWeapon(GroupID);
		if (bUsingGamepad)
		{
			if (bGamepadWeaponSelectOpen)
			{
				KFIM.HighlightWeapon(NextGroupedWeapon);
			}
		}
		else
		{
            KFIM.SetCurrentWeapon( NextGroupedWeapon );
		}

		KFIM.ShowOnlyHUDGroup(GroupID);
	}
}

/*********************************************************************************************
* @name	Misc Gameplay
********************************************************************************************* */

/** Quick heal key was pressed */
exec function QuickHeal()
{
	local KFWeapon KFW;

	if( Pawn == none )
	{
		return;
	}

	// Don't quick heal if the current weapon prevents it
    KFW = KFWeapon(Pawn.Weapon);
	if ( KFW != None && !KFW.CanSwitchWeapons())
	{
		return;
	}

	KFInventoryManager(Pawn.InvManager).AttemptQuickHeal();
}

/** Throw some of this player's dosh */
exec function TossMoney()
{
	local KFInventoryManager KFIM;

	if( Pawn != none && Pawn.InvManager != none )
	{
		KFIM = KFInventoryManager(Pawn.InvManager);
		if ( KFIM != none )
		{
			KFIM.ThrowMoney();
		}
	}
}

/*********************************************************************************************
* @name	Gamepad d-pad bindings
********************************************************************************************* */

/** Implementation for pressing/holding D-pad left
  * TAP: perform quick heal / select weapon group (if weapon select UI is active) / Previous player if spectating
  * HOLD:
  */
exec function GamepadDpadLeft()
{
	if(Outer.IsSpectating())
	{
		Outer.ServerViewPrevPlayer();
	}
	else if( bGamepadWeaponSelectOpen )
	{
		SwitchWeaponGroup( 0 );
	}
	else
	{
		ToggleFlashlight();
	}
}

/** Implementation for pressing/holding D-pad down
  * TAP: switch fire modes / select weapon group (if weapon select UI is active) / next camera type if spectating
  * HOLD:
  */
exec function GamepadDpadDown()
{
	if(Outer.IsSpectating())
	{
		Outer.ServerNextSpectateMode();
	}
	else if( bGamepadWeaponSelectOpen )
	{
		SwitchWeaponGroup( 2 );
	}
	else
	{
		QuickHeal();
	}
}

/** Implementation for pressing/holding D-pad right
  * TAP: toggle flashlight / select weapon group (if weapon select UI is active) / Next player if spectating
  * HOLD:
  */
exec function GamepadDpadRight()
{
	if(Outer.IsSpectating())
	{
		Outer.ServerViewNextPlayer();
	}
	else if( bGamepadWeaponSelectOpen )
	{
		SwitchWeaponGroup( 1 );
	}
	else
	{
		ShowVoiceComms();
	}
}

exec function GamepadDpadRightRelease()
{
	if( !bGamepadWeaponSelectOpen )
	{
		HideVoiceComms();
	}
}

exec function ShowVoiceComms()
{
	if(MyGFxHUD != none && MyGFxHUD.VoiceCommsWidget != none)
	{
		MyGFxHUD.ShowVoiceComms(true);
	}
}

exec function HideVoiceComms()
{
	if(MyGFxHUD != none && MyGFxHUD.VoiceCommsWidget != none)
	{
		SetCinematicMode(false, false, false, false, true, false);
		MyGFxHUD.ShowVoiceComms(false);
	}
}

/** Implementation for pressing/holding D-pad up
  * TAP: throw dosh / select weapon group (if weapon select UI is active)
  * HOLD: throw weapon
  */
exec function GamepadDpadUp()
{
	if( bGamepadWeaponSelectOpen )
	{
		SwitchWeaponGroup( 3 );
	}
	else
	{
		SetTimer( GamepadButtonHoldTime, false, nameof(GamepadDpadUpTimer), self );
	}
}

/** Throw dosh if button was tapped */
exec function GamepadDpadUpRelease()
{
	local bool bButtonWasHeld;

	if( !bGamepadWeaponSelectOpen )
	{
		bButtonWasHeld = !IsTimerActive( nameof(GamepadDpadUpTimer), self );
		if( !bButtonWasHeld )
		{
			TossMoney();
			ClearTimer( nameof(GamepadDpadUpTimer), self );
		}
	}
}

/** Throw weapon if button was held */
function GamepadDpadUpTimer()
{
	ThrowWeapon();
}

exec function OnVoteYesPressed()
{
	//Let the hud know
	if(MyGFxHUD != none && MyGFxHUD.KickVoteWidget != none)
	{
		MyGFxHUD.KickVoteWidget.OnYesPressed();
	}
}

/** Throw dosh if button was tapped */
exec function OnVoteYesRelease()
{
	//let the HUD know
	if(MyGFxHUD != none && MyGFxHUD.KickVoteWidget != none)
	{
		MyGFxHUD.KickVoteWidget.OnYesReleased();
	}
}

exec function OnVoteNoPressed()
{
	//Let the hud know
	if(MyGFxHUD != none && MyGFxHUD.KickVoteWidget != none)
	{
		MyGFxHUD.KickVoteWidget.OnNoPressed();
	}
}

/** Throw dosh if button was tapped */
exec function OnVoteNoRelease()
{
	//let the HUD know
	if(MyGFxHUD != none && MyGFxHUD.KickVoteWidget != none)
	{
		MyGFxHUD.KickVoteWidget.OnNoReleased();
	}
}

//This takes is called in PlayerController::Use() place now.
exec function Interact()
{
	SetTimer( GamepadButtonHoldTime, false, nameof(InteractTimer), self );
}

//This takes is called in PlayerController::Use() place now.
exec function InteractRelease()
{
	local bool bButtonWasHeld;

	bButtonWasHeld = !IsTimerActive( nameof(InteractTimer), self );
	if( !bButtonWasHeld )
	{
		Outer.Use();
		ClearTimer( nameof(InteractTimer), self );
	}
}

exec function InteractTimer()
{
	local KFInventoryManager KFIM;

	KFIM = KFInventoryManager(Pawn.InvManager);
	if( KFIM != none )
	{
		KFIM.QuickWeld();
	}
}

/*********************************************************************************************
* @name	VOIP
********************************************************************************************* */

exec function StartVoiceChat()
{
	if(bRequiresPushToTalk)
	{
		ClearTimer('ClientStopNetworkedVoice');
		ClientStartNetworkedVoice();
	}
}

exec function StopVoiceChat()
{
	if(bRequiresPushToTalk)
	{
		SetTimer(0.25, false, 'ClientStopNetworkedVoice');
	}
}

/*********************************************************************************************
 * @name Aim assists
********************************************************************************************* */

simulated event PostBeginPlay()
{
    ViewAccel_CurrMutliplier = 1.0;
}

/**
 * Overridden to add hooks for view acceleration, target friction, auto centering, controller sensitivity.
 */
function PreProcessInput( float DeltaTime )
{
	local KFWeapon KFW;
	local float FOVScale;

	Super.PreProcessInput(DeltaTime);
	//`log( " RawJoyUp: " $ RawJoyUp $ " RawJoyRight: " $ RawJoyRight );

	if( Pawn == none )
	{
		return;
	}

	//`log( "bUsingGamepad: " $ bUsingGamepad );
	// whenever a player uses a non Gamepad for input the input for that frame is set to:  bUsingGamepad=false  so we do not even attempt
	// to do any input help
	if (!bUsingGamepad)
	{
		return;
	}

	if( Pawn == none || Pawn.Weapon == none )
	{
		return;
	}

	KFW = KFWeapon(Pawn.Weapon);

	// Autotarget if the trigger has been pulled, even if its only be slightly released
    if( !bAimTriggerPulled && aLeftAnalogTrigger > 0.99 )
	{
        bAimTriggerPulled = true;
        NewAutoTarget();
	}
	else if( bAimTriggerPulled && aLeftAnalogTrigger <= 0.9 )
    {
        bAimTriggerPulled = false;
    }

    if( KFW.ShouldOwnerWalk() )
    {
        bRun = 0;
        bExtendedSprinting = false;
    }
	else if( bExtendedSprinting )
    {
		// Handle sprinting with joysticks and clicks
		UpdateExtendedSprint( DeltaTime );
    }

	// Accelerate turning rate if we did not apply friction
	// we have a "slowdown" acceleration so we need to do that first
	if( bViewAccelerationEnabled )
	{
		ApplyViewAcceleration( DeltaTime );
	}

	if( bTargetFrictionEnabled )
	{
		if( KFW != none )
		{
			bAppliedTargetFriction = FALSE; // clear the friction flag (we do it here so applyViewAcceleration has a chance to use it from the time before)
			ApplyTargetFriction( DeltaTime, KFW );
		}
	}

	// Apply FOV zoomed/iron sight sensitivity scaling
    FOVScale = GetFOVAdjustedControllerSensitivity();

	aTurn *= FOVScale;
	aLookUp *= FOVScale;

	// Globally scale the turning and up/down sensitivity
    aTurn *= HorizontalSensitivityScale;
	aLookUp *= VerticalSensitivityScale;

	// This will apply the sensitivity scaling to the controller inputs based on a curve
	// NOTE:  once we have this we may not want to apply if we bAppliedTargetFriction
	aTurn *= EvalInterpCurveFloat(SensitivityScaleCurve, Abs(RawJoyLookRight));
	aLookUp *= EvalInterpCurveFloat(SensitivityScaleCurve, Abs(RawJoyLookUp));

	//`log( "aTurn: " $ aTurn $ " aLookUp: " $ aLookUp $ " DeltaTime: " $ DeltaTime );
}

/** Called from PreProcessInput when bExtendedSprinting=TRUE */
function UpdateExtendedSprint( float DeltaTime )
{
    // If we've clicked the sprint button, and have the stick pressed
    // most of the way to the side, keep sprinting
    if( IsDirectingJoyStick(SprintAnalogThreshold) )
    {
        bRun = 1;
        SprintTimeBelowThreshold = 0;
    }
    else if( bRun > 0 )
    {
        // Give the player a chance to sweep the stick from one side
        // to the other and keep sprinting. Use a short threshold to
        // determine its not a sweep, and they actually want to stop
        if( SprintTimeBelowThreshold > TimeBelowThresholdToStopSprint )
        {
            bRun = 0;
            bExtendedSprinting = false;
        }
        else
        {
            SprintTimeBelowThreshold += DeltaTime;
        }
    }
    else
    {
        bExtendedSprinting = false;
    }
}

/** Returns true if we are pressing the joystick in a direction */
function bool IsDirectingJoyStick(float Threshold)
{
    if( (Abs(RawJoyUp) + Abs(RawJoyRight)) > Threshold )
    {
    	return true;
    }
    return false;
}

/**
 * This will scale the player's rotation speed depending on the location of their thumbstick and how
 * long they have held it there.
 **/
function ApplyViewAcceleration( float DeltaTime )
{
	//`log( "ahh: " $ square(Abs(RawJoyLookRight)) + square(Abs(RawJoyLookUp/0.75)) $ " RawJoyLookRight: " $ RawJoyLookRight $ " RawJoyLookUp: " $ RawJoyLookUp );

    // If above threshold, accelerate Yaw turning rate (e.g. when you slam the thumbstick to the farthest position)
	if( ( Abs(aTurn) > ViewAccel_YawThreshold ) ||  ( ( square(Abs(RawJoyLookRight) + square(Abs(RawJoyLookUp/0.75))) ) > ViewAccel_DiagonalThreshold )
		)
	{
		 // if we are not targeting someone.  (i.e. in the heat of battle of circle straffing you want to be JAMMED to the edge as you are spazzing out.  but are targeting and fighting so you don't want to flip around all speedy )
		if( ( ViewAccel_TimeHeld > ViewAccel_TimeToHoldBeforeFastAcceleration )
			&& ( !bAppliedTargetFriction )
			)
		{
			ViewAccel_CurrMutliplier += ( ViewAccel_RampSpeed ) ;
			aTurn *= FMin( ViewAccel_CurrMutliplier, ViewAccel_MaxTurnSpeed );  // we need to always be at least a 1.0f here or we will go slower and hitch
		}
		else
		{
			ViewAccel_CurrMutliplier = Abs(aTurn);
			ViewAccel_TimeHeld += DeltaTime;
		}
	}
	// we are doing a non slam to the edge movement
	else
	{
		// reset
		ViewAccel_CurrMutliplier = 1.0;
		ViewAccel_TimeHeld = 0;
	}
}

/**
 * Begin an AutoTargeting adhesion cycle
 * TODO: This is pretty messy - clean it up - Ramm
 **/
function InitAutoTarget()
{
    local Vector	CamLoc;
	local Rotator	CamRot;
	local Vector	X, Y, Z;
	local float     UsedTargetAngle;

	// No autotargeting without a gamepad!
    if (!bUsingGamepad)
	{
		return;
	}

	// Get camera location/rotation
	GetPlayerViewPoint( CamLoc, CamRot );
	GetAxes( CamRot, X, Y, Z );

	// look for a new target
	CurrentAutoTarget = GetTargetAdhesionFrictionTarget( 50000.0/*W.TargetAdhesionDistanceMax*/, CamLoc, CamRot, AutoTargetAngleCurve );

    AutoTargetInitialLocation = GetAutoTargetLocation(CurrentAutoTarget, CamLoc);

	if( bDebugAutoTarget )
	{
	   FlushPersistentDebugLines();

	   UsedTargetAngle = EvalInterpCurveFloat(AutoTargetAngleCurve, VSize(CamLoc - AutoTargetInitialLocation));

       DrawDebugCone(CamLoc + X * 5,X,500.0, Acos(UsedTargetAngle), Acos(UsedTargetAngle),16,MakeColor(255,0,0,255),true);
       DrawDebugCone(CamLoc + X * 5,X,250.0, Acos(AutoTargetAngleCurve.Points[0].OutVal), Acos(AutoTargetAngleCurve.Points[0].OutVal),16,MakeColor(0,255,0,255),true);
       DrawDebugCone(CamLoc + X * 5,X,1000.0, Acos(AutoTargetAngleCurve.Points[AutoTargetAngleCurve.Points.Length - 1].OutVal), Acos(AutoTargetAngleCurve.Points[AutoTargetAngleCurve.Points.Length - 1].OutVal),16,MakeColor(255,255,0,255),true);
	}
}

/**
 * Returns the best location for auto targeting a pawn
 */
function vector GetAutoTargetLocation(Pawn CheckTarget, vector CamLoc)
{
    local KFWeapon KFW;

    if( CheckTarget == none )
    {
        return vect(0,0,0);
    }

    // Get the location from the pawn we're targeting if we can
    if( KFPawn(CheckTarget) != none )
    {
        return KFPawn(CheckTarget).GetAutoTargetLocation(CamLoc, Pawn);
    }

    KFW = KFWeapon(Pawn.Weapon);

    //`log("Autotarget - found nothing - returning location");
    if( KFW != None )
    {
        return CheckTarget.Location + KFW.TargetFrictionOffset;
    }
    else
    {
        // Slightly above center
        return CheckTarget.Location + (vect(0,0,32.0));
    }
}

/**
 * This will attempt to auto aim at the target.  It will forcibly aim the player at the target.
 *
 **/
function ApplyAutoTarget( float DeltaTime, KFWeapon W, out int out_YawRot, out int out_PitchRot )
{
	local Vector	RealTargetLoc, CamToTarget, CamLoc;
	local Vector	X, Y, Z;
	local Rotator	CamRot, DeltaRot, CamRotWithFreeAim;
	local float		DistToTarget, AdhesionAmtY, AdhesionAmtZ, TargetRadius, TargetHeight;
	local int		AdjustY, AdjustZ;
	local float     DotDiffToTarget;
	local float     UsedTargetAngle;

	// No autotargeting without a gamepad!
    if (!bUsingGamepad)
	{
		return;
	}

	if( W == None || CurrentAutoTarget == None )
	{
		return;
	}

	// Setup some initial data
//    CamLoc = CalcViewLocation;
//	CamRot = CalcViewRotation;
	// using this at this point here causes mega hitches to occur.  As the correct values have not been updated yet this early
	GetPlayerViewPoint( CamLoc, CamRot );
	CamRotWithFreeAim = CamRot + WeaponBufferRotation;
	GetAxes( CamRotWithFreeAim, X, Y, Z );

	// If the target is still alive or has its head
	if( CurrentAutoTarget != none && CurrentAutoTarget.Health > 0 &&
        (KFPawn_Monster(CurrentAutoTarget) == none || !KFPawn_Monster(CurrentAutoTarget).bIsHeadless) )
	{
		RealTargetLoc = AutoTargetInitialLocation;

		if( bDebugAutoTarget )
		{
    		// Grab collision info from target
    		CurrentAutoTarget.GetBoundingCylinder( TargetRadius, TargetHeight );

			DrawDebugCylinder(AutoTargetInitialLocation+vect(0,0,5), AutoTargetInitialLocation-vect(0,0,5), 10, 12, 255, 0, 0);
            DrawDebugCylinder(CurrentAutoTarget.Location+vect(0,0,1)*TargetHeight, CurrentAutoTarget.Location-vect(0,0,1)*TargetHeight, TargetRadius, 12, 0, 255, 0);
		}

		// Figure out the angle to the target
        CamToTarget = (RealTargetLoc - CamLoc);
        DotDiffToTarget = Normal(RealTargetLoc - CamLoc) dot Normal(Vector(CamRotWithFreeAim));

		// Figure out the distance from aim to target
 		DistToTarget = VSize(CamToTarget);

    	UsedTargetAngle = EvalInterpCurveFloat(AutoTargetAngleCurve, DistToTarget);

    	if( bDebugAutoTarget )
    	{
            LogInternal(GetFuncName()@"DotDiffToTarget = "$DotDiffToTarget$"  AutoTargetAngle = "$UsedTargetAngle);
    	}

		// Make sure the target is in front of us and close enough
		if( DotDiffToTarget > UsedTargetAngle && DistToTarget <= 50000.0)
		{
			DeltaRot.Yaw	= Rotator(RealTargetLoc - CamLoc).Yaw	- CamRotWithFreeAim.Yaw;
			DeltaRot.Pitch	= Rotator(RealTargetLoc - CamLoc).Pitch	- CamRotWithFreeAim.Pitch;
			DeltaRot = Normalize( DeltaRot );

			// Lateral adhesion
			if(	DeltaRot.Yaw != 0 )
			{
				AdhesionAmtY = AutoTargetRotationRate;

				// Apply the adhesion
				AdjustY = DeltaRot.Yaw * (AdhesionAmtY * DeltaTime);
				out_YawRot += AdjustY;
			}

			// Vertical adhesion
			if( DeltaRot.Pitch != 0 )
			{
				AdhesionAmtZ = AutoTargetRotationRate;

				// Apply the adhesion
				AdjustZ = DeltaRot.Pitch * (AdhesionAmtZ * DeltaTime);
				out_PitchRot += AdjustZ;
			}
		}
	}
}

/**
 * This will forcibly aim the player at the look at pawn target.
 *
 **/
function ApplyForceLookAtPawn( float DeltaTime, out int out_YawRot, out int out_PitchRot )
{
	local Vector	RealTargetLoc,  CamLoc;
	local Vector	X, Y, Z;
	local Rotator	CamRot, DeltaRot, CamRotWithFreeAim;
	local float		AdhesionAmtY, AdhesionAmtZ, TargetRadius, TargetHeight;
	local int		AdjustY, AdjustZ;
	local float     DotDiffToTarget;
	local float     UsedRotationRate;

	if( ForceLookAtPawn == None )
	{
		return;
	}

	// Setup some initial data
	GetPlayerViewPoint( CamLoc, CamRot );
	CamRotWithFreeAim = CamRot + WeaponBufferRotation;
	GetAxes( CamRotWithFreeAim, X, Y, Z );

	// If the target is still alive
	if( ForceLookAtPawn != none && ForceLookAtPawn.Health > 0 )
	{
		RealTargetLoc = GetAutoTargetLocation(ForceLookAtPawn, CamLoc);

		if( bDebugAutoTarget )
		{
    		// Grab collision info from target
    		ForceLookAtPawn.GetBoundingCylinder( TargetRadius, TargetHeight );

			DrawDebugCylinder(RealTargetLoc+vect(0,0,5), RealTargetLoc-vect(0,0,5), 10, 12, 255, 0, 0);
            DrawDebugCylinder(ForceLookAtPawn.Location+vect(0,0,1)*TargetHeight, ForceLookAtPawn.Location-vect(0,0,1)*TargetHeight, TargetRadius, 12, 0, 255, 0);
		}

		// Figure out the angle to the target
        DotDiffToTarget = Normal(RealTargetLoc - CamLoc) dot Normal(Vector(CamRotWithFreeAim));

        // Select the rotation rate, fast if we are far away, slower if we are close to target
    	if( DotDiffToTarget < ForceLookAtPawnMinAngle )
    	{
            UsedRotationRate = ForceLookAtPawnRotationRate;
        }
        else
        {
            UsedRotationRate = ForceLookAtPawnDampenedRotationRate;
        }

        // Rotate toward look at target
		DeltaRot.Yaw	= Rotator(RealTargetLoc - CamLoc).Yaw	- CamRotWithFreeAim.Yaw;
		DeltaRot.Pitch	= Rotator(RealTargetLoc - CamLoc).Pitch	- CamRotWithFreeAim.Pitch;
		DeltaRot = Normalize( DeltaRot );

		// Lateral adhesion
		if(	DeltaRot.Yaw != 0 )
		{
			AdhesionAmtY = UsedRotationRate;

			// Apply the adhesion
			AdjustY = DeltaRot.Yaw * (AdhesionAmtY * DeltaTime);
			out_YawRot += AdjustY;
		}

		// Vertical adhesion
		if( DeltaRot.Pitch != 0 )
		{
			AdhesionAmtZ = UsedRotationRate;

			// Apply the adhesion
			AdjustZ = DeltaRot.Pitch * (AdhesionAmtZ * DeltaTime);
			out_PitchRot += AdjustZ;
		}
	}
}

/**
 * This will attempt to keep the player aiming at the target.  It will forcibly aim the player at the target.
 *
 * TODO:  move this to c++
 **/
function ApplyTargetAdhesion( float DeltaTime, KFWeapon W, out int out_YawRot, out int out_PitchRot )
{
	local Vector	RealTargetLoc, TargetLoc, CamToTarget, AimLoc, CamLoc, ClosestY, ClosestZ;
	local Vector	X, Y, Z;
	local Rotator	CamRot, DeltaRot;
	local float		DistToTarget, DistFromAimZ, DistFromAimY, AdhesionAmtY, AdhesionAmtZ, TargetRadius, TargetHeight, Pct;
	local int		AdjustY, AdjustZ;
	local Pawn	AdhesionTarget;

	// No adhesion without a gamepad!
    if (!bUsingGamepad)
	{
		return;
	}

	if( W == None
		|| !W.bTargetAdhesionEnabled
		)
	{
		return;
	}

	// Setup some initial data
	//Todo, maybe cache the values like UT3 - Ramm
//	CamLoc = CalcViewLocation;
//	CamRot = CalcViewRotation;
	// using this at this point here causes mega hitches to occur.  As the correct values have not been updated yet this early
	//Todo, maybe cache the values like UT3 - Ramm
    GetPlayerViewPoint( CamLoc, CamRot );
	GetAxes( CamRot, X, Y, Z );

	// attempt to use the friction target if available
	AdhesionTarget = LastFrictionTarget;
	if (AdhesionTarget == None || (WorldInfo.TimeSeconds - LastFrictionTargetTime) > W.TargetAdhesionTimeMax)
	{
		// otherwise look for a new target
		AdhesionTarget = GetTargetAdhesionFrictionTarget( W.TargetAdhesionDistanceMax, CamLoc, CamRot, AdhesionAngleCurve );
	}

	// If still within adhesion time constraints, and the target is still alive
	if( AdhesionTarget != None && AdhesionTarget.Health > 0
        && (KFPawn_Monster(AdhesionTarget) == none || !KFPawn_Monster(AdhesionTarget).bIsHeadless))
	{
		// Grab collision info from target
		AdhesionTarget.GetBoundingCylinder( TargetRadius, TargetHeight );

		// reduce the size a bit to allow adhesion to move the crosshair onto the character
		TargetRadius *= 0.65f;
		TargetHeight *= 0.65f;

		RealTargetLoc = AdhesionTarget.Location + (W.TargetFrictionOffset >> CamRot);

		if( bDebugTargetAdhesion )
		{
			DrawDebugCylinder(RealTargetLoc+vect(0,0,1)*TargetHeight, RealTargetLoc-vect(0,0,1)*TargetHeight, TargetRadius, 12, 0, 255, 0);
		}

		// Make sure the target has some velocity
		if( (W.TargetAdhesionTargetVelocityMin == 0.f || VSize(AdhesionTarget.Velocity) > W.TargetAdhesionTargetVelocityMin)
			&& (W.TargetAdhesionPlayerVelocityMin == 0.f || VSize(Pawn.Velocity) > W.TargetAdhesionPlayerVelocityMin)
			&& ((RealTargetLoc - CamLoc) DOT Vector(CamRot) > 0.f) )
		{
			// Figure out the distance from aim to target
			CamToTarget = (RealTargetLoc - CamLoc);
			DistToTarget = VSize(CamToTarget);
			AimLoc = CamLoc + (X * DistToTarget);

			// Calculate the aim friction multiplier
			// Y component
			TargetLoc	 = RealTargetLoc;
			TargetLoc.Z  = AimLoc.Z;
			DistFromAimY = PointDistToLine(AimLoc,(TargetLoc - CamLoc),CamLoc, ClosestY );
			ClosestY = TargetLoc + Normal(ClosestY - TargetLoc) * TargetRadius;

			// Z component
			TargetLoc	 = RealTargetLoc;
			TargetLoc.X  = AimLoc.X;
			TargetLoc.Y  = AimLoc.Y;
			DistFromAimZ = PointDistToLine(AimLoc,(TargetLoc - CamLoc),CamLoc, ClosestZ);
			ClosestZ	 = TargetLoc + Normal(ClosestZ - TargetLoc) * TargetRadius;

			DeltaRot.Yaw	= Rotator(ClosestY - CamLoc).Yaw	- CamRot.Yaw;
			DeltaRot.Pitch	= Rotator(ClosestZ - CamLoc).Pitch	- CamRot.Pitch;
			DeltaRot = Normalize( DeltaRot );

			// Make sure it is still within valid distance AND
			// outside the cylinder in at least one direction AND
			// target can be seen
			if( ( DistToTarget <= W.TargetAdhesionDistanceMax )
				&& (DistFromAimY > TargetRadius || DistFromAimZ > TargetHeight)
				&& LineOfSightTo( AdhesionTarget, CamLoc ) // find a way no do this line check
				)
			{
				// Lateral adhesion
				if(	DistFromAimY > TargetRadius )
				{
					Pct = 1.f - (DistFromAimY-TargetRadius)/W.TargetAdhesionAimDistY;
					if (Pct > 0.f)
					{
						// boost based on other gameplay things (distance or something)
						// boost slightly when targeting
						Pct = FMin(Pct, 0.8f);

						AdhesionAmtY = GetRangeValueByPct(W.TargetAdhesionScaleRange, Pct);

						// Apply the adhesion
						AdjustY = DeltaRot.Yaw * (AdhesionAmtY * DeltaTime);
						out_YawRot += AdjustY;
					}
				}

				// Vertical adhesion
				if( DistFromAimZ > TargetHeight )
				{
					Pct = 1.f - (DistFromAimZ-TargetHeight)/W.TargetAdhesionAimDistZ;
					if (Pct > 0.f)
					{
						// boost based on other gameplay things (distance or something)
						// boost slightly when targeting
						Pct = FMin(Pct, 0.8f);

						AdhesionAmtZ = GetRangeValueByPct(W.TargetAdhesionScaleRange, Pct);

						//`log( "AdhesionAmtZ: " $ AdhesionAmtZ );

						// Apply the adhesion
						AdjustZ = DeltaRot.Pitch * (AdhesionAmtZ * DeltaTime);
						out_PitchRot += AdjustZ;
					}
				}
			}
		}
	}
}

/**
 * This will slow down the player's aiming when they are on "top" of a valid Target.  So when you whip around
 * there will be a slight slow down when you are directly aiming at a target.
 *
 * TODO: Combine Friction and Adhesion, to use the same "area"
 **/
function ApplyTargetFriction( float DeltaTime, KFWeapon W )
{
	local Pawn FrictionTarget;
	local Vector CamLoc, X, Y, Z, CamToTarget, AimLoc, TargetLoc, RealTargetLoc;
 	local Rotator CamRot;
 	local float DistToTarget, DistMultiplier, DistFromAimZ, DistFromAimY;
 	local float TargetRadius, TargetHeight;
 	local float FrictionMultiplier;

	//	local float Time;
	//	CLOCK_CYCLES(time);

	if( Pawn == None || !W.bTargetFrictionEnabled )
	{
		//`log( "ApplyTargetFriction returning: W.bTargetFrictionEnabled: " $ W.bTargetFrictionEnabled $ " Pawn: " $ Pawn $ " W: " $ W );
		return;
	}

	// Setup some initial data
	// TODO: Todo, maybe cache the values like UT3 - Ramm
//	CamLoc = CalcViewLocation;
//	CamRot = CalcViewRotation;
	// using this at this point here causes mega hitches to occur.  As the correct values have not been updated yet this early
	// Todo, maybe cache the values like UT3 - Ramm
    GetPlayerViewPoint( CamLoc, CamRot );
	GetAxes( CamRot, X, Y, Z );

	// Look for a friction target
	FrictionTarget = GetTargetAdhesionFrictionTarget( W.TargetFrictionDistanceMax, CamLoc, CamRot, FrictionAngleCurve );

	// If we have a valid friction target
	if( FrictionTarget != None )
	{
		//`log( "Friction Target: " $ FrictionTarget );
		RealTargetLoc = FrictionTarget.Location + ( W.TargetFrictionOffset >> CamRot );
		CamToTarget = ( RealTargetLoc - CamLoc );
		DistToTarget = VSize(CamToTarget);
		AimLoc = CamLoc + ( X * DistToTarget );

		// Grab collision info from target
		FrictionTarget.GetBoundingCylinder( TargetRadius, TargetHeight );

		// Calculate the aim friction multiplier
		// Y component
		TargetLoc	 = RealTargetLoc;
		TargetLoc.Z  = AimLoc.Z;
		DistFromAimY = PointDistToLine(AimLoc,(TargetLoc - CamLoc),CamLoc);

		// Z component
		TargetLoc	 = RealTargetLoc;
		TargetLoc.X  = AimLoc.X;
		TargetLoc.Y  = AimLoc.Y;
		DistFromAimZ = PointDistToLine(AimLoc,(TargetLoc - CamLoc),CamLoc);

		// Calculate the distance multiplier
		DistMultiplier = 0.f;
		//`log( " TargetFrictionDistanceMin: " $ W.TargetFrictionDistanceMin  $ " TargetFrictionDistanceMax: " $ W.TargetFrictionDistanceMax $ " DistToTarget: " $ DistToTarget );

		if( DistToTarget >= W.TargetFrictionDistanceMin
			&& DistToTarget <= W.TargetFrictionDistanceMax
			)
		{
			if( DistToTarget <= W.TargetFrictionDistancePeak )
			{
				// Ramp up to peak
				DistMultiplier = FClamp((DistToTarget - W.TargetFrictionDistanceMin)/(W.TargetFrictionDistancePeak - W.TargetFrictionDistanceMin),0.f,1.f);
			}
			else
			{
				// Ramp down from peak
				DistMultiplier = FClamp(1.f - (DistToTarget - W.TargetFrictionDistancePeak)/(W.TargetFrictionDistanceMax - W.TargetFrictionDistancePeak),0.f,1.f);
			}

    		if( bDebugTargetFriction )
    		{
    			LogInternal(GetFuncName()@"DistMultiplier: " $ DistMultiplier);
			}

			// Scale target radius by distance
			TargetRadius *= 1.f + (W.TargetFrictionPeakRadiusScale * DistMultiplier);
			TargetHeight *= 1.f + (W.TargetFrictionPeakHeightScale * DistMultiplier);
		}

		if( bDebugTargetFriction )
		{
			DrawDebugCylinder(FrictionTarget.Location+vect(0,0,1)*TargetHeight, FrictionTarget.Location-vect(0,0,1)*TargetHeight, TargetRadius, 12, 255, 0, 0);
		}
		// this is used to reduce the target radius so that moving pawns have a smaller radius so that when we are tracking
		// them the reticle doesn't stop outside of their body mass making it either impossible to hit them or making it look bad when
		// shots do actually hit them
//		if( ( VSize(FrictionTarget.Velocity) > 200 )
//			&& ( W.GetZoomedState() == ZST_Zoomed )
//			)
//		{
//			TargetRadius *= 0.05f;
//		}

		// If we should apply friction - must be within friction collision box
		if( DistFromAimY < TargetRadius
			&& DistFromAimZ < TargetHeight
			)
		{
			// Calculate the final multiplier (only based on horizontal turn)
			FrictionMultiplier = GetRangeValueByPct( W.TargetFrictionMultiplierRange, 1.f - (DistFromAimY/TargetRadius) );

			if( FrictionMultiplier > 0.0f )
			{
				bAppliedTargetFriction = TRUE;

				// Apply the friction
				aTurn *= (1.f - FrictionMultiplier);
				aLookUp *= (1.f - FrictionMultiplier);

				// Keep the friction target for possible use with adhesion
				LastFrictionTargetTime	= WorldInfo.TimeSeconds;
				LastFrictionTarget		= FrictionTarget;
			}
		}
	}
}

// Overridden to do custom FOV scaling, especially for weapons with 3d scopes
function float GetFOVAdjustedControllerSensitivity()
{
	local float FOVScale;
    local float UsedFOVAngle;
	local bool bUsingSights;

    FOVScale=1.0;

	// Take FOV into account (lower FOV == less sensitivity).
	if ( bEnableFOVScaling )
	{
        if( Pawn != none && Pawn.Weapon != none )
        {
			bUsingSights = Pawn.bIsWalking;
            UsedFOVAngle = Pawn.Weapon.GetModifiedFOVAngle();
        }
        else
        {
            UsedFOVAngle = GetFOVAngle();
        }

		if( UsedFOVAngle != DefaultFOV && bUsingSights )
            FOVScale = UsedFOVAngle * 0.01333 * ZoomedSensitivityScalar; // 0.01333 = 1 / 75.0 - the default FOV
        else
            FOVScale = 1.0;
	}

	return FOVScale;

}

/** Toggle debug display for view acceleration **/
exec function DebugViewAcceleration()
{
	if ( WorldInfo.NetMode == NM_StandAlone )
	{
		bDebugViewAcceleration = !bDebugViewAcceleration;
		ClientMessage( "bDebugViewAcceleration is now: " $ bDebugViewAcceleration );
	}
}

/** Toggle debug display for target adhesion **/
exec function DebugTargetAdhesion()
{
	if ( WorldInfo.NetMode == NM_StandAlone )
	{
		bDebugTargetAdhesion = !bDebugTargetAdhesion;
		ClientMessage( "bDebugTargetAdhesion is now: " $ bDebugTargetAdhesion );
	}
}

/** Toggle debug display for auto target **/
exec function DebugAutoTarget()
{
	if ( WorldInfo.NetMode == NM_StandAlone )
	{
		bDebugAutoTarget = !bDebugAutoTarget;
		ClientMessage( "bDebugAutoTarget is now: " $ bDebugAutoTarget );
	}
}

/** Toggle debug display for target friction **/
exec function DebugTargetFriction()
{
	if ( WorldInfo.NetMode == NM_StandAlone )
	{
		bDebugTargetFriction = !bDebugTargetFriction;
		ClientMessage( "bDebugTargetFriction is now: " $ bDebugTargetFriction );
	}
}

/*********************************************************************************************
* Debugging - These are not cheats!  Some commands, such as SETNOPEC are disabled in ShippingPC
*			  We use 'config' vars for log groups so they can always be set from ini.
********************************************************************************************* */

exec function SuppressTakeDamage(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogTakeDamage false");
}

exec function UnsuppressTakeDamage(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogTakeDamage true");
}

exec function SuppressPhysicsBodyImpact(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogPhysicsBodyImpact false");
}

exec function UnsuppressPhysicsBodyImpact(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogPhysicsBodyImpact true");
}

exec function SuppressSpecialMove(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogSpecialMove false");
}

exec function UnsuppressSpecialMove(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogSpecialMove true");
}

exec function SuppressPawnAnim(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogCustomAnim false");
}

exec function UnsuppressPawnAnim(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFPawn';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogCustomAnim true");
}

exec function SuppressWeaponAttach(optional name ClassName)
{
	ConsoleCommand("SETNOPEC KFWeaponAttachment bDebug false");
}

exec function UnsuppressWeaponAttach(optional name ClassName)
{
	ConsoleCommand("SETNOPEC KFWeaponAttachment bDebug true");
}

exec function SuppressIncapacitation(optional name ClassName)
{
	ConsoleCommand("SETNOPEC KFPawnAfflictions bLog false");
}

exec function UnsuppressIncapacitation(optional name ClassName)
{
	ConsoleCommand("SETNOPEC KFPawnAfflictions bLog true");
}

exec function SuppressWeaponAnim(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFWeapon';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogAnimation false");
}

exec function UnsuppressWeaponAnim(optional name ClassName)
{
	ClassName = (ClassName!='') ? ClassName : 'KFWeapon';
	ConsoleCommand("SETNOPEC"@ClassName@"bLogAnimation true");
}

exec function SuppressMelee()
{
	ConsoleCommand("SETNOPEC KFMeleeHelperBase bLogMelee false");
}

exec function UnsuppressMelee()
{
	ConsoleCommand("SETNOPEC KFMeleeHelperBase bLogMelee true");
}

exec function SuppressPerk()
{
	ConsoleCommand("SETNOPEC KFPerk bLogPerk false");
}

exec function UnsuppressPerk()
{
	ConsoleCommand("SETNOPEC KFPerk bLogPerk true");
}

exec function SuppressAISpawnLogging()
{
	ConsoleCommand("SETNOPEC KFAISpawnManager bLogAISpawning false");
}

exec function UnsuppressAISpawnLogging()
{
	ConsoleCommand("SETNOPEC KFAISpawnManager bLogAISpawning true");
}

exec function SuppressWaveSpawnLogging()
{
	ConsoleCommand("SETNOPEC KFAISpawnManager bLogWaveSpawnTiming false");
}

exec function UnsuppressWaveSpawnLogging()
{
	ConsoleCommand("SETNOPEC KFAISpawnManager bLogWaveSpawnTiming true");
}

exec function SuppressScoring()
{
	ConsoleCommand("SETNOPEC KFGameInfo bLogScoring false");
}

exec function UnsuppressScoring()
{
	ConsoleCommand("SETNOPEC KFGameInfo bLogScoring true");
}

defaultproperties
{
   bRequiresPushToTalk=True
   bQuickWeaponSelect=True
   bViewAccelerationEnabled=True
   bTargetFrictionEnabled=True
   ZoomedSensitivityScalar=0.350000
   GamepadButtonHoldTime=0.250000
   SprintAnalogThreshold=0.900000
   TimeBelowThresholdToStopSprint=0.050000
   HorizontalSensitivityScale=1.000000
   VerticalSensitivityScale=0.900000
   ViewAccel_YawThreshold=0.990000
   ViewAccel_DiagonalThreshold=0.990000
   ViewAccel_TimeToHoldBeforeFastAcceleration=0.062500
   ViewAccel_RampSpeed=0.007500
   ViewAccel_MaxTurnSpeed=1.100000
   SensitivityScaleCurve=(Points=(,(InVal=0.100000,OutVal=0.070000),(InVal=0.250000,OutVal=0.200000),(InVal=0.500000,OutVal=0.500000),(InVal=0.750000,OutVal=1.250000),(InVal=1.000000,OutVal=1.800000)))
   AutoTargetRotationRate=35.000000
   AutoTargetAngleCurve=(Points=((OutVal=0.800000),(InVal=2500.000000,OutVal=0.980000)))
   FrictionAngleCurve=(Points=(,(InVal=2500.000000)))
   AdhesionAngleCurve=(Points=((OutVal=0.950000),(InVal=2000.000000,OutVal=0.980000)))
   ForceLookAtPawnMinAngle=0.900000
   ForceLookAtPawnRotationRate=22.000000
   ForceLookAtPawnDampenedRotationRate=8.000000
   DoubleTapDelay=0.250000
   bEnableFOVScaling=True
   Name="Default__KFPlayerInput"
   ObjectArchetype=MobilePlayerInput'GameFramework.Default__MobilePlayerInput'
}
