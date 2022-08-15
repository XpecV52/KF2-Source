//=============================================================================
// KFBossCamera
//=============================================================================
// Camera for third person
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFBossCamera extends GameCameraBase;

struct CameraOffsets
{
	var vector ViewOffset;
	var vector RotOffset;
	var int	   CameraDistance;
};

var CameraOffsets BaseOffsets;
var CameraOffsets BackupOffsets;
var CameraOffsets DeadOffsets;

var	PointLightComponent PointLightTemplate;
var transient	PointLightComponent PointLight;

var Pawn ViewedPawn;

/** Called when the camera becomes inactive */
function OnBecomeActive( GameCameraBase NewCamera )
{
	if ( PointLight == None && PointLightTemplate != None )
	{
		PointLight = new(self) Class'PointLightComponent' (PointLightTemplate);
		PointLight.SetEnabled(true);
	}
}

/** Called when the camera becomes inactive */
function OnBecomeInActive( GameCameraBase NewCamera )
{
	if( PlayerCamera != none && PlayerCamera.PCOwner != none && PlayerCamera.PCOwner.Pawn != none )
	{
		PlayerCamera.PCOwner.SetViewTarget(PlayerCamera.PCOwner.Pawn);
	}

	if ( PointLight != None )
	{
		if( ViewedPawn != none )
		{
			ViewedPawn.DetachComponent(PointLight);
		}
		PointLight.SetEnabled(false);
		PointLight = none;
	}

	ViewedPawn = none;
}

/**
* Player Update Camera code
*/
function UpdateCamera(Pawn P, GamePlayerCamera CameraActor, float DeltaTime, out TViewTarget OutVT)
{
	local vector		Loc;
	local rotator		Rot;
	local CameraOffsets FinalOffsets;
	
	FinalOffsets = ( P != none && P.IsAliveAndWell() ) ? BaseOffsets : DeadOffsets;
	if( !GetOffsets(OutVT.Target, CameraActor, FinalOffsets, Loc, Rot) )
	{
		GetOffsets(OutVT.Target, CameraActor, BackupOffsets, Loc, Rot);
	}

	OutVT.POV.Location = Loc;
	OutVT.POV.Rotation = Rot;

	if( P != none && PointLight != none && !PointLight.bAttached )
	{
		ViewedPawn = P;
		ViewedPawn.AttachComponent(PointLight);
		PointLight.SetTranslation( Loc - OutVT.Target.Location );
	}
}

/** Get the necessary offsets for the different possible camera types, return whether there is an actor in the way of our desired location */
function bool GetOffsets( Actor Target, GamePlayerCamera CameraActor, out CameraOffsets InOffsets, out vector InLoc, out rotator InRot)
{
	local vector		Pos, HitLocation, HitNormal;
    local Actor			HitActor;
	
	InLoc = Target.Location;
	InRot = Target.Rotation;

	InRot.Yaw += InOffsets.RotOffset.X;
	InRot.Pitch += InOffsets.RotOffset.Y;

	InLoc += InOffsets.ViewOffset >> InRot;
	Pos = InLoc - Vector(InRot) * InOffsets.CameraDistance;
	
	// Try using the backup offsets if we the camera is in a wall
	HitActor = CameraActor.Trace(HitLocation, HitNormal, Pos, InLoc, FALSE, vect(12,12,12));
	
	InLoc = (HitActor == None) ? Pos : HitLocation;

	return (HitActor == None);
}

defaultproperties
{
   BaseOffsets=(ViewOffset=(X=0.000000,Y=85.000000,Z=90.000000),RotOffset=(X=38000.000000,Y=1200.000000,Z=0.000000),CameraDistance=250)
   BackupOffsets=(ViewOffset=(X=0.000000,Y=0.000000,Z=65.000000),RotOffset=(X=32768.000000,Y=0.000000,Z=0.000000),CameraDistance=300)
   DeadOffsets=(ViewOffset=(X=0.000000,Y=0.000000,Z=-50.000000),RotOffset=(X=38000.000000,Y=-1500.000000,Z=0.000000),CameraDistance=200)
   Begin Object Class=PointLightComponent Name=PointLightTemplate_0
      Radius=250.000000
      FalloffExponent=10.000000
      LightColor=(B=255,G=255,R=255,A=255)
      bEnabled=False
      LightingChannels=(Outdoor=True)
      Name="PointLightTemplate_0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   PointLightTemplate=PointLightTemplate_0
   Name="Default__KFBossCamera"
   ObjectArchetype=GameCameraBase'GameFramework.Default__GameCameraBase'
}
