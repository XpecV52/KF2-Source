/*******************************************************************************
 * KFDroppedPickup generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDroppedPickup extends DroppedPickup
    native
    nativereplication
    hidecategories(Navigation);

var const RigidBodyState RBState;
var const float AngErrorAccumulator;
var transient bool bCollisionSoundsEnabled;
var const bool bEnableStaticMeshRBPhys;
var const bool bIgnoreBlockingVolumes;
var protected const bool bUseLowHealthDelay;
var bool bWaitingForWeaponSkinLoad;
var protected bool bUseAuthorityRBUpdate;
var bool bEmptyPickup;
var bool bUpgradedPickup;
var protectedwrite export editinline MeshComponent MyMeshComp;
var protectedwrite export editinline CylinderComponent MyCylinderComp;
var int SkinItemId;
var protected float PostAuthorityChangeLifeSpan;
var protected float PickupDelay;
var LinearColor EmptyPickupColor;

replication
{
     if(Role == ROLE_Authority)
        RBState, bUseAuthorityRBUpdate;

     if(bNetInitial)
        SkinItemId, bEmptyPickup, 
        bUpgradedPickup;
}

// Export UKFDroppedPickup::execGetPickupMesh(FFrame&, void* const)
native simulated function StaticMesh GetPickupMesh(class<KFWeapon> ItemClass);

simulated function SetPickupMesh(PrimitiveComponent NewPickupMesh)
{
    local editinline ActorComponent Comp;
    local editinline SkeletalMeshComponent SkelMC;
    local editinline StaticMeshComponent StaticMC;

    if(Role == ROLE_Authority)
    {
        if((Inventory != none) && Inventory.IsA('KFWeapon'))
        {
            SkinItemId = KFWeapon(Inventory).SkinItemId;
            bEmptyPickup = !KFWeapon(Inventory).HasAnyAmmo();
            bUpgradedPickup = KFWeapon(Inventory).CurrentWeaponUpgradeIndex > 0;
        }
        SetTimer(LifeSpan, false, 'TryFadeOut');
    }
    if(NewPickupMesh != none)
    {
        if((CollisionComponent == none) || CollisionComponent.Class != NewPickupMesh.Class)
        {
            Comp = new (self) NewPickupMesh.Class (NewPickupMesh);
            MyMeshComp = MeshComponent(Comp);
            AttachComponent(Comp);
            MyCylinderComp = CylinderComponent(CollisionComponent);
            AlignMeshToCylinder();
            CollisionComponent = PrimitiveComponent(Comp);            
        }
        else
        {
            Comp = CollisionComponent;
        }
        if(class<KFWeapon>(InventoryClass) != none)
        {
            StaticMeshComponent(MyMeshComp).SetStaticMesh(GetPickupMesh(class<KFWeapon>(InventoryClass)));
        }
        CollisionComponent.SetScale3D(NewPickupMesh.Scale3D);
        CollisionComponent.SetBlockRigidBody(true);
        CollisionComponent.SetActorCollision(true, false);
        CollisionComponent.SetRBChannel(19);
        CollisionComponent.SetRBCollidesWithChannel(0, true);
        if(!bIgnoreBlockingVolumes)
        {
            CollisionComponent.SetRBCollidesWithChannel(15, true);
        }
        CollisionComponent.SetNotifyRigidBodyCollision(true);
        CollisionComponent.ScriptRigidBodyCollisionThreshold = 100;
        CollisionComponent.WakeRigidBody();
        SkelMC = SkeletalMeshComponent(CollisionComponent);
        if(SkelMC != none)
        {
            SkelMC.bUpdateSkelWhenNotRendered = false;
            SkelMC.bComponentUseFixedSkelBounds = false;
            SkelMC.PhysicsWeight = 1;
            SkelMC.SetHasPhysicsAssetInstance(true);
            if(Role == ROLE_Authority)
            {
                SetPhysics();
            }
            SkelMC.PhysicsAssetInstance.SetAllBodiesFixed(false);
            bCallRigidBodyWakeEvents = true;            
        }
        else
        {
            StaticMC = StaticMeshComponent(CollisionComponent);
            if((StaticMC != none) && bEnableStaticMeshRBPhys)
            {
                CollisionComponent.InitRBPhys();
                if((Role == ROLE_Authority) && CollisionComponent.BodyInstance != none)
                {
                    SetPhysics(10);
                }
                bCallRigidBodyWakeEvents = true;
                MyMeshComp.SetRBLinearVelocity(Velocity);
                Velocity = vect(0, 0, 0);
            }
        }
        SetPickupSkin(SkinItemId);
    }
}

// Export UKFDroppedPickup::execStartLoadPickupSkin(FFrame&, void* const)
native function bool StartLoadPickupSkin(int SkinID);

simulated event SetPickupSkin(int ItemId, optional bool bFinishedLoading)
{
    local array<MaterialInterface> SkinMICs;

    bFinishedLoading = false;
    if(((ItemId > 0) && WorldInfo.NetMode != NM_DedicatedServer) && !bWaitingForWeaponSkinLoad)
    {
        if(bFinishedLoading || !StartLoadPickupSkin(ItemId))
        {
            SkinMICs = Class'KFWeaponSkinList'.static.GetWeaponSkin(ItemId, 2);
            if(SkinMICs.Length > 0)
            {
                MyMeshComp.SetMaterial(0, SkinMICs[0]);
            }
        }
    }
    if(bUpgradedPickup)
    {
        SetUpgradedMaterial();
    }
    if(bEmptyPickup)
    {
        SetEmptyMaterial();
    }
}

simulated function SetUpgradedMaterial()
{
    local MaterialInstanceConstant MeshMIC;

    if(MyMeshComp != none)
    {
        MeshMIC = MyMeshComp.CreateAndSetMaterialInstanceConstant(0);
        if(MeshMIC != none)
        {
            MeshMIC.SetScalarParameterValue('Upgrade', 1);
        }
    }
}

simulated function SetEmptyMaterial()
{
    local MaterialInstanceConstant MeshMIC;

    if(MyMeshComp != none)
    {
        MeshMIC = MyMeshComp.CreateAndSetMaterialInstanceConstant(0);
        if(MeshMIC != none)
        {
            MeshMIC.SetVectorParameterValue('GlowColor', EmptyPickupColor);
        }
    }
}

simulated function string GetDisplayName()
{
    if(InventoryClass != none)
    {
        return InventoryClass.default.ItemName;
    }
    return "";
}

simulated function AlignMeshToCylinder()
{
    local Vector MeshCenterLocal;
    local editinline SkeletalMeshComponent SkelComp;

    SkelComp = SkeletalMeshComponent(MyMeshComp);
    if(SkelComp != none)
    {
        MeshCenterLocal = (SkelComp.Bounds.Origin - Location) << Rotation;
        SkelComp.SetTranslation(-MeshCenterLocal);
    }
}

event OnSleepRBPhysics()
{
    local editinline SkeletalMeshComponent SkelComp;

    CollisionComponent.SetNotifyRigidBodyCollision(false);
    ClearTimer('CheckForRigidBodySleepState');
    CollisionComponent.SetBlockRigidBody(false);
    CollisionComponent.SetActorCollision(false, false);
    SkelComp = SkeletalMeshComponent(CollisionComponent);
    if((SkelComp != none) && SkelComp.PhysicsAssetInstance != none)
    {
        SkelComp.PhysicsAssetInstance.SetAllBodiesFixed(true);
        SkelComp.bUpdateKinematicBonesFromAnimation = false;
    }
    if(SkelComp != none)
    {
        SkelComp.bNoSkeletonUpdate = true;
        SkelComp.bUpdateSkelWhenNotRendered = false;
        SkelComp.SetAnimTreeTemplate(none);        
    }
    else
    {
        if(bEnableStaticMeshRBPhys)
        {
            CollisionComponent.GetRootBodyInstance().SetFixed(true);
        }
    }
    bOnlyDirtyReplication = true;
    bNetDirty = true;
    CollisionComponent.LastRenderTime = WorldInfo.TimeSeconds;
    AlignCollisionCylinder();
}

final simulated function AlignCollisionCylinder()
{
    local Vector MeshCenter, MeshTranslationLocal;

    MeshCenter = MyMeshComp.Bounds.Origin - Location;
    MeshTranslationLocal = ((MyCylinderComp.default.CollisionHeight * vect(0, 0, 1)) + MeshCenter) << Rotation;
    MyCylinderComp.SetTranslation(MeshTranslationLocal);
}

event RigidBodyCollision(PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent, const out CollisionImpactData RigidCollisionData, int ContactIndex)
{
    PlayCollisionSound();
}

event Landed(Vector HitNormal, Actor FloorActor)
{
    bForceNetUpdate = true;
    NetUpdateFrequency = 3;
    PlayCollisionSound();
}

function PlayCollisionSound()
{
    if(bCollisionSoundsEnabled)
    {
    }
}

function ReenableCollisionSounds()
{
    bCollisionSoundsEnabled = true;
}

function GiveTo(Pawn P)
{
    local KFWeapon KFW;
    local class<KFWeapon> KFWInvClass;
    local Inventory NewInventory;
    local KFInventoryManager KFIM;

    KFIM = KFInventoryManager(P.InvManager);
    if(KFIM != none)
    {
        KFWInvClass = class<KFWeapon>(InventoryClass);
        foreach KFIM.InventoryActors(Class'KFWeapon', KFW)
        {
            if(KFW.Class == InventoryClass)
            {
                if(KFW.DualClass == none)
                {
                    PlayerController(P.Owner).ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 16);                    
                    return;
                }
                break;
                continue;
            }
            if((KFWInvClass != none) && KFW.Class == KFWInvClass.default.DualClass)
            {
                PlayerController(P.Owner).ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 16);                
                return;
            }            
        }        
        if(((KFWInvClass != none) && KFWeapon(Inventory) != none) && !KFIM.CanCarryWeapon(KFWInvClass, KFWeapon(Inventory).CurrentWeaponUpgradeIndex))
        {
            PlayerController(P.Owner).ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 18);
            return;
        }
        NewInventory = KFIM.CreateInventory(InventoryClass, true);
        if(NewInventory != none)
        {
            KFW = KFWeapon(NewInventory);
            if(KFW != none)
            {
                KFW.SetOriginalValuesFromPickup(KFWeapon(Inventory));
                KFW = KFIM.CombineWeaponsOnPickup(KFW);
                KFW.NotifyPickedUp();
            }
            Destroy();
        }
    }
    if(Role == ROLE_Authority)
    {
        NotifyHUDofWeapon(P);
    }
}

event Destroyed()
{
    super.Destroyed();
    Inventory.Destroy();
    Inventory = none;
}

function NotifyHUDofWeapon(Pawn P)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(P.Owner);
    if((KFPC != none) && KFPC.myGfxHUD != none)
    {
        KFPC.myGfxHUD.NotifyHUDofWeapon();
    }
}

function bool ValidTouch(Pawn Other);

simulated function bool IsTouchBlockedBy(Actor A, PrimitiveComponent HitComponent)
{
    if((((A != self) && A.bWorldGeometry) && HitComponent != none) && HitComponent.BlockActors)
    {
        if(BlockingVolume(A) != none)
        {
            return false;
        }
        return true;
    }
    return false;
}

function Reset()
{
    Destroy();
}

function DisableAuthorityRBSim()
{
    bUseAuthorityRBUpdate = false;
    ClearTimer('TryFadeOut');
    SetTimer(PostAuthorityChangeLifeSpan, false, 'TryFadeOut');
}

function TryFadeOut()
{
    local Pawn P;

    if(bUseAuthorityRBUpdate)
    {
        foreach WorldInfo.AllPawns(Class'Pawn', P, Location, 1024)
        {
            if(P.IsPlayerOwned())
            {
                SetTimer(5, false, 'TryFadeOut');                
                return;
            }            
        }        
    }
    GotoState('FadeOut');
}

auto state Pickup
{
    function bool ValidTouch(Pawn Other)
    {
        local Actor HitA;
        local Vector HitLocation, HitNormal;
        local TraceHitInfo HitInfo;
        local bool bHitWall;

        if((((Other == none) || !Other.bCanPickupInventory) || !Other.IsAliveAndWell()) || (Other.DrivenVehicle == none) && Other.Controller == none)
        {
            return false;
        }
        if((WorldInfo.TimeSeconds - CreationTime) < PickupDelay)
        {
            return false;
        }
        if(Other == Instigator)
        {
            if(((bUseLowHealthDelay && float(Instigator.Health / Instigator.HealthMax) <= 0.2) && (WorldInfo.TimeSeconds - CreationTime) < 1) || (WorldInfo.TimeSeconds - CreationTime) < 0.1)
            {
                return false;
            }
        }
        foreach Other.TraceActors(Class'Actor', HitA, HitLocation, HitNormal, MyCylinderComp.GetPosition() + vect(0, 0, 10), Other.Location, vect(1, 1, 1), HitInfo)
        {
            if(IsTouchBlockedBy(HitA, HitInfo.HitComponent))
            {
                if(MyMeshComp == none)
                {                    
                    return false;
                    continue;
                }
                bHitWall = true;
                break;
            }            
        }        
        if(bHitWall)
        {
            foreach Other.TraceActors(Class'Actor', HitA, HitLocation, HitNormal, MyMeshComp.Bounds.Origin + vect(0, 0, 10), Other.Location, vect(1, 1, 1), HitInfo)
            {
                if(IsTouchBlockedBy(HitA, HitInfo.HitComponent))
                {                    
                    return false;
                }                
            }            
        }
        if(WorldInfo.Game.PickupQuery(Other, Inventory.Class, self))
        {
            return true;
        }
        return false;
    }

    function BeginState(name PreviousStateName)
    {
        SetTimer(LifeSpan - float(1), false);
    }
    stop;    
}

state FadeOut
{
    ignores Touch;

    function Tick(float DeltaTime)
    {
        SetDrawScale(FMax(0.01, DrawScale - (default.DrawScale * DeltaTime)));
        global.Tick(DeltaTime);
    }

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
    bCollisionSoundsEnabled=true
    bEnableStaticMeshRBPhys=true
    bUseLowHealthDelay=true
    bUseAuthorityRBUpdate=true
    PostAuthorityChangeLifeSpan=5
    EmptyPickupColor=(R=0.75,G=0,B=0,A=1)
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFDroppedPickup.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=40
        CollisionRadius=75
        ReplacementPrimitive=none
        Translation=(X=0,Y=0,Z=40)
    object end
    // Reference: CylinderComponent'Default__KFDroppedPickup.CollisionCylinder'
    Components(1)=CollisionCylinder
    bCanStepUpOn=false
    bAlwaysRelevant=true
    bOnlyDirtyReplication=false
    bKillDuringLevelTransition=true
    LifeSpan=300
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=40
        CollisionRadius=75
        ReplacementPrimitive=none
        Translation=(X=0,Y=0,Z=40)
    object end
    // Reference: CylinderComponent'Default__KFDroppedPickup.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}