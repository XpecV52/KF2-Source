/*******************************************************************************
 * KFWeapActor_CranialPopper_Tube generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapActor_CranialPopper_Tube extends Actor
    notplaceable
    hidecategories(Navigation);

/** Visual tube mesh that embeds into the enemy */
var() export editinline StaticMeshComponent TubeMesh;
var float Lifetime;
var float TubeLength;
var float DestroyDelay;
var bool bStopTick;

event PostBeginPlay()
{
    super.PostBeginPlay();
    Lifetime = Class'KFDT_Bleeding_Hemogoblin'.default.DoT_Duration;
    SetTimer(Lifetime, false, 'TearDown');
}

function TearDown()
{
    bStopTick = true;
    SetTimer(DestroyDelay, false, 'ActualDestroy');
}

function ActualDestroy()
{
    Destroy();
}

event Tick(float DeltaTime)
{
    local Vector NewRelativeLocation;

    super.Tick(DeltaTime);
    if(!bStopTick)
    {
        NewRelativeLocation = RelativeLocation + ((vector(RelativeRotation) * (TubeLength / Lifetime)) * DeltaTime);
        SetRelativeLocation(NewRelativeLocation);
    }
}

defaultproperties
{
    begin object name=Mesh0 class=StaticMeshComponent
        StaticMesh=StaticMesh'FX_Projectile_MESH.FX_Projectile_Leech'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeapActor_CranialPopper_Tube.Mesh0'
    TubeMesh=Mesh0
    TubeLength=10
    DestroyDelay=0.5
    begin object name=Mesh0 class=StaticMeshComponent
        StaticMesh=StaticMesh'FX_Projectile_MESH.FX_Projectile_Leech'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeapActor_CranialPopper_Tube.Mesh0'
    Components(0)=Mesh0
}