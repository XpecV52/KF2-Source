//=============================================================================
// KFWeap_Flame_Flamethrower
//=============================================================================
// The "Incinerator" flamethrower
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Flame_Flamethrower extends KFWeap_FlameBase;

/** Effect for the pilot light. */
var() protected KFParticleSystemComponent	PSC_SpineLights[4];
/** Socket to attach the pilot light to. */
var() name SpineLightSocketNames[4];

simulated protected function TurnOnPilot()
{
    local int i;
    local float OwnerMeshFOV;

	if (bPilotLightOn)
		return;

    OwnerMeshFOV = MySkelMesh.FOV;

    // Attach and start up the pilot light
    for (i = 0; i < 4; i++)
    {
    	if( PSC_SpineLights[i] != None )
    	{
    		MySkelMesh.AttachComponentToSocket( PSC_SpineLights[i], SpineLightSocketNames[i] );

    		PSC_SpineLights[i].ActivateSystem();

    		// Turn on the low flame, turn off the high flame
    		PSC_SpineLights[i].SetFloatParameter('Pilotlow', 1.0);
    		PSC_SpineLights[i].SetFloatParameter('Pilothigh', 0.0);
    		PSC_SpineLights[i].SetFOV(OwnerMeshFOV);
    	}
	}

    super.TurnOnPilot();
}

simulated protected function TurnOffPilot()
{
    local int i;

    Super.TurnOffPilot();

    for (i = 0; i < 4; i++)
    {
    	if( PSC_SpineLights[i] != None )
    	{
    		PSC_SpineLights[i].DeActivateSystem();
    	}
	}
}

simulated protected function TurnOnFireSpray()
{
    local int i;

	if (!bFireSpraying)
	{
        // Attach and start up the pilot light
        for (i = 0; i < 4; i++)
        {
        	if( PSC_SpineLights[i] != None )
        	{
        		// Turn off the low flame, turn on the high flame
        		PSC_SpineLights[i].SetFloatParameter('Pilotlow', 0.0);
        		PSC_SpineLights[i].SetFloatParameter('Pilothigh', 1.0);
        	}
    	}
	}

	Super.TurnOnFireSpray();
}

simulated protected function TurnOffFireSpray()
{
    local int i;

    for (i = 0; i < 4; i++)
    {
    	if( PSC_SpineLights[i] != None )
    	{
    		// Turn on the low flame, turn off the high flame
    		PSC_SpineLights[i].SetFloatParameter('Pilotlow', 1.0);
    		PSC_SpineLights[i].SetFloatParameter('Pilothigh', 0.0);
    	}
	}

	Super.TurnOffFireSpray();
}

/**
 * Adjust the FOV for the first person weapon and arms.
 */
simulated event SetFOV( float NewFOV )
{
    local int i;

    Super.SetFOV(NewFOV);

    // Set the light emitter to the same FOV as the weapon mesh
    if( MySkelMesh != none )
    {
        for (i = 0; i < 4; i++)
        {
        	if( PSC_SpineLights[i] != None )
        	{
        		PSC_SpineLights[i].SetFOV(MySkelMesh.FOV);
        	}
    	}
	}
}

defaultproperties
{
    FlameSprayArchetype=SprayActor_Flame'WEP_Flamethrower_ARCH.WEP_Flamethrower_Flame'

	Begin Object Name=PilotLight0
		Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
	End Object

	PilotLightSocketName=FXPilot1

	Begin Object Class=KFParticleSystemComponent Name=SpineLight0
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        DepthPriorityGroup=SDPG_Foreground
		bAutoActivate=TRUE
		TickGroup=TG_PostUpdateWork
	End Object
	PSC_SpineLights(0)=SpineLight0

	Begin Object Class=KFParticleSystemComponent Name=SpineLight1
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        DepthPriorityGroup=SDPG_Foreground
		bAutoActivate=TRUE
		TickGroup=TG_PostUpdateWork
	End Object
	PSC_SpineLights(1)=SpineLight1

	Begin Object Class=KFParticleSystemComponent Name=SpineLight2
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        DepthPriorityGroup=SDPG_Foreground
		bAutoActivate=TRUE
		TickGroup=TG_PostUpdateWork
	End Object
	PSC_SpineLights(2)=SpineLight2

	Begin Object Class=KFParticleSystemComponent Name=SpineLight3
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        DepthPriorityGroup=SDPG_Foreground
		bAutoActivate=TRUE
		TickGroup=TG_PostUpdateWork
	End Object
	PSC_SpineLights(3)=SpineLight3

    SpineLightSocketNames(0)=FXPilot2
    SpineLightSocketNames(1)=FXPilot3
    SpineLightSocketNames(2)=FXPilot4
    SpineLightSocketNames(3)=FXPilot5

	PilotLightPlayEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_PilotLight_Loop'
	PilotLightStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_PilotLight_Loop'

	// Muzzle Flash point light
	// want this light to illuminate characters only, so Marcus gets the glow
    Begin Object Class=PointLightComponent Name=PilotPointLight0
		LightColor=(R=250,G=150,B=85,A=255)
		Brightness=0.25f
		FalloffExponent=4.f
		Radius=128.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=TRUE
		bCastPerObjectShadows=false
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

    Begin Object Class=PointLightComponent Name=PilotPointLight1
		LightColor=(R=250,G=150,B=85,A=255)
		Brightness=3.f
		FalloffExponent=8.f
		Radius=32.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=TRUE
		bCastPerObjectShadows=false
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	PilotLights(0)=(Light=PilotPointLight0,FlickerIntensity=1.5f,FlickerInterpSpeed=0.5f,LightAttachBone=FXPilot1)
	PilotLights(1)=(Light=PilotPointLight1,FlickerIntensity=4.f,FlickerInterpSpeed=3.f,LightAttachBone=FXPilot3)

	// Shooting Animations
	FireSightedAnims[0]=Shoot
	FireLoopSightedAnim=ShootLoop

	// Advanced Looping (High RPM) Fire Effects
	FireLoopStartSightedAnim=ShootLoop_Start
	FireLoopEndSightedAnim=ShootLoop_End

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=80

	// Depth of field
	DOF_FG_FocalRadius=150
	DOF_FG_MaxNearBlurSize=1

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_Flamethrower_MESH.Wep_1stP_Flamethrower_Rig'
		AnimSets(0)=AnimSet'wep_1p_flamethrower_anim.Wep_1stP_Flamethrower_anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_FlameThrower_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_Flamethrower_ARCH.Wep_Flamethrower_3P'

   	// Zooming/Position
	PlayerViewOffset=(X=3.0,Y=9,Z=-3)
	IronSightPosition=(X=3,Y=6,Z=-1)

	// Ammo
	MagazineCapacity[0]=100
	SpareAmmoCapacity[0]=500
	InitialSpareMags[0]=1
	AmmoPickupScale[0]=0.4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=150
	minRecoilPitch=115
	maxRecoilYaw=115
	minRecoilYaw=-115
	RecoilRate=0.085
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
	InventorySize=8
	GroupPriority=75
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Flamethrower'

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


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Flamethrower'
	InstantHitDamage(BASH_FIREMODE)=28

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_Flamethrower_ARCH.Wep_Flamethrower_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_1P_Loop')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_3P_LoopEnd', FirstPersonCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_1P_LoopEnd')

	//@todo: add akevents when we have them
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	SingleFireSoundIndex=FIREMODE_NONE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

 	// AI Warning
 	bWarnAIWhenFiring=true

   	AssociatedPerkClasses(0)=class'KFPerk_Firebug'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
}