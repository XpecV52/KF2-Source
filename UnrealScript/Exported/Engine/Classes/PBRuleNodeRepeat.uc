/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeRepeat extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object)	
	dependson(ProcBuildingRuleset);


var()   EProcBuildingAxis   RepeatAxis;

var()   float               RepeatMaxSize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

defaultproperties
{
   RepeatAxis=EPBAxis_Z
   RepeatMaxSize=512.000000
   Name="Default__PBRuleNodeRepeat"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
