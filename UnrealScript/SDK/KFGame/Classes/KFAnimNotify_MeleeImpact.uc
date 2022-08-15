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

/** Increase the weapon's melee range by 50% for this attack */
var bool bExtraReach;

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

/** Direction to use for fov-based swipe attacks */
// This gives more consistant results than using socket collision.  Socket collision
// is okay for location, but direction can change so quickly that the attack will
// depend on FPS.  This is especially bad when using AnimTree tick rate optimizations.
var() EPawnOctant SwipeDirection<EditCondition=bDoSwipeDamage>;

cpptext
{
	virtual void Notify( class UAnimNodeSequence* NodeSeq );
	virtual void NotifyTick( class UAnimNodeSequence* NodeSeq, FLOAT AnimCurrentTime, FLOAT AnimTimeStep, FLOAT InTotalDuration );

	virtual FString GetEditorComment() 
	{ 
		return TEXT("MeleeImpact"); 
	}
}

event NotifyFirstPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
	`warn("Deprecated function called --- Use KFAnimNotify_MeleeImpact_1P instead");
}

event NotifyThirdPerson(KFPawn P, AnimNodeSequence AnimSeqInstigator)
{
	P.MeleeImpactNotify(self);
}

defaultproperties
{
	NotifyColor=(R=255,G=0,B=0)
	DamageScale=1.f

	SwipeDirection=DIR_Forward
}