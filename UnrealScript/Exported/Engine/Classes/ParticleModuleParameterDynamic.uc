/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 */
class ParticleModuleParameterDynamic extends ParticleModuleParameterBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/**
 *	EmitterDynamicParameterValue
 *	Enumeration indicating the way a dynamic parameter should be set.
 */
enum EEmitterDynamicParameterValue
{
	/** UserSet - use the user set values in the distribution (the default) */
	EDPV_UserSet,
	/** VelocityX - pass the particle velocity along the X-axis thru */
	EDPV_VelocityX,
	/** VelocityY - pass the particle velocity along the Y-axis thru */
	EDPV_VelocityY,
	/** VelocityZ - pass the particle velocity along the Z-axis thru */
	EDPV_VelocityZ,
	/** VelocityMag - pass the particle velocity magnitude thru */
	EDPV_VelocityMag
};

/** Helper structure for displaying the parameter. */
struct native EmitterDynamicParameter
{
	/** The parameter name - from the material DynamicParameter expression. READ-ONLY */
	var() editconst name					ParamName;
	/** If TRUE, use the EmitterTime to retrieve the value, otherwise use Particle RelativeTime. */
	var() bool								bUseEmitterTime;
	/** If TRUE, only set the value at spawn time of the particle, otherwise update each frame. */
	var() bool								bSpawnTimeOnly;
	/** Where to get the parameter value from. */
	var() EEmitterDynamicParameterValue		ValueMethod;
	/** If TRUE, scale the velocity value selected in ValueMethod by the evaluated ParamValue. */
	var() bool								bScaleVelocityByParamValue;
	/** The distriubtion for the parameter value. */
	var() rawdistributionfloat				ParamValue;
};

/** The dynamic parameters this module uses. */
var() editfixedsize array<EmitterDynamicParameter>	DynamicParams;

/** Flags for optimizing update */
var int UpdateFlags;
var bool bUsesVelocity;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   DynamicParams(0)=(ParamValue=(Distribution=DistributionParam1,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000)))
   DynamicParams(1)=(ParamValue=(Distribution=DistributionParam2,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000)))
   DynamicParams(2)=(ParamValue=(Distribution=DistributionParam3,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000)))
   DynamicParams(3)=(ParamValue=(Distribution=DistributionParam4,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000)))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleParameterDynamic"
   ObjectArchetype=ParticleModuleParameterBase'Engine.Default__ParticleModuleParameterBase'
}
