/*******************************************************************************
 * KFLEDEffectsManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFLEDEffectsManager extends Object within KFPlayerController;

static function InitLEDEffects()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    AlienFXLED = Class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    RazerFXLED = Class'PlatformInterfaceBase'.static.GetRazerIntegration();
    LogtitechLED = Class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    if(RazerFXLED == none)
    {
        LogInternal("RazerFXLED == none");
    }
    if(LogtitechLED == none)
    {
        LogInternal("LogtitechLED == none");
    }
    if(AlienFXLED == none)
    {
        LogInternal("AlienFXLED == none");        
    }
    else
    {
        AlienFXLED.Activate();
    }
    PlayEffectSetReady(false);
}

static function byte PercentToByte(int Percent)
{
    local byte MyByte;
    local float PercentFloat;

    PercentFloat = float(Percent) / 100;
    MyByte = byte(Clamp(int(float(255) * PercentFloat), 0, 255));
    return MyByte;
}

static function SetLEDRGB(int RedPercent, int GreenPercent, int BluePercent)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = Class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = Class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = Class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    if(LogtitechLED != none)
    {
        LogtitechLED.SetColor(RedPercent, GreenPercent, BluePercent);
    }
    if(RazerFXLED != none)
    {
        RazerFXLED.SetColor(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent));
    }
    if(AlienFXLED != none)
    {
        AlienFXLED.SetColor(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent));
    }
}

static function LEDSetFlashingRBG(int RedPercent, int GreenPercent, int BluePercent, int milliSecondsDuration, int milliSecondsInterval)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = Class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = Class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = Class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    if(LogtitechLED != none)
    {
        LogtitechLED.LEDSetFlashingRBG(RedPercent, GreenPercent, BluePercent, milliSecondsDuration, milliSecondsInterval);
    }
    if(RazerFXLED != none)
    {
        RazerFXLED.LEDSetFlashingRBG(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent), milliSecondsDuration, milliSecondsInterval);
    }
    if(AlienFXLED != none)
    {
        AlienFXLED.LEDSetFlashingRBG(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent), milliSecondsDuration, milliSecondsInterval);
    }
}

static function LEDPulseLighting(int RedPercent, int GreenPercent, int BluePercent, int milliSecondsDuration, int milliSecondsInterval)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = Class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = Class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = Class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    if(LogtitechLED != none)
    {
        LogtitechLED.LEDPulseLighting(RedPercent, GreenPercent, BluePercent, milliSecondsDuration, milliSecondsInterval);
    }
    if(RazerFXLED != none)
    {
        RazerFXLED.LEDPulseLighting(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent), milliSecondsDuration, milliSecondsInterval);
    }
    if(AlienFXLED != none)
    {
        AlienFXLED.LEDPulseLighting(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent), milliSecondsDuration, milliSecondsInterval);
    }
}

static function LedStopEffects()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = Class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = Class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = Class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    if(LogtitechLED != none)
    {
        LogtitechLED.LedStopEffects();
    }
    if(RazerFXLED != none)
    {
        RazerFXLED.LedStopEffects();
    }
    if(AlienFXLED != none)
    {
        AlienFXLED.LedStopEffects();
    }
}

static function LedRestoreLighting()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = Class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = Class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = Class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    if(LogtitechLED != none)
    {
        LogtitechLED.LedRestoreLighting();
    }
    if(RazerFXLED != none)
    {
        RazerFXLED.LedRestoreLighting();
    }
    if(AlienFXLED != none)
    {
        AlienFXLED.LedRestoreLighting();
    }
}

static function PlayEffectPuke(float TimeSeconds)
{
    LEDPulseLighting(50, 50, 0, int(TimeSeconds) * 1000, 100);
}

static function PlayEffectZedTime()
{
    SetLEDRGB(75, 75, 75);
}

static function ClearEffectZedTime()
{
    SetLEDRGB(0, 0, 0);
}

static function PlayEffectLowHealth()
{
    LEDSetFlashingRBG(100, 0, 0, 5000, 200);
}

static function PlayEffectSiren(float TimeSeconds)
{
    LEDSetFlashingRBG(25, 25, 25, int(TimeSeconds) * 1000, 100);
}

static function PlayEffectFlashbang(float TimeSeconds)
{
    LEDSetFlashingRBG(100, 100, 100, int(TimeSeconds) * 1000, 200);
}

static function PlayEffectHeal(float TimeSeconds)
{
    LEDPulseLighting(0, 100, 100, int(TimeSeconds) * 1000, 200);
}

static function PlayEffectFire()
{
    LEDPulseLighting(100, 50, 25, 2500, 200);
}

static function PlayEffectGas()
{
    LEDPulseLighting(100, 100, 0, 5000, 200);
}

static function PlayEffectWaveIncoming()
{
    LEDPulseLighting(100, 0, 0, 5000, 400);
}

static function PlayEffectRecievedDosh();

static function PlayEffectSetReady(bool bReady)
{
    if(bReady)
    {
        SetLEDRGB(0, 100, 0);        
    }
    else
    {
        SetLEDRGB(100, 0, 0);
    }
}

static function PlayEffectShowMatchOutcome(bool bWon)
{
    if(bWon)
    {
        SetLEDRGB(0, 100, 0);        
    }
    else
    {
        SetLEDRGB(100, 0, 0);
    }
}
