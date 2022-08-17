//=============================================================================
// KFWeap_Thrown_C4
//=============================================================================
// C4 explosives
//=============================================================================
// Killing Floor 2
// Copyright (C) 2014-2015 Tripwire Interactive LLC
// Greg Felber / Jeff Robinson
//=============================================================================

class KFWeap_Thrown_C4 extends KFWeap_ThrownBase;

const DETONATE_FIREMODE		= 5; // NEW - IronSights Key

var(Animations) const editconst name DetonateAnim;
var(Animations) const editconst name DetonateLastAnim;

/** List of spawned charges (will be detonated oldest to youngest) */
var array<KFProj_Thrown_C4> DeployedCharges;
var class<KFGFxWorld_C4Screen> ScreenUIClass;
var KFGFxWorld_C4Screen ScreenUI;

var float TimeSinceLastUpdate;
var float UpdateInterval; //Seconds

/** Sound to play upon successful detonation */
var() AkEvent DetonateAkEvent;
/** Sound to play upon attempted but unsuccessful detonation */
var() AkEvent DryFireAkEvent;

/** Same as DeployedCharges.Length, but replicated because charges are only tracked on server */
var int NumDeployedCharges;

replication
{
	if( bNetDirty )
		NumDeployedCharges;
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

/** Turn on the UI screen when we equip the healer */
simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{
	super.AttachWeaponTo( MeshCpnt, SocketName );

	if( Instigator != none && Instigator.IsLocallyControlled() )
	{
		// Create the screen's UI piece
		if (ScreenUI == none)
		{
			ScreenUI = new( self ) ScreenUIClass;
			ScreenUI.Init();
			ScreenUI.Start(true);
		}

		if ( ScreenUI != none)
		{
			ScreenUI.SetPause(false);
		}
	}
}

/** Turn off the UI screen when we unequip the weapon */
simulated function DetachWeapon()
{
	super.DetachWeapon();
	if ( Instigator != none && Instigator.IsLocallyControlled() && ScreenUI != none )
	{
		ScreenUI.SetPause();
	}
}

simulated event Destroyed()
{
	if ( Instigator != none && Instigator.IsLocallyControlled() && ScreenUI != none)
	{
		ScreenUI.Close();
	}
	super.Destroyed();
}

/** @see Weapon::Tick */
simulated event Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);
	TimeSinceLastUpdate+=DeltaTime;
	if(TimeSinceLastUpdate > UpdateInterval)
	{
		UpdateScreenUI();
	}
}


/** Only update the screen screen if we have the welder equipped and it's screen values have changed */
simulated function UpdateScreenUI()
{
	if ( Instigator != none && Instigator.IsLocallyControlled() && Instigator.Weapon == self )
	{
		if ( ScreenUI != none )
		{
			ScreenUI.SetMaxCharges(MaxSpareAmmo[0]);
			ScreenUI.SetActiveCharges(NumDeployedCharges);
			TimeSinceLastUpdate=0.0f;
		}
	}
}

/** Overridded to add spawned charge to list of spawned charges */
simulated function Projectile ProjectileFire()
{
	local Projectile P;
	local KFProj_Thrown_C4 Charge;

	P = super.ProjectileFire();

	Charge = KFProj_Thrown_C4( P );
	if( Charge != none )
	{
		DeployedCharges.AddItem( Charge );
		NumDeployedCharges = DeployedCharges.Length;
	}

	return P;
}

/**
 * Initializes ammo counts, when weapon is spawned.
 * NOTE: Overridden specifically for C4. Demo gets 1 additional base ammo.
 */
function InitializeAmmo()
{
	local KFPerk CurrentPerk;
	local bool bWeaponIsOnPerk;

	CurrentPerk = GetPerk();
	bWeaponIsOnPerk = ( CurrentPerk != None && CurrentPerk.IsWeaponOnPerk(self) );

	if( bWeaponIsOnPerk )
	{
		InitialSpareMags[0] += 1;
	}

	super.InitializeAmmo();

	if( bWeaponIsOnPerk )
	{
		MaxSpareAmmo[0] += 1;
		SpareAmmoCount[0] += 1;
	}
}

/**
 * ReInitializes ammo counts on perk change.
 * NOTE: Overridden specifically for C4. Demo gets 1 additional base ammo.
 */
function ReInitializeAmmoCounts(KFPerk CurrentPerk)
{
	super.ReInitializeAmmoCounts(CurrentPerk);

	if( CurrentPerk != None && CurrentPerk.IsWeaponOnPerk(self) )
	{
		MaxSpareAmmo[0] += 1;
	}
}

/**
 * This function checks to see if the weapon has any ammo available for a given fire mode.
 *
 * @param	FireModeNum		- The Fire Mode to Test For
 * @param	Amount			- [Optional] Check to see if this amount is available.
 * @return	true if ammo is available for Firemode FireModeNum.
 */
simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
{
	// always allow detonate firemode
	if( FireModeNum == DETONATE_FIREMODE )
	{
		return true;
	}

	return super.HasAmmo( FireModeNum, Amount );
}

/** Detonates the oldest charge */
simulated function Detonate()
{
	// auto switch weapon when out of ammo and after detonating the last deployed charge
	if( Role == ROLE_Authority )
	{
	if( DeployedCharges.Length > 0 )
	{
		DeployedCharges[0].Detonate();
			RemoveDeployedCharge( 0 );
		}

		if( !HasAnyAmmo() && NumDeployedCharges == 0 )
		{
			if( CanSwitchWeapons() )
			{
	            Instigator.Controller.ClientSwitchToBestWeapon(false);
			}
		}
	}
}

/** Removes a charge from the list using either an index or an actor and updates NumDeployedCharges */
function RemoveDeployedCharge( optional int ChargeIndex = INDEX_NONE, optional Actor ChargeActor )
{
	if( ChargeIndex == INDEX_NONE )
	{
		if( ChargeActor != none )
		{
			ChargeIndex = DeployedCharges.Find( ChargeActor );
	}
	}

	if( ChargeIndex != INDEX_NONE )
	{
		DeployedCharges.Remove( ChargeIndex, 1 );
		NumDeployedCharges = DeployedCharges.Length;
	}
}

/** Allows pickup to update weapon properties 
  * Overridden to allow C4 to update charges
  */
function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	local int i;

	super.SetOriginalValuesFromPickup( PickedUpWeapon );

	DeployedCharges = KFWeap_Thrown_C4(PickedUpWeapon).DeployedCharges;
	NumDeployedCharges = DeployedCharges.Length;

	for( i = 0; i < NumDeployedCharges; ++i )
	{
		// charge alerts (beep, light) need current instigator
		DeployedCharges[i].Instigator = Instigator;
		if( Instigator.Controller != none )
	{
			DeployedCharges[i].InstigatorController = Instigator.Controller;
		}
	}
}

 /**
 * Returns true if this weapon uses a secondary ammo pool
 */
static simulated event bool UsesAmmo()
{
    return true;
}

/**
 * Toggle between DEFAULT and ALTFIRE
 */
simulated function AltFireMode()
{
	// do nothing, as we have no alt fire mode
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
		local name DetonateAnimName;
		local float AnimDuration;

		DetonateAnimName = ShouldPlayLastAnims() ? DetonateLastAnim : DetonateAnim;
		AnimDuration = MySkelMesh.GetAnimLength( DetonateAnimName );

		if( WorldInfo.NetMode != NM_DedicatedServer )
	{
			if( NumDeployedCharges > 0 )
			{
				PlaySoundBase( DetonateAkEvent, true );
			}
			else
			{
				PlaySoundBase( DryFireAkEvent, true );
	}

			PlayAnimation( DetonateAnimName );
		}

		if( Role == ROLE_Authority )
		{
			Detonate();
		}

		IncrementFlashCount();

		SetTimer( AnimDuration / 2.f, false, nameof(GotoActiveState) );
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
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Explosive;
}

defaultproperties
{
   DetonateAnim="Detonate"
   DetonateLastAnim="Detonate_Last"
   ScreenUIClass=Class'KFGame.KFGFxWorld_C4Screen'
   UpdateInterval=0.250000
   DetonateAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Handling_Detonate'
   DryFireAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_DryFire'
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
   FireModeIconPaths(1)=()
   InventorySize=3
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_C4_TEX.UI_WeaponSelect_C4'
   MagazineCapacity(0)=1
   MaxSpareAmmo(0)=1
   InitialSpareMags(0)=1
   FireAnim="C4_Throw"
   FireLastAnim="C4_Throw_Last"
   PlayerViewOffset=(X=6.000000,Y=2.000000,Z=-4.000000)
   AttachmentArchetype=KFWeapAttach_Dual_C4'WEP_C4_ARCH.Wep_C4_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ThrownBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ThrownBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Thrown_C4:MeleeHelper_0'
   AssociatedPerkClass=Class'KFGame.KFPerk_Demolitionist'
   FiringStatesArray(5)="WeaponDetonating"
   WeaponFireTypes(5)=EWFT_Custom
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Thrown_C4'
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_C4'
   FireOffset=(X=25.000000,Y=15.000000,Z=0.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_ThrownBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'Wep_1P_C4_MESH.Wep_1stP_C4_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'Wep_1P_C4_ANIM.Wep_1P_C4_ANIM'
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
   ItemName="C4 Explosives"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_ThrownBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_C4_MESH.Wep_C4_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_ThrownBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Thrown_C4"
   ObjectArchetype=KFWeap_ThrownBase'KFGame.Default__KFWeap_ThrownBase'
}
