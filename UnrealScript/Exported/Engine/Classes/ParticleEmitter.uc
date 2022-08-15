//=============================================================================
// ParticleEmitter
// The base class for any particle emitter objects.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class ParticleEmitter extends Object
	native(Particle)
	dependson(ParticleLODLevel)
	hidecategories(Object)
	editinlinenew
	abstract;

//=============================================================================
//	General variables
//=============================================================================
/** The name of the emitter. */
var(Particle)				name						EmitterName;

//=============================================================================
//	Burst emissions
//=============================================================================
enum EParticleBurstMethod
{
	EPBM_Instant,
	EPBM_Interpolated
};

struct native ParticleBurst
{
	/** The number of particles to burst */
	var()				int		Count;
	/** If >= 0, use as a range [CountLow..Count] */
	var()				int		CountLow;
	/** The time at which to burst them (0..1: emitter lifetime) */
	var()				float	Time;

	structdefaultproperties
	{
		CountLow=-1		// Disabled by default...
	}
};

//=============================================================================
//	SubUV-related
//=============================================================================
enum EParticleSubUVInterpMethod
{
	PSUVIM_None,
    PSUVIM_Linear,
    PSUVIM_Linear_Blend,
    PSUVIM_Random,
    PSUVIM_Random_Blend
};

var	transient				int							SubUVDataOffset;

//=============================================================================
//	Cascade-related
//=============================================================================
enum EEmitterRenderMode
{
	ERM_Normal,
	ERM_Point,
	ERM_Cross,
	ERM_None
};

/**
 *	How to render the emitter particles. Can be one of the following:
 *		ERM_Normal	- As the intended sprite/mesh
 *		ERM_Point	- As a 2x2 pixel block with no scaling and the color set in EmitterEditorColor
 *		ERM_Cross	- As a cross of lines, scaled to the size of the particle in EmitterEditorColor
 *		ERM_None	- Do not render
 */
var(Cascade) EEmitterRenderMode EmitterRenderMode;
/**
 *	The color of the emitter in the curve editor and debug rendering modes.
 */
var(Cascade) editoronly color EmitterEditorColor;

//=============================================================================
//	'Private' data - not required by the editor
//=============================================================================
var editinline export		array<ParticleLODLevel>		LODLevels;
var							bool						ConvertedModules;
var							int							PeakActiveParticles;

//=============================================================================
//	Performance/LOD Data
//=============================================================================

/**
 *	Initial allocation count - overrides calculated peak count if > 0
 */
var(Particle)				int							InitialAllocationCount;

/** 
 * Scales the spawn rate of this emitter when the engine is running in medium or low detail mode.
 * This can be used to optimize particle draw cost in splitscreen.
 * A value of 0 effectively disables this emitter outside of high detail mode,
 * And this does not affect spawn per unit, unless the value is 0.
 */
var(Particle)				float						MediumDetailSpawnRateScale;

/** This value indicates the emitter should be drawn 'collapsed' in Cascade */
var(Cascade) editoronly		bool						bCollapsed;

/** If TRUE, then show only this emitter in the editor */
var transient				bool						bIsSoloing;

/** 
 *	If TRUE, then this emitter was 'cooked out' by the cooker. 
 *	This means it was completely disabled, but to preserve any
 *	indexing schemes, it is left in place.
 */
var bool bCookedOut;

/** The Flex container to emit into */
var (Flex) FlexContainer FlexContainerTemplate;

var (Flex) float FlexSmoothScreenRadius;

var (Flex) float FlexSmoothDepthRadius;

var (Flex) float FlexCutoffThickness;

/** 
 *	Get the longest possible lifespan for this emitter.
 *	
 *	@param	InComponentDelay	The delay from the component using the emitter
 *
 *	@return	FLOAT				The longest lifespan this PSys could have; 0.0f if infinite.
 */
native function float GetMaxLifespan(float InComponentDelay);

//=============================================================================
//	C++
//=============================================================================
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//=============================================================================
//	Default properties
//=============================================================================

defaultproperties
{
   EmitterName="Particle Emitter"
   EmitterEditorColor=(B=150,G=150,R=0,A=255)
   ConvertedModules=True
   MediumDetailSpawnRateScale=1.000000
   FlexSmoothScreenRadius=5.000000
   FlexSmoothDepthRadius=5.000000
   FlexCutoffThickness=10.000000
   Name="Default__ParticleEmitter"
   ObjectArchetype=Object'Core.Default__Object'
}
