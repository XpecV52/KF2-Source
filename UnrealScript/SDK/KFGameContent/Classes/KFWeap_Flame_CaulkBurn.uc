//=============================================================================
// KFWeap_Flame_CaulkBurn
//=============================================================================
// The "Incinerator" flamethrower
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Greg Felber
//=============================================================================

class KFWeap_Flame_CaulkBurn extends KFWeap_FlameBase;

/** Effect for the pilot light. */
var() protected KFParticleSystemComponent	PSC_PilotLight2;
/** Socket to attach the pilot light to. */
var() name PilotLight2SocketName;

simulated protected function TurnOnPilot()
{
    local float OwnerMeshFOV;

	if (bPilotLightOn)
		return;

    OwnerMeshFOV = MySkelMesh.FOV;

    // Attach and start up the pilot light
	if( PSC_PilotLight2 != None )
	{
		MySkelMesh.AttachComponentToSocket( PSC_PilotLight2, PilotLight2SocketName );

		PSC_PilotLight2.ActivateSystem();

		// Turn on the low flame, turn off the high flame
		PSC_PilotLight2.SetFloatParameter('Pilotlow', 1.0);
		PSC_PilotLight2.SetFloatParameter('Pilothigh', 0.0);

		PSC_PilotLight2.SetFOV(OwnerMeshFOV);
	}

    super.TurnOnPilot();
}

simulated protected function TurnOffPilot()
{

    Super.TurnOffPilot();

	if( PSC_PilotLight2 != None )
	{
		PSC_PilotLight2.DeActivateSystem();
	}
}

/**
 * Adjust the FOV for the first person weapon and arms.
 */
simulated event SetFOV( float NewFOV )
{
    Super.SetFOV(NewFOV);

    // Set the light emitter to the same FOV as the weapon mesh
    if( MySkelMesh != none )
    {
    	if( PSC_PilotLight2 != None )
    	{
    		PSC_PilotLight2.SetFOV(MySkelMesh.FOV);
    	}
	}
}


defaultproperties
{
    FlameSprayArchetype=SprayActor_Flame'WEP_CaulkBurn_ARCH.WEP_CaulkBurn_Flame'

	Begin Object Name=PilotLight0
		Template=ParticleSystem'WEP_CaulkBurn_EMIT.FX_CaulkBurn_pilot_light_01'
	End Object

	PilotLightSocketName=FXPilot1
	PilotLight2SocketName=FXPilot2

	// Pilot lights
    Begin Object Class=PointLightComponent Name=PilotPointLight0
		LightColor=(R=250,G=150,B=85,A=255)
		Brightness=0.125f
		FalloffExponent=4.f
		Radius=128.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=TRUE
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

    Begin Object Class=PointLightComponent Name=PilotPointLight1
		LightColor=(R=250,G=150,B=85,A=255)
		Brightness=0.125f
		FalloffExponent=4.f
		Radius=128.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=TRUE
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	PilotLights(0)=(Light=PilotPointLight0,FlickerIntensity=1.5f,FlickerInterpSpeed=0.5f,LightAttachBone=FXPilot1)
	PilotLights(1)=(Light=PilotPointLight1,FlickerIntensity=1.5f,FlickerInterpSpeed=0.5f,LightAttachBone=FXPilot2)

	Begin Object Class=KFParticleSystemComponent Name=PilotLight1
        Template=ParticleSystem'WEP_CaulkBurn_EMIT.FX_CaulkBurn_pilot_light_01'
        DepthPriorityGroup=SDPG_Foreground
		bAutoActivate=TRUE
		TickGroup=TG_PostUpdateWork
	End Object
	PSC_PilotLight2=PilotLight1

	// Shooting Animations
	FireSightedAnims[0]=Shoot
	FireLoopSightedAnim=ShootLoop

	// Advanced Looping (High RPM) Fire Effects
	FireLoopStartSightedAnim=ShootLoop_Start
	FireLoopEndSightedAnim=ShootLoop_End

    // FOV
	MeshIronSightFOV=75
    PlayerIronSightFOV=80

	// Depth of field
	DOF_FG_FocalRadius=150
	DOF_FG_MaxNearBlurSize=2

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_CaulkBurn_MESH.Wep_1stP_CaulkBurn_Rig'
		AnimSets(0)=AnimSet'WEP_1P_CaulkBurn_ANIM.Wep_1stP_CaulkBurn_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_CaulkBurn_MESH.Wep_CaulkBurn_Pickup'
	End Object

	AttachmentArchetype=KFWeapAttach_Flamethrower'WEP_CaulkBurn_ARCH.Wep_Caulkburn_B_3P'

   	// Zooming/Position
	PlayerViewOffset=(X=4.0,Y=10,Z=-4)
	IronSightPosition=(X=-3,Y=7,Z=-2)

	// Ammo
	MagazineCapacity[0]=50
	MaxSpareAmmo[0]=250
	InitialSpareMags[0]=3
	AmmoPickupScale[0]=0.5
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=100
	minRecoilPitch=75
	maxRecoilYaw=75
	minRecoilYaw=-75
	RecoilRate=0.065
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.5
    HippedRecoilModifier=1.5

    // Inventory
	InventorySize=6
	GroupPriority=25
	UITexture=Texture2D'WEP_UI_CaulkBurn_TEX.UI_WeaponSelect_CaulkNBurn'
	FilterTypeUI=FT_Flame

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Flamethrower'
	FiringStatesArray(DEFAULT_FIREMODE)=SprayingFire
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Custom
	FireInterval(DEFAULT_FIREMODE)=+0.07 // 850 RPM
	FireOffset=(X=30,Y=4.5,Z=-5)
	//MinFireDuration=0.25
	MinAmmoConsumed=4

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_CaulkBurn'

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_CaulkBurn_ARCH.Wep_CaulkBurn_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_1P_Loop')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_3P_LoopEnd', FirstPersonCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_1P_LoopEnd')

	//@todo: add akevents when we have them
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	SingleFireMode=FIREMODE_NONE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Trader
    EffectiveRange=15	

   	AssociatedPerkClass=class'KFPerk_Firebug'
}


