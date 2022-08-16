//=============================================================================
// KFCollectibleActor
//=============================================================================
// Collection estructible used to unlock achievements
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================

class KFCollectibleActor extends KFDestructibleActor
	placeable
	hidecategories(Navigation,NavMesh);

/** Whether this collectible has been found or not */
var private bool bFound;

/** Overridden to call OnCollect */
protected event TriggerDestroyedEvent( Controller EventInstigator )
{
	local KFMapInfo KFMI;

	super.TriggerDestroyedEvent( EventInstigator );

	KFMI = KFMapInfo( WorldInfo.GetMapInfo() );
	if( !bFound && KFMI != none )
	{
		bFound = true;
		KFMI.OnCollectibleFound( self, EventInstigator );
	}

	// Used on network to tell clients who join late that this collectible is destroyed
	bShutDown = true;
}

/** Overridden to prevent AI from damaging collectibles */
function AdjustDamage(out int InDamage, Controller EventInstigator, class<DamageType> DamageType)
{
	if( EventInstigator == none || !EventInstigator.bIsPlayer )
	{
		InDamage = 0;
		return;
	}

	super.AdjustDamage( InDamage, EventInstigator, DamageType );
}

defaultproperties
{
   ReplicationMode=RT_ServerOptimized
   bAllowBumpDamageFromAI=False
   Begin Object Class=AkComponent Name=AmbientSoundComponent0 Archetype=AkComponent'KFGame.Default__KFDestructibleActor:AmbientSoundComponent0'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientSoundComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFDestructibleActor:AmbientSoundComponent0'
   End Object
   AmbientSoundComponent=AmbientSoundComponent0
   SubObjects(0)=(Mesh=StaticMeshComponent0,DamageMods=((Sounds=(AkEvent'WW_UI_PlayerCharacter.Play_UI_Collectible_Hit'),bSelfDestruct=True,ParticleEffects=((ParticleEffect=ParticleSystem'FX_Gameplay_EMIT_TWO.FX_Collectible_pickup_01')))),DefaultHealth=1.000000,Health=1)
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFDestructibleActor:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFDestructibleActor:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      StaticMesh=StaticMesh'ENV_Collectible_MESH.Env_Dosh_Collectible'
      bNeverBecomeDynamic=True
      ReplacementPrimitive=None
      LightingChannels=(bInitialized=True,Dynamic=True,Indoor=True,Outdoor=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(1)=StaticMeshComponent0
   Name="Default__KFCollectibleActor"
   ObjectArchetype=KFDestructibleActor'KFGame.Default__KFDestructibleActor'
}
