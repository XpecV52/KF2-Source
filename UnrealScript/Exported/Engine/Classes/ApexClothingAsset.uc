/*=============================================================================
	ApexClothingAsset.h: PhysX APEX integration. Clothing Asset
	Copyright 2008-2009 NVIDIA Corporation.
=============================================================================*/

class ApexClothingAsset extends ApexAsset
	hidecategories(Object)
	native(Mesh);

struct native ClothingLodInfo
{
	/** Mapping of clothing submesh to material array */
	var() const init editfixedsize array<INT>	LODMaterialMap;
};
/** Clothing Material Mapping for each graphical lod level */
var() const editfixedsize array<ClothingLodInfo>	LodMaterialInfo;
var   native pointer                                          MApexAsset{class FIApexAsset};
/** Clothing material override. Used only when UseClothingAssetMaterial is checked in the skeletal mesh component. */
var() const editfixedsize array<MaterialInterface>	Materials;

/** ApexClothingLibrary is only for legacy APEX 0.9 assets. */
var const deprecated ApexGenericAsset ApexClothingLibrary;

var() const bool bUseHardwareCloth;						// if true use hardware clothing for simulation
var() const bool bFallbackSkinning;						// if true, falls back to skinning clothing in software instead of using GPU skinning
var() const bool bSlowStart;							// Designates the 'slowStart' flag; see APEX clothing documentation
var() const bool bRecomputeNormals;						// Designates the 'recomputeNormals' flag; see APEX clothing documentation
var() const bool bAllowAdaptiveTargetFrequency;			// Slightly modifies gravity to avoid high frequency jittering due to variable time steps.
var() const int UVChannelForTangentUpdate;				// Which UV channel is used for updating tangent space.
var() const float MaxDistanceBlendTime<ClampMin=0.0>;	// The maximimum distance blend time (see APEX clothing documentation)
var() const float ContinuousRotationThreshold;			// The angle in degrees to consider the clothing simulation continuous.
var() const float ContinuousDistanceThreshold;			// The distance to consider the clothing simulation continuous.
var() const bool  bResetAfterTeleport;					// If true, it resets the simulation after a teleport.
var() const float LodWeightsMaxDistance;				// LodWeightMaxDistance (see APEX clothing documentation)
var() const float LodWeightsDistanceWeight;				// LodWeightDistanceWeight (see APEX clothing documentation)
var() const float LodWeightsBias;						// LodWeightBias (see APEX clothing documentation)
var() const float LodWeightsBenefitsBias;				// LodWeightMaxBenefitsBias (see APEX clothing documentation)

/**
**  If true, cloth is simulated in local space.
**	Inertia effects are added based on inertiaScale (from the imported clothing asset) if 3.x simulation is used.
**	This needs to be turned off for 2.8.x cloth (unless collisions are filtered correctly).
**/
var() const bool bUseLocalSpaceSimulation;				

var bool bHasUniqueAssetMaterialNames;
var() const float LODDecayTime<ClampMin=0.0>;		// How fast LodWeightDistanceWeight is reduced to 0 when the clothing is not visible.

/** Sound cue to play when the clothing starts moving */
var(Sound) SoundCue					SoundOnMove;
/** Sound cue to play when clothing is moving*/
var(Sound) SoundCue					SoundOnRest;
/** Sound cue to play when the clothing is settling down */
var(Sound) SoundCue					SoundWhileMoving;

/** Speed above which the clothing is considered moving */
var(Sound) float						SpeedThresholdOnMove;
/** Speed below which the clothing is considered at rest */
var(Sound) float						SpeedThresholdOnRest;
/** Whether to ignore the triggers when the cloth first settles into place */
var(Sound) bool						    IgnoreInitialTrigger;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bUseHardwareCloth=True
   bSlowStart=True
   bResetAfterTeleport=True
   MaxDistanceBlendTime=1.000000
   ContinuousRotationThreshold=84.000000
   ContinuousDistanceThreshold=50.000000
   LodWeightsMaxDistance=10000.000000
   LodWeightsDistanceWeight=1.000000
   LODDecayTime=10.000000
   Name="Default__ApexClothingAsset"
   ObjectArchetype=ApexAsset'Engine.Default__ApexAsset'
}
