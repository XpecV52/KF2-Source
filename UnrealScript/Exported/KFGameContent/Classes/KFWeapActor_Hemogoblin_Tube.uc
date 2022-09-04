//=============================================================================
// KFWeapActor_Hemogoblin_Tube
//=============================================================================
// Attach class to handle visual burrowing of a tube into the hit zed
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeapActor_Hemogoblin_Tube extends Actor;

//Visual tube mesh that embeds into the enemy
var() StaticMeshComponent TubeMesh;

//Blood spray looping FX
var() ParticleSystemComponent BloodSprayFX;

//Blood SFX
var AkComponent BleederSFXComponent;
var() AkEvent BleederSFX;
var() AkEvent BleederSFXEnd;

//Lifetime until destroy is called
var float Lifetime;

//Size in the X direction - @TODO - get this at runtime
var float TubeLength;

//Destroy Delay
var float DestroyDelay;
var bool bStopTick;

event PostBeginPlay()
{
    super.PostBeginPlay();

    BleederSFXComponent.PlayEvent(BleederSFX, true);
    Lifetime = class'KFDT_Bleeding_Hemogoblin'.default.DoT_Duration;
    SetTimer(Lifetime, false, nameof(TearDown));
}

function TearDown()
{
    BloodSprayFX.DeactivateSystem();
	BleederSFXComponent.PlayEvent(BleederSFXEnd, true);
	bStopTick = true;

	//Because Mark wants his sound things to fade
	SetTimer(DestroyDelay, false, nameof(ActualDestroy));
}

function ActualDestroy()
{
	Destroy();
}

event Tick(float DeltaTime)
{
    local Vector NewRelativeLocation;
    super.Tick(DeltaTime);

	if (!bStopTick)
	{
		//Push the actor into the body based on relative rotation
		NewRelativeLocation = RelativeLocation + (Vector(RelativeRotation) * (TubeLength / Lifetime) * DeltaTime);
		SetRelativeLocation(NewRelativeLocation);
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=Mesh0
      StaticMesh=StaticMesh'FX_Projectile_MESH.FX_Projectile_Leech'
      ReplacementPrimitive=None
      Name="Mesh0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   TubeMesh=Mesh0
   Begin Object Class=ParticleSystemComponent Name=PSC0
      Template=ParticleSystem'WEP_Bleeder_EMIT.FX_Bleeder_Blood_Spray_01'
      ReplacementPrimitive=None
      Name="PSC0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   BloodSprayFX=PSC0
   Begin Object Class=AkComponent Name=BleederOneShotSFX
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="BleederOneShotSFX"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   BleederSFXComponent=BleederOneShotSFX
   BleederSFX=AkEvent'WW_WEP_Bleeder.Play_WEP_Bleeder_Tube_Blood'
   BleederSFXEnd=AkEvent'WW_WEP_Bleeder.Stop_WEP_Bleeder_Tube_Blood'
   TubeLength=10.000000
   DestroyDelay=0.500000
   Components(0)=Mesh0
   Components(1)=PSC0
   Components(2)=BleederOneShotSFX
   Name="Default__KFWeapActor_Hemogoblin_Tube"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
