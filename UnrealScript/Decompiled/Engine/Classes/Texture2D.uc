/*******************************************************************************
 * Texture2D generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Texture2D extends Texture
    native(Texture)
    hidecategories(Object);

struct native Texture2DMipMap
{
    var native UntypedBulkData_Mirror Data;
    var native int SizeX;
    var native int SizeY;
};

struct TextureLinkedListMirror
{
    var native const Pointer Element;
    var native const Pointer Next;
    var native const Pointer PrevLink;
};

var native const IndirectArray_Mirror Mips;
var native const IndirectArray_Mirror CachedPVRTCMips;
var native const IndirectArray_Mirror CachedATITCMips;
var native const IndirectArray_Mirror CachedETCMips;
var native const int CachedFlashMipsMaxResolution;
var native const UntypedBulkData_Mirror CachedFlashMips;
var const int SizeX;
var const int SizeY;
var const int OriginalSizeX;
var const int OriginalSizeY;
var const Texture.EPixelFormat Format;
/** The addressing mode to use for the X axis. */
var() Texture.TextureAddress AddressX;
/** The addressing mode to use for the Y axis. */
var() Texture.TextureAddress AddressY;
/** Is this texture editor only, and should not be cooked into the final packages */
var() const bool bIsEditorOnly;
var const transient bool bIsStreamable;
var const transient bool bHasCancelationPending;
var const transient bool bHasBeenLoadedFromPersistentArchive;
var transient bool bForceMiplevelsToBeResident;
/** Global/ serialized version of ForceMiplevelsToBeResident. */
var() const bool bGlobalForceMipLevelsToBeResident;
/** Allows texture to be a source for Texture2DComposite.  Will NOT be available for use in rendering! */
var() const bool bIsCompositingSource;
var editoronly bool bHasBeenPaintedInEditor;
var private transient float ForceMipLevelsToBeResidentTimestamp;
var name TextureFileCacheName;
var native const Guid TextureFileCacheGuid;
var const transient int RequestedMips;
var const transient int ResidentMips;
/** Number of mips to remove when recompressing (does not work with TC_NormalmapUncompressed) */
var() int MipsToRemoveOnCompress;
var native const transient ThreadSafeCounter PendingMipChangeRequestStatus;
var private array<byte> SystemMemoryData;
var private noimport duplicatetransient native const TextureLinkedListMirror StreamableTexturesLink;
var private duplicatetransient const transient int StreamingIndex;
var const int MipTailBaseIdx;
var private native const transient Pointer ResourceMem;
var private const int FirstResourceMemMip;
var private native const transient float Timer;

// Export UTexture2D::execSetForceMipLevelsToBeResident(FFrame&, void* const)
native final function SetForceMipLevelsToBeResident(float Seconds, optional int CinematicTextureGroups)
{
    CinematicTextureGroups = 0;                
}

// Export UTexture2D::execCreate(FFrame&, void* const)
native static final function Texture2D Create(int InSizeX, int InSizeY, optional Texture.EPixelFormat InFormat)
{
    InFormat = 2;                    
}

defaultproperties
{
    StreamingIndex=-1
}