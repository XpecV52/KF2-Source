//=============================================================================
// KFAiBallisticProjectileFireBehavior
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAiLeapBehavior extends KFAiBaseRangedBehavior
	native(AI);

var transient array<Vector> CalculatedArc;
var transient array<Vector> ArcImpacts;

var (LeapCalc) color ValidArcColor;
var (LeapCalc) color InValidArcColor;


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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


/* Chad's Version of an epic methods ===============================================
* ::SuggestLeapVelocity()
*
* returns a recommended leap velocity vector, given a destination and a leap speed magnitude
* @param outLeapVelocity - out param stuffed with the computed velocity to use
* @param End - desired end point of arc
* @param Start - desired start point of arc
* @param DesiredLeapSpeed - in the magnitude of the leap - assumed to only change due to gravity for the entire lifetime of the projectile
* @param BaseLeapZ - is an additional Z direction force added to the leap (which will not be included in the returned outLeapVelocity) - (defaults to 0)
* @param DesiredZPct (optional) - is the requested pct of the leap in the z direction (0=leap horizontally, 0.5 = leap at 45 degrees).  This is the starting point for finding a leap.  (Defaults to 0.05).
*		the purpose of this is to bias the test in cases where there is more than one solution
* @param CollisionSize (optional) - is the size of bunding box of the leaping actor (defaults to (0,0,0)
* @param TerminalVelocity (optional) - terminal velocity of the projectile
* @param OverrideGravityZ (optional) - gravity inflicted upon the projectile in the z direction
* @param bOnlyTraceUp  (optional) - when TRUE collision checks verifying the arc will only be done along the upward portion of the arc
* @return - TRUE/FALSE depending on whether a valid arc was computed
*/
native noexport final function bool SuggestLeapVelocity(out vector outLeapVelocity,
														vector Destination,
														vector Start,
														float DesiredLeapSpeed,
														optional float MinSpeedAllowed,
														optional float MaxSpeedAllowed,
														optional float BaseLeapZ,
														optional float DesiredZPct,
														optional vector CollisionSize,
														optional float TerminalVelocity,
														optional float OverrideGravityZ /* = GetGravityZ() */,
														optional bool bUseDeadReckoning,
														optional const vector TargetVelocity,
														optional bool bOnlyTraceUp,
														optional bool bShowDebugArtifacts,
														optional bool bPreLobCalc,
														optional int LobStrikeValidationIdx );


function DrawDebugLastValidLeapArcCalced( vector FromLoc )
{
	local int idx;
	local vector lastArcLoc;

	lastArcLoc = FromLoc;

	for( idx = 0; idx < CalculatedArc.Length; ++idx )
	{
		DrawDebugLine( lastArcLoc, CalculatedArc[idx], ValidArcColor.R, ValidArcColor.G, ValidArcColor.B, true );
		lastArcLoc = CalculatedArc[idx];
	}
} 

function DrawDebugLastLeapArcCalcedArcImpacts()
{
	local int idx;

	for( idx = 0; idx < ArcImpacts.Length; ++idx )
	{
		DrawDebugStar( ArcImpacts[idx], 25,  InValidArcColor.R, InValidArcColor.G, InValidArcColor.B, true );
	}
}

defaultproperties
{
   ValidArcColor=(B=0,G=140,R=255,A=255)
   InValidArcColor=(B=71,G=40,R=252,A=255)
   Name="Default__KFAiLeapBehavior"
   ObjectArchetype=KFAiBaseRangedBehavior'KFGame.Default__KFAiBaseRangedBehavior'
}
