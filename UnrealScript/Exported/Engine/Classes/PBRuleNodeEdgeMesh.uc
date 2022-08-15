/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeEdgeMesh extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** Angle in degrees at which point surfaces are considered co-planar, and edge mesh is not added */
var()   float   FlatThreshold;

/** Amount to 'pull in' the main face from each edge, to reduce overlap between edge mesh and face meshes */
var()   float   MainXPullIn;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

defaultproperties
{
   FlatThreshold=5.000000
   NextRules(0)=(LinkName="Main")
   NextRules(1)=(LinkName="Edge")
   Name="Default__PBRuleNodeEdgeMesh"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
