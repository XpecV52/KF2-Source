//=============================================================================
// KFWeap_HRG_CranialPopper
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeap_HRG_CranialPopper extends KFWeap_ScopedBase;

/** How many alt ammo to recharge per second */
var float AltAmmoFullRechargeSeconds;
/** How many alt ammo to recharge per second. */
var transient float AltAmmoRechargePerSecond;

var transient float AltAmmoIncrement;
var repnotify byte AltAmmo;

var class<KFGFxWorld_MedicOptics> OpticsUIClass;
var KFGFxWorld_MedicOptics OpticsUI;

/** The last updated value for our ammo - Used to know when to update our optics ammo */
var byte StoredPrimaryAmmo;
var byte StoredSecondaryAmmo;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		AltAmmo;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(AltAmmo))
	{
		AmmoCount[ALTFIRE_FIREMODE] = AltAmmo;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

static simulated event EFilterTypeUI GetTraderFilter()
{
    return FT_Rifle;
}

simulated event PreBeginPlay()
{
	super.PreBeginPlay();
	StartAltAmmoRecharge();
} 

function StartAltAmmoRecharge()
{
	local float UsedAltAmmoRechargeTime;

	// begin ammo recharge on server
	if( Role == ROLE_Authority )
	{
		UsedAltAmmoRechargeTime = AltAmmoFullRechargeSeconds;
	    AltAmmoRechargePerSecond = MagazineCapacity[ALTFIRE_FIREMODE] / UsedAltAmmoRechargeTime;
		AltAmmoIncrement = 0;
	}
}

function RechargeAltAmmo(float DeltaTime)
{
	if ( Role == ROLE_Authority )
	{
		AltAmmoIncrement += AltAmmoRechargePerSecond * DeltaTime;

		if( AltAmmoIncrement >= 1.0 && AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE] )
		{
			AmmoCount[ALTFIRE_FIREMODE]++;
			AltAmmoIncrement -= 1.0;
			AltAmmo = AmmoCount[ALTFIRE_FIREMODE];
		}
	}
}

/** Overridden to call StartHealRecharge on server */
function GivenTo( Pawn thisPawn, optional bool bDoNotActivate )
{
	super.GivenTo( thisPawn, bDoNotActivate );

	if( Role == ROLE_Authority && !thisPawn.IsLocallyControlled() )
	{
		StartAltAmmoRecharge();
	}
}

simulated event Tick( FLOAT DeltaTime )
{
    if( AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE] )
	{
        RechargeAltAmmo(DeltaTime);
	}

	if (Instigator != none && Instigator.weapon == self)
	{
		UpdateOpticsUI();
	}

	Super.Tick(DeltaTime);
}

simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	return FireModeNum == ALTFIRE_FIREMODE || Super.CanOverrideMagReload(FireModeNum);
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

/** Alt ammo doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	return HasSpareAmmo() || HasAmmo(DEFAULT_FIREMODE);
}

simulated function bool ShouldAutoReload(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
		return false;
	
	return super.ShouldAutoReload(FireModeNum);
}

/**
    Optic UI
 */

/** Get our optics movie from the inventory once our InvManager is created */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	local KFInventoryManager KFIM;

	super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	if (OpticsUI == none && OpticsUIClass != none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			//Create the screen's UI piece
			OpticsUI = KFGFxWorld_MedicOptics(KFIM.GetOpticsUIMovie(OpticsUIClass));
		}
	}
}

/**
 * Update our displayed ammo count if it's changed
 */
simulated function UpdateOpticsUI(optional bool bForceUpdate)
{
	if (OpticsUI != none && OpticsUI.OpticsContainer != none)
	{
		if (AmmoCount[DEFAULT_FIREMODE] != StoredPrimaryAmmo || bForceUpdate)
		{
			StoredPrimaryAmmo = AmmoCount[DEFAULT_FIREMODE];
			OpticsUI.SetPrimaryAmmo(StoredPrimaryAmmo);
		}

		if (AmmoCount[ALTFIRE_FIREMODE] != StoredSecondaryAmmo || bForceUpdate)
		{
			StoredSecondaryAmmo = AmmoCount[ALTFIRE_FIREMODE];
			OpticsUI.SetHealerCharge(StoredSecondaryAmmo);
		}

		if(OpticsUI.MinPercentPerShot != AmmoCost[ALTFIRE_FIREMODE])
		{
			OpticsUI.SetShotPercentCost( AmmoCost[ALTFIRE_FIREMODE] );
		}
	}
}

function ItemRemovedFromInvManager()
{
	local KFInventoryManager KFIM;
	local KFWeap_MedicBase KFW;

	Super.ItemRemovedFromInvManager();

	if (OpticsUI != none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			// @todo future implementation will have optics in base weapon class
			foreach KFIM.InventoryActors(class'KFWeap_MedicBase', KFW)
			{
				if( KFW.OpticsUI.Class == OpticsUI.class)
				{
					// A different weapon is still using this optics class
					return;
				}
			}

			//Create the screen's UI piece
			KFIM.RemoveOpticsUIMovie(OpticsUI.class);

			OpticsUI.Close();
			OpticsUI = none;
		}
	}
}

/** Unpause our optics movie and reinitialize our ammo when we equip the weapon */
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	super.AttachWeaponTo(MeshCpnt, SocketName);

	if (OpticsUI != none)
	{
		OpticsUI.SetPause(false);
		OpticsUI.ClearLockOn();
		UpdateOpticsUI(true);
		OpticsUI.SetShotPercentCost( AmmoCost[ALTFIRE_FIREMODE]);
	}
}

/** Pause the optics movie once we unequip the weapon so it's not playing in the background */
simulated function DetachWeapon()
{
	local Pawn OwnerPawn;
	super.DetachWeapon();

	OwnerPawn = Pawn(Owner);
	if( OwnerPawn != none && OwnerPawn.Weapon == self )
	{
		if (OpticsUI != none)
		{
			OpticsUI.SetPause();
		}
	}
}

defaultproperties
{
   AltAmmoFullRechargeSeconds=3.500000
   AltAmmo=100
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
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
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_HRG_CranialPopper_MAT.WEP_1P_Cranial_zoomed_Scope_MAT'
   ScopedSensitivityMod=8.000000
   PackageKey="HRG_CranialPopper"
   FirstPersonMeshName="WEP_1P_HRG_CranialPopper_MESH.Wep_1stP_HRG_CranialPopper_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_hrg_cranialpopper_anim.Wep_1stP_HRG_CranialPopper_Anim"
   PickupMeshName="WEP_3P_HRG_CranialPopper_MESH.Wep_3rdP_HRG_CranialPopper_Pickup"
   AttachmentArchetypeName="WEP_HRG_CranialPopper_ARCH.Wep_HRG_CrannialPopper_3P"
   MuzzleFlashTemplateName="WEP_HRG_CranialPopper_ARCH.Wep_HRG_CranialPopper_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanRefillSecondaryAmmo=False
   bCanBeReloaded=True
   bReloadFromMagazine=True
   InventorySize=7
   MeshFOV=60.000000
   MeshIronSightFOV=27.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=-7.000000,Y=0.070000,Z=0.050000)
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'wep_ui_hrg_cranialpopper_tex.UI_WeaponSelect_HRG_CranialPopper'
   SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   MagazineCapacity(0)=7
   MagazineCapacity(1)=100
   AmmoCost(1)=100
   SpareAmmoCapacity(0)=112
   InitialSpareMags(0)=5
   AmmoPickupScale(0)=2.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_CranialPopper.Play_WEP_HRG_CranialPopper_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_CranialPopper.Play_WEP_HRG_CranialPopper_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Handling_DryFire'
   PlayerViewOffset=(X=15.000000,Y=11.500000,Z=-4.000000)
   NumBloodMapMaterials=3
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_CranialPopper:MeleeHelper_0'
   LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'
   maxRecoilPitch=225
   minRecoilPitch=200
   maxRecoilYaw=200
   minRecoilYaw=-200
   RecoilRate=0.080000
   RecoilViewRotationScale=0.600000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=150
   RecoilISMinYawLimit=65385
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1),(Stat=EWUS_HealFullRecharge,Scale=0.900000)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Add=2),(Stat=EWUS_HealFullRecharge,Scale=0.800000)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_HRG_CranialPopper'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Grenade_HRG_CranialPopper'
   FireInterval(0)=0.250000
   FireInterval(1)=0.250000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.006000
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Piercing_HRG_CranialPopper'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Blast_HRG_CranialPopper'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_CranialPopper'
   FireOffset=(X=30.000000,Y=3.000000,Z=-2.500000)
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
   ItemName="HRG Head Hunter"
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
   Name="Default__KFWeap_HRG_CranialPopper"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
