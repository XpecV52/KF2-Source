/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeVariation extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);
	
/** If TRUE, choose output based on variation of scope to left of this one, rather than this one. */
var()	bool	bVariationOfScopeOnLeft;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   NextRules(0)=(LinkName="Default")
   Name="Default__PBRuleNodeVariation"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
