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
var()		  StaticMesh			LightConeMesh;
var 	  	  StaticMeshComponent	LightConeMeshComp;

/** Mesh attachment (always visible) */
var()		  StaticMesh			AttachmentMesh;
var transient StaticMeshComponent	AttachmentMeshComp;

/** Socket name to attach the flashlight to */
var() name FlashlightSocketName;

/** Create/Attach flashlight components */
function AttachFlashlight(SkeletalMeshComponent Mesh, optional name SocketNameOverride)
{
	if ( OwnerMesh != None && OwnerMesh != Mesh )
	{
		return; // unsupported attachment
	}
	OwnerMesh = Mesh;

	// Allow code to override attachment socket
	if ( SocketNameOverride != '' )
	{
		FlashlightSocketName = SocketNameOverride;
	}

	// The AttachmentMesh must be attached right away.  However, the lights are only created
	// if/when the flashlight is turned on for the first time
	if ( AttachmentMesh != None )
	{
		if ( AttachmentMeshComp == None )
		{
			AttachmentMeshComp = new(self) class'StaticMeshComponent';
			AttachmentMeshComp.CastShadow = FALSE;
			AttachmentMeshComp.SetStaticMesh(AttachmentMesh);
		}
		else
		{
			// Cleanup previous attachment.  For example, during customization mesh swap the
			// link to parent is lost, but the child link is retained for some reason.
			Mesh.DetachComponent(AttachmentMeshComp);
		}
		AttachFlashlightComponent(Mesh, AttachmentMeshComp);

		if ( IsOwnerFirstPerson() )
		{
			SetFirstPersonVisibility(true);
		}
	}

	SetLightingChannels(Mesh.LightingChannels);
}

/** Remove/Detach flashlight components */
function DetachFlashlight()
{
	if ( Light != none )
	{
		Light.DetachFromAny();
	}

	if ( LightConeMeshComp != none )
	{
		LightConeMeshComp.DetachFromAny();
	}

	if ( AttachmentMeshComp != None )
	{
		AttachmentMeshComp.DetachFromAny();
	}
}

/** Toggle flash light components */
function SetEnabled(bool bNewEnabled)
{
	if ( bNewEnabled && !bLightInitialized )
	{
		InitializeLight();
	}

	if ( Light != None )
	{
		Light.SetEnabled(bNewEnabled);
	}

	if ( LightConeMeshComp != None )
	{
		LightConeMeshComp.SetHidden(!bNewEnabled || IsOwnerFirstPerson());
	}

	bEnabled = bNewEnabled;
}

/** Called once the first time the light is activated.  Seperated from AttachFlashlight and the AttachmentMesh */
private function InitializeLight()
{
	if ( OwnerMesh == None )
	{
		LogInternal("Invalid mesh for flashlight"@self);
		return;
	}	

	if ( Light == None && LightTemplate != None )
	{
		Light = new(self) Class'SpotLightComponent' (LightTemplate);
		AttachFlashlightComponent(OwnerMesh, Light);
	}

	if ( LightConeMesh != None )
	{
		LightConeMeshComp.SetStaticMesh(LightConeMesh);		
		AttachFlashlightComponent(OwnerMesh, LightConeMeshComp);
	}

	bLightInitialized = true;

	if ( IsOwnerFirstPerson() )
	{
		SetFirstPersonVisibility(true);
	}
}

/** attachment helper */
private function AttachFlashlightComponent(SkeletalMeshComponent ParentMesh, ActorComponent Attachment)
{
	ParentMesh.AttachComponentToSocket(Attachment, FlashlightSocketName);
}

/** attachment helper */
private function bool IsOwnerFirstPerson()
{
	local Pawn P;
	P = Pawn(OwnerMesh.Outer);
	return (P != None) ? P.IsFirstPerson() : false;
}

/** Cleanup */
simulated function OwnerDied()
{
	if ( bEnabled )
	{
		SetEnabled(false);
	}

	// make sure SpotLightComponent is removed (in case of 1st person camera attachment)
	if ( Light != None )
	{
		Light.DetachFromAny();
	}
}

/** Special handling for components attached to character mesh while in 1st person */
simulated function SetFirstPersonVisibility(bool bFirstPerson)
{
	local KFPawn P;

	if ( bLightInitialized )
	{
		P = KFPawn(OwnerMesh.Outer);
		if ( Light != None && P != None )
		{
			if ( bFirstPerson )
			{
				if( P.Controller != none && PlayerController(P.Controller) != none && PlayerController(P.Controller).PlayerCamera != none )
				{
					PlayerController(P.Controller).PlayerCamera.AttachComponent(Light);
				}

				//Light.SetTranslation(vect(0, -100, -50));
			}
			else
			{
				AttachFlashlightComponent(P.Mesh, Light);
				//Light.SetTranslation(vect(0, 0, 0));
			}
		}

		if ( LightConeMeshComp != None )
		{
			LightConeMeshComp.SetHidden(!bEnabled || bFirstPerson);
		}
	}

	if ( AttachmentMeshComp != None )
	{
		AttachmentMeshComp.SetHidden(bFirstPerson);
	}
}

/** Set the lighting channels on all the appropriate pawn meshes */
simulated function SetLightingChannels(const out LightingChannelContainer NewLightingChannels)
{
	if ( AttachmentMeshComp != None )
	{
		AttachmentMeshComp.SetLightingChannels(NewLightingChannels);
	}
}

defaultproperties
{
   Begin Object Class=SpotLightComponent Name=FlashLightTemplate_0
      InnerConeAngle=20.000000
      OuterConeAngle=30.000000
      Radius=3000.000000
      Brightness=2.000000
      Begin Object Class=LightFunction Name=FlashLightFunction_0
         SourceMaterial=Material'FX_Mat_Lib.VFX_Flashlight_PM'
         Name="FlashLightFunction_0"
         ObjectArchetype=LightFunction'Engine.Default__LightFunction'
      End Object
      Function=LightFunction'KFGame.Default__KFFlashlightAttachment:FlashLightFunction_0'
      bEnabled=False
      CastStaticShadows=False
      ForceCastDynamicShadows=True
      bUpdateOwnerRenderTime=True
      LightingChannels=(Outdoor=True)
      Name="FlashLightTemplate_0"
      ObjectArchetype=SpotLightComponent'Engine.Default__SpotLightComponent'
   End Object
   LightTemplate=FlashLightTemplate_0
   Begin Object Class=StaticMeshComponent Name=LightConeComp_0
      ReplacementPrimitive=None
      CastShadow=False
      Name="LightConeComp_0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   LightConeMeshComp=LightConeComp_0
   FlashlightSocketName="FlashLight"
   Name="Default__KFFlashlightAttachment"
   ObjectArchetype=Object'Core.Default__Object'
}
