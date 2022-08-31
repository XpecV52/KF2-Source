//=============================================================================
// KFWeap_Blunt_MedicBat
//=============================================================================
// A melee weapon that creates healing gas and can smack heals into teammates
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

// Extends MeleeBase with code from KFWeap_HealerBase (for healing dart ammo functionality)
class KFWeap_Blunt_MedicBat extends KFWeap_MeleeBase;

/** Explosion actor class to spawn */
var class<KFExplosionActor> ExplosionActorClass;
var() KFGameExplosion ExplosionTemplate;
var() KFGameExplosion LightAttackExplosionTemplate;

/** Whether Friendly Fire is enabled for the game */
var bool bFriendlyFireEnabled;

/** Amount to heal when hitting a teammate per firemode */
var array<float> AttackHealAmounts;
/** Ammo dart cost for healing a teammate per firemode */
var array<byte> AttackHealCosts;

/** How many points of heal ammo to recharge per second */
var(Healing) float      HealFullRechargeSeconds;

/** Keeps track of incremental healing since we have to heal in whole integers */
var          float      HealingIncrement;

/** How many points of heal ammo to recharge per second. Calculated from the HealFullRechargeSeconds */
var          float      HealRechargePerSecond;

/** Current amount of healing darts available */
var repnotify byte HealingDartAmmo;

/** The actor the alt attack explosion should attach to */
var transient Actor BlastAttachee;

/** The hit location of the blast */
var vector BlastHitLocation;

/** Spawn location offset to improve cone hit detection */
var transient float BlastSpawnOffset;

/** Starting Damage radius of the alt attack explosion*/
var float StartingDamageRadius;

/** Animations that play in reaction to hitting with the alt fire attack*/
const HardFire_L = 'HardFire_L';
const HardFire_R = 'HardFire_R';
const HardFire_F = 'HardFire_F';
const HardFire_B = 'HardFire_B';

/** Damage type that is used when hitting a teammate with an attack */
var class<DamageType> HealingDamageType;

/*********************************************************************************************
 @name Optics UI
********************************************************************************************* */

var class<KFGFxWorld_MedicOptics> OpticsUIClass;
var KFGFxWorld_MedicOptics OpticsUI;

/** The last updated value for our ammo - Used to know when to update our optics ammo */
var byte StoredPrimaryAmmo;
var byte StoredSecondaryAmmo;

replication
{
	if (bNetInitial)
		bFriendlyFireEnabled;

	if (bNetDirty && Role == ROLE_Authority && bAllowClientAmmoTracking)
		HealingDartAmmo;
}


/* epic ===============================================
* ::ReplicatedEvent
*
* Called when a variable with the property flag "RepNotify" is replicated
*
* =====================================================
*/
simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(HealingDartAmmo))
	{
		AmmoCount[ALTFIRE_FIREMODE] = HealingDartAmmo;
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/**
  * HealAmmo Regen client and server
  */
simulated event Tick(FLOAT DeltaTime)
{
	// If we're not fully charged tick the HealAmmoRegen system
	if (AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE])
	{
		HealAmmoRegeneration(DeltaTime);
	}

	if (Instigator != none && Instigator.weapon == self)
	{
		UpdateOpticsUI();
	}

	Super.Tick(DeltaTime);
}

simulated function ConsumeAmmoDarts(int AmmoDartCost)
{
	// Handles the consumption of ammo darts for the default attack
	// If AmmoCount is being replicated, don't allow the client to modify it here
	if (Role == ROLE_Authority || bAllowClientAmmoTracking)
	{
		// Don't consume ammo if magazine size is 0 (infinite ammo with no reload)
		if (MagazineCapacity[1] > 0 && AmmoCount[1] > 0)
		{
			// Reduce ammo amount by heal ammo cost
			AmmoCount[1] = Max(AmmoCount[1] - AmmoDartCost, 0);
		}
	}
}

/** @see KFWeapon::ConsumeAmmo */
simulated function ConsumeAmmo(byte FireModeNum)
{
	// If its not the healing fire mode (the heavy attack ammo consumption), use the super's consume
	if (FireModeNum != DEFAULT_FIREMODE)
	{
		Super.ConsumeAmmo(FireModeNum);
		return;
	}

	ConsumeAmmoDarts(AmmoCost[DEFAULT_FIREMODE]);
}

/** Overridden to call StartHealRecharge on server */
function GivenTo(Pawn thisPawn, optional bool bDoNotActivate)
{
	super.GivenTo(thisPawn, bDoNotActivate);

	// StartHealRecharge gets called on the client from ClientWeaponSet (called from ClientGivenTo, called from GivenTo),
	// but we also need this called on the server for remote clients, since the server needs to track the ammo too (to know if/when to spawn projectiles)
	if (Role == ROLE_Authority && !thisPawn.IsLocallyControlled())
	{
		StartHealRecharge();
	}
}

/** Start the heal recharge cycle */
function StartHealRecharge()
{
	local KFPerk InstigatorPerk;
	local float UsedHealRechargeTime;

	// begin ammo recharge on server
	if (Role == ROLE_Authority)
	{
		InstigatorPerk = GetPerk();
		UsedHealRechargeTime = HealFullRechargeSeconds * static.GetUpgradeHealRechargeMod(CurrentWeaponUpgradeIndex);

		InstigatorPerk.ModifyHealerRechargeTime(UsedHealRechargeTime);
		// Set the healing recharge rate whenever we start charging
		HealRechargePerSecond = MagazineCapacity[ALTFIRE_FIREMODE] / UsedHealRechargeTime;
		HealingIncrement = 0;
	}
}

/** Heal Ammo Regen */
function HealAmmoRegeneration(float DeltaTime)
{
	if (Role == ROLE_Authority)
	{
		HealingIncrement += HealRechargePerSecond * DeltaTime;

		if (HealingIncrement >= 1.0 && AmmoCount[ALTFIRE_FIREMODE] < MagazineCapacity[ALTFIRE_FIREMODE])
		{
			AmmoCount[ALTFIRE_FIREMODE]++;
			HealingIncrement -= 1.0;

			// Heal ammo regen is only tracked on the server, so even though we told the client he could
			// keep track of ammo himself like a big boy, we still have to spoon-feed it to him.
			if (bAllowClientAmmoTracking)
			{
				HealingDartAmmo = AmmoCount[ALTFIRE_FIREMODE];
			}
		}
	}
}

simulated event bool HasAmmo(byte FireModeNum, optional int Amount)
{
	// Default fire mode either has ammo to trigger the heal or needs to return true to still allow a basic swing
	if (FireModeNum == DEFAULT_FIREMODE)
	{
		return true;
	}

	return super.HasAmmo(FireModeNum, Amount);
}

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

	// Initialize our displayed ammo count and healer charge
	StartHealRecharge();
}

function ItemRemovedFromInvManager()
{
	local KFInventoryManager KFIM;
	local KFWeap_Blunt_MedicBat KFW;

	Super.ItemRemovedFromInvManager();

	if (OpticsUI != none)
	{
		KFIM = KFInventoryManager(InvManager);
		if (KFIM != none)
		{
			foreach KFIM.InventoryActors(class'KFWeap_Blunt_MedicBat', KFW)
			{
				if (KFW != self && KFW.OpticsUI.Class == OpticsUI.class)
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
		OpticsUI.SetShotPercentCost(AmmoCost[ALTFIRE_FIREMODE]);
	}
}

/** Pause the optics movie once we unequip the weapon so it's not playing in the background */
simulated function DetachWeapon()
{
	local Pawn OwnerPawn;
	super.DetachWeapon();

	OwnerPawn = Pawn(Owner);
	if (OwnerPawn != none && OwnerPawn.Weapon == self)
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
			OpticsUI.SetHealerCharge(StoredSecondaryAmmo);
		}

		if (OpticsUI.MinPercentPerShot != AmmoCost[ALTFIRE_FIREMODE])
		{
			OpticsUI.SetShotPercentCost(1);
		}
	}
}

/** Healing charge doesn't count as ammo for purposes of inventory management (e.g. switching) */
simulated function bool HasAnyAmmo()
{
	// Special ammo is stored in the default firemode (heal darts are separate)
	if (HasSpareAmmo() || AmmoCount[DEFAULT_FIREMODE] >= AmmoCost[CUSTOM_FIREMODE])
	{
		return true;
	}

	return false;
}

/** Determines the secondary ammo left for HUD display */
simulated function int GetSecondaryAmmoForHUD()
{
	return AmmoCount[1];
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	/** Initially check whether friendly fire is on or not. */
	if (Role == ROLE_Authority && KFGameInfo(WorldInfo.Game).FriendlyFireScale != 0.f)
	{
		bFriendlyFireEnabled = true;
	}

	if (ExplosionTemplate != none)
	{
		StartingDamageRadius = ExplosionTemplate.DamageRadius;
	}
}

/** should be able to interrupt its reload state with any melee attack */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	return FireModeNum != RELOAD_FIREMODE;
}

/** Override to allow for two different states associated with RELOAD_FIREMODE */
simulated function SendToFiringState(byte FireModeNum)
{
	// Ammo needs to be synchronized on client/server for this to work!
	if (FireModeNum == RELOAD_FIREMODE && !Super(KFWeapon).CanReload())
	{
		SetCurrentFireMode(FireModeNum);
		GotoState('WeaponUpkeep');
		return;
	}

	Super.SendToFiringState(FireModeNum);
}

/** Always allow reload and choose the correct state in SendToFiringState() */
simulated function bool CanReload(optional byte FireModeNum)
{
	return true;
}

/** Skip calling StillFiring/PendingFire to fix log warning */
simulated function bool ShouldRefire()
{
	if (CurrentFireMode == CUSTOM_FIREMODE)
		return false;

	return Super.ShouldRefire();
}

simulated protected function PrepareExplosion()
{
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;

	ExplosionTemplate = default.ExplosionTemplate;
	ExplosionTemplate.DamageRadius = StartingDamageRadius;

	// Change the radius and damage based on the perk
	if (Owner.Role == ROLE_Authority)
	{
		KFPC = KFPlayerController(Instigator.Controller);
		if (KFPC != none)
		{
			InstigatorPerk = KFPC.GetPerk();
			ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAoERadiusModifier();
		}
	}

	ExplosionActorClass = default.ExplosionActorClass;
}

/** Get the hard fire anim when the alt fire attack connects */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	// Adjust cone fire angle based on swing direction
	switch (MeleeAttackHelper.CurrentAttackDir)
	{
	case DIR_Forward:
	case DIR_ForwardLeft:
	case DIR_ForwardRight:
		return HardFire_F;
	case DIR_Backward:
	case DIR_BackwardLeft:
	case DIR_BackwardRight:
		return HardFire_B;
	case DIR_Left:
		return HardFire_L;
	case DIR_Right:
		return HardFire_R;
	}
	return '';
}

simulated function SpawnExplosionFromTemplate(KFGameExplosion Template)
{
	local KFExplosionActor ExploActor;
	local vector SpawnLoc;
	local rotator SpawnRot;

	SpawnLoc = BlastHitLocation;
	SpawnRot = GetAdjustedAim(SpawnLoc);

	// explode using the given template
	ExploActor = Spawn(ExplosionActorClass, self, , SpawnLoc, SpawnRot, , true);
	if (ExploActor != None)
	{
		ExploActor.InstigatorController = Instigator.Controller;
		ExploActor.Instigator = Instigator;
		ExplosionTemplate.bFullDamageToAttachee = true;

		KFExplosionActorReplicated(ExploActor).bIgnoreInstigator = false;
		ExploActor.bReplicateInstigator = true;

		ExploActor.Explode(Template, vector(SpawnRot));
	}
}

simulated function CustomFire()
{
	if (Instigator.Role < ROLE_Authority)
	{
		return;
	}

	PrepareExplosion();
	SpawnExplosionFromTemplate(ExplosionTemplate);

	// tell remote clients that we fired, to trigger effects in third person
	IncrementFlashCount();
}

simulated function HealTeammateWithAttack(Actor HitActor, vector HitLocation, float HealingAmount, byte HealCost)
{
	local KFPawn Victim;

	if (Role == ROLE_Authority)
	{
		if (Instigator != None)
		{
			// only detonate when it hits a pawn so that level geometry doesn't get in the way
			if (HitActor.bWorldGeometry)
			{
				return;
			}

			Victim = KFPawn(HitActor);

			// If the victim is a teammate and the player has default ammo (healing darts) then heal this teammate
			//	also make sure the victim is still alive and is actually missing health
			if (Victim != None && (Victim.GetTeamNum() == Instigator.GetTeamNum()) && Victim.Health > 0 && Victim.Health < Victim.HealthMax)
			{
				if (AmmoCount[1] >= HealCost)
				{
					ConsumeAmmoDarts(HealCost);
					Victim.HealDamage(HealingAmount, Instigator.Controller, HealingDamageType);

					if (Instigator.Role >= ROLE_Authority)
					{
						BlastHitLocation = HitLocation;
						SpawnExplosionFromTemplate(LightAttackExplosionTemplate);
					}
				}
			}
		}
	}
}

// BASH
simulated state MeleeAttackBasic
{
	/** Network: Local Player */
	simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
	{
		HealTeammateWithAttack(HitActor, HitLocation, AttackHealAmounts[BASH_FIREMODE], AttackHealCosts[BASH_FIREMODE]);
	}
}

// LIGHT ATTACK
simulated state MeleeChainAttacking
{
	/** Network: Local Player */
	simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
	{
		HealTeammateWithAttack(HitActor, HitLocation, AttackHealAmounts[DEFAULT_FIREMODE], AttackHealCosts[DEFAULT_FIREMODE]);
	}
}

// HEAVY ATTACK
simulated state MeleeHeavyAttacking
{
	/** Network: Local Player */
	simulated function NotifyMeleeCollision(Actor HitActor, optional vector HitLocation)
	{
		local KFPawn Victim;

		if (Instigator != None)
		{
			// only detonate when it hits a pawn so that level geometry doesn't get in the way
			if (HitActor.bWorldGeometry)
			{
				return;
			}

			Victim = KFPawn(HitActor);
			if (Victim == None ||
				(Victim.bPlayedDeath && (WorldInfo.TimeSeconds - Victim.TimeOfDeath) > 0.f) )
			{
				return;
			}

			if (AmmoCount[0] >= AmmoCost[CUSTOM_FIREMODE] && !IsTimerActive(nameof(BeginMedicBatExplosion)))
			{
				BlastAttachee = HitActor;
				BlastHitLocation = HitLocation;

				// need to delay one frame, since this is called from AnimNotify
				SetTimer(0.001f, false, nameof(BeginMedicBatExplosion));

				if (Role < ROLE_Authority && Instigator.IsLocallyControlled())
				{
					if (!HitActor.bTearOff || Victim == none)
					{
						ServerBeginMedicBatExplosion(HitActor, HitLocation);
					}
				}
			}
			else
			{
				HealTeammateWithAttack(HitActor, HitLocation, AttackHealAmounts[HEAVY_ATK_FIREMODE], AttackHealCosts[HEAVY_ATK_FIREMODE]);
			}
		}
	}
}

/** Called on the server */
reliable server private function ServerBeginMedicBatExplosion(Actor HitActor, optional vector HitLocation)
{
	// Ignore if too far away (something went wrong!)
	if (VSizeSq2D(HitLocation - Instigator.Location) > Square(500))
	{
		return;
	}

	BlastHitLocation = HitLocation;
	BlastAttachee = HitActor;
	SendToFiringState(CUSTOM_FIREMODE);
}

/** Called when altfire melee attack hits a target and there is ammo left */
simulated function BeginMedicBatExplosion()
{
	SendToFiringState(CUSTOM_FIREMODE);
}

defaultproperties
{
   ExplosionActorClass=Class'KFGame.KFExplosionActorReplicated'
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFWeap_Blunt_MedicBat:HeavyAttackHealingExplosion'
   LightAttackExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFWeap_Blunt_MedicBat:LightAttackExplosion'
   AttackHealAmounts(0)=30.000000
   AttackHealAmounts(1)=0.000000
   AttackHealAmounts(2)=0.000000
   AttackHealAmounts(3)=30.000000
   AttackHealAmounts(4)=0.000000
   AttackHealAmounts(5)=40.000000
   AttackHealCosts(0)=30
   AttackHealCosts(1)=0
   AttackHealCosts(2)=0
   AttackHealCosts(3)=30
   AttackHealCosts(4)=0
   AttackHealCosts(5)=30
   HealFullRechargeSeconds=12.000000
   HealingDartAmmo=100
   HealingDamageType=Class'KFGame.KFDT_Healing'
   OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
   ParryStrength=5
   BlockDamageMitigation=0.600000
   ParryDamageMitigationPercent=0.500000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   PackageKey="Medic_Bat"
   FirstPersonMeshName="WEP_1P_Medic_Bat_MESH.Wep_1stP_Medic_Bat_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Medic_Bat_ANIM.WEP_1stP_Medic_Bat_ANIM"
   PickupMeshName="WEP_3P_Medic_Bat_MESH.Wep_3rdP_Medic_Bat_Pickup"
   AttachmentArchetypeName="WEP_Medic_Bat_ARCH.Wep_Medic_Bat_3P"
   bCanRefillSecondaryAmmo=False
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(6)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
   InventorySize=4
   MagazineCapacity(0)=3
   MagazineCapacity(1)=100
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Medic_Bat_TEX.UI_WeaponSelect_MedicBat'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   AmmoCost(0)=40
   AmmoCost(1)=()
   AmmoCost(2)=()
   AmmoCost(3)=()
   AmmoCost(4)=()
   AmmoCost(5)=()
   AmmoCost(6)=1
   SpareAmmoCapacity(0)=12
   InitialSpareMags(0)=1
   PlayerViewOffset=(X=3.000000,Y=1.000000,Z=-3.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      ChainSequence_B(0)=DIR_BackwardLeft
      ChainSequence_B(1)=DIR_Left
      ChainSequence_B(2)=DIR_Right
      ChainSequence_B(3)=()
      ChainSequence_B(4)=()
      ChainSequence_B(5)=()
      ChainSequence_B(6)=()
      ChainSequence_L(1)=DIR_BackwardRight
      ChainSequence_L(2)=()
      ChainSequence_L(3)=()
      ChainSequence_L(4)=()
      ChainSequence_L(5)=()
      ChainSequence_R(1)=DIR_BackwardLeft
      ChainSequence_R(2)=()
      ChainSequence_R(3)=()
      ChainSequence_R(4)=()
      ChainSequence_R(5)=()
      MeleeImpactCamShakeScale=0.035000
      MaxHitRange=250.000000
      HitboxChain(0)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=250.000000))
      HitboxChain(1)=(BoneOffset=(X=3.000000,Y=0.000000,Z=230.000000))
      HitboxChain(2)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=210.000000))
      HitboxChain(3)=(BoneOffset=(X=3.000000,Y=0.000000,Z=190.000000))
      HitboxChain(4)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=170.000000))
      HitboxChain(5)=(BoneOffset=(X=3.000000,Y=0.000000,Z=150.000000))
      HitboxChain(6)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=130.000000))
      HitboxChain(7)=(BoneOffset=(X=3.000000,Y=0.000000,Z=110.000000))
      HitboxChain(8)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=90.000000))
      HitboxChain(9)=(BoneOffset=(X=3.000000,Y=0.000000,Z=70.000000))
      HitboxChain(10)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=50.000000))
      HitboxChain(11)=(BoneOffset=(X=3.000000,Y=0.000000,Z=30.000000))
      HitboxChain(12)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Blunt_MedicBat:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_FieldMedic'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.100000),(Stat=EWUS_Damage1,Scale=1.100000),(Stat=EWUS_Damage2,Scale=1.100000),(Stat=EWUS_HealFullRecharge,Scale=0.800000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000),(Stat=EWUS_Damage2,Scale=1.200000),(Stat=EWUS_HealFullRecharge,Scale=0.600000),(Add=2)))
   FiringStatesArray(2)="Reloading"
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   FiringStatesArray(5)=()
   FiringStatesArray(6)="WeaponSingleFiring"
   WeaponFireTypes(6)=EWFT_Custom
   FireInterval(5)=0.000000
   FireInterval(6)=1.000000
   InstantHitDamage(0)=80.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=40.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=130.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Bludgeon_MedicBatLight'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_MedicBatBash'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Bludgeon_MedicBatHeavy'
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
   ItemName="Hemoclobber"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Blunt_MedicBat"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
