//=============================================================================
// KFWeap_Rifle_ParasiteImplanter
//=============================================================================
// Weapon code for parasite implanter.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Rifle_ParasiteImplanter extends KFWeap_ScopedBase;



var float LastFireInterval;

/** How many seed ammo to recharge per second */
var float SeedFullRechargeSeconds;
/** How many ammo to recharge per second. */
var transient float SeedRechargePerSecond;

var transient float SeedIncrement;
var repnotify byte SeedAmmo;

const SecondaryFireAnim     = 'Shoot_Secondary';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';

/** Material colors applied to different fire modes */
var LinearColor NoAmmoMaterialColor;
var LinearColor AmmoReadyMaterialColor;

/** How much recoil the altfire should do */
var protected const float AltFireRecoilScale;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		SeedAmmo;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(SeedAmmo))
	{
		if (AmmoCount[ALTFIRE_FIREMODE] < AmmoCost[ALTFIRE_FIREMODE] && SeedAmmo >= AmmoCost[ALTFIRE_FIREMODE])
		{
			UpdateMaterial(true);
		}
		else if (AmmoCount[ALTFIRE_FIREMODE] >= AmmoCost[ALTFIRE_FIREMODE] && SeedAmmo < AmmoCost[ALTFIRE_FIREMODE])
		{
			UpdateMaterial(false);
		}
		AmmoCount[ALTFIRE_FIREMODE] = SeedAmmo;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	if( default.FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponFiring' || default.FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponBurstFiring' )
	{
		return FT_Assault;
	}
	else // if( FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponSingleFiring')
	{
		return FT_Rifle;
	}
}

simulated event PreBeginPlay()
{
	super.PreBeginPlay();
	StartSeedRecharge();
} 

function StartSeedRecharge()
{
	// local KFPerk InstigatorPerk;
	local float UsedSeedRechargeTime;

	// begin ammo recharge on server
	if( Role == ROLE_Authority )
	{
		UsedSeedRechargeTime = SeedFullRechargeSeconds;
	    SeedRechargePerSecond = MagazineCapacity[ALTFIRE_FIREMODE] / UsedSeedRechargeTime;
		SeedIncrement = 0;
	}
}

function RechargeSeed(float DeltaTime)
{
	if ( Role == ROLE_Authority )
	{
		SeedIncrement += SeedRechargePerSecond * DeltaTime;

		if( SeedIncrement >= 1.0 && AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE] )
		{
			AmmoCount[ALTFIRE_FIREMODE]++;
			SeedIncrement -= 1.0;
			SeedAmmo = AmmoCount[ALTFIRE_FIREMODE];
		}
	}
}

/** Overridden to call StartHealRecharge on server */
function GivenTo( Pawn thisPawn, optional bool bDoNotActivate )
{
	super.GivenTo( thisPawn, bDoNotActivate );

	if( Role == ROLE_Authority && !thisPawn.IsLocallyControlled() )
	{
		StartSeedRecharge();
	}
}
/*********************************************************************************************
 @name Actor
********************************************************************************************* */
simulated event Tick( FLOAT DeltaTime )
{
	local bool bWasLowAmmo;
	bWasLowAmmo = AmmoCount[ALTFIRE_FIREMODE] < AmmoCost[ALTFIRE_FIREMODE];

    if( AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE] )
	{
        RechargeSeed(DeltaTime);
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (bWasLowAmmo && AmmoCount[ALTFIRE_FIREMODE] >= AmmoCost[ALTFIRE_FIREMODE])
		{
			UpdateMaterial(true);
		}
	}
	else
	{
		if (bWasLowAmmo && AmmoCount[ALTFIRE_FIREMODE] >= AmmoCost[ALTFIRE_FIREMODE])
		{
			NotifyAltAmmoReady(true);
		}
	}

	Super.Tick(DeltaTime);
}

/*********************************************************************************************
 * Trader
 ********************************************************************************************/

/** Allows weapon to set its own trader stats (can set number of stats, names and values of stats) */
static simulated event SetTraderWeaponStats( out array<STraderItemWeaponStats> WeaponStats )
{
	super.SetTraderWeaponStats( WeaponStats );

	WeaponStats.Length = WeaponStats.Length + 1;
	WeaponStats[WeaponStats.Length-1].StatType = TWS_RechargeTime;
	WeaponStats[WeaponStats.Length-1].StatValue = default.SeedFullRechargeSeconds;
}

/** Seeds doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	return HasSpareAmmo() || HasAmmo(DEFAULT_FIREMODE);
}

simulated function ConsumeAmmo( byte FireModeNum )
{
	local bool bWasHighAmmo;

    if( FireModeNum != ALTFIRE_FIREMODE )
    {
        Super.ConsumeAmmo(FireModeNum);
        return;
    }








	bWasHighAmmo = AmmoCount[ALTFIRE_FIREMODE] >= AmmoCost[ALTFIRE_FIREMODE];

	// If AmmoCount is being replicated, don't allow the client to modify it here
	if (Role == ROLE_Authority)
	{
        // Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
		if (MagazineCapacity[1] > 0 && AmmoCount[1] > 0)
		{
			// Reduce ammo amount by heal ammo cost
            AmmoCount[1] = Max(AmmoCount[1] - AmmoCost[1], 0);
		}
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (bWasHighAmmo && AmmoCount[ALTFIRE_FIREMODE] < AmmoCost[ALTFIRE_FIREMODE])
		{
			UpdateMaterial(false);
		}
	}
	else if (bWasHighAmmo && AmmoCount[ALTFIRE_FIREMODE] < AmmoCost[ALTFIRE_FIREMODE])
	{
		NotifyAltAmmoReady(false);
	}
}

/** Instead of switch fire mode use as immediate alt fire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

simulated function float GetFireInterval(byte FireModeNum)
{
	if (FireModeNum == DEFAULT_FIREMODE && AmmoCount[FireModeNum] == 0)
	{
		return LastFireInterval;
	}

	return super.GetFireInterval(FireModeNum);
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return bUsingSights ? SecondaryFireIronAnim : SecondaryFireAnim;
	}

	return super.GetWeaponFireAnim(FireModeNum);
}

simulated function UpdateMaterial(bool HasEnoughAmmo)
{
	local LinearColor MatColor;
	
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MatColor = HasEnoughAmmo ? AmmoReadyMaterialColor : NoAmmoMaterialColor;

		if( WeaponMICs.Length >= 0)
		{
			WeaponMICs[0].SetVectorParameterValue('Vector_GlowColor', MatColor);
		}
	}
}

/**
	Should replicate to 3P to show the alt fire ready
 */
simulated function NotifyAltAmmoReady(bool bActive)
{
	local KFPawn KFP;

	if (WorldInfo.NetMode != NM_Client)
	{
		KFP = KFPawn(Instigator);
		KFP.OnWeaponSpecialAction(bActive ? 2 : 1);
	}
}

simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	if( CurrentFireMode == ALTFIRE_FIREMODE )
	{
		CurrentRecoilModifier *= AltFireRecoilScale;
	}

	super.ModifyRecoil( CurrentRecoilModifier );
}

simulated function bool ShouldAutoReload(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
		return false;
	
	return super.ShouldAutoReload(FireModeNum);
}

/** Called during reload state */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	return super.CanOverrideMagReload(FireModeNum) || FireModeNum == ALTFIRE_FIREMODE;
}

defaultproperties
{
   LastFireInterval=0.300000
   SeedFullRechargeSeconds=14.000000
   SeedAmmo=100
   NoAmmoMaterialColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   AmmoReadyMaterialColor=(R=0.080000,G=1.000000,B=0.080000,A=1.000000)
   AltFireRecoilScale=0.200000
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      FieldOfView=12.500000
      NearPlane=10.000000
      FarPlane=0.000000
      bUpdateMatrices=False
      bEnabled=False
      bEnableFog=True
      ViewMode=SceneCapView_Lit
      FrameRate=60.000000
      Name="SceneCapture2DComponent0"
      ObjectArchetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
   End Object
   SceneCapture=SceneCapture2DComponent0
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_ParasiteImplanter_MAT.Wep_1stP_Parasite_Lens_MIC'
   ScopedSensitivityMod=8.000000
   PackageKey="ParasiteImplanter"
   FirstPersonMeshName="WEP_1P_ParasiteImplanter_MESH.Wep_1stP_ParasiteImplanter_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_ParasiteImplanter_ANIM.Wep_1stP_ParasiteImplanter_Anim"
   PickupMeshName="WEP_3P_ParasiteImplanter_MESH.Wep_3rdP_ParasiteImplanter_Pickup"
   AttachmentArchetypeName="WEP_ParasiteImplanter_ARCH.Wep_ParasiteImplanter_3P"
   MuzzleFlashTemplateName="WEP_ParasiteImplanter_ARCH.Wep_ParasiteImplanter_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanRefillSecondaryAmmo=False
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=7
   PenetrationPower(0)=3.000000
   PenetrationPower(1)=()
   MeshFOV=70.000000
   MeshIronSightFOV=27.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=0.000000,Y=-0.090000,Z=1.042000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'wep_ui_parasiteimplanter_tex.UI_WeaponSelect_ParasiteImplanter'
   SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   MagazineCapacity(0)=6
   MagazineCapacity(1)=100
   AmmoCost(1)=50
   SpareAmmoCapacity(0)=78
   InitialSpareMags(0)=3
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_3P_Rifle',FirstPersonCue=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_1P_Rifle')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_3P_Altfire',FirstPersonCue=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_1P_Altfire')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_Dry_Fire_Rifle'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_Dry_Fire_Altfire'
   PlayerViewOffset=(X=3.000000,Y=8.000000,Z=-1.800000)
   NumBloodMapMaterials=2
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Rifle_ParasiteImplanter:MeleeHelper_0'
   EjectedShellForegroundDuration=1.500000
   maxRecoilPitch=575
   minRecoilPitch=425
   maxRecoilYaw=135
   minRecoilYaw=-135
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_ParasiteImplanter'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_ParasiteImplanterAlt'
   FireInterval(1)=0.500000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   Spread(1)=0.005000
   InstantHitDamage(0)=275.000000
   InstantHitDamage(1)=1.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_ParasiteImplanter'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_ParasiteImplanterAlt'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_ParasiteImplanter'
   FireOffset=(X=25.000000,Y=3.000000,Z=-2.500000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ScopedBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Corrupter Carbine"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ScopedBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=SceneCapture2DComponent0
   Name="Default__KFWeap_Rifle_ParasiteImplanter"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
