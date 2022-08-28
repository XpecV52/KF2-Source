//=============================================================================
// KFRepairableActor
//=============================================================================
// Class for any actor that can be repaired with the welder.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFRepairableActor extends KFWeldableActor
	hidecategories(Collision, Physics, Object, Mobile)
	placeable
	native;

var KFRepairableActorTrigger RepairTrigger;

var() const StaticMesh RepairedMesh;
var() const StaticMesh BrokenMesh;

var() StaticMeshComponent RepairableActorMesh;
var() StaticMeshComponent WeldComponent;

var() FXTemplate BreakingEmitterTemplate;

var() FXTemplate BrokenEmitterTemplate;
var	  ParticleSystemComponent BrokenEmitter;

var() array<AkEvent> ActivationSoundEvents;
var() array<AkEvent> CompletionSoundEvents;
var() array<AkEvent> ResetSoundEvents;

var() vector IconLocationOffset;

var transient bool bRepairComplete;

delegate OnRepairCompelete(KFRepairableActor RepairedActor);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated private native function SetupComponents();

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	SetupComponents();
	InitializeRepairableActorMIC();
	InitializeIntegrityMIC();
	Reset();
}

simulated function InitializeIntegrityMIC()
{
	if (WeldComponent != none && WeldComponent.GetMaterial(0) != none)
	{
		IntegrityMIC = WeldComponent.CreateAndSetMaterialInstanceConstant(0);
		IntegrityMIC.SetScalarParameterValue('Weld', 0.f);
		UpdateIntegrityMIC();
	}
}

simulated function InitializeRepairableActorMIC()
{
	local int MaterialIndex;
	local MaterialInstanceConstant NewMIC;

	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	if (RepairableActorMesh == none)
	{
		return;
	}

	for (MaterialIndex = 0; MaterialIndex < RepairableActorMesh.GetNumElements(); MaterialIndex++)
	{
		if(RepairableActorMesh.GetMaterial(MaterialIndex) != none)
		{
			NewMIC = new class'MaterialInstanceConstant';
			NewMIC.SetParent(RepairableActorMesh.GetMaterial(MaterialIndex));
			RepairableActorMesh.SetMaterial(MaterialIndex, NewMIC);
		}
	}
}

function Repair(float Amount, optional KFPawn Welder)
{
	FastenWeld(Amount, Welder);
}

function FastenWeld(int Amount, optional KFPawn Welder)
{
	// not allowed to unfasten object.
	if (Amount > 0 && WeldIntegrity < MaxWeldIntegrity)
	{
		UpdateWeldIntegrity(Amount);

		if (!BeingUnwelded())
		{
			if (!BeingWelded())
			{
				WelderPawn = Welder;
			}
		}

		if (WelderPawn == Welder)
		{
			LastWeldTime = WorldInfo.TimeSeconds;
		}
	}

	if (WeldIntegrity >= MaxWeldIntegrity)
	{
		CompleteRepair();
	}
}

simulated function PlayDestroyed()
{
	local AkEvent ActivationSound;

	if (Role == ROLE_Authority)
	{
		bIsDestroyed = true;
		bWasRepaired = false;
		bRepairComplete = false;
		UpdateWeldIntegrity(-WeldIntegrity);

		foreach ActivationSoundEvents(ActivationSound)
		{
			PlaySoundBase(ActivationSound,, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}

	if(WorldInfo.NetMode != NM_DedicatedServer)
	{
		if(RepairableActorMesh != none)
		{
			RepairableActorMesh.SetStaticMesh(BrokenMesh);
		}

		if (BreakingEmitterTemplate.ParticleTemplate != none)
		{
			WorldInfo.MyEmitterPool.SpawnEmitter(BreakingEmitterTemplate.ParticleTemplate, Location + BreakingEmitterTemplate.RelativeOffset, BreakingEmitterTemplate.RelativeRotation);
		}

		if (BrokenEmitterTemplate.ParticleTemplate != none)
		{
			BrokenEmitter = WorldInfo.MyEmitterPool.SpawnEmitter(BrokenEmitterTemplate.ParticleTemplate, Location + BrokenEmitterTemplate.RelativeOffset, BrokenEmitterTemplate.RelativeRotation);
		}
	}
}

simulated function CompleteRepair()
{
	if (Role == ROLE_Authority)
	{
		bRepairComplete = true;
	}

	Reset();

	if (RepairFXTemplate.ParticleTemplate != none)
	{
		WorldInfo.MyEmitterPool.SpawnEmitter(RepairFXTemplate.ParticleTemplate, Location + RepairFXTemplate.RelativeOffset);
	}

	OnRepairCompelete(self);
}

simulated function Reset()
{
	local AkEvent CompletionSound, ResetSound;

	if (Role == ROLE_Authority)
	{
		WeldIntegrity = MaxWeldIntegrity;
		bIsDestroyed = false;
		bWasRepaired = true;

		if (bRepairComplete)
		{
			foreach CompletionSoundEvents(CompletionSound)
			{
				PlaySoundBase(CompletionSound,, WorldInfo.NetMode == NM_DedicatedServer);
			}
		}
		else
		{
			foreach ResetSoundEvents(ResetSound)
			{
				PlaySoundBase(ResetSound,, WorldInfo.NetMode == NM_DedicatedServer);
			}
		}
	}

	if (BrokenEmitter != none)
	{
		BrokenEmitter.DeactivateSystem();
		BrokenEmitter = none;
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (RepairableActorMesh != none)
		{
			RepairableActorMesh.SetStaticMesh(RepairedMesh);
		}
	}
}

simulated function UpdateIntegrityMIC()
{
	local float IntegrityScalar;

	if (IntegrityMIC != none)
	{
		if (WeldIntegrity > 0)
		{
			IntegrityScalar = float(WeldIntegrity) / float(MaxWeldIntegrity);
		}
		else
		{
			IntegrityScalar = 0;
		}

		IntegrityMIC.SetScalarParameterValue('Weld', IntegrityScalar);

		if (WeldComponent != none)
		{
			if (WeldComponent.HiddenGame && WeldIntegrity > 0)
			{
				WeldComponent.SetHidden(false);
			}
			else
			{
				WeldComponent.SetHidden(true);
			}
		}
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,Pickup=True,FlexAsset=False)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   RepairableActorMesh=StaticMeshComponent0
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      CollideActors=False
      BlockRigidBody=False
      Name="StaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   WeldComponent=StaticMeshComponent1
   BreakingEmitterTemplate=(ParticleTemplate=ParticleSystem'FX_Gore_EMIT_THREE.FX_HeadExplode_dh_px')
   BrokenEmitterTemplate=(ParticleTemplate=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Carnival_Electric_Malfunction_01')
   MaxWeldIntegrity=1500
   RepairFXTemplate=(ParticleTemplate=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Carnival_Game_Entry_01')
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   bTickIsDisabled=True
   bWorldGeometry=True
   bCanStepUpOn=False
   bAlwaysRelevant=True
   bSkipActorPropertyReplication=True
   bOnlyDirtyReplication=True
   bReplicateRigidBodyLocation=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   bEdShouldSnap=True
   bIgnoreNetRelevancyCollision=True
   NetUpdateFrequency=0.100000
   Name="Default__KFRepairableActor"
   ObjectArchetype=KFWeldableActor'KFGame.Default__KFWeldableActor'
}
