//=============================================================================
// KFWeap_Ice_FreezeThrower
//=============================================================================
// The cryogenic freeze gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Matt "Squirrlz" Farber
//=============================================================================
class KFWeap_Ice_FreezeThrower extends KFWeap_FlameBase;

/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst	name	FireHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst	name	FireLastHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst	name	FireLastHeavySightedAnim;

/** Alt-fire explosion template */
var() GameExplosion 		ExplosionTemplate;

/** For Ice Blast */
var(Weapon) protected array<byte> NumPellets;
var protected const array<vector2D> PelletSpread;

/** How much recoil the altfire should do */
var protected const float AltFireRecoilScale;

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

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

	StartFire( ALTFIRE_FIREMODE );
}

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local int i;
	local rotator AimRot;

    if( CurrentFireMode == GRENADE_FIREMODE )
    {
        return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }

	AimRot = rotator(AimDir);
	for (i = 0; i < GetNumProjectilesToFire(CurrentFireMode); i++)
	{
		Super.SpawnProjectile( KFProjClass, RealStartLoc, vector(AddMultiShotSpread(AimRot, i)) );
	}

	return None;
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPellets[CurrentFireMode];
}

/** Disable normal bullet spread */
simulated function rotator AddSpread( rotator BaseAim )
{
	return BaseAim; // do nothing
}

 /** Same as AddSpread(), but used with MultiShotSpread */
simulated function rotator AddMultiShotSpread( rotator BaseAim, byte PelletNum )
{
	local vector X, Y, Z;
	local float CurrentSpread, RandY, RandZ;

	CurrentSpread = Spread[CurrentFireMode];
	if (CurrentSpread == 0)
	{
		return BaseAim;
	}
	else
	{
		// Add in any spread.
		GetAxes(BaseAim, X, Y, Z);
		RandY = PelletSpread[PelletNum].Y * RandRange( 0.5f, 1.5f );
		RandZ = PelletSpread[PelletNum].X * RandRange( 0.5f, 1.5f );
		return rotator(X + RandY * CurrentSpread * Y + RandZ * CurrentSpread * Z);
	}
}

/** Disable auto-reload for alt-fire */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	local bool bRequestReload;

    bRequestReload = Super.ShouldAutoReload(FireModeNum);

    // Must be completely empty for auto-reload or auto-switch
    if ( FireModeNum == ALTFIRE_FIREMODE && AmmoCount[0] > 0 )
    {
   		bPendingAutoSwitchOnDryFire = false;
   		return false;
    }

    return bRequestReload;
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != none && FireMode == ALTFIRE_FIREMODE )
	{
        KFPlayer.AddShotsFired( GetNumProjectilesToFire(FireMode) );
        return;
	}

	super.HandleWeaponShotTaken( FireMode );
}

/** Increase recoil for altfire */
simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	if( CurrentFireMode == ALTFIRE_FIREMODE )
	{
		CurrentRecoilModifier *= AltFireRecoilScale;
	}

	super.ModifyRecoil( CurrentRecoilModifier );
}

/** Can be overridden on a per-weapon or per-state basis */
simulated function bool IsHeavyWeapon()
{
	return true;
}

/** No pilot light on freeze thrower */
simulated function SetPilotDynamicLightEnabled( bool bLightEnabled );

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Electric;
}

defaultproperties
{
   FireHeavyAnim="Shoot_Heavy"
   FireLastHeavyAnim="Shoot_Heavy_Last"
   FireLastHeavySightedAnim="Shoot_Heavy_Iron_Last"
   NumPellets(0)=0
   NumPellets(1)=7
   PelletSpread(1)=(X=0.500000,Y=0.000000)
   PelletSpread(2)=(X=0.321400,Y=0.383000)
   PelletSpread(3)=(X=-0.250000,Y=0.433000)
   PelletSpread(4)=(X=-0.500000,Y=0.000000)
   PelletSpread(5)=(X=-0.250000,Y=-0.433000)
   PelletSpread(6)=(X=0.250000,Y=-0.433000)
   AltFireRecoilScale=4.000000
   bWarnAIWhenFiring=True
   FlameSprayArchetype=SprayActor_Flame'WEP_CryoGun_ARCH.Wep_CryoGun_IceSpray'
   PSC_PilotLight=None
   Begin Object Class=KFParticleSystemComponent Name=FlameEndSpray0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeap_FlameBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   MinAmmoConsumed=4
   PackageKey="CryoGun"
   FirstPersonMeshName="WEP_1P_CryoGun_MESH.Wep_1stP_CryoGun_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_CryoGun_anim.Wep_1stP_CryoGun_anim"
   PickupMeshName="WEP_3P_CryoGun_MESH.Wep_CryoGun_Pickup"
   AttachmentArchetypeName="WEP_CryoGun_ARCH.Wep_CryoGun_3P"
   MuzzleFlashTemplateName="WEP_CryoGun_ARCH.Wep_CryoGun_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   FireModeIconPaths(0)=Texture2D'wep_ui_cryogun_tex.UI_FireModeSelect_Cryogun'
   FireModeIconPaths(1)=Texture2D'wep_ui_cryogun_tex.UI_FireModeSelect_2nd_Cryogun'
   InventorySize=7
   MagazineCapacity(0)=100
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=80.000000
   IronSightPosition=(X=20.000000,Y=8.000000,Z=-3.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'wep_ui_cryogun_tex.UI_WeaponSelect_Cryogun'
   AmmoCost(1)=10
   SpareAmmoCapacity(0)=400
   InitialSpareMags(0)=1
   AmmoPickupScale(0)=0.750000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
   bLoopingFireAnim(0)=True
   bLoopingFireAnim(1)=False
   bLoopingFireSnd(0)=True
   bLoopingFireSnd(1)=False
   FireSightedAnims(0)="Shoot"
   FireSightedAnims(1)="Shoot_Heavy_Iron"
   FireLoopSightedAnim="ShootLoop"
   FireLoopStartSightedAnim="ShootLoop_Start"
   FireLoopEndSightedAnim="ShootLoop_End"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_3P_Start',FirstPersonCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_1P_Start')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_3P_Alt_Fire',FirstPersonCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_1P_Alt_Fire')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_3P_Stop',FirstPersonCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_1P_Stop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
   PlayerViewOffset=(X=6.000000,Y=15.000000,Z=-5.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_FlameBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Ice_FreezeThrower:MeleeHelper_0'
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Survivalist'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Stat=EWUS_Damage1,Scale=1.400000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.800000),(Stat=EWUS_Damage1,Scale=1.800000),(Add=2)))
   FiringStatesArray(0)="SprayingFire"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=None
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_FreezeThrower_IceShards'
   FireInterval(0)=0.070000
   FireInterval(1)=0.600000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.000000
   Spread(1)=0.050000
   InstantHitDamage(1)=20.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=28.000000
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Freeze_FreezeThrower_IceShards'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Freezethrower'
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
   ItemName="Freezethrower"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_FlameBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Ice_FreezeThrower"
   ObjectArchetype=KFWeap_FlameBase'KFGame.Default__KFWeap_FlameBase'
}
