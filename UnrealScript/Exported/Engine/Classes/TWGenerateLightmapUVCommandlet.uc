//=============================================================================
// TWGenerateLightmapUVCommandlet
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 3/7/2014
//=============================================================================

class TWGenerateLightmapUVCommandlet extends Commandlet
	native;

var int 	LightmapUVChannel;
var float 	MinChartSpacingPercent;
var float 	BorderSpacingPercent;
var bool 	bUseMaxStretch;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


// Point of entry for the commandlet
native event int Main( string Params );

defaultproperties
{
   LightmapUVChannel=1
   MinChartSpacingPercent=1.000000
   bUseMaxStretch=True
   Name="Default__TWGenerateLightmapUVCommandlet"
   ObjectArchetype=Commandlet'Core.Default__Commandlet'
}
