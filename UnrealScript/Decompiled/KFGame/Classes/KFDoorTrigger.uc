/*******************************************************************************
 * KFDoorTrigger generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDoorTrigger extends KFTrigger_ChokePoint
    native
    hidecategories(Navigation)
    implements(KFInterface_Usable);

/** reference to actor to play open/close animations */
var() KFDoorActor DoorActor;

simulated event PostBeginPlay()
{
    if(DoorActor != none)
    {
        DoorActor.DoorTrigger = self;
    }
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    if(Role == ROLE_Authority)
    {
        Class'KFPlayerController'.static.UpdateInteractionMessages(Other);
    }
}

simulated event UnTouch(Actor Other)
{
    super.UnTouch(Other);
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
        ByteProperty'J'
        @NULL
        ""                        
    }
}

simulated function bool GetIsUsable(Pawn User)
{
    local bool bCanRepairDoors;
    local KFPawn KFP;

    KFP = KFPawn(User);
    bCanRepairDoors = ((KFP != none) && KFP.GetPerk() != none) && KFP.GetPerk().CanRepairDoors();
    if((DoorActor != none) && bCanRepairDoors || !DoorActor.bIsDestroyed)
    {
        return true;
    }
    return false;
}

function int GetInteractionIndex(Pawn User)
{
    if(DoorActor.bIsDestroyed)
    {
        return 7;        
    }
    else
    {
        if(DoorActor.WeldIntegrity > 0)
        {
            if((User.Weapon != none) && User.Weapon.Class.Name == 'KFWeap_Welder')
            {
                return -1;
            }
            return 6;            
        }
        else
        {
            return 5;
        }
    }
}

function bool UsedBy(Pawn User)
{
    if(GetIsUsable(User))
    {
        DoorActor.UseDoor(User);
        return true;
    }
    return false;
}

simulated function bool CanRestoreChokeCollision(KFPawn_Monster KFPM)
{
    if(!DoorActor.IsCompletelyOpen())
    {
        return true;
    }
    return super.CanRestoreChokeCollision(KFPM);
}

simulated function bool CanReduceTeammateCollision()
{
    return bReduceTeammateCollision && DoorActor.IsCompletelyOpen();
}

simulated function bool PartialReduceTeammateCollision()
{
    return (bReduceTeammateCollision && DoorActor.WeldIntegrity > 0) && DoorActor.Health > 0;
}

defaultproperties
{
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFDoorTrigger.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFDoorTrigger.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFDoorTrigger.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFDoorTrigger.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}