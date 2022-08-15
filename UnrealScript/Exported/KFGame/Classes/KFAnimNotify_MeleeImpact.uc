//=============================================================================
// KFAnimNotify_MeleeImpact
//=============================================================================
// (Third Person) Triggers an event for melee collision and damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnimNotify_MeleeImpact extends AnimNotify
	native(Anim);

/** AI - Damage Modifier */
var() float DamageScale;

/** AI - Apply damage to multiple nearby actors */
var() bool bDoAreaDamage;
/** AI - Complex collision type that hits multiple targets.  Supports notify duration. */
var() bool bDoSwipeDamage;

/** AI - cause target to be knocked back upon impact */
var() bool bCanDoKnockback;
/** AI - If set, hits have a 3% chance to trigger zed time */
var() bool bCanCauseZedTime;

/** AI - Momentum transfer amount to scale default melee momentum transfer by */
var() float MomentumTransferScale<EditCondition=bCanDoKnockback>;

/** AI - Damagetype to override default melee damagetype with */
var() class<KFDamageType> CustomDamageType<AllowAbstract>;

/** AI - Attack reach -- overrides default reach in melee helper */
var() float AttackReachOverride<EditCondition=!bDoSwipeDamage>;

/** Direction to use for fov-based swipe attacks */
// This gives more consistant results than using socket collision.  Socket collision
// is okay for location, but direction can change so quickly that the attack will
// depend on FPS.  This is especially bad when using AnimTree tick rate optimizations.
var() EPawnOctant SwipeDirection<EditCondition=bDoSwipeDamage>;

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

event NotifyFirstPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
	WarnInternal("Deprecated function called --- Use KFAnimNotify_MeleeImpact_1P instead");
}

event NotifyThirdPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
	P.MeleeImpactNotify(self);
}

defaultproperties
{
   DamageScale=1.000000
   MomentumTransferScale=1.000000
   NotifyColor=(B=0,G=0,R=255,A=255)
   Name="Default__KFAnimNotify_MeleeImpact"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
