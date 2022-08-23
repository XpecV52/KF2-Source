//=============================================================================
// KFSeqAct_SetPawnIconVisibility
//=============================================================================
// Action that turns non-visible pawn HUD icons on or off
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Matt "Squirrlz" Farber
//=============================================================================
class KFSeqAct_SetPawnIconVisibility extends SequenceAction
	hideCategories(SequenceAction);

event Activated()
{
	local KFGameReplicationInfo KFGRI;

	// Check for show/hide
	if( InputLinks[0].bHasImpulse )
	{
		// Show
		KFGRI = KFGameReplicationInfo( class'WorldInfo'.static.GetWorldInfo().GRI );
		if( KFGRI != none )
		{
			KFGRI.bHidePawnIcons = false;
		}
	}
	else if( InputLinks[1].bHasImpulse )
	{
		// Hide
		KFGRI = KFGameReplicationInfo( class'WorldInfo'.static.GetWorldInfo().GRI );
		if( KFGRI != none )
		{
			KFGRI.bHidePawnIcons = true;
		}
	}
}

defaultproperties
{
   InputLinks(0)=(LinkDesc="Show")
   InputLinks(1)=(LinkDesc="Hide")
   ObjName="Set Pawn Icon Visibility"
   ObjCategory="Killing Floor"
   Name="Default__KFSeqAct_SetPawnIconVisibility"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
