//! @file InterpTrackSubstanceInput.uc
//! @copyright Allegorithmic. All rights reserved.
//!

class InterpTrackSubstanceInput extends InterpTrackLinearColorBase
	native(Interpolation);

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

/** Name of parameter in the GraphInstance which will be modified over time by this track. */
var() name ParamName;
var int NumSubcurve;

defaultproperties
{
   TrackInstClass=Class'substanceair.InterpTrackInstSubstanceInput'
   TrackTitle="Substance Graph Instance Input"
   Name="Default__InterpTrackSubstanceInput"
   ObjectArchetype=InterpTrackLinearColorBase'Engine.Default__InterpTrackLinearColorBase'
}
