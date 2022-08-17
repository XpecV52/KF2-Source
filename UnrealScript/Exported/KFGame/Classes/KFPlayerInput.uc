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

/** Set to false if we want to use KF1 style weapon switching */
var config bool bQuickWeaponSelect;

/** Start time when player last pressed jump.  Used by CannotJumpNow() */
var transient float PressedJumpTime;

/** Unlike other weapons states ironsights doesn't use PendingFire (see InventoryManager).
 This concept is useful for Ironsights(HOLD), which is accomplished by this bool. */
var transient bool bIronsightsHeld;

/** cached magnitude of 2d input move vector */
var transient float RawJoyMagnitude;

/** cached magnitude of 2d input look vector */
var transient float RawJoyLookMagnitude;

/*********************************************************************************************
 * @name Gamepad Specific Controls
********************************************************************************************* */

/** Set to true when we have opened the weapon select menu with a controller */
var bool 		bGamepadWeaponSelectOpen;
/** One-time on screen button hint */
var bool 		bShowGamepadWeaponSelectHint;

/** Set to true if we want to invert the Y on the controller */
var config bool bInvertController;

/** The amount of time the weapon switch button must be held to perform various actions */
var config float GamepadButtonHoldTime;

/** Amount thumbstick should be pressed to activate sprint */
var config float SprintAnalogThreshold;

/** On tap weapon switch: TRUE for last weapon, FALSE for cycle next */
var config bool bUseGamepadLastWeapon;

/** Doing gamepad sprinting that requires the stick to be held most of the way to the side **/
var transient bool bExtendedSprinting;

/** Radial distance from analog center when sprint is pressed */
var transient float GamepadSprintAnalogStart;

/** The index of the preset layout to use for controller mappings. Used with GamepadLayoutManager */
var config int CurrentLayoutIndex;

/*********************************************************************************************
 * @name Aim assists
********************************************************************************************* */

/** Toggles for all aim assists (friction, adhesion, lock-on) */
var(AimAssistGlobal) config bool bAimAssistEnabled;

////////////////////////////////
// Sensitivity

/** Interp curve that allows for piece wise functions for the TargetFrictionDistance amount at different ranges **/
var(Sensitivity) InterpCurveFloat LookSensitivityScaleCurve;
var(Sensitivity) InterpCurveFloat MoveSensitivityScaleCurve;
/** Unified global scalar for joystick sensitivity */
var(Sensitivity) config float GamepadSensitivityScale;
/** Multiplier used to scale look sensitivity while sprinting. */
var(Sensitivity) float SprintingSensitivityScale;
/** Used to scale the sensitivity of the mouse based on how zoomed the player is. */
var(Sensitivity) config float ZoomedSensitivityScale;
/** Used to scale the sensitivity of the joystick based on how zoomed the player is. */
var(Sensitivity) config float GamepadZoomedSensitivityScale;

////////////////////////////////
// View Smoothing

/** Whether to use turn smoothing / blending or not */
var(ViewSmoothing) bool bViewSmoothingEnabled;
/** Max acceleration units per second (since the joystick max value is 1, setting to 1 means take 1 second to get to max turn speed if starting at 0) */
var(ViewSmoothing) float ViewSmoothing_MaxAccel;
/** Similar to MaxAccel. Should be larger then accel. */
var(ViewSmoothing) float ViewSmoothing_MaxDecel;

/** Vars to keep track of values to blend between for smoothing */
var transient float PrevTurn, PrevLookUp, CurrTurn, CurrLookUp;

////////////////////////////////
// View Acceleration

/** Whether ViewAcceleration is enabled or not **/
var(ViewAcceleration) config bool bViewAccelerationEnabled;
/** Joystick vector must be greater than this to trigger view acceleration (magnitude range is 0 to 1, regardless of direction)*/
var(ViewAcceleration) float ViewAccel_JoyMagThreshold;
/** Joystick Y-value must be less than this to trigger view acceleration (Y-value range is from -1 to 1) */
var(ViewAcceleration) float ViewAccel_JoyPitchThreshold;
/** Max turn speed **/
var(ViewAcceleration) float ViewAccel_MaxTurnSpeed;
/** How long to blend to max turn speed */
var(ViewAcceleration) float ViewAccel_BlendTime;
/** Timer for BlendTime */
var transient float ViewAccel_BlendTimer;

var config protected bool bDebugViewAcceleration;
/** Store previous remainder of aTurn for smoothing slow rotations. */
var float RemainingaTurn;
/** Store previous remainder of aLookUp for smoothing slow rotations. */
var float RemainingaLookUp;

////////////////////////////////
// Target Friction

/** Whether TargetFriction is enabled or not **/
var(Friction) config bool bTargetFrictionEnabled;

/** How much friction reduces rotation */
var(Friction) float FrictionScale;

/** Enables Target Friction debugging **/
var config protected bool bDebugTargetFriction;

/** Last friction target */
var private Pawn LastFrictionTarget;

/** Last friction target acquire time */
var private float LastFrictionTargetTime;

// Friction/Adhesion debugging vars
var private float LastaTurn, LastaLookUp, LastaForward, LastaStrafe;

/** Interp curve to scale Friction angle for different ranges **/
var(Friction) InterpCurveFloat FrictionAngleCurve;

/** How much to scale friction when view acceleration (turn assist) is being applied */
var(Friction) float ViewAccelerationFrictionScale;

////////////////////////////////
// Target Adhesion

/** Whether TargetAdhesion is enabled or not **/
var(Adhesion) config bool bTargetAdhesionEnabled;

/** Interp curve to scale Adhesion angle for different ranges **/
var(Adhesion) InterpCurveFloat AdhesionAngleCurve;

/** How strongly adhesion affects player view */
var(Adhesion) float AdhesionFactor;

/** Cached vars to help with adhesion */
var private Pawn LastAdhesionTarget;
var transient vector AdhesionTargetLastLoc, AdhesionPawnLastLoc;

////////////////////////////////
// Auto Target

/** Whether TargetAdhesion is enabled or not **/
var(AutoTarget) config bool bAutoTargetEnabled;

/** How long to auto target for when going to iron sights **/
var(AutoTarget) float 	AutoTargetTimeLeft;

/** Where we were aiming at the autotargeted pawn was when we first locked on **/
var vector AutoTargetInitialLocation;
/** The current Pawn we're locked onto for auto targeting **/
var Pawn CurrentAutoTarget;
/** The Target's bone name being followed */
var name CurrentAutoTargetBone;

/** How fast to rotate towards autotarget location**/
var(AutoTarget) float AutoTargetRotationRate;

/** Interp curve to scale autotarget angle for different ranges **/
var(AutoTarget) InterpCurveFloat AutoTargetAngleCurve;
var(AutoTarget) InterpCurveFloat AutoTargetWeakspotCurve;

/** Disallow auto-target spamming */
var(AutoTarget) float AutoTargetCooldown;
var transient 	float LastAutoTargetTime;

/** Force rotation to within this angle when using the ForceLookAtPawn functionality **/
var(AutoTarget) float ForceLookAtPawnMinAngle;
/** How fast to rotate towards ForceLookAtPawn location**/
var(AutoTarget) float ForceLookAtPawnRotationRate;
/** How fast to rotate towards ForceLookAtPawn location dampened for closer rotation**/
var(AutoTarget) float ForceLookAtPawnDampenedRotationRate;

/*********************************************************************************************
* @name	Force Feedback
********************************************************************************************* */

var(ForceFeedback) config bool bForceFeedbackEnabled;

/*********************************************************************************************
 * @name Flashlight / Night vision
********************************************************************************************* */
var const float DoubleTapDelay;

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
native function SetKeyBind( out KeyBind MyKeyBind, string Command,  bool overwritePrevCommand );

/** Removes this command from KFInput.ini */
native function RemoveCommandFromBind( out KeyBind MyKeyBind, string CommandToRemove );

/** Returns the index that this key bind was found at */
native function int GetBindingsIndex( out KeyBind MyKeyBind );

/** resets the KFInput.ini */
native static function ResetKeysToDefault();

native exec function SetGamepadLayout(int layoutIndex);

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
}

exec function SetZoomedSensitivity(Float F)
{
	ZoomedSensitivityScale = F;
}

/** No one ever uses double clicks, so we hijack this function and the variable to store an
  * approximation of the output of the movement sensitivity curve */
function EDoubleClickDir CheckForDoubleClickMove(float DeltaTime)
{
	local int MappedOutput;
	local float MinCurveOut, MaxCurveOut, CurveOut, CurvePct;

	if( !bUsingGamepad || bRun > 0 )
	{
		// max speed (modifer will be 1)
		return EDoubleClickDir( 0 );
	}

	// Map RawJoyMagnitude to our movement speed enum range

	// get curve out value and range
	CurveOut = EvalInterpCurveFloat( MoveSensitivityScaleCurve, RawJoyMagnitude );
	MinCurveOut = MoveSensitivityScaleCurve.Points[0].OutVal;
	MaxCurveOut = MoveSensitivityScaleCurve.Points[MoveSensitivityScaleCurve.Points.Length - 1].OutVal;

	CurvePct = (CurveOut - MinCurveOut) / (MaxCurveOut - MinCurveOut);

	MappedOutput = EAnalogMovementSpeed.AMOVESPEED_Max - (CurvePct * EAnalogMovementSpeed.AMOVESPEED_Max);
	
	return EDoubleClickDir( MappedOutput );
}

// Overridden to not double apply FOV scaling
event PlayerInput( float DeltaTime )
{
	local float FOVScale, TimeScale;
	local vector RawJoyVector;

	// Save Raw values
	RawJoyUp		= aBaseY;
	RawJoyRight		= aStrafe;
	RawJoyLookRight	= aTurn;
	RawJoyLookUp	= aLookUp;

	// cache raw input (left stick) vector
	RawJoyVector.x = RawJoyRight;
	RawJoyVector.y = RawJoyUp;
	RawJoyMagnitude = VSize2d( RawJoyVector );

	// cache raw input look (right stick) vector
	RawJoyVector.x = RawJoyLookRight;
	RawJoyVector.y = RawJoyLookUp;
	RawJoyLookMagnitude = VSize2d( RawJoyVector );

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
            FOVScale = UsedFOVAngle * 0.01333 * ZoomedSensitivityScale; // 0.01333 = 1 / 75.0 - the default FOV
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
	SetKeyBind(NewKeyBind, BindCommand, false);
	SaveConfig();

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
	GamepadSprintAnalogStart = GetLeftAnalogDistance();

	GamepadSprintTimer();
	if ( bRun == 0 )
	{
		SetTimer(0.05, true, nameof(GamepadSprintTimer), self);
	}
}

/** Keep checking if thumbstick has exceeded sprint threshold */
function GamepadSprintTimer()
{
	if ( ShouldActivateGamepadSprint() )
	{		
		bRun = 1;
		ClearTimer(nameof(GamepadSprintTimer), self);
	}
}

/** On release: Crouch or switch to 'ExtendedSprint' */
exec function GamepadSprintRelease()
{
	if( ShouldActivateGamepadSprint() )
	{
		// end sprint; begin extended (non-pressed) sprint
		bExtendedSprinting = true;
	}
	else if ( bRun == 0 )
	{
		ToggleCrouch();
	}

	bRun = 0;
	ClearTimer(nameof(GamepadSprintTimer), self);
}

/** Returns a radial distance from center */
function float GetLeftAnalogDistance()
{
	local vector vAnalog;

	// Take 2d vector mag to get (more) circular threshold. Inputs don't make an
	// exact circle however. They are wide at diagonals and vary by hardware.
	vAnalog.x = RawJoyRight;
	vAnalog.y = RawJoyUp;

	return VSize2D(vAnalog);
}

/** Determine whether the player is trying to sprint or crouch */
function bool ShouldActivateGamepadSprint()
{
	local float Distance, Bias, Delta;

	Distance = GetLeftAnalogDistance();
	Delta = Distance - GamepadSprintAnalogStart;

	// sprint bias down to original 0.3 threshold
	if ( Delta > 0.2 )
	{
		Bias = 0.3f;
	}

	//`log("current:"$Distance@"Delta:"$Delta@"Bias:"$Bias);
	return (Distance + Bias) > SprintAnalogThreshold;
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

/** 
 * GBA_Jump_Gamepad
 * Tap: Jump
 * Hold: Toggle crouch
 */
exec function GamepadJump()
{
	SetTimer(GamepadButtonHoldTime, false, nameof(GamepadJumpTimer), self);
}

/** Tap function for GBA_Jump_Gamepad */
exec function GamepadJumpRelease()
{
	if ( IsTimerActive(nameof(GamepadJumpTimer), self) )
	{
		Jump();
		ClearTimer(nameof(GamepadJumpTimer), self);
	}
}

/** Hold function for GBA_Jump_Gamepad */
function GamepadJumpTimer()
{
	ToggleCrouch();
}

/*********************************************************************************************
* @name	Ironsights
********************************************************************************************* */

/** GBA_IronsightsToggle, GBA_IronsightsHold
 * @params bHoldButtonMode	If true, use hold mode instead of toggle
 */
simulated exec function IronSights(optional bool bHoldButtonMode)
{
	local KFWeapon KFW;

	if ( bHoldButtonMode )
	{
		bIronsightsHeld = true;
	}

	if ( bExtendedSprinting )
	{
		bRun = 0;
		bExtendedSprinting = false;
	}

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

	if ( bHoldButtonMode )
	{
		bIronsightsHeld = false;
	}

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
		// if anything is on, tap to turn off 
		if( bNightVisionActive )
		{
			InternalToggleNightVision(); 
		}
		// if able to use NVG, handle hold press
		else if( bPerkHasNightVision )
		{
			SetTimer(GamepadButtonHoldTime, false, nameof(FlashlightTimer), self);
		}
		// if unable to use NVG, simply tap to toggle flashlight
		else
		{
			InternalToggleFlashlight();
		}
	}
}

/** Tap function for GBA_ToggleFlashlight */
exec function FlashlightRelease()
{
	if ( IsTimerActive(nameof(FlashlightTimer), self) )
	{
		ClearTimer(nameof(FlashlightTimer), self);
		InternalToggleFlashlight();
	}
}

/** Hold function for GBA_ToggleFlashlight */
function FlashlightTimer()
{
	InternalToggleNightVision();
}

/** 
 * Actually pass the toggle flashlight command onto the pawn.  Seperated to simplify and
 * alleviate confusion between flashlight/equipment/nightvision terminology in legacy code.
 */
function InternalToggleFlashlight()
{
	local KFPawn_Human KFP;

	KFP = KFPawn_Human(Pawn);
	if( KFP != None )
	{
		if( bNightVisionActive )
		{
			SetNightVision( false );
			KFP.PlaySoundBase(NightVisionOffEvent);
		}

		KFP.ToggleEquipment();
		KFP.PlaySoundBase((KFP.bFlashlightOn) ? FlashlightOnEvent : FlashlightOffEvent); 
	}
}

/** 
 * Actually pass the toggle night vision command onto the controller.  Seperated to simplify and
 * alleviate confusion between flashlight/equipment/nightvision terminology in legacy code.
 */
function InternalToggleNightVision()
{
	local KFPawn_Human KFP;

	KFP = KFPawn_Human(Pawn);
	if( KFP != None )
	{
		if( KFP.bFlashlightOn )
		{
			InternalToggleFlashlight();
		}

		SetNightVision( !bNightVisionActive );
		KFP.PlaySoundBase((bNightVisionActive) ? NightVisionOnEvent : NightVisionOffEvent); 
	}
}

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

/** GBA_Reload_Gamepad */
exec function GamepadReload()
{
	SetTimer(GamepadButtonHoldTime, false, nameof(GamepadReloadTimer), self);
}

/** GBA_Reload_Gamepad */
function GamepadReloadTimer()
{
	QuickHeal();
}

/** GBA_Reload_Gamepad */
exec function GamepadReloadRelease()
{
	if ( IsTimerActive(nameof(GamepadReloadTimer), self) )
	{
		if ( Pawn != None )
		{
			Pawn.StartFire(2);

			// It's unusual to kill a pending fire on the same frame since it
			// has to replicate.  Seems to work well enough for reload.
			Pawn.StopFire(2);
		}

		ClearTimer(nameof(GamepadReloadTimer), self);
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

/** GBA_Grenade_Gamepad */
exec function GamepadGrenade()
{
	local Weapon W;

	if ( Pawn != None )
	{
		if ( bGamepadWeaponSelectOpen )
		{
			if(MyGFxHUD.WeaponSelectWidget != none)
			{
				W = MyGFxHUD.WeaponSelectWidget.GetSelectedWeapon();
				if ( W != None )
				{
					ServerThrowOtherWeapon(W);
					//ThrowWeapon();
				}
			}
		}
		else
		{
			Grenade();
		}
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

/** Equips the previous weapon in the inventory chain */
exec function SelectLastWeapon()
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
		if ( KFIM != None )
		{
			KFIM.SwitchToLastWeapon();
			KFIM.ShowAllHUDGroups();
		}
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
	if ( bGamepadWeaponSelectOpen && MyGFxHUD.WeaponSelectWidget != none )
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
			KFIM = KFInventoryManager(Pawn.InvManager);

		    // On button tap, cycle weapons
		    if (IsTimerActive(nameof(GamepadWeaponMenuTimer), self))
		    {
				ClearTimer(nameof(GamepadWeaponMenuTimer), self);

		    	// once per match show hint for the hold function
		    	if ( bShowGamepadWeaponSelectHint )
		    	{
		    		ReceiveLocalizedMessage( class'KFLocalMessage_Interaction', IMT_GamepadWeaponSelectHint);
		    	}

				// perform tap weapon switch action
				if ( bUseGamepadLastWeapon )
				{
					KFIM.SwitchToLastWeapon();
				}
				else
				{
		    		KFIM.GamePadNextWeapon();
				}			    
		    }
		    // Switch to selected weapon from the UI
		    else
		    {
			    KFIM.SetCurrentWeapon(KFIM.PendingWeapon);
		    }
		}

		// first time hint only
		bShowGamepadWeaponSelectHint = false;
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

    	if ( MyGFxHUD.WeaponSelectWidget != None )
    	{
			bGamepadWeaponSelectOpen = true;
			MyGFxHUD.WeaponSelectWidget.SetWeaponSwitchStayOpen(true);
			KFInventoryManager(Pawn.InvManager).HighlightWeapon(Pawn.Weapon);
		}
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
			else
			{
				KFIM.SetCurrentWeapon(NextGroupedWeapon);
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
		ShowVoiceComms();
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
		ToggleFlashlight();
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
		TossMoney();
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
		// toggle between healer and last weapon
		if ( Pawn != None && Pawn.Weapon != None && Pawn.Weapon.IsA('KFWeap_HealerBase') )
		{
			KFInventoryManager( Pawn.InvManager ).SwitchToLastWeapon();
		}
		else
		{
			SwitchWeaponGroup(3);
		}
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
		MyGFxHUD.ShowVoiceComms(false);
	}
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

exec function StartVoiceChat(optional bool bPublicChat)
{
	LogInternal("VOICE CHAT!");
	if(bRequiresPushToTalk)
	{
		if(bPublicChat)
		{
			CurrentVoiceChannel = EVC_ALL;
		}
		else
		{
			CurrentVoiceChannel = EVC_TEAM;	
		}

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

/**
 * Overridden to add hooks for view acceleration, target friction, auto centering, controller sensitivity.
 */
function PreProcessInput( float DeltaTime )
{
	Super.PreProcessInput(DeltaTime);

	if ( Pawn != None && bUsingGamepad )
	{
		PreProcessGamepadInput(DeltaTime);
	}
}

/** Tick gamepad aim assist, extended sprint, etc... */
function PreProcessGamepadInput( float DeltaTime )
{
	local KFWeapon KFW;
	local float FOVScale;
	local float ScaledJoyMagnitude;

	if( bExtendedSprinting )
    {
		// Handle sprinting with joysticks and clicks
		UpdateExtendedSprint( DeltaTime );
    }

    // Use these instead of aTurn and aLookUp so that we can blend between previous and current frames to smooth them.
    // Then set aTurn and aLookUp to the blended value.
    CurrTurn = 0.f;
	CurrLookup = 0.f;

	// Baseline rotation control, taking stick sensitivity into account
	// Uses magnitude of input for both instead of individual axes, which makes diagonals feel wonky
	if( RawJoyLookMagnitude > 0.f )
	{
		ScaledJoyMagnitude = EvalInterpCurveFloat(LookSensitivityScaleCurve, Abs(RawJoyLookMagnitude));
		CurrTurn = ScaledJoyMagnitude * (RawJoyLookRight/RawJoyLookMagnitude);
		CurrLookUp = ScaledJoyMagnitude * (RawJoyLookUp/RawJoyLookMagnitude);
	}

	// sets CurrTurn/CurrLookUp directly if applicable, does not multiply
	if( CanApplyViewAcceleration() )
	{
		ApplyViewAcceleration( DeltaTime );
	}
	else
	{
		ViewAccel_BlendTimer = 0;
	}

	// Apply friction (right-stick aim assist).  Adhesion is handled in the PC
	if ( Pawn.Weapon != None )
	{
		KFW = KFWeapon(Pawn.Weapon);
		if( IsAimAssistFrictionEnabled() && KFW != none )
		{
			ApplyTargetFriction( DeltaTime, KFW );
		}
	}

	// Apply FOV zoomed/iron sight sensitivity scaling
    FOVScale = GetFOVAdjustedControllerSensitivity();

	CurrTurn *= FOVScale;
	CurrLookUp *= FOVScale;

	// Globally scale the turning and up/down sensitivity
    CurrTurn *= GamepadSensitivityScale;
	CurrLookUp *= GamepadSensitivityScale;

	// be less sensitive while sprinting
	if( KFPawn(Pawn) != none && KFPawn(Pawn).bIsSprinting )
	{
		CurrTurn *= SprintingSensitivityScale;
		CurrLookUp *= SprintingSensitivityScale;
	}

	//`log( "aTurn: " $ aTurn $ " aLookUp: " $ aLookUp $ " DeltaTime: " $ DeltaTime );

	if( bViewSmoothingEnabled )
	{
		// sets CurrTurn/CurrLookUp directly if applicable, does not multiply
		ApplyViewSmoothing( DeltaTime );
	}

	aTurn = CurrTurn;
	aLookUp = CurrLookUp;

	//`log("aTurn In: "$RawJoyLookRight$"; aTurn Out: "$aTurn$"; aLookUp In: "$RawJoyLookUp$"; aLookUp Out: "$aLookUp$"; RawJoyLookMag: "$RawJoyLookMagnitude);

	//`log("PrevTurn: "$PrevTurn$"; aTurn: "$aTurn$"; CurrTurn: "$CurrTurn$"; PrevLookUp: "$PrevLookUp$"; aLookUp: "$aLookUp$"; CurrLookUp: "$CurrLookUp);
	PrevTurn = aTurn;
	PrevLookUp = aLookUp;
}

/** Called from PreProcessInput when bExtendedSprinting=TRUE */
function UpdateExtendedSprint( float DeltaTime )
{
	// extended sprint cannot be activated during ironsights
	if ( bRun == 0 && Pawn.Weapon != None && Pawn.Weapon.ShouldOwnerWalk() )
	{
		bRun = 0;
		bExtendedSprinting = false;
	}
	// If we've clicked the sprint button, and have the stick pressed
	// most of the way to the side, keep sprinting
	else if( IsDirectingJoyStick(SprintAnalogThreshold) )
	{
		bRun = 1;
	}
	else
	{
		bRun = 0;
		bExtendedSprinting = false;
	}
}

/** Returns true if we are pressing the joystick in a direction */
function bool IsDirectingJoyStick(float Threshold)
{
	local vector vAnalog;

	// Take 2d vector mag to get (more) circular threshold. Inputs don't make an
	// exact circle however. They are wide at diagonals and vary by hardware.
	vAnalog.x = RawJoyRight;
	vAnalog.y = RawJoyUp;

    if( VSize2d(vAnalog) > Threshold )
    {
    	return true;
    }
    return false;
}

/**
 * This will scale the player's rotation speed depending on the location of their thumbstick. Framerate independent.
 **/
function ApplyViewAcceleration( float DeltaTime )
{
		ViewAccel_BlendTimer += DeltaTime;
		if( ViewAccel_BlendTimer >= ViewAccel_BlendTime )
		{
			ViewAccel_BlendTimer = ViewAccel_BlendTime;
		}

		if( CurrTurn > 0 )
		{
			CurrTurn = Lerp( CurrTurn, ViewAccel_MaxTurnSpeed, ViewAccel_BlendTimer / ViewAccel_BlendTime );
		}
		else
		{
			CurrTurn = Lerp( CurrTurn, -ViewAccel_MaxTurnSpeed, ViewAccel_BlendTimer / ViewAccel_BlendTime );
		}
}

function bool CanApplyViewAcceleration()
{
	if( !bViewAccelerationEnabled )
	{
		return false;
	}

	// don't accelerate in iron sights
	if( Pawn == none || KFWeapon(Pawn.Weapon) == none || KFWeapon(Pawn.Weapon).bUsingSights )
	{
		return false;
	}

	// only accelerate if the right stick is within certain bounds
	if( RawJoyLookMagnitude < ViewAccel_JoyMagThreshold || Abs(RawJoyLookUp) > ViewAccel_JoyPitchThreshold )
	{
		return false;
	}

	return true;
}

/** Whether we're applying view acceleration (turn assist) */
function bool ApplyingViewAcceleration()
{
	return ViewAccel_BlendTimer > 0;
}

/** Blends between last frame's look speed and this frame's, using MaxAccel as a constraint. Framerate independent. */
function ApplyViewSmoothing( float DeltaTime )
{
	local float MaxAccel, MaxDecel;

	// Only smooth values on the base sensitivity curve. Don't smooth once (if) view acceleration kicks in.
	if( PrevTurn <= LookSensitivityScaleCurve.Points[LookSensitivityScaleCurve.Points.Length-1].OutVal )
	{
		MaxAccel = ViewSmoothing_MaxAccel * DeltaTime;
		MaxDecel = ViewSmoothing_MaxDecel * DeltaTime;

		if( (CurrTurn >= 0 && PrevTurn < 0) || (CurrTurn <= 0 && PrevTurn > 0) )
		{
			CurrTurn = PrevTurn + FClamp(CurrTurn - PrevTurn, -MaxDecel, MaxDecel);
		}
		else
		{
			CurrTurn = PrevTurn + FClamp(CurrTurn - PrevTurn, -MaxAccel, MaxAccel);
		}

		if( (CurrLookUp >= 0 && PrevLookUP < 0) || (CurrLookUp <= 0 && PrevLookUP > 0) )
		{
			CurrLookUp = PrevLookUP + FClamp(CurrLookUp - PrevLookUP, -MaxDecel, MaxDecel);
		}
		else
		{
			CurrLookUp = PrevLookUP + FClamp(CurrLookUp - PrevLookUP, -MaxAccel, MaxAccel);
		}
	}
}

/**
 * Begin an AutoTargeting adhesion cycle
 **/
function InitAutoTarget()
{
    local Vector	CamLoc, X;
	local Rotator	CamRot;
	local float     UsedTargetAngle, MaxDistance;

	// No autotargeting without a gamepad!
    if ( !bUsingGamepad || Pawn == None || Pawn.Weapon == None )
	{
		return;
	}

	if( !IsAimAssistAutoTargetEnabled() )
	{
		return;
	}

    // auto-target cooldown (in real seconds)
    if ( (WorldInfo.RealTimeSeconds - LastAutoTargetTime) < AutoTargetCooldown )
    {
    	return;
    }

    if( KFWeapon(Pawn.Weapon) == none )
    {
    	return;
    }

    AutoTargetTimeLeft = KFWeapon(Pawn.Weapon).default.ZoomInTime * 0.85;
	LastAutoTargetTime = WorldInfo.RealTimeSeconds;

	// Get camera location/rotation
	GetPlayerViewPoint( CamLoc, CamRot );

	// look for a new target
	MaxDistance = AutoTargetAngleCurve.Points[AutoTargetAngleCurve.Points.Length-1].InVal;
	CurrentAutoTarget = GetTargetAdhesionFrictionTarget( MaxDistance, CamLoc, CamRot, AutoTargetAngleCurve );
	if (CurrentAutoTarget != None)
	{
		CurrentAutoTargetBone = '';
		AutoTargetInitialLocation = GetBestAutoTargetLocation(CurrentAutoTarget, CurrentAutoTargetBone);
	}

	if( bDebugAutoTarget )
	{
	   FlushPersistentDebugLines();

	   X = vector(CamRot);
	   UsedTargetAngle = EvalInterpCurveFloat(AutoTargetAngleCurve, VSize(CamLoc - AutoTargetInitialLocation));
       DrawDebugCone(CamLoc + X * 5,X,500.0, Acos(UsedTargetAngle), Acos(UsedTargetAngle),16,MakeColor(255,0,0,255),true);
       DrawDebugCone(CamLoc + X * 5,X,250.0, Acos(AutoTargetAngleCurve.Points[0].OutVal), Acos(AutoTargetAngleCurve.Points[0].OutVal),16,MakeColor(0,255,0,255),true);
       DrawDebugCone(CamLoc + X * 5,X,AutoTargetAngleCurve.Points[AutoTargetAngleCurve.Points.Length - 1].InVal, Acos(AutoTargetAngleCurve.Points[AutoTargetAngleCurve.Points.Length - 1].OutVal), Acos(AutoTargetAngleCurve.Points[AutoTargetAngleCurve.Points.Length - 1].OutVal),16,MakeColor(0,255,0,255),true);

       UsedTargetAngle = EvalInterpCurveFloat(AutoTargetWeakspotCurve, VSize(CamLoc - AutoTargetInitialLocation));
       DrawDebugCone(CamLoc + X * 5,X,500.0, Acos(UsedTargetAngle), Acos(UsedTargetAngle),16,MakeColor(255,0,0,255),true);
       DrawDebugCone(CamLoc + X * 5,X,250.0, Acos(AutoTargetWeakspotCurve.Points[0].OutVal), Acos(AutoTargetWeakspotCurve.Points[0].OutVal),16,MakeColor(255,255,0,255),true);
       DrawDebugCone(CamLoc + X * 5,X,AutoTargetWeakspotCurve.Points[AutoTargetWeakspotCurve.Points.Length - 1].InVal, Acos(AutoTargetWeakspotCurve.Points[AutoTargetWeakspotCurve.Points.Length - 1].OutVal), Acos(AutoTargetWeakspotCurve.Points[AutoTargetWeakspotCurve.Points.Length - 1].OutVal),16,MakeColor(255,255,0,255),true);
	}
}

/**
 * Returns the best location for auto targeting a pawn
 */
function vector GetBestAutoTargetLocation(Pawn CheckTarget, out name outBoneName)
{
    local KFPawn KFP;
    local array<name> WeakBones;
    local array<name> NormalBones;
    local vector TestLoc, CamLoc, CamDir, HitLoc, HitNorm;
    local rotator CamRot;
    local Actor HitActor;
   	local TraceHitInfo HitInfo;
    local int i;

    if( CheckTarget == none )
    {
        return vect(0,0,0);
    }

   	KFP = KFPawn(CheckTarget);
    if( KFP != none )
    {
    	// Get the location from the pawn we're targeting if we can
        KFP.GetAutoTargetBones(WeakBones, NormalBones);

        // cone setup
    	GetPlayerViewPoint( CamLoc, CamRot );
		CamRot += WeaponBufferRotation;
		CamDir = vector(CamRot);

    	for(i = 0; i < WeakBones.Length; ++i)
    	{
    		TestLoc = KFP.Mesh.GetBoneLocation(WeakBones[i]);
        	if ( !IsAutoTargetWithinCone(TestLoc, CamLoc, CamDir, AutoTargetWeakspotCurve) )
        		continue; // test each weakspot bone

    		HitActor = Pawn.Trace(HitLoc, HitNorm, TestLoc, CamLoc, TRUE, vect(0,0,0), HitInfo, TRACEFLAG_Bullet);
			if( HitActor == none || HitActor == CheckTarget )
			{
				if (bDebugAutoTarget) LogInternal("Targeting P="$CheckTarget@"Bone="$WeakBones[i]);
				outBoneName = WeakBones[i];
				return TestLoc;
			}
   		}

   		for(i = 0; i < NormalBones.Length; ++i)
    	{
    		TestLoc = KFP.Mesh.GetBoneLocation(NormalBones[i]);

    		// No need to bother with cone check, since we're going to return some 
    		// location anyway, use line trace to determine which.
    		HitActor = Pawn.Trace(HitLoc, HitNorm, TestLoc, CamLoc, TRUE, vect(0,0,0), HitInfo, TRACEFLAG_Bullet);
			if( HitActor == none || HitActor == CheckTarget )
			{
				if (bDebugAutoTarget) LogInternal("Targeting P="$CheckTarget@"Bone="$NormalBones[i]);
				outBoneName = NormalBones[i];
				return TestLoc;
			}
   		}
    }

    // Slightly above center
    outBoneName = '';
    return CheckTarget.Location + CheckTarget.BaseEyeHeight * vect(0,0,0.5);
}

/**
 * Returns true if TargetLoc falls within a given view cone
 */
function bool IsAutoTargetWithinCone(vector TargetLoc, vector CamLoc, vector CamDir, const out InterpCurveFloat Curve)
{
	local float		DistToTarget, TargetRadius, TargetHeight;
	local float     DotDiffToTarget;
	local float     UsedTargetAngle;
	local vector 	CamToTarget;
	
	// Figure out the distance from aim to target
    CamToTarget = (TargetLoc - CamLoc);
    if ( VSizeSq(CamToTarget) > Square(Curve.Points[Curve.Points.Length-1].InVal) )
    {
    	if (bDebugAutoTarget) LogInternal("Auto-target Cone Distance Exceeded Dist="$VSize(CamToTarget));
    	return false;
    }

	// Figure out the angle to the target
	DistToTarget = VSize(CamToTarget);
	DotDiffToTarget = Normal(TargetLoc - CamLoc) dot CamDir;
	UsedTargetAngle = EvalInterpCurveFloat(Curve, DistToTarget);

	if( bDebugAutoTarget )
	{
		// Grab collision info from target
		CurrentAutoTarget.GetBoundingCylinder( TargetRadius, TargetHeight );

		DrawDebugCylinder(AutoTargetInitialLocation+vect(0,0,5), AutoTargetInitialLocation-vect(0,0,5), 10, 12, 255, 0, 0);
        DrawDebugCylinder(CurrentAutoTarget.Location+vect(0,0,1)*TargetHeight, CurrentAutoTarget.Location-vect(0,0,1)*TargetHeight, TargetRadius, 12, 0, 255, 0);

        //`log(GetFuncName()@"DotDiffToTarget = "$DotDiffToTarget$"  AutoTargetAngle = "$UsedTargetAngle);
	}

	// Make sure the target is in front of us and close enough
	if( UsedTargetAngle > DotDiffToTarget )
	{
		if (bDebugAutoTarget) LogInternal("Auto-target Cone Angle Exceeded by "$UsedTargetAngle - DotDiffToTarget);
		return false;
	}

    return true;
}

/**
 * This will attempt to auto aim at the target.  It will forcibly aim the player at the target.
 *
 **/
function ApplyAutoTarget( float DeltaTime, KFWeapon W, out int out_YawRot, out int out_PitchRot )
{
	local Vector	RealTargetLoc,  CamLoc, CamDir;
	local Rotator	CamRot, DeltaRot, RotToTarget;
	local int		AdjustY, AdjustZ;
	local float     BlendTimeToGo;

	BlendTimeToGo = AutoTargetTimeLeft;
    AutoTargetTimeLeft -= DeltaTime;

	if( !bUsingGamepad || CurrentAutoTarget == None || AutoTargetTimeLeft <= 0 )
	{
		return;
	}

	// If the target is still alive and has its head
	if( CurrentAutoTarget != none && CurrentAutoTarget.Health > 0 &&
        (KFPawn_Monster(CurrentAutoTarget) == none || !KFPawn_Monster(CurrentAutoTarget).bIsHeadless) )
	{
		RealTargetLoc = AutoTargetInitialLocation;

		// If the target supplied a bone name, try to follow it
		if ( CurrentAutoTargetBone != '' )
		{
			RealTargetLoc = CurrentAutoTarget.Mesh.GetBoneLocation(CurrentAutoTargetBone);
		}

        // cone setup
    	GetPlayerViewPoint( CamLoc, CamRot );
		CamRot += WeaponBufferRotation;
		CamDir = vector(CamRot);

		// Make sure the target is still front of us and close enough
		if ( !IsAutoTargetWithinCone(RealTargetLoc, CamLoc, CamDir, AutoTargetAngleCurve) )
		{
			if (bDebugAutoTarget) LogInternal("ApplyAutoTarget target lost"@CurrentAutoTarget);
			return;
		}

		RotToTarget     = Rotator(RealTargetLoc - CamLoc);
		DeltaRot.Yaw	= RotToTarget.Yaw	- CamRot.Yaw;
		DeltaRot.Pitch	= RotToTarget.Pitch	- CamRot.Pitch;
		DeltaRot = Normalize( DeltaRot );

		// Lateral adhesion
		if(	DeltaRot.Yaw != 0 )
		{
			// Amount we want to change by.
			if ( BlendTimeToGo > DeltaTime )
			{
				AdjustY = (DeltaRot.Yaw / BlendTimeToGo) * DeltaTime;
			}
			else
			{
				AdjustY = DeltaRot.Yaw;
			}

			// Apply the adhesion
			out_YawRot += AdjustY;
		}

		// Vertical adhesion
		if( DeltaRot.Pitch != 0 )
		{
			// Amount we want to change by.
			if ( BlendTimeToGo > DeltaTime )
			{
				AdjustZ = (DeltaRot.Pitch / BlendTimeToGo) * DeltaTime;
			}
			else
			{
				AdjustZ = DeltaRot.Pitch;
			}

			// Apply the adhesion
			out_PitchRot += AdjustZ;
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
	    // Get the location from the pawn we're targeting if we can
        RealTargetLoc = ForceLookAtPawn.GetAutoLookAtLocation(CamLoc, Pawn);

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

/** Returns true if our local player pawn is currently sprinting */
function bool IsPawnSprinting()
{
	if ( Pawn == None )
	{
		return FALSE;
	}

	// Check bRun first as an early out, but we should cast the KFP to make sure
	return (bRun > 0 && KFPawn(Pawn).bIsSprinting);
}

/**
 * This will attempt to keep the player aiming at the target.  It will forcibly aim the player at the target.
 *
 * TODO:  move this to c++
 **/
function ApplyTargetAdhesion( float DeltaTime, KFWeapon W, out int out_YawRot, out int out_PitchRot )
{
	local Vector	CamLoc, X, Y, Z;
	local Rotator	CamRot;
	local float		DistToTarget, TargetRadius, TargetHeight, AdhesionScale;
	local Pawn		AdhesionTarget;
	local vector 	AdhesionTargetVel, AdhesionPawnVel, AdhesionTargetRelVel, AdhesionViewOffset;

	// No adhesion without a gamepad!
    if ( !bUsingGamepad )
	{
		return;
	}

	if( W == None || !W.bTargetAdhesionEnabled )
	{
		return;
	}

	if( IsPawnSprinting() )
	{
		// keep track of player location either way
		AdhesionPawnLastLoc = Pawn.Location;
		LastAdhesionTarget = none;
		return;
	}

    GetPlayerViewPoint( CamLoc, CamRot );
	GetAxes( CamRot, X, Y, Z );

	// attempt to use the friction target if available
	AdhesionTarget = LastFrictionTarget;
	if( AdhesionTarget == None )
	{
		// otherwise look for a new target
		AdhesionTarget = GetTargetAdhesionFrictionTarget( W.TargetAdhesionDistanceMax, CamLoc, CamRot, AdhesionAngleCurve );
	}

	if( AdhesionTarget == none )
	{
		// keep track of player location either way
		AdhesionPawnLastLoc = Pawn.Location;
		LastAdhesionTarget = none;
		return;
	}

	if( AdhesionTarget.Health > 0 && KFPawn_Monster(AdhesionTarget) != none && !KFPawn_Monster(AdhesionTarget).bIsHeadless )
	{
		// Get yaw and pitch view offset from adhesiontarget
		GetAimAssistViewOffsetFromTarget(CamLoc, CamRot, AdhesionTarget, AdhesionViewOffset, DistToTarget);

		AdhesionTarget.GetBoundingCylinder( TargetRadius, TargetHeight );

		// If the player's view is "on" the target, apply adhesion.
		// Adhesion gently rotates the player away from the relative velocity direction of player and target
		if( AdhesionViewOffset.Y <= TargetRadius && AdhesionViewOffset.Z <= TargetHeight )
		{
			// Get target's velocity based on current and previous position (Velocity Actor member variable doesn't include Z). If current target is a new target, use 0 velocity
			AdhesionTargetVel = (AdhesionTarget != LastAdhesionTarget) ? vect(0,0,0) : ((AdhesionTarget.Location - AdhesionTargetLastLoc) / DeltaTime);

			// Get player's velocity based on current and previous position
			AdhesionPawnVel = IsZero(AdhesionPawnLastLoc) ? vect(0,0,0) : ((Pawn.Location - AdhesionPawnLastLoc) / DeltaTime);

			// re-add a percentage of the speed taken away due to "walking" (iron sights)
			if( Pawn != none && Pawn.bIsWalking )
			{
				AdhesionPawnVel.X = Lerp(AdhesionPawnVel.X, AdhesionPawnVel.X / Pawn.WalkingPct, 0.20f);
				AdhesionPawnVel.Y = Lerp(AdhesionPawnVel.Y, AdhesionPawnVel.Y / Pawn.WalkingPct, 0.20f);
			}

			// Calculate relative velocity between player and target and scale by distance scale curve
			AdhesionTargetRelVel = (AdhesionTargetVel - AdhesionPawnVel) * EvalInterpCurveFloat(W.TargetAdhesionDistanceScaleCurve, DistToTarget / W.TargetAdhesionDistanceMax);

			AdhesionScale = AdhesionFactor * DeltaTime;

			// Delta rotation is based on velocity, distance, and angle to target
			out_YawRot += (AdhesionTargetRelVel Dot Y) * AdhesionScale * EvalInterpCurveFloat(W.TargetAdhesionOffsetScaleCurve, AdhesionViewOffset.Y / TargetRadius);
			out_PitchRot += (AdhesionTargetRelVel Dot Z) * AdhesionScale * EvalInterpCurveFloat(W.TargetAdhesionOffsetScaleCurve, AdhesionViewOffset.Z / TargetHeight);
		}
	}

	// keep track of player and target locations
	AdhesionTargetLastLoc = AdhesionTarget.Location;
	AdhesionPawnLastLoc = Pawn.Location;

	LastAdhesionTarget = AdhesionTarget;
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
	local Vector CamLoc, X, Y, Z, FrictionViewOffset;
 	local Rotator CamRot;
 	local float DistToTarget, TargetRadius, TargetHeight, FrictionMultiplier;

	if( Pawn == None || !W.bTargetFrictionEnabled || IsPawnSprinting() )
	{
		//`log( "ApplyTargetFriction returning: W.bTargetFrictionEnabled: " $ W.bTargetFrictionEnabled $ " Pawn: " $ Pawn $ " W: " $ W );
		return;
	}

    GetPlayerViewPoint( CamLoc, CamRot );
	GetAxes( CamRot, X, Y, Z );

	// Look for a friction target
	FrictionTarget = GetTargetAdhesionFrictionTarget( W.TargetFrictionDistanceMax, CamLoc, CamRot, FrictionAngleCurve );

	if( FrictionTarget != none )
	{
		// Get yaw and pitch view offset from FrictionTarget
		GetAimAssistViewOffsetFromTarget(CamLoc, CamRot, FrictionTarget, FrictionViewOffset, DistToTarget);

		FrictionTarget.GetBoundingCylinder( TargetRadius, TargetHeight );

		// If the player's view is "on" the target, apply friction.
		// Friction slows the player's rotation when player's view is "on" the target
		if( FrictionViewOffset.Y <= TargetRadius && FrictionViewOffset.Z <= TargetHeight )
		{
			FrictionMultiplier = FrictionScale;

			// scale friction by distance and yaw offset to target
			FrictionMultiplier *= EvalInterpCurveFloat(W.TargetFrictionDistanceScaleCurve, DistToTarget / W.TargetFrictionDistanceMax);
			FrictionMultiplier *= EvalInterpCurveFloat(W.TargetFrictionOffsetScaleCurve, FrictionViewOffset.Y / TargetRadius);

			// reduce friction if player is currently using view acceleration (turn assist)
			if( ApplyingViewAcceleration() )
			{
				FrictionMultiplier *= ViewAccelerationFrictionScale;
			}

			// Apply the friction
			CurrTurn *= 1.f - FrictionMultiplier;
			CurrLookUp *= 1.f - FrictionMultiplier;

			// Keep the friction target for possible use with adhesion
			LastFrictionTargetTime	= WorldInfo.TimeSeconds;
			LastFrictionTarget		= FrictionTarget;
		}
	}
}

/** Returns yaw and pitch offsets for a given location/orientation to a given actor's location. Also can return distance. */
function GetAimAssistViewOffsetFromTarget( vector ViewLoc, rotator ViewRot, Actor Target, out vector Offset, optional out float Distance )
{
	local Vector	TargetLoc, CamToTarget, AimLoc;

	CamToTarget = Target.Location - ViewLoc;
	Distance = VSize(CamToTarget);
	AimLoc = ViewLoc + vector(ViewRot) * Distance;

	// Calculate the aim friction multiplier
	// Y component
	TargetLoc	 = Target.Location;
	TargetLoc.Z  = AimLoc.Z;
	Offset.Y = PointDistToLine( AimLoc, (TargetLoc - ViewLoc), ViewLoc );

	// Z component
	TargetLoc	 = Target.Location;
	TargetLoc.X  = AimLoc.X;
	TargetLoc.Y  = AimLoc.Y;
	Offset.Z = PointDistToLine( AimLoc, (TargetLoc - ViewLoc), ViewLoc );
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
            FOVScale = UsedFOVAngle * 0.01333 * GamepadZoomedSensitivityScale; // 0.01333 = 1 / 75.0 - the default FOV
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

function bool IsAimAssistFrictionEnabled()
{
	return bAimAssistEnabled && bTargetFrictionEnabled;
}

function bool IsAimAssistAdhesionEnabled()
{
	return bAimAssistEnabled && bTargetAdhesionEnabled;	
}

function bool IsAimAssistAutoTargetEnabled()
{
	return bAimAssistEnabled && bAutoTargetEnabled;
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
   bShowGamepadWeaponSelectHint=True
   bAimAssistEnabled=True
   bViewSmoothingEnabled=True
   bViewAccelerationEnabled=True
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   bAutoTargetEnabled=True
   bForceFeedbackEnabled=True
   GamepadButtonHoldTime=0.250000
   SprintAnalogThreshold=0.600000
   LookSensitivityScaleCurve=(Points=((ArriveTangent=0.500000,LeaveTangent=0.500000,InterpMode=CIM_CurveAuto),(InVal=0.800000,OutVal=0.600000,ArriveTangent=2.000000,LeaveTangent=2.000000,InterpMode=CIM_CurveAuto),(InVal=1.000000,OutVal=1.300000,ArriveTangent=8.000000,LeaveTangent=8.000000,InterpMode=CIM_CurveAuto)))
   MoveSensitivityScaleCurve=(Points=((OutVal=0.300000,InterpMode=CIM_Constant),(InVal=0.300000,OutVal=0.300000),(InVal=0.900000,OutVal=1.000000)))
   GamepadSensitivityScale=1.000000
   SprintingSensitivityScale=0.675000
   ZoomedSensitivityScale=0.350000
   GamepadZoomedSensitivityScale=0.650000
   ViewSmoothing_MaxAccel=25.000000
   ViewSmoothing_MaxDecel=50.000000
   ViewAccel_JoyMagThreshold=0.970000
   ViewAccel_JoyPitchThreshold=0.400000
   ViewAccel_MaxTurnSpeed=2.400000
   ViewAccel_BlendTime=0.250000
   FrictionScale=0.500000
   FrictionAngleCurve=(Points=(,(InVal=2500.000000)))
   ViewAccelerationFrictionScale=0.850000
   AdhesionAngleCurve=(Points=((OutVal=0.950000),(InVal=2000.000000,OutVal=0.980000)))
   AdhesionFactor=16.000000
   AutoTargetTimeLeft=0.100000
   AutoTargetAngleCurve=(Points=((OutVal=0.939700),(InVal=1500.000000,OutVal=0.984800),(InVal=6000.000000,OutVal=1.000000)))
   AutoTargetWeakspotCurve=(Points=((OutVal=0.996200),(InVal=1000.000000,OutVal=0.999400),(InVal=2000.000000,OutVal=1.000000)))
   AutoTargetCooldown=0.500000
   ForceLookAtPawnMinAngle=0.900000
   ForceLookAtPawnRotationRate=22.000000
   ForceLookAtPawnDampenedRotationRate=8.000000
   DoubleTapDelay=0.250000
   bEnableFOVScaling=True
   Name="Default__KFPlayerInput"
   ObjectArchetype=MobilePlayerInput'GameFramework.Default__MobilePlayerInput'
}
