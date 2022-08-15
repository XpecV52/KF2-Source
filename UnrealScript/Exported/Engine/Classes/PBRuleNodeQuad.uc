/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeQuad extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** Material to apply to created quad. */
var()   MaterialInterface   Material;
/** How large each repeat of the texture is allowed to be along X. */
var()   float               RepeatMaxSizeX;
/** How large each repeat of the texture is allowed to be along Z. */
var()   float               RepeatMaxSizeZ;
/** Resolution of lightmap on this quad */
var()   int                 QuadLightmapRes;
/** Amount to offset this quad along Y */
var()	float				YOffset;
/** If TRUE, UV range will just be 0-1, and not repeating based on RepeatMaxSize */
var()	bool				bDisableMaterialRepeat;

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
   RepeatMaxSizeX=512.000000
   RepeatMaxSizeZ=512.000000
   QuadLightmapRes=32
   Name="Default__PBRuleNodeQuad"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
