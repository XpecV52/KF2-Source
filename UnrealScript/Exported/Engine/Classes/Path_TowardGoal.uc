/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class Path_TowardGoal extends PathConstraint
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Goal trying to find path toward */
var Actor	GoalActor;

static function bool TowardGoal( Pawn P, Actor Goal )
{
	local Path_TowardGoal Con;

	if( P != None && Goal != None )
	{
		Con = Path_TowardGoal(P.CreatePathConstraint(default.class));
		if( Con != None )
		{
			Con.GoalActor = Goal;
			P.AddPathConstraint( Con );
			return TRUE;
		}
	}

	return FALSE;
}

function Recycle()
{
	Super.Recycle();
	GoalActor=none;
}

defaultproperties
{
   CacheIdx=1
   Name="Default__Path_TowardGoal"
   ObjectArchetype=PathConstraint'Engine.Default__PathConstraint'
}
