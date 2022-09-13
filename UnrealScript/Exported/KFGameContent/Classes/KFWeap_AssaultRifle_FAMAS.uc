//=============================================================================
// KFWeap_AssaultRifle_FAMAS
//=============================================================================
// FAMAS assault rifle with an extra of shotgun. Better than in MGS!
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_FAMAS extends KFWeap_ScopedBase;

var (Positioning) vector SecondaryFireOffset;

const SecondaryFireAnim             = 'Shoot_Secondary';
const SecondaryFireIronAnim         = 'Shoot_Secondary_Iron';
const SecondaryFireAnimLast         = 'Shoot_Secondary_Last';
const SecondaryFireIronAnimLast     = 'Shoot_Secondary_Iron_Last';
const SecondaryReloadAnimEmpty      = 'Reload_Secondary_Empty';
const SecondaryReloadAnimHalf       = 'Reload_Secondary_Half';
const SecondaryReloadAnimEliteEmpty = 'Reload_Secondary_Elite_Empty';
const SecondaryReloadAnimEliteHalf  = 'Reload_Secondary_Elite_Half';
const ShotgunMuzzleSocket           = 'ShotgunMuzzleFlash';

/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst	name	BurstFire2RdAnim;
var(Animations) const editconst	name	BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds*/
var(Animations) const editconst	name	BurstFire3RdAnim;
var(Animations) const editconst	name	BurstFire3RdSightedAnim;

var transient KFMuzzleFlash ShotgunMuzzleFlash;
var() KFMuzzleFlash ShotgunMuzzleFlashTemplate;

// Used on the server to keep track of grenades
var int ServerTotalAltAmmo;

var transient bool bCanceledAltAutoReload;
var transient int BurstAmountBegin;

var protected const float AltFireRecoilScale;

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Assault;
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Explosive;
} 

/** Instead of switch fire mode use as immediate alt fire */
simulated function AltFireMode()
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	if (bCanceledAltAutoReload)
	{
		bCanceledAltAutoReload = false;
		TryToAltReload(true);
		return;
	}

	// StartFire - StopFire called from KFPlayerInput
	StartFire(ALTFIRE_FIREMODE);
}

simulated function BeginFire( Byte FireModeNum )
{
	local bool bStoredAutoReload;

	// We are trying to reload the weapon but the primary ammo in already at full capacity
	if ( FireModeNum == RELOAD_FIREMODE && !CanReload() )
	{
		// Store the current state of bCanceledAltAutoReload in case its not possible to do the reload
		bStoredAutoReload = bCanceledAltAutoReload;
		bCanceledAltAutoReload = false;

		if(CanAltAutoReload(false))
		{
			TryToAltReload(false);
			return;
		}

		bCanceledAltAutoReload = bStoredAutoReload;
	}

	super.BeginFire( FireModeNum );
}

/**
 * Initializes ammo counts, when weapon is spawned.
 */
function InitializeAmmo()
{
	Super.InitializeAmmo();

	// Add Secondary ammo to our secondary spare ammo count both of these are important, in order to allow dropping the weapon to function properly.
	SpareAmmoCount[1]	= Min(SpareAmmoCount[1] + InitialSpareMags[1] * default.MagazineCapacity[1], GetMaxAmmoAmount(1) - AmmoCount[1]);
	ServerTotalAltAmmo += SpareAmmoCount[1];

	// Make sure the server doesn't get extra shots on listen servers.
	if(Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		ServerTotalAltAmmo += AmmoCount[1];
	}
}

/**
 * @see Weapon::ConsumeAmmo
 */
simulated function ConsumeAmmo( byte FireModeNum )
{
	local byte AmmoType;
	local bool bNoInfiniteAmmo;
	local int OldAmmoCount;

	if(UsesSecondaryAmmo() && FireModeNum == ALTFIRE_FIREMODE && Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		AmmoType = GetAmmoType(FireModeNum);

		OldAmmoCount = AmmoCount[AmmoType];
		Super.ConsumeAmmo(FireModeNum);

		bNoInfiniteAmmo = (OldAmmoCount - AmmoCount[AmmoType]) > 0 || AmmoCount[AmmoType] == 0;
		if ( bNoInfiniteAmmo )
		{
			ServerTotalAltAmmo--;
		}
	}
	else
	{
		Super.ConsumeAmmo(FireModeNum);
	}
}

/** Make sure user can't fire infinitely if they cheat to get infinite ammo locally. */
simulated event bool HasAmmo( byte FireModeNum, optional int Amount=1 )
{
	local byte AmmoType;

	AmmoType = GetAmmoType(FireModeNum);

	if(AmmoType == 1 && Role == ROLE_Authority && UsesSecondaryAmmo() && !Instigator.IsLocallyControlled())
	{
		if(ServerTotalAltAmmo <= 0)
		{
			return false;
		}
	}

	return Super.HasAmmo(FireModeNum, Amount );
}

/**
 *	Overridden so any grenades added will go to the spare ammo and no the clip.
 */
function int AddSecondaryAmmo(int Amount)
{
	local int OldAmmo;

	// If we can't accept spare ammo, then abort
	if( !CanRefillSecondaryAmmo() )
	{
		return 0;
	}

	if(Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		OldAmmo = ServerTotalAltAmmo;

		ServerTotalAltAmmo = Min(ServerTotalAltAmmo + Amount, GetMaxAmmoAmount(1));
		ClientGiveSecondaryAmmo(Amount);
		return ServerTotalAltAmmo - OldAmmo;
	}
	else
	{
		OldAmmo = SpareAmmoCount[1];
		ClientGiveSecondaryAmmo(Amount);
		return SpareAmmoCount[1] - OldAmmo;
	}
}

/** Give client specified amount of ammo (used player picks up ammo on the server) */
reliable client function ClientGiveSecondaryAmmo(byte Amount)
{
	SpareAmmoCount[1] = Min(SpareAmmoCount[1] + Amount, GetMaxAmmoAmount(1) - AmmoCount[1]);
	TryToAltReload(true);
}

function SetOriginalValuesFromPickup( KFWeapon PickedUpWeapon )
{
	local KFWeap_AssaultRifle_FAMAS Weap;

	Super.SetOriginalValuesFromPickup(PickedUpWeapon);

	if(Role == ROLE_Authority && !Instigator.IsLocallyControlled())
	{
		Weap = KFWeap_AssaultRifle_FAMAS(PickedUpWeapon);
		ServerTotalAltAmmo = Weap.ServerTotalAltAmmo;
		SpareAmmoCount[1] = ServerTotalAltAmmo - AmmoCount[1];
	}
	else
	{
		// If we're locally controlled, don't bother using ServerTotalAltAmmo.
		SpareAmmoCount[1] = PickedUpWeapon.SpareAmmoCount[1];
	}
}

simulated state WeaponBurstFiring
{
	simulated event BeginState(Name PreviousStateName)
	{
		BurstAmountBegin = GetBurstAmount();
		Super.BeginState(PreviousStateName);
	}

	simulated function name GetWeaponFireAnim(byte FireModeNum)
	{
		// only do one burst animation instead of a burst animation per shot
		// since burst amount gets reduced after each shot, this will only play the one animation based on the number of shots in the burst fire
		if (BurstAmount == BurstAmountBegin)
		{
			if (BurstAmount == 3)
			{
				if (bUsingSights)
				{
					return BurstFire3RdSightedAnim;
				}
				return BurstFire3RdAnim;
			}
			else if (BurstAmount == 2)
			{
				if (bUsingSights)
				{
					return BurstFire2RdSightedAnim;
				}
				return BurstFire2RdAnim;
			}
			else
			{
				return super.GetWeaponFireAnim(FireModeNum);
			}
		}

		// will not play any animation
		return '';
	}
}


simulated state FiringSecondaryState extends WeaponFiring
{
	// Overriden to not call FireAmmunition right at the start of the state
	simulated event BeginState( Name PreviousStateName )
	{
		Super.BeginState(PreviousStateName);
		NotifyBeginState();
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		NotifyEndState();
	}

    /**
     * This function returns the world location for spawning the visual effects
     * Overridden to use a special offset for using the shotgun
     */
	simulated event vector GetMuzzleLoc()
	{
		local vector MuzzleLocation;

		// swap fireoffset temporarily
		FireOffset = SecondaryFireOffset;
		MuzzleLocation = Global.GetMuzzleLoc();
		FireOffset = default.FireOffset;

		return MuzzleLocation;
	}

	/** Get whether we should play the reload anim as well or not */
	simulated function name GetWeaponFireAnim(byte FireModeNum)
	{
		if (AmmoCount[FireModeNum] > 0)
		{
			return bUsingSights ? SecondaryFireIronAnim : SecondaryFireAnim;
		}
		return bUsingSights ? SecondaryFireIronAnimLast : SecondaryFireAnimLast;
	}
}

/**
 * Don't allow secondary fire to make a primary fire shell particle come out of the gun.
 */
simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		if (ShotgunMuzzleFlash == None)
		{
			AttachMuzzleFlash();
		}

		if (ShotgunMuzzleFlash != none)
		{
			ShotgunMuzzleFlash.CauseMuzzleFlash(FireModeNum);
		}
		
		if ( ShotgunMuzzleFlash.bAutoActivateShellEject )
		{
			ShotgunMuzzleFlash.CauseShellEject();
			SetShellEjectsToForeground();
		}
	}
	else
	{
		Super.CauseMuzzleFlash(FireModeNum);
	}
}

simulated function AttachMuzzleFlash()
{
	super.AttachMuzzleFlash();

	if ( MySkelMesh != none )
	{
		if (ShotgunMuzzleFlashTemplate != None)
		{
			ShotgunMuzzleFlash = new(self) Class'KFMuzzleFlash'(ShotgunMuzzleFlashTemplate);
			ShotgunMuzzleFlash.AttachMuzzleFlash(MySkelMesh, ShotgunMuzzleSocket,);
		}
	}
}

/*********************************************************************************************
 * State Reloading
 * This is the default Reloading State.  It's performed on both the client and the server.
 *********************************************************************************************/

/** Do not allow alternate fire to tell the weapon to reload. Alt reload occurs in a separate codepath */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return false;
	}

	return Super.ShouldAutoReload(FireModeNum);
}

/** Called on local player when reload starts and replicated to server */
simulated function SendToAltReload()
{
	ReloadAmountLeft = MagazineCapacity[1] - AmmoCount[1];
	GotoState('AltReloading');
	if ( Role < ROLE_Authority )
	{
		ServerSendToAltReload();
	}
}

/** Called from client when reload starts */
reliable server function ServerSendToAltReload()
{
	ReloadAmountLeft = MagazineCapacity[1] - AmmoCount[1];
	GotoState('AltReloading');
}

/**
 * State Reloading
 * State the weapon is in when it is being reloaded (current magazine replaced with a new one, related animations and effects played).
 */
simulated state AltReloading extends Reloading
{
	ignores ForceReload, ShouldAutoReload, AllowSprinting;

	simulated function byte GetWeaponStateId()
	{
		local KFPerk Perk;
		local bool bTacticalReload;

		Perk = GetPerk();
		bTacticalReload = (Perk != None && Perk.GetUsingTactialReload(self));

		if (AmmoCount[ALTFIRE_FIREMODE] == 0)
		{
			return (bTacticalReload ? WEP_ReloadSecondaryEmpty_Elite : WEP_ReloadSecondaryEmpty);
		}
		else
		{
			return (bTacticalReload ? WEP_ReloadSecondary_Elite : WEP_ReloadSecondary);
		}
	}

	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		bCanceledAltAutoReload = true;
	}

	// Overridding super so we don't call functions we don't want to call.
	simulated function EndState(Name NextStateName)
	{
		ClearZedTimeResist();
		ClearTimer(nameof(ReloadStatusTimer));
		ClearTimer(nameof(ReloadAmmoTimer));

		CheckBoltLockPostReload();
		NotifyEndState();

		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayAmmoDialog( KFPawn(Instigator), float(SpareAmmoCount[1]) / float(GetMaxAmmoAmount(1)) );
	}

	// Overridding super so when this reload is called directly after normal reload state there
	// are not complications resulting from back to back reloads.
	simulated event ReplicatedEvent(name VarName)
	{
		Global.ReplicatedEvent(Varname);
	}

	/** Make sure we can inturrupt secondary reload with anything. */
	simulated function bool CanOverrideMagReload(byte FireModeNum)
	{
		return true;
	}

	/** Returns animation to play based on reload type and status */
	simulated function name GetReloadAnimName( bool bTacticalReload )
	{
		// magazine relaod
		if ( AmmoCount[1] > 0 )
		{
			return (bTacticalReload) ? SecondaryReloadAnimEliteHalf : SecondaryReloadAnimHalf;
		}
		else
		{
			return (bTacticalReload) ? SecondaryReloadAnimEliteEmpty : SecondaryReloadAnimEmpty;
		}
	}

	simulated function PerformReload(optional byte FireModeNum)
	{
		Global.PerformReload(ALTFIRE_FIREMODE);

		if(Instigator.IsLocallyControlled() && Role < ROLE_Authority)
		{
			ServerSetAltAmmoCount(AmmoCount[1]);
		}

		bCanceledAltAutoReload = false;
	}

	simulated function EReloadStatus GetNextReloadStatus(optional byte FireModeNum)
	{
		return Global.GetNextReloadStatus(ALTFIRE_FIREMODE);
	}
}


reliable server function ServerSetAltAmmoCount(byte Amount)
{
	AmmoCount[1] = Amount;
}

/** Allow reloads for primary weapon to be interupted by firing secondary weapon. */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return true;
	}

	return Super.CanOverrideMagReload(FireModeNum);
}

/*********************************************************************************************
 * State Active
 * Try to get weapon to automatically reload secondary fire types when it can.
 *********************************************************************************************/
simulated state Active
{
	/** Initialize the weapon as being active and ready to go. */
	simulated event BeginState(Name PreviousStateName)
	{
		// do this last so the above code happens before any state changes
		Super.BeginState(PreviousStateName);

		// If nothing happened, try to reload
		TryToAltReload(true);
	}
}

/** Network: Local Player */
simulated function bool CanAltAutoReload(bool bIsAuto)
{
	if ( !Instigator.IsLocallyControlled() )
	{
		return false;
	}

	if(!UsesSecondaryAmmo())
	{
		return false;
	}

	// If the weapon wants to fire its primary weapon, and it can fire, do not allow weapon to automatically alt reload
	if(PendingFire(DEFAULT_FIREMODE) && HasAmmo(DEFAULT_FIREMODE))
	{
		return false;
	}

	if(!CanReload(ALTFIRE_FIREMODE))
	{
		return false;
	}

	if (bIsAuto && AmmoCount[1] > 0)
	{
		return false;
	}

	if (bCanceledAltAutoReload)
	{
		return false;
	}

	return true;
}

simulated function TryToAltReload(bool bIsAuto)
{
	if ((IsInState('Active') || IsInState('WeaponSprinting')) && CanAltAutoReload(bIsAuto))
	{
		SendToAltReload();
	}
}

simulated function int GetSecondaryAmmoForHUD()
{
	return AmmoCount[1];
}

simulated function int GetSecondarySpareAmmoForHUD()
{
	return SpareAmmoCount[1];
}

simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	if( CurrentFireMode == ALTFIRE_FIREMODE )
	{
		CurrentRecoilModifier *= AltFireRecoilScale;
	}
	
	super.ModifyRecoil( CurrentRecoilModifier );
}

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnAllProjectiles(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local KFPerk InstigatorPerk;

	if (CurrentFireMode == ALTFIRE_FIREMODE)
	{
		InstigatorPerk = GetPerk();
		if (InstigatorPerk != none)
		{
			Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
		}
	}

	return super.SpawnAllProjectiles(KFProjClass, RealStartLoc, AimDir);
}

defaultproperties
{
   SecondaryFireOffset=(X=20.000000,Y=4.500000,Z=-7.000000)
   BurstFire2RdAnim="Shoot_Burst2"
   BurstFire2RdSightedAnim="Shoot_Burst2_Iron"
   BurstFire3RdAnim="Shoot_Burst"
   BurstFire3RdSightedAnim="Shoot_Burst_Iron"
   ShotgunMuzzleFlashTemplate=KFMuzzleFlash'wep_famas_arch.Wep_Famas_Shotgun_MuzzleFlash'
   AltFireRecoilScale=4.500000
   Begin Object Class=TWSceneCapture2DDPGComponent Name=SceneCapture2DComponent0 Archetype=TWSceneCapture2DDPGComponent'KFGame.Default__KFWeap_ScopedBase:SceneCapture2DComponent0'
      bRenderForegroundDPG=False
      TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
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
   ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_FNFAL_MAT.WEP_1P_FNFAL_Scope_MAT'
   ScopedSensitivityMod=8.000000
   PackageKey="Famas"
   FirstPersonMeshName="wep_1p_famas_mesh.Wep_1stP_Famas_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_famas_anim.Wep_1stP_Famas_Anim"
   PickupMeshName="WEP_3P_Famas_MESH.WEP_Famas_Pickup"
   AttachmentArchetypeName="Wep_Famas_ARCH.Wep_Famas_3P"
   MuzzleFlashTemplateName="wep_famas_arch.Wep_Famas_MuzzleFlash"
   bHasIronSights=True
   bUsesSecondaryAmmoAltHUD=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   BurstAmount=3
   InventorySize=6
   PenetrationPower(0)=1.000000
   PenetrationPower(1)=2.000000
   MeshFOV=65.000000
   MeshIronSightFOV=60.000000
   PlayerIronSightFOV=70.000000
   DOF_BlendInSpeed=3.000000
   DOF_FG_FocalRadius=0.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=80.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Famas_TEX.UI_WeaponSelect_Famas'
   SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   MagazineCapacity(0)=30
   MagazineCapacity(1)=6
   SpareAmmoCapacity(0)=240
   SpareAmmoCapacity(1)=36
   InitialSpareMags(0)=3
   InitialSpareMags(1)=1
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'
   PlayerViewOffset=(X=22.000000,Y=9.000000,Z=-2.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_ScopedBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_FAMAS:MeleeHelper_0'
   NumPellets(1)=7
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   maxRecoilPitch=100
   minRecoilPitch=75
   maxRecoilYaw=40
   minRecoilYaw=-40
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
   HippedRecoilModifier=2.000000
   IronSightMeshFOVCompensationScale=1.700000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.125000),(Stat=EWUS_Damage1,Scale=1.125000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000),(Stat=EWUS_Damage1,Scale=1.250000),(Add=2)))
   FiringStatesArray(0)="WeaponBurstFiring"
   FiringStatesArray(1)="FiringSecondaryState"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_Pellet'
   FireInterval(0)=0.066700
   FireInterval(1)=1.200000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.005000
   Spread(1)=0.100000
   InstantHitDamage(0)=35.000000
   InstantHitDamage(1)=30.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_FAMAS_Rifle'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_FAMAS_Shotgun'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_FAMAS'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
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
   ItemName="FAMAS Masterkey"
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
   Name="Default__KFWeap_AssaultRifle_FAMAS"
   ObjectArchetype=KFWeap_ScopedBase'KFGame.Default__KFWeap_ScopedBase'
}
