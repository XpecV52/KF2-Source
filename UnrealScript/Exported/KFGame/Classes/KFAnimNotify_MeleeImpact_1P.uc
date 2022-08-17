//=============================================================================
// KFAnimNotify_MeleeImpact_1P
//=============================================================================
// (FIrst Person) Triggers an event for melee collision and damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnimNotify_MeleeImpact_1P extends AnimNotify
	native(Anim);

/** If set, use hit box collision detection for this weapon */
var() bool bAdvancedCollisionDetection;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event NotifyFirstPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
	if ( P.MyKFWeapon != None && P.MyKFWeapon.IsMeleeing() )
	{
		P.MyKFWeapon.MeleeAttackHelper.MeleeImpactNotify(self);
	}
}

event NotifyThirdPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
	// do nothing
}

defaultproperties
{
   NotifyColor=(B=0,G=0,R=255,A=255)
   Name="Default__KFAnimNotify_MeleeImpact_1P"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
