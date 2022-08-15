//=============================================================================
// KFFlashlightAttachment
//=============================================================================
// Attach and manage flash light components (light, cone, etc..) to a
// weapon in 1st or 3rd person
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFFlashlightAttachment extends Object
	hidecategories(Object)
	native(Effect);

/** Cached parent (attachment) mesh */
var transient SkeletalMeshComponent OwnerMesh;

/** Is this flashlight turned on? */
var transient bool bEnabled;

/** Initialized the first time the light is turned on */
var transient bool bLightInitialized;

/*********************************************************************************************
 * @name	Attachments
 ********************************************************************************************* */

/** Spot Light */
var()			SpotLightComponent LightTemplate;
var transient	SpotLightComponent Light;

/** Light Cone Mesh*/
var()		  SkeletalMesh				LightConeMesh;
var transient KFSkeletalMeshComponent	LightConeMeshComp;

/** Mesh attachment (always visible) */
var()		  StaticMesh			AttachmentMesh;
var transient StaticMeshComponent	AttachmentMeshComp;

/** Socket name to attach the flashlight to */
var() name FlashlightSocketName;

/** Create/Attach flashlight components */
function AttachFlashlight(SkeletalMeshComponent Mesh, optional name SocketNameOverride)
{
	// Allow code to override attachment socket
	if ( SocketNameOverride != '' )
	{
		FlashlightSocketName = SocketNameOverride;
	}

	// The AttachmentMesh must be attached right away.  However, the lights are only created
	// if/when the flashlight is turned on for the first time
	if ( AttachmentMesh != None )
	{
		AttachmentMeshComp = new(self) class'StaticMeshComponent';
		AttachmentMeshComp.SetStaticMesh(AttachmentMesh);
		Mesh.AttachComponentToSocket(AttachmentMeshComp, FlashlightSocketName);
	}

	OwnerMesh = Mesh;
}

/** Remove/Detach flashlight components */
function DetachFlashlight(SkeletalMeshComponent Mesh)
{
	if ( Mesh != None )
	{
		if ( Light != none )
		{
			Mesh.DetachComponent(Light);
		}

		if ( LightConeMeshComp != none )
		{
			Mesh.DetachComponent(LightConeMeshComp);
		}

		if ( AttachmentMeshComp != None )
		{
			Mesh.DetachComponent(AttachmentMeshComp);
		}
	}
}

/** Toggle flash light components */
function SetEnabled(bool bNewEnabled)
{
	if ( bNewEnabled && !bLightInitialized )
	{
		InitializeLight(OwnerMesh);
	}

	if ( Light != None )
	{
		Light.SetEnabled(bNewEnabled);
	}

	if ( LightConeMeshComp != None )
	{
		LightConeMeshComp.SetHidden(!bNewEnabled);
	}

	bEnabled = bNewEnabled;
}

/** Called once the first time the last is activated.  Seperated from AttachFlashlight and the AttachmentMesh */
private function InitializeLight(SkeletalMeshComponent Mesh)
{
	if ( Mesh == None )
	{
		`log("Invalid mesh for flashlight"@self);
		return;
	}

	if ( Light == None && LightTemplate != None )
	{
		Light = new(self) Class'SpotLightComponent' (LightTemplate);
		OwnerMesh.AttachComponentToSocket(Light, FlashlightSocketName);
	}

	if ( LightConeMesh != None )
	{
		LightConeMeshComp.SetSkeletalMesh(LightConeMesh);
		OwnerMesh.AttachComponentToSocket(LightConeMeshComp, FlashlightSocketName);

		// If attaching to a mesh with a custom FOV
		if (OwnerMesh.IsA('KFSkeletalMeshComponent'))
		{
			SetFOV( KFSkeletalMeshComponent(OwnerMesh).FOV );
		}
	}
	
	bLightInitialized = true;
}

/** Allows us to update FOV whenever we want (e.g. when transitioning to iron sights with the flashlight on)*/
simulated function SetFOV( float NewFOV )
{
	if( LightConeMeshComp != none )
	{
		LightConeMeshComp.SetFOV( NewFOV );
	}
}

defaultproperties
{
	Begin Object Class=LightFunction Name=FlashLightFunction_0
		SourceMaterial=Material'FX_Mat_Lib.VFX_Flashlight_PM'
	End Object

	Begin Object Class=SpotLightComponent Name=FlashlightTemplate_0
		Brightness=2
		InnerConeAngle=20
		OuterConeAngle=30
		Radius=3000
		CastShadows=TRUE
		CastStaticShadows=FALSE
		CastDynamicShadows=TRUE
		ForceCastDynamicShadows=TRUE
		Function=FlashLightFunction_0
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		bEnabled=FALSE
		bUpdateOwnerRenderTime=TRUE
	End Object
	LightTemplate=FlashlightTemplate_0

	Begin Object Class=KFSkeletalMeshComponent Name=LightConeComp_0
		CastShadow=FALSE
	End Object
	LightConeMeshComp=LightConeComp_0

	FlashlightSocketName=FlashLight
}
