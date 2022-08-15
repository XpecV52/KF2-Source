//=============================================================================
// KFHUDTimerHelper
//=============================================================================
// Used to tick UI when the game is paused. 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 12/11/2013
//=============================================================================

class KFHUDTimerHelper extends Actor;

function UpdateTickDisabled(bool bInDisabled)
{
	SetTickIsDisabled(bInDisabled);
}

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   bAlwaysTick=True
   Name="Default__KFHUDTimerHelper"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
