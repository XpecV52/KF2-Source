/*******************************************************************************
 * KFExplosion_ReplicatedNuke generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosion_ReplicatedNuke extends KFExplosion_Nuke
    config(Weapon)
    hidecategories(Navigation);

var private repnotify transient GameExplosion ReplicatedExploTemplate;

replication
{
     if(bNetInitial)
        ReplicatedExploTemplate;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ReplicatedExploTemplate')
    {
        Explode(ReplicatedExploTemplate, ExplosionDirection);        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
}

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector ExploDirection)
{
    if(Role == ROLE_Authority)
    {
        ReplicatedExploTemplate = NewExplosionTemplate;
    }
    super.Explode(NewExplosionTemplate, ExploDirection);
}

defaultproperties
{
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNetTemporary=true
    bAlwaysRelevant=true
    bNetInitialRotation=true
}