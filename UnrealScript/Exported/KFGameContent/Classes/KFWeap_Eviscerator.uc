//=============================================================================
// KFWeap_Eviscerator
//=============================================================================
// A hybrid melee weapon that shoots circular saw blades
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Andrew Ladenberger and John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Eviscerator extends KFWeap_MeleeBase;

/** Anim names */
const IdleNoGasAnim = 'Idle_NoGas';
const BlockLoopNoGasAnim	= 'Brace_loop_NoGas';

/** BlendNode that's active while weapon has fuel */
var AnimNodeAdditiveBlending AdditiveBlendNode;
/** BlendNode that's active when primary ammo is empty */
var AnimNodeBlendPerBone OutOfBladesBlendNode;

/** Sound to play while weapon has fuel */
var AKEvent IdleMotorSound;

/** Short time from end of FireInterval when blocking can cancel the firing state */
var float BlockInterruptFiringTime;

//------------------------------------------------------------------------------

/**
 * Called immediately before gameplay begins.
 */
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	// to prevent exploits the fire interrupt cannot be longer than the block intro
	BlockInterruptFiringTime = FMin(BlockInterruptFiringTime, MySkelMesh.GetAnimLength(MeleeBlockStartAnim));
}

/** The SkeletalMeshComponents Animations are being instanced from AnimTreeTemplate
* 	before PostInitAnimTree. Be sure to never set the Mesh's animations directly through
*	the package */
simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	AdditiveBlendNode = AnimNodeAdditiveBlending(SkelComp.FindAnimNode('MotorAdditiveBlend'));
	OutOfBladesBlendNode = AnimNodeBlendPerBone(SkelComp.FindAnimNode('OutOfBladesBlend'));
}

/*********************************************************************************************
 * @name		Ammunition
 ********************************************************************************************* */

/**
 * @see Weapon::StartFire
 */
simulated function StartFire(byte FireModeNum)
{
	// If we're out of fuel, do a melee 'bash' instead
	if( FireModeNum == HEAVY_ATK_FIREMODE && !HasAmmo(FireModeNum) )
	{
		FireModeNum = BASH_FIREMODE;
	}

	// skip MeleeBase logic
	Super(KFWeapon).StartFire(FireModeNum);
}

 /**
 * Returns which ammo pool a fire mode should pull from, primary or secondary.
 @ param    FiringMode  the fire mode we want to check against
 @ return   the ammo pool we should pull from for the input fire mode
 */
simulated function int GetAmmoType(byte FiringMode)
{
	//UI looking for altfire
    if( FiringMode == HEAVY_ATK_FIREMODE || FiringMode == ALTFIRE_FIREMODE)
	{
        return 1;
	}
    else
	{
        return 0;
	}
}

/*********************************************************************************************
 * @name		Firing / Projectile
********************************************************************************************* */

/** process local player impact for clientside hit detection */
event RecieveClientImpact(byte FiringMode, const out ImpactInfo Impact, optional out float PenetrationValue, optional int ImpactNum)
{
	if ( FiringMode == DEFAULT_FIREMODE )
	{
		super(KFWeapon).RecieveClientImpact(FiringMode, Impact, PenetrationValue);
	}
	else
	{
		MeleeAttackHelper.ProcessMeleeHit(FiringMode, Impact);
	}
}

/*********************************************************************************************
 * @section		Animation
********************************************************************************************* */

simulated function HideBlade()
{
    // @todo: remove this stub if/when we remove the notifies from the anim
}

simulated function UnHideBlade()
{
    // @todo: remove this stub if/when we remove the notifies from the anim
}

/** Check if we're out of blades or fuel and toggle effects accordingly */
simulated function UpdateOutOfAmmoEffects(float BlendTime)
{
	if ( AmmoCount[1] > 0 )
	{
		PlayIdleMotorSound();
		if ( AdditiveBlendNode != None )
		{
			AdditiveBlendNode.SetBlendTarget(1.f, BlendTime);
		}
	}
	else
	{
		StopIdleMotorSound();
		if ( AdditiveBlendNode != None )
		{
			AdditiveBlendNode.SetBlendTarget(0.f, BlendTime);
		}
	}

	if ( OutOfBladesBlendNode != None )
	{
		OutOfBladesBlendNode.SetBlendTarget((AmmoCount[0] > 0) ? 0.f : 1.f, BlendTime);
	}
}

/** Check to see if sound is already playing before calling SetWeaponAmbientSound */
simulated function PlayIdleMotorSound()
{
	local KFPawn P;
	P = KFPawn(Instigator);
	if ( P != None && P.WeaponAmbientSound != IdleMotorSound )
	{
		P.SetWeaponAmbientSound(IdleMotorSound);
	}
}

/** Check to see if sound is already stopped before calling SetWeaponAmbientSound */
simulated function StopIdleMotorSound()
{
	local KFPawn P;
	P = KFPawn(Instigator);
	if ( P != None && P.WeaponAmbientSound != None )
	{
		P.SetWeaponAmbientSound(None);
	}
}

/*********************************************************************************************
 * State Active
 * Extended to handle IdleMotorSound
 *********************************************************************************************/

simulated state Active
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		UpdateOutOfAmmoEffects(0.2f);
	}

	simulated function PlayIdleAnim()
	{
		if ( Instigator.IsFirstPerson() )
		{
			// If we're out of fuel play a special idle with no motor vibration
			if ( AmmoCount[1] <= 0 )
			{
				PlayAnimation(IdleNoGasAnim, 0.0, true, 0.2);
			}
			else
			{
				Super.PlayIdleAnim();
			}
		}
	}
}

/*********************************************************************************************
 * state Inactive
 * Extended to handle IdleMotorSound
 *********************************************************************************************/

auto state Inactive
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
		StopIdleMotorSound();
	}

	// moved to kfweapon
	//simulated function EndState(Name NextStateName)
	//{
	//	Super.EndState(NextStateName);
	//	UpdateOutOfAmmoEffects(0.0f);
	//}
}

/*********************************************************************************************
 * State Reloading
 * This is the default Reloading State.  It's performed on both the client and the server.
 *********************************************************************************************/

simulated state Reloading
{
	simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		// When the player starts reload force unlock the OutOfBlades bones temporarily
		if ( OutOfBladesBlendNode != None )
		{
			OutOfBladesBlendNode.SetBlendTarget(0.f, 0.1f);
		}
	}
}

/** Called during reload state */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	return super.CanOverrideMagReload(FireModeNum) || FireModeNum == BLOCK_FIREMODE || FireModeNum == HEAVY_ATK_FIREMODE;
}

/*********************************************************************************************
 * State MeleeBlocking
  * This is the default Blocking State.  It's performed on both the client and the server.
 *********************************************************************************************/

simulated state MeleeBlocking
{
	// Override to play BlockLoopNoGasAnim
	simulated function BlockLoopTimer()
	{
		if( AmmoCount[1] <= 0 && Instigator.IsLocallyControlled() )
		{
			PlayAnimation(BlockLoopNoGasAnim, , true);
		}

		Super.BlockLoopTimer();
	}
}

/*********************************************************************************************
 * State MeleeSustained
 * Derived to prevent Active:BeginState from playing the looping idle sound from UpdateOutOfAmmoEffects after the super changes the state to MeleeSustained
 *********************************************************************************************/

simulated state MeleeSustained
{
	// This prevents the Active:BeginState from playing the looping idle sound after the super changes the state to MeleeSustained
	ignores UpdateOutOfAmmoEffects;
}

/*********************************************************************************************
 * Trader
 ********************************************************************************************/

/** Allows weapon to calculate its own damage for display in trader
  * While eviscerator is a melee weapon, it does more damage with its default fire projectile
  */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float CalculatedDamage;
	local class<KFDamageType> DamageType;

	CalculatedDamage = default.InstantHitDamage[DEFAULT_FIREMODE];

	DamageType = class<KFDamageType>(default.InstantHitDamageTypes[DEFAULT_FIREMODE]);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		CalculatedDamage += (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (CalculatedDamage * DamageType.default.DoT_DamageScale);
	}

	return CalculatedDamage;
}

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Projectile;
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Melee;
}

/*********************************************************************************************
 * State WeaponSingleFiring
  * Handle special BlockInterruptTimer for this weapon's unusually long FireInterval
 *********************************************************************************************/

simulated function BlockInterruptTimer();

simulated state WeaponSingleFiring
{
	/** Set cooldown duration */
	simulated function BeginState( Name PreviousStateName )
	{
		local float CheckBlockInterruptTime;

		CheckBlockInterruptTime = FireInterval[CurrentFireMode] - BlockInterruptFiringTime;
		if ( BlockInterruptFiringTime > 0 && CheckBlockInterruptTime > 0 )
		{
			SetTimer(CheckBlockInterruptTime, false, nameof(BlockInterruptTimer));
		}

		Super.BeginState(PreviousStateName);
	}

	simulated function EndState(Name NextStateName)
	{
		ClearTimer( nameof(BlockInterruptTimer) );
		Super.EndState(NextStateName);
	}

	/** Check for pending fire */
	simulated function BlockInterruptTimer()
	{
		if ( PendingFire(BLOCK_FIREMODE) && HasAmmo(BLOCK_FIREMODE) )
		{
			SendToFiringState(BLOCK_FIREMODE);
		}
	}

	/** Check for interrupt near end of state */
	simulated function BeginFire(byte FireModeNum)
	{
		Global.BeginFire(FireModeNum);

		if ( FireModeNum == BLOCK_FIREMODE && BlockInterruptFiringTime > 0 )
		{
			if( HasAmmo(FireModeNum) && !IsTimerActive(nameof(BlockInterruptTimer)) )
			{
				SendToFiringState(FireModeNum);
			}
		}
	}
}

defaultproperties
{
   IdleMotorSound=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Idle_Loop'
   BlockInterruptFiringTime=0.500000
   ParryStrength=5
   MeleeSustainedWarmupTime=0.100000
   BlockDamageMitigation=0.400000
   ParryDamageMitigationPercent=0.300000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   PackageKey="SawBlade"
   FirstPersonMeshName="WEP_1P_SawBlade_MESH.Wep_1stP_SawBlade_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_SawBlade_ANIM.WEP_1P_SawBlade_ANIM"
   FirstPersonAnimTree="WEP_1P_SawBlade_ANIM.1P_Sawblade_Animtree"
   PickupMeshName="WEP_3P_SawBlade_MESH.Wep_SawShooter_Pickup"
   AttachmentArchetypeName="WEP_Sawblade_ARCH.Wep_Eviscerator_3P"
   MuzzleFlashTemplateName="WEP_Sawblade_ARCH.Wep_Sawblade_MuzzleFlash"
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   bHasLaserSight=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Sawblade'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=()
   InventoryGroup=IG_Primary
   InventorySize=8
   MagazineCapacity(0)=5
   MagazineCapacity(1)=250
   PenetrationPower(0)=4.000000
   PenetrationPower(1)=()
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=8192)
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_SawbladeShooter'
   AmmoCost(0)=1
   AmmoCost(1)=()
   AmmoCost(2)=()
   AmmoCost(3)=()
   AmmoCost(4)=()
   AmmoCost(5)=1
   SpareAmmoCapacity(0)=25
   AmmoPickupScale(1)=0.200000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
   bLoopingFireAnim(0)=False
   bLoopingFireAnim(1)=False
   bLoopingFireAnim(2)=False
   bLoopingFireAnim(3)=False
   bLoopingFireAnim(4)=False
   bLoopingFireAnim(5)=True
   bLoopingFireSnd(0)=False
   bLoopingFireSnd(1)=False
   bLoopingFireSnd(2)=False
   bLoopingFireSnd(3)=False
   bLoopingFireSnd(4)=False
   bLoopingFireSnd(5)=True
   MeleeAttackAnims(0)="Atk_B"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_1P')
   WeaponFireSnd(1)=()
   WeaponFireSnd(2)=()
   WeaponFireSnd(3)=()
   WeaponFireSnd(4)=()
   WeaponFireSnd(5)=(DefaultCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_Alt_LoopStart_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_Alt_LoopStart_1P')
   WeaponFireLoopEndSnd(5)=(DefaultCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_Alt_LoopEnd_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Fire_Alt_LoopEnd_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Handling_DryFire'
   WeaponDryFireSnd(1)=None
   WeaponDryFireSnd(2)=None
   WeaponDryFireSnd(3)=None
   WeaponDryFireSnd(4)=None
   WeaponDryFireSnd(5)=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Handling_DryFire'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      MaxHitRange=180.000000
      MeleeImpactCamShake=KFCameraShake'FX_CameraShake_Arch.Melee.Eviscerator'
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Eviscerator:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(IncrementDamage=1.200000)
   WeaponUpgrades(2)=(IncrementWeight=2,IncrementDamage=1.300000)
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)="MeleeSustained"
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponFireTypes(5)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Blade_Eviscerator'
   FireInterval(0)=0.950000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   FireInterval(5)=0.120000
   Spread(0)=0.020000
   InstantHitDamage(0)=250.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=75.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_EvisceratorProj'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Slashing_Eviscerator'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_Eviscerator'
   FireOffset=(X=25.000000,Y=5.000000,Z=-10.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
      MinTickTimeStep=0.025000
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Eviscerator"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Eviscerator"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
