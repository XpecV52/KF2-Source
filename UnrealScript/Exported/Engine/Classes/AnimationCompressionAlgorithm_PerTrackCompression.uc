/**
 * Keyframe reduction algorithm that removes keys which are linear interpolations of surrounding keys, as
 * well as choosing the best bitwise compression for each track independently.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimationCompressionAlgorithm_PerTrackCompression extends AnimationCompressionAlgorithm_RemoveLinearKeys
	hidecategories(AnimationCompressionAlgorithm)
	native(Anim);

/** Maximum threshold to use when replacing a component with zero. Lower values retain more keys, but yield less compression. */
var(PerTrack) float	MaxZeroingThreshold;

/** Maximum position difference to use when testing if an animation key may be removed. Lower values retain more keys, but yield less compression. */
var(PerTrack) float	MaxPosDiffBitwise;

/** Maximum angle difference to use when testing if an animation key may be removed. Lower values retain more keys, but yield less compression. */
var(PerTrack) float	MaxAngleDiffBitwise;

/** Which encoding formats is the per-track compressor allowed to try on rotation keys */
var(PerTrack) array<AnimationCompressionFormat>	AllowedRotationFormats;

/** Which encoding formats is the per-track compressor allowed to try on translation keys */
var(PerTrack) array<AnimationCompressionFormat>	AllowedTranslationFormats;


/** If TRUE, resample the animation to ResampleFramerate frames per second */
var(Resampling)	bool	bResampleAnimation;

/** When bResampleAnimation is true, this defines the desired framerate */
var(Resampling)	float	ResampledFramerate<ClampMin=1.0 | ClampMax=30.0 | EditCondition=bResampleAnimation>;

/** Animations with fewer keys than MinKeysForResampling will not be resampled. */
var(Resampling)	int		MinKeysForResampling;


/** If TRUE, adjust the error thresholds based on the 'height' within the skeleton */
var(AdaptiveError) bool	bUseAdaptiveError;

/** If TRUE, uses MinEffectorDiff as the threhsold for end effectors */
var(AdaptiveError) bool	bUseOverrideForEndEffectors;

/** A bias added to the track height before using it to calculate the adaptive error */
var(AdaptiveError) int	TrackHeightBias;

/**
 * Reduces the error tolerance the further up the tree that a key occurs
 *    EffectiveErrorTolerance = Max(BaseErrorTolerance / Power(ParentingDivisor, Max(Height+Bias,0) * ParentingDivisorExponent), ZeroingThreshold)
 * Only has an effect bUseAdaptiveError is TRUE
 */
var(AdaptiveError) float	ParentingDivisor<ClampMin = 1.0>;

/**
 * Reduces the error tolerance the further up the tree that a key occurs
 *    EffectiveErrorTolerance = Max(BaseErrorTolerance / Power(ParentingDivisor, Max(Height+Bias,0) * ParentingDivisorExponent), ZeroingThreshold)
 * Only has an effect bUseAdaptiveError is TRUE
 */
var(AdaptiveError) float	ParentingDivisorExponent<ClampMin = 0.1>;


/**
 * If true, the adaptive error system will determine how much error to allow for each track, based on the
 * error introduced in end effectors due to errors in the track.
 */
var(AdaptiveError2) bool	bUseAdaptiveError2;

/**
 * This ratio determines how much error in end effector rotation can come from a given track's rotation error or translation error.
 * If 1, all of it must come from rotation error, if 0.5, half can come from each, and if 0.0, all must come from translation error.
 */
var(AdaptiveError2) float	RotationErrorSourceRatio<ClampMin = 0.0 | ClampMax = 1.0>;

/**
 * This ratio determines how much error in end effector translation can come from a given track's rotation error or translation error.
 * If 1, all of it must come from rotation error, if 0.5, half can come from each, and if 0.0, all must come from translation error.
 */
var(AdaptiveError2) float	TranslationErrorSourceRatio<ClampMin = 0.0 | ClampMax = 1.0>;

/**
 * A fraction that determines how much of the total error budget can be introduced by any particular track
 */
var(AdaptiveError2) float	MaxErrorPerTrackRatio<ClampMin = 0.0 | ClampMax = 1.0>;

/**
 * How big of a perturbation should be made when probing error propagation
 */
var float	PerturbationProbeSize;

/**
 * Cached metastructures used within DoReduction, tied to a particular sequence and mesh
 */
var const native transient pointer PerReductionCachedData{struct FPerTrackCachedInfo};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   MaxZeroingThreshold=0.000200
   MaxPosDiffBitwise=0.007000
   MaxAngleDiffBitwise=0.002000
   AllowedRotationFormats(0)=ACF_Identity
   AllowedRotationFormats(1)=ACF_Fixed48NoW
   AllowedTranslationFormats(0)=ACF_Identity
   AllowedTranslationFormats(1)=ACF_IntervalFixed32NoW
   AllowedTranslationFormats(2)=ACF_Fixed48NoW
   ResampledFramerate=15.000000
   MinKeysForResampling=10
   TrackHeightBias=1
   ParentingDivisor=1.000000
   ParentingDivisorExponent=1.000000
   RotationErrorSourceRatio=0.800000
   TranslationErrorSourceRatio=0.800000
   MaxErrorPerTrackRatio=0.300000
   PerturbationProbeSize=0.001000
   bRetarget=False
   bActuallyFilterLinearKeys=False
   Description="Compress each track independently"
   Name="Default__AnimationCompressionAlgorithm_PerTrackCompression"
   ObjectArchetype=AnimationCompressionAlgorithm_RemoveLinearKeys'Engine.Default__AnimationCompressionAlgorithm_RemoveLinearKeys'
}
