//=============================================================================
// KFCarryableObject_Collectible
//=============================================================================
// A carried object that forces the player to equip it and prevents the player
// from switching to a different inventory item, though it can be dropped.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFCarryableObject_Collectible extends KFCarryableObject
	abstract;

var KFObjectiveCollectActor ParentCollectActor;
var bool bNeedsTossCheck;

var float StartingOverrideGroundSpeed;
var float StartingOverrideSprintSpeed;

simulated state WeaponPuttingDown
{
	simulated function BeginState(name PreviousStateName)
	{
		bNeedsTossCheck = true;
		super.BeginState(PreviousStateName);
	}
}

simulated state WeaponDownSimple
{
	simulated function BeginState(name PreviousStateName)
	{
		bNeedsTossCheck = true;
		super.BeginState(PreviousStateName);
	}
}

simulated state WeaponAbortEquip
{
	simulated function BeginState(name PreviousStateName)
	{
		bNeedsTossCheck = true;
		super.BeginState(PreviousStateName);
	}
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	UpdateSpeedOverride();
}

// when the weapon was pending equip and then overriden by another pending equip
simulated function NotifyRemovedPending()
{
	bNeedsTossCheck = true;
}

simulated event Tick(float DeltaTime)
{
	if (bNeedsTossCheck && Instigator.Weapon != none && Instigator.Weapon != self)
	{
		TossIfInactive();
		bNeedsTossCheck = false;
	}
	super.Tick(DeltaTime);
}

simulated function UpdateSpeedOverride()
{
	local KFPawn_Human KFPH;

	KFPH = KFPawn_Human(Instigator);
	if (KFPH != none)
	{
		if (KFGameReplicationInfo(WorldInfo.GRI).GetNumPlayersAlive() <= 1)
		{
			OverrideGroundSpeed = -1;
			OverrideSprintSpeed = -1;
		}
		else
		{
			OverrideGroundSpeed = StartingOverrideGroundSpeed;
			OverrideSprintSpeed = StartingOverrideSprintSpeed;
		}

		KFPH.UpdateGroundSpeed();
	}
}

simulated function TossIfInactive()
{
	local KFWeap_HealerBase QuickHealWeapon;

	if (Role == ROLE_Authority)
	{
		// unless the player is just temporarily quick healing
		QuickHealWeapon = KFWeap_HealerBase(Instigator.Weapon);
		if (QuickHealWeapon == none || (!QuickHealWeapon.IsInState('WeaponQuickHeal') && !QuickHealWeapon.IsInState('Inactive')))
		{
			Instigator.TossInventory(self);
		}
	}
}

simulated function UpdateReplicationInfo(bool bCarried)
{
	local KFPawn_Human KFPH;
	local KFPlayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;

	KFPH = KFPawn_Human(Owner);
	KFPC = KFPlayerController(KFPH.Controller);
	KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
	KFPRI.bCarryingCollectible = bCarried;
}

simulated function NotifyPickedUp()
{
	UpdateReplicationInfo(true);

	if (ParentCollectActor != none)
	{
		ParentCollectActor.SetCollectibleState(ECollectibleState_Carried);
	}

	UpdateSpeedOverride();

	super.NotifyPickedUp();
}

function DropFrom(vector StartLocation, vector StartVelocity)
{
	UpdateReplicationInfo(false);

	if (ParentCollectActor != none)
	{
		ParentCollectActor.OnCarryableDropped();
	}
	
	Super.DropFrom(StartLocation, StartVelocity);
}

function SetupDroppedPickup(out DroppedPickup P, vector StartVelocity)
{
	local KFDroppedPickup_Carryable pickup;

	pickup = KFDroppedPickup_Carryable(P);
	if (pickup != none)
	{
		pickup.ParentCollectActor = ParentCollectActor;
	}

	super.SetupDroppedPickup(P, StartVelocity);
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	local KFCarryableObject_Collectible PickedUpCollectible;

	PickedUpCollectible = KFCarryableObject_Collectible(PickedUpWeapon);
	if (PickedUpCollectible != none)
	{
		ParentCollectActor = PickedUpCollectible.ParentCollectActor;
	}

	super.SetOriginalValuesFromPickup(PickedUpWeapon);
}

defaultproperties
{

	FireModeIconPaths(DEFAULT_FIREMODE) = Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
	FiringStatesArray(DEFAULT_FIREMODE) = MeleeAttackBasic
	WeaponFireTypes(DEFAULT_FIREMODE) = EWFT_Custom
	InstantHitMomentum(DEFAULT_FIREMODE) = 30000.f
	InstantHitDamage(DEFAULT_FIREMODE) = 150.0
	InstantHitDamageTypes(DEFAULT_FIREMODE) = class'KFDT_Bludgeon_Carryable'
	AmmoCost(DEFAULT_FIREMODE) = 0

	FiringStatesArray(BASH_FIREMODE) = MeleeAttackBasic
	WeaponFireTypes(BASH_FIREMODE) = EWFT_Custom
	InstantHitMomentum(BASH_FIREMODE) = 30000.f
	InstantHitDamage(BASH_FIREMODE) = 150.0
	InstantHitDamageTypes(BASH_FIREMODE) = class'KFDT_Bludgeon_Carryable'
	AmmoCost(BASH_FIREMODE) = 0

	FiringStatesArray(HEAVY_ATK_FIREMODE) = MeleeAttackBasic
	WeaponFireTypes(HEAVY_ATK_FIREMODE) = EWFT_Custom
	InstantHitMomentum(HEAVY_ATK_FIREMODE) = 30000.f
	InstantHitDamage(HEAVY_ATK_FIREMODE) = 150.0
	InstantHitDamageTypes(HEAVY_ATK_FIREMODE) = class'KFDT_Bludgeon_Carryable'
	AmmoCost(HEAVY_ATK_FIREMODE) = 0

	DroppedPickupClass=class'KFDroppedPickup_Carryable'
	InventoryGroup=IG_Equipment
	GroupPriority=100

	StartingOverrideGroundSpeed=203.f; //192
	StartingOverrideSprintSpeed=280.f; //230
}