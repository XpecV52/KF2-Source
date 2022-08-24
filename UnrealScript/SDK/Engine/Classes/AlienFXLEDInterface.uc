class AlienFXLEDInterface extends PlatformInterfaceBase
	native(PlatformInterface);

var int Red;
var int Green;
var int Blue;

	/**
* Perform any initialization
*/
native event Init();
native event Activate();
native event bool SetColor(byte RedPercent, byte GreenPercent, byte BluePercent);
native event bool LedRestoreLighting();
native event bool LedStopEffects();
/**
 * Do the Mixer tick to pick up new interaction events
 */
native function TickAlienFX();

native event bool LEDSetFlashingRBG(byte redPercentage, byte greenPercentage, byte bluePercentage,
int milliSecondsDuration, int milliSecondsInterval);

native event bool LEDPulseLighting(byte redPercentage, byte greenPercentage, byte bluePercentage, int
milliSecondsDuration, int milliSecondsInterval);


