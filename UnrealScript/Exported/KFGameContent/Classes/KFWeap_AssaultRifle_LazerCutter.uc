//=============================================================================
// KFWeap_AssaultRifle_LazerCutter
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_LazerCutter extends KFWeap_FlameBase;

/** The amount of time it takes to reach the next charge level */
var float ChargeTimePerLevel;
/** How often ammo is consumed once the weapon is fully charged*/
var float OverchargeConsumeTime;
/** How often ammo is consumed if the weapon is charging*/
var float ChargeConsumeTime;
/** Total time spent during this weapon charged */
var float TotalChargeTime;
/** Total time spent charing in this charge level*/
var float CurrentChargeTime;
/** How often to signal 3p fire effects*/
var float FlashInterval;
/** Timer for keeping track of when to deal damage to targets in the beam*/
var float DamageTime;
/** Timer keeping track of how long remains in the beam duration*/
var float FiringTime;
/** Timer keeping track of when to flash next*/
var float FlashTime;

/** Movement and rotation limits when charging*/
var float ChargingRotationSpeedLimit;
var float ChargingMovementSpeedModifier;
/** Movement and rotation limits when firing*/
var array<float> FiringRotationSpeedLimit;
var float FiringMovementSpeedModifier;

/** Base size of the beam*/
var float BaseScale;
/** Amount to increase the size of the beam per charge level*/
var float ScalePerChargeLevel;
/** Amount of damage to deal per tick per charge level (added to InstantHitDamage)*/
var float DamagePerChargeLevel;
/** Firing duration at no charge level*/
var float BaseDuration;
/** Firing duration added per charge level*/
var float DurationPerChargeLevel;
/** Highest charge level of the beam*/
var int   MaxChargeLevel;

/** Charge in animation */
var(Animations) const editconst	name		AltFireLoopStartAnim;
/** Charge animations per level */
var(Animations) const editconst	name		AltFireBeamInAnimL1;
var(Animations) const editconst	name		AltFireBeamInAnimL2;
var(Animations) const editconst	name		AltFireBeamInAnimL3;
/** Animations to loop if stuck at a charge level*/
var(Animations) const editconst	name		AltFireLoopAnimL1;
var(Animations) const editconst	name		AltFireLoopAnimL2;
var(Animations) const editconst	name		AltFireLoopAnimL3;
/** Firing animations per level */
var(Animations) const editconst	name		CustomFireLoopAnimL1;
var(Animations) const editconst	name		CustomFireLoopAnimL2;
var(Animations) const editconst	name		CustomFireLoopAnimL3;
/** Firing end animations */
var(Animations) const editconst	name		CustomFireLoopEndLastAnim;
var(Animations) const editconst	name		CustomFireLoopEndAnim;

/** Muzzle flash effects per level */
var const ParticleSystem MuzzleFlashEffectL1;
var const ParticleSystem MuzzleFlashEffectL2;
var const ParticleSystem MuzzleFlashEffectL3;

/** Looping sound event for when the beam is firing */
var array<WeaponFireSndInfo> FireLoopSounds;
/** Sound event to kill the looping firing beam when it ends*/
var WeaponFireSndInfo FireLoopStop;
/** Looping sound event for when the beam is charing */
var array<WeaponFireSndInfo> ChargeSounds;
/** Kill all sounds events on the weapon*/
var WeaponFireSndInfo InterruptSoundEvent;
/** Sound info for the full auto mode when in zed time*/
var WeaponFireSndInfo SingleShotFireSnd;

/** Color for the weapon center when charging/firing*/
var LinearColor DefaultFireModeColor;
var LinearColor EnergyColorL0;
var LinearColor EnergyColorL1;
var LinearColor EnergyColorL2;
var LinearColor EnergyColorL3;

/** Effect that happens while charging up the beam*/
var transient ParticleSystemComponent ChargingPSC;
var const ParticleSystem ChargingEffect;

/** Amount of time over which to reduce the rotation speed limit back to normal*/
var float MaxRotationAdjustmentTime;
/** Curve used for determining how much to reduce the rotation speed to*/
var InterpCurveFloat RotationAdjustmentCurve;

/** Used to gate the beam firing muzzle flash to only play once after the beam starts */
var bool bPlayMuzzleFlash;

simulated function Activate()
{
	super.Activate();

	SetBeamColor(0); // set the initial beam color
}

simulated function StartFire(byte FiremodeNum)
{
	if (IsTimerActive('RefireCheckTimer'))
	{
		return;
	}

	super.StartFire(FiremodeNum);
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

simulated function CustomFire()
{
	// tell remote clients that we fired, to trigger effects
	if (CurrentFireMode == CUSTOM_FIREMODE)
	{
		IncrementFlashCount();
	}

	super.CustomFire();
}

simulated function AltFireMode()
{
	super.AltFireMode();

	// different beam colors for different fire modes
	SetBeamColor(GetChargeLevel());
}

simulated function int GetChargeLevel()
{
	return Min(TotalChargeTime / ChargeTimePerLevel, MaxChargeLevel);
}

simulated function FireAmmunition()
{
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

	if (CurrentFireMode == DEFAULT_FIREMODE)
	{
		ConsumeAmmo(CurrentFireMode);
	}

	NotifyWeaponFired(CurrentFireMode);

	// Play fire effects now (don't wait for WeaponFired to replicate)
	PlayFireEffects(CurrentFireMode, vect(0, 0, 0));
}

simulated function name GetLoopStartFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return AltFireLoopStartAnim;
	}
	else if (FireModeNum == CUSTOM_FIREMODE)
	{
		return '';
	}

	return super.GetLoopStartFireAnim(FireModeNum);
}

simulated function name GetLoopEndFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return '';
	}
	else if (FireModeNum == CUSTOM_FIREMODE)
	{
		bPlayFireLast = ShouldPlayFireLast(FireModeNum);

		if (bPlayFireLast && CustomFireLoopEndLastAnim != '')
		{
			return CustomFireLoopEndLastAnim;
		}
		else
		{
			return CustomFireLoopEndAnim;
		}
	}

	return super.GetLoopEndFireAnim(FireModeNum);
}

simulated function name GetLoopingFireAnim(byte FireModeNum)
{
	if (FireModeNum == ALTFIRE_FIREMODE)
	{
		return AltFireLoopStartAnim;
	}
	else if (FireModeNum == CUSTOM_FIREMODE)
	{
		switch (GetChargeLevel())
		{
		case 3:
			return CustomFireLoopAnimL3;
		case 2:
			return CustomFireLoopAnimL2;
		case 1:
		case 0:
			return CustomFireLoopAnimL1;
		}
	}

	return super.GetLoopingFireAnim(FireModeNum);
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if (MuzzleFlash == None)
	{
		AttachMuzzleFlash();
	}

	// swap the muzzle flash per charge level (this should do nothing for full-auto)
	if (MuzzleFlash != none)
	{
		if (FireModeNum == CUSTOM_FIREMODE)
		{
			if (bPlayMuzzleFlash)
			{
				switch (GetChargeLevel())
				{
				case 0:
				case 1:
					MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL1;
					MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL1);
					break;
				case 2:
					MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL2;
					MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL2);
					break;
				case 3:
					MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashEffectL3;
					MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashEffectL3);
					break;
				}

				bPlayMuzzleFlash = false;
				// setting to 0 so that the muzzle flash doesn't get turned off based on a timer
				MuzzleFlash.MuzzleFlash.Duration = 0.0f;
				super.CauseMuzzleFlash(FireModeNum);
			}
		}
		// otherwise use the default
		else
		{
			MuzzleFlash.MuzzleFlash.ParticleSystemTemplate = MuzzleFlashTemplate.MuzzleFlash.ParticleSystemTemplate;
			MuzzleFlash.MuzzleFlash.PSC.SetTemplate(MuzzleFlashTemplate.MuzzleFlash.ParticleSystemTemplate);
			MuzzleFlash.MuzzleFlash.Duration = MuzzleFlashTemplate.MuzzleFlash.Duration;
			super.CauseMuzzleFlash(FireModeNum);
		}
	}
}

simulated function SetBeamColor(int ChargeLevel)
{
	local LinearColor BeamColor;
	local int i;

	if (bUseAltFireMode)
	{
		switch (ChargeLevel)
		{
		case 3:
			BeamColor = EnergyColorL3;
			break;
		case 2:
			BeamColor = EnergyColorL2;
			break;
		case 1:
			BeamColor = EnergyColorL1;
			break;
		default:
			BeamColor = EnergyColorL0;
			break;
		}
	}
	else
	{
		BeamColor = DefaultFireModeColor;
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		for (i = 0; i < WeaponMICs.Length; ++i)
		{
			if (WeaponMICs[i] != none)
			{
				WeaponMICs[i].SetVectorParameterValue('Energy_Color', BeamColor);
			}
		}
	}
}

/** True if we want to override the looping fire sounds with fire sounds from another firemode
*	Overrides the KFWeapon functionality because the LaserCutter doesn't have a SingleFireSoundIndex but still has a single fire sound
*/
simulated function bool ShouldForceSingleFireSound()
{
	// If this weapon has a single-shot firemode, disable looping fire sounds during zedtime
	return (self.WorldInfo.TimeDilation < 1.f);
}

/**
 * Tells the weapon to play a firing sound (uses CurrentFireMode)
 * Overrides the base KFWeapon functionality because the LazerCutter has a different way of finding the single shot sound
 */
simulated function PlayFiringSound(byte FireModeNum)
{
	local bool bUseSingleFireSound;

	MakeNoise(1.0, 'PlayerFiring'); // AI

	if (!bPlayingLoopingFireSnd)
	{
		// Use the single fire sound if we're in zed time and want to play single fire sounds
		if (FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && ShouldForceSingleFireSound())
		{
			bUseSingleFireSound = true;
		}

		if (bUseSingleFireSound)
		{
			WeaponPlayFireSound(SingleShotFireSnd.DefaultCue, SingleShotFireSnd.FirstPersonCue);
		}
		else if (FireModeNum < WeaponFireSnd.Length)
		{
			WeaponPlayFireSound(WeaponFireSnd[FireModeNum].DefaultCue, WeaponFireSnd[FireModeNum].FirstPersonCue);
		}
	}
}

// which category this shows up under in the trader
// FlameBase defaults to Flame, so this needs to override
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Electric;
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Assault;
}

// the FlameBase CalculateTraderWeaponStatDamage uses spray damage
// LazerCutter will just show the full auto damage like a normal KFWeapon
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float CalculatedDamage;
	CalculatedDamage = default.InstantHitDamage[DEFAULT_FIREMODE];
	return CalculatedDamage;
}

simulated state LazerCharge extends WeaponFiring
{
	simulated function FireAmmunition(){}

	simulated function bool AllowIronSights() { return false; }

	// can't switch fire modes when charging or firing the beam
	simulated function AltFireMode() {}
	simulated function AltFireModeRelease() {}

	simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
	{
		local name WeaponFireAnimName;

		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			if (AmmoCount[DEFAULT_FIREMODE] == 0)
			{
				// get the next looping animation we have and play that instead
				// this will happen when a player gets stuck at a level by running out of ammo
				switch (GetChargeLevel())
				{
				case 3:
				case 2:
					WeaponFireAnimName = AltFireLoopAnimL3;
					break;
				case 1:
					WeaponFireAnimName = AltFireLoopAnimL2;
					break;
				case 0:
					WeaponFireAnimName = AltFireLoopAnimL1;
					break;
				}
			}
			else
			{
				// if an animation has ended early and the player still has ammo
				// continue onto the next beam in animation
				switch (GetChargeLevel())
				{
				case 3:
					// once it hits the max level it just loops
					WeaponFireAnimName = AltFireLoopAnimL3;
					break;
				case 2:
					WeaponFireAnimName = AltFireBeamInAnimL2;
					break;
				case 1:
					WeaponFireAnimName = AltFireBeamInAnimL1;
					break;
				}
			}

			if (WeaponFireAnimName != '' && WeaponAnimSeqNode.AnimSeq.SequenceName != WeaponFireAnimName)
			{
				PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName), AmmoCount[DEFAULT_FIREMODE] == 0, FireTweenTime);
			}
		}
	}

	simulated event BeginState(Name PreviousStateName)
	{
		local KFPawn_Human OwnerHuman;
		local KFPlayerController OwnerController;
		OwnerHuman = KFPawn_Human(Instigator);

		super.BeginState(PreviousStateName);

		// reset charging variables
		TotalChargeTime = 0;
		CurrentChargeTime = 0;
		DamageTime = 0;
		FiringTime = 0;
		FlashTime = 0;

		// slow down the player's movement and rotation when charging
		MovementSpeedMod = ChargingMovementSpeedModifier;
		if (OwnerHuman != None)
		{
			OwnerController = KFPlayerController(OwnerHuman.Controller);
			if (OwnerController != none)
			{
				OwnerController.RotationSpeedLimit = ChargingRotationSpeedLimit;
			}
			OwnerHuman.UpdateGroundSpeed();
		}

		// kick the player out of ironsights (no ironsights when shooting the beam)
		if (bUsingSights)
		{
			SetIronSights(false);
		}

		// setup the charging particle effect
		// setup the charging particle effect
		if (ChargingPSC == none)
		{
			ChargingPSC = new(self) class'ParticleSystemComponent';

			if (MySkelMesh != none)
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

		if (ChargingPSC != none)
		{
			ChargingPSC.SetTemplate(ChargingEffect);
		}

		global.OnStartFire();
	}

	simulated function bool ShouldRefire()
	{
		// ignore how much ammo is left (super/global counts ammo)
		return StillFiring(CurrentFireMode);
	}

	simulated event Tick(float DeltaTime)
	{
		local float ConsumeTime, ChargeRTPC;
		local name WeaponFireAnimName;
		local int StartChargeLevel, EndChargeLevel;

		global.Tick(DeltaTime);

		StartChargeLevel = GetChargeLevel();

		FlashTime += DeltaTime;
		ConsumeTime = GetChargeLevel() >= MaxChargeLevel ? OverchargeConsumeTime : ChargeConsumeTime;

		// Don't charge unless we're holding down the button and still have ammo
		if (PendingFire(CurrentFireMode) && AmmoCount[DEFAULT_FIREMODE] > 0)
		{
			TotalChargeTime += DeltaTime;
			CurrentChargeTime += DeltaTime;
		}

		if (ConsumeTime > 0)
		{
			// consume ammo whenever the charge level goes up
			while (CurrentChargeTime >= ConsumeTime)
			{
				CurrentChargeTime -= ConsumeTime;
				ConsumeAmmo(ALTFIRE_FIREMODE);
			}
		}

		// triggers 3p visual effects/anims
		while (FlashTime >= FlashInterval)
		{
			FlashTime -= FlashInterval;
			IncrementFlashCount();
		}

		EndChargeLevel = GetChargeLevel();
		// whenever the charge level increases, check to play a new shoot loop animation
		if (EndChargeLevel != StartChargeLevel)
		{
			// play a sound event for the new charge level
			if (EndChargeLevel >= 0 && EndChargeLevel < ChargeSounds.Length)
			{
				StartLoopingFireSound(CurrentFireMode);
			}

			// play the animation for the next charge level, these will loop if sitting in this state
			if (bPlayingLoopingFireAnim)
			{
				switch (GetChargeLevel())
				{
				case 3:
					// once it hits the max level it just loops
					WeaponFireAnimName = AltFireLoopAnimL3;
					break;
				case 2:
					WeaponFireAnimName = AltFireBeamInAnimL2;
					break;
				case 1:
					WeaponFireAnimName = AltFireBeamInAnimL1;
					break;
				}

				if (WeaponFireAnimName != '' && WeaponAnimSeqNode.AnimSeq.SequenceName != WeaponFireAnimName)
				{
					PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName), GetChargeLevel() == 3, FireTweenTime);
				}
			}
		}

		// set the beam color based on the current charge level
		SetBeamColor(GetChargeLevel());

		// set an RTPC for charging sounds
		ChargeRTPC = FMin(TotalChargeTime / (MaxChargeLevel * ChargeTimePerLevel), 1.f);
		KFPawn(Instigator).SetWeaponComponentRTPCValue("Weapon_Charge", ChargeRTPC); //For looping component
		Instigator.SetRTPCValue('Weapon_Charge', ChargeRTPC); //For one-shot sounds
	}

	//Now that we're done charging, directly call FireAmmunition. This will handle the actual projectile fire and scaling.
	simulated function EndState(Name NextStateName)
	{
		local KFPawn_Human OwnerHuman;
		local KFPlayerController OwnerController;

		OwnerHuman = KFPawn_Human(Instigator);

		// reset the player's movement and rotation speed
		MovementSpeedMod = 1.f;

		if (OwnerHuman != None)
		{
			OwnerController = KFPlayerController(OwnerHuman.Controller);
			if (OwnerController != none)
			{
				OwnerController.RotationSpeedLimit = -1.f;
			}
			OwnerHuman.UpdateGroundSpeed();
		}

		ClearZedTimeResist();
		ClearPendingFire(CurrentFireMode);
		ClearTimer(nameof(RefireCheckTimer));

		NotifyWeaponFinishedFiring(CurrentFireMode);

		KFPawn(Instigator).bHasStartedFire = false;
		KFPawn(Instigator).bNetDirty = true;

		super.EndState(NextStateName);
	}

	function DropFrom(vector StartLocation, vector StartVelocity)
	{
		global.DropFrom(StartLocation, StartVelocity);

		if (Instigator == none)
		{
			// weapon was actually dropped
			WeaponAnimSeqNode.StopAnim();
		}
	}

	simulated function PutDownWeapon()
	{
		TotalChargeTime = 0;
		CurrentChargeTime = 0;

		global.PutDownWeapon();
	}

	simulated function HandleFinishedFiring()
	{
		SendToFiringState(CUSTOM_FIREMODE);
	}
}

simulated state SprayingFireLazer extends SprayingFire
{
	simulated function bool AllowIronSights() { return false; }

	// can't switch fire modes when charging or firing the beam
	simulated function AltFireMode(){}
	simulated function AltFireModeRelease(){}

	simulated function BeginState(Name PreviousStateName)
	{
		local KFPawn_Human OwnerHuman;
		local KFPlayerController OwnerController;
		local float ChargeLevel;
		OwnerHuman = KFPawn_Human(Instigator);
		ChargeLevel = GetChargeLevel();

		// play the muzzle flash once (it will then stick around until firing is over)
		bPlayMuzzleFlash = true;

		// reset firing variables
		FlashTime = 0;

		// If we're firing without charging, still consume one ammo
		if (TotalChargeTime < ChargeConsumeTime)
		{
			ConsumeAmmo(CurrentFireMode);
		}

		// slow down the player's movement and rotation when firing
		MovementSpeedMod = FiringMovementSpeedModifier;
		if (OwnerHuman != None)
		{
			OwnerController = KFPlayerController(OwnerHuman.Controller);
			if (OwnerController != none)
			{
				if (ChargeLevel >= 0 && ChargeLevel < FiringRotationSpeedLimit.Length)
				{
					OwnerController.RotationSpeedLimit = FiringRotationSpeedLimit[ChargeLevel];
				}
			}
			OwnerHuman.UpdateGroundSpeed();
		}

		// the firing time will be used to determine how long the firing portion will last
		// scale this based on the charge level
		FiringTime = BaseDuration + ChargeLevel * DurationPerChargeLevel;

		// kick the player out of ironsights (no ironsights when shooting the beam)
		if (bUsingSights)
		{
			SetIronSights(false);
		}

		// stop the charging particle system
		if (ChargingPSC != none)
		{
			ChargingPSC.DeactivateSystem();
		}

		super.BeginState(PreviousStateName);
	}

	// show debug boxes around the bones used for tracing collisions
	simulated function DebugRenderBones()
	{
		local Vector BoneLoc;
		local string BoneString;
		local int x, y;
		local vector BoxExtent;

		for (x = 0; x < ArrayCount(FlamePool); x++)
		{
			for (y = 1; y <= 15; y++)
			{
				BoxExtent.X = BaseScale + ScalePerChargeLevel * (GetChargeLevel() - 1);
				BoxExtent.Y = BaseScale + ScalePerChargeLevel * (GetChargeLevel() - 1);
				BoxExtent.Z = 1;

				BoneString = "Bone";
				if (y < 10)
				{
					BoneString $= "0";
				}
				BoneString $= string(y);

				BoneLoc = FlamePool[x].SkeletalSprayMesh.GetBoneLocation(name(BoneString));
				DrawDebugBox(BoneLoc, BoxExtent, 255, 255, 0, TRUE);
			}
		}
	}

	simulated function DamageActorsCheck()
	{
		local KFPawn HitPawn;
		local vector BeamExtent, SmallBeamExtent;
		local int FlamePoolCounter, BoneCounter;
		local string BoneString;
		local vector BoneLoc, PrevBoneLoc;
		local KFPawn OwnerPawn;
		local int CurrentCollisions;
		local array<KFPawn> AlreadyHitActors;
		local array<Actor> HitDamageActors;
		local array<Actor> HitBeamActors;
		local array<vector> DamageHitLocations;
		local array<vector> BeamHitLocations;
		local vector HitLocation;
		local int i;

		// scale the size of the damage collision volume based on the charge level
		BeamExtent.X = BaseScale + ScalePerChargeLevel * (GetChargeLevel() - 1);
		BeamExtent.Y = BaseScale + ScalePerChargeLevel * (GetChargeLevel() - 1);
		BeamExtent.Z = 1;
		// matching the extent size of the spray actor
		SmallBeamExtent.X = 8.f;
		SmallBeamExtent.Y = 8.f;
		SmallBeamExtent.Z = 8.f;

		CurrentCollisions = 0;
		OwnerPawn = KFPawn(Owner);

		for (FlamePoolCounter = 0; FlamePoolCounter < ArrayCount(FlamePool); FlamePoolCounter++)
		{
			// assumes 15 bones used in the laser mesh
			for (BoneCounter = 1; BoneCounter < 15; BoneCounter++)
			{
				BoneString = "Bone";
				if (BoneCounter < 10)
				{
					BoneString $= "0";
				}
				BoneString $= string(BoneCounter);

				BoneLoc = FlamePool[FlamePoolCounter].SkeletalSprayMesh.GetBoneLocation(name(BoneString));
				if (BoneCounter != 1)
				{
					if(CurrentCollisions < FlamePool[FlamePoolCounter].MaxSprayMeshesCollided)
					{
						// large damage collision radius
						HitDamageActors = BeamLineCheck(PrevBoneLoc, BoneLoc, BeamExtent, DamageHitLocations);
						// smaller box for the beam itself
						HitBeamActors = BeamLineCheck(PrevBoneLoc, BoneLoc, SmallBeamExtent, BeamHitLocations);

						// stop the beam if the actual laser (small extent) looks like it would collide with something
						// but until then still do damage in the larger area based on charge level
						// this will mean that the beam can hit people around small corners at high charge levels
						// but it won't be stuck as easily on when super charged
						for(i = 0; i < HitDamageActors.Length; i++)
						{
							if (CurrentCollisions < FlamePool[FlamePoolCounter].MaxSprayMeshesCollided)
							{
								HitPawn = KFPawn(HitDamageActors[i]);
								// hit another pawn in the world
								if (HitPawn != none && HitPawn.Base != Owner && HitPawn != Owner && HitPawn.bBlockActors && AlreadyHitActors.Find(HitPawn) == INDEX_NONE)
								{
									CurrentCollisions++;
									// keep track of which actors were hit so fat actors don't get caught multiple times
									AlreadyHitActors.AddItem(HitPawn);

									HitLocation = vect(0, 0, 0);
									if (DamageHitLocations.Length > i)
									{
										HitLocation = DamageHitLocations[i];
									}

									// scale the damage based on charge level, using the InstantHitDamage as the base
									HitPawn.TakeDamage(InstantHitDamage[ALTFIRE_FIREMODE] + GetChargeLevel() * DamagePerChargeLevel, OwnerPawn.Controller, HitLocation, vect(0, 0, 0), InstantHitDamageTypes[ALTFIRE_FIREMODE],,self);
								}
								// hit world geometry (with small extent), set to max collisions to stop the beam
								else if (HitDamageActors[i] != none && HitDamageActors[i].Base != Owner && HitDamageActors[i] != Owner && HitDamageActors[i].bBlockActors && HitDamageActors[i].bWorldGeometry && HitBeamActors.Find(HitDamageActors[i]) != INDEX_NONE)
								{
									CurrentCollisions = FlamePool[FlamePoolCounter].MaxSprayMeshesCollided;
								}
							}
						}
					}
				}

				PrevBoneLoc = BoneLoc;
			}
		}
	}

	simulated event Tick(float DeltaTime)
	{
		global.Tick(DeltaTime);

		if (FiringTime > 0.0f)
		{
			FiringTime -= DeltaTime;
			DamageTime += DeltaTime;
			FlashTime += DeltaTime;

			// check for damaging actors after a set interval
			while (DamageTime >= FireInterval[ALTFIRE_FIREMODE])
			{
				DamageTime -= FireInterval[ALTFIRE_FIREMODE];
				DamageActorsCheck();
			}

			// triggers 3p visual effects/anims
			while (FlashTime >= FlashInterval)
			{
				FlashTime -= FlashInterval;
				IncrementFlashCount();
			}
		}
		else
		{
			// when the charge/firing time is over, exit this state
			GotoState('Active');
		}
	}

	simulated function EndState(Name NextStateName)
	{
		local int FlamePoolCounter;
		local KFPawn_Human OwnerHuman;
		local KFPlayerController OwnerController;
		OwnerHuman = KFPawn_Human(Instigator);

		// reset the player's movement and rotation speed modifiers
		MovementSpeedMod = 1.f;
		if (OwnerHuman != None)
		{
			OwnerController = KFPlayerController(OwnerHuman.Controller);
			if (OwnerController != none)
			{
				// set the starting point for the rotation curve to line up with the current speed limit
				if(RotationAdjustmentCurve.Points.Length > 0)
				{
					RotationAdjustmentCurve.Points[0].OutVal = OwnerController.RotationSpeedLimit;
				}

				OwnerController.StartRotationAdjustment(RotationAdjustmentCurve, MaxRotationAdjustmentTime);
			}
			OwnerHuman.UpdateGroundSpeed();
		}

		// reset the mesh size
		for (FlamePoolCounter = 0; FlamePoolCounter < ArrayCount(FlamePool); FlamePoolCounter++)
		{
			FlamePool[FlamePoolCounter].SkeletalSprayMesh.SetScale(1.f);
		}

		// manually turn off the muzzle flash since these won't kill themselves
		if (MuzzleFlash.MuzzleFlash.PSC != none)
		{
			MuzzleFlash.MuzzleFlash.PSC.DeactivateSystem();
		}

		// return the beam color back to the default
		SetBeamColor(0);

		// reset charging variables
		TotalChargeTime = 0;
		CurrentChargeTime = 0;
		DamageTime = 0;
		FiringTime = 0;
		FlashTime = 0;
		ClearFlashLocation();
		ClearTimer('RefireCheckTimer');
		ClearPendingFire(0);

		super.EndState(NextStateName);
	}

	simulated function bool ShouldRefire()
	{
		return FiringTime > 0.0f;
	}

	simulated function bool IsFiring()
	{
		return FiringTime > 0.0f;
	}

	simulated function bool TryPutDown()
	{
		// can't put down when firing
		return false;
	}
};

simulated function StartLoopingFireSound(byte FireModeNum)
{
	local float ChargeLevel;

	switch (FireModeNum)
	{
	case ALTFIRE_FIREMODE:
		ChargeLevel = GetChargeLevel();
		WeaponFireSnd[FireModeNum] = FireLoopSounds[ChargeLevel];
		break;
	case CUSTOM_FIREMODE:
		ChargeLevel = GetChargeLevel();
		WeaponFireSnd[FireModeNum] = ChargeSounds[ChargeLevel];
		break;
	}

	super.StartLoopingFireSound(FireModeNum);
}

defaultproperties
{
   ChargeTimePerLevel=1.000000
   ChargeConsumeTime=0.120000
   FlashInterval=0.150000
   ChargingMovementSpeedModifier=1.000000
   FiringRotationSpeedLimit(0)=420.000000
   FiringRotationSpeedLimit(1)=240.000000
   FiringRotationSpeedLimit(2)=180.000000
   FiringRotationSpeedLimit(3)=120.000000
   FiringMovementSpeedModifier=0.750000
   BaseScale=40.000000
   ScalePerChargeLevel=10.000000
   DamagePerChargeLevel=5.000000
   BaseDuration=0.250000
   DurationPerChargeLevel=0.750000
   MaxChargeLevel=3
   AltFireLoopStartAnim="Beam_Charge_In_lvl1"
   AltFireBeamInAnimL1="Beam_Charge_In_lvl2"
   AltFireBeamInAnimL2="Beam_Charge_In_lvl3"
   AltFireLoopAnimL1="Beam_Charge_Loop_lvl1"
   AltFireLoopAnimL2="Beam_Charge_Loop_lvl2"
   AltFireLoopAnimL3="Beam_Charge_Loop_lvl3"
   CustomFireLoopAnimL1="Beam_Shoot_Loop_lvl1"
   CustomFireLoopAnimL2="Beam_Shoot_Loop_lvl2"
   CustomFireLoopAnimL3="Beam_Shoot_Loop_lvl3"
   CustomFireLoopEndLastAnim="Beam_Shoot_End_Last"
   CustomFireLoopEndAnim="Beam_Shoot_End"
   MuzzleFlashEffectL1=ParticleSystem'WEP_Laser_Cutter_EMIT.FX_Laser_Cutter_Beam_Muzzleflash_01'
   MuzzleFlashEffectL2=ParticleSystem'WEP_Laser_Cutter_EMIT.FX_Laser_Cutter_Beam_Muzzleflash_02'
   MuzzleFlashEffectL3=ParticleSystem'WEP_Laser_Cutter_EMIT.FX_Laser_Cutter_Beam_Muzzleflash_03'
   FireLoopSounds(0)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_0_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_0_1P')
   FireLoopSounds(1)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_1_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_1_1P')
   FireLoopSounds(2)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_2_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_2_1P')
   FireLoopSounds(3)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_3_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_3_1P')
   FireLoopStop=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Beam_Shoot_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Beam_Shoot_LP_1P')
   ChargeSounds(0)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_0_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_0_1P')
   ChargeSounds(1)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_1_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_1_1P')
   ChargeSounds(2)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_2_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_2_1P')
   ChargeSounds(3)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_3_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_3_1P')
   InterruptSoundEvent=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Interrupt_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Interrupt_1P')
   SingleShotFireSnd=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Single_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Single_1P')
   DefaultFireModeColor=(R=5.000000,G=1.000000,B=20.000000,A=1.000000)
   EnergyColorL0=(R=5.000000,G=1.000000,B=20.000000,A=1.000000)
   EnergyColorL1=(R=20.000000,G=5.000000,B=200.000000,A=1.000000)
   EnergyColorL2=(R=5.000000,G=25.000000,B=200.000000,A=1.000000)
   EnergyColorL3=(R=20.000000,G=50.000000,B=200.000000,A=1.000000)
   ChargingEffect=ParticleSystem'WEP_Laser_Cutter_EMIT.FX_Laser_Cutter_Beam_Charge_00'
   MaxRotationAdjustmentTime=0.250000
   RotationAdjustmentCurve=(Points=((OutVal=120.000000),(InVal=1.000000,OutVal=2000.000000,InterpMode=CIM_CurveAuto)))
   FlameSprayArchetype=SprayActor_Flame'WEP_Laser_Cutter_ARCH.WEP_Laser_Cutter_Flame'
   PilotLightPlayEvent=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Idle_LP'
   PilotLightStopEvent=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Idle_LP'
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
   PackageKey="Laser_Cutter"
   FirstPersonMeshName="wep_1p_laser_cutter_mesh.Wep_1stP_Laser_Cutter_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_laser_cutter_anim.wep_1p_laser_cutter_anim"
   PickupMeshName="WEP_3P_Laser_Cutter_Mesh.Wep_3rdP_Laser_Cutter_Pickup"
   AttachmentArchetypeName="WEP_Laser_Cutter_ARCH.Wep_Laser_Cutter_3P"
   MuzzleFlashTemplateName="WEP_Laser_Cutter_ARCH.Wep_Laser_Cutter_MuzzleFlash_1P"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   FireModeIconPaths(2)=None
   FireModeIconPaths(3)=None
   FireModeIconPaths(4)=None
   FireModeIconPaths(5)=None
   FireModeIconPaths(6)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
   InventorySize=8
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=125.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Laser_Cutter_TEX.UI_WeaponSelect_Laser_Cutter'
   MagazineCapacity(0)=50
   AmmoCost(2)=0
   AmmoCost(3)=0
   AmmoCost(4)=0
   AmmoCost(5)=0
   AmmoCost(6)=1
   SpareAmmoCapacity(0)=300
   InitialSpareMags(0)=1
   bLoopingFireAnim(0)=True
   bLoopingFireAnim(1)=True
   bLoopingFireAnim(2)=False
   bLoopingFireAnim(3)=False
   bLoopingFireAnim(4)=False
   bLoopingFireAnim(5)=False
   bLoopingFireAnim(6)=True
   bLoopingFireSnd(0)=True
   bLoopingFireSnd(1)=True
   bLoopingFireSnd(2)=False
   bLoopingFireSnd(3)=False
   bLoopingFireSnd(4)=False
   bLoopingFireSnd(5)=False
   bLoopingFireSnd(6)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_Magazine1"
   BonesToLockOnEmpty(1)="RW_BatteryContactLeft"
   BonesToLockOnEmpty(2)="RW_BatteryContactRight"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_FullAuto_LP_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_FullAuto_LP_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_0_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_Beam_Shoot_LP_Level_0_1P')
   WeaponFireSnd(2)=()
   WeaponFireSnd(3)=()
   WeaponFireSnd(4)=()
   WeaponFireSnd(5)=()
   WeaponFireSnd(6)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_0_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_Beam_Charged_LP_Level_0_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_FullAuto_LP_End_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LazerCutter_FullAuto_LP_End_1P')
   WeaponFireLoopEndSnd(1)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Beam_Shoot_Loop_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Beam_Shoot_LP_1P')
   WeaponFireLoopEndSnd(2)=()
   WeaponFireLoopEndSnd(3)=()
   WeaponFireLoopEndSnd(4)=()
   WeaponFireLoopEndSnd(5)=()
   WeaponFireLoopEndSnd(6)=(DefaultCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Interrupt_3P',FirstPersonCue=AkEvent'WW_WEP_Lazer_Cutter.Stop_WEP_LazerCutter_Interrupt_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_Lazer_Cutter.Play_WEP_LaserCutter_DryFire'
   PlayerViewOffset=(X=3.000000,Y=10.000000,Z=-1.000000)
   NumBloodMapMaterials=5
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_LazerCutter:MeleeHelper_0'
   maxRecoilPitch=100
   minRecoilPitch=70
   maxRecoilYaw=100
   minRecoilYaw=-100
   RecoilRate=0.063000
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Survivalist'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0),(Stat=EWUS_Damage1),))
   FiringStatesArray(1)="LazerCharge"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)=
   FiringStatesArray(6)="SprayingFireLazer"
   WeaponFireTypes(5)=EWFT_InstantHit
   WeaponFireTypes(6)=EWFT_Custom
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_LazerCutter'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_LazerCutter'
   FireInterval(0)=0.085700
   FireInterval(1)=0.070000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   FireInterval(5)=0.000000
   FireInterval(6)=0.070000
   Spread(0)=0.015000
   Spread(1)=0.008500
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=40.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_LazerCutter'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_LazerCutter_Beam'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_LazerCutter'
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
   ItemName="Killerwatt"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_LazerCutter"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
