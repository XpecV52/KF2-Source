/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetWorldAttractorParam extends SequenceAction
	native(Sequence)
	dependson(WorldAttractor);

/**
 *  Array of all the attractors to apply these settings to.
 */
var() array<WorldAttractor> Attractor;

var bool bEnabledField;
var bool bFalloffTypeField;
var bool bFalloffExponentField;
var bool bRangeField;
var bool bStrengthField;

/**
 *  TRUE if the attractor should be enabled, FALSE disables the attractor.
 */
var() bool bEnabled<EditCondition=bEnabledField>;

/**
 *  Type of falloff.
 */
var() EWorldAttractorFalloffType FalloffType<EditCondition=bFalloffTypeField>;

/**
 *  Optional falloff exponent for FOFF_Exponent type.
 */
var() rawdistributionfloat FalloffExponent<EditCondition=bFalloffExponentField>;

/**
 *  Range of the attractor.
 */
var() rawdistributionfloat Range<EditCondition=bRangeField>;

/**
 *  Strength of the attraction over time.
 */
var() rawdistributionfloat Strength<EditCondition=bStrengthField>;

defaultproperties
{
   bEnabled=True
   FalloffExponent=(Distribution=DistributionFalloffExponent,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Range=(Distribution=DistributionRange,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   Strength=(Distribution=DistributionStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   ObjName="Set World Attractor Param"
   ObjCategory="Attractor"
   Name="Default__SeqAct_SetWorldAttractorParam"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
