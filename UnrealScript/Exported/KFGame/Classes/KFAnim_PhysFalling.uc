//=============================================================================
// KFAnim_PhysFalling
//=============================================================================
// AnimNodeBlendList for Jump/Fall/Land animations
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnim_PhysFalling extends AnimNodeBlendList
	native(Anim);

enum EJumpBlendChild
{
	EJBC_Walk,
	EJBC_Jump,
	EJBC_Fall,
	EJBC_Land
};

/** Custom blend in time for each child */
var() editfixedsize array<float> ChildBlendInTime;

/** If > 0, then always play the land anim (move/slide) for a short time */
var() float MinLandPlayTime;

/** Set when fall is started.  If time passed is small don't play land */
var transient float SkipLandTimeLeft;

/** Set by InitAnimTree if land child is valid */
var transient AnimNodeSequence LandNodeSeq;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

	

defaultproperties
{
   ChildBlendInTime(0)=0.330000
   ChildBlendInTime(1)=0.330000
   ChildBlendInTime(2)=0.330000
   ChildBlendInTime(3)=0.100000
   bPlayActiveChild=True
   bForceChildFullWeightWhenBecomingRelevant=False
   Children(0)=(Name="Walking")
   Children(1)=(Name="Jump Up")
   Children(2)=(Name="Falling")
   Children(3)=(Name="Land")
   bFixNumChildren=True
   Name="Default__KFAnim_PhysFalling"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
