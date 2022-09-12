/*******************************************************************************
 * KFRepairableActorTrigger generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFRepairableActorTrigger extends Trigger_PawnsOnly
    native
    hidecategories(Navigation)
    implements(KFInterface_Usable);

var() KFRepairableActor RepairableActor;

simulated event PostBeginPlay()
{
    if(RepairableActor != none)
    {
        RepairableActor.RepairTrigger = self;
    }
    super(Trigger).PostBeginPlay();
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    super(Trigger).Touch(Other, OtherComp, HitLocation, HitNormal);
    if(Role == ROLE_Authority)
    {
        Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
    }
}

simulated event UnTouch(Actor Other)
{
    super(Actor).UnTouch(Other);
    if(Role == ROLE_Authority)
    {
        Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
    }
}

function OnDestroyOrReset()
{
    local KFPawn_Human P;

    foreach TouchingActors(Class'KFPawn_Human', P)
    {
        InstigatorPerk
        @NULL
        -- @NULL;        
        @NULL
        default.@NULL
        @NULL
    }
}

simulated function bool GetIsUsable(Pawn User)
{
    if(RepairableActor != none)
    {
        return RepairableActor.WeldIntegrity < RepairableActor.MaxWeldIntegrity;
    }
    return false;
}

function int GetInteractionIndex(Pawn User)
{
    if((RepairableActor != none) && RepairableActor.WeldIntegrity < RepairableActor.MaxWeldIntegrity)
    {
        if((User.Weapon != none) && User.Weapon.Class.Name == 'KFWeap_Welder')
        {
            return -1;
        }
        return 6;
    }
    return 5;
}

defaultproperties
{
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=100
        CollisionRadius=200
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFRepairableActorTrigger.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFRepairableActorTrigger.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=100
        CollisionRadius=200
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFRepairableActorTrigger.CollisionCylinder'
    Components(1)=CollisionCylinder
    bProjTarget=false
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=100
        CollisionRadius=200
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFRepairableActorTrigger.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}