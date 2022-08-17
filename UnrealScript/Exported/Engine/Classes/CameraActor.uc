/*
	CameraActor
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class CameraActor extends Actor
	native(Camera)
	ClassGroup(Common)
	placeable;

var()			bool			bConstrainAspectRatio;

var()	interp	float			AspectRatio;

var()	interp	float			FOVAngle;

var deprecated	bool					bCamOverridePostProcess;
/** Blend value for CamOverridePostProcess.  0.f means it's ignored, 1.f means use it exclusively.  */
var()	interp	float					CamOverridePostProcessAlpha<ClampMin=0.0 | ClampMax=1.0>;
var()	interp	PostProcessSettings		CamOverridePostProcess;

var		DrawFrustumComponent	DrawFrustum;
var		StaticMeshComponent		MeshComp;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if (Role == ROLE_Authority)
		FOVAngle, AspectRatio;
}


/**
 * Returns camera's Point of View.
 * Called by Camera.uc class. Subclass and postprocess to add any effects.
 */
simulated function GetCameraView(float DeltaTime, out TPOV OutPOV)
{
	GetActorEyesViewPoint(OutPOV.Location, OutPOV.Rotation);
	OutPOV.FOV = FOVAngle;
}


/** 
 * list important CameraActor variables on canvas.  HUD will call DisplayDebug() on the current ViewTarget when
 * the ShowDebug exec is used
 *
 * @param	HUD		- HUD with canvas to draw on
 * @input	out_YL		- Height of the current font
 * @input	out_YPos	- Y position on Canvas. out_YPos += out_YL, gives position to draw text for next debug line.
 */
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local float XL;
	local Canvas Canvas;

	Canvas = HUD.Canvas;

	super.DisplayDebug( HUD, out_YL, out_YPos);

	Canvas.StrLen("TEST", XL, out_YL);
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);
	Canvas.DrawText("FOV:" $ FOVAngle, false);
}

defaultproperties
{
   bConstrainAspectRatio=True
   AspectRatio=1.777780
   FOVAngle=90.000000
   CamOverridePostProcess=(bOverride_Bloom_Scale=True,bOverride_Bloom_Threshold=True,bOverride_Bloom_Tint=True,bOverride_Bloom_ScreenBlendThreshold=True,bOverride_Bloom_InterpolationDuration=True,bOverride_DOF_FalloffExponent=True,bOverride_DOF_BlurKernelSize=True,bOverride_DOF_BlurBloomKernelSize=True,bOverride_DOF_MaxNearBlurAmount=True,bOverride_DOF_MaxFarBlurAmount=True,bOverride_DOF_FocusType=True,bOverride_DOF_FocusInnerRadius=True,bOverride_DOF_FocusDistance=True,bOverride_DOF_FocusPosition=True,bOverride_DOF_InterpolationDuration=True,bOverride_Scene_Desaturation=True,bOverride_Scene_HighLights=True,bOverride_Scene_MidTones=True,bOverride_Scene_Shadows=True,bOverride_Scene_InterpolationDuration=True,bOverride_RimShader_Color=True,bOverride_RimShader_InterpolationDuration=True,bEnableBloom=True,bEnableMotionBlur=True,bEnableSceneEffect=True,bAllowAmbientOcclusion=True,TripwireSettings=(DOF_FocalDistance=1000.000000,DOF_SharpRadius=800.000000,DOF_FocalRadius=1200.000000,DOF_ExpFalloff=1.000000,DOF_FG_SharpRadius=75.000000,DOF_FG_FocalRadius=150.000000,DOF_FG_ExpFalloff=1.000000,Bloom_Intensity=1.050000,Bloom_Width=4.000000,Bloom_Exposure=1.250000,Bloom_Threshold=0.600000,Bloom_InterpolationDuration=1.000000,NoiseIntensity=1.000000,Fog_MaxStrength_Distance=10000.000000,Fog_AnimationCutoff_Distance=8000.000000,Fog_Intensity=0.300000,Fog_MinAmount=0.100000,Fog_Color=(R=1.000000,G=1.000000,B=1.000000,A=1.000000),Fog_InterpolationDuration=3.000000,MB_TileMaxEnabled=True,bEnableScreenSpaceReflections=True),LegacySettings=(Bloom_Scale=1.000000,Bloom_Threshold=1.000000,Bloom_InterpolationDuration=1.000000,DOF_BlurBloomKernelSize=16.000000,DOF_FalloffExponent=4.000000,DOF_BlurKernelSize=16.000000,DOF_MaxNearBlurAmount=1.000000,DOF_MaxFarBlurAmount=1.000000,DOF_FocusInnerRadius=2000.000000,DOF_InterpolationDuration=1.000000,MotionBlur_MaxVelocity=1.000000,MotionBlur_Amount=0.500000,MotionBlur_FullMotionBlur=True,MotionBlur_CameraRotationThreshold=45.000000,MotionBlur_CameraTranslationThreshold=10000.000000,MotionBlur_InterpolationDuration=1.000000,RimShader_Color=(R=0.470440,G=0.585973,B=0.827726,A=1.000000),RimShader_InterpolationDuration=1.000000,MobileColorGrading=(TransitionTime=1.000000,HighLights=(R=0.700000,G=0.700000,B=0.700000,A=1.000000),MidTones=(R=0.000000,G=0.000000,B=0.000000,A=1.000000),Shadows=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)),MobilePostProcess=(Mobile_BlurAmount=16.000000,Mobile_TransitionTime=1.000000,Mobile_Bloom_Scale=0.500000,Mobile_Bloom_Threshold=0.750000,Mobile_Bloom_Tint=(R=1.000000,G=1.000000,B=1.000000,A=1.000000),Mobile_DOF_Distance=1500.000000,Mobile_DOF_MinRange=600.000000,Mobile_DOF_MaxRange=1200.000000,Mobile_DOF_FarBlurFactor=1.000000)),Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10.000000,Scene_Colorize=(X=1.000000,Y=1.000000,Z=1.000000),Scene_TonemapperScale=1.000000,Scene_HighLights=(X=1.000000,Y=1.000000,Z=1.000000),Scene_MidTones=(X=1.000000,Y=1.000000,Z=1.000000))
   Begin Object Class=DrawFrustumComponent Name=DrawFrust0
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="DrawFrust0"
      ObjectArchetype=DrawFrustumComponent'Engine.Default__DrawFrustumComponent'
   End Object
   DrawFrustum=DrawFrust0
   Begin Object Class=StaticMeshComponent Name=CamMesh0
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="CamMesh0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   MeshComp=CamMesh0
   Components(0)=CamMesh0
   Components(1)=DrawFrust0
   Physics=PHYS_Interpolating
   bNoDelete=True
   bEdShouldSnap=True
   NetUpdateFrequency=1.000000
   Name="Default__CameraActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
