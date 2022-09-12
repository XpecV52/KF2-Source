//=============================================================================
// KFWeap_GravityImploder
//=============================================================================
// The unique and amazing Gravity Imploder weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeap_GravityImploder extends KFWeapon;



/** Reduction for the amount of damage dealt to the weapon owner (including damage by the explosion) */
var float SelfDamageReductionValue;

/** Weapons material colors for each fire mode. */
var LinearColor DefaultFireMaterialColor;
var LinearColor AltFireMaterialColor;

var bool bLastFireWasAlt;

var const bool bDebugDrawVortex;

simulated function Activate()
{
	super.Activate();
	UpdateMaterial();
}

simulated function UpdateMaterial()
{
	local LinearColor MatColor;
	MatColor = bLastFireWasAlt ? AltFireMaterialColor : DefaultFireMaterialColor;

	if( WeaponMICs.Length > 1)
	{
		WeaponMICs[1].SetVectorParameterValue('Vector_Center_Color_A', MatColor);
	}
}


simulated function Projectile ProjectileFire()
{
	UpdateMaterial();
	return super.ProjectileFire();
}

simulated function BeginFire( Byte FireModeNum )
{
	super.BeginFire(FireModeNum);

	if(FireModeNum == ALTFIRE_FIREMODE && !bLastFireWasAlt)
	{
		bLastFireWasAlt=true;
	}
	else if (FireModeNum == DEFAULT_FIREMODE && bLastFireWasAlt)
	{
		bLastFireWasAlt=false;
	}
}

simulated function AltFireMode()
{
	StartFire(ALTFIRE_FIREMODE);
}

// Reduce damage to self
function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
	super.AdjustDamage(InDamage, DamageType, DamageCauser);

	if (Instigator != none && DamageCauser != none && DamageCauser.Instigator == Instigator)
	{
		InDamage *= SelfDamageReductionValue;
	}
}

defaultproperties
{
   DefaultFireMaterialColor=(R=0.965000,G=0.297200,B=0.000000,A=1.000000)
   AltFireMaterialColor=(R=0.000000,G=0.963100,B=0.965810,A=1.000000)
   PackageKey="Gravity_Imploder"
   FirstPersonMeshName="WEP_1P_Gravity_Imploder_MESH.Wep_1stP_Gravity_Imploder_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Gravity_Imploder_ANIM.Wep_1stP_Gravity_Imploder_Anim"
   PickupMeshName="WEP_3P_Gravity_Imploder_MESH.WEP_3rdP_Gravity_Imploder_Pickup"
   AttachmentArchetypeName="WEP_Gravity_Imploder_ARCH.Wep_Gravity_Imploder_3P"
   MuzzleFlashTemplateName="WEP_Gravity_Imploder_ARCH.Wep_Gravity_Imploder_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   InventorySize=7
   MeshFOV=75.000000
   MeshIronSightFOV=40.000000
   PlayerIronSightFOV=65.000000
   IronSightPosition=(X=10.000000,Y=0.000000,Z=-1.900000)
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=125.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Gravity_Imploder_TEX.UI_WeaponSelect_Gravity_Imploder'
   MagazineCapacity(0)=6
   SpareAmmoCapacity(0)=42
   InitialSpareMags(0)=2
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Shoot_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Shoot_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Dry_Fire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Dry_Fire'
   PlayerViewOffset=(X=5.500000,Y=8.000000,Z=-2.000000)
   NumBloodMapMaterials=2
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_GravityImploder:MeleeHelper_0'
   EjectedShellForegroundDuration=1.500000
   maxRecoilPitch=750
   minRecoilPitch=675
   maxRecoilYaw=250
   minRecoilYaw=-250
   RecoilRate=0.080000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=1250
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Demolitionist'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Grenade_GravityImploder'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Grenade_GravityImploderAlt'
   FireInterval(0)=1.330000
   FireInterval(1)=1.330000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.020000
   Spread(1)=0.020000
   InstantHitDamage(0)=150.000000
   InstantHitDamage(1)=200.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_GravityImploderImpact'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_GravityImploderImpactAlt'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_GravityImploder'
   FireOffset=(X=25.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Gravity Imploder"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_GravityImploder"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
