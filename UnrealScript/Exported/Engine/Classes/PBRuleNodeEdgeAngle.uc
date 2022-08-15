/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeEdgeAngle extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** Enum to indicate the various edges of a scope */
enum EProcBuildingEdge
{
	EPBE_Top,
	EPBE_Bottom,
	EPBE_Left,
	EPBE_Right
};

/** Edge of scope that we want to look at angle of */
var()   EProcBuildingEdge   Edge;

/** Struct containing info about each decision angle */
struct native RBEdgeAngleInfo
{
	/** Angle (in degrees)  */
	var()   float    Angle;
	
	structdefaultproperties
	{
		Angle=0.0
	}
};

/** Set of angles of edge connection, each corresponds to an output of this node */
var()   array<RBEdgeAngleInfo>  Angles;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   Edge=EPBE_Left
   Name="Default__PBRuleNodeEdgeAngle"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
