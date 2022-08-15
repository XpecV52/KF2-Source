/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 */
class LandscapeLayerInfoObject extends Object
	native(Terrain);

var() Name LayerName;
var() PhysicalMaterial PhysMaterial;
var() float Hardness;
var editoronly bool bNoWeightBlend;

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
   Hardness=0.500000
   Name="Default__LandscapeLayerInfoObject"
   ObjectArchetype=Object'Core.Default__Object'
}
