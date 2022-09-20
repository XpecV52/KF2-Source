//=============================================================================
// KFWeap_AutoTurret
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AutoTurret extends KFWeap_ThrownBase;



const DETONATE_FIREMODE = 5; // NEW - IronSights Key

var(Animations) const editconst name DetonateAnim;
var(Animations) const editconst name DetonateLastAnim;

/** Sound to play upon successful detonation */
var() AkEvent DetonateAkEvent;

/** Strenght applied to forward dir to get the throwing velocity */
var const float ThrowStrength;
/** Max num of turrets that can be deployed */
var const byte MaxTurretsDeployed;
/** Offset to spawn the dron (screen coordinates) */
var const vector TurretSpawnOffset;

var transient byte NumDeployedTurrets;
var transient KFPlayerController KFPC;

/** If the turret is in a state available for throw another to fix some animation issues. */
var transient bool bTurretReadyToUse;

var repnotify float CurrentAmmoPercentage;

const TransitionParamName = 'transition_full_to_empty';
const EmptyParamName = 'Blinking_0_off___1_on';

var transient bool bDetonateLocked;

replication
{
    if( bNetDirty )
		NumDeployedTurrets, CurrentAmmoPercentage, bTurretReadyToUse;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(CurrentAmmoPercentage))
	{
		UpdateMaterialColor(CurrentAmmoPercentage);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated event PreBeginPlay()
{
	local class<KFWeap_AutoTurretWeapon>  WeaponClass;

	super.PreBeginPlay();

    WeaponClass = class<KFWeap_AutoTurretWeapon> (DynamicLoadObject(class'KFPawn_AutoTurret'.default.WeaponDefinition.default.WeaponClassPath, class'Class'));
	WeaponClass.static.TriggerAsyncContentLoad(WeaponClass);
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if (Role == ROLE_Authority)
	{
		KFPC = KFPlayerController(Instigator.Controller);
		NumDeployedTurrets = KFPC.DeployedTurrets.Length;
	}
}

/** Route ironsight player input to detonate */
simulated function SetIronSights(bool bNewIronSights)
{
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	if ( bNewIronSights )
	{
		StartFire(DETONATE_FIREMODE);
	}
	else
	{
		StopFire(DETONATE_FIREMODE);
	}
}

/** Overridded to add spawned turret to list of spawned turrets */
simulated function Projectile ProjectileFire()
{
	local vector SpawnLocation, SpawnDirection;
    local KFPawn_AutoTurret SpawnedActor;

	if (Role == ROLE_Authority && CurrentFireMode == DEFAULT_FIREMODE)
	{
		GetTurretSpawnLocationAndDir(SpawnLocation, SpawnDirection);
		SpawnedActor = Spawn(class'KFPawn_AutoTurret', self,, SpawnLocation + (TurretSpawnOffset >> Rotation), Rotation,,true);
		
		if( SpawnedActor != none )
		{
			SpawnedActor.OwnerWeapon = self;
			SpawnedActor.SetPhysics(PHYS_Falling);
			SpawnedActor.Velocity = SpawnDirection * ThrowStrength;
			SpawnedActor.UpdateInstigator(Instigator);
			SpawnedActor.UpdateWeaponUpgrade(CurrentWeaponUpgradeIndex);
			SpawnedActor.SetTurretState(ETS_Throw);

			KFPC.DeployedTurrets.AddItem( SpawnedActor );
			NumDeployedTurrets = KFPC.DeployedTurrets.Length;
			bTurretReadyToUse  = false;
			bForceNetUpdate    = true;
		}

		return none;
	}
	else
	{
		return super.ProjectileFire();
	}
	
	return none;
}

simulated function GetTurretSpawnLocationAndDir(out vector SpawnLocation, out vector SpawnDirection)
{
	local vector		StartTrace, EndTrace, RealStartLoc, AimDir;
	local ImpactInfo	TestImpact;
	local vector DirA, DirB;
	local Quat Q;

	// This is where we would start an instant trace. (what CalcWeaponFire uses)
	StartTrace = GetSafeStartTraceLocation();
	AimDir = Vector(GetAdjustedAim( StartTrace ));

	// this is the location where the projectile is spawned.
	RealStartLoc = GetPhysicalFireStartLoc(AimDir);

	if( StartTrace != RealStartLoc )
	{
		// if projectile is spawned at different location of crosshair,
		// then simulate an instant trace where crosshair is aiming at, Get hit info.
		EndTrace = StartTrace + AimDir * GetTraceRange();
		TestImpact = CalcWeaponFire( StartTrace, EndTrace );
		// Store the original aim direction without correction
		DirB = AimDir;

		// Then we realign projectile aim direction to match where the crosshair did hit.
		AimDir = Normal(TestImpact.HitLocation - RealStartLoc);

		// Store the desired corrected aim direction
		DirA = AimDir;

		// Clamp the maximum aim adjustment for the AimDir so you don't get wierd
		// cases where the projectiles velocity is going WAY off of where you
		// are aiming. This can happen if you are really close to what you are
		// shooting - Ramm
		if ( (DirA dot DirB) < MaxAimAdjust_Cos )
		{
			Q = QuatFromAxisAndAngle(Normal(DirB cross DirA), MaxAimAdjust_Angle);
			AimDir = QuatRotateVector(Q,DirB);
		}
	}

	SpawnDirection = AimDir;
	SpawnLocation = RealStartLoc;
}

/** Detonates the oldest turret */
simulated function Detonate()
{
	local int i;
	local array<Actor> TurretsCopy;

	// auto switch weapon when out of ammo and after detonating the last deployed turret
	if( Role == ROLE_Authority )
	{
		TurretsCopy = KFPC.DeployedTurrets;
		for (i = 0; i < TurretsCopy.Length; i++)
		{
			KFPawn_AutoTurret(TurretsCopy[i]).SetTurretState(ETS_Detonate);
		}

		KFPC.DeployedTurrets.Remove(0, KFPC.DeployedTurrets.Length);

		SetReadyToUse(true);

		if( !HasAnyAmmo() && NumDeployedTurrets == 0 )
		{
			if( CanSwitchWeapons() )
			{
	            Instigator.Controller.ClientSwitchToBestWeapon(false);
			}
		}
	}
}

/** Removes a turret from the list using either an index or an actor and updates NumDeployedTurrets */
function RemoveDeployedTurret( optional int Index = INDEX_NONE, optional Actor TurretActor )
{
	if( Index == INDEX_NONE )
	{
		if( TurretActor != none )
		{
			Index = KFPC.DeployedTurrets.Find( TurretActor );
		}
	}

	if( Index != INDEX_NONE )
	{
		KFPC.DeployedTurrets.Remove( Index, 1 );
		NumDeployedTurrets = KFPC.DeployedTurrets.Length;
		bForceNetUpdate = true;
	}
}

function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	local int i;

	super.SetOriginalValuesFromPickup( PickedUpWeapon );

	if (PickedUpWeapon.KFPlayer != none && PickedUpWeapon.KFPlayer != KFPC)
	{
		KFPC.DeployedTurrets = PickedUpWeapon.KFPlayer.DeployedTurrets;
	}

	PickedUpWeapon.KFPlayer = none;

	NumDeployedTurrets   = KFPC.DeployedTurrets.Length;
	bForceNetUpdate      = true;

	for( i = 0; i < NumDeployedTurrets; ++i )
	{
		// charge alerts (beep, light) need current instigator
		KFPC.DeployedTurrets[i].Instigator = Instigator;
        KFPC.DeployedTurrets[i].SetOwner(self);

		if( Instigator.Controller != none )
        {
			KFPawn_AutoTurret(KFPC.DeployedTurrets[i]).InstigatorController = Instigator.Controller;
		}
	}
}


/**
 * Drop this item out in to the world
 */
function DropFrom(vector StartLocation, vector StartVelocity)
{
	local DroppedPickup P;

	// Offset spawn closer to eye location
	StartLocation.Z += Instigator.BaseEyeHeight / 2;

	// for some reason, Inventory::DropFrom removes weapon from inventory whether it was able to spawn the pickup or not.
	// we only want the weapon removed from inventory if pickup was successfully spawned, so instead of calling the supers,
	// do all the super functionality here.

	if( !CanThrow() )
	{
		return;
	}

	if( DroppedPickupClass == None || DroppedPickupMesh == None )
	{
		Destroy();
		return;
	}

	// the last bool param is to prevent collision from preventing spawns
	P = Spawn(DroppedPickupClass,,, StartLocation,,,true);
	if( P == None )
	{
		// if we can't spawn the pickup (likely for collision reasons),
		// just return without removing from inventory or destroying, which removes from inventory
		PlayerController(Instigator.Controller).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_FailedDropInventory );
		return;
	}

	if( Instigator != None && Instigator.InvManager != None )
	{
		Instigator.InvManager.RemoveFromInventory(Self);

		if( Instigator.IsAliveAndWell() && !Instigator.InvManager.bPendingDelete )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDropWeaponDialog( KFPawn(Instigator) );
		}
	}

	SetupDroppedPickup( P, StartVelocity );

	KFDroppedPickup(P).PreviousOwner = KFPlayerController(Instigator.Controller);

	Instigator = None;
	GotoState('');

	AIController = None;
}

 /**
 * Returns true if this weapon uses a secondary ammo pool
 */
static simulated event bool UsesAmmo()
{
    return true;
}

simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
{
	if( FireModeNum == DETONATE_FIREMODE )
	{
		return NumDeployedTurrets > 0;
	}

	return super.HasAmmo( FireModeNum, Amount );
}

simulated function BeginFire( byte FireModeNum )
{
	// Clear any pending detonate if we pressed the main fire
	// That prevents strange holding right click behaviour and sound issues
	if (FireModeNum == DEFAULT_FIREMODE)
	{
		ClearPendingFire(DETONATE_FIREMODE);
	}

	if (FireModeNum == DETONATE_FIREMODE )
	{
		if (bDetonateLocked)
		{
			return;
		}

		if (NumDeployedTurrets > 0 && bTurretReadyToUse)
		{
			PrepareAndDetonate();
		}
	}
	else
	{
		if (FireModeNum == DEFAULT_FIREMODE
			&& NumDeployedTurrets >= MaxTurretsDeployed
			&& HasAnyAmmo())
		{
			if (!bTurretReadyToUse)
			{
				return;
			}

			PrepareAndDetonate();
		}
		
		super.BeginFire( FireModeNum );
	}
}

simulated function PrepareAndDetonate()
{
	local name DetonateAnimName;
	local float AnimDuration;
	local bool bInSprintState;

	DetonateAnimName = ShouldPlayLastAnims() ? DetonateLastAnim : DetonateAnim;
	AnimDuration = MySkelMesh.GetAnimLength( DetonateAnimName );
	bInSprintState = IsInState( 'WeaponSprinting' );

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( NumDeployedTurrets > 0 )
		{
			PlaySoundBase( DetonateAkEvent, true );
		}

		if( bInSprintState )
		{
			AnimDuration *= 0.25f;
			PlayAnimation( DetonateAnimName, AnimDuration );
		}
		else
		{
			PlayAnimation( DetonateAnimName );
		}
	}

	if( Role == ROLE_Authority )
	{
		Detonate();
	}

	IncrementFlashCount();

	if( bInSprintState )
	{
		SetTimer( AnimDuration * 0.8f, false, nameof(PlaySprintStart) );
	}
	else
	{
		SetTimer( AnimDuration * 0.5f, false, nameof(GotoActiveState) );
	}
}

// do nothing, as we have no alt fire mode
simulated function AltFireMode();

/** Allow weapons with abnormal state transitions to always use zed time resist*/
simulated function bool HasAlwaysOnZedTimeResist()
{
    return true;
}

/*********************************************************************************************
 * State Active
 * A Weapon this is being held by a pawn should be in the active state.  In this state,
 * a weapon should loop any number of idle animations, as well as check the PendingFire flags
 * to see if a shot has been fired.
 *********************************************************************************************/

simulated state Active
{
	/** Overridden to prevent playing fidget if play has no more ammo */
	simulated function bool CanPlayIdleFidget(optional bool bOnReload)
	{
		if( !HasAmmo(0) )
		{
			return false;
		}

		return super.CanPlayIdleFidget( bOnReload );
	}
}

/*********************************************************************************************
 * State WeaponDetonating
 * The weapon is in this state while detonating a charge
*********************************************************************************************/

simulated function GotoActiveState();

simulated state WeaponDetonating
{
	ignores AllowSprinting;

	simulated event BeginState( name PreviousStateName )
	{
		PrepareAndDetonate();
	}

	simulated function GotoActiveState()
	{
		GotoState('Active');
	}
}

/*********************************************************************************************
 * State WeaponThrowing
 * Handles throwing weapon (similar to state GrenadeFiring)
 *********************************************************************************************/

simulated state WeaponThrowing
{
	/** Never refires.  Must re-enter this state instead. */
	simulated function bool ShouldRefire()
	{
		return false;
	}

    simulated function EndState(Name NextStateName)
    {
        local KFPerk InstigatorPerk;

        Super.EndState(NextStateName);

        //Targeted fix for Demolitionist w/ the C4.  It should remain in zed time  while waiting on
        //      the fake reload to be triggered.  This will return 0 for other perks.
        InstigatorPerk = GetPerk();
        if( InstigatorPerk != none )
        {
            SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
        }
    }
}

/*********************************************************************************************
 * State WeaponEquipping
 * The Weapon is in this state while transitioning from Inactive to Active state.
 * Typically, the weapon will remain in this state while its selection animation is being played.
 * While in this state, the weapon cannot be fired.
*********************************************************************************************/

simulated state WeaponEquipping
{
	simulated event BeginState( name PreviousStateName )
	{
		super.BeginState( PreviousStateName );

		// perform a "reload" if we refilled our ammo from empty while it was unequipped
		if( !HasAmmo(THROW_FIREMODE) && HasSpareAmmo() )
		{
			PerformArtificialReload();
		}
		StopFire(DETONATE_FIREMODE);
	}
}

/*********************************************************************************************
 * State WeaponPuttingDown
 * Putting down weapon in favor of a new one.
 * Weapon is transitioning to the Inactive state.
 *
 * Detonating while putting down causes C4 not to be put down, which causes problems, so let's
 * just ignore SetIronSights, which causes detonation
*********************************************************************************************/

simulated state WeaponPuttingDown
{
	ignores SetIronSights;

	simulated event BeginState( name PreviousStateName )
	{
		super.BeginState( PreviousStateName );
		StopFire(DETONATE_FIREMODE);
	}
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Explosive;
}

function CheckTurretAmmo()
{
	local float Percentage;
	local KFWeapon Weapon;
	local KFPawn KFP;

	if (Role == Role_Authority)
	{
		if (KFPC == none)
		{
			return;
		}

		if (KFPC.DeployedTurrets.Length > 0)
		{
			Weapon = KFWeapon(KFPawn_AutoTurret(KFPC.DeployedTurrets[0]).Weapon);
			if (Weapon != none)
			{
				Percentage = float(Weapon.AmmoCount[0]) / Weapon.MagazineCapacity[0];
				if (Percentage != CurrentAmmoPercentage)
				{
					CurrentAmmoPercentage = Percentage;
					bNetDirty = true;

					if (WorldInfo.NetMode == NM_Standalone)
					{
						UpdateMaterialColor(CurrentAmmoPercentage);
					}
					else
					{
						KFP = KFPawn(Instigator);
						if (KFP != none)
						{
							KFP.OnWeaponSpecialAction( 1 + (CurrentAmmoPercentage * 100) );
						}
					}
				}
			}
		}
	}
}

function SetReadyToUse(bool bReady)
{
	if (bTurretReadyToUse != bReady)
	{
		bTurretReadyToUse = bReady;
		bNetDirty = true;
	}
}

simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	if (Role == Role_Authority)
	{
		CheckTurretAmmo();
	}
}

simulated function UpdateMaterialColor(float Percentage)
{
	if (NumDeployedTurrets == 0)
	{
		WeaponMICs[2].SetScalarParameterValue(EmptyParamName, 0);
	}
	else if (Percentage >= 0)
	{
		WeaponMICs[2].SetScalarParameterValue(TransitionParamName, 1.0f - Percentage);
		WeaponMICs[2].SetScalarParameterValue(EmptyParamName, Percentage == 0 ? 1 : 0);
	}
}

simulated function SetWeaponUpgradeLevel(int WeaponUpgradeLevel)
{
	local Actor Turret;
	local KFPawn_AutoTurret TurretPawn;

	super.SetWeaponUpgradeLevel(WeaponUpgradeLevel);

	if (KFPC != none)
	{
		foreach KFPC.DeployedTurrets(Turret)
		{
			TurretPawn = KFPawn_AutoTurret(Turret);
			if (TurretPawn != none)
			{
				TurretPawn.UpdateWeaponUpgrade(WeaponUpgradeLevel);
			}
		}
	}
}

/**
 *	GRENADE FIRING
 *  There's a bug that alt fire interrupts the grenade anim at any moment,
 *  This avoids being able to altfire until the throw animation ends or the
 *  interrupt notify is reached.
 */

simulated state GrenadeFiring 
{
	simulated function EndState(Name NextStateName)
	{
		ClearDetonateLock();
		Super.EndState(NextStateName);
	}
}


/** Play animation at the start of the GrenadeFiring state */
simulated function PlayGrenadeThrow()
{
    local name WeaponFireAnimName;
	local float InterruptTime;

    PlayFiringSound(CurrentFireMode);

    if( Instigator != none && Instigator.IsFirstPerson() )
    {
    	WeaponFireAnimName = GetGrenadeThrowAnim();

    	if ( WeaponFireAnimName != '' )
    	{
			InterruptTime = MySkelMesh.GetAnimInterruptTime(WeaponFireAnimName);
    		PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),,FireTweenTime);
    	
			bDetonateLocked = true;
			SetTimer(InterruptTime, false, nameof(ClearDetonateLock));
		}
    }
}

simulated function ClearDetonateLock()
{
	bDetonateLocked = false;
	ClearTimer(nameof(ClearDetonateLock));
}

/***/


///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own stats for display in trader */
static simulated event SetTraderWeaponStats( out array<STraderItemWeaponStats> WeaponStats )
{
	super.SetTraderWeaponStats(WeaponStats);

	WeaponStats.Length = 4;

	WeaponStats[0].StatType = TWS_Damage;
	WeaponStats[0].StatValue = class'KFWeap_AutoTurretWeapon'.static.CalculateTraderWeaponStatDamage();

	WeaponStats[1].StatType = TWS_Penetration;
	WeaponStats[1].StatValue = class'KFWeap_AutoTurretWeapon'.default.PenetrationPower[DEFAULT_FIREMODE];

	WeaponStats[2].StatType = TWS_Range;
	// This is now set in native since EffectiveRange has been moved to KFWeaponDefinition
	// WeaponStats[2].StatValue = CalculateTraderWeaponStatRange();

	WeaponStats[3].StatType = TWS_RateOfFire;
	WeaponStats[3].StatValue = class'KFWeap_AutoTurretWeapon'.static.CalculateTraderWeaponStatFireRate();
}

defaultproperties
{
   DetonateAnim="Detonate"
   DetonateLastAnim="Detonate_Last"
   DetonateAkEvent=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Detonate_Trigger'
   ThrowStrength=1350.000000
   MaxTurretsDeployed=1
   TurretSpawnOffset=(X=0.000000,Y=15.000000,Z=-50.000000)
   PackageKey="AutoTurret"
   FirstPersonMeshName="Wep_1P_AutoTurret_MESH.Wep_1stP_AutoTurret_Rig"
   FirstPersonAnimSetNames(0)="Wep_1P_AutoTurret_ANIM.Wep_1P_AutoTurret_ANIM"
   PickupMeshName="wep_3p_autoturret_mesh.Wep_AutoTurret_Pickup"
   AttachmentArchetypeName="WEP_AutoTurret_ARCH.Wep_AutoTurret_3P"
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Drone'
   FireModeIconPaths(1)=()
   InventoryGroup=IG_Equipment
   InventorySize=3
   GroupPriority=11.000000
   WeaponSelectTexture=Texture2D'WEP_UI_AutoTurret_TEX.UI_WeaponSelect_AutoTurret'
   MagazineCapacity(0)=1
   AmmoCost(2)=0
   AmmoCost(3)=0
   AmmoCost(4)=0
   AmmoCost(5)=0
   SpareAmmoCapacity(0)=3
   InitialSpareMags(0)=1
   FireAnim="C4_Throw"
   FireLastAnim="C4_Throw_Last"
   PlayerViewOffset=(X=6.000000,Y=2.000000,Z=-4.000000)
   NumBloodMapMaterials=3
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ThrownBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ThrownBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AutoTurret:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.300000),(Stat=EWUS_Damage1,Scale=1.300000),(Add=2)))
   CurrentFireMode=5
   FiringStatesArray(5)="WeaponDetonating"
   WeaponFireTypes(5)=EWFT_Custom
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_AutoTurret'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ThrownBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ThrownBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Sentinel"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ThrownBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ThrownBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AutoTurret"
   ObjectArchetype=KFWeap_ThrownBase'KFGame.Default__KFWeap_ThrownBase'
}
