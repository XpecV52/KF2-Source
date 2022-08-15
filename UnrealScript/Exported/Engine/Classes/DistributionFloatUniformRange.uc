/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DistributionFloatUniformRange extends DistributionFloat
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew;
	
/** 
 *	High value of the maximum end of the output float distribution. 
 *	Final value will be between [MinHigh..MinLow] or [MaxHigh..MaxLow]
 */
var()	float	MaxHigh;
/** 
 *	Low value of the maximum end of the output float distribution.
 *	Final value will be between [MinHigh..MinLow] or [MaxHigh..MaxLow]
 */
var()	float	MaxLow;

/** 
 *	High value of the minimum end of the output float distribution. 
 *	Final value will be between [MinHigh..MinLow] or [MaxHigh..MaxLow]
 */
var()	float	MinHigh;
/** 
 *	Low value of the minimum end of the output float distribution.
 *	Final value will be between [MinHigh..MinLow] or [MaxHigh..MaxLow]
 */
var()	float	MinLow;

/** 
 *	If TRUE, mirror the MaxHigh, MinHigh values in the MaxLow, MinLow values 
 *	ie, MinHigh = -MaxHigh; MinLow = -MaxLow
 */
var()	bool	bMirrorMaxMin;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bCanBeBaked=False
   Name="Default__DistributionFloatUniformRange"
   ObjectArchetype=DistributionFloat'Core.Default__DistributionFloat'
}
