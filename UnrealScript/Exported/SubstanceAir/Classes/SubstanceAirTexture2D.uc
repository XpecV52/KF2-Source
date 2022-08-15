//! @file SubstanceAirTexture2D.uc
//! @author Antoine Gonzalez - Allegorithmic
//! @copyright Allegorithmic. All rights reserved.
//!
//! @brief class for textures generated from a Substance Air output

class SubstanceAirTexture2D extends Texture2D
	native(Texture)
	hidecategories(Object)
	config(Engine);

// The Output instance to get the Substance data from,
// copy so the original can be updated
var native pointer OutputCopy{struct SubstanceAir::FOutputInstance};

var native guid OutputGuid;

var native SubstanceAirGraphInstance ParentInstance;

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
   Name="Default__SubstanceAirTexture2D"
   ObjectArchetype=Texture2D'Engine.Default__Texture2D'
}
