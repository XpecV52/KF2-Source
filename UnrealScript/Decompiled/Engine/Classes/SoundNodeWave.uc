/*******************************************************************************
 * SoundNodeWave generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SoundNodeWave extends SoundNode
    native(Sound)
    perobjectconfig
    editinlinenew
    hidecategories(Object,Object);

enum EDecompressionType
{
    DTYPE_Setup,
    DTYPE_Invalid,
    DTYPE_Preview,
    DTYPE_Native,
    DTYPE_RealTime,
    DTYPE_Procedural,
    DTYPE_Xenon,
    DTYPE_Dingo,
    DTYPE_MAX
};

/** 1 smallest size, 100 is best quality. */
var(Compression) int CompressionQuality;
/** Forces on the fly sound decompression, even for short duration sounds. */
var(Compression) bool bForceRealTimeDecompression;
/** Informs the compression routimes to process this sound to allow it to loop. */
var(Compression) bool bLoopingSound;
var const transient bool bDynamicResource;
/** Use Text To Speech to verbalise SpokenText. */
var(TTS) bool bUseTTS;
var transient bool bProcedural;
/** For marking any adult language. */
var(Subtitles) const localized bool bMature;
/** Disable automatic generation of line breaks. */
var(Subtitles) const localized bool bManualWordWrap;
/** Display the subtitle as a sequence of single lines. */
var(Subtitles) const localized bool bSingleLine;
var const bool bIsVoIP;
/** The voice to use for Text To Speech. */
var(TTS) AudioDevice.ETTSSpeaker TTSSpeaker;
var const transient SoundNodeWave.EDecompressionType DecompressionType;
/** if on mobile and the platform's DetailMode < this value, the sound will be discarded to conserve memory */
var() const Scene.EDetailMode MobileDetailMode;
/** The phonetic version of the dialog. */
var(TTS) const localized string SpokenText;
/** Default is 0.75. */
var(Info) const editconst float Volume;
/** Minimum is 0.4, maximum is 2.0 - it is a simple linear multiplier to the SampleRate. */
var(Info) const editconst float Pitch;
/** Duration of sound in seconds. */
var(Info) const editconst float Duration;
/** Number of channels of multichannel data; 1 or 2 for regular mono and stereo files */
var(Info) const editconst int NumChannels;
/** Cached sample rate for displaying in the tools */
var(Info) const editconst int SampleRate;
var editoronly const array<editoronly int> ChannelOffsets;
var editoronly const array<editoronly int> ChannelSizes;
var native const UntypedBulkData_Mirror RawData;
var native const Pointer VorbisDecompressor;
var native const Pointer RawPCMData;
var const int RawPCMDataSize;
var native const UntypedBulkData_Mirror CompressedPCData;
var native const UntypedBulkData_Mirror CompressedXbox360Data;
var native const UntypedBulkData_Mirror CompressedDingoData;
var native const UntypedBulkData_Mirror CompressedPS3Data;
var native const UntypedBulkData_Mirror CompressedWiiUData;
var native const UntypedBulkData_Mirror CompressedIPhoneData;
var native const UntypedBulkData_Mirror CompressedFlashData;
var native const UntypedBulkData_Mirror CompressedOrbisData;
var const transient int ResourceID;
var const transient int ResourceSize;
var native const Pointer ResourceData;
/**  
 *Subtitle cues.  If empty, use SpokenText as the subtitle.  Will often be empty,
 * as the contents of the subtitle is commonly identical to what is spoken.
 */
var(Subtitles) const localized array<localized SubtitleCue> Subtitles;
/** Contextual information for the sound to the translator. */
var(Subtitles) editoronly const localized string Comment;
var array<LocalizedSubtitle> LocalizedSubtitles;
/** Path to the resource used to construct this sound node wave */
var() editoronly const editconst string SourceFilePath;
/** Date/Time-stamp of the file from the last import */
var() editoronly const editconst string SourceFileTimestamp;

event GeneratePCMData(out array<byte> Buffer, int SamplesNeeded);

defaultproperties
{
    CompressionQuality=40
    bLoopingSound=true
    Volume=0.75
    Pitch=1
}