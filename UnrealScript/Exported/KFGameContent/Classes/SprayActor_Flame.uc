//=============================================================================
// SprayActor_Flame
//=============================================================================
// Base class for flame spray actors with reasonable defaults
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson and Jess Crable
//=============================================================================
class SprayActor_Flame extends KFSprayActor
    hidecategories(Object, Movement, Display, Attachment, Collision, Physics, Advanced, Debug, Mobile)
	placeable;

/** Transient PSCs to workaround issue with setting the BonePSC in an archetype */
var transient array<KFParticleSystemComponent> BoneChainComponents;
var transient array<KFParticleSystemComponent> BoneChainComponents_1stP;

/** Firebug Perk can modify the flame length, we need an alternative anim for that */
var(SprayMesh) AnimSet 	AltSprayAnimSet;

event PreBeginPlay()
{
	super.PreBeginPlay();
	SetBoneChainComponents();
}

/**
 * Set (or create) PSC's for the BoneChain.  Use this when creating an archetype template spray
 * effect to workaround an issue where assigning a transient default BoneChain PSC doesn't work.
 */
simulated function SetBoneChainComponents()
{
	local int Idx;

	for (Idx = 0; Idx < BoneChain.length; ++Idx)
	{
		if ( Idx < BoneChainComponents.Length )
		{
			BoneChain[Idx].BonePSC0 = BoneChainComponents[Idx];
		}
		if ( Idx < BoneChainComponents_1stP.Length )
		{
			BoneChain[Idx].BonePSC1 = BoneChainComponents_1stP[Idx];
		}
	}
}

/**
 * Overridden to handle the rotation sound pitching for the flamethrower sound
 */
simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

    // Set the rotation speed for the flamethrower sound
	if( !bDetached && OwningKFPawn != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
        OwningKFPawn.SetWeaponComponentRTPCValue( "FlamethrowerRotation", RotationSpeed);
	}
}

simulated function BeginSpray()
{
	local KFPerk InstigatorPerk;

	super.BeginSpray();

	if( OwningKFPawn != none )
	{
		InstigatorPerk = OwningKFPawn.GetPerk();
		if( InstigatorPerk != none )
		{
			SplashDamage = default.SplashDamage * InstigatorPerk.GetSplashDamageModifier();
		}

		SetSprayLength();
	}
}

/**
 * @brief Changes the flame's length if the Firebug's Range skill is selected
 * 
 * @param InstigatorPerk Instigator's current perk
 */
simulated function SetSprayLength()
{
	local AnimSet TempAnimSet;
	local KFPlayerReplicationInfo OwningPawnPRI;

	if ( default.AltSprayAnimSet == None )
	{
		return; // only once length available
	}

	// Firebug range skill can affect the flame weapons range
	OwningPawnPRI = KFPlayerReplicationInfo(OwningKFPawn.PlayerReplicationInfo);
	if( OwningPawnPRI != none )
	{
		TempAnimSet = OwningPawnPRI.bExtraFireRange ? default.AltSprayAnimSet : default.SprayAnimSet;
	}
	
	// Don't set the anim set to nothing if the archetype is screwed up
	// Don't set the anim set and tree if they do not need to be changed
	if( TempAnimSet == none || TempAnimSet == SkeletalSprayMesh.AnimSets[0] )	
	{
		return;
	}

	SkeletalSprayMesh.AnimSets[0] = TempAnimSet;
	SkeletalSprayMesh.UpdateAnimations();
	SetupFX();	
}

defaultproperties
{
   AltSprayAnimSet=AnimSet'FX_Flamethrower_ANIM.Wep_Caulk_Flame_Anim'
   SkelMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
   SprayAnimSet=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
   SprayAnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
   bDoPerBoneSprayFX=True
   bDoCollideComplex=True
   bUseExtentTracing=True
   SpraySocketName="MuzzleFlash"
   GravityScaleRange=(X=0.000000,Y=-15.000000)
   GravityScaleInTime=0.500000
   BoneChain(0)=(BoneName="Bone01",BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_Initial_spawn_01_1P')
   BoneChain(1)=(BoneName="Bone02",MaterialParam=0.040000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_Initial_spawn_01_1P')
   BoneChain(2)=(BoneName="Bone03",MaterialParam=0.080000,BoneScale=1.000000,EffectScale=0.250000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_reverse_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_reverse_01_1P')
   BoneChain(3)=(BoneName="Bone04",MaterialParam=0.130000,BoneScale=1.000000,EffectScale=0.250000)
   BoneChain(4)=(BoneName="Bone05",MaterialParam=0.190000,BoneScale=1.000000,EffectScale=0.500000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(5)=(BoneName="Bone06",MaterialParam=0.240000,BoneScale=1.000000,EffectScale=0.500000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(6)=(BoneName="Bone07",MaterialParam=0.310000,BoneScale=1.000000,EffectScale=1.800000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(7)=(BoneName="Bone08",MaterialParam=0.370000,BoneScale=1.000000,EffectScale=0.500000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(8)=(BoneName="Bone09",MaterialParam=0.440000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(9)=(BoneName="Bone10",MaterialParam=0.500000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(10)=(BoneName="bone11",MaterialParam=0.560000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(11)=(BoneName="Bone12",MaterialParam=0.620000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(12)=(BoneName="Bone13",MaterialParam=0.690000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(13)=(BoneName="Bone14",MaterialParam=0.760000,BoneScale=1.000000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_End_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   BoneChain(14)=(BoneName="bone15",MaterialParam=0.820000,EffectScale=1.000000,ParticleSystemTemplate=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_End_01_3P',ParticleSystemTemplate1P=ParticleSystem'WEP_Flamethrower_EMIT.Materials.FX_Flamethrower_BSpawns_01_1P')
   PerBoneSprayFXGlobalScale=1.000000
   SplashGlancingEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_flame_deflect_01'
   SplashDirectEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_Flame_impact_01'
   SplashPawnEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_Flame_impact_player_01'
   ImpactEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.Flame_Impacts'
   SplashPawnAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Impact_Flesh'
   SplashDirectAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Impact_Default'
   SplashGlancingAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Impact_Default'
   SplashPawnStopAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Impact_Flesh_Loop'
   SplashDirectStopAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Impact_Default_Loop'
   SplashGlancingStopAKEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Impact_Default_Loop'
   Begin Object Class=AkComponent Name=CurrentSplashAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="CurrentSplashAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   CurrentSplashAKC=CurrentSplashAkSoundComponent
   SplashGlancingDotLimit=-0.900000
   LastBoneChainIndexThatCanSpawnSplashEffects=11
   ImpactProjectileInterval=0.100000
   ImpactProjectileClass=Class'KFGameContent.KFProj_GroundFire'
   SplashRotInterpSpeed=8.000000
   SplashLocInterpSpeed=40.000000
   SprayLights(0)=(Light=FlamePointLight0,BoneChainIndex=1,FlickerIntensity=5.000000,FlickerInterpSpeed=15.000000)
   SprayLights(1)=(Light=FlamePointLight2,BoneChainIndex=9,FlickerIntensity=5.000000,FlickerInterpSpeed=15.000000)
   MaterialHeatRange=(X=0.000000,Y=0.800000)
   MaterialHeatRampTime=0.650000
   MatFadePow=2.000000
   MaterialFadeOutTime=0.200000
   SprayStartEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_Start_muzzleflash'
   SprayEndEffect=ParticleSystem'WEP_Flamethrower_EMIT.FX_End_muzzleflash_01'
   SprayDamage=(X=10.000000,Y=10.000000)
   MyDamageType=Class'KFGame.KFDT_Fire'
   SplashDamageRadius=300.000000
   SplashDamage=10.000000
   SplashDamageFalloffExponent=1.000000
   MomentumScale=0.150000
   SeedSprayVel=10000.000000
   SeedDecel=28000.000000
   VelocityScaleZ=0.300000
   Begin Object Class=KFSkeletalMeshComponent Name=FlameCore0
      SkeletalMesh=SkeletalMesh'FX_Flamethrower_MESH.WEP_Flamethrower_Flame_A'
      AnimTreeTemplate=AnimTree'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_AT'
      AnimSets(0)=AnimSet'FX_Flamethrower_ANIM.WEP_Flamethrower_Flame_Anim'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      CastShadow=False
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      Rotation=(Pitch=0,Yaw=0,Roll=-16384)
      Name="FlameCore0"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   Components(0)=FlameCore0
   Begin Object Class=KFParticleSystemComponent Name=SplashGlancingPSC0
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashGlancingPSC0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   Components(1)=SplashGlancingPSC0
   Begin Object Class=KFParticleSystemComponent Name=SplashDirectPSC0
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashDirectPSC0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   Components(2)=SplashDirectPSC0
   Begin Object Class=KFParticleSystemComponent Name=SplashPawnPSC0
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashPawnPSC0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   Components(3)=SplashPawnPSC0
   Begin Object Class=KFParticleSystemComponent Name=SplashMaterialBasedPSC0
      bAutoActivate=False
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      TranslucencySortPriority=1
      Name="SplashMaterialBasedPSC0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   Components(4)=SplashMaterialBasedPSC0
   Components(5)=CurrentSplashAkSoundComponent
   Physics=PHYS_Interpolating
   CollisionType=COLLIDE_TouchAll
   TickGroup=TG_PostAsyncWork
   bCollideActors=True
   bNoEncroachCheck=True
   CollisionComponent=FlameCore0
   Name="Default__SprayActor_Flame"
   ObjectArchetype=KFSprayActor'KFGame.Default__KFSprayActor'
}
