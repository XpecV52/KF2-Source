/*******************************************************************************
 * KFMeleeHelperAI generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMeleeHelperAI extends KFMeleeHelperBase within Actor
    native;

struct native SwipeHitActorData
{
    var transient KFPawn HitActor;
    var transient float LastHitTime;

    structdefaultproperties
    {
        HitActor=none
        LastHitTime=0
    }
};

struct native DelayedMeleeInfo
{
    var Pawn Victim;
    var int Damage;
    var float Momentum;
    var float TimeOfDamage;
    var class<KFDamageType> DamageType;

    structdefaultproperties
    {
        Victim=none
        Damage=0
        Momentum=0
        TimeOfDamage=0
        DamageType=none
    }
};

/** The default damage applied to each melee hit */
var() float BaseDamage;
/** Default DamageType class */
var() const class<KFDamageType> MyDamageType;
/** How much base physics push force an attack will cause */
var() float MomentumTransfer;
var transient array<SwipeHitActorData> SwipedActors;
var bool bTrackSwipeHits;
var float PlayerDoorDamageMultiplier;
var float PlayerControlledFOV;
var float MeleeImpactCamScale;
var array<DelayedMeleeInfo> PendingDamage;
var int MaxPingCompensation;
var float PingCompensationScale;

function ApplyMeleeDamage(Actor Victim, int Damage, optional float InMomentum, optional class<KFDamageType> inDamageType, optional Vector HitLocation)
{
    local Vector HitDirection;
    local KFPawn_Monster InstigatorPawn;

    InMomentum = 1;        
    Damage = Max(Damage, 1);
    InstigatorPawn = KFPawn_Monster(Outer.Instigator);
    if(InstigatorPawn != none)
    {
        InstigatorPawn.NotifyMeleeDamageDealt();
        if(InstigatorPawn.MyKFAIC != none)
        {
            InstigatorPawn.MyKFAIC.NotifyMeleeDamageDealt();
        }
        Damage = InstigatorPawn.GetRallyBoostDamage(Damage);
    }
    if(IsZero(HitLocation))
    {
        HitLocation = Victim.Location;
        HitLocation.Z += FRand();
    }
    HitDirection = Normal(HitLocation - Outer.Instigator.Location);
    Victim.TakeDamage(Damage, Outer.Instigator.Controller, HitLocation, HitDirection * InMomentum, inDamageType,, Outer);
    PlayMeleeHitEffects(Victim, HitLocation, HitDirection);
    if(bLogMelee)
    {
        LogInternal((((string(Victim) $ "**** Melee attack!  BaseDamage=") @ string(BaseDamage)) @ ", ModifiedDamage=") @ string(Damage));
    }
}

function bool ShouldDealDamageToEnemy(Actor Target, optional float Range)
{
    local Vector VectToEnemy, HitLoc, HitNormal;
    local Actor HitActor;
    local TraceHitInfo HitInfo;
    local Vector TraceOffset;

    Range = MaxHitRange;
    VectToEnemy = Target.Location - Outer.Location;
    if(VSizeSq(VectToEnemy) > Square(Range))
    {
        return false;
    }
    if((Normal(VectToEnemy) Dot vector(Outer.Instigator.Rotation)) < 0)
    {
        return false;
    }
    HitActor = Outer.Trace(HitLoc, HitNormal, Target.Location, Outer.Location, false,, HitInfo);
    if(((HitActor != none) && HitInfo.HitComponent != none) && HitInfo.HitComponent.BlockActors)
    {
        TraceOffset = Outer.Instigator.BaseEyeHeight * vect(0, 0, 1);
        HitActor = Outer.Trace(HitLoc, HitNormal, Target.Location + TraceOffset, Outer.Location + TraceOffset, false,, HitInfo);
        if(((HitActor != none) && HitInfo.HitComponent != none) && HitInfo.HitComponent.BlockActors)
        {
            return false;
        }
    }
    return true;
}

function bool DoAreaImpact(int Damage, optional float MomentumScalar, optional class<KFDamageType> DamageType, optional float Range, optional float InFOVCosine, optional bool bPlayersOnly)
{
    local KFPawn KFP;
    local bool bFoundHit;

    MomentumScalar = 1;
    DamageType = MyDamageType;
    Range = MaxHitRange;
    InFOVCosine = 0;    
    foreach Outer.WorldInfo.AllPawns(Class'KFPawn', KFP, Outer.Location, Range)
    {
        if(bPlayersOnly && !KFP.IsHumanControlled())
        {
            continue;            
        }
        if((RateMeleeVictim(KFP, Outer.Location, Outer.Location + (Normal(vector(Outer.Instigator.Rotation)) * Range), Range, InFOVCosine)) > 0)
        {
            ApplyMeleeDamage(KFP, Damage, MomentumScalar, DamageType);
            bFoundHit = true;
        }        
    }    
    return bFoundHit;
}

function bool DoPlayerControlledImpact(int Damage, optional float MomentumScalar, optional class<KFDamageType> DamageType)
{
    local bool bHitPawn;

    MomentumScalar = 1;
    DamageType = MyDamageType;
    bHitPawn = DoAreaImpact(Damage, MomentumScalar, DamageType,, PlayerControlledFOV);
    if(!bHitPawn)
    {
        DoPlayerWorldTrace(Damage, MomentumScalar, MyDamageType);
    }
    return bHitPawn;
}

function bool DoPlayerWorldTrace(int Damage, optional float MomentumScalar, optional class<KFDamageType> DamageType)
{
    local Vector StartTrace, EndTrace, HitLocation, HitNormal;
    local Actor HitActor;

    MomentumScalar = 1;
    DamageType = MyDamageType;
    StartTrace = GetMeleeStartTraceLocation();
    EndTrace = StartTrace + (vector(GetMeleeAimRotation()) * MaxHitRange);
    HitActor = TraceNoPawns(HitLocation, HitNormal, EndTrace, StartTrace);
    if(HitActor != none)
    {
        if(HitActor.bCanBeDamaged && HitActor.IsA('KFDoorActor'))
        {
            Damage *= PlayerDoorDamageMultiplier;
        }
        ApplyMeleeDamage(HitActor, Damage, MomentumScalar, DamageType, HitLocation);
        return true;
    }
    return false;
}

simulated function PlayMeleeHitEffects(Actor Target, Vector HitLocation, Vector HitDirection, optional bool bShakeInstigatorCamera)
{
    bShakeInstigatorCamera = true;
    super.PlayMeleeHitEffects(Target, HitLocation, HitDirection);
    if(bShakeInstigatorCamera && Outer.Instigator.IsHumanControlled())
    {
        PlayerController(Outer.Instigator.Controller).ClientPlayCameraShake(MeleeImpactCamShake, MeleeImpactCamScale, true, 2, rotator(-HitDirection));
    }
}

function MeleeImpactNotify(KFAnimNotify_MeleeImpact Notify)
{
    local KFAIController KFAIC;
    local float MomentumScalar;
    local bool bDealtDmg;
    local class<KFDamageType> CurrentDamageType;

    if((Outer.Instigator == none) || (Outer.Instigator.Role < ROLE_Authority) && !Outer.Instigator.IsLocallyControlled())
    {
        return;
    }
    MomentumScalar = ((Notify.bCanDoKnockback) ? Notify.MomentumTransferScale * MomentumTransfer : 1);
    KFAIC = KFAIController(Outer.Instigator.Controller);
    CurrentDamageType = ((Notify.CustomDamageType != none) ? Notify.CustomDamageType : MyDamageType);
    if((KFAIC != none) && (KFAIC.DoorEnemy != none) || KFAIC.ActorEnemy != none)
    {
        bDealtDmg = CheckEnemyImpact(int(Notify.DamageScale * BaseDamage), MomentumScalar, CurrentDamageType);        
    }
    else
    {
        if(Notify.bDoAreaDamage)
        {
            bDealtDmg = DoAreaImpact(int(Notify.DamageScale * BaseDamage), MomentumScalar, CurrentDamageType);            
        }
        else
        {
            if(Notify.bDoSwipeDamage)
            {
                bDealtDmg = DoSwipeImpact(int(Notify.DamageScale * BaseDamage), Notify.SwipeDirection, MomentumScalar,,, CurrentDamageType);                
            }
            else
            {
                if(Outer.Instigator.IsHumanControlled())
                {
                    bDealtDmg = DoPlayerControlledImpact(int(Notify.DamageScale * BaseDamage), MomentumScalar, CurrentDamageType);                    
                }
                else
                {
                    bDealtDmg = CheckEnemyImpact(int(Notify.DamageScale * BaseDamage), MomentumScalar, CurrentDamageType, ((Notify.AttackReachOverride > 0) ? Notify.AttackReachOverride : MaxHitRange));
                }
            }
        }
    }
    if(bDealtDmg && Notify.bCanCauseZedTime)
    {
        KFGameInfo(Outer.WorldInfo.Game).DramaticEvent(0.03);
    }
}

protected function bool CheckEnemyImpact(int Damage, float MomentumScalar, optional class<KFDamageType> inDamageType, optional float AttackReachOverride)
{
    local KFAIController AIC;

    inDamageType = MyDamageType;
    AttackReachOverride = MaxHitRange;
    AIC = KFAIController(Outer.Instigator.Controller);
    if(AIC != none)
    {
        if((AIC.Enemy != none) && ShouldDealDamageToEnemy(AIC.Enemy, AttackReachOverride))
        {
            ResolvePawnMeleeDamage(AIC.Enemy, Damage, MomentumScalar, inDamageType);
            return true;            
        }
        else
        {
            if((AIC.DoorEnemy != none) && VSizeSq(Outer.Location - AIC.DoorEnemy.Location) < Square(500))
            {
                ApplyMeleeDamage(AIC.DoorEnemy, Damage, MomentumScalar, inDamageType);
                return true;                
            }
            else
            {
                if((AIC.ActorEnemy != none) && VSizeSq(Outer.Location - AIC.ActorEnemy.Location) < Square(500))
                {
                    if(KFDestructibleActor(AIC.ActorEnemy) != none)
                    {
                        ApplyMeleeDamage(AIC.ActorEnemy, Damage, MomentumScalar, inDamageType);
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

protected function bool DoSwipeImpact(int Damage, optional KFPawn.EPawnOctant SwipeDir, optional float MomentumScalar, optional float Range, optional bool bPlayersOnly, optional class<KFDamageType> inDamageType)
{
    local Pawn P;
    local Vector HitLoc, HitNorm;
    local Actor HitActor;
    local Vector ConeDir, ConeStart;
    local float ConeRange;
    local bool bFoundHit;

    SwipeDir = 0;
    MomentumScalar = 1;
    Range = MaxHitRange;    
    inDamageType = MyDamageType;
    ConeDir = GetSwipeVector(SwipeDir);
    ConeStart = Outer.Location + vect(0, 0, 32);
    ConeRange = Range;
    if(bLogMelee)
    {
        Outer.DrawDebugCone(ConeStart, ConeDir, ConeRange, Acos(0.7071), Acos(0.7071), 16, MakeColor(64, 64, 64, 0), true);
    }
    foreach Outer.WorldInfo.AllPawns(Class'Pawn', P, Outer.Location, ConeRange)
    {
        if((P == Outer.Instigator) || P.bTearOff)
        {
            continue;            
        }
        if(bPlayersOnly && !P.IsHumanControlled())
        {
            continue;            
        }
        if((Normal2D(P.Location - ConeStart) Dot ConeDir) < 0.7071)
        {
            if(bLogMelee)
            {
                LogInternal((((string(GetFuncName()) @ "rejected:") @ string(P)) $ ", dot:") @ string(Normal(P.Location - ConeStart) Dot ConeDir));
            }
            continue;            
        }
        HitActor = Outer.Trace(HitLoc, HitNorm, P.Location + (P.BaseEyeHeight * vect(0, 0, 1)), Outer.Location, false,,, Outer.8);
        if((HitActor != none) && HitActor != P)
        {
            if(bLogMelee)
            {
                LogInternal((((string(GetFuncName()) @ "rejected:") @ string(P)) $ ", melee obstruction:") @ string(HitActor));
            }
            continue;            
        }
        ProcessSwipeHit(P, Damage, MomentumScalar, inDamageType);
        bFoundHit = true;        
    }    
    if((!bFoundHit && SwipeDir == 0) && Outer.Instigator.IsHumanControlled())
    {
        DoPlayerWorldTrace(Damage, MomentumScalar, MyDamageType);
    }
    if(bLogMelee && bFoundHit)
    {
        Outer.DrawDebugCone(ConeStart, ConeDir, ConeRange, Acos(0.7071), Acos(0.7071), 16, MakeColor(255, 0, 0, 255), true);
    }
    return bFoundHit;
}

protected function Vector GetSwipeVector(KFPawn.EPawnOctant SwipeDir)
{
    local Rotator R;

    switch(SwipeDir)
    {
        case 4:
            R = rot(0, -8192, 0);
            break;
        case 2:
            R = rot(0, -16384, 0);
            break;
        case 6:
            R = rot(0, -24576, 0);
            break;
        case 5:
            R = rot(0, 8192, 0);
            break;
        case 1:
            R = rot(0, 32768, 0);
            break;
        case 7:
            R = rot(0, 24576, 0);
            break;
        case 3:
            R = rot(0, 16384, 0);
            break;
        default:
            break;
    }
    return vector(Outer.Rotation + R);
}

protected function ProcessSwipeHit(Actor A, int Damage, float MomentumScalar, class<KFDamageType> inDamageType)
{
    local KFPawn Victim;
    local int ListIdx;

    Victim = KFPawn(A);
    if(Victim == none)
    {
        return;
    }
    if(bTrackSwipeHits && A.IsA('KFPawn_Human'))
    {
        ListIdx = SwipedActors.Find('HitActor', Victim;
        if(ListIdx == -1)
        {
            ListIdx = SwipedActors.Add(1;
            SwipedActors[ListIdx].HitActor = Victim;
            SwipedActors[ListIdx].LastHitTime = Outer.WorldInfo.TimeSeconds;            
        }
        else
        {
            if((Outer.WorldInfo.TimeSeconds - SwipedActors[ListIdx].LastHitTime) > 0.25)
            {
                SwipedActors[ListIdx].LastHitTime = Outer.WorldInfo.TimeSeconds;                
            }
            else
            {
                return;
            }
        }
    }
    ResolvePawnMeleeDamage(Victim, Damage, MomentumScalar, inDamageType);
}

protected function ResolvePawnMeleeDamage(Pawn Victim, int Damage, float Momentum, class<KFDamageType> inDamageType)
{
    local DelayedMeleeInfo NewDmgInfo;
    local float RealDeltaSeconds, PingCompensation;

    if(Outer.Instigator.Role < ROLE_Authority)
    {
        return;
    }
    if(Outer.Instigator.IsHumanControlled())
    {
        ApplyMeleeDamage(Victim, Damage, Momentum, inDamageType);
        return;
    }
    if(((Victim.PlayerReplicationInfo != none) && Victim.Weapon != none) && ClassIsChildOf(Victim.Weapon.Class, Class'KFWeap_MeleeBase'))
    {
        PingCompensation = float(Min(int(float(Victim.PlayerReplicationInfo.Ping) * 4), MaxPingCompensation)) / 1000;
        PingCompensation *= PingCompensationScale;
        RealDeltaSeconds = Outer.WorldInfo.DeltaSeconds / Outer.WorldInfo.TimeDilation;
        PingCompensation -= (RealDeltaSeconds / 2);
        if(PingCompensation > float(0))
        {
            NewDmgInfo.Victim = Victim;
            NewDmgInfo.Damage = Damage;
            NewDmgInfo.Momentum = Momentum;
            NewDmgInfo.TimeOfDamage = Outer.WorldInfo.RealTimeSeconds + PingCompensation;
            NewDmgInfo.DamageType = inDamageType;
            PendingDamage.AddItem(NewDmgInfo;
            return;
        }
    }
    ApplyMeleeDamage(Victim, Damage, Momentum, inDamageType);
}

event ApplyDelayedPawnDamage(int I)
{
    local KFGameReplicationInfo KFGRI;

    if(!Outer.Instigator.IsAliveAndWell())
    {
        KFGRI = KFGameReplicationInfo(Outer.WorldInfo.GRI);
        if((KFGRI != none) && KFGRI.bTraderIsOpen)
        {
            return;
        }
    }
    ApplyMeleeDamage(PendingDamage[I].Victim, PendingDamage[I].Damage, PendingDamage[I].Momentum, PendingDamage[I].DamageType);
}

defaultproperties
{
    MyDamageType=Class'KFDT_Slashing'
    bTrackSwipeHits=true
    PlayerDoorDamageMultiplier=10
    PlayerControlledFOV=0.15
    MeleeImpactCamScale=1
    MaxPingCompensation=200
    PingCompensationScale=0.5
    DefaultFOVCosine=0
    MeleeVictimCamShake=CameraShake'Default__KFMeleeHelperAI.MeleeImpactCamShake0'
}