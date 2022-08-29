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

// bSkipActorPropertyReplication=true prevents bHidden from being replicated automatically,
// so we'll do it ourselves anyway
var transient repnotify bool bHidden_Replicated;

delegate OnRepairCompelete(KFRepairableActor RepairedActor);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (bNetDirty)
		bHidden_Replicated;
}

simulated event ReplicatedEvent(name VarName)
{
	switch (VarName)
	{
	case nameof(bHidden_Replicated):
		SetHidden(bHidden_Replicated);
		break;

	default:
		super.ReplicatedEvent(VarName);
	};
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

simulated function InitializeWeldableComponent()
{
	WeldableComponent.SetOwner(self);
	WeldableComponent.MaxWeldIntegrity = MaxWeldIntegrity;
	WeldableComponent.bWeldable = true;
	WeldableComponent.Delegate_OnWeldIntegrityChanged = OnWeldCompWeldIntegrityChanged;

	WeldableComponent.SetCollisionCylinderSize(200, 200);
}

simulated function OnWeldCompWeldIntegrityChanged(int Amount, KFPawn Welder)
{
	if (Role == ROLE_Authority)
	{
		FastenWeld(Amount, Welder);
	}
	else
	{
		WeldIntegrity = WeldableComponent.WeldIntegrity;
		UpdateIntegrityMIC();
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

		WeldableComponent.SetDestroyed(true);
		WeldableComponent.SetWeldIntegrity(0);

		foreach ActivationSoundEvents(ActivationSound)
		{
			PlaySoundBase(ActivationSound,, WorldInfo.NetMode == NM_DedicatedServer);
		}
	}

	// Change the mesh on client and server so that collision is synced up for welding
	if(RepairableActorMesh != none)
	{
		RepairableActorMesh.SetStaticMesh(BrokenMesh);
		bForceNetUpdate = true;
	}

	if(WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (BreakingEmitterTemplate.ParticleTemplate != none)
		{
			WorldInfo.MyEmitterPool.SpawnEmitter(BreakingEmitterTemplate.ParticleTemplate, Location + BreakingEmitterTemplate.RelativeOffset, BreakingEmitterTemplate.RelativeRotation);
		}

		if (BrokenEmitterTemplate.ParticleTemplate != none)
		{
			BrokenEmitter = WorldInfo.MyEmitterPool.SpawnEmitter(BrokenEmitterTemplate.ParticleTemplate, Location + BrokenEmitterTemplate.RelativeOffset, BrokenEmitterTemplate.RelativeRotation);
		}
	}

	// activate kismet event
	OnKismetEvent(ERepairableActorEvent_Activated);
}

simulated function CompleteRepair()
{
	if (Role == ROLE_Authority)
	{
		bRepairComplete = true;
		bForceNetUpdate = true;
	}

	Reset();

	if (RepairFXTemplate.ParticleTemplate != none)
	{
		WorldInfo.MyEmitterPool.SpawnEmitter(RepairFXTemplate.ParticleTemplate, Location + RepairFXTemplate.RelativeOffset);
	}

	OnRepairCompelete(self);

	// repaired kismet event
	OnKismetEvent(ERepairableActorEvent_Repaired);
}

simulated function Reset()
{
	local AkEvent CompletionSound, ResetSound;

	if (Role == ROLE_Authority)
	{
		WeldIntegrity = MaxWeldIntegrity;
		bIsDestroyed = false;
		bWasRepaired = true;

		WeldableComponent.SetWeldIntegrity(MaxWeldIntegrity);
		WeldableComponent.SetDestroyed(false);

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

/** Handler for SeqAct_ToggleHidden, just sets bHidden. */
simulated function OnToggleHidden(SeqAct_ToggleHidden Action)
{
	super.OnToggleHidden(Action);

	// replicate bHidden here, because bSkipActorPropertyReplication=true prevents it from happening automatically
	if (Role == ROLE_Authority)
	{
		bHidden_Replicated = bHidden;
	}
}

simulated function OnKismetEvent(int EventType)
{
	local int i;
	local array<int> OutputLinksToActivate;
	local KFSeqEvent_RepairableActor ProgressEvent;

	OutputLinksToActivate.AddItem(EventType);
	for (i = 0; i < GeneratedEvents.Length; i++)
	{
		ProgressEvent = KFSeqEvent_RepairableActor(GeneratedEvents[i]);
		if (ProgressEvent != none)
		{
			ProgressEvent.Reset();
			ProgressEvent.CheckActivate(self, self, , OutputLinksToActivate);
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
   SupportedEvents(6)=Class'KFGame.KFSeqEvent_RepairableActor'
   Name="Default__KFRepairableActor"
   ObjectArchetype=KFWeldableActor'KFGame.Default__KFWeldableActor'
}
