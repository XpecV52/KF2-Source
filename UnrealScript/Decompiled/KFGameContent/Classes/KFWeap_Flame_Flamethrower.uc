/*******************************************************************************
 * KFWeap_Flame_Flamethrower generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Flame_Flamethrower extends KFWeap_FlameBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** Effect for the pilot light. */
var() protected export editinline KFParticleSystemComponent PSC_SpineLights[4];
/** Socket to attach the pilot light to. */
var() name SpineLightSocketNames[4];

protected simulated function TurnOnPilot()
{
    local int I;
    local float OwnerMeshFOV;

    if(bPilotLightOn)
    {
        return;
    }
    OwnerMeshFOV = MySkelMesh.FOV;
    I = 0;
    J0x42:

    if(I < 4)
    {
        if(PSC_SpineLights[I] != none)
        {
            MySkelMesh.AttachComponentToSocket(PSC_SpineLights[I], SpineLightSocketNames[I]);
            PSC_SpineLights[I].ActivateSystem();
            PSC_SpineLights[I].SetFloatParameter('Pilotlow', 1);
            PSC_SpineLights[I].SetFloatParameter('Pilothigh', 0);
            PSC_SpineLights[I].SetFOV(OwnerMeshFOV);
        }
        ++ I;
        goto J0x42;
    }
    super.TurnOnPilot();
}

protected simulated function TurnOffPilot()
{
    local int I;

    super.TurnOffPilot();
    I = 0;
    J0x15:

    if(I < 4)
    {
        if(PSC_SpineLights[I] != none)
        {
            PSC_SpineLights[I].DeactivateSystem();
        }
        ++ I;
        goto J0x15;
    }
}

protected simulated function TurnOnFireSpray()
{
    local int I;

    if(!bFireSpraying)
    {
        I = 0;
        J0x1A:

        if(I < 4)
        {
            if(PSC_SpineLights[I] != none)
            {
                PSC_SpineLights[I].SetFloatParameter('Pilotlow', 0);
                PSC_SpineLights[I].SetFloatParameter('Pilothigh', 1);
            }
            ++ I;
            goto J0x1A;
        }
    }
    super.TurnOnFireSpray();
}

protected simulated function TurnOffFireSpray()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < 4)
    {
        if(PSC_SpineLights[I] != none)
        {
            PSC_SpineLights[I].SetFloatParameter('Pilotlow', 1);
            PSC_SpineLights[I].SetFloatParameter('Pilothigh', 0);
        }
        ++ I;
        goto J0x0B;
    }
    super.TurnOffFireSpray();
}

simulated event SetFOV(float NewFOV)
{
    local int I;

    super.SetFOV(NewFOV);
    if(MySkelMesh != none)
    {
        I = 0;
        J0x2D:

        if(I < 4)
        {
            if(PSC_SpineLights[I] != none)
            {
                PSC_SpineLights[I].super(KFParticleSystemComponent).SetFOV(MySkelMesh.FOV);
            }
            ++ I;
            goto J0x2D;
        }
    }
}

defaultproperties
{
    begin object na[0]me=SpineLight0 class=KFParticleSystemComponent
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        TickGroup=ETickingGroup.TG_PostUpdateWork
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Flame_Flamethrower.SpineLight0'
    PSC_SpineLights=SpineLight0
    begin object name=SpineLight1 class=KFParticleSystemComponent
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        TickGroup=ETickingGroup.TG_PostUpdateWork
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Flame_Flamethrower.SpineLight1'
    PSC_SpineLights=SpineLight1
    begin object name=SpineLight2 class=KFParticleSystemComponent
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        TickGroup=ETickingGroup.TG_PostUpdateWork
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Flame_Flamethrower.SpineLight2'
    PSC_SpineLights=SpineLight2
    begin object name=SpineLight3 class=KFParticleSystemComponent
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        TickGroup=ETickingGroup.TG_PostUpdateWork
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Flame_Flamethrower.SpineLight3'
    PSC_SpineLights=SpineLight3
    SpineLightSocketNames[0]=FXPilot2
    SpineLightSocketNames[1]=FXPilot3
    SpineLightSocketNames[2]=FXPilot4
    SpineLightSocketNames[3]=FXPilot5
    bWarnAIWhenFiring=true
    FlameSprayArchetype=SprayActor_Flame'WEP_Flamethrower_ARCH.WEP_Flamethrower_Flame'
    PilotLightPlayEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_PilotLight_Loop'
    PilotLightStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_PilotLight_Loop'
    begin object name=PilotLight0 class=KFParticleSystemComponent
        Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
        ReplacementPrimitive=none
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Flame_Flamethrower.PilotLight0'
    PSC_PilotLight=PilotLight0
    PilotLightSocketName=FXPilot1
    PilotLights=/* Array type was not detected. */
    begin object name=FlameEndSpray0 class=KFParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Flame_Flamethrower.FlameEndSpray0'
    PSC_EndSpray=FlameEndSpray0
    MinAmmoConsumed=4
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=8
    MagazineCapacity=100
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshIronSightFOV=52
    PlayerIronSightFOV=80
    IronSightPosition=(X=3,Y=6,Z=-1)
    DOF_FG_FocalRadius=150
    DOF_FG_MaxNearBlurSize=1
    GroupPriority=75
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Flamethrower'
    SpareAmmoCapacity=500
    InitialSpareMags=1
    AmmoPickupScale=0.4
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    FireLoopSightedAnim=ShootLoop
    FireLoopStartSightedAnim=ShootLoop_Start
    FireLoopEndSightedAnim=ShootLoop_End
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=3,Y=9,Z=-3)
    AttachmentArchetype=KFWeapAttach_Flamethrower'WEP_Flamethrower_ARCH.Wep_Flamethrower_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Flame_Flamethrower.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Flamethrower_ARCH.Wep_Flamethrower_MuzzleFlash'
    maxRecoilPitch=150
    minRecoilPitch=115
    maxRecoilYaw=115
    minRecoilYaw=-115
    RecoilRate=0.085
    RecoilViewRotationScale=0.25
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    HippedRecoilModifier=1.5
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Flamethrower_MESH.Wep_1stP_Flamethrower_Rig'
        AnimSets(0)=AnimSet'wep_1p_flamethrower_anim.Wep_1stP_Flamethrower_anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Flame_Flamethrower.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Flamethrower"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_FlameThrower_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Flame_Flamethrower.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_FlameThrower_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Flame_Flamethrower.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}