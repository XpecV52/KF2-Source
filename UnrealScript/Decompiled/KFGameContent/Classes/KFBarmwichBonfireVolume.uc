/*******************************************************************************
 * KFBarmwichBonfireVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFBarmwichBonfireVolume extends KFPhysicsDamageByPawnVolume
    hidecategories(Navigation,Object,Movement,Display);

/** Objective index for the event this is tied to */
var() int ObjectiveIndex;
/** Index of the event this is tied to */
var() int EventIndex;
var array<Actor> AffectedActors;
var transient bool bIsDataValid;

simulated event PostBeginPlay()
{
    super(PhysicsVolume).PostBeginPlay();
    bIsDataValid = IsObjectiveDataValid();
}

function CausePainTo(Actor Other)
{
    super.CausePainTo(Other);
    if((bIsDataValid && KFPawn_Monster(Other) != none) && KFPawn_Monster(Other).IsAliveAndWell())
    {
        if(AffectedActors.Find(Other == -1)
        {
            AffectedActors.AddItem(Other;
            NotifyProgression();
        }
    }
}

function NotifyProgression()
{
    local KFPlayerController KFPC;

    if(!bIsDataValid)
    {
        return;
    }
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        KFPC.ClientOnTryCompleteObjective(ObjectiveIndex, EventIndex);        
    }    
}

function ClearAllActors()
{
    AffectedActors.Remove(0, AffectedActors.Length;
}

function ClearActor(Actor Other)
{
    AffectedActors.RemoveItem(Other;
}

simulated function bool IsObjectiveDataValid()
{
    return (((ObjectiveIndex >= 0) && ObjectiveIndex < 5) && EventIndex > 0) && EventIndex < 5;
}

defaultproperties
{
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFBarmwichBonfireVolume.BrushComponent0'
    BrushComponent=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFBarmwichBonfireVolume.BrushComponent0'
    Components(0)=BrushComponent0
    begin object name=BrushComponent0 class=BrushComponent
        ReplacementPrimitive=none
    object end
    // Reference: BrushComponent'Default__KFBarmwichBonfireVolume.BrushComponent0'
    CollisionComponent=BrushComponent0
}