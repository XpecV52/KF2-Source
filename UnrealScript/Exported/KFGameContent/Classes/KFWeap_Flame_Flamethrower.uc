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
   Begin Object Class=KFParticleSystemComponent Name=SpineLight0
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="SpineLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(0)=SpineLight0
   Begin Object Class=KFParticleSystemComponent Name=SpineLight1
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="SpineLight1"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(1)=SpineLight1
   Begin Object Class=KFParticleSystemComponent Name=SpineLight2
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="SpineLight2"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(2)=SpineLight2
   Begin Object Class=KFParticleSystemComponent Name=SpineLight3
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="SpineLight3"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(3)=SpineLight3
   SpineLightSocketNames(0)="FXPilot2"
   SpineLightSocketNames(1)="FXPilot3"
   SpineLightSocketNames(2)="FXPilot4"
   SpineLightSocketNames(3)="FXPilot5"
   bWarnAIWhenFiring=True
   FlameSprayArchetype=SprayActor_Flame'WEP_Flamethrower_ARCH.WEP_Flamethrower_Flame'
   PilotLightPlayEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_PilotLight_Loop'
   PilotLightStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_PilotLight_Loop'
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   PilotLightSocketName="FXPilot1"
   PilotLights(0)=(Light=PilotPointLight0,LightAttachBone="FXPilot1",FlickerIntensity=1.500000,FlickerInterpSpeed=0.500000)
   PilotLights(1)=(Light=PilotPointLight1,LightAttachBone="FXPilot3",FlickerIntensity=4.000000,FlickerInterpSpeed=3.000000)
   Begin Object Class=KFParticleSystemComponent Name=FlameEndSpray0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   MinAmmoConsumed=4
   PackageKey="Flamethrower"
   FirstPersonMeshName="WEP_1P_Flamethrower_MESH.Wep_1stP_Flamethrower_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_flamethrower_anim.Wep_1stP_Flamethrower_anim"
   PickupMeshName="WEP_3P_Flamethrower_MESH.Wep_FlameThrower_Pickup"
   AttachmentArchetypeName="WEP_Flamethrower_ARCH.Wep_Flamethrower_3P"
   MuzzleFlashTemplateName="WEP_Flamethrower_ARCH.Wep_Flamethrower_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Flamethrower'
   FireModeIconPaths(1)=()
   InventorySize=7
   MagazineCapacity(0)=100
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=80.000000
   IronSightPosition=(X=3.000000,Y=6.000000,Z=-1.000000)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Flamethrower'
   SpareAmmoCapacity(0)=500
   InitialSpareMags(0)=1
   AmmoPickupScale(0)=0.400000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(0)="Shoot"
   FireLoopSightedAnim="ShootLoop"
   FireLoopStartSightedAnim="ShootLoop_Start"
   FireLoopEndSightedAnim="ShootLoop_End"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_1P_Loop')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_3P_LoopEnd',FirstPersonCue=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Fire_1P_LoopEnd')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
   PlayerViewOffset=(X=3.000000,Y=9.000000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Flame_Flamethrower:MeleeHelper_0'
   maxRecoilPitch=150
   minRecoilPitch=115
   maxRecoilYaw=115
   minRecoilYaw=-115
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Firebug'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Add=2)))
   FiringStatesArray(0)="SprayingFire"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   FireInterval(0)=0.070000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(3)=28.000000
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Flamethrower'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Flamethrower"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Flame_Flamethrower"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
