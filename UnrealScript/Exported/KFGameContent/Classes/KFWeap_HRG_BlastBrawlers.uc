//=============================================================================
// KFWeap_HRG_BlastBrawlers
//=============================================================================
// Power gloves and shotgun, all in one.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFWeap_HRG_BlastBrawlers extends KFWeap_Blunt_PowerGloves;

var name ReloadAnimation;
var float ReloadAnimRateModifier;
var float ReloadAnimRateModifierElite;

var protected transient bool bWaitingForSecondShot; 
var protected transient int  NumAttacks;

/** A muzzle flash instance for left weapon */
var KFMuzzleFlash LeftMuzzleFlash;

simulated event PreBeginPlay()
{
	super.PreBeginPlay();
}

simulated function Shoot()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}
	
	if( Role < Role_Authority )
	{
		// if we're a client, synchronize server
		ServerShoot();
	}

	ProcessShoot();
}

/** 
    Each attack shoots twice, once with the right and left fists.
    Ammo is decremented after the second shot.
*/
reliable server function bool ServerShoot()
{
	return ProcessShoot();
}

simulated function bool ProcessShoot()
{
	// Shooting only happens when default firing
	if(CurrentFireMode != DEFAULT_FIREMODE)
		return false;

	CustomFire();

	if (!bWaitingForSecondShot)
	{
		// AmmoCount[DEFAULT_FIREMODE] = Max(AmmoCount[DEFAULT_FIREMODE] - 1, 0);
		DecrementAmmo();
	}

	bWaitingForSecondShot = !bWaitingForSecondShot;
	return true;
}

simulated function DecrementAmmo()
{
	AmmoCount[DEFAULT_FIREMODE] = Max(AmmoCount[DEFAULT_FIREMODE] - 1, 0);
}

simulated state Active
{
	/**
	 * Called from Weapon:Active.BeginState when HasAnyAmmo (which is overridden above) returns false.
	 */
	simulated function WeaponEmpty()
	{
		local int i;

		// Copied from Weapon:Active.BeginState where HasAnyAmmo returns true.
		// Basically, pretend the weapon isn't empty in this case.
		for (i=0; i<GetPendingFireLength(); i++)
		{
			if (PendingFire(i))
			{
				BeginFire(i);
				break;
			}
		}
	}
}

static simulated event bool UsesAmmo()
{
	return true;
}

simulated function CustomFire()
{
	local byte CachedFireMode;

	CachedFireMode = CurrentFireMode;
	CurrentFireMode = CUSTOM_FIREMODE;

	ProjectileFire();

	// Let the accuracy tracking system know that we fired
	HandleWeaponShotTaken(CurrentFireMode);

	NotifyWeaponFired(CurrentFireMode);

	// Play fire effects now (don't wait for WeaponFired to replicate)
	PlayFireEffects(CurrentFireMode, vect(0, 0, 0));

	CurrentFireMode = CachedFireMode;
}

/** Overriden for the Tight Choke perk */
simulated function KFProjectile SpawnAllProjectiles(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local KFPerk InstigatorPerk;

	if (CurrentFireMode == CUSTOM_FIREMODE)
	{
		InstigatorPerk = GetPerk();
		if (InstigatorPerk != none)
		{
			Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
		}
	}

	return super.SpawnAllProjectiles(KFProjClass, RealStartLoc, AimDir);
}

/** Override for not playing animations (even if noanimation is set it interrupts the melee ones.) */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
	// If we have stopped the looping fire sound to play single fire sounds for zed time
	// start the looping sound back up again when the time is back above zed time speed
	if( FireModeNum < bLoopingFireSnd.Length && bLoopingFireSnd[FireModeNum] && !bPlayingLoopingFireSnd )
    {
        StartLoopingFireSound(FireModeNum);
    }

	PlayFiringSound(CurrentFireMode);

	if( Instigator != none )
	{
		if( Instigator.IsLocallyControlled() )
		{
			if( Instigator.IsFirstPerson() )
			{
				// Start muzzle flash effect
				CauseMuzzleFlash(FireModeNum);
			}

			ShakeView();
		}
	}
}

/**
 * @see Weapon::StartFire
 */
simulated function StartFire(byte FireModeNum)
{
	// can't start fire because it's in an uninterruptible state
	if (StartFireDisabled)
	{
		return;
	}

	if (FireModeNum == DEFAULT_FIREMODE)
	{
		if(AmmoCount[DEFAULT_FIREMODE] > 0)
		{
			StartMeleeFire(FireModeNum, DIR_FORWARD, ATK_Normal);
		} 
		else
		{
			super.StartFire(RELOAD_FIREMODE);
			// If not cleared, it will loop the animation.
			ClearPendingFire(RELOAD_FIREMODE);
		}
		return;
	}

	super.StartFire(FireModeNum);
}

/** Avoiding reload anim to interrupt combo */
simulated state MeleeChainAttacking
{
	simulated function BeginState(Name PrevStateName)
	{
		local KFPerk InstigatorPerk;

		if( CurrentFireMode == DEFAULT_FIREMODE )
		{
			StartFireDisabled = true;
			bWaitingForSecondShot = false;
			NumAttacks = 0;
		}
		
		InstigatorPerk = GetPerk();
		if (InstigatorPerk != none)
		{
			SetZedTimeResist( InstigatorPerk.GetZedTimeModifier(self) );
		}

		super.BeginState( PrevStateName );
	}

	simulated function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);
		if( CurrentFireMode == DEFAULT_FIREMODE )
		{
			StartFireDisabled = false;
		}

		ClearZedTimeResist();
	}

	simulated function bool ShouldContinueMelee(optional int ChainCount)
	{
		if ( CurrentFireMode == DEFAULT_FIREMODE )
		{
			return false;
		}	
		return super.ShouldContinueMelee(ChainCount);
	}
}

/**
 * Called on a client, this function Attaches the WeaponAttachment
 * to the Mesh.
 *
 * Overridden to attach LeftMuzzleFlash
 */
simulated function AttachMuzzleFlash()
{
	super.AttachMuzzleFlash();

	if ( MySkelMesh != none )
	{
		if (MuzzleFlashTemplate != None)
		{
			LeftMuzzleFlash = new(self) Class'KFMuzzleFlash'(MuzzleFlashTemplate);
			LeftMuzzleFlash.AttachMuzzleFlash(MySkelMesh, 'MuzzleFlash_L');
		}
	}
}

/**
 * Causes the muzzle flash to turn on and setup a time to
 * turn it back off again.
 *
 * Overridden to cause left weapon flash
 */
simulated function CauseMuzzleFlash(byte FireModeNum)
{
	if( MuzzleFlash == None || LeftMuzzleFlash == None )
	{
		AttachMuzzleFlash();
	}

	if( bWaitingForSecondShot )
	{
		if (MuzzleFlash != None )
		{
			// Not ejecting shells for this weapon.
			MuzzleFlash.CauseMuzzleFlash(FireModeNum);
		}
	}
	else
	{
		if( LeftMuzzleFlash != None )
		{
			// Not ejecting shells for this weapon.
			LeftMuzzleFlash.CauseMuzzleFlash(FireModeNum);
		}
	}
}

/**
 * Remove/Detach the muzzle flash components
 */
simulated function DetachMuzzleFlash()
{
	super.DetachMuzzleFlash();

	if (MySkelMesh != none && LeftMuzzleFlash != None)
	{
		LeftMuzzleFlash.DetachMuzzleFlash(MySkelMesh);
		LeftMuzzleFlash = None;
	}
}

/**
 * Adjust the FOV for the first person weapon and arms.
 */
simulated event SetFOV( float NewFOV )
{
	super.SetFOV( NewFOV );

	if( LeftMuzzleFlash != none )
	{
		LeftMuzzleFlash.SetFOV( NewFOV );
	}
}

simulated function StopFireEffects(byte FireModeNum)
{
	super.StopFireEffects( FireModeNum );

	if (LeftMuzzleFlash != None)
	{
        LeftMuzzleFlash.StopMuzzleFlash();
	}
}

/** Returns true if weapon can potentially be reloaded */
simulated function bool CanReload(optional byte FireModeNum)
{
	if ( FiringStatesArray[RELOAD_FIREMODE] == 'WeaponUpkeep' )
	{
		return true;
	}

	if ( FireModeNum == CUSTOM_FIREMODE)
	{
		FireModeNum = DEFAULT_FIREMODE;
	}

	return Super.CanReload(FireModeNum);
}

simulated function name GetReloadAnimName( bool bTacticalReload )
{
	return ReloadAnimation;
}

/** No diferent states */
simulated function EReloadStatus GetNextReloadStatus(optional byte FireModeNum)
{
	switch ( ReloadStatus )
	{
		case RS_None: //drop
		case RS_Reloading:
			if ( HasSpareAmmo(FiremodeNum) && ReloadAmountLeft > 0 )
			{
				return RS_Reloading;
			}
	}

	return RS_Complete;
}

/** Returns an anim rate scale for reloading */
simulated function float GetReloadRateScale()
{
	local float Modifier;

	Modifier = UseTacticalReload() ? ReloadAnimRateModifierElite : ReloadAnimRateModifier;

	return super.GetReloadRateScale() * Modifier;
}

simulated function bool HasAnyAmmo()
{
	return AmmoCount[0] > 0 || SpareAmmoCount[0] > 0;
}

simulated function int GetMeleeDamage(byte FireModeNum, optional vector RayDir)
{
	local int Damage;

	Damage = GetModifiedDamage(FireModeNum, RayDir);
	// decode damage scale (see GetDamageScaleByAngle) from the RayDir
	if ( !IsZero(RayDir) )
	{
		Damage = Round(float(Damage) * FMin(VSize(RayDir), 1.f));
	}

	return Damage;
}

defaultproperties
{
   ReloadAnimation="Atk_B"
   ReloadAnimRateModifier=1.600000
   ReloadAnimRateModifierElite=1.000000
   BlockDamageMitigation=0.500000
   PackageKey="HRG_BlastBrawlers"
   FirstPersonMeshName="WEP_1P_HRG_BlastBrawlers_MESH.WEP_1stP_HRG_Blast_Brawlers_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_BlastBrawlers_ANIM.WEP_1P_HRG_BlastBrawlers_ANIM"
   PickupMeshName="WEP_3P_HRG_BlastBrawlers_MESH.Wep_HRG_Blast_Brawlers_Pickup"
   AttachmentArchetypeName="WEP_HRG_BlastBrawlers_ARCH.Wep_HRG_BlastBrawlers_3P"
   MuzzleFlashTemplateName="WEP_HRG_BlastBrawlers_ARCH.Wep_HRG_BlastBrawler_MuzzleFlash"
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bAllowClientAmmoTracking=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=()
   FireModeIconPaths(6)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=9
   PenetrationPower(2)=0.000000
   PenetrationPower(3)=0.000000
   PenetrationPower(4)=0.000000
   PenetrationPower(5)=0.000000
   PenetrationPower(6)=2.000000
   PenetrationDamageReductionCurve(6)=(Points=(,(InVal=1.000000,OutVal=1.000000)))
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_BlastBrawlers_TEX.UI_WeaponSelect_HRG_BlastBrawlers'
   MagazineCapacity(0)=4
   AmmoCost(6)=0
   SpareAmmoCapacity(0)=40
   InitialSpareMags(0)=2
   AmmoPickupScale(0)=1.500000
   WeaponFireSnd(6)=(DefaultCue=AkEvent'WW_WEP_HRG_BlastBrawlers.Play_WEP_HRG_BlastBrawlers_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_BlastBrawlers.Play_WEP_HRG_BlastBrawlers_Shoot_1P')
   Begin Object Class=KFMeleeHelperWeaponBlastBrawlers Name=MeleeHelper_0
      bUseDirectionalMelee=True
      MeleeImpactCamShakeScale=0.035000
      MaxHitRange=230.000000
      HitboxChain(0)=(BoneOffset=(X=0.000000,Y=3.000000,Z=150.000000))
      HitboxChain(1)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=130.000000))
      HitboxChain(2)=(BoneOffset=(X=0.000000,Y=3.000000,Z=110.000000))
      HitboxChain(3)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=90.000000))
      HitboxChain(4)=(BoneOffset=(X=0.000000,Y=3.000000,Z=70.000000))
      HitboxChain(5)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=50.000000))
      HitboxChain(6)=(BoneOffset=(X=0.000000,Y=3.000000,Z=30.000000))
      HitboxChain(7)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
      HitboxChain(8)=(BoneOffset=(X=0.000000,Y=0.000000,Z=-10.000000))
      bAllowMeleeToFracture=False
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeaponBlastBrawlers'kfgamecontent.Default__KFMeleeHelperWeaponBlastBrawlers'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeaponBlastBrawlers'kfgamecontent.Default__KFWeap_HRG_BlastBrawlers:MeleeHelper_0'
   NumPellets(6)=5
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Support'
   WeaponUpgrades(1)=(Stats=((Scale=1.125000),(Scale=1.125000),(Scale=1.125000),))
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)=()
   FiringStatesArray(6)="WeaponSingleFiring"
   WeaponFireTypes(6)=EWFT_Projectile
   WeaponProjectiles(0)=None
   WeaponProjectiles(1)=None
   WeaponProjectiles(2)=None
   WeaponProjectiles(3)=None
   WeaponProjectiles(4)=None
   WeaponProjectiles(5)=None
   WeaponProjectiles(6)=Class'kfgamecontent.KFProj_Bullet_BlastBrawlers'
   FireInterval(5)=0.000000
   FireInterval(6)=0.100000
   Spread(0)=0.000000
   Spread(1)=0.000000
   Spread(2)=0.000000
   Spread(3)=0.000000
   Spread(4)=0.000000
   Spread(5)=0.000000
   Spread(6)=0.120000
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamage(4)=()
   InstantHitDamage(5)=200.000000
   InstantHitDamage(6)=39.000000
   InstantHitMomentum(6)=1.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Bludgeon_BlastBrawlers'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_BlastBrawlersBash'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Bludgeon_BlastBrawlersHeavy'
   InstantHitDamageTypes(6)=Class'kfgamecontent.KFDT_Ballistic_BlastBrawlersShotgun'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Blunt_PowerGloves:FirstPersonMesh'
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
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Blunt_PowerGloves:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Blast Brawlers"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Blunt_PowerGloves:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Blunt_PowerGloves:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_HRG_BlastBrawlers"
   ObjectArchetype=KFWeap_Blunt_PowerGloves'kfgamecontent.Default__KFWeap_Blunt_PowerGloves'
}
