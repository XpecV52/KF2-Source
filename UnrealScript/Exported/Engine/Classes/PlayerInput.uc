//=============================================================================
// PlayerInput
// Object within playercontroller that manages player input.
// only spawned on client
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class PlayerInput extends Input within PlayerController
	config(Input)
	transient
	native(UserInterface);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Player is giving input through a gamepad */
var	const bool	bUsingGamepad;
var const Name	LastAxisKeyName;

var globalconfig	bool		bInvertMouse;							/** if true, mouse y axis is inverted from normal FPS mode */
var globalconfig	bool		bInvertTurn;							/** if true, mouse x axis is inverted from normal FPS mode */

// Double click move flags
var					bool		bWasForward;
var					bool		bWasBack;
var					bool		bWasLeft;
var					bool		bWasRight;
var					bool		bEdgeForward;
var					bool		bEdgeBack;
var					bool		bEdgeLeft;
var					bool 		bEdgeRight;

var					float		DoubleClickTimer;						/** max double click interval for double click move */
var globalconfig	float		DoubleClickTime;						/** stores time of first click for potential double click */

var globalconfig	float		MouseSensitivity;

// Input axes.
var input			float		aBaseX;
var input			float		aBaseY;
var input			float		aBaseZ;
var input			float		aMouseX;
var input			float		aMouseY;
var input			float		aForward;
var input			float		aTurn;
var input			float		aStrafe;
var input			float		aUp;
var input			float		aLookUp;

// analog trigger axes
var input			float		aRightAnalogTrigger;
var input			float		aLeftAnalogTrigger;

// PS3 SIXAXIS axes
var input			float		aPS3AccelX;
var input			float		aPS3AccelY;
var input			float		aPS3AccelZ;
var input			float		aPS3Gyro;

// WiiU IR Pointer
var input			float		aWiiUPointerX;
var input			float		aWiiUPointerY;


// device tilt - NOTE: These are set directly, they DO NOT go through the .ini Bindings
var	input			vector		aTilt;
var	input			vector		aRotationRate;
var	input			vector		aGravity;
var input			vector		aAcceleration;
// touch locations, the Z component is > 0 if the touch is currently held down
var	input			vector		aTouch[5];
var	input			vector		aBackTouch[5];

//
// Joy Raw Input
//
/** Joypad left thumbstick, vertical axis. Range [-1,+1] */
var		transient	float	RawJoyUp;
/** Joypad left thumbstick, horizontal axis. Range [-1,+1] */
var		transient	float	RawJoyRight;
/** Joypad right thumbstick, horizontal axis. Range [-1,+1] */
var		transient	float	RawJoyLookRight;
/** Joypad right thumbstick, vertical axis. Range [-1,+1] */
var		transient	float	RawJoyLookUp;

/** move forward speed scaling */
var()	config		float	MoveForwardSpeed;
/** strafe speed scaling */
var()	config		float	MoveStrafeSpeed;
/** Yaw turn speed scaling */
var()	config		float	LookRightScale;
/** pitch turn speed scaling */
var()	config		float	LookUpScale;


// Input buttons.
var input			byte		bStrafe;
var input			byte		bXAxis;
var input			byte		bYAxis;

// Mouse smoothing control
var globalconfig bool		bEnableMouseSmoothing;			/** if true, mouse smoothing is enabled */

// Zoom Scaling
var bool bEnableFOVScaling;

// Mouse smoothing sample data
var float ZeroTime[2];							/** How long received mouse movement has been zero. */
var float SmoothedMouse[2];						/** Current average mouse movement/sample */
var int MouseSamples;							/** Number of mouse samples since mouse movement has been zero */
var float  MouseSamplingTotal;					/** DirectInput's mouse sampling total time */

/** If TRUE turn input will be ignored until the stick is released */
var transient bool bLockTurnUntilRelease;
/** Time remaining to disable bLockTurnUntilRelease */
var transient float AutoUnlockTurnTime;

/** 
 * Function to cancel all mobile input before a Scaleform movie confuses the state
 */
native function CancelMobileInput();

//=============================================================================
// Input related functions.

exec function bool InvertMouse()
{
	bInvertMouse = !bInvertMouse;
	SaveConfig();
	return bInvertMouse;
}

exec function bool InvertTurn()
{
	bInvertTurn = !bInvertTurn;
	SaveConfig();
	return bInvertTurn;
}

exec function SetSensitivity(Float F)
{
	MouseSensitivity = F;
}

/** Hook called from HUD actor. Gives access to HUD and Canvas */
function DrawHUD( HUD H );

function PreProcessInput(float DeltaTime);
function PostProcessInput(float DeltaTime);

function AdjustMouseSensitivity(float FOVScale)
{
	// Apply mouse sensitivity.
	aMouseX			*= MouseSensitivity * FOVScale;
	aMouseY			*= MouseSensitivity * FOVScale;
}

// Postprocess the player's input.
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

	// Take FOV into account (lower FOV == less sensitivity).

	if ( bEnableFOVScaling )
	{
		FOVScale = GetFOVAngle() * 0.01111; // 0.01111 = 1 / 90.0
	}
	else
	{
		FOVScale = 1.0;
	}

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
	if (bInvertMouse)
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
}

function CatchDoubleClickInput()
{
	if (!IsMoveInputIgnored())
	{
		bEdgeForward	= (bWasForward	^^ (aBaseY	> 0));
		bEdgeBack		= (bWasBack		^^ (aBaseY	< 0));
		bEdgeLeft		= (bWasLeft		^^ (aStrafe < 0));
		bEdgeRight		= (bWasRight	^^ (aStrafe > 0));
		bWasForward		= (aBaseY	> 0);
		bWasBack		= (aBaseY	< 0);
		bWasLeft		= (aStrafe	< 0);
		bWasRight		= (aStrafe	> 0);
	}
}

// check for double click move
function Actor.EDoubleClickDir CheckForDoubleClickMove(float DeltaTime)
{
	local Actor.EDoubleClickDir DoubleClickMove, OldDoubleClick;

	if ( DoubleClickDir == DCLICK_Active )
		DoubleClickMove = DCLICK_Active;
	else
		DoubleClickMove = DCLICK_None;
	if (DoubleClickTime > 0.0)
	{
		if ( DoubleClickDir == DCLICK_Active )
		{
			if ( (Pawn != None) && (Pawn.Physics == PHYS_Walking) )
			{
				DoubleClickTimer = 0;
				DoubleClickDir = DCLICK_Done;
			}
		}
		else if ( DoubleClickDir != DCLICK_Done )
		{
			OldDoubleClick = DoubleClickDir;
			DoubleClickDir = DCLICK_None;

			if (bEdgeForward && bWasForward)
				DoubleClickDir = DCLICK_Forward;
			else if (bEdgeBack && bWasBack)
				DoubleClickDir = DCLICK_Back;
			else if (bEdgeLeft && bWasLeft)
				DoubleClickDir = DCLICK_Left;
			else if (bEdgeRight && bWasRight)
				DoubleClickDir = DCLICK_Right;

			if ( DoubleClickDir == DCLICK_None)
				DoubleClickDir = OldDoubleClick;
			else if ( DoubleClickDir != OldDoubleClick )
				DoubleClickTimer = DoubleClickTime + 0.5 * DeltaTime;
			else
				DoubleClickMove = DoubleClickDir;
		}

		if (DoubleClickDir == DCLICK_Done)
		{
			DoubleClickTimer = FMin(DoubleClickTimer-DeltaTime,0);
			if (DoubleClickTimer < -0.35)
			{
				DoubleClickDir = DCLICK_None;
				DoubleClickTimer = DoubleClickTime;
			}
		}
		else if ((DoubleClickDir != DCLICK_None) && (DoubleClickDir != DCLICK_Active))
		{
			DoubleClickTimer -= DeltaTime;
			if (DoubleClickTimer < 0)
			{
				DoubleClickDir = DCLICK_None;
				DoubleClickTimer = DoubleClickTime;
			}
		}
	}
	return DoubleClickMove;
}

/**
 * Iterates through all InputRequests on the PlayerController and
 * checks to see if a new input has been matched, or if the entire
 * match sequence should be reset.
 *
 * @param	DeltaTime - time since last tick
 */
final function ProcessInputMatching(float DeltaTime)
{
	local float Value;
	local int i,MatchIdx;
	local bool bMatch;
	// iterate through each request,
	for (i = 0; i < InputRequests.Length; i++)
	{
		// if we have a valid match idx
		if (InputRequests[i].MatchIdx >= 0 &&
			InputRequests[i].MatchIdx < InputRequests[i].Inputs.Length)
		{
			if (InputRequests[i].MatchActor == None)
			{
				InputRequests[i].MatchActor = Outer;
			}
			MatchIdx = InputRequests[i].MatchIdx;
			// if we've exceeded the delta,
			// ignore the delta for the first match
			if (MatchIdx != 0 &&
				InputRequests[i].Inputs[MatchIdx].TimeDelta > 0.f && 
				WorldInfo.TimeSeconds - InputRequests[i].LastMatchTime >= InputRequests[i].Inputs[MatchIdx].TimeDelta)
			{
				// reset this match
				InputRequests[i].LastMatchTime = 0.f;
				InputRequests[i].MatchIdx = 0;

				// fire off the cancel event
				if (InputRequests[i].FailedFuncName != 'None')
				{
					InputRequests[i].MatchActor.SetTimer(0.01f, false, InputRequests[i].FailedFuncName );
				}
			}
			else
			{
				// grab the current input value of the matching type
				Value = 0.f;
				switch (InputRequests[i].Inputs[MatchIdx].Type)
				{
				case IT_XAxis:
					Value = aStrafe;
					break;
				case IT_YAxis:
					Value = aBaseY;
					break;
				}
				// check to see if this matches
				switch (InputRequests[i].Inputs[MatchIdx].Action)
				{
				case IMA_GreaterThan:
					bMatch = Value >= InputRequests[i].Inputs[MatchIdx].Value;
					break;
				case IMA_LessThan:
					bMatch = Value <= InputRequests[i].Inputs[MatchIdx].Value;
					break;
				}
				if (bMatch)
				{
					// mark it as matched
					InputRequests[i].LastMatchTime = WorldInfo.TimeSeconds;
					InputRequests[i].MatchIdx++;
					// check to see if we've matched all inputs
					if (InputRequests[i].MatchIdx >= InputRequests[i].Inputs.Length)
					{
						if (InputRequests[i].MatchDelegate != None)
						{
							InputMatchDelegate = InputRequests[i].MatchDelegate;
							InputMatchDelegate();
						}
						// fire off the event
						if (InputRequests[i].MatchFuncName != 'None')
						{
							InputRequests[i].MatchActor.SetTimer(0.01f,false,InputRequests[i].MatchFuncName);
						}
						// reset this match
						InputRequests[i].LastMatchTime = 0.f;
						InputRequests[i].MatchIdx = 0;
						// as well as all others
					}
				}
			}
		}
	}
}

//*************************************************************************************
// Normal gameplay execs
// Type the name of the exec function at the console to execute it

exec function Jump()
{
	if ( WorldInfo.Pauser == PlayerReplicationInfo )
		SetPause( False );
	else
		bPressedJump = true;
}

exec function SmartJump()
{
	Jump();
}

//*************************************************************************************
// Mouse smoothing

exec function ClearSmoothing()
{
	local int i;

	for ( i=0; i<2; i++ )
	{
		//`Log(i$" zerotime "$zerotime[i]$" smoothedmouse "$SmoothedMouse[i]);
		ZeroTime[i] = 0;
		SmoothedMouse[i] = 0;
	}
	//`Log("MouseSamplingTotal "$MouseSamplingTotal$" MouseSamples "$MouseSamples);
    	MouseSamplingTotal = Default.MouseSamplingTotal;
	MouseSamples = Default.MouseSamples;
}

/** SmoothMouse()
Smooth mouse movement, because mouse sampling doesn't match up with tick time.
 * @note: if we got sample event for zero mouse samples (so we
			didn't have to guess whether a 0 was caused by no sample occuring during the tick (at high frame rates) or because the mouse actually stopped)
 * @param: aMouse is the mouse axis movement received from DirectInput
 * @param: DeltaTime is the tick time
 * @param: SampleCount is the number of mouse samples received from DirectInput
 * @param: Index is 0 for X axis, 1 for Y axis
 * @return the smoothed mouse axis movement
 */
function float SmoothMouse(float aMouse, float DeltaTime, out byte SampleCount, int Index)
{
	local float MouseSamplingTime;

	if (DeltaTime < 0.25)
	{
		MouseSamplingTime = MouseSamplingTotal/MouseSamples;

		if ( aMouse == 0 )
		{
			// no mouse movement received
			ZeroTime[Index] += DeltaTime;
			if ( ZeroTime[Index] < MouseSamplingTime )
			{
				// zero mouse movement is possibly because less than the mouse sampling interval has passed
				aMouse = SmoothedMouse[Index] * DeltaTime/MouseSamplingTime;
			}
			else
			{
				SmoothedMouse[Index] = 0;
			}
		}
		else
		{
			ZeroTime[Index] = 0;
			if ( SmoothedMouse[Index] != 0 )
			{
				// this isn't the first tick with non-zero mouse movement
				if ( DeltaTime < MouseSamplingTime * (SampleCount + 1) )
				{
					// smooth mouse movement so samples/tick is constant
					aMouse = aMouse * DeltaTime/(MouseSamplingTime * SampleCount);
				}
				else
				{
					// fewer samples, so going slow
					// use number of samples we should have had for sample count
					SampleCount = DeltaTime/MouseSamplingTime;
				}
			}
			SmoothedMouse[Index] = aMouse/SampleCount;
		}
	}
	else
	{
		// if we had an abnormally long frame, clear everything so it doesn't distort the results
		ClearSmoothing();
	}
	SampleCount = 0;
	return aMouse;
}

/**
 * The player controller will call this function directly after creating the input system
 */
native function InitInputSystem();

/**
 * Called via replication to tell the Client to Init it's input system                                                                     
 */
function ClientInitInputSystem();

/**
 * The player controll will call this function directly before traveling                                                                     
 */

function PreClientTravel( string PendingURL, ETravelType TravelType, bool bIsSeamlessTravel)
{
}

defaultproperties
{
   bEnableMouseSmoothing=True
   DoubleClickTime=0.250000
   MouseSensitivity=30.000000
   MoveForwardSpeed=1200.000000
   MoveStrafeSpeed=1200.000000
   LookRightScale=300.000000
   LookUpScale=-250.000000
   MouseSamples=1
   MouseSamplingTotal=0.008300
   Bindings(0)=(Name="Duck",Command="Button bDuck | Axis aUp Speed=-1.0  AbsoluteAxis=100")
   Bindings(1)=(Name="Look",Command="Button bLook")
   Bindings(2)=(Name="Pause",Command="Pause")
   Bindings(3)=(Name="LookToggle",Command="Toggle bLook")
   Bindings(4)=(Name="LookUp",Command="Axis aLookUp Speed=+25.0 AbsoluteAxis=100")
   Bindings(5)=(Name="LookDown",Command="Axis aLookUp Speed=-25.0 AbsoluteAxis=100")
   Bindings(6)=(Name="CenterView",Command="Button bSnapLevel")
   Bindings(7)=(Name="Walking",Command="Button bRun")
   Bindings(8)=(Name="Strafe",Command="Button bStrafe")
   Bindings(9)=(Name="NextWeapon",Command="NextWeapon")
   Bindings(10)=(Name="ViewTeam",Command="ViewClass Pawn")
   Bindings(11)=(Name="TurnToNearest",Command="Button bTurnToNearest")
   Bindings(12)=(Name="Turn180",Command="Button bTurn180")
   Bindings(13)=(Name="MouseX",Command="Count bXAxis | Axis aMouseX")
   Bindings(14)=(Name="MouseY",Command="Count bYAxis | Axis aMouseY")
   Bindings(15)=(Name="MouseScrollUp",Command="PrevWeapon")
   Bindings(16)=(Name="MouseScrollDown",Command="NextWeapon")
   Bindings(17)=(Name="C",Command="DoDuck")
   Bindings(18)=(Name="P",Command="TogglePhysicsMode")
   Bindings(19)=(Name="B",Command="ToggleSpeaking true | OnRelease ToggleSpeaking false")
   Bindings(20)=(Name="T",Command="Talk")
   Bindings(21)=(Name="F1",Command="ShowMouseCursor",Shift=True)
   Bindings(22)=(Name="F1",Command="viewmode wireframe",bIgnoreShift=True)
   Bindings(23)=(Name="F2",Command="viewmode unlit")
   Bindings(24)=(Name="F7",Command="OPENKISMETDEBUGGER SEQUENCE=PAUSEKISMETDEBUGGER",Alt=True)
   Bindings(25)=(Name="F9",Command="shot")
   Bindings(26)=(Name="Period",Command="RECOMPILESHADERS CHANGED",Control=True,Shift=True)
   Bindings(27)=(Name="Delete",Command="Camera Default")
   Bindings(28)=(Name="End",Command="Camera FirstPerson")
   Bindings(29)=(Name="XboxTypeS_X",Command="Use")
   Bindings(30)=(Name="XboxTypeS_A",Command="Jump")
   Bindings(31)=(Name="XboxTypeS_B",Command="ChangePosture")
   Bindings(32)=(Name="XboxTypeS_LeftTriggerAxis",Command="Axis aLeftAnalogTrigger Speed=1.0 DeadZone=0.11")
   Bindings(33)=(Name="XboxTypeS_RightTriggerAxis",Command="Axis aRightAnalogTrigger Speed=1.0 DeadZone=0.11")
   Bindings(34)=(Name="MOBILE_StopMatinee",Command="ce stopmatinee | OnRelease StopUseAttractModeInputConfig")
   Bindings(35)=(Name="MOBILE_StartMatinee",Command="ce playmatinee | OnRelease StartUseAttractModeInputConfig")
   Bindings(36)=(Name="MOBILE_NextConfig",Command="OnRelease NextMobileInputConfig")
   Bindings(37)=(Name="MOBILE_CalibrateTilt",Command="CalibrateTilt")
   Bindings(38)=(Name="MOBILE_ATurn",Command="Axis aTurn DeadZone=0.05")
   Bindings(39)=(Name="MOBILE_ALookup",Command="Axis aLookup Speed=-1 DeadZone=0.05")
   Bindings(40)=(Name="MOBILE_AStrafe",Command="Axis aStrafe DeadZone=0.15")
   Bindings(41)=(Name="MOBILE_AForward",Command="Axis aBaseY DeadZone=0.15")
   Bindings(42)=(Name="MOBILE_Fire",Command="StartFire | OnRelease StopFire")
   Bindings(43)=(Name="MOBILE_NextWeapon",Command="NextWeapon")
   Bindings(44)=(Name="MOBILE_Jump",Command="Jump")
   Bindings(45)=(Name="MOBILE_ToggleFPS",Command="OnRelease stat fps")
   Bindings(46)=(Name="NumPadThree",Command="MOBILE_IncrementTrackedPrimitive 1")
   Bindings(47)=(Name="WiiU_PointerX",Command="Axis aWiiUPointerX Speed=1.0")
   Bindings(48)=(Name="WiiU_PointerY",Command="Axis aWiiUPointerY Speed=1.0")
   Bindings(49)=(Name="R",Command="STARTMOVIECAPTURE",Alt=True)
   Bindings(50)=(Name="R",Command="STOPMOVIECAPTURE",Shift=True)
   Bindings(51)=(Name="GBA_MoveForward",Command="Axis aBaseY Speed=1.0")
   Bindings(52)=(Name="GBA_Backward",Command="Axis aBaseY Speed=-1.0")
   Bindings(53)=(Name="GBA_StrafeLeft",Command="Axis aStrafe Speed=-1.0")
   Bindings(54)=(Name="GBA_StrafeRight",Command="Axis aStrafe Speed=+1.0")
   Bindings(55)=(Name="GBA_TurnLeft",Command="Axis aBaseX Speed=-200.0 AbsoluteAxis=100")
   Bindings(56)=(Name="GBA_TurnRight",Command="Axis aBaseX  Speed=+200.0 AbsoluteAxis=100")
   Bindings(57)=(Name="GBA_LookUp",Command="Axis aLookup Speed=-.1 AbsoluteAxis=100")
   Bindings(58)=(Name="GBA_LookDown",Command="Axis aLookup  Speed=+.1 AbsoluteAxis=100")
   Bindings(59)=(Name="GBA_Jump",Command="Jump | Axis aUp Speed=+1.0 AbsoluteAxis=100")
   Bindings(60)=(Name="GBA_CrouchToggle",Command="ToggleCrouch")
   Bindings(61)=(Name="GBA_CrouchHold",Command="StartCrouch | onrelease StopCrouch")
   Bindings(62)=(Name="GBA_Sprint",Command="Button bRun")
   Bindings(63)=(Name="GBA_SprintAndCrouch",Command="GamepadSprint | onrelease GamepadSprintRelease")
   Bindings(64)=(Name="GBA_Fire",Command="CustomStartFire 0 | OnRelease CustomStopFire 0")
   Bindings(65)=(Name="SpectatePrevPlayer",Command="SpectatePreviousPlayer")
   Bindings(66)=(Name="SpectateNextPlayer",Command="SpectateNextPlayer")
   Bindings(67)=(Name="SpectateChangeCamMode",Command="SpectateChangeCamMode")
   Bindings(68)=(Name="GBA_AltFire",Command="CustomStartFire 1 | OnRelease CustomStopFire 1")
   Bindings(69)=(Name="GBA_TertiaryFire",Command="CustomStartFire 3 | OnRelease CustomStopFire 3")
   Bindings(70)=(Name="GBA_SwitchFireMode",Command="SwitchFire | OnRelease SwitchFireRelease")
   Bindings(71)=(Name="GBA_IronsightsToggle",Command="Ironsights | OnRelease IronsightsRelease")
   Bindings(72)=(Name="GBA_IronsightsHold",Command="Ironsights 1 | OnRelease IronsightsRelease 1")
   Bindings(73)=(Name="GBA_Reload",Command="CustomStartFire 2 | OnRelease CustomStopFire 2")
   Bindings(74)=(Name="GBA_Grenade",Command="CustomStartFire 4 | OnRelease CustomStopFire 4")
   Bindings(75)=(Name="GBA_ToggleFlashlight",Command="ToggleFlashlight | OnRelease FlashlightRelease")
   Bindings(76)=(Name="GBA_QuickHeal",Command="QuickHeal")
   Bindings(77)=(Name="GBA_Use",Command="Interact | OnRelease InteractRelease")
   Bindings(78)=(Name="GBA_PrevWeapon",Command="SelectPrevWeapon")
   Bindings(79)=(Name="GBA_NextWeapon",Command="SelectNextWeapon")
   Bindings(80)=(Name="GBA_LastWeapon",Command="SelectLastWeapon")
   Bindings(81)=(Name="GBA_SwitchWeapon1",Command="SwitchWeaponGroup 0")
   Bindings(82)=(Name="GBA_SwitchWeapon2",Command="SwitchWeaponGroup 1")
   Bindings(83)=(Name="GBA_SwitchWeapon3",Command="SwitchWeaponGroup 2")
   Bindings(84)=(Name="GBA_SwitchWeapon4",Command="SwitchWeaponGroup 3")
   Bindings(85)=(Name="GBA_DropWeapon",Command="ThrowWeapon")
   Bindings(86)=(Name="GBA_Talk",Command="talk")
   Bindings(87)=(Name="GBA_TeamTalk",Command="teamtalk")
   Bindings(88)=(Name="GBA_ShowMenu",Command="CloseEditorViewport | onrelease ShowMenu")
   Bindings(89)=(Name="GBA_ShowScores",Command="SetShowScores true | Onrelease SetShowScores false")
   Bindings(90)=(Name="GBA_TossMoney",Command="TossMoney")
   Bindings(91)=(Name="GBA_VoiceChat",Command="StartVoiceChat false | OnRelease StopVoiceChat")
   Bindings(92)=(Name="GBA_ShowVoiceComms",Command="ShowVoiceComms | OnRelease HideVoiceComms")
   Bindings(93)=(Name="GBA_VoteYes",Command="OnVoteYesPressed | OnRelease OnVoteYesRelease")
   Bindings(94)=(Name="GBA_VoteNo",Command="OnVoteNoPressed | OnRelease OnVoteNoRelease")
   Bindings(95)=(Name="GBA_VoiceCommReqHealing",Command="PlayVoiceCommsDialog 0")
   Bindings(96)=(Name="GBA_VoiceCommReqDosh",Command="PlayVoiceCommsDialog 1")
   Bindings(97)=(Name="GBA_VoiceCommReqHelp",Command="PlayVoiceCommsDialog 2")
   Bindings(98)=(Name="GBA_VoiceCommTauntZeds",Command="PlayVoiceCommsDialog 3")
   Bindings(99)=(Name="GBA_VoiceCommFollowMe",Command="PlayVoiceCommsDialog 4")
   Bindings(100)=(Name="GBA_VoiceCommGetToTheTrader",Command="PlayVoiceCommsDialog 5")
   Bindings(101)=(Name="GBA_VoiceCommAffirmative",Command="PlayVoiceCommsDialog 6")
   Bindings(102)=(Name="GBA_VoiceCommNegative",Command="PlayVoiceCommsDialog 7")
   Bindings(103)=(Name="GBA_VoiceCommEmote",Command="DoEmote")
   Bindings(104)=(Name="GBA_RequestSkipTrader",Command="RequestSkipTrader")
   Bindings(105)=(Name="GBA_WeaponSelect_Gamepad",Command="GamepadWeaponSelect | OnRelease ReleaseGamepadWeaponSelect")
   Bindings(106)=(Name="GBA_DPad_Left_Gamepad",Command="GamepadDpadLeft | OnRelease HideVoiceComms")
   Bindings(107)=(Name="GBA_DPad_Right_Gamepad",Command="GamepadDpadRight | OnRelease HideVoiceComms")
   Bindings(108)=(Name="GBA_DPad_Down_Gamepad",Command="GamepadDpadDown")
   Bindings(109)=(Name="GBA_DPad_Up_Gamepad",Command="GamepadDpadUp")
   Bindings(110)=(Name="GBA_Crouch_Gamepad",Command="GamepadCrouch | OnRelease GamepadCrouchRelease")
   Bindings(111)=(Name="GBA_StrafeLeft_Gamepad",Command="Axis aStrafe Speed=1.0 DeadZone=0.2")
   Bindings(112)=(Name="GBA_MoveForward_Gamepad",Command="Axis aBaseY Speed=1.0 DeadZone=0.2")
   Bindings(113)=(Name="GBA_TurnLeft_Gamepad",Command="Axis aTurn Speed=1.0 DeadZone=0.2")
   Bindings(114)=(Name="GBA_Look_Gamepad",Command="Axis aLookup Speed=1.0 DeadZone=0.2")
   Bindings(115)=(Name="GBA_SwitchToBestWeapon_Gamepad",Command="SwitchToBestWeapon | Axis aUp Speed=-1.0 AbsoluteAxis=100")
   Bindings(116)=(Name="GBA_Reload_Gamepad",Command="GamepadReload | OnRelease GamepadReloadRelease")
   Bindings(117)=(Name="GBA_AltFire_Gamepad",Command="GamepadSwitchFire | OnRelease SwitchFireRelease")
   Bindings(118)=(Name="GBA_MoveForward_GamepadSouthpaw",Command="Axis aBaseY Speed=-1.0 DeadZone=0.2")
   Bindings(119)=(Name="GBA_Look_GamepadSouthpaw",Command="Axis aLookup Speed=-1.0 DeadZone=0.2")
   Bindings(120)=(Name="XboxTypeS_A",Command="GBA_Jump | OnVoteYesPressed | OnRelease OnVoteYesRelease")
   Bindings(121)=(Name="XboxTypeS_B",Command="GBA_Use | OnVoteNoPressed | OnRelease OnVoteNoRelease")
   Bindings(122)=(Name="XboxTypeS_Y",Command="GBA_WeaponSelect_Gamepad")
   Bindings(123)=(Name="XboxTypeS_X",Command="GBA_Reload_Gamepad")
   Bindings(124)=(Name="XboxTypeS_LeftX",Command="GBA_StrafeLeft_Gamepad")
   Bindings(125)=(Name="XboxTypeS_LeftY",Command="GBA_MoveForward_Gamepad")
   Bindings(126)=(Name="XboxTypeS_LeftThumbStick",Command="GBA_SprintAndCrouch")
   Bindings(127)=(Name="XboxTypeS_RightX",Command="GBA_TurnLeft_Gamepad")
   Bindings(128)=(Name="XboxTypeS_RightY",Command="GBA_Look_Gamepad")
   Bindings(129)=(Name="XboxTypeS_RightThumbStick",Command="GBA_TertiaryFire")
   Bindings(130)=(Name="XboxTypeS_LeftShoulder",Command="GBA_Grenade")
   Bindings(131)=(Name="XboxTypeS_RightShoulder",Command="GBA_AltFire_Gamepad")
   Bindings(132)=(Name="XboxTypeS_LeftTrigger",Command="GBA_IronsightsHold")
   Bindings(133)=(Name="XboxTypeS_RightTrigger",Command="GBA_Fire")
   Bindings(134)=(Name="XboxTypeS_DPad_Left",Command="GBA_DPad_Left_Gamepad")
   Bindings(135)=(Name="XboxTypeS_DPad_Right",Command="GBA_DPad_Right_Gamepad")
   Bindings(136)=(Name="XboxTypeS_DPad_Down",Command="GBA_DPad_Down_Gamepad | OnRelease FlashlightRelease")
   Bindings(137)=(Name="XboxTypeS_DPad_Up",Command="GBA_DPad_Up_Gamepad")
   Bindings(138)=(Name="XboxTypeS_Back",Command="GBA_ShowScores")
   Bindings(139)=(Name="XboxTypeS_Start",Command="GBA_ShowMenu")
   Bindings(140)=(Name="Orbis_SwipeUp",Command="GBA_TossMoney")
   Bindings(141)=(Name="Up",Command="GBA_MoveForward")
   Bindings(142)=(Name="Down",Command="GBA_Backward")
   Bindings(143)=(Name="Left",Command="GBA_TurnLeft")
   Bindings(144)=(Name="Right",Command="GBA_TurnRight")
   Bindings(145)=(Name="Enter",Command="GBA_Use")
   Bindings(146)=(Name="SpaceBar",Command="GBA_Jump")
   Bindings(147)=(Name="W",Command="GBA_MoveForward")
   Bindings(148)=(Name="S",Command="GBA_Backward")
   Bindings(149)=(Name="A",Command="GBA_StrafeLeft")
   Bindings(150)=(Name="D",Command="GBA_StrafeRight")
   Bindings(151)=(Name="E",Command="GBA_Use")
   Bindings(152)=(Name="LeftMouseButton",Command="GBA_Fire | SpectatePrevPlayer")
   Bindings(153)=(Name="MiddleMouseButton",Command="GBA_SwitchFireMode | SpectateChangeCamMode")
   Bindings(154)=(Name="RightMouseButton",Command="GBA_IronsightsToggle | SpectateNextPlayer")
   Bindings(155)=(Name="F",Command="GBA_ToggleFlashlight")
   Bindings(156)=(Name="R",Command="GBA_Reload")
   Bindings(157)=(Name="G",Command="GBA_Grenade")
   Bindings(158)=(Name="C",Command="GBA_CrouchToggle")
   Bindings(159)=(Name="Q",Command="GBA_QuickHeal")
   Bindings(160)=(Name="V",Command="GBA_TertiaryFire")
   Bindings(161)=(Name="Escape",Command="GBA_ShowMenu")
   Bindings(162)=(Name="MouseScrollUp",Command="GBA_NextWeapon")
   Bindings(163)=(Name="MouseScrollDown",Command="GBA_PrevWeapon")
   Bindings(164)=(Name="one",Command="GBA_SwitchWeapon1")
   Bindings(165)=(Name="two",Command="GBA_SwitchWeapon2")
   Bindings(166)=(Name="three",Command="GBA_SwitchWeapon3")
   Bindings(167)=(Name="four",Command="GBA_SwitchWeapon4")
   Bindings(168)=(Name="BackSpace",Command="GBA_DropWeapon")
   Bindings(169)=(Name="T",Command="GBA_Talk")
   Bindings(170)=(Name="Y",Command="GBA_TeamTalk")
   Bindings(171)=(Name="Tab",Command="GBA_ShowScores",bIgnoreShift=True)
   Bindings(172)=(Name="Z",Command="GBA_ShowVoiceComms")
   Bindings(173)=(Name="B",Command="GBA_TossMoney")
   Bindings(174)=(Name="LeftShift",Command="GBA_Sprint")
   Bindings(175)=(Name="CapsLock",Command="GBA_VoiceChat")
   Bindings(176)=(Name="F1",Command="GBA_VoteYes")
   Bindings(177)=(Name="F2",Command="GBA_VoteNo")
   Bindings(178)=(Name="F4",Command="Playersonly")
   Bindings(179)=(Name="F5",Command="set D3DRenderDevice UsePostProcessEffects False")
   Bindings(180)=(Name="F6",Command="set D3DRenderDevice UsePostProcessEffects True")
   Bindings(181)=(Name="F7",Command="NextViewMode",bIgnoreAlt=True)
   Bindings(182)=(Name="F8",Command="PrevViewMode")
   Bindings(183)=(Name="M",Command="BasePath 0")
   Bindings(184)=(Name="N",Command="BasePath 1")
   Bindings(185)=(Name="F9",Command="viewmode wireframe",Control=True)
   Bindings(186)=(Name="F10",Command="viewmode unlit",Control=True)
   Bindings(187)=(Name="F4",Command="viewmode detaillighting",Control=True)
   Bindings(188)=(Name="F5",Command="viewmode shadercomplexity",Control=True)
   Bindings(189)=(Name="F6",Command="viewmode lit",Control=True)
   Bindings(190)=(Name="PageDown",Command="Camera ThirdPerson")
   Bindings(191)=(Name="PageUp",Command="Camera Fixed")
   Bindings(192)=(Name="Home",Command="Camera FixedTracking")
   Bindings(193)=(Name="Insert",Command="Camera FreeCam")
   Bindings(194)=(Name="P",Command="Playersonly")
   Bindings(195)=(Name="LeftBracket",Command="Slomo .2")
   Bindings(196)=(Name="RightBracket",Command="Slomo 1")
   Bindings(197)=(Name="Backslash",Command="Slomo 4")
   Bindings(198)=(Name="Subtract",Command="PreviousTrackingRange")
   Bindings(199)=(Name="Add",Command="NextTrackingRange")
   Bindings(200)=(Name="NumPadZero",Command="ToggleTracker")
   Bindings(201)=(Name="NumPadOne",Command="NextTrackingMode")
   Bindings(202)=(Name="NumPadTwo",Command="ToggleMapView")
   Name="Default__PlayerInput"
   ObjectArchetype=Input'Engine.Default__Input'
}
