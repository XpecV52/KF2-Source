/*******************************************************************************
 * KFSM_BloatKing_Gorge generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_BloatKing_Gorge extends KFSM_PlaySingleAnim;

var KFPawn_ZedBloatKing BloatPawn;
var const float GorgeAttackRangeSq;
var const float GorgeHumanAttackRangeSq;
var const float GorgeMinAttackAngle;
var const Vector2D GorgeAttackCooldown[4];
var const float GorgeAttackCheckDelay;
var const float GorgePullDelay;
var array<KFPawn> PullList;
var array<KFPawn> PulledList;
var KFGame.KFPawn.ESpecialMove FollowerSpecialMove;
var KFGame.KFPawn.ESpecialMove ZedFollowerSpecialMove;
var float GorgePullRate;
var float GorgeReleaseOffset;
var float GorgeBaseDamage[4];
var bool bPullActive;
var array<KFPawn> GorgeHitList;
var array<KFPawn> DeferredRemovalList;

static function float GetGorgeCooldown(KFPawn inPawn, int Difficulty)
{
    return Lerp(default.GorgeAttackCooldown[Difficulty].X, default.GorgeAttackCooldown[Difficulty].Y, inPawn.GetHealthPercentage());
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    BloatPawn = KFPawn_ZedBloatKing(KFPOwner);
    PulledList.Length = 0;
    KFPOwner.SetTimer(GorgePullDelay, false, 'StartGorgePull', self);
}

function StartGorgePull()
{
    if(KFPOwner.Role == ROLE_Authority)
    {
        bPullActive = true;
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFPawn PullPawn;

    bPullActive = false;
    foreach PullList(PullPawn,)
    {
        DeferredRemovalList.AddItem(PullPawn;        
    }    
    PullList.Length = 0;
}

function Tick(float DeltaTime)
{
    local KFPawn TestPawn;
    local KFPawn_Monster MonsterToKill;

    super(KFSpecialMove).Tick(DeltaTime);
    if(KFPOwner.Role == ROLE_Authority)
    {
        if(GorgeHitList.Length > 0)
        {
            foreach GorgeHitList(TestPawn,)
            {
                if((TestPawn == none) || !TestPawn.IsAliveAndWell())
                {
                    continue;                    
                }
                else
                {
                    MonsterToKill = KFPawn_Monster(TestPawn);
                    if(MonsterToKill != none)
                    {
                        MonsterToKill.KilledBy(KFPOwner);                        
                    }
                    else
                    {
                        TestPawn.TakeDamage(int(GorgeBaseDamage[int(KFPOwner.WorldInfo.Game.GameDifficulty)]), KFPOwner.Controller, TestPawn.Location, vect(0, 0, 0), Class'KFDT_Bludgeon_BloatKingGorge');
                    }                    
                }
            }            
            GorgeHitList.Length = 0;
        }
        if(DeferredRemovalList.Length > 0)
        {
            foreach DeferredRemovalList(TestPawn,)
            {
                RemoveVictim(TestPawn, false);                
            }            
            DeferredRemovalList.Length = 0;
        }
        if(bPullActive)
        {
            FindNewVictims();
        }
    }
    UpdateVictims(DeltaTime);
}

function FindNewVictims()
{
    local KFPawn PullPawn;
    local Vector ViewDirection, ToTarget, Extent, HitLocation, HitNormal;

    local Actor HitActor;
    local float DotAngle, ToTargetRange;

    if(BloatPawn.GorgeTrigger != none)
    {
        ViewDirection = vector(KFPOwner.Rotation);
        foreach BloatPawn.GorgeTrigger.TouchingActors(Class'KFPawn', PullPawn)
        {
            if((PullList.Find(PullPawn == -1) && PulledList.Find(PullPawn == -1)
            {
                if(((!PullPawn.IsAliveAndWell() || !IsValidPullClass(PullPawn)) || !PullPawn.CanBeGrabbed(KFPOwner, true, true)) || PullPawn.IsDoingSpecialMove(FollowerSpecialMove))
                {
                    continue;                    
                }
                ToTarget = PullPawn.Location - KFPOwner.Location;
                ToTargetRange = VSizeSq(ToTarget);
                if(PullPawn.IsHumanControlled() && ToTargetRange > default.GorgeHumanAttackRangeSq)
                {
                    continue;                                        
                }
                else
                {
                    if(ToTargetRange > default.GorgeAttackRangeSq)
                    {
                        continue;                        
                    }
                }
                if(!KFPOwner.IsHumanControlled())
                {
                    Extent.X = KFPOwner.GetCollisionRadius() * 0.5;
                    Extent.Y = Extent.X;
                    Extent.Z = KFPOwner.GetCollisionHeight() * 0.5;
                    HitActor = KFPOwner.Trace(HitLocation, HitNormal, PullPawn.Location, KFPOwner.Location, true, Extent);
                    if((HitActor != none) && HitActor != PullPawn)
                    {
                        continue;                        
                    }
                }
                DotAngle = ViewDirection Dot Normal(ToTarget);
                if((DotAngle > default.GorgeMinAttackAngle) && KFPOwner.FastTrace(PullPawn.Location, KFPOwner.Location))
                {
                    AddNewVictim(PullPawn);
                }
            }            
        }        
    }
}

static function bool IsValidPullClass(KFPawn PullPawn)
{
    if(PullPawn.Class == Class'KFPawn_ZedBloatKingSubspawn')
    {
        return false;
    }
    return true;
}

function UpdateVictims(float DeltaTime)
{
    local KFPawn CurrentPawn;
    local Vector MoveVector, SocketLocation;
    local Rotator SocketRotation;
    local int I;
    local bool bIsHuman;

    KFPOwner.Mesh.GetSocketWorldLocationAndRotation('PukeSocket', SocketLocation, SocketRotation);
    I = 0;
    J0x5B:

    if(I < 11)
    {
        CurrentPawn = BloatPawn.PullVictims[I];
        if(CurrentPawn != none)
        {
            bIsHuman = CurrentPawn.IsA('KFPawn_Human');
            if(VSizeSq(CurrentPawn.Location - KFPOwner.Location) < (GorgeReleaseOffset * GorgeReleaseOffset))
            {
                RemoveVictim(CurrentPawn, true);                
            }
            else
            {
                if(bIsHuman)
                {
                    MoveVector = (GorgePullRate * DeltaTime) * Normal(KFPOwner.Location - CurrentPawn.Location);                    
                }
                else
                {
                    MoveVector = (GorgePullRate * DeltaTime) * Normal(SocketLocation - CurrentPawn.Location);
                }
                CurrentPawn.SetLocation(CurrentPawn.Location + MoveVector);
            }
        }
        ++ I;
        goto J0x5B;
    }
}

function AddNewVictim(KFPawn NewVictim)
{
    PullList.AddItem(NewVictim;
    PulledList.RemoveItem(NewVictim;
    StartPullingPawn(NewVictim);
    if(BloatPawn.Role == ROLE_Authority)
    {
        BloatPawn.AddGorgeVictim(NewVictim);
    }
}

function RemoveVictim(KFPawn OldVictim, optional bool bReachedEnd)
{
    bReachedEnd = false;
    PullList.RemoveItem(OldVictim;
    PulledList.AddItem(OldVictim;
    if(BloatPawn.Role == ROLE_Authority)
    {
        BloatPawn.RemoveGorgeVictim(OldVictim);
        if(bReachedEnd && KFPawn_Monster(OldVictim) != none)
        {
            BloatPawn.SpawnPoopMonster();
        }
    }
    StopPullingPawn(OldVictim, bReachedEnd);
}

function StartPullingPawn(KFPawn NewVictim)
{
    if(NewVictim != none)
    {
        if(KFPOwner.Role == ROLE_Authority)
        {
            if(KFPawn_Monster(NewVictim) != none)
            {
                NewVictim.DoSpecialMove(ZedFollowerSpecialMove, true, KFPOwner);
                KFPawn_Monster(NewVictim).bUseExplosiveDeath = true;                
            }
            else
            {
                NewVictim.DoSpecialMove(FollowerSpecialMove, true, KFPOwner);
            }
        }
    }
}

function StopPullingPawn(KFPawn OldVictim, optional bool bReachedEnd)
{
    local KFPawn_Monster MonsterVictim;

    bReachedEnd = true;
    if(OldVictim != none)
    {
        MonsterVictim = KFPawn_Monster(OldVictim);
        OldVictim.EndSpecialMove();
        if(KFPOwner.Role == ROLE_Authority)
        {
            if(MonsterVictim != none)
            {
                if(bReachedEnd)
                {
                    GorgeHitList.AddItem(MonsterVictim;                    
                }
                else
                {
                    MonsterVictim.bUseExplosiveDeath = false;
                }                
            }
            else
            {
                GorgeHitList.AddItem(OldVictim;
            }
        }
    }
}

defaultproperties
{
    GorgeAttackRangeSq=490000
    GorgeHumanAttackRangeSq=250000
    GorgeMinAttackAngle=0.77
    GorgeAttackCooldown[0]=(X=8,Y=11)
    GorgeAttackCooldown[1]=(X=6,Y=9)
    GorgeAttackCooldown[2]=(X=5,Y=8)
    GorgeAttackCooldown[3]=(X=4,Y=7)
    GorgeAttackCheckDelay=5
    GorgePullDelay=0.91
    FollowerSpecialMove=ESpecialMove.SM_HansGrappleVictim
    ZedFollowerSpecialMove=ESpecialMove.SM_GorgeZedVictim
    GorgePullRate=300
    GorgeReleaseOffset=135
    GorgeBaseDamage[0]=30
    GorgeBaseDamage[1]=30
    GorgeBaseDamage[2]=40
    GorgeBaseDamage[3]=40
    AnimName=Atk_Gorge
    bCanBeInterrupted=true
    bDisableMovement=true
    bLockPawnRotation=true
    bDisableTurnInPlace=true
    Handle=KFSM_BloatKing_Gorge
}