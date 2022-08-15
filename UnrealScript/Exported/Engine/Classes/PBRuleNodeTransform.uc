/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeTransform extends PBRuleNodeBase
	native(ProcBuilding)
	collapsecategories
	hidecategories(Object);

/** Translation applied to to scope */
var()   DistributionVector      Translation;

/** Rotation (in degrees) applied to to scope */	
var()   DistributionVector      Rotation;

/** Scaling applied to to scope */
var()   DistributionVector      Scale;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__PBRuleNodeTransform"
   ObjectArchetype=PBRuleNodeBase'Engine.Default__PBRuleNodeBase'
}
