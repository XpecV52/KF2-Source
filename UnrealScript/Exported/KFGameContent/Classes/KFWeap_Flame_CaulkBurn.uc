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
   Begin Object Class=KFParticleSystemComponent Name=PilotLight1
      Template=ParticleSystem'WEP_CaulkBurn_EMIT.FX_CaulkBurn_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="PilotLight1"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_PilotLight2=PilotLight1
   PilotLight2SocketName="FXPilot2"
   bWarnAIWhenFiring=True
   FlameSprayArchetype=SprayActor_Flame'WEP_CaulkBurn_ARCH.WEP_CaulkBurn_Flame'
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
      Template=ParticleSystem'WEP_CaulkBurn_EMIT.FX_CaulkBurn_pilot_light_01'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   PilotLightSocketName="FXPilot1"
   PilotLights(0)=(Light=PilotPointLight0,LightAttachBone="FXPilot1",FlickerIntensity=1.500000,FlickerInterpSpeed=0.500000)
   PilotLights(1)=(Light=PilotPointLight1,LightAttachBone="FXPilot2",FlickerIntensity=1.500000,FlickerInterpSpeed=0.500000)
   Begin Object Class=KFParticleSystemComponent Name=FlameEndSpray0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   MinAmmoConsumed=4
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Flamethrower'
   FireModeIconPaths(1)=()
   InventorySize=5
   MagazineCapacity(0)=50
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   PlayerIronSightFOV=80.000000
   IronSightPosition=(X=-3.000000,Y=7.000000,Z=-2.000000)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=2.000000
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'WEP_UI_CaulkBurn_TEX.UI_WeaponSelect_CaulkNBurn'
   SpareAmmoCapacity(0)=500
   InitialSpareMags(0)=5
   AmmoPickupScale(0)=0.500000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(0)="Shoot"
   FireLoopSightedAnim="ShootLoop"
   FireLoopStartSightedAnim="ShootLoop_Start"
   FireLoopEndSightedAnim="ShootLoop_End"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_1P_Loop')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_3P_LoopEnd',FirstPersonCue=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Fire_1P_LoopEnd')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_CaulkBurn.Play_SA_CaulkBurn_Handling_DryFire'
   PlayerViewOffset=(X=4.000000,Y=10.000000,Z=-4.000000)
   AttachmentArchetype=KFWeapAttach_Flamethrower'WEP_CaulkBurn_ARCH.Wep_Caulkburn_B_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Flame_CaulkBurn:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_CaulkBurn_ARCH.Wep_CaulkBurn_MuzzleFlash'
   maxRecoilPitch=100
   minRecoilPitch=75
   maxRecoilYaw=75
   minRecoilYaw=-75
   RecoilRate=0.065000
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
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_CaulkBurn'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_FlameBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_CaulkBurn_MESH.Wep_1stP_CaulkBurn_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_CaulkBurn_ANIM.Wep_1stP_CaulkBurn_Anim'
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
   ItemName="Caulk n' Burn"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_CaulkBurn_MESH.Wep_CaulkBurn_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Flame_CaulkBurn"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
