//=============================================================================
// KFWeap_AutoTurretWeapon
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AutoTurretWeapon extends KFWeap_SMGBase;

var KFPawn_AutoTurret InstigatorDrone;

var transient bool bFiring;

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    StartLoadWeaponContent();
}

simulated state WeaponFiring
{
	simulated function EndState(Name NextStateName)
	{
		local Pawn OriginalInstigator;

		// The Instigator for this weapon is the Player owning the weapon (for Perk, damage, etc,. calculations)
		// But for Weapon Firing end state logic we need to point to the real Drone Pawn so we don't mess
		// With whichever weapon the Player had equipped at that point

		OriginalInstigator = Instigator;

		Instigator = InstigatorDrone;

		super.EndState(NextStateName);

		Instigator = OriginalInstigator;
	}
}

simulated function FireAmmunition()
{
	CurrentFireMode = DEFAULT_FIREMODE;
	super.FireAmmunition();
}

simulated function GetMuzzleLocAndRot(out vector MuzzleLoc, out rotator MuzzleRot)
{
	if (KFSkeletalMeshComponent(Mesh).GetSocketWorldLocationAndRotation('MuzzleFlash', MuzzleLoc, MuzzleRot) == false)
	{
		LogInternal("MuzzleFlash not found!");
	}

	// To World Coordinates. (Rotation should be 0 so no taken into account)
	// MuzzleLoc = Location + QuatRotateVector(QuatFromRotator(Rotation), MuzzleLoc);
}

simulated function InstantFireClient()
{
	local vector			StartTrace;
	local vector 			EndTrace;
	local rotator			AimRot;
	local Array<ImpactInfo>	ImpactList;
	local int				Idx;
	local ImpactInfo		RealImpact;
	local float				CurPenetrationValue;
	local KFPawn 			KFPOwner;

	// see Controller AimHelpDot() / AimingHelp()
	bInstantHit = true;

	// define range to use for CalcWeaponFire()
	GetMuzzleLocAndRot(StartTrace, AimRot );
	EndTrace = StartTrace + vector(Owner.Rotation) * GetTraceRange();
	
	bInstantHit = false;

    // Initialize penetration power
    PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
    CurPenetrationValue = PenetrationPowerRemaining;

	// Perform shot
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

	// Set flash location to trigger client side effects.  Bypass Weapon.SetFlashLocation since
	// that function is not marked as simulated and we want instant client feedback.
	// ProjectileFire/IncrementFlashCount has the right idea:
	//	1) Call IncrementFlashCount on Server & Local
	//	2) Replicate FlashCount if ( !bNetOwner )
	//	3) Call WeaponFired() once on local player
	KFPOwner = KFPawn(Owner);
	if( KFPOwner != None )
	{
		KFPOwner.SetFlashLocation( Self, CurrentFireMode, RealImpact.HitLocation );
	}

	// local player only for clientside hit detection
	// allow weapon to add extra bullet impacts (useful for shotguns)
	InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);

	for (Idx = 0; Idx < ImpactList.Length; Idx++)
	{
		ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue, Idx);
	}

	if ( Instigator.Role < ROLE_Authority )
	{
		SendClientImpactList(CurrentFireMode, ImpactList);
	}
}


simulated function Projectile ProjectileFire()
{
	local vector StartTrace, RealStartLoc, AimDir;
	local rotator AimRot;
	local class<KFProjectile> MyProjectileClass;

	// tell remote clients that we fired, to trigger effects

	if ( ShouldIncrementFlashCountOnFire() )
	{
		IncrementFlashCount();
	}

    MyProjectileClass = GetKFProjectileClass();

	if( Role == ROLE_Authority || (MyProjectileClass.default.bUseClientSideHitDetection
        && MyProjectileClass.default.bNoReplicationToInstigator && Instigator != none
        && Instigator.IsLocallyControlled()) )
	{
		// This is where we would start an instant trace. (what CalcWeaponFire uses)
		// MySkelMesh.GetSocketWorldLocationAndRotation( 'MuzzleFlash', StartTrace, AimRot );
		GetMuzzleLocAndRot(StartTrace, AimRot );

		AimDir = Vector(Owner.Rotation);

		// this is the location where the projectile is spawned.
		RealStartLoc = StartTrace;

		return SpawnAllProjectiles(MyProjectileClass, RealStartLoc, AimDir);
	}

	return None;
}

simulated function IncrementFlashCount()
{
	local KFPawn P;
	P = KFPawn(Owner);

	if( P != None )
	{
		P.IncrementFlashCount( Self, CurrentFireMode );
	}
}

simulated function Fire()
{
	if (bFiring)
	{
		return;
	}

	if (HasAmmo(DEFAULT_FIREMODE))
	{
		SendToFiringState(DEFAULT_FIREMODE);
	}

	bFiring = true;
}


simulated function StopFire(byte FireModeNum)
{
	if (!bFiring)
	{
		return;
	}

	bFiring = false;
	super.StopFire(FireModeNum);
	GoToState('Inactive');
}

simulated function bool ShouldRefire()
{
	// if doesn't have ammo to keep on firing, then stop
	if( !HasAmmo( CurrentFireMode ) )
	{
		return false;
	}

	return bFiring;
}

/**
 * Starts playing looping FireSnd only (used for switching sounds in Zedtime)
 */
simulated function StartLoopingFireSound(byte FireModeNum)
{
	if ( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && !ShouldForceSingleFireSound() )
	{
		bPlayingLoopingFireSnd = true;
		KFPawn(Owner).SetWeaponAmbientSound(WeaponFireSnd[FireModeNum].DefaultCue, WeaponFireSnd[FireModeNum].FirstPersonCue);
	}
}

/**
 * Stops playing looping FireSnd only (used for switching sounds in Zedtime)
 */
simulated function StopLoopingFireSound(byte FireModeNum)
{
	if ( bPlayingLoopingFireSnd )
	{
		KFPawn(Owner).SetWeaponAmbientSound(None);
		if ( FireModeNum < WeaponFireLoopEndSnd.Length )
		{
			WeaponPlayFireSound(WeaponFireLoopEndSnd[FireModeNum].DefaultCue, WeaponFireLoopEndSnd[FireModeNum].FirstPersonCue);
		}

		bPlayingLoopingFireSnd = false;
	}
}

simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
	local name WeaponFireAnimName;
	local KFPerk CurrentPerk;
	local float TempTweenTime, AdjustedAnimLength;
	local KFPawn KFPO;

	// If we have stopped the looping fire sound to play single fire sounds for zed time
	// start the looping sound back up again when the time is back above zed time speed
	if( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && !bPlayingLoopingFireSnd )
    {
        StartLoopingFireSound(FireModeNum);
    }

	PlayFiringSound(CurrentFireMode);
	KFPO = KFPawn(Owner);

	if( KFPO != none )
	{
		// Tell our pawn about any changes in animation speed
		UpdateWeaponAttachmentAnimRate( GetThirdPersonAnimRate() );

		if( KFPO.IsLocallyControlled() )
		{
			if( KFPO.IsFirstPerson() )
			{
				if ( !bPlayingLoopingFireAnim )
				{
					WeaponFireAnimName = GetWeaponFireAnim(FireModeNum);

					if ( WeaponFireAnimName != '' )
					{
						AdjustedAnimLength = MySkelMesh.GetAnimLength(WeaponFireAnimName);
						TempTweenTime = FireTweenTime;

						CurrentPerk = GetPerk();
						if( CurrentPerk != none )
						{
							CurrentPerk.ModifyRateOfFire( AdjustedAnimLength, self );

							// We need to unlock the slide if we fire from zero ammo while uber ammo is active
							if( EmptyMagBlendNode != none
								&& BonesToLockOnEmpty.Length > 0
								&& AmmoCount[GetAmmoType(FireModeNum)] == 0
								&& CurrentPerk.GetIsUberAmmoActive(self) )
							{
								EmptyMagBlendNode.SetBlendTarget( 0, 0 );
								TempTweenTime = 0.f;
							}
						}

						PlayAnimation(WeaponFireAnimName, AdjustedAnimLength,, TempTweenTime);
					}
				}

				// Start muzzle flash effect
				CauseMuzzleFlash(FireModeNum);
			}

			HandleRecoil();
			ShakeView();

			if (AmmoCount[0] == 0 && ForceReloadTimeOnEmpty > 0)
			{
				SetTimer(ForceReloadTimeOnEmpty, false, nameof(ForceReload));
			}
		}
	}
}

defaultproperties
{
   PackageKey="AutoTurretWeapon"
   FirstPersonMeshName="wep_1p_autoturretWeapon_mesh.Wep_1stP_AutoTurretWeapon_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_autoturretWeapon_anim.Wep_1stP_AutoTurretWeapon_Anim"
   PickupMeshName="wep_3p_autoturretWeapon_mesh.Wep_AutoTurretWeapon_Pickup"
   AttachmentArchetypeName="WEP_AutoTurretWeapon_ARCH.AutoTurretWeaponAttachment"
   MuzzleFlashTemplateName="wep_autoturretWeapon_arch.Wep_AutoTurretWeapon_MuzzleFlash"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   FireModeIconPaths(1)=()
   InventorySize=5
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=7.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=75.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'WEP_UI_AutoTurret_TEX.UI_WeaponSelect_AutoTurret'
   MagazineCapacity(0)=150
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Shot_LP_3P',FirstPersonCue=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Shot_LP_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Shot_EndLP_3P',FirstPersonCue=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Shot_EndLP_1P')
   PlayerViewOffset=(X=9.000000,Y=10.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AutoTurretWeapon:MeleeHelper_0'
   maxRecoilPitch=225
   minRecoilPitch=150
   maxRecoilYaw=150
   minRecoilYaw=-150
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=195
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Stat=EWUS_Damage1,Scale=1.300000),(Add=2)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=EWFT_None
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pistol9mm'
   FireInterval(0)=0.120000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   InstantHitDamage(0)=10.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_AutoTurret'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=30.000000,Y=4.500000,Z=-4.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AutoTurretWeapon"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
