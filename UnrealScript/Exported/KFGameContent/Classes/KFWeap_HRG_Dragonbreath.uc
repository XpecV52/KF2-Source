//=============================================================================
// KFWeap_HRG_Dragonbreath
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFWeap_HRG_Dragonbreath extends KFWeap_ShotgunBase;

/** How much to scale recoil when firing in double barrel fire. */
var(Recoil) float QuadFireRecoilModifier;

/** Shoot animation to play when shooting both barrels from the hip */
var(Animations) const editconst	name	FireQuadAnim;

/** How much momentum to apply when fired in double barrel */
var(Recoil) float DoubleBarrelKickMomentum;

/** How much to reduce shoot momentum when falling */
var(Recoil) float FallingMomentumReduction;

var(Spread) const float SpreadWidthDegrees;
var(Spread) const float SpreadWidthDegreesAlt;

var transient float StartingPelletPosition;
var transient float StartingPelletPositionAlt;

var const float BarrelHeatPerProjectile;
var const float MaxBarrelHeat;
var const float BarrelCooldownRate;
var transient float CurrentBarrelHeat;
var transient float LastBarrelHeat;

simulated event PreBeginPlay()
{
    Super.PreBeginPlay();

    Spread[DEFAULT_FIREMODE] = SpreadWidthDegrees * DegToRad / NumPellets[DEFAULT_FIREMODE];
    Spread[ALTFIRE_FIREMODE] = SpreadWidthDegreesAlt * DegToRad / NumPellets[ALTFIRE_FIREMODE];

    StartingPelletPosition = -SpreadWidthDegrees * DegToRad / 2.0f;
    StartingPelletPositionAlt = -SpreadWidthDegreesAlt * DegToRad / 2.0f;
}

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// Force start with "Glow_Intensity" of 0.0f
	LastBarrelHeat = MaxBarrelHeat;
	ChangeBarrelMaterial();
}

simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPellets[CurrentFireMode];
}

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if (bUsingSights)
	{
		return FireSightedAnims[FireModeNum];
	}
	else
	{
		if (FireModeNum == ALTFIRE_FIREMODE)
		{
			return FireQuadAnim;
		}
		else
		{
			return FireAnim;
		}
	}
}

simulated function KFProjectile SpawnAllProjectiles(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local int ProjectilesToFire, i;
    local float InitialOffset;

	ProjectilesToFire = GetNumProjectilesToFire(CurrentFireMode);
	if (CurrentFireMode == GRENADE_FIREMODE || ProjectilesToFire <= 1)
	{
		return SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
	}

    InitialOffset = CurrentFireMode == DEFAULT_FIREMODE ? StartingPelletPosition : StartingPelletPositionAlt;

	for (i = 0; i < ProjectilesToFire; i++)
	{
		SpawnProjectile(KFProjClass, RealStartLoc, CalculateSpread(InitialOffset, Spread[CurrentFireMode], i, CurrentFireMode == ALTFIRE_FIREMODE));
		CurrentBarrelHeat = fmin(CurrentBarrelHeat + BarrelHeatPerProjectile, MaxBarrelHeat);
	}
	
	ChangeBarrelMaterial();
	return None;
}

simulated function vector CalculateSpread(float InitialOffset, float CurrentSpread, byte PelletNum, bool bHorizontal)
{
    local Vector X, Y, Z, POVLoc;
    local Quat R;
	local rotator POVRot;

	if (Instigator != None && Instigator.Controller != none)
	{
		Instigator.Controller.GetPlayerViewPoint(POVLoc, POVRot);
	}

    GetAxes(POVRot, X, Y, Z);

    R = QuatFromAxisAndAngle(bHorizontal ? Z : Y, InitialOffset + CurrentSpread * PelletNum);
    return QuatRotateVector(R, vector(POVRot));
}

simulated function ChangeBarrelMaterial()
{
	local int i;

    if( CurrentBarrelHeat != LastBarrelHeat )
    {
    	for( i = 0; i < WeaponMICs.Length; ++i )
    	{
    		if( WeaponMICs[i] != none )
    		{
				WeaponMICs[i].SetScalarParameterValue('Barrel_intensity', CurrentBarrelHeat);
				LastBarrelHeat = CurrentBarrelHeat; 
			}
		}
    }
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);

	CurrentBarrelHeat = fmax(CurrentBarrelHeat - BarrelCooldownRate * Delta, 0.0f);
	ChangeBarrelMaterial();
}

defaultproperties
{
   QuadFireRecoilModifier=2.000000
   FireQuadAnim="Shoot_Double"
   DoubleBarrelKickMomentum=1000.000000
   FallingMomentumReduction=0.500000
   SpreadWidthDegrees=7.000000
   SpreadWidthDegreesAlt=15.000000
   BarrelHeatPerProjectile=0.089000
   MaxBarrelHeat=5.000000
   BarrelCooldownRate=0.450000
   PackageKey="HRG_MegaDragonsbreath"
   FirstPersonMeshName="wep_1p_hrg_megadragonsbreath_mesh.Wep_1stP_HRG_MegaDragonsbreath_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_hrg_megadragonsbreath_anim.Wep_1stP_HRG_MegaDragonsbreath_Anim"
   PickupMeshName="wep_3p_hrg_megadragonsbreath_mesh.Wep_3rdP_HRG_MegaDragonsbreath_Pickup"
   AttachmentArchetypeName="wep_hrg_megadragonsbreath_arch.Wep_HRG_MegaDragonsbreath_3P"
   MuzzleFlashTemplateName="wep_hrg_megadragonsbreath_arch.Wep_HRG_MegaDragonsbreath_MuzzleFlash"
   bHasIronSights=True
   bNoMagazine=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
   InventorySize=7
   PenetrationPower(0)=4.000000
   PenetrationPower(1)=4.000000
   MeshFOV=60.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=3.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=65.000000
   GroupPriority=110.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_MegaDragonsbreath_TEX.UI_WeaponSelect_HRG_MegaDragonsbreath'
   MagazineCapacity(0)=4
   SpareAmmoCapacity(0)=60
   InitialSpareMags(0)=3
   AmmoPickupScale(0)=2.000000
   ForceReloadTimeOnEmpty=0.300000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   FireAnim="Shoot_Single"
   FireSightedAnims(0)="Shoot_Iron_Single"
   FireSightedAnims(1)="Shoot_Iron_Double"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_1P_Single')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_3P_AltFire',FirstPersonCue=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_Fire_1P_AltFire')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_Quad_Shotgun.Play_Quad_Shotgun_DryFire'
   PlayerViewOffset=(X=15.000000,Y=8.000000,Z=-4.500000)
   NumBloodMapMaterials=3
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ShotgunBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Dragonbreath:MeleeHelper_0'
   NumPellets(0)=8
   NumPellets(1)=8
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=1200
   minRecoilPitch=775
   maxRecoilYaw=800
   minRecoilYaw=-500
   RecoilRate=0.085000
   RecoilBlendOutRatio=1.100000
   RecoilViewRotationScale=0.800000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.100000
   FallingRecoilModifier=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Firebug'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
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
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Pellet_HRG_Dragonbreath'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Pellet_HRG_Dragonbreath'
   FireInterval(0)=0.250000
   FireInterval(1)=0.250000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.000000
   Spread(1)=0.000000
   InstantHitDamage(0)=28.000000
   InstantHitDamage(1)=28.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=27.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_Dragonbreath'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRG_Dragonbreath'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_Dragonbreath'
   FireOffset=(X=25.000000,Y=3.500000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ShotgunBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Dragonsblaze"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ShotgunBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_Dragonbreath"
   ObjectArchetype=KFWeap_ShotgunBase'KFGame.Default__KFWeap_ShotgunBase'
}
