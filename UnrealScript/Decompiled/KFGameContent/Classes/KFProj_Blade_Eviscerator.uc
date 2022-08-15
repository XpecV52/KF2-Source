/*******************************************************************************
 * KFProj_Blade_Eviscerator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Blade_Eviscerator extends KFProj_RicochetBullet
    hidecategories(Navigation);

var repnotify ImpactInfo StickInfo;
var bool bStuck;
var class<KFWeapon> WeaponClass;
/** The radius size of the pickup collision when the blade stops moving */
var() float PickupRadius;
/** The height of the pickup collision when the blade stops moving */
var() float PickupHeight;
/** This is the effect that is played while in flight */
var(Projectile) ParticleSystem ProjPickupTemplate;
/** Sound to play when picking up ammo */
var() AkEvent AmmoPickupSound;
var float LifeSpanAfterStick;

replication
{
     if(bNetDirty)
        StickInfo;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'StickInfo')
    {
        Stick(StickInfo, true);        
    }
    else
    {
        super(KFProjectile).ReplicatedEvent(VarName);
    }
}

simulated function SpawnFlightEffects()
{
    super(KFProjectile).SpawnFlightEffects();
    if((WorldInfo.NetMode != NM_DedicatedServer) && ProjEffects != none)
    {
        ProjEffects.SetVectorParameter('Rotation', vect(0, 0, 1));
    }
}

function Vector EncodeSmallVector(Vector V)
{
    return V * 256;
}

simulated function Vector DecodeSmallVector(Vector V)
{
    return V / 256;
}

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    local ImpactInfo MyStickInfo;

    SetRotation(rotator(Normal(Velocity)));
    SetPhysics(2);
    if(!Bounce(HitNormal, Wall))
    {
        if((WorldInfo.NetMode != NM_DedicatedServer) && ProjEffects != none)
        {
            ProjEffects.DeactivateSystem();
            ProjEffects.SetVectorParameter('Rotation', vect(0, 0, 0));
        }
        if((!Wall.bStatic && !Wall.bWorldGeometry) && Wall.bProjTarget)
        {
            Explode(Location, HitNormal);
            ImpactedActor = none;            
        }
        else
        {
            MyStickInfo.HitLocation = Location;
            MyStickInfo.HitNormal = HitNormal;
            MyStickInfo.HitActor = Wall;
            MyStickInfo.RayDir = EncodeSmallVector(Normal(Velocity));
            Stick(MyStickInfo, false);
        }
        bBounce = false;
    }
}

simulated function Stick(ImpactInfo MyStickInfo, bool bReplicated)
{
    if((WorldInfo.NetMode != NM_DedicatedServer) && ProjEffects != none)
    {
        ProjEffects.DeactivateSystem();
        ProjEffects.SetTemplate(ProjPickupTemplate);
        ProjEffects.ActivateSystem();
        ProjEffects.SetVectorParameter('Rotation', vect(0, 0, 0));
    }
    if((WorldInfo.NetMode != NM_DedicatedServer) && !bStuck)
    {
        KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, MyStickInfo.HitNormal, ImpactEffects);
    }
    if(!IsZero(DecodeSmallVector(MyStickInfo.RayDir)))
    {
        SetRotation(rotator(DecodeSmallVector(MyStickInfo.RayDir)));        
    }
    else
    {
        SetRotation(rot(0, 0, 0));
    }
    SetPhysics(0);
    if(bReplicated)
    {
        SetLocation(MyStickInfo.HitLocation);
        bStuck = true;        
    }
    else
    {
        if(Role == ROLE_Authority)
        {
            bStuck = true;
            StickInfo = MyStickInfo;
            LifeSpan = LifeSpanAfterStick;
        }
    }
    if((bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none) && AmbientComponent != none)
    {
        AmbientComponent.StopEvents();
    }
    bForceNetUpdate = true;
    NetUpdateFrequency = 3;
    GotoState('Pickup');
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(((Other != Instigator) && !Other.bWorldGeometry) && Other.bCanBeDamaged)
    {
        if(Pawn(Other) != none)
        {
            super(KFProj_Bullet).ProcessTouch(Other, HitLocation, HitNormal);            
        }
        else
        {
            ProcessDestructibleTouchOnBounce(Other, HitLocation, HitNormal);
        }        
    }
    else
    {
        super(KFProj_Bullet).ProcessTouch(Other, HitLocation, HitNormal);
    }
}

simulated function Tick(float DeltaTime)
{
    super(KFProj_Bullet).Tick(DeltaTime);
    if((Physics == 6) && VSizeSq(Velocity) < ((Speed * Speed) * 0.1))
    {
        SetPhysics(2);
        GravityScale = 1;
    }
    if((WorldInfo.NetMode != NM_DedicatedServer) && Physics != 0)
    {
        SetRotation(rotator(Normal(Velocity)));
    }
}

state Pickup
{
    function GiveTo(Pawn P)
    {
        local KFWeapon W;

        foreach P.InvManager.InventoryActors(Class'KFWeapon', W)
        {
            if(W.Class == WeaponClass)
            {
                W.AddAmmo(1);
                PlayerController(P.Owner).ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 9,,, WeaponClass);
                P.PlaySoundBase(AmmoPickupSound);
                ShutDown();
            }            
        }        
    }

    function bool ValidTouch(Pawn Other)
    {
        if(((Other == none) || !Other.bCanPickupInventory) || (Other.DrivenVehicle == none) && Other.Controller == none)
        {
            return false;
        }
        if(!FastTrace(Other.Location, Location,, true))
        {
            return false;
        }
        if(WorldInfo.Game.PickupQuery(Other, WeaponClass, self))
        {
            return true;
        }
        return false;
    }

    simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
    {
        local Pawn P;

        if(Role == ROLE_Authority)
        {
            P = Pawn(Other);
            if((P != none) && ValidTouch(P))
            {
                GiveTo(P);
            }
        }
    }

    function CheckTouching()
    {
        local Pawn P;

        foreach TouchingActors(Class'Pawn', P)
        {
            Touch(P, none, Location, Normal(Location - P.Location));            
        }        
    }

    function BeginState(name PreviousStateName)
    {
        SetCollisionSize(PickupRadius, PickupHeight);
        CylinderComponent.SetActorCollision(true, false);
        bCollideComplex = false;
        SetOwner(none);
    }
Begin:

    CheckTouching();
    stop;        
}

defaultproperties
{
    WeaponClass=Class'KFWeap_Eviscerator'
    PickupRadius=200
    PickupHeight=50
    ProjPickupTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_pickup_01'
    AmmoPickupSound=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Pickup'
    LifeSpanAfterStick=180
    BouncesLeft=5
    DampingFactor=0.95
    RicochetEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeImpacts'
    bNoReplicationToInstigator=false
    bAmbientSoundZedTimeOnly=false
    GravityScale=0.75
    ExtraLineCollisionOffsets=/* Array type was not detected. */
    ProjFlightTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
    ProjFlightTemplateZedTime=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_SawBlade.Stop_WEP_SA_Sawblade_Projectile_Loop'
    AmbientComponent=AkComponent'Default__KFProj_Blade_Eviscerator.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeEmbedFX'
    Speed=2500
    MaxSpeed=2500
    bRotationFollowsVelocity=false
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=2
        CollisionRadius=6
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Blade_Eviscerator.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=2
        CollisionRadius=6
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Blade_Eviscerator.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Blade_Eviscerator.AmbientAkSoundComponent'
    bNetTemporary=false
    bUpdateSimulatedPosition=true
    LifeSpan=8
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=2
        CollisionRadius=6
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Blade_Eviscerator.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}