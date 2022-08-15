/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeOcclusion extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object)	
	dependson(ProcBuildingRuleset);


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
   NextRules(0)=(LinkName="Clear")
   NextRules(1)=(LinkName="Partial")
   NextRules(2)=(LinkName="bLocked")
   Name="Default__PBRuleNodeOcclusion"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
