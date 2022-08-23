/*******************************************************************************
 * KFSM_Emerge generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Emerge extends KFSpecialMove;

var() array<name> FloorEmerge;
var() array<name> Wall248Emerge;
var() array<name> WallHighEmerge;
var() array<name> CeilingEmerge;
var() float BlendOutTime;
var bool bDoKnockdown;

static function byte PackAnimFlag(KFSpawner.EEmergeAnim EmergeType, optional out byte LastAnimVariant)
{
    local byte Variant;
    local int NumAnims;

    NumAnims = GetEmergeAnimNum(EmergeType);
    if((EmergeType == 1) || EmergeType == 2)
    {
        Variant = 0;
        if(NumAnims > 1)
        {
            J0x63:

            if(Variant == LastAnimVariant)
            {
                Variant = byte(Rand(NumAnims));
                goto J0x63;
            }
        }
        LastAnimVariant = Variant;        
    }
    else
    {
        Variant = byte(Rand(NumAnims));
    }
    return byte(EmergeType + (Variant << 4));
}

static function int GetEmergeAnimNum(byte EmergeType)
{
    switch(EmergeType)
    {
        case 0:
            return default.FloorEmerge.Length;
        case 1:
            return default.Wall248Emerge.Length;
        case 2:
            return default.WallHighEmerge.Length;
        case 3:
            return default.CeilingEmerge.Length;
        default:
            LogInternal((string(GetFuncName()) @ "Failed to find valid anim for:") $ string(EmergeType));
            break;
    }
}

function name GetEmergeAnim(byte EmergeType, int Variant)
{
    switch(EmergeType)
    {
        case 0:
            return FloorEmerge[Variant];
        case 1:
            return Wall248Emerge[Variant];
        case 2:
            return WallHighEmerge[Variant];
        case 3:
            return CeilingEmerge[Variant];
        default:
            LogInternal((((string(GetFuncName()) @ "Failed to find valid anim for:") $ string(EmergeType)) @ "variant:") $ string(Variant));
            break;
    }
}

function bool CanOverrideMoveWith(name NewMove)
{
    if(NewMove == 'KFSM_Knockdown')
    {
        return true;
    }
    return super(GameSpecialMove).CanOverrideMoveWith(NewMove);
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    PlayEmerge();
    bDoKnockdown = false;
}

function name PlayEmerge()
{
    local byte Type, Variant;
    local name EmergeAnim;

    Type = byte(KFPOwner.SpecialMoveFlags & 15);
    Variant = byte(KFPOwner.SpecialMoveFlags >> 4);
    EmergeAnim = GetEmergeAnim(Type, Variant);
    PlaySpecialMoveAnim(EmergeAnim, 0, 0, BlendOutTime, 1, false);
    EnableRootMotion();
    KFPOwner.BodyStanceNodes[0].SetRootBoneRotationOption(2, 2, 2);
    KFPOwner.Mesh.RootMotionRotationMode = 1;
    KFPOwner.SetCollision(KFPOwner.bCollideActors, false);
    KFPOwner.bCollideWorld = false;
    if(KFPOwner.WorldInfo.NetMode != NM_Client)
    {
        KFPOwner.SetTimer(0.25, true, 'Timer_CheckForPortalDestructibles', self);
    }
    KFPOwner.bAlwaysRelevant = true;
    return EmergeAnim;
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    KFPOwner.BodyStanceNodes[0].SetRootBoneRotationOption(1, 1, 1);
    KFPOwner.Mesh.RootMotionRotationMode = 0;
    DisableRootMotion();
    KFPOwner.bAlwaysRelevant = PawnOwner.default.bAlwaysRelevant;
    RestoreCollision();
    if(KFPOwner.WorldInfo.NetMode != NM_Client)
    {
        KFPOwner.ClearTimer('Timer_CheckForPortalDestructibles', self);
    }
    if((PawnOwner.Role == ROLE_Authority) && !PawnOwner.IsHumanControlled())
    {
        PawnOwner.SetTimer(5, false, 'FindAnchorFailsafe', self);
    }
}

function Timer_CheckForPortalDestructibles()
{
    local KFPawn_Monster KFPM;
    local KFDestructibleActor KFDA;

    if(KFPOwner.bCollideWorld)
    {
        return;
    }
    KFPM = KFPawn_Monster(KFPOwner);
    if(KFPM != none)
    {
        foreach KFPOwner.OverlappingActors(Class'KFDestructibleActor', KFDA, KFPOwner.CylinderComponent.CollisionRadius,, true)
        {
            KFDA.BumpedByMonster(KFPM, Normal(KFDA.Location - KFPOwner.Location));            
        }        
    }
}

function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    if(bDoKnockdown)
    {
        KFPOwner.Knockdown(PawnOwner.Velocity, vect(1, 1, 1));
    }
    if(KFPOwner.SpecialMove == 10)
    {
        KFPOwner.EndSpecialMove();
    }
}

function RestoreCollision()
{
    KFPOwner.SetCollision(PawnOwner.default.bCollideActors, PawnOwner.default.bBlockActors);
    KFPOwner.bCollideWorld = true;
    KFPOwner.FitCollision();
    PushOverlappingHumans();
}

function PushOverlappingHumans()
{
    local Pawn P;

    if(PawnOwner.Role < ROLE_Authority)
    {
        return;
    }
    foreach PawnOwner.WorldInfo.AllPawns(Class'Pawn', P, PawnOwner.Location, PawnOwner.CylinderComponent.CollisionRadius)
    {
        if(((P == KFPOwner) || P.Controller == none) || !P.Controller.bIsPlayer)
        {
            continue;            
        }
        P.Velocity += (((float(100) + KFPOwner.CylinderComponent.CollisionRadius) * vector(KFPOwner.Rotation)) * 2.5);
        P.Velocity.Z = 200 + KFPOwner.CylinderComponent.CollisionHeight;
        P.SetPhysics(2);        
    }    
}

function AbortSpecialMove()
{
    super.AbortSpecialMove();
    PawnOwner.Died(none, PawnOwner.WorldInfo.KillZDamageType, PawnOwner.Location);
}

function FindAnchorFailsafe()
{
    if((PawnOwner.Role == ROLE_Authority) && !PawnOwner.IsHumanControlled())
    {
        if((PawnOwner.WorldInfo.TimeSeconds - PawnOwner.FindAnchorFailedTime) < 5)
        {
            WarnInternal(("Zed unable to resume pathing after SM_Emerge" @ string(PawnOwner)) @ string(KFPOwner.SpecialMove));
            PawnOwner.Died(none, PawnOwner.WorldInfo.KillZDamageType, PawnOwner.Location);
        }
    }
}

defaultproperties
{
    FloorEmerge(0)=Enter_Floor_V1
    FloorEmerge(1)=Enter_Floor_V2
    FloorEmerge(2)=Enter_Floor_V3
    Wall248Emerge(0)=Enter_vent_C_V1
    Wall248Emerge(1)=Enter_vent_C_V2
    Wall248Emerge(2)=Enter_vent_L_V1
    Wall248Emerge(3)=Enter_vent_L_V2
    Wall248Emerge(4)=Enter_vent_R_V1
    Wall248Emerge(5)=Enter_vent_R_V2
    WallHighEmerge(0)=Enter_ventHigh_C_V1
    WallHighEmerge(1)=Enter_ventHigh_C_V2
    WallHighEmerge(2)=Enter_ventHigh_L_V1
    WallHighEmerge(3)=Enter_ventHigh_L_V2
    WallHighEmerge(4)=Enter_ventHigh_R_V1
    WallHighEmerge(5)=Enter_ventHigh_R_V2
    CeilingEmerge(0)=Enter_Ceiling_V1
    CeilingEmerge(1)=Enter_Ceiling_V2
    CeilingEmerge(2)=Enter_Ceiling_V3
    CeilingEmerge(3)=Enter_Ceiling_V4
    BlendOutTime=0.2
    SMRootMotionMode=ERootMotionMode.RMM_Translate
    bCanOnlyWanderAtEnd=true
    bPawnRotationLocked=true
    bDisablePhysics=true
    bShouldDeferToPostTick=true
    DefaultAICommandClass=Class'AICommand_PushedBySM'
    Handle=SM_Emerge
}