/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MorphNodeWeightBase extends MorphNodeBase
	native(Anim)
	hidecategories(Object)
	abstract;

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

struct native MorphNodeConn
{
	/** Array of nodes attached to this connector. */
	var		array<MorphNodeBase>	ChildNodes;

	/** Name of this connector. */
	var		name					ConnName;

	/** Used in editor to draw line to this connector. */
	var		int						DrawY;
};

/** Array of connectors to which you can connect other MorphNodes. */
var		array<MorphNodeConn>	NodeConns;

defaultproperties
{
   CategoryDesc="Weight"
   Name="Default__MorphNodeWeightBase"
   ObjectArchetype=MorphNodeBase'Engine.Default__MorphNodeBase'
}
