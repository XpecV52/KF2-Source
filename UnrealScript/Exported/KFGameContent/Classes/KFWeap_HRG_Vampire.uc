//=============================================================================
// KFWeap_HRG_Vampire
//=============================================================================
// A gun that sucks zeds blood and use it against them
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// FFerrando @ saber3d
//=============================================================================
/*

 */
class KFWeap_HRG_Vampire extends KFWeap_FlameBase;
//START BLOOD BALL PROPERTIES
//Props related to charging the weapon
//var float MaxChargeTime;
var float MaxChargeAmmo;
var float ChargeSpeed;

/** While ChargeTime is below this threshold, a static min damage value (MinDamageByCharge) will be used for BloodBall instant damage */
var float MinDamageWhileChargingThreshold; 

var float ValueIncreaseTime;
var float DmgIncreasePerCharge;
var float AOEIncreasePerCharge;
var float IncapIncreasePerCharge;

var transient float ChargeTime;
var transient float CurrentCharge;
var transient float CurrentChargeOrigin;
var transient float CurrentChargeDesired;
var transient float CurrentChargeAmmo;
var transient float CurrentChargeAccumulatedTime;
var transient float CurrentChargeForBloodBallProjectile;

var ParticleSystem ChargingEffect;
var ParticleSystem ChargedEffect;
var ParticleSystem BloodStolenEffect;

var const ParticleSystem MuzzleFlashEffectL3;

var transient ParticleSystemComponent FullyChargedPSC;
var transient ParticleSystemComponent ChargingPSC;

var KFEmit_DirectionalPath BloodStolenParticles[15];
var int NumBloodStolenParticlesForPool;

var float SpeedBloodParticlesDefault;
var float SpawnRateBloodParticlesDefault;
var float HalfAngleSpawnConeDefault;
var float CurveTurnRateUntilDestinationMidPointDefault;
var float CurveTurnRateUntilDestinationFinalDefault;
var float LimitDistanceMidPointDefault;
var float LimitDistanceFinalPointDefault;

var transient float BloodStolenControlTime;

//var transient bool bIsFullyCharged;
var transient bool bHasCharged;

var const WeaponFireSndInfo FullyChargedSound;

var const WeaponFireSndInfo ChargingSound;
var const WeaponFireSndInfo ChargedSound;

var const WeaponFireSndInfo BloodSuctionStartSound;

var const WeaponFireSndInfo BloodSuctionEndSound;

var const WeaponFireSndInfo BloodSuctionLoopNoAmmoAndBloodBallChargedSound;

var bool bIsSprayDisabled;

var float SelfDamageReductionValue;

var float FullChargedTimerInterval;
var float ChargePercentage;

/** Value used to lerp projectile damage and scale depending on if ChargePercentage has surpassed MinDamageWhileChargingThreshold */
var float DamageByChargePercentage;

var float MinScale, MaxScale;

var int MaxDamageByCharge;
var int MinDamageByCharge;

const SecondaryFireAnim = 'Alt_Fire';
const SecondaryFireIronAnim = 'Alt_Fire_Iron';
const SecondaryFireAnimEmpty = 'Alt_Fire_Empty';
const SecondaryFireIronAnimEmpty = 'Alt_Fire_Iron_Empty';
var bool bHasToLaunchEmptyAnim;

var SkelControlSingleBone Control;


var bool bBlocked;
//END BLOOD BALL PROPERTIES


/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst	name	FireHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst	name	FireLastHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst	name	FireLastHeavySightedAnim;

/** Alt-fire explosion template */
var() GameExplosion 		ExplosionTemplate;

//var float MaxChargeTime, ChargePercentage, ChargeTime;
//var bool bIsFullyCharged;

var float ReplenishingAmmoOnSuctioningTime;
var float ReplenishingAmmoOnSuctioningInterval;
var int ReplenishingAmmoOnSuctioningCount;

var class<KFProjectile> BloodBallProjClass;

var float SpeedBloodParticles;
var float SpawnRateBloodParticles;
var float HalfAngleSpawnCone;
var float CurveTurnRateUntilDestinationMidPoint;
var float CurveTurnRateUntilDestinationFinal;
var float LimitDistanceMidPoint;
var float LimitDistanceFinalPoint;
var float RateUpdateDestinationBloodParticles;
var transient float UpdateDestinationBloodParticlesTime;

var int InitialAmmoSecondaryCount;

/** Variables to scale ammo cost on primary fire (so we can use "floats" on ammo and make ammo has no cost or small cost when no hitting zeds) */
var float AmmoCostScaleDefaultFiremode;
var float AmmoCostAccumulated;

/** Simulate delay in start charging like waiting for first blood particle to arrive */
var transient bool bFirstBloodParticleCreated;
var transient float DelayUntilStartCharging;
var float  ScaleDelayUntilStartCharging;
var transient float  CurrentStartChargingTime;
var transient bool bIsAlreadyInitializedFX;

var class<KFProj_BloodSplash> BloodSplashClass;

var transient float TimesConsumeAmmoCalled;

var transient bool bIsFullCharged;//Only for using in 1p
var transient bool bIsChargingSoundStarted;//Only for using in authority

Replication
{
	if(bNetDirty)
		oZedCurrentlyBeingSprayed, ChargeTime, ClientCurrentChargeDesired;
	if (bNetDirty && !bNetOwner)
		ClientChargePercentage, bClientDisableSprayVisualAndMesh;
}

var KFPawn_Monster oZedPreviouslyBeingSprayed;
/**************************** HRG SPRAY STUFF*/ 

var repnotify KFPawn_Monster oZedCurrentlyBeingSprayed;
var repnotify float ClientChargePercentage;
var repnotify float ClientCurrentChargeDesired;
var repnotify bool bClientDisableSprayVisualAndMesh;

/*********************** */

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ClientChargePercentage))
	{
		NotifyChargePercentage(ClientChargePercentage);
	}
	if (VarName == nameof(oZedCurrentlyBeingSprayed))
	{
		NotifyZedCurrentlyBeingSprayed(oZedCurrentlyBeingSprayed);
	}
	if (VarName == nameof(bClientDisableSprayVisualAndMesh) && bClientDisableSprayVisualAndMesh)
	{
		NotifyDisableSprayVisualAndMesh();
	}
	if (VarName == nameof(ClientCurrentChargeDesired))
	{
		CurrentChargeDesired = ClientCurrentChargeDesired;
	}

	Super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
	local KFPawn_Human KFPH;
	local int Index;

	super.PostBeginPlay();

	AmmoCostAccumulated = 0;

	KFPH = KFPawn_Human(Instigator);
	bIsAlreadyInitializedFX = false;
	if (WorldInfo.NetMode == NM_DedicatedServer || (KFPH != none && !KFPH.IsFirstPerson()))
	{
		return;
	}

	UpdateDestinationBloodParticlesTime = RateUpdateDestinationBloodParticles;
	bFirstBloodParticleCreated = false;
	CurrentStartChargingTime = DelayUntilStartCharging * ScaleDelayUntilStartCharging;

	for( Index = (NumBloodStolenParticlesForPool - 1) ; Index >= 0 ; Index-- )
	{
		BloodStolenParticles[Index] = Spawn(class'KFEmit_DirectionalPath');
		BloodStolenParticles[Index].SetTemplate(BloodStolenEffect, true);
		//BloodStolenParticles[Index].IsEnabled=false;
		BloodStolenParticles[Index].DeactivateEmitter();
	}

}

simulated event Tick(float DeltaTime)
{
	return;
}

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if ( FireModeNum == CUSTOM_FIREMODE )
	{
		return FireLoopEndAnim;
	}

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

/** Disable auto-reload for alt-fire */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	local bool bRequestReload;

    bRequestReload = Super.ShouldAutoReload(FireModeNum);

    // Must be completely empty for auto-reload or auto-switch
    if ( FireModeNum == ALTFIRE_FIREMODE && AmmoCount[DEFAULT_FIREMODE] > 0 )
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


simulated protected function TurnOnPilot()
{
	Super.TurnOnPilot();

	if( FlamePool[0] != None && KFSprayActor_HRG_Vampire(FlamePool[0]) != None && KFSprayActor_HRG_Vampire(FlamePool[0]).OwnerWeapon == None)
	{
		KFSprayActor_HRG_Vampire(FlamePool[0]).OwnerWeapon = self;
	}
	if( FlamePool[1] != None && KFSprayActor_HRG_Vampire(FlamePool[1]) != None && KFSprayActor_HRG_Vampire(FlamePool[1]).OwnerWeapon == None)
	{
		KFSprayActor_HRG_Vampire(FlamePool[1]).OwnerWeapon = self;
	}
}

simulated function float FlameHeatCalc()
{
	//hack in order to make the arc gen always glow
	LastBarrelHeat = 1.0f;
	return 1.0f;
}
 
simulated function SetCurrentSprayedZed(KFPawn_Monster _Monster)
{
	if(role != role_authority && WorldInfo.NetMode != NM_ListenServer && WorldInfo.NetMode != NM_StandAlone)
	{
		return;
	}

	oZedPreviouslyBeingSprayed = oZedCurrentlyBeingSprayed;
	oZedCurrentlyBeingSprayed = _Monster;
	bNetDirty=true;
	AmmoCostScaleDefaultFiremode=1.0;

	if (oZedCurrentlyBeingSprayed == none || !oZedCurrentlyBeingSprayed.IsAliveAndWell())
	{
		AmmoCostScaleDefaultFiremode=default.AmmoCostScaleDefaultFiremode;
	}
}

/**
 * Drop this item out in to the world
 */
function DropFrom(vector StartLocation, vector StartVelocity)
{
	super.DropFrom(StartLocation, StartVelocity);
	self.SetTickIsDisabled(true);
}

function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	self.SetTickIsDisabled(false);
}

/**
 * Functions to notify KFWeapAttach (used for 3P FX) about state
 */
simulated function NotifyChargePercentage(float ChargePercentageNotified)
{
	local KFPawn KFPawn;
	local KFWeapAttach_HRG_Vampire KFWeapAttach;

	KFPawn = KFPawn(Instigator);
	KFWeapAttach = KFWeapAttach_HRG_Vampire(KFPawn.WeaponAttachment);

	if(KFWeapAttach != none)
	{
		KFWeapAttach.SetChargePercentage(ChargePercentageNotified);
	}
}

simulated function NotifyZedCurrentlyBeingSprayed(KFPawn_Monster Monster)
{
	local KFPawn KFPawn;
	local KFWeapAttach_HRG_Vampire KFWeapAttach;

	KFPawn = KFPawn(Instigator);
	KFWeapAttach = KFWeapAttach_HRG_Vampire(KFPawn.WeaponAttachment);

	if(KFWeapAttach != none)
	{
		KFWeapAttach.SetZedCurrentlyBeingSprayed(Monster);
	}
}

simulated function NotifyDisableSprayVisualAndMesh()
{
	local KFPawn KFPawn;
	local KFWeapAttach_HRG_Vampire KFWeapAttach;

	KFPawn = KFPawn(Instigator);
	KFWeapAttach = KFWeapAttach_HRG_Vampire(KFPawn.WeaponAttachment);

	if(KFWeapAttach != none)
	{
		KFWeapAttach.DisableSprayVisualAndMesh();
	}
}


simulated function CreateBloodParticle(KFPawn_Monster Monster)
{
	Local KFEmit_DirectionalPath Emitter;
	local vector DestinationLocation, MonsterLocation, BloodParticlesMidPointSocketLocation;
	local Rotator DestinationRotation, BloodParticlesMidPointSocketRotation;
	local vector BloodSplashVelocity;
	local int Index;
	
	if (!IsInState('FiringSuctioning'))
	{
		return;
	}
	Emitter = none;
	for( Index = (NumBloodStolenParticlesForPool - 1) ; Index >= 0 ; Index-- )
	{
		if(BloodStolenParticles[Index].IsEnabled == false)
		{
			Emitter = BloodStolenParticles[Index];
			break;
		}		
	}	

	if(Emitter == none)
	{
		return;
	}

	if(MySkelMesh != none)
	{
		GetFlameSocketLocAndRot(DestinationLocation, DestinationRotation);
		MySkelMesh.GetSocketWorldLocationAndRotation('BloodParticlesMidPoint', BloodParticlesMidPointSocketLocation, BloodParticlesMidPointSocketRotation);
	}


	MonsterLocation = ActiveFlameSpray.GetLastContactPositionMeshHit();
	if (IsZero(MonsterLocation))
	{
		Monster.Mesh.GetBoneLocation('Spine1');
	}


	if(MonsterLocation == vect(0,0,0))
	{
		MonsterLocation = Monster.Location + vect(0,0,20);
	}


	if (FRand() > 0.4)
	{
		BloodSplashVelocity = BloodParticlesMidPointSocketLocation - MonsterLocation;
		BloodSplashVelocity = VRandCone(vect(0,0,-1), PI / 5) * 100;
		SpawnBloodSplash(BloodSplashClass, MonsterLocation, BloodSplashVelocity);
	}


	//Emitter = Spawn(class'KFEmit_DirectionalPath',,, MonsterLocation);
	
	Emitter.ParticleSpeed = SpeedBloodParticles;
	//BloodStolenParticles.AddItem(Emitter);

	Emitter.SetLocation(MonsterLocation);
	Emitter.SetDestination( DestinationLocation,
							BloodParticlesMidPointSocketLocation,
							LimitDistanceFinalPoint,
							LimitDistanceMidPoint,
							CurveTurnRateUntilDestinationFinal,
							CurveTurnRateUntilDestinationMidPoint,
							HalfAngleSpawnCone);
	
	Emitter.ActivateEmitter();




	//Emitter.isEnabled = true;
	
}

simulated function SpawnBloodSplash( class<KFProj_BloodSplash> SpawnClass, vector SpawnLoc, vector SpawnVel )
{
	local TraceHitInfo HitInfo;
	local vector HitLocation, HitRotation;
	local KFGoreManager GoreManager;

	// Grab the gore manager
	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if (GoreManager == none || oZedCurrentlyBeingSprayed == none)
	{
		return;
	}

	//EffectStartTrace = Location + vect(0,0,1) * 4.f;
	//EffectEndTrace = EffectStartTrace - vect(0,0,1) * 32.f;

    // Find where to put the decal
	Trace(HitLocation, HitRotation, SpawnLoc + SpawnVel * 32.f, SpawnLoc, false,, HitInfo, TRACEFLAG_Bullet);
	//DrawDebugLine(SpawnLoc,SpawnLoc + SpawnVel * 32.f,0,255,0,TRUE);

	// If the locations are zero (probably because this exploded in the air) set defaults
    if( IsZero(HitLocation) )
    {
        HitLocation = Location;
    }

	if( IsZero(HitRotation) )
    {
        HitRotation = vect(0,0,1);
    }


	//Put the decals
	GoreManager.LeaveABloodSplatterDecal(oZedCurrentlyBeingSprayed, HitLocation, HitRotation);

	//GoreManager. LeaveAPersistentBloodSplat(HitLocation, HitNormal, 1.0);

	if (oZedCurrentlyBeingSprayed != none)
	{
		GoreManager.CausePersistentBlood(oZedCurrentlyBeingSprayed, class'KFDamageType', HitLocation, vect(0,0,-1), 0, false, false);
	}
}

simulated function RemoveAllBloodParticles()
{
	local int Index;
	local KFEmit_DirectionalPath EmitterToRemove;

	for( Index = (NumBloodStolenParticlesForPool - 1) ; Index >= 0 ; Index-- )
	{
		EmitterToRemove = BloodStolenParticles[Index];
		//BloodStolenParticles.Remove(Index, 1);
		EmitterToRemove.DeactivateEmitter();
	}
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

simulated function InitBloodBallFX()
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

		FullyChargedPSC.SetTemplate(ChargedEffect);
	}

	FullyChargedPSC.SetActive( false );

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
		ChargingPSC.SetTemplate(ChargingEffect);
	}

	ChargingPSC.SetActive( false );
}

// Placing the actual Weapon Firing end state here since we need it to happen at the end of the actual firing loop.
simulated function Timer_StopFireEffects()
{
	// Simulate weapon firing effects on the local client
	if (WorldInfo.NetMode == NM_Client)
	{
		Instigator.WeaponStoppedFiring(self, false);
	}

	ClearFlashCount();
	ClearFlashLocation();
}

simulated function name GetLoopEndFireAnim(byte FireModeNum)
{
	if (FireModeNum == DEFAULT_FIREMODE)
	{
		return '';
	}

	return super.GetLoopEndFireAnim(FireModeNum);
}

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
    local KFProj_BloodBall_HRG_Vampire BloodBall;
	local KFProjectile Projectile;
	Projectile = super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    BloodBall = KFProj_BloodBall_HRG_Vampire(Projectile);
    //Calc and set scaling values
    if (BloodBall != none)
    {
		BloodBall.SetInheritedScale(CurrentChargeForBloodBallProjectile, DamageByChargePercentage);
        return BloodBall;
    }
	//If reaches here, projectile will be CRYSTALIZED SPIKE
    return Projectile;
}

simulated function DisableRecoil()
{
	maxRecoilPitch = 0;
	minRecoilPitch = 0;
	maxRecoilYaw = 0;
	minRecoilYaw = 0;
}

simulated function RestoreRecoil()
{
	maxRecoilPitch = default.maxRecoilPitch;
	minRecoilPitch = default.minRecoilPitch;
	maxRecoilYaw = default.maxRecoilYaw;
	minRecoilYaw = default.minRecoilYaw;
}

function InitializeAmmo()
{
	super.InitializeAmmo();
	AmmoCount[1] = InitialAmmoSecondaryCount;
}

simulated function ConsumeAmmo( byte FireModeNum )
{
	local byte AmmoType;
    local KFPerk InstigatorPerk;

	if (FireModeNum == DEFAULT_FIREMODE)
	{
		//Code from super.ConsumeAmmo()







		AmmoType = GetAmmoType(FireModeNum);

		InstigatorPerk = GetPerk();
		if( InstigatorPerk != none && InstigatorPerk.GetIsUberAmmoActive( self ) )
		{
			return;
		}

		TimesConsumeAmmoCalled+=AmmoCost[FireModeNum];

		// If AmmoCount is being replicated, don't allow the client to modify it here
		if ( Role == ROLE_Authority || bAllowClientAmmoTracking )
		{
			// Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
			if (MagazineCapacity[AmmoType] > 0 && AmmoCount[AmmoType] > 0)
			{
				AmmoCostAccumulated += AmmoCost[FireModeNum] * AmmoCostScaleDefaultFiremode;
				CurrentChargeDesired = FMin(1.0, (float(AmmoConsumed) + AmmoCostAccumulated) / MaxChargeAmmo);
				if (CurrentChargeDesired > 0)
				{
					bHasCharged = true;
				}
				if (WorldInfo.NetMode == NM_DedicatedServer)
				{
					ClientCurrentChargeDesired = CurrentChargeDesired;
				}

				if (AmmoCostAccumulated >= AmmoCost[FireModeNum])
				{
					AmmoCostAccumulated=0;
					AmmoConsumed+=AmmoCost[CurrentFireMode];
					CurrentChargeDesired = FMin(1.0, float(AmmoConsumed) / MaxChargeAmmo);
					if (WorldInfo.NetMode == NM_DedicatedServer)
					{
						ClientCurrentChargeDesired = CurrentChargeDesired;
					}
					// Ammo cost needs to be firemodenum because it is independent of ammo type.
					AmmoCount[AmmoType] = Max(AmmoCount[AmmoType] - AmmoCost[FireModeNum], 0);
				}
			}
		}
		return;
	}
	else
	{
		super.ConsumeAmmo(FireModeNum);
	}
}

simulated function Timer_CreateBloodParticle()
{
	if (oZedCurrentlyBeingSprayed != none  && oZedCurrentlyBeingSprayed.IsAliveAndWell())
	{
		CreateBloodParticle(oZedCurrentlyBeingSprayed);
	}
}

simulated state FiringSuctioning extends SprayingFire
{
	// Overriden to not call FireAmmunition right at the start of the state
	simulated event BeginState( Name PreviousStateName )
	{
		Super.BeginState(PreviousStateName);
		NotifyBeginState();
		if ( KFPawn(Owner).IsLocallyControlled() )
		{
			PlaySoundBase(BloodSuctionStartSound.FirstPersonCue);
		}
		else
		{
			PlaySoundBase(BloodSuctionStartSound.DefaultCue);
		}
		CurrentCharge = 0;
		bHasCharged = false;
		global.OnStartFire();

		bIsSprayDisabled = false;
		AmmoCostScaleDefaultFiremode=default.AmmoCostScaleDefaultFiremode;
		CurrentCharge = 0;
		CurrentChargeOrigin = 0;
		CurrentChargeDesired = 0;
		CurrentChargeForBloodBallProjectile = 0;

		if (WorldInfo.NetMode == NM_DedicatedServer)
		{
			ClientCurrentChargeDesired = 0;
		}
		TimesConsumeAmmoCalled = 0;
		bIsChargingSoundStarted = false;
	}

	simulated function EndState(Name NextStateName)
	{
		local KFPawn_Human KFPH;

		Super.EndState(NextStateName);
		NotifyEndState();

		ClearZedTimeResist();
        ClearPendingFire(CurrentFireMode);
		ClearTimer(nameof(RefireCheckTimer));

		KFPawn(Instigator).bHasStartedFire = false;
		KFPawn(Instigator).bNetDirty = true;

		if (oZedCurrentlyBeingSprayed == None || !oZedCurrentlyBeingSprayed.IsAliveAndWell())
		{
			if ( KFPawn(Owner).IsLocallyControlled() )
			{
				PlaySoundBase(BloodSuctionEndSound.FirstPersonCue);
			}
			else
			{
				PlaySoundBase(BloodSuctionEndSound.DefaultCue);
			}
		}

		KFPawn(Instigator).SetWeaponAmbientSound(none);
		KFPawn(Instigator).SetSecondaryWeaponAmbientSound(none);

		//BLOOD PARTICLES AND BALL MANAGEMENT
		KFPH = KFPawn_Human(Instigator);
		if (!(WorldInfo.NetMode == NM_DedicatedServer) || !(KFPH != none && !KFPH.IsFirstPerson()))
		{
			RemoveAllBloodParticles();
			CurrentChargeAccumulatedTime = 0;
			if( ChargingPSC != none)
			{
				ChargingPSC.SetActive( false );
			}
			if (FullyChargedPSC != none)
			{
				FullyChargedPSC.SetActive( false );
			}
		}

		CurrentChargeForBloodBallProjectile = CurrentChargeDesired;
		CurrentCharge = 0;
		CurrentChargeOrigin = 0;
		CurrentChargeDesired = 0;
	}

	simulated function bool ShouldRefire()
	{
		if (!HasAmmo(CurrentFireMode))
		{
			return StillFiring(CurrentFireMode);
		}
		return StillFiring(CurrentFireMode) || TimesConsumeAmmoCalled < MinAmmoConsumed;
	}

	simulated function ConsumeAmmo( byte FireMode )
	{
		global.ConsumeAmmo(FireMode);
	}


	simulated event Tick(float DeltaTime)
	{
		//In this tick enters:
		//- Role == Role_Authority
		//- WorldInfo.NetMode == NM_DedicatedServer
		//- WorldInfo.NetMode == NM_StandAlone

		//Blood particle variables
		local int Index;
		local vector MuzzleFlashSocketLocation, BloodParticlesMidPointSocketLocation;
		local Rotator DestinationRotation, BloodParticlesMidPointSocketRotation;
		local KFEmit_DirectionalPath EmitterToRemove;
		local vector VectorParameterParticle;
		local vector BloodSplashVelocity;
		local KFPawn_Human KFPH;

		//Charging variables
		local vector ChargePercentageVector;

		local float InstantHitDamageValue;


		Super.Tick(DeltaTime);

		if (!HasAmmo(CurrentFireMode) && !bIsSprayDisabled)
		{
			if (CurrentChargeDesired <= 0)
			{
				GoToState('Active');
			}
			else
			{
		
				TurnOffFireSpray();
				KFPawn(Instigator).SetWeaponAmbientSound(BloodSuctionLoopNoAmmoAndBloodBallChargedSound.DefaultCue, BloodSuctionLoopNoAmmoAndBloodBallChargedSound.FirstPersonCue);
				KFPawn(Instigator).SetSecondaryWeaponAmbientSound(None, None);
				oZedCurrentlyBeingSprayed = none;
				DisableRecoil();
				bIsSprayDisabled = true;
				bClientDisableSprayVisualAndMesh=true;
			}
		}

		if(oZedCurrentlyBeingSprayed == none)
		{
			bIsChargingSoundStarted = false;
			KFPawn(Instigator).SetSecondaryWeaponAmbientSound(None, None);
		}
		if(oZedCurrentlyBeingSprayed != none && oZedCurrentlyBeingSprayed.IsAliveAndWell())
		{
			//Replenishing secondary ammo
			ReplenishingAmmoOnSuctioningTime -= DeltaTime;
			if (ReplenishingAmmoOnSuctioningTime <= 0)
			{
				AmmoCount[ALTFIRE_FIREMODE] = Min(MagazineCapacity[ALTFIRE_FIREMODE], AmmoCount[ALTFIRE_FIREMODE] + ReplenishingAmmoOnSuctioningCount);
				ReplenishingAmmoOnSuctioningTime += ReplenishingAmmoOnSuctioningInterval;
			}
			
			//Scaling damage values depending on charge
			if (CurrentChargeDesired > 0)
			{
				DamageByChargePercentage = FMin((CurrentChargeDesired - MinDamageWhileChargingThreshold)/(1 - MinDamageWhileChargingThreshold), 1);
				InstantHitDamageValue = FMax(MinDamageByCharge, Lerp(MinDamageByCharge, MaxDamageByCharge, DamageByChargePercentage ));
				InstantHitDamage[CUSTOM_FIREMODE] = InstantHitDamageValue;//TODO
				InstantHitDamageTypes[CUSTOM_FIREMODE]=class'KFDT_Ballistic_HRG_Vampire_BloodBallImpact';
				if(CurrentChargeDesired >= 1.0)
				{
					InstantHitDamageTypes[CUSTOM_FIREMODE]=class'KFDT_Ballistic_HRG_Vampire_BloodBallHeavyImpact';
				}

				KFPawn(Instigator).SetWeaponComponentRTPCValue("Weapon_Charge", CurrentChargeDesired); //For looping component
				Instigator.SetRTPCValue('Weapon_Charge', CurrentChargeDesired); //For one-shot sounds

				if (WorldInfo.NetMode == NM_DedicatedServer)
				{
					ClientChargePercentage = CurrentChargeDesired;
				}
				if (!bIsChargingSoundStarted)
				{	
					KFPawn(Instigator).SetSecondaryWeaponAmbientSound(ChargingSound.DefaultCue, ChargingSound.FirstPersonCue);
				}
				bIsChargingSoundStarted = true;
			}
		}

		//BLOOD PARTICLES AND BALL MANAGEMENT
		KFPH = KFPawn_Human(Instigator);
		if (WorldInfo.NetMode == NM_DedicatedServer || (KFPH != none && !KFPH.IsFirstPerson()))
		{
			return;
		}
	
		//Blood Ball and Blood Particles are managed here for 1P offline and 1P online.
	
		//Blood particles updating destination and removing, and spawning blood splashes.
	
		UpdateDestinationBloodParticlesTime -= DeltaTime;
		if (UpdateDestinationBloodParticlesTime <= 0)
		{
			UpdateDestinationBloodParticlesTime = RateUpdateDestinationBloodParticles;
			GetFlameSocketLocAndRot(MuzzleFlashSocketLocation, DestinationRotation);
			if(MySkelMesh != none)
			{
				MySkelMesh.GetSocketWorldLocationAndRotation('BloodParticlesMidPoint', BloodParticlesMidPointSocketLocation, BloodParticlesMidPointSocketRotation);
			}
	
			for( Index = (NumBloodStolenParticlesForPool - 1) ; Index >= 0 ; Index-- )
			{
		
				if (!BloodStolenParticles[Index].IsEnabled || BloodStolenParticles[Index] == None)
				{
					continue;
				}
				if( BloodStolenParticles[Index].bReachDestinationFinal )
				{
			
					EmitterToRemove = BloodStolenParticles[Index];
					//BloodStolenParticles.Remove(Index, 1);
					EmitterToRemove.DeactivateEmitter();
			
			
				}
				else
				{
					if (BloodStolenParticles[Index].ParticleSystemComponent != None)
					{
						VectorParameterParticle.X = WorldInfo.TimeDilation;
						VectorParameterParticle.Y = WorldInfo.TimeDilation;
						VectorParameterParticle.Z = WorldInfo.TimeDilation;
						BloodStolenParticles[Index].ParticleSystemComponent.SetVectorParameter( name("ZedtimeScale"), VectorParameterParticle );
					}
					BloodStolenParticles[Index].UpdateDestination( MuzzleFlashSocketLocation, BloodParticlesMidPointSocketLocation );

					if (FRand() > 0.8)
					{
						BloodSplashVelocity.x = 0;
						BloodSplashVelocity.y = RandRange(-100, 100);
						BloodSplashVelocity.z = -200;
	
						SpawnBloodSplash(BloodSplashClass, BloodStolenParticles[Index].Location, BloodSplashVelocity);
					}
				}
			}

		}

		for( Index = (NumBloodStolenParticlesForPool - 1) ; Index >= 0 ; Index-- )
		{
			if(BloodStolenParticles[Index].IsEnabled == true)
			{
				bFirstBloodParticleCreated=true;
			}
		}
		CurrentStartChargingTime = FMax(0, CurrentStartChargingTime - DeltaTime);
	
		if (CurrentChargeDesired > 0 && CurrentStartChargingTime <= 0)
		{
			CurrentChargeAccumulatedTime = FMin(CurrentChargeAccumulatedTime + DeltaTime * ChargeSpeed, CurrentChargeDesired);
			CurrentCharge = CurrentChargeAccumulatedTime;
		}
	
		if ( CurrentCharge > 0 )
		{
			if( ChargingPSC != none)
			{
				ChargingPSC.SetActive( true, true );
	
				ChargePercentageVector.X = CurrentCharge;
				ChargePercentageVector.Y = CurrentCharge;
				ChargePercentageVector.Z = CurrentCharge;
				ChargingPSC.SetVectorParameter( name("BlobCharge"), ChargePercentageVector );
			}
	
			if (FullyChargedPSC != none && CurrentCharge >= 1.0)
			{
				if (!bIsFullCharged)
				{
					//WeaponPlaySound(ChargedSound.FirstPersonCue);
					//PlaySoundBase(BloodSuctionEndSound.DefaultCue);
					if ( KFPawn(Owner).IsLocallyControlled() )
					{
						PlaySoundBase(ChargedSound.FirstPersonCue);
					}
					else
					{
						PlaySoundBase(ChargedSound.DefaultCue);
					}
				}
				bIsFullCharged = true;
				FullyChargedPSC.SetActive( true, true );
			}
		}
	}
	simulated function HandleFinishedFiring()
	{
		if (bPlayingLoopingFireAnim)
		{
			StopLoopingFireEffects(CurrentFireMode);
		}

		SetTimer(0.1f, false, 'Timer_StopFireEffects');

		NotifyWeaponFinishedFiring(CurrentFireMode);

		super.HandleFinishedFiring();
	}

	simulated function PutDownWeapon()
	{
		if (bPlayingLoopingFireAnim)
		{
			StopLoopingFireEffects(CurrentFireMode);
		}
		
		SetTimer(0.1f, false, 'Timer_StopFireEffects');

		NotifyWeaponFinishedFiring(CurrentFireMode);

		super.PutDownWeapon();
	}
}

simulated state Active
{
	simulated event BeginState( Name PreviousStateName )
	{
		local KFPawn KFPawn;
		local KFWeapAttach_HRG_Vampire KFWeapAttach;

		//Safest place to start firing Blood Ball (after finishing all logic for Blood Suck firing)

		if (PreviousStateName == 'FiringSuctioning' && Role == Role_Authority && bHasCharged)
		{		
			StartFire(CUSTOM_FIREMODE);
		}

		super.BeginState(PreviousStateName);

		RestoreRecoil();
		bClientDisableSprayVisualAndMesh = false;
		bHasCharged = false;
		bIsFullCharged = false;

		if (WorldInfo.NetMode == NM_DedicatedServer || bIsAlreadyInitializedFX)
		{
			return;
		}

		//All of the following would make more sense to initialize it in PostBeginPlay, but at that moment KFPawn.WeaponAttachment and MySkelMesh are not populated
		//Setting parameters for blood particles from 3P attachment
		KFPawn = KFPawn(Instigator);
		KFWeapAttach = KFWeapAttach_HRG_Vampire(KFPawn.WeaponAttachment);
		if (KFWeapAttach != None)
		{
			SpeedBloodParticles = KFWeapAttach.SpeedBloodParticles;
			SpawnRateBloodParticles = KFWeapAttach.SpawnRateBloodParticles;
			HalfAngleSpawnCone = KFWeapAttach.HalfAngleSpawnCone;
			CurveTurnRateUntilDestinationMidPoint = KFWeapAttach.CurveTurnRateUntilDestinationMidPoint; 
			CurveTurnRateUntilDestinationFinal = KFWeapAttach.CurveTurnRateUntilDestinationFinal;
			LimitDistanceMidPoint = KFWeapAttach.LimitDistanceMidPoint;
			LimitDistanceFinalPoint = KFWeapAttach.LimitDistanceFinalPoint;
		}

		if (SpeedBloodParticles <= 0)
		{
			SpeedBloodParticles = SpeedBloodParticlesDefault;
		}
		if (SpawnRateBloodParticles <= 0)
		{
			SpawnRateBloodParticles = SpawnRateBloodParticlesDefault;
		}
		if (HalfAngleSpawnCone <= 0)
		{
			HalfAngleSpawnCone = HalfAngleSpawnConeDefault;
		}
		if (CurveTurnRateUntilDestinationMidPoint <= 0)
		{
			CurveTurnRateUntilDestinationMidPoint = CurveTurnRateUntilDestinationMidPointDefault;
		}
		if (CurveTurnRateUntilDestinationFinal <= 0)
		{
			CurveTurnRateUntilDestinationFinal = CurveTurnRateUntilDestinationFinalDefault;
		}
		if (LimitDistanceMidPoint <= 0)
		{
			LimitDistanceMidPoint = LimitDistanceMidPointDefault;
		}
		if (LimitDistanceFinalPoint <= 0)
		{
			LimitDistanceFinalPoint = LimitDistanceFinalPointDefault;
		}

		if (KFPawn != none && !KFPawn.IsFirstPerson())
		{
			return;
		}
		InitBloodBallFX();
		SetTimer(SpawnRateBloodParticles, true, nameOf(Timer_CreateBloodParticle));
		bIsAlreadyInitializedFX = true;
	}
}

defaultproperties
{
   MaxChargeAmmo=10.000000
   ChargeSpeed=1.000000
   MinDamageWhileChargingThreshold=0.120000
   ValueIncreaseTime=0.200000
   ChargingEffect=ParticleSystem'WEP_HRG_Vampire_EMIT.FX_HRG_Vampire_BlobCharge_01'
   ChargedEffect=ParticleSystem'WEP_HRG_Vampire_EMIT.FX_HRG_Vampire_FullCharge'
   BloodStolenEffect=ParticleSystem'WEP_HRG_Vampire_EMIT.FX_HRG_Vampire_BloodStolen'
   NumBloodStolenParticlesForPool=15
   SpeedBloodParticlesDefault=750.000000
   SpawnRateBloodParticlesDefault=0.100000
   HalfAngleSpawnConeDefault=45.000000
   CurveTurnRateUntilDestinationMidPointDefault=0.600000
   CurveTurnRateUntilDestinationFinalDefault=4.000000
   LimitDistanceMidPointDefault=16.000000
   LimitDistanceFinalPointDefault=12.000000
   ChargingSound=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_Loop_1P')
   ChargedSound=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_Charged_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_Charged_1P')
   BloodSuctionStartSound=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_3P_Start',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_1P_Start')
   BloodSuctionEndSound=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_3P_End',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_1P_End')
   BloodSuctionLoopNoAmmoAndBloodBallChargedSound=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_Charged_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_SuckBlood_Charged_Loop_1P')
   SelfDamageReductionValue=0.100000
   FullChargedTimerInterval=2.000000
   MinScale=0.500000
   MaxScale=4.500000
   MaxDamageByCharge=150
   MinDamageByCharge=15
   FireHeavyAnim="Shoot_Heavy"
   FireLastHeavyAnim="Shoot_Heavy_Last"
   FireLastHeavySightedAnim="Shoot_Heavy_Iron_Last"
   ReplenishingAmmoOnSuctioningInterval=0.040000
   ReplenishingAmmoOnSuctioningCount=1
   BloodBallProjClass=Class'kfgamecontent.KFProj_BloodBall_HRG_Vampire'
   RateUpdateDestinationBloodParticles=0.200000
   ScaleDelayUntilStartCharging=0.200000
   BloodSplashClass=Class'kfgamecontent.KFProj_BloodSplash'
   bWarnAIWhenFiring=True
   FlameSprayArchetype=KFSprayActor_HRG_Vampire'WEP_HRG_Vampire_Arch.WEP_HRG_Vampire_Spray'
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
   MinAmmoConsumed=4
   PackageKey="HRG_Vampire"
   FirstPersonMeshName="WEP_1P_HRG_Vampire_MESH.Wep_1stP_HRG_Vampire_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_Vampire_Anim.Wep_1stP_HRG_Vampire_Anim"
   PickupMeshName="WEP_3P_HRG_Vampire_MESH.Wep_3rdP_HRG_Vampire_Pickup"
   AttachmentArchetypeName="WEP_HRG_Vampire_ARCH.WEP_HRG_Vampire_3P"
   MuzzleFlashTemplateName="WEP_HRG_Vampire_ARCH.Wep_HRG_Vampire_MuzzleFlash"
   bHasIronSights=True
   bCanRefillSecondaryAmmo=False
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bAllowClientAmmoTracking=False
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Vampire'
   InventorySize=8
   PenetrationPower(1)=2.000000
   MeshFOV=80.000000
   MeshIronSightFOV=65.000000
   PlayerIronSightFOV=50.000000
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   MaxAIWarningDistSQ=2250000.000000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_Vampire_TEX.UI_WeaponSelect_HRG_Vampire'
   SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Vampire'
   MagazineCapacity(0)=40
   MagazineCapacity(1)=100
   AmmoCost(1)=20
   AmmoCost(2)=0
   AmmoCost(3)=0
   AmmoCost(4)=0
   AmmoCost(5)=0
   AmmoCost(6)=0
   SpareAmmoCapacity(0)=240
   InitialSpareMags(0)=1
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(0)="Shoot"
   FireSightedAnims(1)="Shoot_Heavy_Iron"
   FireLoopEndLastAnim="ShootLoop_End"
   FireLoopEndLastSightedAnim="ShootLoop_Iron_End"
   BonesToLockOnEmpty(0)="RW_Handle1"
   BonesToLockOnEmpty(1)="RW_BatteryCylinder1"
   BonesToLockOnEmpty(2)="RW_BatteryCylinder2"
   BonesToLockOnEmpty(3)="RW_LeftArmSpinner"
   BonesToLockOnEmpty(4)="RW_RightArmSpinner"
   BonesToLockOnEmpty(5)="RW_LockEngager2"
   BonesToLockOnEmpty(6)="RW_LockEngager1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_Suck_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_Suck_Loop_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_3P_AltFire',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_1P_AltFire')
   WeaponFireSnd(2)=()
   WeaponFireSnd(3)=()
   WeaponFireSnd(4)=()
   WeaponFireSnd(5)=()
   WeaponFireSnd(6)=(DefaultCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_3P_Shoot',FirstPersonCue=AkEvent'WW_WEP_HRG_Vampire.Play_WEP_HRG_Vampire_1P_Shoot')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Microwave_Gun.Play_SA_MicrowaveGun_DryFire'
   WeaponDryFireSnd(2)=None
   WeaponDryFireSnd(3)=None
   WeaponDryFireSnd(4)=None
   WeaponDryFireSnd(5)=None
   WeaponDryFireSnd(6)=None
   PlayerViewOffset=(X=20.000000,Y=12.000000,Z=-1.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_HRG_Vampire:MeleeHelper_0'
   maxRecoilPitch=115
   minRecoilPitch=75
   maxRecoilYaw=75
   minRecoilYaw=-75
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65034
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   FiringStatesArray(0)="FiringSuctioning"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)=
   FiringStatesArray(6)="WeaponSingleFiring"
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponFireTypes(5)=EWFT_InstantHit
   WeaponFireTypes(6)=EWFT_Projectile
   WeaponProjectiles(0)=None
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_CrystalSpike_HRG_Vampire'
   WeaponProjectiles(2)=None
   WeaponProjectiles(3)=None
   WeaponProjectiles(4)=None
   WeaponProjectiles(5)=None
   WeaponProjectiles(6)=Class'kfgamecontent.KFProj_BloodBall_HRG_Vampire'
   FireInterval(0)=0.100000
   FireInterval(1)=0.220000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   FireInterval(5)=0.000000
   FireInterval(6)=0.220000
   InstantHitDamage(1)=320.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamage(4)=0.000000
   InstantHitDamage(5)=0.000000
   InstantHitDamage(6)=150.000000
   InstantHitMomentum(4)=0.000000
   InstantHitMomentum(5)=0.000000
   InstantHitMomentum(6)=50000.000000
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Piercing_HRG_Vampire_CrystalSpike'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_Vampire'
   InstantHitDamageTypes(4)=None
   InstantHitDamageTypes(5)=None
   InstantHitDamageTypes(6)=Class'kfgamecontent.KFDT_Ballistic_HRG_Vampire_BloodBallImpact'
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
   ItemName="HRG Vampire"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   bOnlyRelevantToOwner=False
   bAlwaysRelevant=True
   Name="Default__KFWeap_HRG_Vampire"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
