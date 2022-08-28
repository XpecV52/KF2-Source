//=============================================================================
// KFWeap_Beam_Microwave
//=============================================================================
// A gun that shoots microwave beams!!! TODO: Mostly placeholder
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Beam_Microwave extends KFWeap_FlameBase;

/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst	name	FireHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst	name	FireLastHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst	name	FireLastHeavySightedAnim;

/** Shoot animation to play when ending looping fire on last shot */
var(Animations) const editconst	name	FireLoopEndLastAnim;

/** Shoot animation to play when ending looping fire on last shot  when aiming*/
var(Animations) const editconst	name	FireLoopEndLastSightedAnim;

/** Alt-fire explosion template */
var() GameExplosion 		ExplosionTemplate;

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if ( bUsingSights )
	{
		if( bPlayFireLast )
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireLastHeavySightedAnim;
        	}
        	else
        	{
                return FireLastSightedAnim;
            }
        }
        else
        {
            return FireSightedAnims[FireModeNum];
        }

	}
	else
	{
		if( bPlayFireLast )
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireLastHeavyAnim;
        	}
        	else
        	{
                return FireLastAnim;
            }
        }
        else
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireHeavyAnim;
        	}
        	else
        	{
                return FireAnim;
            }
        }
	}
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopEndFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if ( bUsingSights )
	{
    	if( bPlayFireLast && FireLoopEndLastSightedAnim != '' )
        {
            return FireLoopEndLastSightedAnim;
        }
        else
        {
            return FireLoopEndSightedAnim;
        }
	}
	else
	{
    	if( bPlayFireLast && FireLoopEndLastAnim != '' )
        {
            return FireLoopEndLastAnim;
        }
        else
        {
            return FireLoopEndAnim;
        }
	}
}

/**
 * Instead of a toggle, just immediately fire alternate fire.
 */
simulated function AltFireMode()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/** Explosion Actor version */
simulated function CustomFire()
{
	local KFExplosionActorReplicated ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;
	local float ModifiedDamage, OriginalDamage, OriginalDamageRadius;

	// Alt-fire blast only (server authoritative)
	if ( CurrentFireMode != ALTFIRE_FIREMODE )
	{
		Super.CustomFire();
		return;
	}

	if ( Instigator.Role < ROLE_Authority )
	{
		return;
	}

	// This is where we would start an instant trace. (what CalcWeaponFire uses)
	SpawnLoc = Instigator.GetWeaponStartTraceLocation();
	SpawnRot = GetAdjustedAim( SpawnLoc );

	// explode using the given template
	ExploActor = Spawn(class'KFExplosionActorReplicated', self,, SpawnLoc, SpawnRot,, true);
	if (ExploActor != None)
	{
		ExploActor.InstigatorController = Instigator.Controller;
		ExploActor.Instigator = Instigator;

		// enable muzzle location sync
		ExploActor.bReplicateInstigator = true;
		ExploActor.bSyncParticlesToMuzzle = true;

		ModifiedDamage = static.GetUpgradeDamageMod(CurrentWeaponUpgradeIndex);

		OriginalDamage = ExplosionTemplate.Damage;
		OriginalDamageRadius = ExplosionTemplate.DamageRadius;

		ExplosionTemplate.Damage *= ModifiedDamage;
		ExplosionTemplate.DamageRadius *= ModifiedDamage;

		ExploActor.Explode(ExplosionTemplate, vector(SpawnRot));

		ExplosionTemplate.Damage = OriginalDamage;
		ExplosionTemplate.DamageRadius = OriginalDamageRadius;
	}

	if ( bDebug )
	{
		DrawDebugCone(SpawnLoc, vector(SpawnRot), ExplosionTemplate.DamageRadius, ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad,
			ExplosionTemplate.DirectionalExplosionAngleDeg * DegToRad, 16, MakeColor(64,64,255,0), TRUE);
	}
}

/** Disable auto-reload for alt-fire */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	local bool bRequestReload;

    bRequestReload = Super.ShouldAutoReload(FireModeNum);

    // Must be completely empty for auto-reload or auto-switch
    if ( FireModeNum == ALTFIRE_FIREMODE && AmmoCount[0] > 0 )
    {
   		bPendingAutoSwitchOnDryFire = false;
   		return false;
    }

    return bRequestReload;
}

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Electric;
}

defaultproperties
{
   FireHeavyAnim="Shoot_Heavy"
   FireLastHeavyAnim="Shoot_Heavy_Last"
   FireLastHeavySightedAnim="Shoot_Heavy_Iron_Last"
   FireLoopEndLastAnim="ShootLoop_End_Last"
   FireLoopEndLastSightedAnim="ShootLoop_Iron_End_Last"
   ExplosionTemplate=GameExplosion'kfgamecontent.Default__KFWeap_Beam_Microwave:ExploTemplate0'
   bWarnAIWhenFiring=True
   FlameSprayArchetype=SprayActor_Flame'WEP_Microwave_Gun_ARCH.WEP_Microwave_Gun_Flame'
   PilotLightPlayEvent=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_PilotLight_Loop'
   PilotLightStopEvent=AkEvent'WW_WEP_SA_Microwave_Gun.Stop_SA_MicrowaveGun_PilotLight_Loop'
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   Begin Object Class=KFParticleSystemComponent Name=FlameEndSpray0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   MinAmmoConsumed=3
   PackageKey="Microwave_Gun"
   FirstPersonMeshName="WEP_1P_Microwave_Gun_MESH.Wep_1stP_Microwave_Gun_Rig"
   FirstPersonAnimSetNames(0)="WEP_1p_Microwave_Gun_ANIM.WEP_1p_Microwave_Gun_ANIM"
   PickupMeshName="WEP_3P_Microwave_Gun_MESH.Wep_Microwave_Gun_Pickup"
   AttachmentArchetypeName="WEP_Microwave_Gun_ARCH.Microwave_Gun_3P"
   MuzzleFlashTemplateName="WEP_Microwave_Gun_ARCH.Wep_Microwave_Gun_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Flamethrower'
   FireModeIconPaths(1)=()
   InventorySize=9
   MagazineCapacity(0)=100
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=80.000000
   IronSightPosition=(X=3.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   MaxAIWarningDistSQ=2250000.000000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Microwave_Gun_TEX.UI_WeaponSelect_MicrowaveGun'
   AmmoCost(1)=10
   SpareAmmoCapacity(0)=500
   AmmoPickupScale(0)=0.500000
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(0)="Shoot"
   FireSightedAnims(1)="Shoot_Heavy_Iron"
   BonesToLockOnEmpty(0)="RW_Handle1"
   BonesToLockOnEmpty(1)="RW_BatteryCylinder1"
   BonesToLockOnEmpty(2)="RW_BatteryCylinder2"
   BonesToLockOnEmpty(3)="RW_LeftArmSpinner"
   BonesToLockOnEmpty(4)="RW_RightArmSpinner"
   BonesToLockOnEmpty(5)="RW_LockEngager2"
   BonesToLockOnEmpty(6)="RW_LockEngager1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_Secondary_3P',FirstPersonCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_Secondary_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_3P_LoopEnd',FirstPersonCue=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_Fire_1P_LoopEnd')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_DryFire'
   PlayerViewOffset=(X=5.000000,Y=9.000000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Beam_Microwave:MeleeHelper_0'
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
   WeaponUpgrades(1)=(IncrementDamage=1.150000)
   FiringStatesArray(0)="SprayingFire"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   FireInterval(0)=0.070000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(3)=30.000000
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
   ItemName="Microwave Gun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Beam_Microwave"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
