//=============================================================================
// KFWeap_AssaultRifle_HRGTeslauncher
//=============================================================================
// An M16 M203 Incendiary Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================
class KFWeap_AssaultRifle_HRGTeslauncher extends KFWeap_AssaultRifle_M16M203;

/* 
	TODO LIST [LO FOR TAG (WHATS BEFORE THE : IN THE INDICATED FILE)]  = DONE ||  = NOT DONE
		BASE DAMAGE 
			DEFAULT MODE DAMAGE : KFWeap_AssaultRifle_HRGTeslauncher.uc 
			DEFAULT MODE DAMAGE DOT : KFDT_Ballistic_HRGTeslauncher/KFDT_Fire_HRGTeslauncherDoT
			BASH MODE DAMAGE : KFWeap_AssaultRifle_HRGTeslauncher.uc
			ALT MODE DAMAGE : KFDT_Ballistic_HRGTeslauncher/KFProj_Grenade_HRGTeslauncher.uc 

		DAMAGE TYPES
			DEFAULT MODE TYPE DAMAGE :  KFDT_Ballistic_HRGTeslauncher/KFDT_Fire_HRGTeslauncherDoT
			BASH MODE TYPE DAMAGE : KFDT_Bludgeon_HRGTeslauncher
			ALT MODE TYPE DAMAGE : KFProj_Grenade_HRGTeslauncher

		FIRE RATE
			Default Firemode (Automatic) firerate :  KFWeap_AssaultRifle_HRGTeslauncher
			Altfire Firemode (Single Fire) firerate :  MISSING/DONT KNOW HOW TO CALCULATE

		RANGE
			Default Firemode (Automatic) range :   KFWeap_AssaultRifle_HRGTeslauncher
			Altfire Firemode (Grenade Launcher) range :  CANT FIND

		PENETRATION
			Default Firemode (Automatic) penetration : KFWeap_AssaultRifle_HRGTeslauncher
			Altfire Firemode (Grenade Launcher) penetration : KFWeap_AssaultRifle_HRGTeslauncher

		DUAL-WIELDABLE
			Dual-wieldable NO : KFWeap_AssaultRifle_HRGTeslauncher

		MAGAZINE SIZE
			Default Magazine ammount : KFWeap_AssaultRifle_HRGTeslauncher
			Alt Magazine ammount : KFWeap_AssaultRifle_HRGTeslauncher

		SPARE AMMO CAPACITY
			Default spare ammo Ammount : KFWeap_AssaultRifle_HRGTeslauncher
			Alt spare ammo Ammount : KFWeap_AssaultRifle_HRGTeslauncher

		STARTING SPARE MAGAZINES
			Default starting spare magazines Ammount : KFWeap_AssaultRifle_HRGTeslauncher 
			Alt starting spare magazines Ammount :  KFWeap_AssaultRifle_HRGTeslauncher

		AMMO BOX PICKUP SCALE
			Default Ammount : KFWeap_AssaultRifle_HRGTeslauncher
			Alt Ammount : KFWeap_AssaultRifle_HRGTeslauncher
		
		RELOAD SPEED
	
			Default Reload : KFWeap_AssaultRifle_HRGTeslauncher
			Alt Reload : KFWeap_AssaultRifle_HRGTeslauncher

		WEIGHT

			Weight Ammount :  

		WEAPON TRADER PRICE
			Weapon Price : KFWeapDef_HRGTeslauncher

		AMMO TRADER PRICE
			Bullets Ammo Price :  KFWeapDef_HRGTeslauncher
			Grenade Ammo Price :  KFWeapDef_HRGTeslauncher

		WEAPON TIER
			Tier : 

		AFFLICTIONS
			afflictions Default Firemode : KFDT_Ballistic_HRGTeslauncher
			afflictions Bash Firemode : KFDT_Bludgeon_HRGTeslauncher (Parent)
			afflictions Alt Firemode : KFDT_EMP_EMPGrenade

		PERKS
		Main Perk : KFWeap_AssaultRifle_HRGTeslauncher

		WEAPON UPGRADE
			Upgrades:

		ADD TO CHEATMANAGER (https://www.notion.so/C-mo-a-adir-un-Weapon-be997fefdede49858315a4e48e15a8ab)
			Added to cheat : KFCheatManager.uc
		
		ADD TO SKINS
		 Added to Skins :

		ADD TO DAILY EVENTS
		 Added to daily events : 

 */

var class<KFGFxWorld_MedicOptics> OpticsUIClass;
var KFGFxWorld_MedicOptics OpticsUI;
var byte StoredPrimaryAmmo;
var byte StoredSecondaryAmmo;
var vector SecondaryFireOffset;

simulated event Tick( FLOAT DeltaTime )
{
	if (Instigator != none && Instigator.weapon == self)
	{
		UpdateOpticsUI(true);
	}

	Super.Tick(DeltaTime);
}

/*********************************************************************************************
 @name Optics UI
********************************************************************************************* */

/** Get our optics movie from the inventory once our InvManager is created */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	local KFInventoryManager KFIM;
	super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	if (OpticsUI == none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			//Create the screen's UI piece
			OpticsUI = KFGFxWorld_MedicOptics(KFIM.GetOpticsUIMovie(OpticsUIClass));
		}
	}
}

function ItemRemovedFromInvManager()
{
	local KFInventoryManager KFIM;
	local KFWeap_AssaultRifle_HRGTeslauncher KFW;

	Super.ItemRemovedFromInvManager();

	if (OpticsUI != none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			// @todo future implementation will have optics in base weapon class
			foreach KFIM.InventoryActors(class'KFWeap_AssaultRifle_HRGTeslauncher', KFW)
			{
				if( KFW != self && KFW.OpticsUI.Class == OpticsUI.class)
				{
					// A different weapon is still using this optics class
					return;
				}
			}

			//Create the screen's UI piece
			KFIM.RemoveOpticsUIMovie(OpticsUI.class);

			OpticsUI.Close();
			OpticsUI = none;
		}
	}
}

/** Unpause our optics movie and reinitialize our ammo when we equip the weapon */
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	super.AttachWeaponTo(MeshCpnt, SocketName);

	if (OpticsUI != none)
	{
		OpticsUI.SetPause(false);
		UpdateOpticsUI(true);
		WarnInternal("AMMOCOST " $AmmoCost[ALTFIRE_FIREMODE]$ "");
		OpticsUI.SetShotPercentCost( AmmoCost[ALTFIRE_FIREMODE] );
	}
}

/** Pause the optics movie once we unequip the weapon so it's not playing in the background */
simulated function DetachWeapon()
{
	local Pawn OwnerPawn;
	super.DetachWeapon();

	OwnerPawn = Pawn(Owner);
	if( OwnerPawn != none && OwnerPawn.Weapon == self )
	{
		if (OpticsUI != none)
		{
			OpticsUI.SetPause();
		}
	}
}

/**
 * Update our displayed ammo count if it's changed
 */
simulated function UpdateOpticsUI(optional bool bForceUpdate)
{
	if (OpticsUI != none && OpticsUI.OpticsContainer != none)
	{
		if (AmmoCount[DEFAULT_FIREMODE] != StoredPrimaryAmmo || bForceUpdate)
		{
			StoredPrimaryAmmo = AmmoCount[DEFAULT_FIREMODE];
			OpticsUI.SetPrimaryAmmo(StoredPrimaryAmmo);
		}

		if (AmmoCount[ALTFIRE_FIREMODE] != StoredSecondaryAmmo || bForceUpdate)
		{
			StoredSecondaryAmmo = AmmoCount[ALTFIRE_FIREMODE];
			OpticsUI.SetHealerCharge(StoredSecondaryAmmo * 100);
		}

		if(OpticsUI.MinPercentPerShot != AmmoCost[ALTFIRE_FIREMODE])
		{
			OpticsUI.SetShotPercentCost( AmmoCost[ALTFIRE_FIREMODE] );
		}
	}
}

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Rifle;
}

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Flame;
}

simulated function bool CanLockOnTo(Actor TA)
{
	return false;
}

/*********************************************************************************************
 * State GrenadeFiring
 * Handles firing grenade launcher.
 *********************************************************************************************/

simulated state FiringSecondaryState 
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
     * Overridden to use a special offset for throwing grenades
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
		return bUsingSights ? SecondaryFireIronAnim : SecondaryFireAnim;
	}
}

defaultproperties
{
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
   SecondaryFireOffset=(X=20.000000,Y=4.500000,Z=-7.000000)
   PackageKey="HRG_Teslauncher"
   FirstPersonMeshName="WEP_1P_HRG_Teslauncher_MESH.WEP_1stP_HRG_Teslauncher_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_Teslauncher_ANIM.Wep_1stP_HRG_Teslauncher_Anim"
   PickupMeshName="WEP_3P_HRG_Teslauncher_MESH.Wep_3rdP_Medic_GrenadeLauncher_Pickup"
   AttachmentArchetypeName="WEP_HRG_Teslauncher_ARCH.Wep_HRG_Teslauncher_3P"
   MuzzleFlashTemplateName="WEP_HRG_Teslauncher_ARCH.Wep_HRG_Teslauncher_MuzzleFlash"
   InventorySize=7
   PenetrationPower(0)=5.000000
   PenetrationPower(1)=()
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_Teslauncher_TEX.UI_WeaponSelect_HRG_Teslauncher'
   SpareAmmoCapacity(0)=240
   SpareAmmoCapacity(1)=7
   InitialSpareMags(0)=2
   InitialSpareMags(1)=1
   bLoopingFireSnd(0)=False
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_HRG_Teslauncher.Play_WEP_HRG_Teslauncher_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_HRG_Teslauncher.Play_WEP_HRG_Teslauncher_Shoot_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_SecondaryFire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_SecondaryFire_1P_Single')
   WeaponFireSnd(2)=()
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_HRGTeslauncher:MeleeHelper_0'
   maxRecoilPitch=150
   minRecoilPitch=125
   maxRecoilYaw=125
   minRecoilYaw=-125
   RecoilRate=0.110000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(Stats=((Scale=1.125000),(Scale=1.125000),))
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_HRGTeslauncher'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Grenade_HRGTeslauncher'
   FireInterval(0)=0.120000
   FireInterval(1)=0.002500
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   InstantHitDamage(0)=68.000000
   InstantHitDamage(1)=50.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRGTeslauncher'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRGTeslauncherGrenadeImpact'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRGTeslauncher'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Teslauncher"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_HRGTeslauncher"
   ObjectArchetype=KFWeap_AssaultRifle_M16M203'kfgamecontent.Default__KFWeap_AssaultRifle_M16M203'
}
