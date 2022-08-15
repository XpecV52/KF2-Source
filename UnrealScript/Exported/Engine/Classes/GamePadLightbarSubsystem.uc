//* ===================================================================================
//* ::Scr GamePadLightbarSubsystem.uc
//* ===================================================================================
/**
 * @author Brandon Johnson
 * @brief Gamepad light bar used for setting light on gamepad. Currently only supported for orbis
*/
//* ===================================================================================
//* Created:  Jun 07, 2013 01:00PM
//* Modified: Jun 07, 2013 01:00PM
//* Copyright (c) 2013 Zombie, Inc. All Rights Reserved.
//* ===================================================================================
class GamePadLightbarSubsystem extends Object
	native
	config(LightBar);

//* ===================================================================================
//									VARIABLES
//* ===================================================================================


enum LightBarState
{
	ELBS_Standby,
	ELBS_Lerping,
	ELBS_Pulsing
};

/** The current light bar state */
var LightBarState CurrentLightBarState;

/** The current color */
var LinearColor CurrentColor;

/** The original color used before lerping */
var LinearColor OriginalColor;

/** The target color to set */
var LinearColor TargetColor;

/** The lerp time remaining */
var float LerpTimeRemaining;

/** The total time required for lerp/pulse */
var float TotalLerpTime;

/** The default color to display (blue) */
var() const config Color DefaultColor;


struct native ColorDefinition
{
	/** The string ID for the color */
	var init string Id;
	/** The R color to use */
	var byte R;
	/** The G color to use */
	var byte G;
	/** The B color to use */
	var byte B;
};

/** The list of color definitions to use */
var() const config editinline array<ColorDefinition> ColorDefinitions;


struct native LerpToInstruction
{
	/** The ID of this lerp instruction */
	var init string Id;
	/** The time for this instruction to complete */
	var float Time;
	/** The color to lerp to. If empty will be the default color */
	var init string LerpToId;
};

/** The list of instructions to lerp to */
var() const config editinline array<LerpToInstruction> LerpToInstructions;


struct native SetAndLerpInstruction extends LerpToInstruction
{
	/** The color to set to */
	var init string LerpFromId;
};

/** The list of instructions to set to a color and lerp after */
var() const config editinline array<SetAndLerpInstruction> SetAndLerpInstructions;


struct native PulseInstruction extends SetAndLerpInstruction
{
};

/** The list of pulse instructions */
var const config editinline array<PulseInstruction> PulseInstructions;


//* ===================================================================================
//									FUNCTIONS
//* ===================================================================================

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
// (cpptext)
// (cpptext)
// (cpptext)

//* ===================================================================================
//* @function	SetPadColor
//* @date	Jun 07, 2013 01:21PM
//* @author	Brandon Johnson
//* @brief	Sets the pad to a new color
//* @param	NewPadColor is the new pad color
//* ===================================================================================
static native function SetPadColor( Color NewPadColor );


//* ===================================================================================
//* @function	SetPadColorFromDef
//* @date	Jun 10, 2013 11:01AM
//* @author	Brandon Johnson
//* @brief	Sets the pad color from a color definition in config
//* @param	TheColorId is the color ID to use
//* ===================================================================================
static native function SetPadColorFromDef( string TheColorId );


//* ===================================================================================
//* @function	BeginLerp
//* @date	Jun 07, 2013 01:22PM
//* @author	Brandon Johnson
//* @brief	Begins a lerp
//* @param	NewLerpColor is the new color to lerp to
//* @param	LerpTime is the time for the lerp
//* ===================================================================================
static native function BeginLerp( Color NewLerpColor, float LerpTime );


//* ===================================================================================
//* @function	BeginLerpFromDef
//* @date	Jun 10, 2013 11:02AM
//* @author	Brandon Johnson
//* @brief	Begins a lerp from an instruction in config
//* @param	InstructionId is the string Id of the instruction
//* ===================================================================================
static native function BeginLerpFromDef( string InstructionId );


//* ===================================================================================
//* @function	SetPadColorAndLerp
//* @date	Jun 07, 2013 01:26PM
//* @author	Brandon Johnson
//* @brief	Sets a pad color and begins lerping
//*	@param	LerpTime is the total time used to lerp
//* @param	NewPadColor is the new pad color to set
//* @param	NewTargetColor is the new target color to set
//* ===================================================================================
static native function SetPadColorAndLerp( float LerpTime, Color NewPadColor, Color NewTargetColor = default.DefaultColor );


//* ===================================================================================
//* @function	SetPadColorAndLerpFromDef
//* @date	Jun 10, 2013 11:03AM
//* @author	Brandon Johnson
//* @brief	Sets the pad color and lerp from instruction Id in config
//* @param	InstructionId is the string Id of the instruction
//* ===================================================================================
static native function SetPadColorAndLerpFromDef( string InstructionId );


//* ===================================================================================
//* @function	SetPulsing
//* @date	Jun 07, 2013 03:49PM
//* @author	Brandon Johnson
//* @brief	Sets the lighting to pulse. Is reset by calling ResetState
//*	@param	LerpTime is the total time used to lerp
//* @param	Target1 is the first color to lerp to
//* @param	Target2 is the second target to lerp to
//* ===================================================================================
static native function SetPulsing( float LerpTime, Color Target1, Color Target2 = default.DefaultColor );


//* ===================================================================================
//* @function	SetPulsingFromDef
//* @date	Jun 10, 2013 11:06AM
//* @author	Brandon Johnson
//* @brief	Sets pulsing between 2 colors from an instruction found in config
//* @param	InstructionId is the Id of the instruction
//* ===================================================================================
static native function SetPulsingFromDef( string InstructionId );


//* ===================================================================================
//* @function	InterruptState
//* @date	Jun 07, 2013 01:28PM
//* @author	Brandon Johnson
//* @brief	Interrupts the current state, whether it be lerping or pulsing and sets to default color
//* ===================================================================================
static native function ResetState();


//* ===================================================================================
//								DEFAULT PROPERTIES
//* ===================================================================================
//EOF

defaultproperties
{
   CurrentColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   OriginalColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   TargetColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   Name="Default__GamePadLightbarSubsystem"
   ObjectArchetype=Object'Core.Default__Object'
}
