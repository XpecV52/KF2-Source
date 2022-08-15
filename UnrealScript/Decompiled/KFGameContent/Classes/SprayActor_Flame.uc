/*******************************************************************************
 * SprayActor_Flame generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SprayActor_Flame extends KFSprayActor
    config(Game)
    hidecategories(Navigation,Object,Movement,Display,Attachment,Collision,Physics,Advanced,Debug,Mobile);

var export editinline transient array<export editinline KFParticleSystemComponent> BoneChainComponents;
var export editinline transient array<export editinline KFParticleSystemComponent> BoneChainComponents_1stP;
/** Firebug Perk can modify the flame length, we need an alternative anim for that */
var(SprayMesh) AnimSet AltSprayAnimSet;

event PreBeginPlay()
{
    super.PreBeginPlay();
    SetBoneChainComponents();
}

simulated function SetBoneChainComponents()
{
    local int Idx;

    Idx = 0;
    J0x0B:

    if(Idx < BoneChain.Length)
    {
        if(Idx < BoneChainComponents.Length)
        {
            BoneChain[Idx].BonePSC0 = BoneChainComponents[Idx];
        }
        if(Idx < BoneChainComponents_1stP.Length)
        {
            BoneChain[Idx].BonePSC1 = BoneChainComponents_1stP[Idx];
        }
        ++ Idx;
        goto J0x0B;
    }
}

simulated event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    if((!bDetached && OwningKFPawn != none) && WorldInfo.NetMode != NM_DedicatedServer)
    {
        OwningKFPawn.SetWeaponComponentRTPCValue("FlamethrowerRotation", RotationSpeed);
    }
}

simulated function BeginSpray()
{
    local KFPerk InstigatorPerk;

    super.BeginSpray();
    if(OwningKFPawn != none)
    {
        InstigatorPerk = OwningKFPawn.GetPerk();
        if(InstigatorPerk != none)
        {
            SplashDamage = default.SplashDamage * InstigatorPerk.GetSplashDamageModifier();
        }
        SetSprayLength();
    }
}

simulated function SetSprayLength()
{
    local AnimSet TempAnimSet;
    local KFPlayerReplicationInfo OwningPawnPRI;

    if(default.AltSprayAnimSet == none)
    {
        return;
    }
    OwningPawnPRI = KFPlayerReplicationInfo(OwningKFPawn.PlayerReplicationInfo);
    if(OwningPawnPRI != none)
    {
        TempAnimSet = ((OwningPawnPRI.bExtraFireRange) ? default.AltSprayAnimSet : default.SprayAnimSet);
    }
    if((TempAnimSet == none) || TempAnimSet == SkeletalSprayMesh.AnimSets[0])
    {
        return;
    }
    SkeletalSprayMesh.AnimSets[0] = TempAnimSet;
    SkeletalSprayMesh.UpdateAnimations();
    SetupFX();
}

defaultproperties
{
    begin object name=Bone01_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone01_PSC0'
    BoneChainComponents(0)=Bone01_PSC0
    begin object name=Bone01_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone01_PSC0'
    BoneChainComponents(1)=Bone01_PSC0
    begin object name=Bone02_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone02_PSC0'
    BoneChainComponents(2)=Bone02_PSC0
    begin object name=Bone03_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone03_PSC0'
    BoneChainComponents(3)=Bone03_PSC0
    begin object name=Bone04_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone04_PSC0'
    BoneChainComponents(4)=Bone04_PSC0
    begin object name=Bone05_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone05_PSC0'
    BoneChainComponents(5)=Bone05_PSC0
    begin object name=Bone06_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone06_PSC0'
    BoneChainComponents(6)=Bone06_PSC0
    begin object name=Bone07_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone07_PSC0'
    BoneChainComponents(7)=Bone07_PSC0
    begin object name=Bone08_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone08_PSC0'
    BoneChainComponents(8)=Bone08_PSC0
    begin object name=Bone09_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone09_PSC0'
    BoneChainComponents(9)=Bone09_PSC0
    begin object name=Bone10_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone10_PSC0'
    BoneChainComponents(10)=Bone10_PSC0
    begin object name=Bone11_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone11_PSC0'
    BoneChainComponents(11)=Bone11_PSC0
    begin object name=Bone12_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone12_PSC0'
    BoneChainComponents(12)=Bone12_PSC0
    begin object name=Bone13_PSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOwnerNoSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone13_PSC0'
    BoneChainComponents(13)=Bone13_PSC0
    begin object name=Bone01_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone01_PSC1'
    BoneChainComponents_1stP(0)=Bone01_PSC1
    begin object name=Bone01_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone01_PSC1'
    BoneChainComponents_1stP(1)=Bone01_PSC1
    begin object name=Bone02_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone02_PSC1'
    BoneChainComponents_1stP(2)=Bone02_PSC1
    begin object name=Bone03_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
        Rotation=(Pitch=0,Yaw=32768,Roll=0)
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone03_PSC1'
    BoneChainComponents_1stP(3)=Bone03_PSC1
    begin object name=Bone04_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone04_PSC1'
    BoneChainComponents_1stP(4)=Bone04_PSC1
    begin object name=Bone05_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone05_PSC1'
    BoneChainComponents_1stP(5)=Bone05_PSC1
    begin object name=Bone06_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone06_PSC1'
    BoneChainComponents_1stP(6)=Bone06_PSC1
    begin object name=Bone07_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone07_PSC1'
    BoneChainComponents_1stP(7)=Bone07_PSC1
    begin object name=Bone08_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone08_PSC1'
    BoneChainComponents_1stP(8)=Bone08_PSC1
    begin object name=Bone09_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone09_PSC1'
    BoneChainComponents_1stP(9)=Bone09_PSC1
    begin object name=Bone10_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone10_PSC1'
    BoneChainComponents_1stP(10)=Bone10_PSC1
    begin object name=Bone11_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone11_PSC1'
    BoneChainComponents_1stP(11)=Bone11_PSC1
    begin object name=Bone12_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone12_PSC1'
    BoneChainComponents_1stP(12)=Bone12_PSC1
    begin object name=Bone13_PSC1 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        bOnlyOwnerSee=true
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.Bone13_PSC1'
    BoneChainComponents_1stP(13)=Bone13_PSC1
    AltSprayAnimSet=AnimSet'FX_Flamethrower_ANIM.Wep_Caulk_Flame_Anim'
    SkelMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
    SprayAnimSet=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
    SprayAnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
    begin object name=FlameCore0 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
        AnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
        AnimSets(0)=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
        bOverrideAttachmentOwnerVisibility=true
        ReplacementPrimitive=none
        CastShadow=false
        CollideActors=true
        BlockZeroExtent=true
        BlockNonZeroExtent=true
        Rotation=(Pitch=0,Yaw=0,Roll=-16384)
    object end
    // Reference: KFSkeletalMeshComponent'Default__SprayActor_Flame.FlameCore0'
    SkeletalSprayMesh=FlameCore0
    bDoPerBoneSprayFX=true
    bDoCollideComplex=true
    bUseExtentTracing=true
    SpraySocketName=MuzzleFlash
    GravityScaleRange=(X=0,Y=-15)
    GravityScaleInTime=0.5
    BoneChain=/* Array type was not detected. */
    PerBoneSprayFXGlobalScale=1
    SplashGlancingEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_flame_deflect_01'
    SplashDirectEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_Flame_impact_01'
    SplashPawnEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_Flame_impact_player_01'
    ImpactEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.Flame_Impacts'
    begin object name=SplashGlancingPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashGlancingPSC0'
    SplashGlancingPSC=SplashGlancingPSC0
    begin object name=SplashDirectPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashDirectPSC0'
    SplashDirectPSC=SplashDirectPSC0
    begin object name=SplashPawnPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashPawnPSC0'
    SplashPawnPSC=SplashPawnPSC0
    begin object name=SplashMaterialBasedPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashMaterialBasedPSC0'
    SplashMaterialBasedPSC=SplashMaterialBasedPSC0
    SplashPawnAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Impact_Flesh'
    SplashDirectAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Impact_Default'
    SplashGlancingAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Impact_Default'
    SplashPawnStopAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Impact_Flesh_Loop'
    SplashDirectStopAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Impact_Default_Loop'
    SplashGlancingStopAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Impact_Default_Loop'
    begin object name=CurrentSplashAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.2
    object end
    // Reference: AkComponent'Default__SprayActor_Flame.CurrentSplashAkSoundComponent'
    CurrentSplashAKC=CurrentSplashAkSoundComponent
    SplashGlancingDotLimit=-0.9
    LastBoneChainIndexThatCanSpawnSplashEffects=11
    ImpactProjectileInterval=0.1
    ImpactProjectileClass=Class'KFProj_GroundFire'
    SplashRotInterpSpeed=8
    SplashLocInterpSpeed=40
    SprayLights=/* Array type was not detected. */
    MaterialHeatRange=(X=0,Y=0.8)
    MaterialHeatRampTime=0.65
    MatFadePow=2
    MaterialFadeOutTime=0.2
    MaterialCurrentFadeVal=1
    SprayStartEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_Start_muzzleflash'
    begin object name=StartFirePSC0 class=KFParticleSystemComponent
        ReplacementPrimitive=none
        TickGroup=ETickingGroup.TG_PostUpdateWork
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.StartFirePSC0'
    SprayStartPSC=StartFirePSC0
    SprayEndEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_End_muzzleflash_01'
    SprayDamage=(X=10,Y=10)
    MyDamageType=Class'KFGame.KFDT_Fire'
    SplashDamageRadius=300
    SplashDamage=10
    SplashDamageFalloffExponent=1
    MomentumScale=0.15
    SeedSprayVel=10000
    SeedDecel=28000
    VelocityScaleZ=0.3
    begin object name=FlameCore0 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
        AnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
        AnimSets(0)=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
        bOverrideAttachmentOwnerVisibility=true
        ReplacementPrimitive=none
        CastShadow=false
        CollideActors=true
        BlockZeroExtent=true
        BlockNonZeroExtent=true
        Rotation=(Pitch=0,Yaw=0,Roll=-16384)
    object end
    // Reference: KFSkeletalMeshComponent'Default__SprayActor_Flame.FlameCore0'
    Components(0)=FlameCore0
    begin object name=SplashGlancingPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashGlancingPSC0'
    Components(1)=SplashGlancingPSC0
    begin object name=SplashDirectPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashDirectPSC0'
    Components(2)=SplashDirectPSC0
    begin object name=SplashPawnPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashPawnPSC0'
    Components(3)=SplashPawnPSC0
    begin object name=SplashMaterialBasedPSC0 class=KFParticleSystemComponent
        bAutoActivate=false
        SecondsBeforeInactive=0
        ReplacementPrimitive=none
        TranslucencySortPriority=1
    object end
    // Reference: KFParticleSystemComponent'Default__SprayActor_Flame.SplashMaterialBasedPSC0'
    Components(4)=SplashMaterialBasedPSC0
    begin object name=CurrentSplashAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.2
    object end
    // Reference: AkComponent'Default__SprayActor_Flame.CurrentSplashAkSoundComponent'
    Components(5)=CurrentSplashAkSoundComponent
    Physics=EPhysics.PHYS_Interpolating
    CollisionType=ECollisionType.COLLIDE_TouchAll
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bCollideActors=true
    bNoEncroachCheck=true
    begin object name=FlameCore0 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
        AnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
        AnimSets(0)=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
        bOverrideAttachmentOwnerVisibility=true
        ReplacementPrimitive=none
        CastShadow=false
        CollideActors=true
        BlockZeroExtent=true
        BlockNonZeroExtent=true
        Rotation=(Pitch=0,Yaw=0,Roll=-16384)
    object end
    // Reference: KFSkeletalMeshComponent'Default__SprayActor_Flame.FlameCore0'
    CollisionComponent=FlameCore0
}