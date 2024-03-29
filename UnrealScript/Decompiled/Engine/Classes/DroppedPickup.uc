/*******************************************************************************
 * DroppedPickup generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DroppedPickup extends Actor
    native
    notplaceable
    hidecategories(Navigation);

var Inventory Inventory;
var repnotify class<Inventory> InventoryClass;
var NavigationPoint PickupCache;
var repnotify bool bFadeOut;

replication
{
     if(Role == ROLE_Authority)
        InventoryClass, bFadeOut;
}

// Export UDroppedPickup::execAddToNavigation(FFrame&, void* const)
native final function AddToNavigation();

// Export UDroppedPickup::execRemoveFromNavigation(FFrame&, void* const)
native final function RemoveFromNavigation();

event Destroyed()
{
    if(Inventory != none)
    {
        Inventory.Destroy();
    }
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'InventoryClass')
    {
        SetPickupMesh(InventoryClass.default.DroppedPickupMesh);
        SetPickupParticles(InventoryClass.default.DroppedPickupParticles);        
    }
    else
    {
        if(VarName == 'bFadeOut')
        {
            GotoState('FadeOut');            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
}

function Reset()
{
    Destroy();
}

simulated event SetPickupMesh(PrimitiveComponent PickupMesh)
{
    local editinline ActorComponent Comp;

    if((PickupMesh != none) && WorldInfo.NetMode != NM_DedicatedServer)
    {
        Comp = new (self) PickupMesh.Class (PickupMesh);
        AttachComponent(Comp);
    }
}

simulated event SetPickupParticles(ParticleSystemComponent PickupParticles)
{
    local editinline ParticleSystemComponent Comp;

    if((PickupParticles != none) && WorldInfo.NetMode != NM_DedicatedServer)
    {
        Comp = new (self) PickupParticles.Class (PickupParticles);
        AttachComponent(Comp);
        Comp.SetActive(true);
    }
}

event EncroachedBy(Actor Other)
{
    Destroy();
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    return Inventory.DetourWeight(Other, PathWeight);
}

event Landed(Vector HitNormal, Actor FloorActor)
{
    bForceNetUpdate = true;
    bNetDirty = true;
    NetUpdateFrequency = 3;
    AddToNavigation();
}

function GiveTo(Pawn P)
{
    if(Inventory != none)
    {
        Inventory.AnnouncePickup(P);
        Inventory.super(DroppedPickup).GiveTo(P);
        Inventory = none;
    }
    PickedUpBy(P);
}

function PickedUpBy(Pawn P)
{
    Destroy();
}

function RecheckValidTouch();

auto state Pickup
{
    function bool ValidTouch(Pawn Other)
    {
        if(((Other == none) || !Other.bCanPickupInventory) || (Other.DrivenVehicle == none) && Other.Controller == none)
        {
            return false;
        }
        if(((Physics == 2) && Other == Instigator) && Velocity.Z > float(0))
        {
            return false;
        }
        if(!FastTrace(Other.Location, Location))
        {
            SetTimer(0.5, false, 'RecheckValidTouch');
            return false;
        }
        if(WorldInfo.Game.PickupQuery(Other, Inventory.Class, self))
        {
            return true;
        }
        return false;
    }

    function RecheckValidTouch()
    {
        CheckTouching();
    }

    event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
    {
        local Pawn P;

        P = Pawn(Other);
        if((P != none) && ValidTouch(P))
        {
            GiveTo(P);
        }
    }

    event Timer()
    {
        GotoState('FadeOut');
    }

    function CheckTouching()
    {
        local Pawn P;

        foreach TouchingActors(Class'Pawn', P)
        {
            Touch(P, none, Location, vect(0, 0, 1));            
        }        
    }

    event BeginState(name PreviousStateName)
    {
        AddToNavigation();
        if(LifeSpan > 0)
        {
            SetTimer(LifeSpan - float(1), false);
        }
    }

    event EndState(name NextStateName)
    {
        RemoveFromNavigation();
    }
Begin:

    CheckTouching();
    stop;        
}

state FadeOut extends Pickup
{
    simulated event BeginState(name PreviousStateName)
    {
        bFadeOut = true;
        RotationRate.Yaw = 60000;
        SetPhysics(5);
        LifeSpan = 1;
    }
    stop;    
}

defaultproperties
{
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.S_Inventory'
        SpriteCategoryName=Inventory
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
    object end
    // Reference: SpriteComponent'Default__DroppedPickup.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=20
        CollisionRadius=30
        ReplacementPrimitive=none
        CollideActors=true
    object end
    // Reference: CylinderComponent'Default__DroppedPickup.CollisionCylinder'
    Components(1)=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bIgnoreRigidBodyPawns=true
    bOrientOnSlope=true
    bUpdateSimulatedPosition=true
    bOnlyDirtyReplication=true
    bShouldBaseAtStartup=true
    bCollideActors=true
    bCollideWorld=true
    NetUpdateFrequency=8
    NetPriority=1.4
    LifeSpan=16
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=20
        CollisionRadius=30
        ReplacementPrimitive=none
        CollideActors=true
    object end
    // Reference: CylinderComponent'Default__DroppedPickup.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=0,Yaw=5000,Roll=0)
}