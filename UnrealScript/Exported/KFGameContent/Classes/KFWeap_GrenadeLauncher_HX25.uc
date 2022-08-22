//=============================================================================
// KFWeap_GrenadeLauncher_HX25
//=============================================================================
// A Horzine experimental 25mm grenade launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_GrenadeLauncher_HX25 extends KFWeap_GrenadeLauncher_Base;

var(Weapon) array<byte>	NumPellets;
var array<vector2D> PelletSpread;

/** Last time a submunition projectile was fired from this weapon */
var float LastSubmunitionFireTime;

/*********************************************************************************************
 Firing / Projectile
********************************************************************************************* */

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local int i;
	local rotator AimRot;
	local KFPlayerReplicationInfo InstigatorPRI;

    if( CurrentFireMode == GRENADE_FIREMODE )
    {
        return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }

	AimRot = rotator(AimDir);
	InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);

	for (i = 0; i < GetNumProjectilesToFire(CurrentFireMode); i++)
	{
		// Use a different projectile for the first one if demo's nuke skill is active and Zed time is active
		if( InstigatorPRI != none && InstigatorPRI.bNukeActive && WorldInfo.TimeDilation < 1.f && i < 1 )
		{
			Super.SpawnProjectile( class'KFPerk_Demolitionist'.static.GetNukeProjectileClass(), RealStartLoc, AimDir );
		}
		else
		{
			Super.SpawnProjectile(KFProjClass, RealStartLoc, vector(AddMultiShotSpread(AimRot, i)));
		}
	}

	return None;
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != None )
	{
        KFPlayer.AddShotsFired(GetNumProjectilesToFire( FireMode ));
	}
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPellets[CurrentFireMode];
}

/** Disable normal bullet spread */
simulated function rotator AddSpread(rotator BaseAim)
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

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own damage for display in trader
  * Overridden to multiply damage by number of pellets.
  */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float BaseDamage, DoTDamage;
	local class<KFDamageType> DamageType;

	local GameExplosion ExplosionInstance;

	ExplosionInstance = class<KFProjectile>(default.WeaponProjectiles[DEFAULT_FIREMODE]).default.ExplosionTemplate;

	BaseDamage = default.InstantHitDamage[DEFAULT_FIREMODE] + ExplosionInstance.Damage;

	DamageType = class<KFDamageType>(ExplosionInstance.MyDamageType);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
	}

	return BaseDamage * default.NumPellets[DEFAULT_FIREMODE] + DoTDamage;
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Pistol;
}

defaultproperties
{
   NumPellets(0)=7
   PelletSpread(1)=(X=0.500000,Y=0.000000)
   PelletSpread(2)=(X=0.321400,Y=0.383000)
   PelletSpread(3)=(X=-0.250000,Y=0.433000)
   PelletSpread(4)=(X=-0.500000,Y=0.000000)
   PelletSpread(5)=(X=-0.250000,Y=-0.433000)
   PelletSpread(6)=(X=0.250000,Y=-0.433000)
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
   FireModeIconPaths(1)=()
   InventoryGroup=IG_Secondary
   InventorySize=4
   MagazineCapacity(0)=1
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=73.000000
   FastZoomOutTime=0.200000
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HX25_Pistol_TEX.UI_WeaponSelect_HX25'
   SpareAmmoCapacity(0)=29
   InitialSpareMags(0)=17
   AmmoPickupScale(0)=3.000000
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Fire_1P')
   WeaponDryFireSnd(0)=None
   PlayerViewOffset=(X=13.000000,Y=13.000000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_HX25_Pistol_ARCH.Wep_HX25_Pistol_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_Base:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_GrenadeLauncher_HX25:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_HX25_Pistol_ARCH.Wep_HX25_Pistol_MuzzleFlash'
   maxRecoilPitch=900
   minRecoilPitch=775
   maxRecoilYaw=500
   minRecoilYaw=-500
   RecoilRate=0.040000
   RecoilBlendOutRatio=0.350000
   RecoilViewRotationScale=0.800000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMinPitchLimit=64785
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   HippedRecoilModifier=1.250000
   FallingRecoilModifier=1.500000
   AssociatedPerkClass=Class'KFGame.KFPerk_Demolitionist'
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_ExplosiveSubmunition_HX25'
   FireInterval(0)=0.250000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.100000
   InstantHitDamage(0)=10.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HX25SubmunitionImpact'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HX25'
   FireOffset=(X=23.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_HX25_Pistol_MESH.Wep_1stP_HX25_Pistol_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_HX25_Pistol_ANIM.Wep_1stP_HX25_Pistol_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HX25 Grenade Pistol"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
      StaticMesh=StaticMesh'wep_3p_hx25_pistol_mesh.WEP_HX25_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_Base:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_GrenadeLauncher_HX25"
   ObjectArchetype=KFWeap_GrenadeLauncher_Base'KFGame.Default__KFWeap_GrenadeLauncher_Base'
}
