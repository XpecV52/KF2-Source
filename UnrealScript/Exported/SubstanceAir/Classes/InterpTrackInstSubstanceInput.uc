//! @file InterpTrackInstSubstanceInput.uc
//! @copyright Allegorithmic. All rights reserved.
//!

class InterpTrackInstSubstanceInput extends InterpTrackInst
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Saved value for restoring state when exiting Matinee. */
var	array<int> ResetValue;

var InterpTrackSubstanceInput InstancedTrack;

defaultproperties
{
   Name="Default__InterpTrackInstSubstanceInput"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
