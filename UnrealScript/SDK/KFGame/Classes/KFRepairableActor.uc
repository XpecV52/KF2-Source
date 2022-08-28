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

cpptext
{
	virtual void PostLoad();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
}

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
	Physics=PHYS_None
	bEdShouldSnap=true
	bStatic=false
	bNoDelete=true
	bTickIsDisabled=true

	RemoteRole = ROLE_SimulatedProxy
	bAlwaysRelevant=true
	bOnlyDirtyReplication=true
	bSkipActorPropertyReplication=true
	bIgnoreNetRelevancyCollision=true
	NetUpdateFrequency=0.1
	bReplicateRigidBodyLocation=true

	bCollideActors=true
	bBlockActors=true
	bWorldGeometry=true
	bCollideWorld=false
	bNoEncroachCheck=false
	bProjTarget=false
	bCanStepUpOn=false
	bMovable=false

	MaxWeldIntegrity=1500

	BreakingEmitterTemplate=(ParticleTemplate=ParticleSystem'FX_Gore_EMIT_THREE.FX_HeadExplode_dh_px')
	BrokenEmitterTemplate=(ParticleTemplate=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Carnival_Electric_Malfunction_01')
	RepairFXTemplate=(ParticleTemplate=ParticleSystem'FX_Environmental_EMIT_THREE.FX_Carnival_Game_Entry_01')

	Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
		bAllowApproximateOcclusion=TRUE
		bForceDirectLightMap=TRUE
		bUsePrecomputedShadows=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		// Collision
		CollideActors=TRUE
		BlockActors=TRUE
		BlockRigidBody=TRUE
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE,DeadPawn=FALSE,Pickup=TRUE,FlexAsset=FALSE)
	End Object
	RepairableActorMesh=StaticMeshComponent0

	Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1
		bAllowApproximateOcclusion=TRUE
		bForceDirectLightMap=TRUE
		bUsePrecomputedShadows=TRUE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		CollideActors=FALSE
		BlockRigidBody=FALSE
	End Object
    WeldComponent=StaticMeshComponent1

}
