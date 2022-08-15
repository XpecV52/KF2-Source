/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_StreamInTextures extends SeqAct_Latent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Whether we should stream in textures based on location or usage. If TRUE, textures surrounding the attached actors will start to stream in. If FALSE, textures used by the attached actors will start to stream in. */
var	deprecated bool	bLocationBased;

/** Number of seconds to force the streaming system to stream in all of the target's textures or enforce bForceMiplevelsToBeResident */
var()	float	Seconds;

/**
 * Allows adjusting the desired streaming distance around the specified Location.
 * 1.0 is the default, whereas a higher value makes the textures stream in sooner from far away.
 * A lower value (0.0-1.0) makes the textures stream in later and use less memory.
 */
var()	float	StreamingDistanceMultiplier;

/** Is this streaming currently active? */
var const bool	bStreamingActive;

/** Whether the AllLoaded output has been triggered. */
var const bool	bHasTriggeredAllLoaded;

/**
 * ID for when we started checking for NumWantingResources,
 * to make sure we've let the streaming system update it before we trigger the AllLoaded output.
 */
var const int NumWantingResourcesID;

/** Timestamp for when we should stop the forced texture streaming. */
var const float StopTimestamp;

/** Textures surrounding the LocationActors will begin to stream in */
var() array<Object> LocationActors;

/** Array of Materials to set bForceMiplevelsToBeResident on their textures for the duration of this action. */
var() array<MaterialInterface> ForceMaterials;

/** Texture groups that will use extra (higher resolution) mip-levels. */
var(CinematicMipLevels) const TextureGroupContainer	CinematicTextureGroups;

/** Internal bitfield representing the selection in CinematicTextureGropus. */
var native private transient const int		SelectedCinematicTextureGroups;


/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 2;
}

defaultproperties
{
   Seconds=15.000000
   StreamingDistanceMultiplier=1.000000
   InputLinks(0)=(LinkDesc="Start")
   InputLinks(1)=(LinkDesc="Stop")
   OutputLinks(0)=(LinkDesc="Out")
   OutputLinks(1)=()
   OutputLinks(2)=(LinkDesc="All Loaded")
   VariableLinks(0)=(LinkDesc="Actor")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Location",PropertyName="LocationActors")
   ObjName="Stream In Textures"
   ObjCategory="Actor"
   Name="Default__SeqAct_StreamInTextures"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
