//=============================================================================
// KFEmit_ObjectivePath
//=============================================================================
// Objective path emitter based on UT3's Willow Wisp
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//============================================================================
class KFEmit_ObjectivePath extends KFEmit_Path;

simulated function bool ShouldStopPathing()
{
	local KFGameReplicationInfo KFGRI;
	local KFPlayerController KFPC;

   	KFPC = KFPlayerController(Owner);
	KFGRI = KFGameReplicationInfo(KFPC.WorldInfo.GRI);

	return ( super.ShouldStopPathing() || KFGRI == none || KFGRI.CurrentObjective == none ); 
}

defaultproperties
{
   WAYPOINT_HEIGHT=20
   EmitterTemplate=ParticleSystem'FX_Gameplay_EMIT.FX_Obj_Trail'
   Position=-1
   CURVE_TURNRATE=2.000000
   ACCEL_RATE=1200.000000
   bUseAccelerationPhysics=True
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'KFGame.Default__KFEmit_Path:ParticleSystemComponent0'
      bOverrideLODMethod=True
      SecondsBeforeInactive=0.000000
      LODMethod=PARTICLESYSTEMLODMETHOD_DirectSet
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFEmit_Path:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   bDestroyOnSystemFinish=True
   Components(0)=ParticleSystemComponent0
   Physics=PHYS_Projectile
   bNoDelete=False
   bOnlyRelevantToOwner=True
   bReplicateMovement=False
   LifeSpan=24.000000
   Name="Default__KFEmit_ObjectivePath"
   ObjectArchetype=KFEmit_Path'KFGame.Default__KFEmit_Path'
}
