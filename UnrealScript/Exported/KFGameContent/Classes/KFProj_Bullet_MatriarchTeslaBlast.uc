//=============================================================================
// KFProj_Bullet_MatriarchTeslaBlast
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_MatriarchTeslaBlast extends KFProj_Bullet
	hidedropdown;

var ParticleSystem BeamPS, BeamHitPS;
var transient ParticleSystemComponent BeamPSC, BeamHitPSC;
var transient repnotify Pawn SourcePawn;
var transient repnotify Pawn TargetPawn;

replication
{
	if (bNetInitial)
		SourcePawn, TargetPawn;
}

simulated event ReplicatedEvent(name VarName)
{
	switch (VarName)
	{
	case nameof(SourcePawn):
	case nameof(TargetPawn):
		ActivateVFX();
		break;

	default:
		super.ReplicatedEvent(VarName);
	};
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	StopSimulating();
	SetTickIsDisabled(true);
}

simulated function ActivateVFX()
{
	local vector TargetLocation;

	if (BeamPSC == none)
	{
		if (KFPawn_ZedMatriarch(SourcePawn) != none)
		{
			BeamPSC = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(BeamPS, SourcePawn.Mesh, 'Hand_FX_End_L', true);
		}
		else
		{
			BeamPSC = WorldInfo.MyEmitterPool.SpawnEmitter(BeamPS, Location,, SourcePawn);
		}

		TargetLocation = TargetPawn.Mesh.GetBoneLocation(class'KFPawn_ZedMatriarch'.default.GunTargetBoneName);
		BeamHitPSC = WorldInfo.MyEmitterPool.SpawnEmitter(BeamHitPS, TargetLocation,, TargetPawn);

		BeamPSC.SetBeamTargetPoint(0, TargetLocation, 0);
		SetTickIsDisabled(false);
	}
}

simulated function DeactivateVFX()
{
	if (BeamPSC != none)
	{
		BeamPSC.DeactivateSystem();
		BeamPSC = none;
	}

	if (BeamHitPSC != none)
	{
		BeamHitPSC.DeactivateSystem();
		BeamHitPSC = none;
	}
}

simulated function Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	if (BeamPSC != none)
	{
		BeamPSC.SetBeamTargetPoint(0, TargetPawn.Mesh.GetBoneLocation(class'KFPawn_ZedMatriarch'.default.GunTargetBoneName), 0);
	}
}

simulated function Destroyed()
{
	super.Destroyed();
	DeactivateVFX();
}

defaultproperties
{
   BeamPS=ParticleSystem'ZED_Matriarch_EMIT.FX_Teslablast_Beam_01'
   BeamHitPS=ParticleSystem'ZED_Matriarch_EMIT.FX_Tesla_Blast_Impact_01'
   bUseClientSideHitDetection=False
   ProjEffectsFadeOutDuration=0.500000
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=None
   Speed=0.000000
   MaxSpeed=0.000000
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_MatriarchTeslaBlast"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
