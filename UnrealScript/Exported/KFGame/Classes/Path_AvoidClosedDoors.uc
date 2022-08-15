//=============================================================================
// Path_AvoidClosedDoors
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class Path_AvoidClosedDoors extends PathConstraint
	native(Waypoint);

var bool bOnlyAvoidWeldedDoors;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Maximum luminance (per navigation point) before adding extra costs */
//var() float	MaxLuminance;

static function bool AvoidClosedDoors( Pawn P, optional bool InOnlyAvoidWeldedDoors )
{
	local Path_AvoidClosedDoors Con;

	if( P != None )
	{
		Con = Path_AvoidClosedDoors( P.CreatePathConstraint(default.class) );
		if( Con != None )
		{
			Con.bOnlyAvoidWeldedDoors = InOnlyAvoidWeldedDoors;			
			P.AddPathConstraint( Con );
			return true;
		}
	}

	return false;
}

function Recycle()
{
	Super.Recycle();
	//MaxLuminance=default.MaxLuminance;
}

defaultproperties
{
   CacheIdx=14
   Name="Default__Path_AvoidClosedDoors"
   ObjectArchetype=PathConstraint'Engine.Default__PathConstraint'
}
