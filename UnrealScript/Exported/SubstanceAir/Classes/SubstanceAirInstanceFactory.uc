//! @file SubstanceAirInstanceFactory.uc
//! @author Antoine Gonzalez - Allegorithmic
//! @copyright Allegorithmic. All rights reserved.
//!
//! @brief the interface to a Substance Air Package

class SubstanceAirInstanceFactory extends Object
	native(InstanceFactory)
	hidecategories(Object);

// native code structure describing a package
// it contains the Substance Air data, the graphs and their instances
var native pointer SubstancePackage{struct SubstanceAir::FPackage};

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
   Name="Default__SubstanceAirInstanceFactory"
   ObjectArchetype=Object'Core.Default__Object'
}
