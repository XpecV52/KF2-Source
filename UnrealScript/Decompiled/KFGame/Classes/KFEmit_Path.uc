/*******************************************************************************
 * KFEmit_Path generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFEmit_Path extends Emitter
    abstract
    hidecategories(Navigation);

const MAX_WAYPOINTS = 24;

var const int WAYPOINT_HEIGHT;
var const int WAYPOINT_HEIGHT_NAV_MESH;
var const float MinDistanceBetweenWayPointsOnNavMesh;
var ParticleSystem EmitterTemplate;
var array<Vector> WayPoints;
var int NumPoints;
var int Position;
var const float CURVE_TURNRATE;
var const float ACCEL_RATE;
var bool bUseAccelerationPhysics;
var bool bHeadedRight;
var const bool bShowEmitPathDebugArtifacts;

simulated function PostBeginPlay()
{
    local int I, Start;
    local KFPlayerController P;
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    super.PostBeginPlay();
    P = KFPlayerController(Owner);
    if((P == none) || P.Pawn == none)
    {
        Destroy();        
    }
    else
    {
        SetTemplate(EmitterTemplate, true);
        SetLocation(P.Pawn.Location);
        WayPoints[0] = (Location + (float(WAYPOINT_HEIGHT) * vect(0, 0, 1))) + (200 * vector(P.Rotation));
        HitActor = Trace(HitLocation, HitNormal, WayPoints[0], Location, false);
        if(HitActor != none)
        {
            WayPoints[0] = HitLocation;
        }
        ++ NumPoints;
        if(Class'KFAIController'.default.bUseNavMesh)
        {            
        }
        else
        {
            if(((P.RouteCache[0] != none) && P.RouteCache.Length > 1) && P.ActorReachable(P.RouteCache[1]))
            {
                Start = 1;
            }
            I = Start;
            J0x238:

            if(((NumPoints < 24) && I < P.RouteCache.Length) && P.RouteCache[I] != none)
            {
                WayPoints[++ NumPoints] = P.RouteCache[I].Location + (float(WAYPOINT_HEIGHT) * vect(0, 0, 1));
                ++ I;
                goto J0x238;
            }
        }
        StartNextPath();
    }
}

simulated function SetDestination(Vector Destination)
{
    if(NumPoints > 1)
    {
        WayPoints[NumPoints - 1] = Destination;
    }
}

simulated event SetInitialState()
{
    bScriptInitialized = true;
    if(PlayerController(Owner).IsLocalPlayerController())
    {
        StartNextPath();        
    }
    else
    {
        ParticleSystemComponent.DeactivateSystem();
        SetPhysics(0);
    }
}

simulated event SetTemplate(ParticleSystem NewTemplate, optional bool bDestroyOnFinish)
{
    super.SetTemplate(NewTemplate, bDestroyOnFinish);
}

simulated function StartNextPath()
{
    local Pawn OwnerPawn;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if(ShouldStopPathing())
    {
        Destroy();
        return;
    }
    ++ Position;
    if((Position >= NumPoints) || Position >= WayPoints.Length)
    {
        LifeSpan = 5;
        Velocity = vect(0, 0, 0);
        ParticleSystemComponent.DeactivateSystem();
        SetPhysics(0);
        GotoState('None');        
    }
    else
    {
        if(bUseAccelerationPhysics)
        {
            OwnerPawn = ((KFPC != none) ? KFPC.Pawn : none);
            if((Position == 0) && OwnerPawn != none)
            {
                SetLocation(OwnerPawn.Location + (float(WAYPOINT_HEIGHT) * vect(0, 0, 1)));
                Velocity = ((float(4000) * CURVE_TURNRATE) * Normal(WayPoints[0] - Location)) + OwnerPawn.Velocity;
            }
            bHeadedRight = false;
            Acceleration = ACCEL_RATE * Normal(WayPoints[Position] - Location);
            Velocity *= 0.5;
            Velocity.Z = 0.5 * (Velocity.Z + Acceleration.Z);
            SetRotation(rotator(WayPoints[Position] - Location));
            GotoState('Pathing');            
        }
        else
        {
            OwnerPawn = ((KFPC != none) ? KFPC.Pawn : none);
            if((Position == 0) && OwnerPawn != none)
            {
                SetLocation((OwnerPawn.Location + (float(WAYPOINT_HEIGHT) * vect(0, 0, 1))) + (vector(OwnerPawn.Rotation) * 100));
            }
            SetRotation(rotator(WayPoints[Position] - Location));
            GotoState('Pathing');
        }
    }
}

simulated function bool ShouldStopPathing()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if((KFPC != none) && KFPC.Pawn != none)
    {
        return KFPC.Pawn.IsA('KFPawn_Customization');
    }
    return false;
}

state Pathing
{
    simulated function Tick(float DeltaTime)
    {
        local KFPlayerController KFPC;

        KFPC = KFPlayerController(Owner);
        if(ShouldStopPathing())
        {
            Destroy();
            return;
        }
        if(!bUseAccelerationPhysics)
        {
            TickUDK(DeltaTime, KFPC.Pawn);            
        }
        else
        {
            TickClassic(DeltaTime);
        }
    }

    simulated function TickUDK(float DeltaTime, Pawn OwnerPawn)
    {
        local float MaxSpeed;

        SetRotation(rotator(WayPoints[Position] - Location));
        if(OwnerPawn != none)
        {
            if((VSize(Location - OwnerPawn.Location) < OwnerPawn.GroundSpeed) && (vector(Rotation) Dot vector(OwnerPawn.Rotation)) > 0)
            {
                MaxSpeed = OwnerPawn.GroundSpeed + 400;                
            }
            else
            {
                MaxSpeed = VSize(OwnerPawn.Velocity) + 200;
                RotationRate = default.RotationRate;
            }            
        }
        else
        {
            MaxSpeed = 200;
        }
        Velocity = vector(Rotation) * MaxSpeed;
        if(VSize(WayPoints[Position] - Location) < FMax(80, (VSize(Velocity) * DeltaTime) * 3))
        {
            StartNextPath();
        }
    }

    simulated function TickClassic(float DeltaTime)
    {
        Acceleration = ACCEL_RATE * Normal(WayPoints[Position] - Location);
        Velocity = Velocity + ((CURVE_TURNRATE * DeltaTime) * Acceleration);
        if(!bHeadedRight)
        {
            bHeadedRight = (Velocity Dot Acceleration) > float(0);            
        }
        else
        {
            if((Velocity Dot Acceleration) < float(0))
            {
                StartNextPath();
            }
        }
        if((WayPoints.Length > Position) && VSize(WayPoints[Position] - Location) < float(80))
        {
            StartNextPath();
        }
    }

    simulated function BeginState(name PreviousStateName)
    {
        SetPhysics(6);
    }
    stop;    
}

defaultproperties
{
    WAYPOINT_HEIGHT_NAV_MESH=25
    MinDistanceBetweenWayPointsOnNavMesh=250
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFEmit_Path.ParticleSystemComponent0'
    ParticleSystemComponent=ParticleSystemComponent0
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFEmit_Path.Sprite'
    Components(0)=Sprite
    begin object name=ParticleSystemComponent0 class=ParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: ParticleSystemComponent'Default__KFEmit_Path.ParticleSystemComponent0'
    Components(1)=ParticleSystemComponent0
    begin object name=ArrowComponent0 class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFEmit_Path.ArrowComponent0'
    Components(2)=ArrowComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}