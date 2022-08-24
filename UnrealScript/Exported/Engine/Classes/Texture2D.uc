/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class Texture2D extends Texture
	native(Texture)
	hidecategories(Object);

/**
 * A mip-map of the texture.
 */
struct native Texture2DMipMap
{
	var native UntypedBulkData_Mirror Data{FTextureMipBulkData};	
	var native int SizeX;
	var native int SizeY;

	structcpptext
	{
		/**
		 * Special serialize function passing the owning UObject along as required by FUnytpedBulkData
		 * serialization.
		 *
		 * @param	Ar		Archive to serialize with
		 * @param	Owner	UObject this structure is serialized within
		 * @param	MipIdx	Current mip being serialized
		 */
		void Serialize( FArchive& Ar, UObject* Owner, INT MipIdx );
	}
};

/** The texture's mip-map data.												*/
var native const IndirectArray_Mirror Mips{TIndirectArray<FTexture2DMipMap>};

/** Cached PVRTC compressed texture data									*/
var native const IndirectArray_Mirror CachedPVRTCMips{TIndirectArray<FTexture2DMipMap>};

/** Cached ATITC compressed texture data									*/
var native const IndirectArray_Mirror CachedATITCMips{TIndirectArray<FTexture2DMipMap>};

/** Cached ETC compressed texture data									*/
var native const IndirectArray_Mirror CachedETCMips{TIndirectArray<FTexture2DMipMap>};

/** The size that the Flash compressed texture data was cached at 			*/
var native const int					CachedFlashMipsMaxResolution;
/** Cached Flash compressed texture data									*/
var native const UntypedBulkData_Mirror CachedFlashMips{FTextureMipBulkData};

/** The width of the texture.												*/
var const int SizeX;

/** The height of the texture.												*/
var const int SizeY;

/** The original width of the texture source art we imported from.			*/
var const int OriginalSizeX;

/** The original height of the texture source art we imported from.			*/
var const int OriginalSizeY;


/** The format of the texture data.											*/
var const EPixelFormat Format;

/** The addressing mode to use for the X axis.								*/
var() TextureAddress AddressX;

/** The addressing mode to use for the Y axis.								*/
var() TextureAddress AddressY;

/** Is this texture editor only, and should not be cooked into the final packages */
var() const bool								bIsEditorOnly;

/** Whether the texture is currently streamable or not.						*/
var transient const bool						bIsStreamable;
/** Whether the current texture mip change request is pending cancelation.	*/
var transient const bool						bHasCancelationPending;
/**
 * Whether the texture has been loaded from a persistent archive. We keep track of this in order to not stream 
 * textures that are being re-imported over as they will have a linker but won't have been serialized from disk 
 * and are therefore not streamable.
 */
var transient const bool						bHasBeenLoadedFromPersistentArchive;

/** Override whether to fully stream even if texture hasn't been rendered.	*/
var transient bool								bForceMiplevelsToBeResident;
/** Global/ serialized version of ForceMiplevelsToBeResident.				*/
var() const bool								bGlobalForceMipLevelsToBeResident;
/** WorldInfo timestamp that tells the streamer to force all miplevels to be resident up until that time. */ 
var private transient float						ForceMipLevelsToBeResidentTimestamp;

/** Allows texture to be a source for Texture2DComposite.  Will NOT be available for use in rendering! */
var() const bool								bIsCompositingSource;

/** Whether the texture has been painted in the editor.						*/
var editoronly bool							bHasBeenPaintedInEditor;

/** Name of texture file cache texture mips are stored in, NAME_None if it is not part of one. */
var		name									TextureFileCacheName;
/** ID generated whenever the texture is changed so that its bulk data can be updated in the TextureFileCache during cook */
var native const guid							TextureFileCacheGuid;

/** Number of miplevels the texture should have resident.					*/
var transient const int							RequestedMips;
/** Number of miplevels currently resident.									*/
var transient const int							ResidentMips;

/** Number of mips to remove when recompressing (does not work with TC_NormalmapUncompressed) */
var() int MipsToRemoveOnCompress;

/** Command fence used to shut down properly */
var		native				const	pointer					ReleaseTexture2DFence{class FRenderCommandFence};

/**
 * Thread-safe counter indicating the texture streaming state. The definitions below are mirrored in UnTex.h.
 *
	 enum ETextureStreamingState
	 {
		// The renderer hasn't created the resource yet.
		TexState_InProgress_Initialization	= -1,
		// There are no pending requests/ all requests have been fulfilled.
		TexState_ReadyFor_Requests			= 0,
		// Finalization has been kicked off and is in progress.
		TexState_InProgress_Finalization	= 1,
		// Initial request has completed and finalization needs to be kicked off.
		TexState_ReadyFor_Finalization		= 2,
		// We're currently loading in mip data.
		TexState_InProgress_Loading			= 3,
		// ...
		// States 3+N means we're currently loading in N mips
		// ...
		// Memory has been allocated and we're ready to start loading in mips.
		TexState_ReadyFor_Loading			= 100,
		// We're currently allocating/preparing memory for the new mip count.
		TexState_InProgress_Allocating		= 101,
	};
 */
var native transient const ThreadSafeCounter	PendingMipChangeRequestStatus{mutable FThreadSafeCounter};

/** Data formatted only for 1 bit textures which are CPU based and never allocate GPU Memory  **/
var private{private} array<byte>				SystemMemoryData;

/**
 * Mirror helper structure for linked list of texture objects. The linked list should NOT be traversed by the
 * garbage collector, which is why Element is declared as a pointer.
 */
struct TextureLinkedListMirror
{
	var native const POINTER Element;
	var native const POINTER Next;
	var native const POINTER PrevLink;
};

/** This texture's link in the global streamable texture list. */
var private{private} native const duplicatetransient noimport TextureLinkedListMirror StreamableTexturesLink{TLinkedList<UTexture2D*>};

/** FStreamingTexture index used by the texture streaming system. */
var private{private} const transient duplicatetransient int StreamingIndex;

/** 
* Keep track of the first mip level stored in the packed miptail.
* it's set to highest mip level if no there's no packed miptail 
*/
var const int MipTailBaseIdx;

/** memory used for directly loading bulk mip data */
var private const native transient pointer		ResourceMem{FTexture2DResourceMem};
/** keep track of first mip level used for ResourceMem creation */
var private const int							FirstResourceMemMip;

/** Used for various timing measurements, e.g. streaming latency. */
var private const native transient float		Timer;

/**
 * Tells the streaming system that it should force all mip-levels to be resident for a number of seconds.
 * @param Seconds					Duration in seconds
 * @param CinematicTextureGroups	Bitfield indicating which texture groups that use extra high-resolution mips
 */
native final function							SetForceMipLevelsToBeResident( float Seconds, optional int CinematicTextureGroups = 0 );

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

/** creates and initializes a new Texture2D with the requested settings */
static native noexport final function Texture2D Create(int InSizeX, int InSizeY, optional EPixelFormat InFormat = PF_A8R8G8B8);

defaultproperties
{
   Name="Default__Texture2D"
   ObjectArchetype=Texture'Engine.Default__Texture'
}
