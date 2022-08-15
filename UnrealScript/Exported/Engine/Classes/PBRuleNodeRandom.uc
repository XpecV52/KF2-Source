/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeRandom extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);
	

/** How many outputs are created for this node */
var()   INT     NumOutputs;
/** Min number of the outputs will be executed */
var()   INT     MinNumExecuted;
/** Max number of the outputs will be executed */
var()   INT     MaxNumExecuted;	

// (cpptext)
// (cpptext)
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
   NumOutputs=2
   MinNumExecuted=1
   MaxNumExecuted=1
   NextRules(0)=(LinkName="0")
   NextRules(1)=(LinkName="1")
   Name="Default__PBRuleNodeRandom"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
