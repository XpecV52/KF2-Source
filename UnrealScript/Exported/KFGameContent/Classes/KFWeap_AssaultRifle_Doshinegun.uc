//=============================================================================
// KFWeap_AssaultRifle_Doshinegun
//=============================================================================
// Like if we were rich...
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_Doshinegun extends KFWeap_RifleBase;

var int DoshCost;
var transient KFPlayerReplicationInfo KFPRI;

simulated function Activate()
{
	local KFPawn KFP;

	super.Activate();

	KFP = KFPawn(Instigator);
	if (KFP != none)
	{
		KFPRI = KFPlayerReplicationInfo(KFP.PlayerReplicationInfo);
	}
}

simulated function bool HasAnyAmmo()
{
    return AmmoCount[0] > 0 || KFPRI.Score >= DoshCost;
}

/** Returns true if weapon can potentially be reloaded */
simulated function bool CanReload(optional byte FireModeNum)
{
	return KFPRI.Score >= DoshCost && AmmoCount[FireModeNum] < MagazineCapacity[FireModeNum];
}

/** Performs actual ammo reloading */
simulated function PerformReload(optional byte FireModeNum)
{
	local int ReloadAmount;
	local int AmmoType;

	AmmoType = GetAmmoType(FireModeNum);

	if ( bInfiniteSpareAmmo )
	{
		AmmoCount[AmmoType] = MagazineCapacity[AmmoType];
		ReloadAmountLeft = 0;
		return;
	}

	if ( (Role == ROLE_Authority && !bAllowClientAmmoTracking) || (Instigator.IsLocallyControlled() && bAllowClientAmmoTracking) )
	{
		ReloadAmount = Min(MagazineCapacity[0] - AmmoCount[0], KFPRI.Score / DoshCost);
		AmmoCount[AmmoType] = Min(AmmoCount[AmmoType] + ReloadAmount, MagazineCapacity[AmmoType]);
		KFPRI.AddDosh(-ReloadAmount * DoshCost);
	}

	ReloadAmountLeft = 0;
	ShotsHit = 0;
}

function int AddAmmo(int Amount)
{
	return 0;
}

simulated function bool CanBuyAmmo()
{
	return false;
}

static simulated event bool UsesAmmo()
{
    return true;
}

// Overriden to deactivate low ammo dialogue
simulated state Reloading
{
	simulated function EndState(Name NextStateName)
	{
		local int ActualReloadAmount;
		ClearZedTimeResist();
		ClearTimer(nameof(ReloadStatusTimer));
		ClearTimer(nameof(ReloadAmmoTimer));
		ClearPendingFire(RELOAD_FIREMODE);

		if ( bAllowClientAmmoTracking && Role < ROLE_Authority )
		{
			// Get how much total ammo was reloaded on the client side over the entire course of the reload.
			ActualReloadAmount = InitialReloadAmount - ReloadAmountLeft;
			// Sync spare ammo counts using initial spare ammo, and how much ammo has been reloaded since reload began.
			ServerSyncReload(InitialReloadSpareAmmo - ActualReloadAmount);
		}

		CheckBoltLockPostReload();
		NotifyEndState();

		CurrentFireMode = DEFAULT_FIREMODE;

		ReloadStatus = RS_None;
	}
}

defaultproperties
{
   DoshCost=25
   PackageKey="Doshinegun"
   FirstPersonMeshName="WEP_1P_Doshinegun_MESH.Wep_1stP_Doshinegun_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Doshinegun_ANIM.Wep_1st_Doshinegun_Anim"
   PickupMeshName="WEP_3P_Doshinegun_MESH.Wep_Doshinegun_Pickup"
   AttachmentArchetypeName="WEP_Doshinegun_ARCH.Wep_Doshinegun_3P"
   MuzzleFlashTemplateName="WEP_Doshinegun_ARCH.Wep_Doshinegun_MuzzleFlash"
   bHasIronSights=True
   bUsesSecondaryAmmoAltHUD=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bAllowClientAmmoTracking=False
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=4
   MeshFOV=65.000000
   MeshIronSightFOV=45.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=5.000000,Y=-0.100000,Z=-1.500000)
   DOF_FG_FocalRadius=150.000000
   DOF_FG_MaxNearBlurSize=1.000000
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Doshinegun_TEX.UI_Weapon_Select_Doshinegun'
   MagazineCapacity(0)=20
   AmmoPickupScale(0)=0.000000
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Shoot_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Shoot_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Fire_1P')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Shoot_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Shoot_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Dry_Fire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_Doshinegun.Play_WEP_Doshinegun_Dry_Fire'
   PlayerViewOffset=(X=1.000000,Y=8.500000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_Doshinegun:MeleeHelper_0'
   maxRecoilPitch=250
   minRecoilPitch=200
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
   AssociatedPerkClasses(0)=None
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.150000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Stat=EWUS_Damage1,Scale=1.300000),(Add=2)))
   WeaponUpgrades(3)=(Stats=((Stat=EWUS_Damage0,Scale=1.600000),(Stat=EWUS_Damage1,Scale=1.450000),(Add=3)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Dosh'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Dosh'
   FireInterval(0)=0.200000
   FireInterval(1)=0.200000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.015000
   InstantHitDamage(0)=55.000000
   InstantHitDamage(1)=55.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Bludgeon_Doshinegun_Shot'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Bludgeon_Doshinegun_Shot'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Doshinegun'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Doshinegun"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_Doshinegun"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
