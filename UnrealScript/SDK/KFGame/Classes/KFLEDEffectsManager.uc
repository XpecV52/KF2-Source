class KFLEDEffectsManager extends Object within KFPlayerController;

static function InitLEDEffects()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();

    if (RazerFXLED == none)
    {
       `log("RazerFXLED == none");
    }       

    if (LogtitechLED == none)
    {
        `log("LogtitechLED == none");
    }       

    if(AlienFXLED == none)
    {
        `log("AlienFXLED == none");   
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

    PercentFloat = float(Percent) / 100.0f;

    MyByte = clamp(255 * PercentFloat, 0, 255); 

    return MyByte;
}

static function SetLEDRGB(int RedPercent, int GreenPercent, int BluePercent)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;
    
    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();

    if (LogtitechLED != none) //percent based
    {
       LogtitechLED.SetColor(RedPercent, GreenPercent, BluePercent);
    }       
    
    if(RazerFXLED != none) //raw rgb byte
    {
        RazerFXLED.SetColor( PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent) );
    }

    if (AlienFXLED != none) //raw rgb byte
    {
        AlienFXLED.SetColor( PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent) );
    }
}

static function LEDSetFlashingRBG (int RedPercent, int GreenPercent, int BluePercent,
int MilliSecondsDuration, int MilliSecondsInterval)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();

    if (LogtitechLED != none)
    {
       LogtitechLED.LEDSetFlashingRBG(RedPercent, GreenPercent, BluePercent,
            MilliSecondsDuration, MilliSecondsInterval);
    }       

    if(RazerFXLED != none)
    {
        RazerFXLED.LEDSetFlashingRBG( PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent),
            MilliSecondsDuration, MilliSecondsInterval);
    }

    if (AlienFXLED != none)
    {
        AlienFXLED.LEDSetFlashingRBG(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent),
            MilliSecondsDuration, MilliSecondsInterval);
    }
}


static function LEDPulseLighting(int RedPercent, int GreenPercent, int BluePercent, int
MilliSecondsDuration, int MilliSecondsInterval)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();

    if (LogtitechLED != none)
    {
       LogtitechLED.LEDPulseLighting(RedPercent, GreenPercent, BluePercent, 
        MilliSecondsDuration, MilliSecondsInterval);
    }       
    
    if(RazerFXLED != none)
    {
        RazerFXLED.LEDPulseLighting(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent),
        MilliSecondsDuration, MilliSecondsInterval);
    }

    if (AlienFXLED != none)
    {
        AlienFXLED.LEDPulseLighting(PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent),
        MilliSecondsDuration, MilliSecondsInterval);
    }
}


static function LedStopEffects()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;
    
    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();

    if (LogtitechLED != none)
    {
       LogtitechLED.LedStopEffects();
    }       
 
    if(RazerFXLED != none)
    {
        RazerFXLED.LedStopEffects();
    }

    if (AlienFXLED != none)
    {
        AlienFXLED.LedStopEffects();
    }
}


static function LedRestoreLighting ()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;
    
    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();

    if (LogtitechLED != none)
    {
       LogtitechLED.LedRestoreLighting();
    }       

    if(RazerFXLED != none)
    {
    	RazerFXLED.LedRestoreLighting();
    }

    if (AlienFXLED != none)
    {
        AlienFXLED.LedRestoreLighting();
    }
}

//puke
static function PlayEffectPuke(float timeSeconds)
{
    LEDPulseLighting(50,50,0, int(timeSeconds)*1000, 100);
}
//zed time
static function PlayEffectZedTime()
{
    SetLEDRGB(75, 75, 75);
}

static function ClearEffectZedTime()
{
    SetLEDRGB(0, 0, 0);
}
//low health
static function PlayEffectLowHealth()
{
    LEDSetFlashingRBG(100, 0, 0, 5000, 200);
}
//siren
static function PlayEffectSiren(float timeSeconds)
{
    LEDSetFlashingRBG(25,25,25, int(timeSeconds)*1000, 100);      
}
//
static function PlayEffectFlashbang(float timeSeconds)
{
    LEDSetFlashingRBG(100,100,100, int(timeSeconds)*1000, 200);      
}
//heal
static function PlayEffectHeal(float timeSeconds)
{
    LEDPulseLighting(0,100,100, int(timeSeconds)*1000, 200);
}
//fire
static function PlayEffectFire()
{
    LEDPulseLighting(100,50,25, 2500, 200);
}
//gas
static function PlayEffectGas()
{
    LEDPulseLighting(100,100,0, 5000, 200);
}

static function PlayEffectWaveIncoming() //
{
    LEDPulseLighting(100,0,0, 5000, 400);   
}

static function PlayEffectRecievedDosh()
{
    //todo
}

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

static function PlayEffectShowMatchOutcome(bool bWon) //
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
