//=============================================================================
// KFAnim_Health
//=============================================================================
// Anim Node used to determine state based on health
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFAnim_Health extends AnimNodeBlendList
	native(Anim);

/** Current percent health of the actor */
var float HealthPct;

/** List of Health Pcts to switch between channels*/
var() array<float>	Constraints;

/** If set, calculate speed from owner's base instead of owner */
var() bool  bUseOwnersBase;

/** The last selected child index */
var int LastChannel;

/** Amount of time to blend between these anims */
var() float BlendTime;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

defaultproperties
{
   Constraints(0)=0.010000
   Constraints(1)=0.500000
   Constraints(2)=1.000000
   LastChannel=-1
   BlendTime=0.300000
   bPlayActiveChild=True
   Children(0)=(Name="Broken")
   Children(1)=(Name="Damaged")
   Children(2)=(Name="Normal")
   bFixNumChildren=True
   Name="Default__KFAnim_Health"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
