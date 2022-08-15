/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshGoalFilter_MinPathDistance extends NavMeshGoal_Filter
	native(AI);

var transient protected int MinDistancePathShouldBe;


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


static function bool MustBeLongerPathThan( NavMeshGoal_GenericFilterContainer FilterContainer, int InMinDistancePathShouldBe )
{
	local NavMeshGoalFilter_MinPathDistance	Eval;

	if( FilterContainer != None )
	{
		Eval = NavMeshGoalFilter_MinPathDistance(FilterContainer.GetFilterOfType(default.class));

		if( Eval != None )
		{
			Eval.MinDistancePathShouldBe = InMinDistancePathShouldBe;
			FilterContainer.GoalFilters.AddItem(Eval);
			return TRUE;
		}
	}

	return FALSE;
}

defaultproperties
{
   Name="Default__NavMeshGoalFilter_MinPathDistance"
   ObjectArchetype=NavMeshGoal_Filter'Engine.Default__NavMeshGoal_Filter'
}
