/**
* Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
*/
class Path_AlongLine extends PathConstraint
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Direction to move in */
var Vector	Direction;

static function bool AlongLine( Pawn P, Vector Dir )
{
	local Path_AlongLine Con;

	if( P != None && !IsZero( Dir ) )
	{
		Con = Path_AlongLine(P.CreatePathConstraint(default.class));
		if( Con != None )
		{
			Con.Direction = Dir;
			P.AddPathConstraint( Con );
			return TRUE;
		}
	}

	return FALSE;
}

function Recycle()
{
	Super.Recycle();
	Direction=vect(0,0,0);
}

defaultproperties
{
   CacheIdx=0
   Name="Default__Path_AlongLine"
   ObjectArchetype=PathConstraint'Engine.Default__PathConstraint'
}
