/*******************************************************************************
 * KFMeleeHelperWeapon generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFMeleeHelperWeapon extends KFMeleeHelperBase within KFWeapon;

enum EMeleeAttackType
{
    ATK_Normal,
    ATK_Combo,
    ATK_DrawStrike,
    ATK_MAX
};

/** If set, plays 8-way directional animations */
var() bool bUseDirectionalMelee;
/** attack anim variant settings */
var() bool bHasChainAttacks;
var transient bool bResetChainSequence;
/** Should use timer instead of anim notifies for melee hits? */
var() bool bUseMeleeHitTimer;
/** If set, this attack does damage to multiple pawns in a fan collision */
var() transient bool bCanHitMultipleTargets;
var bool bHitEnemyThisAttack;
var transient byte ChooseAtkCount;
var private KFPawn.EPawnOctant NextAttackDir;
var private KFMeleeHelperWeapon.EMeleeAttackType NextAttackType;
var KFPawn.EPawnOctant CurrentAttackDir;
var byte CurrentAtkChainIdx;
/** 4-way directional combo chain sequence */
var() array<KFPawn.EPawnOctant> ChainSequence_F;
var() array<KFPawn.EPawnOctant> ChainSequence_B;
var() array<KFPawn.EPawnOctant> ChainSequence_L;
var() array<KFPawn.EPawnOctant> ChainSequence_R;
var array<KFPawn.EPawnOctant> AttackChainSequence;
var int NumChainedAttacks;
var transient float LastMeleeAnimEnd_ActorTime;
/** Time (after melee starts) before traces for impact start occuring */
var() float InitialImpactDelay;
/** Time (after impact checks start) to retry impacts */
var() float ImpactRetryDuration;
/** World time to stop retrying traces for melee impact */
var() float ImpactComplete_ActorTime;
var KFImpactEffectInfo WorldImpactEffects;
var InterpCurveFloat FatigueCurve;

simulated function MeleeImpactNotify(KFAnimNotify_MeleeImpact_1P Notify)
{
    local bool bResult;

    if(!bHasAlreadyHit && !bUseMeleeHitTimer)
    {
        bCanHitMultipleTargets = Notify.bCanHitMultipleTargets;
        bResult = MeleeAttackImpact();
        if(!bResult && Outer.Instigator.Role == ROLE_Authority)
        {
            bResult = MeleeAttackDestructibles();
        }
        bHasAlreadyHit = bResult;
    }
}

simulated function bool MeleeImpactTimer()
{
    local bool bResult;

    if(bUseMeleeHitTimer)
    {
        if(ImpactComplete_ActorTime < 0)
        {
            ImpactComplete_ActorTime = Outer.GetActorTimeSeconds() + ImpactRetryDuration;
        }
        if(Outer.GetActorTimeSeconds() > ImpactComplete_ActorTime)
        {
            return false;
        }
    }
    bResult = MeleeAttackImpact();
    if(!bResult && Outer.Instigator.Role == ROLE_Authority)
    {
        bResult = MeleeAttackDestructibles();
    }
    if(!bResult && bUseMeleeHitTimer)
    {
        Outer.SetTimer(0.1, false, 'MeleeImpactTimer', self);
    }
    return bResult;
}

simulated function bool MeleeAttackImpact()
{
    local array<ImpactInfo> ImpactList;
    local int Idx;
    local Vector StartTrace, EndTrace;
    local bool bHasAnyHit;

    if((Outer.Instigator == none) || !Outer.Instigator.IsLocallyControlled())
    {
        return false;
    }
    StartTrace = GetMeleeStartTraceLocation();
    EndTrace = StartTrace + (vector(GetMeleeAimRotation()) * MaxHitRange);    
    CalcWeaponMeleeAttack(StartTrace, EndTrace, ImpactList);
    bHasAnyHit = ImpactList.Length > 0;
    Idx = 0;
    J0xF3:

    if(Idx < ImpactList.Length)
    {
        ProcessMeleeHit(Outer.CurrentFireMode, ImpactList[Idx]);
        ++ Idx;
        goto J0xF3;
    }
    if(Outer.Instigator.Role < ROLE_Authority)
    {
        Outer.SendClientImpactList(Outer.CurrentFireMode, ImpactList);
    }
    return bHasAnyHit;
}

simulated function Rotator GetMeleeAimRotation()
{
    local Rotator R;

    if(Outer.Instigator != none)
    {
        R = Outer.Instigator.GetBaseAimRotation();
    }
    return R;
}

simulated function ImpactInfo CalcWeaponMeleeAttack(Vector StartTrace, Vector EndTrace, optional out array<ImpactInfo> ImpactList, optional Vector Extent)
{
    local KFPawn BestVictim;
    local ImpactInfo CurrentImpact;
    local array<KFPawn> VictimList;
    local Vector RayDir;

    RayDir = GetAdjustedRayDir(EndTrace - StartTrace);
    BestVictim = FindVictimByFOV(StartTrace, EndTrace,,, VictimList, bCanHitMultipleTargets);
    if(BestVictim != none)
    {
        if(!bCanHitMultipleTargets)
        {
            VictimList[0] = BestVictim;
        }
        CalcVictimImpactList(VictimList, StartTrace, EndTrace, RayDir, ImpactList);        
    }
    else
    {
        if(Outer.Instigator.Weapon != none)
        {
            DoWeaponInstantTrace(StartTrace, EndTrace, CurrentImpact);
            if(CurrentImpact.HitActor != none)
            {
                if(((CurrentImpact.HitActor == Outer.WorldInfo) || CurrentImpact.HitActor.bBlockActors) || CurrentImpact.HitActor.bCanBeDamaged)
                {
                    CurrentImpact.RayDir = RayDir;
                    ImpactList[ImpactList.Length] = CurrentImpact;
                }
            }
            if(bLogMelee && CurrentImpact.HitActor != none)
            {
                LogInternal(((string(Outer.WorldInfo.TimeSeconds) @ string(GetFuncName())) @ "HitWallCheck, HitActor:") @ string(CurrentImpact.HitActor));
            }
        }
    }
    if(bLogMelee)
    {
        Outer.DrawDebugLine(StartTrace, EndTrace, 128, 0, 0, true);
        Outer.DrawDebugLine(StartTrace, StartTrace + (RayDir * float(100)), 0, 128, 0, true);
        Outer.SetTimer(10, false, 'FlushPersistentDebugLines');
    }
    return CurrentImpact;
}

simulated function CalcVictimImpactList(array<KFPawn> VictimList, Vector StartTrace, Vector EndTrace, Vector RayDir, optional out array<ImpactInfo> ImpactList, optional bool bGetMultipleTargets)
{
    local ImpactInfo HitZoneImpact;
    local int I;

    I = 0;
    J0x0D:

    if(I < VictimList.Length)
    {
        if(TraceMeleeAttackHitZones(VictimList[I], StartTrace, EndTrace, HitZoneImpact))
        {
            if(bGetMultipleTargets)
            {
                RayDir *= (GetDamageScaleByAngle(HitZoneImpact.HitLocation));
            }
            HitZoneImpact.RayDir = RayDir;
            ImpactList[ImpactList.Length] = HitZoneImpact;
            if(bLogMelee)
            {
                LogInternal((((((string(GetFuncName()) @ "HitZone:") $ string(ImpactList[0].HitInfo.BoneName)) @ "DmgScale:") $ string(VSize(RayDir))) @ "HitActor:") $ string(VictimList[I]));
            }            
        }
        else
        {
            LogInternal(string(GetFuncName()) @ "HitVictimCheck missed all hit zones");
        }
        ++ I;
        goto J0x0D;
    }
}

simulated function Vector GetAdjustedRayDir(Vector ImpactRayDir)
{
    local Rotator R;

    if(bUseDirectionalMelee)
    {
        switch(CurrentAttackDir)
        {
            case 0:
                R = rot(-8192, 0, 0);
                break;
            case 4:
                R = rot(-8192, -8192, 0);
                break;
            case 5:
                R = rot(-8192, 8192, 0);
                break;
            case 1:
                R = rot(8192, 0, 0);
                break;
            case 6:
                R = rot(8192, -8192, 0);
                break;
            case 7:
                R = rot(8192, 8192, 0);
                break;
            case 2:
                R = rot(0, -8192, 0);
                break;
            case 3:
                R = rot(0, 8192, 0);
                break;
            default:
                break;
        }
        return vector(rotator(ImpactRayDir) + R);
    }
    return Normal(ImpactRayDir);
}

event ProcessHitboxCollision(Actor HitActor, Vector StartTrace, Vector EndTrace, Vector HitLocation, Vector HitNormal, const out TraceHitInfo HitInfo, optional out ImpactInfo Impact)
{
    local array<ImpactInfo> ImpactList;
    local ImpactInfo HitZoneImpact;
    local int Idx;

    if((Outer.Instigator != none) && Outer.Instigator.IsLocallyControlled())
    {
        super.ProcessHitboxCollision(HitActor, StartTrace, EndTrace, HitLocation, HitNormal, HitInfo, Impact);
        ImpactList[0] = Impact;
        if(HitActor.IsA('KFPawn'))
        {
            if(TraceMeleeAttackHitZones(KFPawn(HitActor), StartTrace, EndTrace, HitZoneImpact, HitInfo.BoneName))
            {
                HitZoneImpact.RayDir = Impact.RayDir;
                ImpactList[0] = HitZoneImpact;                
            }
            else
            {
                LogInternal(string(GetFuncName()) @ "missed hit zone... continuing with hitbox TraceInfo");
            }
            ImpactList[0].RayDir *= (GetDamageScaleByAngle(HitLocation));
        }
        Idx = 0;
        J0x20A:

        if(Idx < ImpactList.Length)
        {
            ProcessMeleeHit(Outer.CurrentFireMode, ImpactList[Idx]);
            ++ Idx;
            goto J0x20A;
        }
        if(Outer.Instigator.Role < ROLE_Authority)
        {
            Outer.SendClientImpactList(Outer.CurrentFireMode, ImpactList);
        }
    }
}

event InitWorldTraceForHitboxCollision()
{
    Outer.SetTimer(0.1, false, 'HitboxSimpleWorldTrace', self);
}

function bool HitboxSimpleWorldTrace()
{
    local Vector StartTrace, EndTrace;
    local ImpactInfo CurrentImpact;
    local array<ImpactInfo> ImpactList;
    local int Idx;

    if((Outer.Instigator == none) || !Outer.Instigator.IsLocallyControlled())
    {
        return false;
    }
    StartTrace = GetMeleeStartTraceLocation();
    EndTrace = StartTrace + (vector(GetMeleeAimRotation()) * MaxHitRange);
    DoWeaponInstantTrace(StartTrace, EndTrace, CurrentImpact);
    if(CurrentImpact.HitActor != none)
    {
        if(CurrentImpact.HitActor.bWorldGeometry || CurrentImpact.HitActor.bCanBeDamaged && !CurrentImpact.HitActor.IsA('Pawn'))
        {
            CurrentImpact.RayDir = GetAdjustedRayDir(EndTrace - StartTrace);
            ImpactList[ImpactList.Length] = CurrentImpact;
            Idx = 0;
            J0x1F2:

            if(Idx < ImpactList.Length)
            {
                ProcessMeleeHit(Outer.CurrentFireMode, ImpactList[Idx]);
                ++ Idx;
                goto J0x1F2;
            }
            if(Outer.Instigator.Role < ROLE_Authority)
            {
                Outer.SendClientImpactList(Outer.CurrentFireMode, ImpactList);
            }
            if(bLogMelee)
            {
                LogInternal(string(GetFuncName()) @ string(CurrentImpact.HitActor));
            }
            return true;
        }
    }
    return false;
}

simulated function BeginMeleeAttack(optional bool bIsChainAttack)
{
    local float MeleeDuration;

    bHasAlreadyHit = false;
    bHitEnemyThisAttack = false;
    if(((Outer.Instigator != none) && Outer.Instigator.Controller != none) && KFPlayerController(Outer.Instigator.Controller) != none)
    {
        KFPlayerController(Outer.Instigator.Controller).AddShotsFired(1);
    }
    bResetChainSequence = false;
    CurrentAttackDir = NextAttackDir;
    MeleeDuration = PlayMeleeAttackAnimation();
    if(MeleeDuration > 0)
    {
        Outer.SetTimer(MeleeDuration + Outer.WorldInfo.DeltaSeconds, false, 'MeleeCheckTimer', self);
        if(bUseMeleeHitTimer && InitialImpactDelay > 0)
        {
            ImpactComplete_ActorTime = -1;
            Outer.SetTimer(InitialImpactDelay, false, 'MeleeImpactTimer', self);
        }        
    }
    else
    {
        WarnInternal("MeleeDuration is zero!!!");
        Outer.SetTimer(0.001, false, 'HandleFinishedFiring');
    }
}

simulated function float PlayMeleeAttackAnimation()
{
    local name MeleeAnimName;
    local float InterruptTime, Rate;

    MeleeAnimName = Outer.GetMeleeAnimName(NextAttackDir, NextAttackType);
    InterruptTime = Outer.MySkelMesh.GetAnimInterruptTime(MeleeAnimName);
    Rate = EvalInterpCurveFloat(FatigueCurve, float(NumChainedAttacks));
    if(InterruptTime > 0)
    {
        Outer.PlayMeleeAnimation(MeleeAnimName, Rate, GetMeleeBlendInTime());
    }
    return InterruptTime * Rate;
}

simulated function float GetMeleeBlendInTime()
{
    if(bHasChainAttacks)
    {
        if((NextAttackType == 1) || (Outer.WorldInfo.TimeSeconds - Outer.LastRenderTime) > 0)
        {
            return 0;
        }
    }
    return 0.1;
}

simulated function KFPawn.EPawnOctant ChooseAttackDir()
{
    local Vector MoveDir;
    local KFPawn.EPawnOctant AttackDir;

    ++ ChooseAtkCount;
    MoveDir = ((IsZero(Outer.Instigator.Acceleration)) ? Outer.Instigator.Velocity : Outer.Instigator.Acceleration);
    if(((Outer.Instigator == none) || !bUseDirectionalMelee) || IsZero(MoveDir))
    {
        if(bUseDirectionalMelee)
        {
            return (((ChooseAtkCount & 1) > 0) ? 2 : 3);
        }
        return 8;
    }
    AttackDir = Class'KFPawn'.static.CalcQuadRegion(Outer.Instigator.GetViewRotation(), MoveDir);
    switch(AttackDir)
    {
        case 2:
            return 3;
        case 3:
            return 2;
        default:
            return AttackDir;
            break;
    }
}

simulated function InitAttackSequence(KFPawn.EPawnOctant NewAtkDir, KFMeleeHelperWeapon.EMeleeAttackType NewAtkType)
{
    if(bLogMelee)
    {
        LogInternal((string(Outer.Instigator) @ "SetNextAttackType:") @ string(NewAtkDir));
    }
    CurrentAtkChainIdx = 0;
    NumChainedAttacks = 0;
    NextAttackDir = NewAtkDir;
    NextAttackType = NewAtkType;
    if(bUseDirectionalMelee)
    {
        AttackChainSequence.Length = 0;
        if(NewAtkType == 2)
        {
            AttackChainSequence = ChainSequence_R;            
        }
        else
        {
            switch(NextAttackDir)
            {
                case 0:
                    AttackChainSequence = ChainSequence_F;
                    break;
                case 4:
                    AttackChainSequence = ChainSequence_F;
                    break;
                case 5:
                    AttackChainSequence = ChainSequence_F;
                    break;
                case 1:
                    AttackChainSequence = ChainSequence_B;
                    break;
                case 2:
                    AttackChainSequence = ChainSequence_L;
                    break;
                case 3:
                    AttackChainSequence = ChainSequence_R;
                    break;
                default:
                    break;
            }
        }
        bResetChainSequence = Outer.IsMeleeing();
    }
    if((NewAtkType == 0) && !Outer.IsMeleeing())
    {
        if((LastMeleeAnimEnd_ActorTime > 0) && Outer.ActorTimeSince(LastMeleeAnimEnd_ActorTime) < 0.1)
        {
            NextAttackType = 1;
        }
    }
}

simulated function MeleeCheckTimer()
{
    Outer.ClearTimer('MeleeCheckTimer', self);
    LastMeleeAnimEnd_ActorTime = Outer.GetActorTimeSeconds();
    if(Outer.IsMeleeing())
    {
        if(Outer.bWeaponPutDown)
        {
            LogInternal((((((((string(Outer.WorldInfo.TimeSeconds) @ "Self:") @ string(self)) @ "Instigator:") @ string(Outer.Instigator)) @ string(GetStateName())) $ "::") $ string(GetFuncName())) @ "Weapon put down requested during fire, put it down now", 'Inventory');
            Outer.PutDownWeapon();
            return;
        }
        if(bHasChainAttacks && Outer.ShouldContinueMelee(NumChainedAttacks))
        {
            ContinueMeleeAttack();
            return;
        }
        Outer.HandleFinishedFiring();
    }
}

simulated function ContinueMeleeAttack()
{
    if(bUseDirectionalMelee && AttackChainSequence.Length > 0)
    {
        ++ NumChainedAttacks;
        if(!bResetChainSequence)
        {
            NextAttackDir = AttackChainSequence[CurrentAtkChainIdx];
            CurrentAtkChainIdx = byte((CurrentAtkChainIdx + 1) % AttackChainSequence.Length);
        }
        if(bLogMelee)
        {
            LogInternal((("IncrementAttackSequence ChainIdx=" $ string(CurrentAtkChainIdx)) @ "Direction=") $ string(NextAttackDir));
        }
    }
    NextAttackType = 1;
    BeginMeleeAttack(true);
    if(Outer.PendingFire(Outer.CurrentFireMode) && !Outer.ShouldContinueMelee(NumChainedAttacks))
    {
        Outer.ClearPendingFire(Outer.CurrentFireMode);
    }
}

simulated function ProcessMeleeHit(byte FiringMode, ImpactInfo Impact)
{
    local KActorFromStatic NewKActor;
    local editinline StaticMeshComponent HitStaticMesh;
    local FracturedStaticMeshActor FracActor;
    local KFPawn HitPawn;
    local Vector Momentum;

    if(Impact.HitActor != none)
    {
        if(Impact.HitActor.bWorldGeometry)
        {
            HitStaticMesh = StaticMeshComponent(Impact.HitInfo.HitComponent);
            if((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic())
            {
                NewKActor = Class'KActorFromStatic'.static.MakeDynamic(HitStaticMesh);
                if(NewKActor != none)
                {
                    Impact.HitActor = NewKActor;
                }
            }
            if(bAllowMeleeToFracture)
            {
                FracActor = FracturedStaticMeshActor(Impact.HitActor);
                if(FracActor != none)
                {
                    FracActor.BreakOffPartsInRadius(Impact.HitLocation - (Impact.HitNormal * 15), 35, 100, true);
                }
            }
        }
        HitPawn = KFPawn(Impact.HitActor);
        if(HitPawn != none)
        {
            if(!bHitEnemyThisAttack && HitPawn.GetTeamNum() != Outer.Instigator.GetTeamNum())
            {
                if(((Outer.Instigator != none) && Outer.Instigator.Controller != none) && KFPlayerController(Outer.Instigator.Controller) != none)
                {
                    KFPlayerController(Outer.Instigator.Controller).AddShotsHit(1);
                }
                bHitEnemyThisAttack = true;
            }
            HitPawn.NotifyMeleeTakeHit(Outer.Instigator.Controller, Impact.HitLocation);
        }
        Momentum = Normal(Impact.RayDir) * Outer.InstantHitMomentum[FiringMode];
        PlayMeleeHitEffects(Impact.HitActor, Impact.HitLocation, Impact.RayDir);
        Impact.HitActor.TakeDamage(Outer.GetMeleeDamage(FiringMode, Impact.RayDir), Outer.Instigator.Controller, Impact.HitLocation, Momentum, GetDamageType(FiringMode), Impact.HitInfo, Outer);
        Outer.NotifyMeleeCollision(Impact.HitActor, Impact.HitLocation);
    }
}

simulated function class<DamageType> GetDamageType(byte FiringMode)
{
    return Outer.InstantHitDamageTypes[FiringMode];
}

simulated function float GetDamageScaleByAngle(Vector HitLoc)
{
    local float DotResult;
    local Vector Origin, Aim;

    if((Outer.Instigator == none) || !Outer.Instigator.IsLocallyControlled())
    {
        return 1;
    }
    Origin = GetMeleeStartTraceLocation();
    Aim = vector(Outer.Instigator.GetBaseAimRotation());
    switch(CurrentAttackDir)
    {
        case 2:
        case 3:
            DotResult = (0.75 * Normal2D(Aim)) Dot Normal2D(HitLoc - Origin);
            return FMax(DotResult, 0.5);
        default:
            return 1;
            break;
    }
}

simulated function PlayMeleeHitEffects(Actor Target, Vector HitLocation, Vector HitDirection)
{
    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(Outer.Instigator.IsFirstPerson())
        {
            PlayerController(Outer.Instigator.Controller).ClientPlayCameraShake(Outer.MeleeImpactCamShake, 1, true, 2, rotator(-HitDirection));
            if(Target.IsA('Pawn'))
            {
                Outer.AddBlood(0.01, 0.1);
            }
        }
        if(!Target.bCanBeDamaged && Target.IsA('Pawn'))
        {
            KFImpactEffectManager(Outer.WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Outer.Instigator, HitDirection, WorldImpactEffects);
        }
    }
}

defaultproperties
{
    ChainSequence_F(0)=251
    ChainSequence_F(1)=21
    ChainSequence_F(2)=0
    ChainSequence_F(3)=0
    ChainSequence_F(4)=0
    ChainSequence_B(0)=247
    ChainSequence_B(1)=21
    ChainSequence_B(2)=0
    ChainSequence_B(3)=0
    ChainSequence_B(4)=0
    ChainSequence_B(5)=0
    ChainSequence_B(6)=0
    ChainSequence_L(0)=254
    ChainSequence_L(1)=21
    ChainSequence_L(2)=0
    ChainSequence_L(3)=0
    ChainSequence_L(4)=0
    ChainSequence_L(5)=0
    ChainSequence_R(0)=251
    ChainSequence_R(1)=21
    ChainSequence_R(2)=0
    ChainSequence_R(3)=0
    ChainSequence_R(4)=0
    ChainSequence_R(5)=0
    InitialImpactDelay=0.2
    ImpactRetryDuration=0.2
    WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Blunted_melee_impact'
    FatigueCurve=(Points=/* Array type was not detected. */,InVal=2,OutVal=1,ArriveTangent=0,LeaveTangent=0,InterpMode=EInterpCurveMode.CIM_Linear)
    bHitboxPawnsOnly=true
    MeleeVictimCamShake=CameraShake'Default__KFMeleeHelperWeapon.MeleeImpactCamShake0'
}