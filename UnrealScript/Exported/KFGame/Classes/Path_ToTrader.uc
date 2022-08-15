//=============================================================================
// Path_ToTrader
//=============================================================================
// Avoids any pathnodes flagged as bIgnoredByTraderTrail
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class Path_ToTrader extends PathConstraint
	native(Waypoint);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static function bool ToTrader( Pawn P )
{
	local Path_ToTrader PTT;

	if( P != None )
	{
		PTT = Path_ToTrader( P.CreatePathConstraint(default.class) );
		if( PTT != None )
		{
			P.AddPathConstraint( PTT );
			return true;
		}
	}

	return false;
}

defaultproperties
{
   CacheIdx=19
   Name="Default__Path_ToTrader"
   ObjectArchetype=PathConstraint'Engine.Default__PathConstraint'
}
