/*******************************************************************************
 * LogitechLEDInterface generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LogitechLEDInterface extends PlatformInterfaceBase
    transient
    native(PlatformInterface);

var int Red;
var int Green;
var int Blue;

// Export ULogitechLEDInterface::execInit(FFrame&, void* const)
native event Init();

// Export ULogitechLEDInterface::execSetColor(FFrame&, void* const)
native event bool SetColor(int RedPercent, int GreenPercent, int BluePercent);

// Export ULogitechLEDInterface::execLEDSetFlashingRBG(FFrame&, void* const)
native event bool LEDSetFlashingRBG(int redPercentage, int greenPercentage, int bluePercentage, int milliSecondsDuration, int milliSecondsInterval);

// Export ULogitechLEDInterface::execLEDPulseLighting(FFrame&, void* const)
native event bool LEDPulseLighting(int redPercentage, int greenPercentage, int bluePercentage, int milliSecondsDuration, int milliSecondsInterval);

// Export ULogitechLEDInterface::execLedRestoreLighting(FFrame&, void* const)
native event bool LedRestoreLighting();

// Export ULogitechLEDInterface::execLedStopEffects(FFrame&, void* const)
native event bool LedStopEffects();
