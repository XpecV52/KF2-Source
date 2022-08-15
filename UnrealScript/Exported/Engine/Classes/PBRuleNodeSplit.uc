/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeSplit extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object)	
	dependson(ProcBuildingRuleset);


var()   EProcBuildingAxis   SplitAxis;

struct native RBSplitInfo
{
	var()   bool    bFixSize;
	var()   float   FixedSize;
	var()   float   ExpandRatio;
	var()   name    SplitName;
	
	structdefaultproperties
	{
		bFixSize=false
		FixedSize=512.0
		ExpandRatio=1.0
	}
};

var()   array<RBSplitInfo>  SplitSetup;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   SplitAxis=EPBAxis_Z
   NextRules(1)=(LinkName="0")
   Name="Default__PBRuleNodeSplit"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
