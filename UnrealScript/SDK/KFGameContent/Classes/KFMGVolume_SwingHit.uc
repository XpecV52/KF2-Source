//=============================================================================
// KFMGVolume_SwingHit
//=============================================================================
// Volume for the swing minigame. Does some shenanigans above our normal
//      systems to throw both a ragdolled Zed, as well as human momentum.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================

class KFMGVolume_SwingHit extends KFDynamicPhysicsVolume
    placeable;

struct SwingHitTracking
{
    var Actor HitActor;
    var float HitTime;
};
var array<SwingHitTracking> TrackedHits;

var() float RateLimiter;

var() bool bKnockdownZeds;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    local KFPawn_Human KFPH;
    local KFPawn_Monster KFPM;
    local Vector HitDirection;
    local int LastHitIdx;
    local SwingHitTracking NewHit;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);

    if (Role != ROLE_Authority)
    {
        return;
    }

    LastHitIdx = TrackedHits.Find('HitActor', Other);

    if (LastHitIdx != INDEX_NONE)
    {
        if (`TimeSince(TrackedHits[LastHitIdx].HitTime) < RateLimiter)
        {
            return;
        }

        TrackedHits.Remove(LastHitIdx, 1);
    }

    KFPH = KFPawn_Human(Other);
    KFPM = KFPawn_Monster(Other);

    if (KFPH != none || KFPM != none)
    {
        HitDirection = Other.Location - Location;
        HitDirection.Z = DamageType.default.KDeathUpKick;
        HitDirection = Normal(HitDirection);

        if (KFPH != none)
        {
            KFPH.HandleMomentum(HitDirection * DamageType.default.KDamageImpulse, HitLocation, DamageType);
        }
        else if (KFPM != none)
        {
            if (bKnockdownZeds)
            {
                KFPM.Knockdown(HitDirection * DamageType.default.KDamageImpulse, vect(1, 1, 1), , , , DamageType.default.KDamageImpulse * HitDirection, Location);
            }
            else
            {
                KFPM.HandleMomentum(HitDirection * DamageType.default.KDamageImpulse, HitLocation, DamageType);
            }
        }

        NewHit.HitActor = Other;
        NewHit.HitTime = WorldInfo.TimeSeconds;
        TrackedHits.AddItem(NewHit);
    }
}

defaultproperties
{
    RateLimiter=0.1
    bKnockdownZeds=true
}