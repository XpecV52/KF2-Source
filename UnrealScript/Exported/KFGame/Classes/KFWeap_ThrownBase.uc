//=============================================================================
// KFWeap_ThrownBase
//=============================================================================
// Base class used for weapons that are thrown
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class KFWeap_ThrownBase extends KFWeapon
	abstract;

const THROW_FIREMODE		= 0; // DEFAULT_FIREMODE

var(Animations) const editconst array<name> IdleLastAnims;
var(Animations) const editconst array<name>	IdleLastPickupAnims;

/** Default melee attack animation names when out of ammo */
var(Animations) const editconst array<name> MeleeAttackLastAnims;

var(Animations) const editconst name		EquipLastAnim;
var(Animations) const editconst name		PutDownLastAnim;

const SprintInLastAnim = 'Sprint_In_Last';
const SprintLoopLastAnim = 'Sprint_Loop_Last';
const SprintOutLastAnim = 'Sprint_Out_Last';

const NadeThrowLastAnim = 'Nade_Throw_Last';

/** Time between throwing a projectile and modifying spare ammo since we don't do a proper reload */
var float ConsumeSpareAmmoDelay;

/** If set execute PerformReload on client only and synchronize at end of state 
  * MUST MATCH SAME DEFINE IN KFWEAPON
  */


/** Whether we should use "last" (empty-handed) anims */
simulated function bool ShouldPlayLastAnims()
{
	return GetTotalAmmoAmount(THROW_FIREMODE) <= 0;
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetMeleeAnimName(EPawnOctant AtkDir, EMeleeAttackType AtkType)
{
	local int idx;

	if( ShouldPlayLastAnims() )
	{
		if( MeleeAttackLastAnims.Length > 0 )
		{
			// These are randomely selected, so anim lengths should match!
			idx = Rand(MeleeAttackLastAnims.Length);
			return MeleeAttackLastAnims[idx];
		}
	}
	else
	{
		if( MeleeAttackAnims.Length > 0 )
		{
			// These are randomely selected, so anim lengths should match!
			idx = Rand(MeleeAttackAnims.Length);
			return MeleeAttackAnims[idx];
		}
	}
}

/** Get putdown anim name 
  * Overridden to play "last" anim  
  */
simulated function name GetWeaponPutDownAnimName()
{
	return ShouldPlayLastAnims() ? PutDownLastAnim : super.GetWeaponPutDownAnimName();
}

/** Get sprint start anim name 
  * Overridden to play "last" anim  
  */
simulated function name GetSprintStartAnimName()
{
	return ShouldPlayLastAnims() ? SprintInLastAnim : super.GetSprintStartAnimName();
}

/** Get sprint loop anim name 
  * Overridden to play "last" anim  
  */
simulated function name GetSprintLoopAnimName()
{
	return ShouldPlayLastAnims() ? SprintLoopLastAnim : super.GetSprintLoopAnimName();
}

/** Get sprint end anim name 
  * Overridden to play "last" anim  
  */
simulated function name GetSprintEndAnimName()
{
	return ShouldPlayLastAnims() ? SprintOutLastAnim : super.GetSprintEndAnimName();
}

/** Get equip anim name 
  * Overridden to play "last" anim  
  */
simulated function name GetEquipAnimName()
{
	return ShouldPlayLastAnims() ? EquipLastAnim : super.GetEquipAnimName();
}

/** Get nade throw anim name 
  * Overridden to play "last" anim  
  */
simulated function name GetGrenadeThrowAnim()
{
	return ShouldPlayLastAnims() ? NadeThrowLastAnim : super.GetGrenadeThrowAnim();
}

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if( GetTotalAmmoAmount(THROW_FIREMODE) == 0 )
    {
        return true;
    }

    return false;
}

/** There is no reloading thrown weapons */
simulated function bool ShouldAutoReload( byte FireModeNum )
{
	return false;
}

/*********************************************************************************************
 * State Active
 * A Weapon this is being held by a pawn should be in the active state.  In this state,
 * a weapon should loop any number of idle animations, as well as check the PendingFire flags
 * to see if a shot has been fired.
 *********************************************************************************************/

simulated state Active
{
	simulated event BeginState( name PreviousStateName )
	{
		super.BeginState( PreviousStateName );

		// Reload immediately after coming back to active state if we managed to pick up ammo while sprinting
		if( PreviousStateName == 'WeaponSprinting' && !HasAmmo(THROW_FIREMODE) && HasSpareAmmo() )
		{
			PerformArtificialReload();
		}
	}
	
	/** overridden to add "idle last" anims if out of ammo */
	simulated function PlayIdleAnim()
	{
		local int IdleIndex;

		if ( Instigator.IsFirstPerson() )
		{
			if( bUsingSights && IdleSightedAnims.Length > 0 )
			{
				IdleIndex = Rand(IdleSightedAnims.Length);
				PlayAnimation(IdleSightedAnims[IdleIndex], 0.0, true, 0.1);

				StartIdleFidgetTimer();
			}
			else if( ShouldPlayFireLast(THROW_FIREMODE) && IdleLastAnims.Length > 0 )
			{
				IdleIndex = Rand(IdleLastAnims.Length);
				PlayAnimation(IdleLastAnims[IdleIndex], 0.0, true, 0.2);

				// don't start idle fidget timer if we are out of ammo, because at the moment fidgets use the projectile model
				// @todo: update fidget system to account for hidden projectile mesh?
			//StartIdleFidgetTimer();
			}
			else if ( IdleAnims.Length > 0 )
			{
				IdleIndex = Rand(IdleAnims.Length);
				PlayAnimation(IdleAnims[IdleIndex], 0.0, true, 0.2);

				StartIdleFidgetTimer();
			}

			ToggleAdditiveBobAnim(!bUsingSights);
		}
	}

	/** Overridden to play pickup anim. Calls global. */
	function int AddAmmo( int Amount )
	{
		local int OldAmmo, AmmoAdded;

		OldAmmo = AmmoCount[0];

		AmmoAdded = Global.AddAmmo( Amount );

		if( OldAmmo == 0 && AmmoAdded > 0 )
		{
			ClientNotifyAmmoAddedEmpty();
		}

		return AmmoAdded;
	}
}

/** Notification for when we were empty but now we're not (perform a "reload") */
reliable client function ClientNotifyAmmoAddedEmpty()
{
	local int IdleIndex;

	IdleIndex = Rand(IdleLastPickupAnims.Length);
	PlayAnimation(IdleLastPickupAnims[IdleIndex], 0.0, false, 0.2);
	
	// time forcereload to when we pull up a new projectile
	SetTimer( ConsumeSpareAmmoDelay, false, nameof(PerformArtificialReload) );
}

/*********************************************************************************************
 * State WeaponThrowing
 * Handles throwing weapon (similar to state GrenadeFiring)
 *********************************************************************************************/

simulated state WeaponThrowing extends WeaponSingleFiring
{
	// Overriden to not call FireAmmunition right at the start of the state
    simulated event BeginState( Name PreviousStateName )
	{
		local name WeaponFireAnimName;

		LogInternal(WorldInfo.TimeSeconds @ "Self:" @ Self @ "Instigator:" @ Instigator @ GetStateName() $ "::" $ GetFuncName() @ "PreviousStateName:" @ PreviousStateName,'Inventory');

		ConsumeAmmo(CurrentFireMode);

		// play animation here since we're not calling super (because we don't want to call FireAmmunition yet)
		if( Instigator != none && Instigator.IsFirstPerson() )
	    {
	    	WeaponFireAnimName = GetWeaponFireAnim(CurrentFireMode);
	    	if ( WeaponFireAnimName != '' )
	    	{
	    		PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
	    	}
	    }

	    // set timer for spawning projectile
		TimeWeaponFiring(CurrentFireMode);
		ClearPendingFire(CurrentFireMode);

		NotifyBeginState();

		// time forcereload to when we pull up a new projectile
		SetTimer( ConsumeSpareAmmoDelay, false, nameof(PerformArtificialReload) );

		// called here and ignored in ProjectileFire in EndState because we want to play the 3p anims now
		IncrementFlashCount();
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		NotifyEndState();

		// Spawn projectile
		// (don't use FireAmmunition because that causes FireAnim to be played again)
		ProjectileFire();
		NotifyWeaponFired(CurrentFireMode);
	}
}

/** Does reload stuff without going to reload state or playing reload anims since we don't have them */
simulated function PerformArtificialReload()
{
	PerformReload();
	

	if( bAllowClientAmmoTracking && Role < ROLE_Authority )
	{
		InitializeReload();
		ServerSyncReload(SpareAmmoCount[0]);
	}

}

/** Called from KFWeapon.ProjectileFire(), overridden because we call IncrementFlashCount in WeaponThrowing.BeginState */
simulated function bool ShouldIncrementFlashCountOnFire()
{
	return false;
}

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own damage for display in trader.
  * Overridden to use projectile damage.
  */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float BaseDamage, DoTDamage;
	local class<KFProjectile> ProjClass;
	local class<KFDamageType> DamageType;

	ProjClass = class<KFProjectile>( default.WeaponProjectiles[THROW_FIREMODE] );

	if( ProjClass.default.ExplosionTemplate != none )
	{
		BaseDamage = ProjClass.default.ExplosionTemplate.Damage;
		DamageType = class<KFDamageType>( ProjClass.default.ExplosionTemplate.default.MyDamageType );
	}
	else
	{
		BaseDamage = ProjClass.default.Damage;
		DamageType = class<KFDamageType>( ProjClass.default.MyDamageType );
	}

	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
	}

	return BaseDamage + DoTDamage;
}

defaultproperties
{
   IdleLastAnims(0)="Idle_Last"
   IdleLastPickupAnims(0)="Idle_Last_Pickup"
   MeleeAttackLastAnims(0)="Bash_Last"
   EquipLastAnim="Equip_Last"
   PutDownLastAnim="Putaway_Last"
   ConsumeSpareAmmoDelay=1.000000
   bHasFireLastAnims=True
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=8192)
   FireAnim="Throw"
   FireLastAnim="Throw_Last"
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ThrownBase:MeleeHelper_0'
   FiringStatesArray(0)="WeaponThrowing"
   FiringStatesArray(1)=()
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FireInterval(0)=0.600000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
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
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_ThrownBase"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
