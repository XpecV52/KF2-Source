/*******************************************************************************
 * GameCrowdReplicationActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameCrowdReplicationActor extends Actor
    native
    notplaceable
    hidecategories(Navigation);

var repnotify SeqAct_GameCrowdSpawner Spawner;
var repnotify bool bSpawningActive;
var repnotify int DestroyAllCount;

replication
{
     if(Role == ROLE_Authority)
        DestroyAllCount, Spawner, 
        bSpawningActive;
}

simulated event ReplicatedEvent(name VarName);

auto state ReceivingReplication
{
    ignores Tick;
    stop;    
}

defaultproperties
{
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bAlwaysRelevant=true
    bReplicateMovement=false
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=1
    NetPriority=2.7
}