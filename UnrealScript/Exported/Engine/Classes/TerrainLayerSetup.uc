/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class TerrainLayerSetup extends Object
	native(Terrain)
	hidecategories(Object)
	collapsecategories;

struct FilterLimit
{
	var() bool	Enabled;
	var() float	Base,
				NoiseScale,
				NoiseAmount;
};

struct TerrainFilteredMaterial
{
	var() bool			UseNoise;
	var() float			NoiseScale,
						NoisePercent;

	var() FilterLimit	MinHeight;
	var() FilterLimit	MaxHeight;

	var() FilterLimit	MinSlope;
	var() FilterLimit	MaxSlope;

	var() float				Alpha;
	var() TerrainMaterial	Material;

	structdefaultproperties
	{
		Alpha=1.0
	}
};

var() const array<TerrainFilteredMaterial> Materials;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


/** called from Terrain::PostBeginPlay() to allow the layer to initialize itself for gameplay
 * @note this function will be called once for each terrain the layer is part of
 */
simulated function PostBeginPlay();

defaultproperties
{
   Name="Default__TerrainLayerSetup"
   ObjectArchetype=Object'Core.Default__Object'
}
