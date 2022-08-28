//=============================================================================
// KFExplosion_ReplicatedNuke
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFExplosion_ReplicatedNuke extends KFExplosion_Nuke;

var transient private repnotify GameExplosion ReplicatedExploTemplate;

replication
{
	if(bNetInitial)
		ReplicatedExploTemplate;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'ReplicatedExploTemplate')
	{
		Explode(ReplicatedExploTemplate, ExplosionDirection);
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated function Explode(GameExplosion NewExplosionTemplate, optional vector ExploDirection)
{
	if (Role == ROLE_Authority)
	{
		ReplicatedExploTemplate = NewExplosionTemplate;
	}

	super.Explode(NewExplosionTemplate, ExploDirection);
}

defaultproperties
{
   RemoteRole=ROLE_SimulatedProxy
   bNetTemporary=True
   bAlwaysRelevant=True
   bNetInitialRotation=True
   Name="Default__KFExplosion_ReplicatedNuke"
   ObjectArchetype=KFExplosion_Nuke'KFGame.Default__KFExplosion_Nuke'
}
