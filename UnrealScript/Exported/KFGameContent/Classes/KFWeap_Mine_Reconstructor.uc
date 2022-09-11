//=============================================================================
// KFWeap_Mine_Reconstructor
//=============================================================================
// KFWeap_Mine_Reconstructor weapon code based on HuskCannon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Fernando Ferrando @ saber3d
//=============================================================================
class KFWeap_Mine_Reconstructor extends KFWeapon;

//Props related to charging the weapon
var float MaxChargeTime;
var float ValueIncreaseTime;
var float DmgIncreasePerCharge;
var float AOEIncreasePerCharge;
var float IncapIncreasePerCharge;
var int AmmoIncreasePerCharge;

var transient float ChargeTime;
var transient float ConsumeAmmoTime;
var transient float MaxChargeLevel;

var ParticleSystem ChargingEffect;
var ParticleSystem ChargedEffect;

var const ParticleSystem MuzzleFlashEffectL3;

var transient ParticleSystemComponent FullyChargedPSC;
var transient ParticleSystemComponent ChargingPSC;
var transient bool bIsFullyCharged;

var const WeaponFireSndInfo FullyChargedSound;

var float SelfDamageReductionValue;

var float FullChargedTimerInterval;
var float FXScalingFactorByCharge, ChargePercentage;
var float MinScale, MaxScale;

var int MaxDamageByCharge;
var int MinDamageByCharge;

var private array<KFProj_Mine_Reconstructor> PoolOfMines;

const SecondaryFireAnim = 'Alt_Fire';
const SecondaryFireIronAnim = 'Alt_Fire_Iron';
const SecondaryFireAnimEmpty = 'Alt_Fire_Empty';
const SecondaryFireIronAnimEmpty = 'Alt_Fire_Iron_Empty';
var bool bHasToLaunchEmptyAnim;

var SkelControlSingleBone Control;

//var int iCounterA;

var bool bBlocked;

Replication
{
	if(Role == Role_Authority && bNetDirty)
		ChargeTime;
}

/******************************************************

		POOL BASED ON KFGAMEPOOLMANAGER

******************************************************/


/** The maximum global number of Mine Reconstructor Mines that can be active in play */
var protected const byte MAX_ACTIVE_MINE_RECONSTRUCTOR_MINES;

/** Determines the pool type and adds a new projectile to that pool */
function AddProjectileToPool( KFProj_Mine_Reconstructor Proj )
{
	AddProjectileToPool_Internal( PoolOfMines, Proj, MAX_ACTIVE_MINE_RECONSTRUCTOR_MINES );
}

/** Determines the pool type and removes a projectile from the pool */
function RemoveProjectileFromPool( KFProj_Mine_Reconstructor Proj )
{
	RemoveProjectileFromPool_Internal( PoolOfMines, Proj );
}

/** Add a projectile to its respective pool, removing the oldest if we are at the pool limit */
private function AddProjectileToPool_Internal( out array<KFProj_Mine_Reconstructor> PoolProjectiles, KFProj_Mine_Reconstructor Proj, byte MaxActiveProjectiles )
{
	if( PoolProjectiles.Length == MaxActiveProjectiles )
	{
		if( PoolProjectiles[0] != none )
		{
			PoolProjectiles[0].Detonate();
		}
		PoolProjectiles.Remove( 0, 1 );
	}

	PoolProjectiles.AddItem( Proj );
}

/** Remove a projectile from the pool (it's been destroyed) */
private function RemoveProjectileFromPool_Internal( out array<KFProj_Mine_Reconstructor> PoolProjectiles, KFProj_Mine_Reconstructor Proj)
{
	PoolProjectiles.RemoveItem( Proj );
}

/******************************************************

		END POOL BASED ON KFGAMEPOOLMANAGER

******************************************************/

/******************************************************

		RECOVER THE DATA FROM THE PICKUP

******************************************************/

/** Allows pickup to update weapon properties
  * Overridden to allow C4 to update charges
  */
function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	local int i, NumDeployedCharges;

	super.SetOriginalValuesFromPickup( PickedUpWeapon );

	PoolOfMines = KFWeap_Mine_Reconstructor(PickedUpWeapon).PoolOfMines;
	NumDeployedCharges = PoolOfMines.Length;
	bForceNetUpdate = true;

	for( i = 0; i < NumDeployedCharges; ++i )
	{
		// charge alerts (beep, light) need current instigator
		PoolOfMines[i].Instigator = Instigator;
        PoolOfMines[i].SetOwner(self);
		if( Instigator.Controller != none )
		{
			PoolOfMines[i].InstigatorController = Instigator.Controller;
		}
	}
}

/******************************************************

		END RECOVER THE DATA FROM THE PICKUP

******************************************************/

/****************************************************************

		CUSTOM FIREMODE (DELETE AL THE MINES OWNED BY THE WEAPON)

****************************************************************/

simulated function CustomFire()
{
	local int i, NumDeployedCharges;
	super.CustomFire();
	NumDeployedCharges = PoolOfMines.Length;
	bForceNetUpdate = true;

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

	if(NumDeployedCharges <= 0)
	{
		bHasToLaunchEmptyAnim = true;
		return;
	}

	for( i = 0; i < NumDeployedCharges; ++i )
	{
		
		if(PoolOfMines[i] == none) continue;

		PoolOfMines[i].Instigator = Instigator;
        PoolOfMines[i].SetOwner(self);
		if( Instigator.Controller != none )
		{
			PoolOfMines[i].ManuallyDetonate();
		}
	}
	PoolOfMines.Remove(0, PoolOfMines.Length);
	bHasToLaunchEmptyAnim = false;

}

/****************************************************************

		END CUSTOM FIREMODE (DELETE AL THE MINES OWNED BY THE WEAPON)

****************************************************************/


/*********************************************************************************************
 
 * 	CONTROL FOR AMMO TANK
 
********************************************************************************************* */

simulated event PostInitAnimTree( SkeletalMeshComponent SkelComp )
{
	local vector vec;
	local float fPercentage;

	super.PostInitAnimTree( SkelComp );

	Control = SkelControlSingleBone( SkelComp.FindSkelControl('AmmoControl') );
	if( Control != none )
	{
		Control.SetSkelControlActive( true );
	}

	
	//from 0 to -8
    // If AmmoCount is being replicated, don't allow the client to modify it here
	fPercentage = FMin((float(AmmoCount[0])/(MagazineCapacity[0])), 1);
	vec.X = Control.BoneTranslation.X;
   	vec.Y = Control.BoneTranslation.Y;
    vec.Z = Lerp(-8, 0, fPercentage);
	Control.BoneTranslation = vec;
}


/*********************************************************************************************
 
 * 	END CONTROL FOR AMMO TANK

********************************************************************************************* */

/**
* @see Weapon::ConsumeAmmo
*/
simulated function ConsumeAmmo(byte FireModeNum)
{
	local vector vec;
	local float fPercentage;
	
	//from 0 to -8
    // If AmmoCount is being replicated, don't allow the client to modify it here
    if (Role == ROLE_Authority)
    {
		fPercentage = FMin(float(AmmoCount[0])/(MagazineCapacity[0]), 1);
		super.ConsumeAmmo(FireModeNum);

		if(Control != none)
		{
			vec.X = Control.BoneTranslation.X;
   			vec.Y = Control.BoneTranslation.Y;
    		vec.Z = Lerp(-8, 0, fPercentage);
			Control.BoneTranslation = vec;
		}

		//Notify the client about the new percentage as the client is not tracking the ammo
		ClientUpdateVisualAmmo(fPercentage);
    }

	//function que modifque 
}

reliable client function ClientUpdateVisualAmmo(float BoneControlTranslation)
{
	local vector vec;

	if ( Role < ROLE_Authority && Control != none )
	{
		vec.X = Control.BoneTranslation.X;
   		vec.Y = Control.BoneTranslation.Y;
    	vec.Z = Lerp(-8, 0, BoneControlTranslation);
		Control.BoneTranslation = vec;
	}
}

simulated function BeginFire(Byte FireModeNum)
{
	super.BeginFire(FireModeNum);
}

simulated function StartFire(byte FiremodeNum)
{
	if (IsTimerActive('RefireCheckTimer') || bBlocked)
	{
		return;
	}
	if(Role != Role_Authority && FireModeNum == DEFAULT_FIREMODE && HasAmmo(DEFAULT_FIREMODE))
	{
		bBlocked = true;
		if(IsTimerActive(nameof(UnlockClientFire)))
		{
			ClearTimer(nameof(UnlockClientFire));
		}
	}

	super.StartFire(FiremodeNum);

	if ( PendingFire(RELOAD_FIREMODE) && Role != Role_Authority)
	{
		bBlocked = false;
	}


}

simulated function RefireCheckTimer()
{
	Super.RefireCheckTimer();
	if(bBlocked && Role != Role_Authority)
		SetTimer(0.25f , false, nameof(UnlockClientFire));
}

reliable client function UnlockClientFire()
{
		bBlocked = false;
}

simulated function EndFire(byte FiremodeNum)
{
	//`Log("EndFire");
	super.EndFire(FireModeNum);
}

simulated function OnStartFire()
{
	local KFPawn PawnInst;
	PawnInst = KFPawn(Instigator);

	if (PawnInst != none)
	{
		PawnInst.OnStartFire();
	}
}


simulated function FireAmmunition()
{

	//`Log("FireAmmunition"@iCounterA);
	//`Warn("ChargePercentage"@ChargePercentage);
	//++iCounterA;
	// Let the accuracy tracking system know that we fired
	HandleWeaponShotTaken(CurrentFireMode);

	// Handle the different fire types
	switch (WeaponFireTypes[CurrentFireMode])
	{
	case EWFT_InstantHit:
		// Launch a projectile if we are in zed time, and this weapon has a projectile to launch for this mode
		if ((self.WorldInfo.TimeDilation < 1.f) && WeaponProjectiles[CurrentFireMode] != none )
		{
			ProjectileFire();
		}
		else
		{
			InstantFireClient();
		}

		break;

	case EWFT_Projectile:
		ProjectileFire();
		break;

	case EWFT_Custom:
		CustomFire();
		break;
	}

	//// If we're firing without charging, still consume one ammo
	if (GetChargeLevel() < 1)
	{
		ConsumeAmmo(CurrentFireMode);
	}

	NotifyWeaponFired(CurrentFireMode);

	// Play fire effects now (don't wait for WeaponFired to replicate)
	//PlayFireEffects(CurrentFireMode, vect(0, 0, 0));
}

simulated function ANIMNOTIFY_FILLMAG()
{
	local vector vec;
	vec.X = Control.BoneTranslation.X;
   	vec.Y = Control.BoneTranslation.Y;
    vec.Z = 0;
	Control.BoneTranslation = vec;
}

simulated state MineReconstructorCharge extends WeaponFiring
{
    //For minimal code purposes, I'll directly call global.FireAmmunition after charging is released
    simulated function FireAmmunition()
    {
		return;
	}

    //Store start fire time so we don't have to timer this
    simulated event BeginState(Name PreviousStateName)
    {
		local KFPerk InstigatorPerk;

        super.BeginState(PreviousStateName);


		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none )
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}

		ChargeTime = 0;
		ConsumeAmmoTime = 0;
		MaxChargeLevel = int(MaxChargeTime / ValueIncreaseTime);

		if (ChargingPSC == none)
		{
			ChargingPSC = new(self) class'ParticleSystemComponent';

			if(MySkelMesh != none)
			{
				MySkelMesh.AttachComponentToSocket(ChargingPSC, 'MuzzleFlash');
			}
			else
			{
				AttachComponent(ChargingPSC);
			}
		}
		else
		{
			ChargingPSC.ActivateSystem();
		}

		bIsFullyCharged = false;

		global.OnStartFire();

		if(ChargingPSC != none)
		{
			ChargingPSC.SetTemplate(ChargingEffect);
		}
		ChargeTime = 0;
		FXScalingFactorByCharge = 0;
		//ConsumeAmmo(CurrentFireMode);
    }

	simulated function bool ShouldRefire()
	{
		// ignore how much ammo is left (super/global counts ammo)
		return StillFiring(CurrentFireMode);
	}

    simulated event Tick(float DeltaTime)
    {
        local float ChargeRTPC;
		local float InstantHitDamageValue;

		global.Tick(DeltaTime);

		if(bIsFullyCharged) return;

		// Don't charge unless we're holding down the button
		if (PendingFire(CurrentFireMode))
		{
			ConsumeAmmoTime += DeltaTime;
		}

		if (bIsFullyCharged)
		{
			if (ConsumeAmmoTime >= FullChargedTimerInterval)
			{
				ConsumeAmmo(DEFAULT_FIREMODE);
				ConsumeAmmoTime -= FullChargedTimerInterval;
			}

			return;
		}

		// Don't charge unless we're holding down the button
		if (PendingFire(CurrentFireMode))
		{

			if(Role == Role_Authority && !bIsFullyCharged)
			{
				ChargeTime += DeltaTime;
				bNetDirty = true;
			}
			
			if( ChargingPSC != none && !bIsFullyCharged)
			{
				FXScalingFactorByCharge = FMin(Lerp(MinScale, MaxScale, ChargeTime / MaxChargeTime), MaxScale);
				ChargePercentage = FMin(ChargeTime / MaxChargeTime, 1);

				if(ChargePercentage < 0.1f)
				{
					InstantHitDamageValue = Lerp(MinDamageByCharge, MaxDamageByCharge, 0.1f);
				}
				else
				{
					InstantHitDamageValue = Lerp(MinDamageByCharge, MaxDamageByCharge, ChargePercentage);
				}
				InstantHitDamage[DEFAULT_FIREMODE] = InstantHitDamageValue;

				ChargingPSC.SetFloatParameter( name("InflateBlob"), ChargePercentage );
				if(ChargePercentage > 0.51f)
					InstantHitDamageTypes[DEFAULT_FIREMODE]=class'KFDT_Toxic_MineReconstructorImpactHeavy';
				else
					InstantHitDamageTypes[DEFAULT_FIREMODE]=class'KFDT_Toxic_MineReconstructorImpact';

			}
		}

		ChargeRTPC = FMin(ChargeTime / MaxChargeTime, 1.f);
        KFPawn(Instigator).SetWeaponComponentRTPCValue("Weapon_Charge", ChargeRTPC); //For looping component
        Instigator.SetRTPCValue('Weapon_Charge', ChargeRTPC); //For one-shot sounds
		
		if (ConsumeAmmoTime >= ValueIncreaseTime && !bIsFullyCharged)
		{
			ConsumeAmmo(DEFAULT_FIREMODE);
			ConsumeAmmoTime -= ValueIncreaseTime;
		}

		if (ChargeTime >= MaxChargeTime || !HasAmmo(DEFAULT_FIREMODE))
		{
			bIsFullyCharged = true;
			//ChargingPSC.SetTemplate(ChargedEffect);
			if(( Instigator.Role != ROLE_Authority ))
			{
				if (FullyChargedPSC == none)
				{
					FullyChargedPSC = new(self) class'ParticleSystemComponent';
	
					if(MySkelMesh != none)
					{
						MySkelMesh.AttachComponentToSocket(FullyChargedPSC, 'MuzzleFlash');
					}
					else
					{
						AttachComponent(FullyChargedPSC);
					}
				}
				else
				{
					FullyChargedPSC.ActivateSystem();
				}
	
				FullyChargedPSC.SetTemplate(ChargedEffect);
	
	
				KFPawn(Instigator).SetWeaponAmbientSound(FullyChargedSound.DefaultCue, FullyChargedSound.FirstPersonCue);
			}
		}

    }

    //Now that we're done charging, directly call FireAmmunition. This will handle the actual projectile fire and scaling.
    simulated event EndState(Name NextStateName)
    {

		if(Role == Role_Authority)
			UnlockClientFire();

		ClearZedTimeResist();
        ClearPendingFire(CurrentFireMode);
		ClearTimer(nameof(RefireCheckTimer));

		KFPawn(Instigator).bHasStartedFire = false;
		KFPawn(Instigator).bNetDirty = true;

		if (ChargingPSC != none)
		{
			ChargingPSC.DeactivateSystem();
		}

		if (FullyChargedPSC != none)
		{
			FullyChargedPSC.DeactivateSystem();
		}

		KFPawn(Instigator).SetWeaponAmbientSound(none);
    }

	simulated function HandleFinishedFiring()
	{
		global.FireAmmunition();

		if (bPlayingLoopingFireAnim)
		{
			StopLoopingFireEffects(CurrentFireMode);
		}

		// Simulate weapon firing effects on the local client
		if (WorldInfo.NetMode == NM_Client)
		{
			Instigator.WeaponStoppedFiring(self, false);

			if (FullyChargedPSC != none)
			{
				FullyChargedPSC.DeactivateSystem();
			}

		}

		ClearFlashCount();
		ClearFlashLocation();

		NotifyWeaponFinishedFiring(CurrentFireMode);

		super.HandleFinishedFiring();
		//`Log("ChargePercentage"@ChargePercentage);

	}

	simulated function PutDownWeapon()
	{

		global.FireAmmunition();

		if (bPlayingLoopingFireAnim)
		{
			StopLoopingFireEffects(CurrentFireMode);
		}

		// Simulate weapon firing effects on the local client
		if (WorldInfo.NetMode == NM_Client)
		{
			Instigator.WeaponStoppedFiring(self, false);

			if (FullyChargedPSC != none)
			{
				FullyChargedPSC.DeactivateSystem();
			}

		}

		ClearFlashCount();
		ClearFlashLocation();

		NotifyWeaponFinishedFiring(CurrentFireMode);

		if(Role == Role_Authority)
			UnlockClientFire();

		super.PutDownWeapon();
	}
}

// Placing the actual Weapon Firing end state here since we need it to happen at the end of the actual firing loop.
simulated function Timer_StopFireEffects()
{

}

simulated state Active
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		if(Role == Role_Authority)
			UnlockClientFire();
	}

}


simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
    local KFProj_Mine_Reconstructor Mine;

    Mine = KFProj_Mine_Reconstructor(super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir));
    //Calc and set scaling values
    if (Mine != none)
    {
		AddProjectileToPool(Mine);
		ChargePercentage = FMax(0.1, ChargePercentage);
		FXScalingFactorByCharge = FMax(0.1, FXScalingFactorByCharge);
		Mine.SetInheritedScale(FXScalingFactorByCharge, ChargePercentage);
        return Mine;
    }
    return none;
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if (MuzzleFlash == None)
	{
		AttachMuzzleFlash();
	}

	if (MuzzleFlash != none)
	{
		/*MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL3;
		MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL3);*/
	}

	super.CauseMuzzleFlash(FireModeNum);
}

simulated function int GetChargeLevel()
{
	return Min(ChargeTime / ValueIncreaseTime, MaxChargeLevel);
}

/****************************************************************

		TRADER FUNCTIONS

****************************************************************/

static simulated event EFilterTypeUI GetTraderFilter()
{
    return FT_Flame;
}

static simulated function float CalculateTraderWeaponStatDamage()
{
	local float CalculatedDamage;
	local class<KFDamageType> DamageType;
	local GameExplosion ExplosionInstance;

	ExplosionInstance = class<KFProjectile>(default.WeaponProjectiles[DEFAULT_FIREMODE]).default.ExplosionTemplate;

	CalculatedDamage = default.InstantHitDamage[DEFAULT_FIREMODE] + ExplosionInstance.Damage;

	DamageType = class<KFDamageType>(ExplosionInstance.MyDamageType);
	if (DamageType != none && DamageType.default.DoT_Type != DOT_None)
	{
		CalculatedDamage += (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (CalculatedDamage * DamageType.default.DoT_DamageScale);
	}

	return CalculatedDamage;
}

/****************************************************************

		END TRADER FUNCTIONS

****************************************************************/

/****************************************************************

		PAWN ADJUST DAMAGE

****************************************************************/

// increase the instant hit damage based on the charge level
simulated function int GetModifiedDamage(byte FireModeNum, optional vector RayDir)
{
	local int ModifiedDamage;
	ModifiedDamage = super.GetModifiedDamage(FireModeNum, RayDir);
	return ModifiedDamage;
}

/** We avoid alternating between firemodes and directly altfire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/****************************************************************

		END PAWN ADJUST DAMAGE

****************************************************************/

state WeaponSingleFiring
{
	/** Get whether we should play the reload anim as well or not */
	local name Returned;
	simulated function name GetWeaponFireAnim(byte FireModeNum)
	{
		if(bUsingSights)
		{
			Returned = (bHasToLaunchEmptyAnim == false) ? SecondaryFireIronAnim : SecondaryFireIronAnimEmpty ;
			return Returned;
		}
		else
		{
			Returned = (bHasToLaunchEmptyAnim == false) ? SecondaryFireAnim : SecondaryFireAnimEmpty ;;
			return Returned;
		}
	}
}

defaultproperties
{
   MaxChargeTime=1.200000
   ValueIncreaseTime=0.200000
   AmmoIncreasePerCharge=1
   ChargingEffect=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bile_BlobCharge_01'
   ChargedEffect=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Mine_Reconstructor_FullCharge'
   MuzzleFlashEffectL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_MuzzleFlash_L3_1P'
   FullyChargedSound=(DefaultCue=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Charged_3P',FirstPersonCue=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Charged')
   SelfDamageReductionValue=0.100000
   FullChargedTimerInterval=2.000000
   MinScale=0.500000
   MaxScale=1.500000
   MaxDamageByCharge=200
   MinDamageByCharge=25
   MAX_ACTIVE_MINE_RECONSTRUCTOR_MINES=12
   PackageKey="Mine_Reconstructor"
   FirstPersonMeshName="WEP_1P_Mine_Reconstructor_MESH.Wep_1stP_HMTech_Mine_Reconstructor_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Mine_Reconstructor_ANIM.Wep_1stP_Mine_Reconstructor_Anim"
   PickupMeshName="WEP_3P_Mine_Reconstructor_MESH.Wep_3rdP_Mine_Reconstructor_Lowpoly_Pickup"
   AttachmentArchetypeName="WEP_Mine_Reconstructor_Arch.Wep_Mine_Reconstructor_3P"
   MuzzleFlashTemplateName="WEP_Mine_Reconstructor_Arch.Wep_Mine_Reconstructor_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bAllowClientAmmoTracking=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
   FireModeIconPaths(1)=()
   InventorySize=8
   MeshFOV=80.000000
   MeshIronSightFOV=65.000000
   PlayerIronSightFOV=50.000000
   QuickWeaponDownRotation=(Pitch=-19192,Yaw=-11500,Roll=16384)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   GroupPriority=80.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Mine_Reconstructor_TEX.UI_WeaponSelect_HMTechMineReconstructor'
   MagazineCapacity(0)=12
   AmmoCost(1)=0
   SpareAmmoCapacity(0)=96
   InitialSpareMags(0)=2
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
   bLoopingFireAnim(0)=True
   bLoopingFireAnim(1)=False
   bLoopingFireSnd(0)=True
   bLoopingFireSnd(1)=False
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_3P_Start',FirstPersonCue=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_1P_Start')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_3P_Shoot',FirstPersonCue=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_1P_Shoot')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
   PlayerViewOffset=(X=0.000000,Y=12.000000,Z=-1.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Mine_Reconstructor:MeleeHelper_0'
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Add=2)))
   FiringStatesArray(0)="MineReconstructorCharge"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Mine_Reconstructor'
   FireInterval(0)=0.330000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(0)=120.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Toxic_MineReconstructorImpact'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Mine_Reconstructor'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'WEP_Mine_Reconstructor_Arch.WEP_1stP_Animtree_MineReconstructor'
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
   ItemName="Mine Reconstructor"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Mine_Reconstructor"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
