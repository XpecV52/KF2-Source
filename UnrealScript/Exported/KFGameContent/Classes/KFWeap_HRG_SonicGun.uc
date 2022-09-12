//=============================================================================
// KFWeap_HRG_SonicGun
//=============================================================================
// The HRG Sonic Gun weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFWeap_HRG_SonicGun extends KFWeapon;



var(Animations) const editconst name ChargeAnim;
var(Animations) const editconst name ChargeAnimLast;
var(Animations) const editconst name ChargeAnimIron;
var(Animations) const editconst name ChargeAnimIronLast;

/** How long to wait after firing to force reload */
var()			float		ForceReloadTime;

var transient int CurrentChargeLevel;

/** Maximum times weapon can be charged */
var int MaxChargeLevel;

/** How much multiply damage does default fire projectile do by charge level*/
var	Array<float> SonicBlastDamageByChargeLevel;

/** how much multiply momentum for default fire projectile by charge level */
var Array<float> SonicBlastMomentumByChargeLevel;

/** how much multiply penetration power for default fire projectile by charge level */
var Array<float> SonicBlastPenetrationPowerByChargeLevel;

/** DamageTypes for default fire projectile by charge level*/
var	Array< class<DamageType> >	SonicBlastDamageTypeByChargeLevel;

/** Projectile classes for default fire projectile by charge level*/
var	Array< class<KFProjectile> >	SonicBlastProjectileClassByChargeLevel;

/** Sounds for default fire by charge level*/
var	Array<WeaponFireSndInfo> SonicBlastFireSoundByChargeLevel;

/** Sounds for charge */
var	Array<WeaponFireSndInfo> SonicBlastFireSoundCharge;

/** Sounds for charge sound by charge level*/
var	Array<AkEvent> ChargeSoundByChargeLevel;

/** How much momentum to apply when fired in double barrel */
var(Recoil) float FullyChargedKickMomentum;

/** How much to reduce shoot momentum when falling */
var(Recoil) float FallingMomentumReduction;

/** VFX to play from the muzzle when firing the charged shot */
var ParticleSystem MuzzleEffectDefaultFire;

/** VFX to play from the muzzle when firing the charged shot */
var ParticleSystem MuzzleEffectChargedFire;


struct MomentumMultiplierByZed
{
	var Name ZedClassName;
	var float MomentumMultiplier;
};

var array<MomentumMultiplierByZed> MomentumMultiplierByZedArray;

/** Colors for holographic sight by charge level */
var const Array<LinearColor> HolographicSightByChargeLevel;
var const Array<LinearColor> HolographicSightScanlineByChargeLevel;
var Array<bool> HolographicSightUseDefaultByChargeLevel;

simulated function PostBeginPlay()
{
    CurrentChargeLevel=0;
	if( WeaponMICs.Length > 1)
	{
		if (!HolographicSightUseDefaultByChargeLevel[0])
		{
			WeaponMICs[1].SetVectorParameterValue('Vector_Center_Color_A', HolographicSightByChargeLevel[0]);
			WeaponMICs[1].SetVectorParameterValue('Vector_Scanline_Color_Mult', HolographicSightScanlineByChargeLevel[0]);
		}
		else {
			WeaponMICs[1].ClearParameterValues();
		}
	}
}
/**
 * Toggle between DEFAULT and ALTFIRE
 */
simulated function AltFireMode()
{
	// skip super

	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/** Overridded to add spawned charge to list of spawned charges */
simulated function Projectile ProjectileFire()
{
	local Projectile P;

	P = super.ProjectileFire();

	return P;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName(bool bTacticalReload)
{
	// magazine relaod
	if (AmmoCount[0] > 0)
	{
		return (bTacticalReload) ? ReloadNonEmptyMagEliteAnim : ReloadNonEmptyMagAnim;
	}
	else
	{
		return (bTacticalReload) ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
	}
}

simulated function StartFire(byte FireModeNum)
{
    if (FireModeNum == ALTFIRE_FIREMODE)
    {
        if (!IsCanIncrementCharge())
        {
            return;
        }
    }

    super.StartFire(FireModeNum);
}

/*********************************************************************************************
 * State WeaponSonicGunCharging
 * The weapon is in this state while detonating a charge
*********************************************************************************************/

simulated function GotoActiveState();

simulated state WeaponSonicGunCharging
{
	ignores AllowSprinting;

	simulated event BeginState( name PreviousStateName )
	{
		local KFPerk InstigatorPerk;

		if (!IsCanIncrementCharge())
        {
			ClearPendingFire(CurrentFireMode);
            GotoActiveState();
			return;
        }

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}

		IncrementChargeAndPlayAnimation();
	}

	simulated function GotoActiveState()
	{
		GotoState('Active');
	}
}

simulated state WeaponSonicGunSingleFiring extends WeaponSingleFiring
{
	simulated function BeginState(name PreviousStateName)
    {
   	    local vector UsedKickMomentum;

    	// Push the player back when they fire a fully charged sonic blast
        if (Instigator != none && CurrentChargeLevel == 1 ) //2
    	{
            UsedKickMomentum.X = -FullyChargedKickMomentum;

            if( Instigator.Physics == PHYS_Falling  )
            {
                UsedKickMomentum = UsedKickMomentum >> Instigator.GetViewRotation();
                UsedKickMomentum *= FallingMomentumReduction;
            }
            else
            {
                UsedKickMomentum = UsedKickMomentum >> Instigator.Rotation;
                UsedKickMomentum.Z = 0;
    		}

            Instigator.AddVelocity(UsedKickMomentum,Instigator.Location,none);
    	}

		//We want to do it at the end because the kickmomentum needs to use CurrentChargeLevel and this is reset in FireAmmunition
		Super.BeginState(PreviousStateName);
	}

	simulated function FireAmmunition()
	{
		super.FireAmmunition();
        CurrentChargeLevel=0;

		if( WeaponMICs.Length > 1)
		{
			if (!HolographicSightUseDefaultByChargeLevel[0])
			{
				WeaponMICs[1].SetVectorParameterValue('Vector_Center_Color_A', HolographicSightByChargeLevel[0]);
				WeaponMICs[1].SetVectorParameterValue('Vector_Scanline_Color_Mult', HolographicSightScanlineByChargeLevel[0]);
			}
			else
			{
				WeaponMICs[1].ClearParameterValues();
			}
		}
	}
}

// GrenadeLaunchers determine ShouldPlayFireLast based on the spare ammo
// overriding to use the base KFWeapon version since that uses the current ammo in the mag
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
	return Super(KFWeapon).ShouldPlayFireLast(FireModeNum);
}

simulated function bool IsCanIncrementCharge()
{
    return CurrentChargeLevel < MaxChargeLevel && AmmoCount[DEFAULT_FIREMODE] > 0;
}

simulated function IncrementChargeAndPlayAnimation()
{
	local name SelectedAnim;
	local float AnimDuration;
	local bool bInSprintState;

	// choose the detonate animation based on whether it is in ironsights and whether it is the last harpoon
	if (bUsingSights)
	{
		SelectedAnim = ShouldPlayFireLast(DEFAULT_FIREMODE) ? ChargeAnimIronLast : ChargeAnimIron;
	}
	else
	{
		SelectedAnim = ShouldPlayFireLast(DEFAULT_FIREMODE) ? ChargeAnimLast : ChargeAnim;
	}

	AnimDuration = MySkelMesh.GetAnimLength(SelectedAnim);
	bInSprintState = IsInState('WeaponSprinting');

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if ( KFPawn(Owner).IsLocallyControlled() )
		{
			PlaySoundBase(SonicBlastFireSoundCharge[CurrentChargeLevel].FirstPersonCue);
		}

		if (bInSprintState)
		{
			AnimDuration *= 0.25f;
			PlayAnimation(SelectedAnim, AnimDuration);
		}
		else
		{	
			PlayAnimation(SelectedAnim);
		}
	}

	// Don't want to play muzzle effects or shoot animation on detonate in 3p
	//IncrementFlashCount();

	//AnimDuration value here representes the ALTFIRE FireInterval
	AnimDuration = 0.75f; //1.f;
	if (bInSprintState)
	{
		SetTimer(AnimDuration * 0.8f, false, nameof(PlaySprintStart));
	}
	else
	{
		SetTimer(AnimDuration * 0.5f, false, nameof(GotoActiveState));
	}

	CurrentChargeLevel++;
	if( WeaponMICs.Length > 1)
	{
		if (!HolographicSightUseDefaultByChargeLevel[CurrentChargeLevel])
		{
			WeaponMICs[1].SetVectorParameterValue('Vector_Center_Color_A', HolographicSightByChargeLevel[CurrentChargeLevel]);
			WeaponMICs[1].SetVectorParameterValue('Vector_Scanline_Color_Mult', HolographicSightScanlineByChargeLevel[CurrentChargeLevel]);
		}
		else {
			WeaponMICs[1].ClearParameterValues();
		}
	}
}


/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Explosive;
}

simulated function float GetForceReloadDelay()
{
	return fMax( ForceReloadTime - FireInterval[CurrentFireMode], 0.f );
}

//Overriding to be able to change projectile stats depending on the charge level
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local KFProjectile	SpawnedProjectile;
	local int ProjDamage;

	// Spawn projectile
	SpawnedProjectile = Spawn( KFProjClass, Self,, RealStartLoc,,,true);
	if( SpawnedProjectile != none && !SpawnedProjectile.bDeleteMe )
	{
		// Mirror damage and damage type from weapon. This is set on the server only and
		// these properties are replicated via TakeHitInfo
		if ( InstantHitDamage.Length > CurrentFireMode && InstantHitDamageTypes.Length > CurrentFireMode )
		{
            InstantHitDamage[DEFAULT_FIREMODE] = SonicBlastDamageByChargeLevel[CurrentChargeLevel];
			InstantHitMomentum[DEFAULT_FIREMODE]=SonicBlastMomentumByChargeLevel[CurrentChargeLevel];
			InstantHitDamageTypes[DEFAULT_FIREMODE]=SonicBlastDamageTypeByChargeLevel[CurrentChargeLevel];

            ProjDamage = GetModifiedDamage(CurrentFireMode);
            SpawnedProjectile.Damage = ProjDamage;
            SpawnedProjectile.MyDamageType = InstantHitDamageTypes[DEFAULT_FIREMODE];
		}

		// Set the penetration power for this projectile
		// because of clientside hit detection, we need two variables --
		// one that replicates on init and one that updates but doesn't replicate
		PenetrationPower[DEFAULT_FIREMODE]=SonicBlastPenetrationPowerByChargeLevel[CurrentChargeLevel];
		SpawnedProjectile.InitialPenetrationPower = GetInitialPenetrationPower(CurrentFireMode);
		SpawnedProjectile.PenetrationPower = SpawnedProjectile.InitialPenetrationPower;

		SpawnedProjectile.UpgradeDamageMod = GetUpgradeDamageMod();
		SpawnedProjectile.Init( AimDir );
	}

	// return it up the line
	return SpawnedProjectile;
}

//Overriding to make KFProjectile Class for default fire mode to be dependant on charge level
simulated function class<KFProjectile> GetKFProjectileClass()
{
    if (CurrentFireMode == DEFAULT_FIREMODE)
    {
        return SonicBlastProjectileClassByChargeLevel[CurrentChargeLevel];
    }
    return super.GetKFProjectileClass();
}

//Overriding to get current PenetrationPower, not default.PenetrationPower
simulated function float GetUpgradedPenetration(optional int FireMode = DEFAULT_FIREMODE, optional int UpgradeIndex = INDEX_NONE)
{
	if (UpgradeIndex == INDEX_NONE)
	{
		UpgradeIndex = CurrentWeaponUpgradeIndex;
	}

	return int(GetUpgradedStatValue(PenetrationPower[FireMode], EWeaponUpgradeStat(EWUS_Penetration0 + UpgradeFireModes[FireMode]), UpgradeIndex));
}

//Overriding to change shot sounds for default fire mode to be dependant on charge level
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
	WeaponFireSnd[DEFAULT_FIREMODE]=SonicBlastFireSoundByChargeLevel[CurrentChargeLevel];
	super.PlayFireEffects(FireModeNum, HitLocation);
}

simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum )
{
	local KFPerk InstigatorPerk;
	local int IndexMomentumMultiplierByZed;

	InstigatorPerk = GetPerk();
	if( InstigatorPerk != none )
	{
		InstigatorPerk.UpdatePerkHeadShots( Impact, InstantHitDamageTypes[FiringMode], ImpactNum );
	}

	//Modifying momentum by zed impacted
	if (Impact.HitActor != None && KFPawn_Monster(Impact.HitActor) != None)
	{
		IndexMomentumMultiplierByZed = MomentumMultiplierByZedArray.Find('ZedClassName', Impact.HitActor.Class.Name);
		if (IndexMomentumMultiplierByZed != INDEX_NONE)
		{
			InstantHitMomentum[DEFAULT_FIREMODE] *= MomentumMultiplierByZedArray[IndexMomentumMultiplierByZed].MomentumMultiplier;
		}
	}

	super.ProcessInstantHitEx( FiringMode, Impact, NumHits, out_PenetrationVal, ImpactNum );
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if (MuzzleFlash == None)
	{
		AttachMuzzleFlash();
	}

	if (CurrentChargeLevel > 0)
	{
		MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleEffectChargedFire;
		MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleEffectChargedFire);
	}
	else
	{
		MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleEffectDefaultFire;
		MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleEffectDefaultFire);
	}

	super.CauseMuzzleFlash(FireModeNum);
}

defaultproperties
{
   ChargeAnim="Alt_Fire"
   ChargeAnimLast="Alt_Fire_Last"
   ChargeAnimIron="Alt_Fire_Iron"
   ChargeAnimIronLast="Alt_Fire_Iron_Last"
   ForceReloadTime=0.300000
   MaxChargeLevel=1
   SonicBlastDamageByChargeLevel(0)=100.000000
   SonicBlastDamageByChargeLevel(1)=240.000000
   SonicBlastMomentumByChargeLevel(0)=100000.000000
   SonicBlastMomentumByChargeLevel(1)=40000.000000
   SonicBlastPenetrationPowerByChargeLevel(0)=4.000000
   SonicBlastPenetrationPowerByChargeLevel(1)=2.000000
   SonicBlastDamageTypeByChargeLevel(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_SonicGun_SonicBlastUncharged'
   SonicBlastDamageTypeByChargeLevel(1)=Class'kfgamecontent.KFDT_Ballistic_HRG_SonicGun_SonicBlastFullyCharged'
   SonicBlastProjectileClassByChargeLevel(0)=Class'kfgamecontent.KFProj_SonicBlastUncharged_HRG_SonicGun'
   SonicBlastProjectileClassByChargeLevel(1)=Class'kfgamecontent.KFProj_SonicBlastFullyCharged_HRG_SonicGun'
   SonicBlastFireSoundByChargeLevel(0)=(DefaultCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_3P_Fire_Bass',FirstPersonCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_1P_Fire_Bass')
   SonicBlastFireSoundByChargeLevel(1)=(DefaultCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_3P_Fire_High',FirstPersonCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_1P_Fire_High')
   SonicBlastFireSoundCharge(0)=(DefaultCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Charge_Once',FirstPersonCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Charge_Once')
   SonicBlastFireSoundCharge(1)=(DefaultCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Charge_Twice',FirstPersonCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_Charge_Twice')
   ChargeSoundByChargeLevel(0)=AkEvent'WW_WEP_Seeker_6.Play_Seeker_6_Reload_1'
   ChargeSoundByChargeLevel(1)=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Handling_Equip'
   FallingMomentumReduction=0.500000
   MuzzleEffectDefaultFire=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_SonicGun_Muzzle'
   MuzzleEffectChargedFire=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_SonicGun_Muzzle_AltFire'
   MomentumMultiplierByZedArray(0)=(ZedClassName="KFPawn_ZedClot_Cyst",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(1)=(ZedClassName="KFPawn_ZedClot_Alpha",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(2)=(ZedClassName="KFPawn_ZedClot_Slasher",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(3)=(ZedClassName="KFPawn_ZedCrawler",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(4)=(ZedClassName="KFPawn_ZedGorefast",MomentumMultiplier=1.200000)
   MomentumMultiplierByZedArray(5)=(ZedClassName="KFPawn_ZedStalker",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(6)=(ZedClassName="KFPawn_ZedScrake",MomentumMultiplier=0.800000)
   MomentumMultiplierByZedArray(7)=(ZedClassName="KFPawn_ZedFleshpound",MomentumMultiplier=0.700000)
   MomentumMultiplierByZedArray(8)=(ZedClassName="KFPawn_ZedFleshpoundMini",MomentumMultiplier=0.700000)
   MomentumMultiplierByZedArray(9)=(ZedClassName="KFPawn_ZedBloat",MomentumMultiplier=1.700000)
   MomentumMultiplierByZedArray(10)=(ZedClassName="KFPawn_ZedSiren",MomentumMultiplier=0.800000)
   MomentumMultiplierByZedArray(11)=(ZedClassName="KFPawn_ZedHusk",MomentumMultiplier=0.800000)
   MomentumMultiplierByZedArray(12)=(ZedClassName="KFPawn_ZedClot_AlphaKing",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(13)=(ZedClassName="KFPawn_ZedCrawlerKing",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(14)=(ZedClassName="KFPawn_ZedGorefastDualBlade",MomentumMultiplier=1.300000)
   MomentumMultiplierByZedArray(15)=(ZedClassName="KFPawn_ZedDAR_EMP",MomentumMultiplier=1.400000)
   MomentumMultiplierByZedArray(16)=(ZedClassName="KFPawn_ZedDAR_Laser",MomentumMultiplier=1.400000)
   MomentumMultiplierByZedArray(17)=(ZedClassName="KFPawn_ZedDAR_Rocket",MomentumMultiplier=1.400000)
   MomentumMultiplierByZedArray(18)=(ZedClassName="KFPawn_ZedBloatKingSubspawn",MomentumMultiplier=1.000000)
   MomentumMultiplierByZedArray(19)=(ZedClassName="KFPawn_ZedHans",MomentumMultiplier=1.200000)
   MomentumMultiplierByZedArray(20)=(ZedClassName="KFPawn_ZedPatriarch",MomentumMultiplier=1.200000)
   MomentumMultiplierByZedArray(21)=(ZedClassName="KFPawn_ZedFleshpoundKing",MomentumMultiplier=1.200000)
   MomentumMultiplierByZedArray(22)=(ZedClassName="KFPawn_ZedBloatKing",MomentumMultiplier=1.200000)
   MomentumMultiplierByZedArray(23)=(ZedClassName="KFPawn_ZedMatriarch",MomentumMultiplier=1.200000)
   HolographicSightByChargeLevel(0)=(R=0.880000,G=0.360000,B=0.110000,A=0.920000)
   HolographicSightByChargeLevel(1)=(R=0.270000,G=0.500000,B=2.350000,A=0.920000)
   HolographicSightScanlineByChargeLevel(0)=(R=0.500000,G=0.960000,B=0.960000,A=0.920000)
   HolographicSightScanlineByChargeLevel(1)=(R=0.880000,G=0.360000,B=0.110000,A=0.920000)
   HolographicSightUseDefaultByChargeLevel(0)=False
   HolographicSightUseDefaultByChargeLevel(1)=False
   PackageKey="HRG_SonicGun"
   FirstPersonMeshName="wep_1p_hrg_sonicgun_mesh.WEP_1stP_HRG_SonicGun_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_hrg_sonicgun_anim.Wep_1stP_HRG_SonicGun_Anim"
   PickupMeshName="wep_3p_hrg_sonicgun_mesh.WEP_3rdP_HRG_SonicGun_Pickup"
   AttachmentArchetypeName="wep_hrg_sonicgun_arch.Wep_HRG_SonicGun_3P"
   MuzzleFlashTemplateName="WEP_HRG_SonicGun_ARCH.Wep_HRG_SonicGun_MuzzleFlash"
   bHasIronSights=True
   bWarnAIWhenAiming=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=7
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshFOV=75.000000
   MeshIronSightFOV=40.000000
   PlayerIronSightFOV=65.000000
   IronSightPosition=(X=10.000000,Y=-0.100000,Z=-0.200000)
   DOF_FG_MaxNearBlurSize=3.500000
   AimWarningDelay=(X=0.400000,Y=0.800000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_SonicGun_TEX.UI_WeaponSelect_HRG_SonicGun'
   MagazineCapacity(0)=12
   AmmoCost(1)=0
   SpareAmmoCapacity(0)=96
   InitialSpareMags(0)=1
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_BoltAssembly1"
   BonesToLockOnEmpty(1)="RW_BoltAssembly2"
   BonesToLockOnEmpty(2)="RW_BoltAssembly3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_3P_Fire_Bass',FirstPersonCue=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_1P_Fire_Bass')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_HRG_SonicGun.Play_WEP_HRG_SonicGun_DryFire'
   PlayerViewOffset=(X=11.000000,Y=8.000000,Z=-2.000000)
   NumBloodMapMaterials=2
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_SonicGun:MeleeHelper_0'
   EjectedShellForegroundDuration=1.500000
   maxRecoilPitch=200
   minRecoilPitch=150
   maxRecoilYaw=50
   minRecoilYaw=-50
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.100000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Add=2)))
   FiringStatesArray(0)="WeaponSonicGunSingleFiring"
   FiringStatesArray(1)="WeaponSonicGunCharging"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_SonicBlastUncharged_HRG_SonicGun'
   FireInterval(0)=0.500000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   InstantHitDamage(0)=125.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitMomentum(0)=200000.000000
   InstantHitMomentum(1)=()
   InstantHitMomentum(2)=()
   InstantHitMomentum(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_SonicGun_SonicBlastUncharged'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_SonicGun'
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
   ItemName="HRG Beluga Beat"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_SonicGun"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
