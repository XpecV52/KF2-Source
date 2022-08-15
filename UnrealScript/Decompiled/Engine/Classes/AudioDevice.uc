/*******************************************************************************
 * AudioDevice generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AudioDevice extends Subsystem
    transient
    native(AudioDevice)
    config(Engine);

enum ESoundClassName
{
    Master,
    ESoundClassName_MAX
};

enum EDebugState
{
    DEBUGSTATE_None,
    DEBUGSTATE_IsolateDryAudio,
    DEBUGSTATE_IsolateReverb,
    DEBUGSTATE_TestLPF,
    DEBUGSTATE_TestStereoBleed,
    DEBUGSTATE_TestLFEBleed,
    DEBUGSTATE_DisableLPF,
    DEBUGSTATE_DisableRadio,
    DEBUGSTATE_MAX
};

enum ETTSSpeaker
{
    TTSSPEAKER_Paul,
    TTSSPEAKER_Harry,
    TTSSPEAKER_Frank,
    TTSSPEAKER_Dennis,
    TTSSPEAKER_Kit,
    TTSSPEAKER_Betty,
    TTSSPEAKER_Ursula,
    TTSSPEAKER_Rita,
    TTSSPEAKER_Wendy,
    TTSSPEAKER_MAX
};

struct native Listener
{
    var const PortalVolume PortalVolume;
    var Vector Location;
    var Vector Up;
    var Vector Right;
    var Vector Front;
    var Vector Velocity;

    structdefaultproperties
    {
        PortalVolume=none
        Location=(X=0,Y=0,Z=0)
        Up=(X=0,Y=0,Z=0)
        Right=(X=0,Y=0,Z=0)
        Front=(X=0,Y=0,Z=0)
        Velocity=(X=0,Y=0,Z=0)
    }
};

struct native AudioClassInfo
{
    var const int NumResident;
    var const int SizeResident;
    var const int NumRealTime;
    var const int SizeRealTime;

    structdefaultproperties
    {
        NumResident=0
        SizeResident=0
        NumRealTime=0
        SizeRealTime=0
    }
};

var const config int MaxChannels;
var const config int CommonAudioPoolSize;
var const config float LowPassFilterResonance;
var const config float MinCompressedDurationEditor;
var const config float MinCompressedDurationGame;
var const config string ChirpInSoundNodeWaveName;
var const SoundNodeWave ChirpInSoundNodeWave;
var const config string ChirpOutSoundNodeWaveName;
var const SoundNodeWave ChirpOutSoundNodeWave;
var native const Pointer CommonAudioPool;
var native const int CommonAudioPoolFreeBytes;
var const export editinline transient array<export editinline AudioComponent> AudioComponents;
var native const array<Pointer> Sources;
var native const array<Pointer> FreeSources;
var native const map<0, 0> WaveInstanceSourceMap;
var native const bool bGameWasTicking;
var transient bool bSoundSpawningEnabled;
var native const array<Listener> Listeners;
var native const QWord CurrentTick;
/** Map of available sound classes */
var() map<0, 0> SoundClasses;
var map<0, 0> SourceSoundClasses;
var map<0, 0> CurrentSoundClasses;
var map<0, 0> DestinationSoundClasses;
var native const map<0, 0> SoundModes;
var native const Pointer Effects;
var native const name BaseSoundModeName;
var native const SoundMode CurrentMode;
var native const Double SoundModeStartTime;
var native const Double SoundModeFadeInStartTime;
var native const Double SoundModeFadeInEndTime;
var native const Double SoundModeEndTime;
var native const int ListenerVolumeIndex;
var native const InteriorSettings ListenerInteriorSettings;
var native const Double InteriorStartTime;
var native const Double InteriorEndTime;
var native const Double ExteriorEndTime;
var native const Double InteriorLPFEndTime;
var native const Double ExteriorLPFEndTime;
var native const float InteriorVolumeInterp;
var native const float InteriorLPFInterp;
var native const float ExteriorVolumeInterp;
var native const float ExteriorLPFInterp;
var const export editinline AudioComponent TestAudioComponent;
var native const Pointer TextToSpeech;
var native const AudioDevice.EDebugState DebugState;
var transient float TransientMasterVolume;
var transient float LastUpdateTime;

// Export UAudioDevice::execSetSoundMode(FFrame&, void* const)
native final function bool SetSoundMode(name NewMode);

// Export UAudioDevice::execFindSoundClass(FFrame&, void* const)
native final function SoundClass FindSoundClass(name SoundClassName);

defaultproperties
{
    TransientMasterVolume=1
}