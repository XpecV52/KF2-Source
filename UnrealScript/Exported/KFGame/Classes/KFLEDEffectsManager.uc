class KFLEDEffectsManager extends Object within KFPlayerController;

enum ELightFXID
{
	LFID_None,
	LFID_Puke,
	LFID_ZedTimeBegin,
	LFID_ZedTimeEnd,
	LFID_LowHealth,
	LFID_Siren,
	LFID_Flashbang,
	LFID_Heal,
	LFID_Fire,
	LFID_Gas,
	LFID_WaveIncoming,
	LFID_Ready,
	LFID_Unready,
	LFID_MatchLost,
	LFID_MatchWon,
};

struct S_LightingFrame
{
	var byte Red;
	var byte Green;
	var byte Blue;
	var byte Brightness;
	var float Duration;
};

var array<S_LightingFrame> PukeEffectArr;
var array<S_LightingFrame> ZedTimeBeginEffectArr;
var array<S_LightingFrame> ZedTimeEndEffectArr;
var array<S_LightingFrame> LowHealthEffectArr;
var array<S_LightingFrame> SirenEffectArr;
var array<S_LightingFrame> FlashbangEffectArr;
var array<S_LightingFrame> HealEffectArr;
var array<S_LightingFrame> FireEffectArr;
var array<S_LightingFrame> GasEffectArr;
var array<S_LightingFrame> WaveIncomingEffectArr;
var array<S_LightingFrame> ReadyEffectArr;
var array<S_LightingFrame> UnreadyEffectArr;
var array<S_LightingFrame> MatchLostEffectArr;
var array<S_LightingFrame> MatchWonEffectArr;

var array<S_LightingFrame> CurrentLightingFrames;
var int CurrentLightFrameIndex;

var bool bPendingKill;

simulated function InitLEDEffects()
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();

    if (RazerFXLED == none)
    {
       LogInternal("RazerFXLED == none");
    }       

    if (LogtitechLED == none)
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

simulated function ResetLightingAnimation()
{
	CurrentLightFrameIndex = INDEX_NONE;
	CurrentLightingFrames.length = 0;
}

//recursive timer for animations
simulated function PlayNextLightFrame(optional bool bNewEffect)
{
	if (bPendingKill)
	{
		return;
	}
	if (bNewEffect)
	{
		CurrentLightFrameIndex = INDEX_NONE;
	}
	CurrentLightFrameIndex++;
	//validate frame
	if (CurrentLightFrameIndex < CurrentLightingFrames.length)
	{
		//Set the color
		SetLEDRGB(CurrentLightingFrames[CurrentLightFrameIndex].Red, CurrentLightingFrames[CurrentLightFrameIndex].Green, CurrentLightingFrames[CurrentLightFrameIndex].Blue, CurrentLightingFrames[CurrentLightFrameIndex].Brightness);
		SetTimer(CurrentLightingFrames[CurrentLightFrameIndex].Duration, false, nameof(PlayNextLightFrame), self);
	}
	else
	{
		//done restore lighting
		LedRestoreLighting();
	}
}

simulated function byte PercentToByte(int Percent)
{
    local byte MyByte;
    local float PercentFloat;

    PercentFloat = float(Percent) / 100.0f;

    MyByte = clamp(255 * PercentFloat, 0, 255); 

    return MyByte;
}


simulated function SetLEDRGB(int RedPercent, int GreenPercent, int BluePercent, int Brightness = 100)
{
    local LogitechLEDInterface LogtitechLED;
    local RazerLEDInterface RazerFXLED;
    local AlienFXLEDInterface AlienFXLED;

	if (bPendingKill)
	{
		return;
	}
    
    LogtitechLED = class'PlatformInterfaceBase'.static.GetLogitechIntegration();
    RazerFXLED = class'PlatformInterfaceBase'.static.GetRazerIntegration();
    AlienFXLED = class'PlatformInterfaceBase'.static.GetAlienFXIntegration();

    if (LogtitechLED != none) //percent based
    {
       LogtitechLED.SetColor(RedPercent, GreenPercent, BluePercent, float(Brightness)/100.0f);
    }       
    
    if(RazerFXLED != none) //raw rgb byte
    {
        RazerFXLED.SetColor( PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent), float(Brightness)/100.0f );
    }

    if (AlienFXLED != none) //raw rgb byte
    {
        AlienFXLED.SetColor( PercentToByte(RedPercent), PercentToByte(GreenPercent), PercentToByte(BluePercent), PercentToByte(Brightness));
    }
}


simulated function LedStopEffects()
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
 
	if (RazerFXLED != none)
	{
		RazerFXLED.LedRestoreLighting();
	}

    if (AlienFXLED != none)
    {
        AlienFXLED.LedStopEffects();
    }
	bPendingKill = true;
}


simulated function LedRestoreLighting ()
{
	ResetLightingAnimation();
	SetLEDRGB(100, 0, 0, 75);
}

//puke
simulated function PlayEffectPuke(float timeSeconds)
{
    //LEDPulseLighting(50,50,0, int(timeSeconds)*1000, 100);
	CurrentLightingFrames = PukeEffectArr;
	PlayNextLightFrame(true);
}
//zed time
simulated function PlayEffectZedTime()
{
	CurrentLightingFrames = ZedTimeBeginEffectArr;
	PlayNextLightFrame(true);
}

simulated function ClearEffectZedTime()
{
	CurrentLightingFrames = ZedTimeEndEffectArr;
	PlayNextLightFrame(true);
}
//low health
simulated function PlayEffectLowHealth()
{
	CurrentLightingFrames = LowHealthEffectArr;
	PlayNextLightFrame(true);
}
//siren
simulated function PlayEffectSiren(float timeSeconds)
{
	CurrentLightingFrames = SirenEffectArr;
	PlayNextLightFrame(true);
}
//

simulated function PlayEffectFlashbang(float timeSeconds)
{
	CurrentLightingFrames = FlashbangEffectArr;
	PlayNextLightFrame(true);
}
//heal
simulated function PlayEffectHeal(float timeSeconds)
{
	CurrentLightingFrames = HealEffectArr;
	PlayNextLightFrame(true);
}
//fire
simulated function PlayEffectFire()
{
	CurrentLightingFrames = FireEffectArr;
	PlayNextLightFrame(true);
}
//gas
simulated function PlayEffectGas()
{
	CurrentLightingFrames = GasEffectArr;
	PlayNextLightFrame(true);
}

simulated function PlayEffectWaveIncoming() //
{
	CurrentLightingFrames = WaveIncomingEffectArr;
	PlayNextLightFrame(true);
}

simulated function PlayEffectRecievedDosh()
{
    //todo
}

simulated function PlayEffectSetReady(bool bReady)
{
    if(bReady)
    {
		CurrentLightingFrames = ReadyEffectArr;
    }
    else
    {
		CurrentLightingFrames = UnreadyEffectArr;
		
    }
	PlayNextLightFrame(true);
}

simulated function PlayEffectShowMatchOutcome(bool bWon) //
{
	if (bWon)
	{
		CurrentLightingFrames = MatchWonEffectArr;
	}
	else
	{
		CurrentLightingFrames = MatchLostEffectArr;

	}
	PlayNextLightFrame(true);
}

defaultproperties
{
   PukeEffectArr(0)=(Red=50,Green=50,Brightness=100,Duration=0.100000)
   PukeEffectArr(1)=(Red=50,Green=50,Brightness=95,Duration=0.100000)
   PukeEffectArr(2)=(Red=50,Green=50,Brightness=90,Duration=0.100000)
   PukeEffectArr(3)=(Red=50,Green=50,Brightness=85,Duration=0.100000)
   PukeEffectArr(4)=(Red=50,Green=50,Brightness=80,Duration=0.100000)
   PukeEffectArr(5)=(Red=50,Green=50,Brightness=75,Duration=0.100000)
   PukeEffectArr(6)=(Red=50,Green=50,Brightness=70,Duration=0.100000)
   PukeEffectArr(7)=(Red=50,Green=50,Brightness=65,Duration=0.100000)
   PukeEffectArr(8)=(Red=50,Green=50,Brightness=60,Duration=0.100000)
   PukeEffectArr(9)=(Red=50,Green=50,Brightness=55,Duration=0.100000)
   PukeEffectArr(10)=(Red=50,Green=50,Brightness=50,Duration=0.100000)
   PukeEffectArr(11)=(Red=50,Green=50,Brightness=45,Duration=0.100000)
   PukeEffectArr(12)=(Red=50,Green=50,Brightness=40,Duration=0.100000)
   PukeEffectArr(13)=(Red=50,Green=50,Brightness=35,Duration=0.100000)
   PukeEffectArr(14)=(Red=50,Green=50,Brightness=30,Duration=0.100000)
   PukeEffectArr(15)=(Red=50,Green=50,Brightness=25,Duration=0.100000)
   PukeEffectArr(16)=(Red=50,Green=50,Brightness=20,Duration=0.100000)
   PukeEffectArr(17)=(Red=50,Green=50,Brightness=15,Duration=0.100000)
   PukeEffectArr(18)=(Red=50,Green=50,Brightness=10,Duration=0.100000)
   PukeEffectArr(19)=(Red=50,Green=50,Brightness=5,Duration=0.100000)
   PukeEffectArr(20)=(Red=50,Green=50,Duration=0.100000)
   PukeEffectArr(21)=(Red=50,Green=50,Brightness=5,Duration=0.100000)
   PukeEffectArr(22)=(Red=50,Green=50,Brightness=10,Duration=0.100000)
   PukeEffectArr(23)=(Red=50,Green=50,Brightness=15,Duration=0.100000)
   PukeEffectArr(24)=(Red=50,Green=50,Brightness=20,Duration=0.100000)
   PukeEffectArr(25)=(Red=50,Green=50,Brightness=25,Duration=0.100000)
   PukeEffectArr(26)=(Red=50,Green=50,Brightness=30,Duration=0.100000)
   PukeEffectArr(27)=(Red=50,Green=50,Brightness=35,Duration=0.100000)
   PukeEffectArr(28)=(Red=50,Green=50,Brightness=40,Duration=0.100000)
   PukeEffectArr(29)=(Red=50,Green=50,Brightness=45,Duration=0.100000)
   PukeEffectArr(30)=(Red=50,Green=50,Brightness=50,Duration=0.100000)
   PukeEffectArr(31)=(Red=50,Green=50,Brightness=55,Duration=0.100000)
   PukeEffectArr(32)=(Red=50,Green=50,Brightness=60,Duration=0.100000)
   PukeEffectArr(33)=(Red=50,Green=50,Brightness=65,Duration=0.100000)
   PukeEffectArr(34)=(Red=50,Green=50,Brightness=70,Duration=0.100000)
   PukeEffectArr(35)=(Red=50,Green=50,Brightness=75,Duration=0.100000)
   PukeEffectArr(36)=(Red=50,Green=50,Brightness=80,Duration=0.100000)
   PukeEffectArr(37)=(Red=50,Green=50,Brightness=85,Duration=0.100000)
   PukeEffectArr(38)=(Red=50,Green=50,Brightness=90,Duration=0.100000)
   PukeEffectArr(39)=(Red=50,Green=50,Brightness=95,Duration=0.100000)
   PukeEffectArr(40)=(Red=50,Green=50,Brightness=100,Duration=0.100000)
   PukeEffectArr(41)=(Red=50,Green=50,Brightness=95,Duration=0.100000)
   PukeEffectArr(42)=(Red=50,Green=50,Brightness=90,Duration=0.100000)
   PukeEffectArr(43)=(Red=50,Green=50,Brightness=85,Duration=0.100000)
   PukeEffectArr(44)=(Red=50,Green=50,Brightness=80,Duration=0.100000)
   PukeEffectArr(45)=(Red=50,Green=50,Brightness=75,Duration=0.100000)
   PukeEffectArr(46)=(Red=50,Green=50,Brightness=70,Duration=0.100000)
   PukeEffectArr(47)=(Red=50,Green=50,Brightness=65,Duration=0.100000)
   PukeEffectArr(48)=(Red=50,Green=50,Brightness=60,Duration=0.100000)
   PukeEffectArr(49)=(Red=50,Green=50,Brightness=55,Duration=0.100000)
   PukeEffectArr(50)=(Red=50,Green=50,Brightness=50,Duration=0.100000)
   PukeEffectArr(51)=(Red=50,Green=50,Brightness=45,Duration=0.100000)
   PukeEffectArr(52)=(Red=50,Green=50,Brightness=40,Duration=0.100000)
   PukeEffectArr(53)=(Red=50,Green=50,Brightness=35,Duration=0.100000)
   PukeEffectArr(54)=(Red=50,Green=50,Brightness=30,Duration=0.100000)
   PukeEffectArr(55)=(Red=50,Green=50,Brightness=25,Duration=0.100000)
   PukeEffectArr(56)=(Red=50,Green=50,Brightness=20,Duration=0.100000)
   PukeEffectArr(57)=(Red=50,Green=50,Brightness=15,Duration=0.100000)
   PukeEffectArr(58)=(Red=50,Green=50,Brightness=10,Duration=0.100000)
   PukeEffectArr(59)=(Red=50,Green=50,Brightness=5,Duration=0.100000)
   PukeEffectArr(60)=(Red=50,Green=50,Duration=0.100000)
   PukeEffectArr(61)=(Red=50,Green=50,Brightness=5,Duration=0.100000)
   PukeEffectArr(62)=(Red=50,Green=50,Brightness=10,Duration=0.100000)
   PukeEffectArr(63)=(Red=50,Green=50,Brightness=15,Duration=0.100000)
   PukeEffectArr(64)=(Red=50,Green=50,Brightness=20,Duration=0.100000)
   PukeEffectArr(65)=(Red=50,Green=50,Brightness=25,Duration=0.100000)
   PukeEffectArr(66)=(Red=50,Green=50,Brightness=30,Duration=0.100000)
   PukeEffectArr(67)=(Red=50,Green=50,Brightness=35,Duration=0.100000)
   PukeEffectArr(68)=(Red=50,Green=50,Brightness=40,Duration=0.100000)
   PukeEffectArr(69)=(Red=50,Green=50,Brightness=45,Duration=0.100000)
   PukeEffectArr(70)=(Red=50,Green=50,Brightness=50,Duration=0.100000)
   PukeEffectArr(71)=(Red=50,Green=50,Brightness=55,Duration=0.100000)
   PukeEffectArr(72)=(Red=50,Green=50,Brightness=60,Duration=0.100000)
   PukeEffectArr(73)=(Red=50,Green=50,Brightness=65,Duration=0.100000)
   PukeEffectArr(74)=(Red=50,Green=50,Brightness=70,Duration=0.100000)
   PukeEffectArr(75)=(Red=50,Green=50,Brightness=75,Duration=0.100000)
   PukeEffectArr(76)=(Red=50,Green=50,Brightness=80,Duration=0.100000)
   PukeEffectArr(77)=(Red=50,Green=50,Brightness=85,Duration=0.100000)
   PukeEffectArr(78)=(Red=50,Green=50,Brightness=90,Duration=0.100000)
   PukeEffectArr(79)=(Red=50,Green=50,Brightness=95,Duration=0.100000)
   PukeEffectArr(80)=(Red=50,Green=50,Brightness=100,Duration=0.250000)
   ZedTimeBeginEffectArr(0)=(Red=75,Green=75,Blue=75,Brightness=5,Duration=0.100000)
   ZedTimeBeginEffectArr(1)=(Red=75,Green=75,Blue=75,Brightness=10,Duration=0.100000)
   ZedTimeBeginEffectArr(2)=(Red=75,Green=75,Blue=75,Brightness=15,Duration=0.100000)
   ZedTimeBeginEffectArr(3)=(Red=75,Green=75,Blue=75,Brightness=20,Duration=0.100000)
   ZedTimeBeginEffectArr(4)=(Red=75,Green=75,Blue=75,Brightness=25,Duration=0.100000)
   ZedTimeBeginEffectArr(5)=(Red=75,Green=75,Blue=75,Brightness=30,Duration=0.100000)
   ZedTimeBeginEffectArr(6)=(Red=75,Green=75,Blue=75,Brightness=35,Duration=0.100000)
   ZedTimeBeginEffectArr(7)=(Red=75,Green=75,Blue=75,Brightness=40,Duration=0.100000)
   ZedTimeBeginEffectArr(8)=(Red=75,Green=75,Blue=75,Brightness=45,Duration=0.100000)
   ZedTimeBeginEffectArr(9)=(Red=75,Green=75,Blue=75,Brightness=50,Duration=0.100000)
   ZedTimeBeginEffectArr(10)=(Red=75,Green=75,Blue=75,Brightness=55,Duration=0.100000)
   ZedTimeBeginEffectArr(11)=(Red=75,Green=75,Blue=75,Brightness=60,Duration=0.100000)
   ZedTimeBeginEffectArr(12)=(Red=75,Green=75,Blue=75,Brightness=65,Duration=0.100000)
   ZedTimeBeginEffectArr(13)=(Red=75,Green=75,Blue=75,Brightness=70,Duration=0.100000)
   ZedTimeBeginEffectArr(14)=(Red=75,Green=75,Blue=75,Brightness=75,Duration=0.100000)
   ZedTimeBeginEffectArr(15)=(Red=75,Green=75,Blue=75,Brightness=80,Duration=0.100000)
   ZedTimeBeginEffectArr(16)=(Red=75,Green=75,Blue=75,Brightness=85,Duration=0.100000)
   ZedTimeBeginEffectArr(17)=(Red=75,Green=75,Blue=75,Brightness=90,Duration=0.100000)
   ZedTimeBeginEffectArr(18)=(Red=75,Green=75,Blue=75,Brightness=95,Duration=0.100000)
   ZedTimeBeginEffectArr(19)=(Red=75,Green=75,Blue=75,Brightness=100)
   ZedTimeEndEffectArr(0)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.100000)
   ZedTimeEndEffectArr(1)=(Red=75,Green=75,Blue=75,Brightness=95,Duration=0.100000)
   ZedTimeEndEffectArr(2)=(Red=75,Green=75,Blue=75,Brightness=90,Duration=0.100000)
   ZedTimeEndEffectArr(3)=(Red=75,Green=75,Blue=75,Brightness=85,Duration=0.100000)
   ZedTimeEndEffectArr(4)=(Red=75,Green=75,Blue=75,Brightness=80,Duration=0.100000)
   ZedTimeEndEffectArr(5)=(Red=75,Green=75,Blue=75,Brightness=75,Duration=0.100000)
   ZedTimeEndEffectArr(6)=(Red=75,Green=75,Blue=75,Brightness=70,Duration=0.100000)
   ZedTimeEndEffectArr(7)=(Red=75,Green=75,Blue=75,Brightness=65,Duration=0.100000)
   ZedTimeEndEffectArr(8)=(Red=75,Green=75,Blue=75,Brightness=60,Duration=0.100000)
   ZedTimeEndEffectArr(9)=(Red=75,Green=75,Blue=75,Brightness=55,Duration=0.100000)
   ZedTimeEndEffectArr(10)=(Red=75,Green=75,Blue=75,Brightness=50,Duration=0.100000)
   ZedTimeEndEffectArr(11)=(Red=75,Green=75,Blue=75,Brightness=45,Duration=0.100000)
   ZedTimeEndEffectArr(12)=(Red=75,Green=75,Blue=75,Brightness=40,Duration=0.100000)
   ZedTimeEndEffectArr(13)=(Red=75,Green=75,Blue=75,Brightness=35,Duration=0.100000)
   ZedTimeEndEffectArr(14)=(Red=75,Green=75,Blue=75,Brightness=30,Duration=0.100000)
   ZedTimeEndEffectArr(15)=(Red=75,Green=75,Blue=75,Brightness=25,Duration=0.100000)
   ZedTimeEndEffectArr(16)=(Red=75,Green=75,Blue=75,Brightness=20,Duration=0.100000)
   ZedTimeEndEffectArr(17)=(Red=75,Green=75,Blue=75,Brightness=15,Duration=0.100000)
   ZedTimeEndEffectArr(18)=(Red=75,Green=75,Blue=75,Brightness=10,Duration=0.100000)
   ZedTimeEndEffectArr(19)=(Red=75,Green=75,Blue=75,Brightness=5,Duration=0.100000)
   ZedTimeEndEffectArr(20)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   LowHealthEffectArr(0)=(Red=100,Brightness=100,Duration=0.100000)
   LowHealthEffectArr(1)=(Red=100,Brightness=95,Duration=0.100000)
   LowHealthEffectArr(2)=(Red=100,Brightness=90,Duration=0.100000)
   LowHealthEffectArr(3)=(Red=100,Brightness=85,Duration=0.100000)
   LowHealthEffectArr(4)=(Red=100,Brightness=80,Duration=0.100000)
   LowHealthEffectArr(5)=(Red=100,Brightness=75,Duration=0.100000)
   LowHealthEffectArr(6)=(Red=100,Brightness=70,Duration=0.100000)
   LowHealthEffectArr(7)=(Red=100,Brightness=65,Duration=0.100000)
   LowHealthEffectArr(8)=(Red=100,Brightness=60,Duration=0.100000)
   LowHealthEffectArr(9)=(Red=100,Brightness=55,Duration=0.100000)
   LowHealthEffectArr(10)=(Red=100,Brightness=50,Duration=0.100000)
   LowHealthEffectArr(11)=(Red=100,Brightness=45,Duration=0.100000)
   LowHealthEffectArr(12)=(Red=100,Brightness=40,Duration=0.100000)
   LowHealthEffectArr(13)=(Red=100,Brightness=35,Duration=0.100000)
   LowHealthEffectArr(14)=(Red=100,Brightness=30,Duration=0.100000)
   LowHealthEffectArr(15)=(Red=100,Brightness=25,Duration=0.100000)
   LowHealthEffectArr(16)=(Red=100,Brightness=20,Duration=0.100000)
   LowHealthEffectArr(17)=(Red=100,Brightness=15,Duration=0.100000)
   LowHealthEffectArr(18)=(Red=100,Brightness=10,Duration=0.100000)
   LowHealthEffectArr(19)=(Red=100,Brightness=5,Duration=0.100000)
   LowHealthEffectArr(20)=(Red=100,Duration=0.100000)
   LowHealthEffectArr(21)=(Red=100,Brightness=5,Duration=0.100000)
   LowHealthEffectArr(22)=(Red=100,Brightness=10,Duration=0.100000)
   LowHealthEffectArr(23)=(Red=100,Brightness=15,Duration=0.100000)
   LowHealthEffectArr(24)=(Red=100,Brightness=20,Duration=0.100000)
   LowHealthEffectArr(25)=(Red=100,Brightness=25,Duration=0.100000)
   LowHealthEffectArr(26)=(Red=100,Brightness=30,Duration=0.100000)
   LowHealthEffectArr(27)=(Red=100,Brightness=35,Duration=0.100000)
   LowHealthEffectArr(28)=(Red=100,Brightness=40,Duration=0.100000)
   LowHealthEffectArr(29)=(Red=100,Brightness=45,Duration=0.100000)
   LowHealthEffectArr(30)=(Red=100,Brightness=50,Duration=0.100000)
   LowHealthEffectArr(31)=(Red=100,Brightness=55,Duration=0.100000)
   LowHealthEffectArr(32)=(Red=100,Brightness=60,Duration=0.100000)
   LowHealthEffectArr(33)=(Red=100,Brightness=65,Duration=0.100000)
   LowHealthEffectArr(34)=(Red=100,Brightness=70,Duration=0.100000)
   LowHealthEffectArr(35)=(Red=100,Brightness=75,Duration=0.100000)
   LowHealthEffectArr(36)=(Red=100,Brightness=80,Duration=0.100000)
   LowHealthEffectArr(37)=(Red=100,Brightness=85,Duration=0.100000)
   LowHealthEffectArr(38)=(Red=100,Brightness=90,Duration=0.100000)
   LowHealthEffectArr(39)=(Red=100,Brightness=95,Duration=0.100000)
   LowHealthEffectArr(40)=(Red=100,Brightness=100,Duration=0.100000)
   LowHealthEffectArr(41)=(Red=100,Brightness=95,Duration=0.100000)
   LowHealthEffectArr(42)=(Red=100,Brightness=90,Duration=0.100000)
   LowHealthEffectArr(43)=(Red=100,Brightness=85,Duration=0.100000)
   LowHealthEffectArr(44)=(Red=100,Brightness=80,Duration=0.100000)
   LowHealthEffectArr(45)=(Red=100,Brightness=75,Duration=0.100000)
   LowHealthEffectArr(46)=(Red=100,Brightness=70,Duration=0.100000)
   LowHealthEffectArr(47)=(Red=100,Brightness=65,Duration=0.100000)
   LowHealthEffectArr(48)=(Red=100,Brightness=60,Duration=0.100000)
   LowHealthEffectArr(49)=(Red=100,Brightness=55,Duration=0.100000)
   LowHealthEffectArr(50)=(Red=100,Brightness=50,Duration=0.100000)
   LowHealthEffectArr(51)=(Red=100,Brightness=45,Duration=0.100000)
   LowHealthEffectArr(52)=(Red=100,Brightness=40,Duration=0.100000)
   LowHealthEffectArr(53)=(Red=100,Brightness=35,Duration=0.100000)
   LowHealthEffectArr(54)=(Red=100,Brightness=30,Duration=0.100000)
   LowHealthEffectArr(55)=(Red=100,Brightness=25,Duration=0.100000)
   LowHealthEffectArr(56)=(Red=100,Brightness=20,Duration=0.100000)
   LowHealthEffectArr(57)=(Red=100,Brightness=15,Duration=0.100000)
   LowHealthEffectArr(58)=(Red=100,Brightness=10,Duration=0.100000)
   LowHealthEffectArr(59)=(Red=100,Brightness=5,Duration=0.100000)
   LowHealthEffectArr(60)=(Red=100,Duration=0.100000)
   LowHealthEffectArr(61)=(Red=100,Brightness=5,Duration=0.100000)
   LowHealthEffectArr(62)=(Red=100,Brightness=10,Duration=0.100000)
   LowHealthEffectArr(63)=(Red=100,Brightness=15,Duration=0.100000)
   LowHealthEffectArr(64)=(Red=100,Brightness=20,Duration=0.100000)
   LowHealthEffectArr(65)=(Red=100,Brightness=25,Duration=0.100000)
   LowHealthEffectArr(66)=(Red=100,Brightness=30,Duration=0.100000)
   LowHealthEffectArr(67)=(Red=100,Brightness=35,Duration=0.100000)
   LowHealthEffectArr(68)=(Red=100,Brightness=40,Duration=0.100000)
   LowHealthEffectArr(69)=(Red=100,Brightness=45,Duration=0.100000)
   LowHealthEffectArr(70)=(Red=100,Brightness=50,Duration=0.100000)
   LowHealthEffectArr(71)=(Red=100,Brightness=55,Duration=0.100000)
   LowHealthEffectArr(72)=(Red=100,Brightness=60,Duration=0.100000)
   LowHealthEffectArr(73)=(Red=100,Brightness=65,Duration=0.100000)
   LowHealthEffectArr(74)=(Red=100,Brightness=70,Duration=0.100000)
   LowHealthEffectArr(75)=(Red=100,Brightness=75,Duration=0.100000)
   LowHealthEffectArr(76)=(Red=100,Brightness=80,Duration=0.100000)
   LowHealthEffectArr(77)=(Red=100,Brightness=85,Duration=0.100000)
   LowHealthEffectArr(78)=(Red=100,Brightness=90,Duration=0.100000)
   LowHealthEffectArr(79)=(Red=100,Brightness=95,Duration=0.100000)
   LowHealthEffectArr(80)=(Red=100,Brightness=100,Duration=0.250000)
   SirenEffectArr(0)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(1)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(2)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(3)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(4)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(5)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(6)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(7)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(8)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(9)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(10)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(11)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(12)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(13)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(14)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(15)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   SirenEffectArr(16)=(Red=75,Green=75,Blue=75,Duration=0.250000)
   SirenEffectArr(17)=(Red=75,Green=75,Blue=75,Brightness=100,Duration=0.250000)
   FlashbangEffectArr(0)=(Red=100,Green=100,Blue=100,Brightness=100,Duration=0.250000)
   FlashbangEffectArr(1)=(Red=100,Green=100,Blue=100,Duration=0.250000)
   FlashbangEffectArr(2)=(Red=100,Green=100,Blue=100,Brightness=100,Duration=0.250000)
   FlashbangEffectArr(3)=(Red=100,Green=100,Blue=100,Duration=0.250000)
   FlashbangEffectArr(4)=(Red=100,Green=100,Blue=100,Brightness=100,Duration=0.250000)
   FlashbangEffectArr(5)=(Red=100,Green=100,Blue=100,Duration=0.250000)
   FlashbangEffectArr(6)=(Red=100,Green=100,Blue=100,Brightness=100,Duration=0.250000)
   FlashbangEffectArr(7)=(Red=100,Green=100,Blue=100,Duration=0.250000)
   FlashbangEffectArr(8)=(Red=100,Green=100,Blue=100,Brightness=100,Duration=0.250000)
   HealEffectArr(0)=(Green=100,Blue=100,Brightness=5,Duration=0.100000)
   HealEffectArr(1)=(Green=100,Blue=100,Brightness=10,Duration=0.100000)
   HealEffectArr(2)=(Green=100,Blue=100,Brightness=15,Duration=0.100000)
   HealEffectArr(3)=(Green=100,Blue=100,Brightness=20,Duration=0.100000)
   HealEffectArr(4)=(Green=100,Blue=100,Brightness=25,Duration=0.100000)
   HealEffectArr(5)=(Green=100,Blue=100,Brightness=30,Duration=0.100000)
   HealEffectArr(6)=(Green=100,Blue=100,Brightness=35,Duration=0.100000)
   HealEffectArr(7)=(Green=100,Blue=100,Brightness=40,Duration=0.100000)
   HealEffectArr(8)=(Green=100,Blue=100,Brightness=45,Duration=0.100000)
   HealEffectArr(9)=(Green=100,Blue=100,Brightness=50,Duration=0.100000)
   HealEffectArr(10)=(Green=100,Blue=100,Brightness=55,Duration=0.100000)
   HealEffectArr(11)=(Green=100,Blue=100,Brightness=60,Duration=0.100000)
   HealEffectArr(12)=(Green=100,Blue=100,Brightness=65,Duration=0.100000)
   HealEffectArr(13)=(Green=100,Blue=100,Brightness=70,Duration=0.100000)
   HealEffectArr(14)=(Green=100,Blue=100,Brightness=75,Duration=0.100000)
   HealEffectArr(15)=(Green=100,Blue=100,Brightness=80,Duration=0.100000)
   HealEffectArr(16)=(Green=100,Blue=100,Brightness=85,Duration=0.100000)
   HealEffectArr(17)=(Green=100,Blue=100,Brightness=90,Duration=0.100000)
   HealEffectArr(18)=(Green=100,Blue=100,Brightness=95,Duration=0.100000)
   HealEffectArr(19)=(Green=100,Blue=100,Brightness=100,Duration=0.250000)
   FireEffectArr(0)=(Red=100,Green=50,Blue=25,Brightness=5,Duration=0.100000)
   FireEffectArr(1)=(Red=100,Green=50,Blue=25,Brightness=15,Duration=0.100000)
   FireEffectArr(2)=(Red=100,Green=50,Blue=25,Brightness=25,Duration=0.100000)
   FireEffectArr(3)=(Red=100,Green=50,Blue=25,Brightness=35,Duration=0.100000)
   FireEffectArr(4)=(Red=100,Green=50,Blue=25,Brightness=45,Duration=0.100000)
   FireEffectArr(5)=(Red=100,Green=50,Blue=25,Brightness=55,Duration=0.100000)
   FireEffectArr(6)=(Red=100,Green=50,Blue=25,Brightness=65,Duration=0.100000)
   FireEffectArr(7)=(Red=100,Green=50,Blue=25,Brightness=75,Duration=0.100000)
   FireEffectArr(8)=(Red=100,Green=50,Blue=25,Brightness=85,Duration=0.100000)
   FireEffectArr(9)=(Red=100,Green=50,Blue=25,Brightness=95,Duration=0.100000)
   FireEffectArr(10)=(Red=100,Green=50,Blue=25,Brightness=100,Duration=0.250000)
   FireEffectArr(11)=(Red=100,Green=50,Blue=25,Duration=0.250000)
   FireEffectArr(12)=(Red=100,Green=50,Blue=25,Brightness=100,Duration=0.250000)
   FireEffectArr(13)=(Red=100,Green=50,Blue=25,Duration=0.250000)
   FireEffectArr(14)=(Red=100,Green=50,Blue=25,Brightness=100,Duration=0.250000)
   GasEffectArr(0)=(Red=100,Green=100,Brightness=5,Duration=0.100000)
   GasEffectArr(1)=(Red=100,Green=100,Brightness=15,Duration=0.100000)
   GasEffectArr(2)=(Red=100,Green=100,Brightness=25,Duration=0.100000)
   GasEffectArr(3)=(Red=100,Green=100,Brightness=35,Duration=0.100000)
   GasEffectArr(4)=(Red=100,Green=100,Brightness=45,Duration=0.100000)
   GasEffectArr(5)=(Red=100,Green=100,Brightness=55,Duration=0.100000)
   GasEffectArr(6)=(Red=100,Green=100,Brightness=65,Duration=0.100000)
   GasEffectArr(7)=(Red=100,Green=100,Brightness=75,Duration=0.100000)
   GasEffectArr(8)=(Red=100,Green=100,Brightness=85,Duration=0.100000)
   GasEffectArr(9)=(Red=100,Green=100,Brightness=95,Duration=0.100000)
   GasEffectArr(10)=(Red=100,Green=100,Brightness=100,Duration=0.250000)
   GasEffectArr(11)=(Red=100,Green=100,Duration=0.250000)
   GasEffectArr(12)=(Red=100,Green=100,Brightness=100,Duration=0.250000)
   GasEffectArr(13)=(Red=100,Green=100,Duration=0.250000)
   GasEffectArr(14)=(Red=100,Green=100,Brightness=100,Duration=0.250000)
   WaveIncomingEffectArr(0)=(Red=100,Brightness=100,Duration=0.250000)
   WaveIncomingEffectArr(1)=(Red=100,Duration=0.250000)
   WaveIncomingEffectArr(2)=(Red=100,Brightness=100,Duration=0.250000)
   WaveIncomingEffectArr(3)=(Red=100,Duration=0.250000)
   WaveIncomingEffectArr(4)=(Red=100,Brightness=100,Duration=0.250000)
   WaveIncomingEffectArr(5)=(Red=100,Duration=0.250000)
   WaveIncomingEffectArr(6)=(Red=100,Brightness=100,Duration=0.250000)
   WaveIncomingEffectArr(7)=(Red=100,Duration=0.250000)
   WaveIncomingEffectArr(8)=(Red=100,Brightness=100,Duration=0.250000)
   WaveIncomingEffectArr(9)=(Red=100,Duration=0.250000)
   WaveIncomingEffectArr(10)=(Red=100,Brightness=100,Duration=0.250000)
   ReadyEffectArr(0)=(Green=100,Brightness=100)
   UnreadyEffectArr(0)=(Red=100,Brightness=100)
   MatchLostEffectArr(0)=(Red=100,Brightness=100)
   MatchWonEffectArr(0)=(Green=100,Brightness=100)
   Name="Default__KFLEDEffectsManager"
   ObjectArchetype=Object'Core.Default__Object'
}
