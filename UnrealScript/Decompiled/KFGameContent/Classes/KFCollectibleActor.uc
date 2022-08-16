/*******************************************************************************
 * KFCollectibleActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCollectibleActor extends KFDestructibleActor
    hidecategories(Physics,Advanced,Debug,Object,Mobile,Navigation,NavMesh);

var private bool bFound;

protected event TriggerDestroyedEvent(Controller EventInstigator)
{
    local KFMapInfo KFMI;

    super.TriggerDestroyedEvent(EventInstigator);
    KFMI = KFMapInfo(WorldInfo.GetMapInfo());
    if(!bFound && KFMI != none)
    {
        bFound = true;
        KFMI.OnCollectibleFound(self, EventInstigator);
    }
    bShutDown = true;
}

function AdjustDamage(out int InDamage, Controller EventInstigator, class<DamageType> DamageType)
{
    if((EventInstigator == none) || !EventInstigator.bIsPlayer)
    {
        InDamage = 0;
        return;
    }
    super.AdjustDamage(InDamage, EventInstigator, DamageType);
}

defaultproperties
{
    ReplicationMode=EDestructibleRepType.RT_ServerOptimized
    bAllowBumpDamageFromAI=false
    AmbientSoundComponent=AkComponent'Default__KFCollectibleActor.AmbientSoundComponent0'
    SubObjects=/* Array type was not detected. */
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFCollectibleActor.Sprite'
    Components(0)=Sprite
    begin object name=StaticMeshComponent0 class=StaticMeshComponent
        StaticMesh=StaticMesh'ENV_Collectible_MESH.Env_Dosh_Collectible'
        bNeverBecomeDynamic=true
        ReplacementPrimitive=none
        LightingChannels=(bInitialized=true,Dynamic=true,Indoor=true,Outdoor=true)
    object end
    // Reference: StaticMeshComponent'Default__KFCollectibleActor.StaticMeshComponent0'
    Components(1)=StaticMeshComponent0
}